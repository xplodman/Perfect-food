<?php

namespace PerfectFood\Classes;

use PDO;
use PDOException;

class MenuItem {
	private DB $db;

	public function __construct() {
		$this->db = new DB();
	}

	public function getMenuItemsByMenuId($menuId)
	{
		$query = "SELECT * FROM menu_items WHERE menu_id = :menu_id";
		$statement = $this->db->connection->prepare($query);
		$statement->bindParam(':menu_id', $menuId);
		$statement->execute();
		return $statement->fetchAll(PDO::FETCH_ASSOC);
	}

	public function getMenuItemsRandomWithLimit($limit)
	{
		$query = "SELECT * FROM menu_items ORDER BY RAND() LIMIT $limit";

		return $this->db->connection->query($query)->fetchAll(PDO::FETCH_ASSOC);
	}

	public function getAllMenuItems() {
		$query = "SELECT * FROM menu_items order by id";

		return $this->db->connection->query($query)->fetchAll(PDO::FETCH_ASSOC);
	}

	public function updateMenuItem($itemId, $newData) {
		try {
			// Prepare the SQL statement to update the menu item
			$stmt = $this->db->connection->prepare("UPDATE menu_items SET image = :image WHERE id = :id");

			// Bind parameters
			$stmt->bindParam(':image', $newData['image']);
			$stmt->bindParam(':id', $itemId);

			// Execute the statement
			$stmt->execute();

			// Check if any rows were affected
			return $stmt->rowCount() > 0;
		} catch(PDOException $e) {
			// Error occurred while updating the menu item
			echo "Error updating menu item: " . $e->getMessage();
			return false;
		}
	}

}