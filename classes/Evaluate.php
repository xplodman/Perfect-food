<?php

namespace PerfectFood\Classes;

use PDO;
use PDOException;

class Evaluate {
	private DB $db;

	public function __construct() {
		$this->db = new DB();
	}

	public function submitEvaluation( $entityId, $entityType, $rating, $comment ) {
		try {
			// Prepare the SQL statement
			$sql  = "INSERT INTO evaluations (entity_id, entity_type, rating, comment) VALUES (?, ?, ?, ?)";
			$stmt = $this->db->connection->prepare( $sql );

			// Bind parameters and execute the statement
			$stmt->execute( [ $entityId, $entityType, $rating, $comment ] );

			$_SESSION['info'][] = "Evaluation successfully inserted.";

			if ( $entityType === 'order' ) {
				header( "Location: orders.php" );
				exit();
			}

			header( "Location: bookings.php" );
			exit();
		} catch ( PDOException $e ) {
			$_SESSION['errors'][] = "Error submitting evaluation: " . $e->getMessage();
		}
	}

	public function entityHasRating( $entityId, $entityType ) {
		try {
			// Prepare the SQL statement
			$sql  = "SELECT COUNT(*) FROM evaluations WHERE entity_id = ? AND entity_type = ?";
			$stmt = $this->db->connection->prepare( $sql );

			// Bind parameters and execute the statement
			$stmt->execute( [ $entityId, $entityType ] );

			// Fetch the result
			$result = $stmt->fetchColumn();

			// Check if any evaluations exist for the order
			return $result > 0;
		} catch ( PDOException $e ) {
			return false;
		}
	}

	public function getEntityRating( $entityId, $entityType ) {
		try {
			$query     = "SELECT * FROM evaluations WHERE entity_id = ? AND entity_type = ?";
			$statement = $this->db->connection->prepare( $query );
			$statement->execute( [ $entityId, $entityType ] );

			return $statement->fetch( PDO::FETCH_ASSOC );
		} catch ( PDOException $e ) {
			// Handle database errors
			return 0; // Default to 0 rating if there's an error
		}
	}

}
