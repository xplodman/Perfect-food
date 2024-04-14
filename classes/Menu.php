<?php

namespace PerfectFood\Classes;

use PDO;
use PDOException;

class Menu {
	private DB $db;

	public function __construct() {
		$this->db = new DB();
	}

	public function getMenus() {
		$query = "SELECT * FROM menus";

		if ( !isset($_SESSION["role"]) || $_SESSION["role"] !== 'admin' ){
			$query .= ' WHERE active = 1';
		}

		return $this->db->connection->query( $query )->fetchAll( PDO::FETCH_ASSOC );
	}

	public function updateMenu( $itemId, $newData ) {
		try {
			// Prepare the SQL statement to update the menu item
			$stmt = $this->db->connection->prepare("UPDATE menus SET name = :name, description = :description, active = :active WHERE id = :id");

			// Bind parameters
			$stmt->bindParam( ':name', $newData['name'] );
			$stmt->bindParam( ':description', $newData['description'] );
			$stmt->bindParam( ':active', $newData['active'] );
			$stmt->bindParam( ':id', $itemId );

			// Execute the statement
			$stmt->execute();

			// Check if any rows were affected
			return $stmt->rowCount() > 0;
		} catch ( PDOException $e ) {
			return false;
		}
	}

	public function getMenuDetailsById( int $itemId ) {
		$query     = "SELECT * FROM menus WHERE id = :id";
		$statement = $this->db->connection->prepare( $query );
		$statement->bindParam( ':id', $itemId );
		$statement->execute();

		return $statement->fetch( PDO::FETCH_ASSOC );
	}

	public function createMenu( $data ) {
		try {
			// Prepare the SQL statement to create the menu
			$stmt = $this->db->connection->prepare("INSERT INTO menus (name, description, active) VALUES (:name, :description, :active)");

			// Bind parameters
			$stmt->bindParam( ':name', $data['name'] );
			$stmt->bindParam( ':description', $data['description'] );
			$stmt->bindParam( ':active', $data['active'] );

			// Execute the statement
			$stmt->execute();

			// Check if any rows were affected
			return $stmt->rowCount() > 0;
		} catch ( PDOException $e ) {
			return false;
		}
	}

	public function deleteMenu( $menuID ) {
		try {
			$query     = "DELETE FROM menus WHERE id = ?";
			$statement = $this->db->connection->prepare( $query );
			$statement->execute( [ $menuID ] );

			$_SESSION['info'][] = "Menu deleted successfully.";
		} catch ( PDOException $e ) {
			$_SESSION['errors'][] = "Failed to delete the menu:" . $e->getMessage();
		}
	}
}