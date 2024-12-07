<?php

namespace FamilyRestaurant\Classes;

use PDO;
use PDOException;

class Reserve {
	private $db;

	public function __construct() {
		$this->db = new DB();
	}

	/**
	 * Makes a reservation for a user at a branch.
	 *
	 * @param   int     $userId       The ID of the user making the reservation.
	 * @param   int     $branchId     The ID of the branch where the reservation is made.
	 * @param   string  $reservationDate  The date of the reservation.
	 * @param   string  $reservationTime  The time of the reservation.
	 * @param   int     $guests       The number of guests for the reservation.
	 *
	 * @return bool Returns true if the reservation is successful, false otherwise.
	 */
	public function makeReservation( $userId, $branchId, $reservationDate, $reservationTime, $guests ) {
		try {
			// Combine reservation date and time into a single DateTime object
			$reservationDateTime = new \DateTime("$reservationDate $reservationTime");
			$currentDateTime = new \DateTime();

			// Check if the reservation date and time are in the future
			if ($reservationDateTime <= $currentDateTime) {
				$_SESSION['errors'][] = "Reservation date and time must be in the future.";
				return false; // Reservation failed
			}

			// Start a transaction
			$this->db->connection->beginTransaction();

			// Insert reservation details into the database
			$query     = "INSERT INTO reservations (user_id, branch_id, reservation_date, reservation_time, guests) VALUES (?, ?, ?, ?, ?)";
			$statement = $this->db->connection->prepare( $query );
			$statement->execute( [ $userId, $branchId, $reservationDate, $reservationTime, $guests ] );

			// Commit the transaction
			$this->db->connection->commit();
			$_SESSION['info'][] = "Reservation successful.";

			header( "Location: reservations.php" );
			exit();
		} catch ( PDOException $e ) {
			// Rollback the transaction if an error occurs
			$this->db->connection->rollBack();
			// Log or handle the error
			$_SESSION['errors'][] = "Error reservation branch: " . $e->getMessage();

			return false; // Reservation failed
		}
	}

	/**
	 * Retrieves reservations based on the user's role.
	 *
	 * @param bool $showAll Flag to indicate whether to retrieve all reservations or limit the results.
	 *
	 * @return array Returns an array containing reservation details fetched from the database, or empty array on failure.
	 */
	public function retrieveReservationsBasedOnUserRole($showAll = false)
	{
		try {
			$isAdmin = ($_SESSION["role"] === 'admin');

			// Base query to retrieve orders information
			$query = "
	            SELECT 
	                reservations.*, 
	                branches.name AS branch_name, 
	                users.email 
	            FROM 
	                reservations 
	                JOIN branches ON reservations.branch_id = branches.id 
	                LEFT JOIN users ON reservations.user_id = users.id
	        ";

			if (!$isAdmin) {
				$query .= " WHERE reservations.user_id = ?";
			}

			$query .= " GROUP BY reservations.id ORDER BY reservations.id DESC";

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
			$_SESSION['errors'][] = "Error fetching reservations: " . $e->getMessage();
			return [];
		}
	}

	/**
	 * Deletes a reservation from the database.
	 *
	 * @param   int  $reservationId  The ID of the reservation to be deleted.
	 *
	 * @return void
	 */
	public function deleteReservation( $reservationId ) {
		try {
			$query     = "DELETE FROM reservations WHERE id = ?";
			$statement = $this->db->connection->prepare( $query );
			$statement->execute( [ $reservationId ] );

			$_SESSION['info'][] = "Reservation deleted successfully.";
		} catch ( PDOException $e ) {
			$_SESSION['errors'][] = "Failed to delete the reservation.";
		}
	}

	/**
	 * Retrieves the counts of reservations based on their status.
	 *
	 * @return array An associative array containing the count of reservations for each status.
	 */
	public function retrieveReservationStatusCounts() {
		try {
			$query = "SELECT status, COUNT(*) AS count FROM reservations";
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
	 * Modifies the status of a reservation.
	 *
	 * @param   int     $reservationId  The ID of the reservation to be modified.
	 * @param   string  $status     The new status of the reservation.
	 *
	 * @return bool Returns true if the status is successfully modified, false otherwise.
	 */
	public function modifyReservationStatus( $reservationId, $status ) {
		try {
			// Prepare the SQL statement to update the reservation
			$stmt = $this->db->connection->prepare( "UPDATE reservations SET status = :status WHERE id = :id" );

			// Bind parameters
			$stmt->bindParam( ':status', $status );
			$stmt->bindParam( ':id', $reservationId );

			// Execute the statement
			$stmt->execute();

			// Check if any rows were affected
			return $stmt->rowCount() > 0;
		} catch ( PDOException $e ) {
			return false;
		}
	}

}