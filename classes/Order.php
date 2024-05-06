<?php

namespace PerfectFood\Classes;

use PDO;
use PDOException;

class Order {
	private DB $db;

	public function __construct() {
		$this->db = new DB();
	}

	/**
	 * Places an order with the user's details and cart items.
	 *
	 * @param   int    $userId    The ID of the user placing the order.
	 * @param   array  $postData  The data containing order information.
	 *
	 * @return bool Returns true if order was placed successfully, false otherwise.
	 */
	public function placeOrder( $userId, $postData ) {
		try {
			// Start a transaction
			$this->db->connection->beginTransaction();

			// Retrieve user details from the $postData array
			$userData = [
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
			$query     = "INSERT INTO orders (user_id, first_name, last_name, email, city, street, house_number, phone_1, phone_2, phone_3) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			$statement = $this->db->connection->prepare( $query );
			$statement->execute( [
				$userId,
				$userData['first_name'],
				$userData['last_name'],
				$userData['email'],
				$userData['city'],
				$userData['street'],
				$userData['house_number'],
				$userData['phone_1'],
				$userData['phone_2'],
				$userData['phone_3'],
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

	/**
	 * Retrieves orders based on the user's role.
	 *
	 * @param   bool  $showAll  Flag to indicate whether to retrieve all orders or limit the results.
	 *
	 * @return array|bool Returns an array of orders if successful, false on failure.
	 */
	public function retrieveOrdersBasedOnUserRole( bool $showAll = false)
	{
		try {
			$isAdmin = ($_SESSION["role"] === 'admin');

			// Base query to retrieve orders information
			$query = "
	            SELECT 
	                orders.*,
	                users.email,
	                COUNT(order_items.item_id) AS item_count, 
	                SUM(order_items.quantity * menu_items.price) AS total_sum
	            FROM 
	                orders
	            LEFT JOIN 
	                order_items ON orders.id = order_items.order_id
	            LEFT JOIN 
	                menu_items ON order_items.item_id = menu_items.id
	            LEFT JOIN 
	                users ON orders.user_id = users.id
	        ";

			if (!$isAdmin) {
				$query .= " WHERE orders.user_id = ?";
			}

			$query .= " GROUP BY orders.id ORDER BY orders.id DESC";

			if (!$showAll) {
				$query .= " LIMIT 5";
			}

			$statement = $this->db->connection->prepare($query);

			if (!$isAdmin) {
				// Bind user ID parameter for non-admin users
				$statement->execute([$_SESSION['user_id']]);
			} else {
				$statement->execute();
			}

			return $statement->fetchAll(PDO::FETCH_ASSOC);
		} catch (PDOException $e) {
			$_SESSION['errors'][] = "Error fetching orders: " . $e->getMessage();
			return false;
		}
	}

	/**
	 * Deletes a specific order by order ID.
	 *
	 * @param   int  $orderId  The ID of the order to be deleted.
	 *
	 * @return void
	 */
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

	/**
	 * Calculates total prices of completed orders for a specific user.
	 *
	 * @param   int  $userId  The ID of the user whose total prices are to be calculated.
	 *
	 * @return float Returns the total price of completed orders.
	 */
	public function calculateTotalPricesByUserId( $userId ) {
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
                    orders.user_id = ?
                  AND
                    orders.status = 'completed'";

			// Prepare and execute the statement
			$statement = $this->db->connection->prepare( $query );
			$statement->execute( [ $userId ] );

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

	/**
	 * Retrieves counts of orders by their status.
	 * @return array Returns an associative array with status as keys and counts as values.
	 */
	public function retrieveOrderStatusCounts() {
		try {
			$query = "SELECT status, COUNT(*) AS count FROM orders";
			if ( $_SESSION["role"] !== 'admin' ) {
				$query .= " WHERE user_id = :user_id";
			}
			$query .= " GROUP BY status";

			$statement = $this->db->connection->prepare( $query );
			if ( $_SESSION["role"] !== 'admin' ) {
				$statement->bindParam( ':user_id', $_SESSION['user_id'], PDO::PARAM_INT );
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

	/**
	 * Modifies the status of an order.
	 *
	 * @param   int     $orderId  The ID of the order whose status is to be updated.
	 * @param   string  $status   The new status to be set for the order.
	 *
	 * @return bool Returns true if the update was successful, false otherwise.
	 */
	public function modifyOrderStatus( $orderId, $status ) {
		try {
			// Prepare the SQL statement to update the order
			$stmt = $this->db->connection->prepare( "UPDATE orders SET status = :status WHERE id = :id" );

			// Bind parameters
			$stmt->bindParam( ':status', $status );
			$stmt->bindParam( ':id', $orderId );

			// Execute the statement
			$stmt->execute();

			// Check if any rows were affected
			return $stmt->rowCount() > 0;
		} catch ( PDOException $e ) {
			return false;
		}
	}

	public function retrieveOrdersByUserId( $userId ) {
		try {
			// Base query to retrieve orders information
			$query = "
	            SELECT 
	                orders.*,
	                users.email,
	                COUNT(order_items.item_id) AS item_count, 
	                SUM(order_items.quantity * menu_items.price) AS total_sum
	            FROM 
	                orders
	            LEFT JOIN 
	                order_items ON orders.id = order_items.order_id
	            LEFT JOIN 
	                menu_items ON order_items.item_id = menu_items.id
	            LEFT JOIN 
	                users ON orders.user_id = users.id
             	WHERE orders.user_id = ?
				GROUP BY orders.id ORDER BY orders.id DESC
	        ";

			$statement = $this->db->connection->prepare($query);

			// Bind user ID parameter
			$statement->execute([$userId]);

			return $statement->fetchAll(PDO::FETCH_ASSOC);
		} catch (PDOException $e) {
			$_SESSION['errors'][] = "Error fetching orders: " . $e->getMessage();
			return false;
		}
	}

}