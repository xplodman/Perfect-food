<?php

namespace PerfectFood\Classes;

use PDO;
use PDOException;

class MenuItem {
	private DB $db;

	public function __construct() {
		$this->db = new DB();
	}

	/**
	 * Retrieves a list of menu items by menu ID.
	 *
	 * @param   int  $menuId  The ID of the menu.
	 *
	 * @return array Returns an array of menu items associated with the menu ID.
	 */
	public function retrieveMenuItemsByMenuId( $menuId ) {
		$query     = "SELECT * FROM menu_items WHERE menu_id = :menu_id";
		$statement = $this->db->connection->prepare( $query );
		$statement->bindParam( ':menu_id', $menuId );
		$statement->execute();

		return $statement->fetchAll( PDO::FETCH_ASSOC );
	}

	/**
	 * Retrieves a specified number of random menu items.
	 *
	 * @param   int  $limit  The number of items to retrieve.
	 *
	 * @return array Returns an array of random menu items up to the specified limit.
	 */
	public function retrieveRandomMenuItemsWithLimit( $limit ) {
		$query = "SELECT * FROM menu_items ORDER BY RAND() LIMIT $limit";

		return $this->db->connection->query( $query )->fetchAll( PDO::FETCH_ASSOC );
	}

	/**
	 * Retrieves all menu items sorted by ID.
	 * @return array Returns all menu items ordered by their IDs.
	 */
	public function retrieveAllMenuItems() {
		$query = "SELECT * FROM menu_items order by id";

		return $this->db->connection->query( $query )->fetchAll( PDO::FETCH_ASSOC );
	}

	/**
	 * Creates a new menu item with provided details.
	 *
	 * @param   array  $data  An associative array containing details of the new menu item.
	 *
	 * @return bool Returns true if the menu item was successfully created, false on failure.
	 */
	public function createNewMenuItem( $data ) {
		try {
			// Prepare the SQL statement to create the menu item
			$stmt = $this->db->connection->prepare( "INSERT INTO menu_items (name, description, price, image, menu_id) VALUES (:name, :description, :price, :image, :menu_id)" );

			// Bind parameters
			$stmt->bindParam( ':name', $data['name'] );
			$stmt->bindParam( ':description', $data['description'] );
			$stmt->bindParam( ':price', $data['price'] );
			$stmt->bindParam( ':image', $data['image'] );
			$stmt->bindParam( ':menu_id', $data['menu_id'] );

			// Execute the statement
			$stmt->execute();

			// Check if any rows were affected
			return $stmt->rowCount() > 0;
		} catch ( PDOException $e ) {
			return false;
		}
	}

	/**
	 * Updates details for a specific menu item.
	 *
	 * @param   int    $itemId   The ID of the item to update.
	 * @param   array  $newData  An associative array containing the new details of the menu item.
	 *
	 * @return bool Returns true if the update was successful, false otherwise.
	 */
	public function updateMenuItemDetails( $itemId, $newData ) {
		try {
			// Prepare the SQL statement to update the menu item
			$stmt = $this->db->connection->prepare( "UPDATE menu_items SET name = :name, description = :description, price = :price, image = :image, menu_id = :menu_id WHERE id = :id" );

			// Bind parameters
			$stmt->bindParam( ':name', $newData['name'] );
			$stmt->bindParam( ':description', $newData['description'] );
			$stmt->bindParam( ':price', $newData['price'] );
			$stmt->bindParam( ':image', $newData['image'] );
			$stmt->bindParam( ':menu_id', $newData['menu_id'] );
			$stmt->bindParam( ':id', $itemId );

			// Execute the statement
			$stmt->execute();

			// Check if any rows were affected
			return $stmt->rowCount() > 0;
		} catch ( PDOException $e ) {
			return false;
		}
	}

	/**
	 * Retrieves details of a specific menu item.
	 *
	 * @param   int  $itemId  The ID of the menu item.
	 *
	 * @return array|null Returns an associative array containing the details of the menu item, or null if not found.
	 */
	public function retrieveItemDetails( int $itemId ) {
		$query     = "SELECT * FROM menu_items WHERE id = :id";
		$statement = $this->db->connection->prepare( $query );
		$statement->bindParam( ':id', $itemId );
		$statement->execute();

		return $statement->fetch( PDO::FETCH_ASSOC );
	}

	/**
	 * Retrieves menu items that fall within a specified price range.
	 *
	 * @param   float     $minPrice  The minimum price of the items.
	 * @param   float     $maxPrice  The maximum price of the items.
	 * @param   int|null  $menuId    Optional menu ID to filter items by menu.
	 *
	 * @return array Returns an array of menu items within the specified price range.
	 */
	public function retrieveMenuItemsByPriceRange( $minPrice, $maxPrice, $menuId ) {
		try {
			// Prepare the base SQL query
			$query = "SELECT * FROM menu_items WHERE price BETWEEN :min_price AND :max_price";


			// Add menu ID condition if provided
			if ( ! empty( $menuId ) ) {
				$query .= " AND menu_id = :menu_id";
			}

			// Prepare the statement
			$statement = $this->db->connection->prepare( $query );

			// Bind parameters
			$statement->bindValue( ':min_price', $minPrice );
			$statement->bindValue( ':max_price', $maxPrice );

			// Bind menu ID if provided
			if ( ! empty( $menuId ) ) {
				$statement->bindValue( ':menu_id', $menuId );
			}

			// Execute the statement
			$statement->execute();

			// Fetch the filtered menu items
			return $statement->fetchAll( PDO::FETCH_ASSOC );
		} catch ( PDOException $e ) {
			return [];
		}
	}

	/**
	 * Deletes a specific menu item by its ID.
	 *
	 * @param   int  $itemId  The ID of the item to be deleted.
	 *
	 * @return void
	 */
	public function deleteMenuItem( $itemId ) {
		try {
			$query     = "DELETE FROM menu_items WHERE id = ?";
			$statement = $this->db->connection->prepare( $query );
			$statement->execute( [ $itemId ] );

			$_SESSION['info'][] = "Menu item deleted successfully.";
		} catch ( PDOException $e ) {
			$_SESSION['errors'][] = "Failed to delete the menu item:" . $e->getMessage();
		}
	}

}