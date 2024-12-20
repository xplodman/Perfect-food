<?php

namespace FamilyRestaurant\Classes;

use PDO;
use PDOException;

class Evaluate {
	private DB $db;

	public function __construct() {
		$this->db = new DB();
	}

	/**
	 * Creates a new evaluation for an entity (order or reservation) with the provided details.
	 *
	 * @param   int     $entityId    The ID of the entity (order or reservation) being evaluated.
	 * @param   string  $entityType  The type of the entity ('order' or 'reservation').
	 * @param   int     $rating      The evaluation given in the evaluation.
	 * @param   string  $comment     The comment provided in the evaluation.
	 *
	 * @return void
	 */
	public function createEntityEvaluation( $entityId, $entityType, $rating, $comment ) {
		try {
			// Prepare the SQL statement
			$sql  = "INSERT INTO evaluations (order_id, reservation_id, rating, comment) VALUES (?, ?, ?, ?)";
			$stmt = $this->db->connection->prepare( $sql );

			// Determine whether it's an order or reservation evaluation and set the appropriate parameters
			if ( $entityType === 'order' ) {
				$order_id   = $entityId;
				$reservation_id = null;
			} elseif ( $entityType === 'reservation' ) {
				$order_id   = null;
				$reservation_id = $entityId;
			} else {
				// Handle invalid entity type
				$_SESSION['errors'][] = "Invalid entity type.";

				return;
			}

			// Bind parameters and execute the statement
			$stmt->execute( [ $order_id, $reservation_id, $rating, $comment ] );

			// Provide feedback to the user
			$_SESSION['info'][] = "Evaluation successfully inserted.";

			// Redirect the user based on the entity type
			if ( $entityType === 'order' ) {
				header( "Location: orders.php" );
				exit();
			}

			if ( $entityType === 'reservation' ) {
				header( "Location: reservations.php" );
				exit();
			}
		} catch ( PDOException $e ) {
			$_SESSION['errors'][] = "Error submitting evaluation: " . $e->getMessage();
		}
	}

	/**
	 * Checks if an entity (order or reservation) has already been rated.
	 *
	 * @param   int     $entityId    The ID of the entity (order or reservation) to check.
	 * @param   string  $entityType  The type of the entity ('order' or 'reservation').
	 *
	 * @return bool Returns true if the entity has been rated, false otherwise.
	 */
	public function hasEvaluationForEntity( $entityId, $entityType ) {
		try {
			// Prepare the SQL statement
			$sql = "SELECT COUNT(*) FROM evaluations WHERE ";
			if ( $entityType === 'order' ) {
				$sql .= "order_id = ? AND reservation_id IS NULL";
			} elseif ( $entityType === 'reservation' ) {
				$sql .= "reservation_id = ? AND order_id IS NULL";
			} else {
				return false;
			}
			$stmt = $this->db->connection->prepare( $sql );

			// Bind parameters and execute the statement
			$stmt->execute( [ $entityId ] );

			// Fetch the result
			$result = $stmt->fetchColumn();

			// Check if any evaluations exist for the order or reservation
			return $result > 0;
		} catch ( PDOException $e ) {
			return false;
		}
	}

	/**
	 * Retrieves the evaluation details for an entity (order or reservation).
	 *
	 * @param   int     $entityId    The ID of the entity (order or reservation).
	 * @param   string  $entityType  The type of the entity ('order' or 'reservation').
	 *
	 * @return array Returns an associative array containing the evaluation details if found, or an empty array if not found or error occurs.
	 */
	public function getEntityEvaluationDetails( $entityId, $entityType ) {
		try {
			$query = "SELECT * FROM evaluations WHERE ";
			if ( $entityType === 'order' ) {
				$query .= "order_id = ? AND reservation_id IS NULL";
			} elseif ( $entityType === 'reservation' ) {
				$query .= "reservation_id = ? AND order_id IS NULL";
			} else {
				return []; // Return an empty array for invalid entity type
			}

			$statement = $this->db->connection->prepare( $query );
			$statement->execute( [ $entityId ] );

			$result = $statement->fetch( PDO::FETCH_ASSOC );
			return $result ?: []; // Return the result if found, otherwise an empty array
		} catch ( PDOException $e ) {
			return []; // Return an empty array in case of error
		}
	}

