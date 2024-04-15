<?php

namespace PerfectFood\Classes;

use PDO;
use PDOException;

class Menu {
	private DB $db;

	public function __construct() {
		$this->db = new DB();
	}

	/**
	 * Retrieves all menus, optionally filtering active menus if the user is not an admin.
	 * @return array Returns an array of menu details.
	 */
	public function retrieveMenus() {
		$query = "SELECT * FROM menus";

		if ( ! isset( $_SESSION["role"] ) || $_SESSION["role"] !== 'admin' ) {
			$query .= ' WHERE active = 1';
		}

		return $this->db->connection->query( $query )->fetchAll( PDO::FETCH_ASSOC );
	}

	/**
	 * Updates details for a specific menu.
	 *
	 * @param   int    $itemId   The ID of the menu to update.
	 * @param   array  $newData  An associative array containing the new details of the menu.
	 *
	 * @return bool Returns true if the update was successful, false otherwise.
	 */
	public function updateMenuDetails( $itemId, $newData ) {
		try {
			// Prepare the SQL statement to update the menu item
			$stmt = $this->db->connection->prepare( "UPDATE menus SET name = :name, description = :description, active = :active WHERE id = :id" );

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

	/**
	 * Retrieves details of a specific menu.
	 *
	 * @param   int  $itemId  The ID of the menu.
	 *
	 * @return array|null Returns an associative array containing the details of the menu, or null if not found.
	 */
	public function retrieveMenuDetails( int $itemId ) {
		$query     = "SELECT * FROM menus WHERE id = :id";
		$statement = $this->db->connection->prepare( $query );
		$statement->bindParam( ':id', $itemId );
		$statement->execute();

		return $statement->fetch( PDO::FETCH_ASSOC );
	}

	/**
	 * Creates a new menu with provided details.
	 *
	 * @param   array  $data  An associative array containing details of the new menu.
	 *
	 * @return bool Returns true if the menu was successfully created, false on failure.
	 */
	public function createNewMenu( $data ) {
		try {
			// Prepare the SQL statement to create the menu
			$stmt = $this->db->connection->prepare( "INSERT INTO menus (name, description, active) VALUES (:name, :description, :active)" );

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

	/**
	 * Deletes a specific menu by its ID.
	 *
	 * @param   int  $menuID  The ID of the menu to be deleted.
	 *
	 * @return void
	 */
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