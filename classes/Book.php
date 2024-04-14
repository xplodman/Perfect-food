<?php

namespace PerfectFood\Classes;

use PDO;
use PDOException;

class Book {
	private $db;

	public function __construct() {
		$this->db = new DB();
	}

	public function book( $userId, $branchId, $bookingDate, $bookingTime, $guests ) {
		try {
			// Start a transaction
			$this->db->connection->beginTransaction();

			// Insert booking details into the database
			$query     = "INSERT INTO bookings (user_id, branch_id, booking_date, booking_time, guests) VALUES (?, ?, ?, ?, ?)";
			$statement = $this->db->connection->prepare( $query );
			$statement->execute( [ $userId, $branchId, $bookingDate, $bookingTime, $guests ] );

			// Commit the transaction
			$this->db->connection->commit();
			$_SESSION['info'][] = "Booking successful.";

			header( "Location: bookings.php" );
			exit();
		} catch ( PDOException $e ) {
			// Rollback the transaction if an error occurs
			$this->db->connection->rollBack();
			// Log or handle the error
			$_SESSION['errors'][] = "Error booking branch: " . $e->getMessage();

			return false; // Booking failed
		}
	}

	public function getBookingsBasedOnUserRole() {
		try {
			if ( $_SESSION["role"] === 'admin' ) {
				// If the user is an admin, fetch all bookings without filtering by user_id
				$query     = "SELECT bookings.*, branches.name AS branch_name, users.email FROM bookings JOIN branches ON bookings.branch_id = branches.id LEFT JOIN users ON bookings.user_id = users.id;";
				$statement = $this->db->connection->prepare( $query );
				$statement->execute();
			} else {
				// If the user is not an admin, fetch bookings only for the current user
				$query     = "SELECT bookings.*, branches.name AS branch_name, users.email FROM bookings JOIN branches ON bookings.branch_id = branches.id LEFT JOIN users ON bookings.user_id = users.id WHERE bookings.user_id = ?;";
				$statement = $this->db->connection->prepare( $query );
				$statement->execute( [ $_SESSION['user_id'] ] );
			}

			return $statement->fetchAll( PDO::FETCH_ASSOC );
		} catch ( PDOException $e ) {
			$_SESSION['errors'][] = "Error fetching bookings: " . $e->getMessage();

			return false;
		}
	}

	public function deleteBooking( $bookingId ) {
		try {
			$query     = "DELETE FROM bookings WHERE id = ?";
			$statement = $this->db->connection->prepare( $query );
			$statement->execute( [ $bookingId ] );

			$_SESSION['info'][] = "Booking deleted successfully.";
		} catch ( PDOException $e ) {
			$_SESSION['errors'][] = "Failed to delete the booking.";
		}
	}

	public function getBookingStatusCounts() {
		try {
			$query = "SELECT status, COUNT(*) AS count FROM bookings";
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

	public function updateBooking( $bookingId, $status ) {
		try {
			// Prepare the SQL statement to update the booking
			$stmt = $this->db->connection->prepare( "UPDATE bookings SET status = :status WHERE id = :id" );

			// Bind parameters
			$stmt->bindParam( ':status', $status );
			$stmt->bindParam( ':id', $bookingId );

			// Execute the statement
			$stmt->execute();

			// Check if any rows were affected
			return $stmt->rowCount() > 0;
		} catch ( PDOException $e ) {
			return false;
		}
	}

}