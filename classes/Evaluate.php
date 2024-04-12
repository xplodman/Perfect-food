<?php

namespace PerfectFood\Classes;

use PDO;
use PDOException;

class Evaluate {
	private DB $db;

	public function __construct() {
		$this->db = new DB();
	}

	public function submitEvaluation($entityId, $entityType, $rating, $comment) {
		try {
			// Prepare the SQL statement
			$sql = "INSERT INTO evaluations (order_id, booking_id, rating, comment) VALUES (?, ?, ?, ?)";
			$stmt = $this->db->connection->prepare($sql);

			// Determine whether it's an order or booking evaluation and set the appropriate parameters
			if ($entityType === 'order') {
				$order_id = $entityId;
				$booking_id = null;
			} elseif ($entityType === 'booking') {
				$order_id = null;
				$booking_id = $entityId;
			} else {
				// Handle invalid entity type
				$_SESSION['errors'][] = "Invalid entity type.";
				return;
			}

			// Bind parameters and execute the statement
			$stmt->execute([$order_id, $booking_id, $rating, $comment]);

			// Provide feedback to the user
			$_SESSION['info'][] = "Evaluation successfully inserted.";

			// Redirect the user based on the entity type
			if ( $entityType === 'order' ) {
				header("Location: orders.php");
				exit();
			}

			if ( $entityType === 'booking' ) {
				header("Location: bookings.php");
				exit();
			}
		} catch (PDOException $e) {
			$_SESSION['errors'][] = "Error submitting evaluation: " . $e->getMessage();
		}
	}

	public function entityHasRating($entityId, $entityType)
	{
		try {
			// Prepare the SQL statement
			$sql = "SELECT COUNT(*) FROM evaluations WHERE ";
			if ($entityType === 'order') {
				$sql .= "order_id = ? AND booking_id IS NULL";
			} elseif ($entityType === 'booking') {
				$sql .= "booking_id = ? AND order_id IS NULL";
			} else {
				return false;
			}
			$stmt = $this->db->connection->prepare($sql);

			// Bind parameters and execute the statement
			$stmt->execute([$entityId]);

			// Fetch the result
			$result = $stmt->fetchColumn();

			// Check if any evaluations exist for the order or booking
			return $result > 0;
		} catch (PDOException $e) {
			return false;
		}
	}

	public function getEntityRating($entityId, $entityType)
	{
		try {
			$query = "SELECT * FROM evaluations WHERE ";
			if ($entityType === 'order') {
				$query .= "order_id = ? AND booking_id IS NULL";
			} elseif ($entityType === 'booking') {
				$query .= "booking_id = ? AND order_id IS NULL";
			} else {
				return 0; // Default to 0 rating if entity type is invalid
			}
			$statement = $this->db->connection->prepare($query);
			$statement->execute([$entityId]);

			return $statement->fetch(PDO::FETCH_ASSOC);
		} catch (PDOException $e) {
			return 0; // Default to 0 rating if there's an error
		}
	}

}
