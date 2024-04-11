<?php

namespace PerfectFood\Classes;

use PDO;
use PDOException;

class Order {
	private DB $db;

	public function __construct() {
		$this->db = new DB();
	}

	public function placeOrder( $customerId, $postData ) {
		try {
			// Start a transaction
			$this->db->connection->beginTransaction();

			// Retrieve customer details from the $postData array
			$customerData = [
				'first_name'   => $postData['first_name'],
				'last_name'    => $postData['last_name'],
				'email'        => $postData['email'],
				'city'         => $postData['city'],
				'street'       => $postData['street'],
				'house_number' => $postData['house_number'],
				'phone_1'      => $postData['phones'][0] ?? '',
				'phone_2'      => $postData['phones'][1] ?? '',
				'phone_3'      => $postData['phones'][2] ?? '',
			];

			// Insert order details into the database
			$query     = "INSERT INTO orders (customer_id, first_name, last_name, email, city, street, house_number, phone_1, phone_2, phone_3) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			$statement = $this->db->connection->prepare( $query );
			$statement->execute( [
				$customerId,
				$customerData['first_name'],
				$customerData['last_name'],
				$customerData['email'],
				$customerData['city'],
				$customerData['street'],
				$customerData['house_number'],
				$customerData['phone_1'],
				$customerData['phone_2'],
				$customerData['phone_3'],
			] );

			// Retrieve the order ID of the newly inserted order
			$orderId = $this->db->connection->lastInsertId();

			// Insert order items into the database
			// Loop through the $cart array and insert each item into the order_items table
			$cart      = $_SESSION['cart'];
			$query     = "INSERT INTO order_items (order_id, item_id, quantity) VALUES (?, ?, ?)";
			$statement = $this->db->connection->prepare( $query );
			foreach ( $cart as $itemId => $quantity ) {
				$statement->execute( [ $orderId, $itemId, $quantity ] );
			}

			// Commit the transaction
			$this->db->connection->commit();

			// Clear the cart session after placing the order
			unset( $_SESSION['cart'] );

			// After successfully placing the order, set a success message and redirect to the index page
			$_SESSION['info'][] = "Order successfully placed.";
			header( "Location: index.php" );
			exit();
		} catch ( PDOException $e ) {
			// Rollback the transaction if an error occurs
			$this->db->connection->rollBack();
			// Log or handle the error
			$_SESSION['errors'][] = "Error placing order: " . $e->getMessage();

			return false; // Order placement failed
		}
	}

	public function getOrdersByCustomerId( $customerId ) {
		try {
			// Prepare the SQL statement to retrieve orders by customer ID
			$query     = "
                SELECT 
                    orders.*, 
                    COUNT(order_items.item_id) AS item_count, 
                    SUM(order_items.quantity * menu_items.price) AS total_sum
                FROM 
                    orders
                LEFT JOIN 
                    order_items ON orders.id = order_items.order_id
                LEFT JOIN 
                    menu_items ON order_items.item_id = menu_items.id
                WHERE 
                    orders.customer_id = ?
                GROUP BY 
                    orders.id
            ";
			$statement = $this->db->connection->prepare( $query );
			$statement->execute( [ $customerId ] );
			$orders = $statement->fetchAll( PDO::FETCH_ASSOC );

			return $orders;
		} catch ( PDOException $e ) {
			// Handle the error (You might want to log or display an error message)
			return [];
		}
	}

	public function deleteOrder( $orderId ) {
		try {
			$query     = "DELETE FROM orders WHERE id = ?";
			$statement = $this->db->connection->prepare( $query );
			$statement->execute( [ $orderId ] );

			$_SESSION['info'][] = "Order deleted successfully.";
		} catch ( PDOException $e ) {
			$_SESSION['errors'][] = "Failed to delete the order.";
		}
	}

	public function getTotalPricesByCustomerId( $customerId ) {
		try {
			// Prepare the SQL query
			$query = "SELECT
                    SUM(order_items.quantity * menu_items.price) AS total_price
                  FROM
                    orders
                  JOIN
                    order_items ON orders.id = order_items.order_id
                  JOIN
                    menu_items ON order_items.item_id = menu_items.id
                  WHERE
                    orders.customer_id = ?
                  AND
                    orders.status = 'completed'";

			// Prepare and execute the statement
			$statement = $this->db->connection->prepare( $query );
			$statement->execute( [ $customerId ] );

			// Fetch the total price
			$result = $statement->fetch( PDO::FETCH_ASSOC );

			// Return the total price
			return $result['total_price'] ?? 0; // If no result is found, return 0
		} catch ( PDOException $e ) {
			// Handle database errors
			$_SESSION['errors'][] = "Error retrieving total prices: " . $e->getMessage();

			return 0; // Return 0 in case of an error
		}
	}

	public function getOrderStatusCounts( $customerId = null ) {
		try {
			$query = "SELECT status, COUNT(*) AS count FROM orders";
			if ( $customerId !== null ) {
				$query .= " WHERE customer_id = :customer_id";
			}
			$query .= " GROUP BY status";

			$statement = $this->db->connection->prepare( $query );
			if ( $customerId !== null ) {
				$statement->bindParam( ':customer_id', $customerId, PDO::PARAM_INT );
			}
			$statement->execute();

			$statusCounts = [];
			foreach ( $statement->fetchAll( PDO::FETCH_ASSOC ) as $row ) {
				$statusCounts[ $row['status'] ] = $row['count'];
			}

			return $statusCounts;
		} catch ( PDOException $e ) {
			return [];
		}
	}

}