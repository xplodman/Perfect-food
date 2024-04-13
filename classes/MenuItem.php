<?php

namespace PerfectFood\Classes;

use PDO;
use PDOException;

class MenuItem {
	private DB $db;

	public function __construct() {
		$this->db = new DB();
	}

	public function getMenuItemsByMenuId( $menuId ) {
		$query     = "SELECT * FROM menu_items WHERE menu_id = :menu_id";
		$statement = $this->db->connection->prepare( $query );
		$statement->bindParam( ':menu_id', $menuId );
		$statement->execute();

		return $statement->fetchAll( PDO::FETCH_ASSOC );
	}

	public function getMenuItemsRandomWithLimit( $limit ) {
		$query = "SELECT * FROM menu_items ORDER BY RAND() LIMIT $limit";

		return $this->db->connection->query( $query )->fetchAll( PDO::FETCH_ASSOC );
	}

	public function getAllMenuItems() {
		$query = "SELECT * FROM menu_items order by id";

		return $this->db->connection->query( $query )->fetchAll( PDO::FETCH_ASSOC );
	}

	public function updateMenuItem( $itemId, $newData ) {
		try {
			// Prepare the SQL statement to update the menu item
			$stmt = $this->db->connection->prepare("UPDATE menu_items SET name = :name, description = :description, price = :price, image = :image, menu_id = :menu_id WHERE id = :id");

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

	public function getItemDetailsById( int $itemId ) {
		$query     = "SELECT * FROM menu_items WHERE id = :id";
		$statement = $this->db->connection->prepare( $query );
		$statement->bindParam( ':id', $itemId );
		$statement->execute();

		return $statement->fetch( PDO::FETCH_ASSOC );
	}

	public function getMenuItemsByPriceRange( $minPrice, $maxPrice, $menuId ) {
		try {
			// Prepare the base SQL query
			$query = "SELECT * FROM menu_items WHERE price BETWEEN :min_price AND :max_price";


			// Add menu ID condition if provided
			if (!empty($menuId)) {
				$query .= " AND menu_id = :menu_id";
			}

			// Prepare the statement
			$statement = $this->db->connection->prepare($query);

			// Bind parameters
			$statement->bindValue(':min_price', $minPrice);
			$statement->bindValue(':max_price', $maxPrice);

			// Bind menu ID if provided
			if (!empty($menuId)) {
				$statement->bindValue(':menu_id', $menuId);
			}

			// Execute the statement
			$statement->execute();

			// Fetch the filtered menu items
			return $statement->fetchAll( PDO::FETCH_ASSOC );
		} catch ( PDOException $e ) {
			return [];
		}
	}

}