	/**
	 * Retrieves total count of ratings for today.
	 *
	 * @param   string  $entityType  The type of the entity ('order' or 'reservation').
	 *
	 * @return int Returns the total count of ratings for today.
	 */
	public function totalRatingsToday( $entityType ) {
		try {
			// Prepare the SQL statement
			$sql = "SELECT COUNT(*) AS totalRatingsToday FROM evaluations WHERE DATE(created_at) = CURDATE()";
			if ( $entityType === 'order' ) {
				$sql .= " AND reservation_id IS NULL";
			} elseif ( $entityType === 'reservation' ) {
				$sql .= " AND order_id IS NULL";
			} else {
				return 0;
			}
			$statement = $this->db->connection->prepare( $sql );
			$statement->execute();
			$result = $statement->fetch( PDO::FETCH_ASSOC );

			return (int) $result['totalRatingsToday'];
		} catch ( PDOException $e ) {
			return 0;
		}
	}

	/**
	 * Calculates the average rating for today.
	 *
	 * @param   string  $entityType  The type of the entity ('order' or 'reservation').
	 *
	 * @return float Returns the average rating for today.
	 */
	public function averageRatingToday( $entityType ) {
		try {
			// Prepare the SQL statement
			$sql = "SELECT AVG(rating) AS averageRatingToday FROM evaluations WHERE DATE(created_at) = CURDATE()";
			if ( $entityType === 'order' ) {
				$sql .= " AND reservation_id IS NULL";
			} elseif ( $entityType === 'reservation' ) {
				$sql .= " AND order_id IS NULL";
			} else {
				return 0;
			}
			$statement = $this->db->connection->prepare( $sql );
			$statement->execute();
			$result = $statement->fetch( PDO::FETCH_ASSOC );

			return (int) $result['averageRatingToday'];
		} catch ( PDOException $e ) {
			return 0;
		}
	}

	/**
	 * Retrieves total count of ratings for the current month.
	 *
	 * @param   string  $entityType  The type of the entity ('order' or 'reservation').
	 *
	 * @return int Returns the total count of ratings for the current month.
	 */
	public function totalRatingsThisMonth( $entityType ) {
		try {
			// Prepare the SQL statement
			$sql = "SELECT COUNT(*) AS totalRatingsThisMonth FROM evaluations WHERE YEAR(created_at) = YEAR(CURDATE()) AND MONTH(created_at) = MONTH(CURDATE())";
			if ( $entityType === 'order' ) {
				$sql .= " AND reservation_id IS NULL";
			} elseif ( $entityType === 'reservation' ) {
				$sql .= " AND order_id IS NULL";
			} else {
				return 0;
			}
			$statement = $this->db->connection->prepare( $sql );
			$statement->execute();
			$result = $statement->fetch( PDO::FETCH_ASSOC );

			return (int) $result['totalRatingsThisMonth'];
		} catch ( PDOException $e ) {
			return 0;
		}
	}

	/**
	 * Calculates the average rating for the current month.
	 *
	 * @param   string  $entityType  The type of the entity ('order' or 'reservation').
	 *
	 * @return float Returns the average rating for the current month.
	 */
	public function averageRatingThisMonth( $entityType ) {
		try {
			// Prepare the SQL statement
			$sql = "SELECT AVG(rating) AS averageRatingThisMonth FROM evaluations WHERE YEAR(created_at) = YEAR(CURDATE()) AND MONTH(created_at) = MONTH(CURDATE())";
			if ( $entityType === 'order' ) {
				$sql .= " AND reservation_id IS NULL";
			} elseif ( $entityType === 'reservation' ) {
				$sql .= " AND order_id IS NULL";
			} else {
				return 0;
			}
			$statement = $this->db->connection->prepare( $sql );
			$statement->execute();
			$result = $statement->fetch( PDO::FETCH_ASSOC );

			return (int) $result['averageRatingThisMonth'];
		} catch ( PDOException $e ) {
			return 0;
		}
	}
}
