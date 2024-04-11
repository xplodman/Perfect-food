<?php

namespace PerfectFood\Classes;

use PDO;
use PDOException;

class Book {
	private $db;

	public function __construct() {
		$this->db = new DB();
	}

	public function book( $customerId, $branchId, $bookingDate, $bookingTime, $guests ) {
		try {
			// Start a transaction
			$this->db->connection->beginTransaction();

			// Insert booking details into the database
			$query     = "INSERT INTO bookings (customer_id, branch_id, booking_date, booking_time, guests) VALUES (?, ?, ?, ?, ?)";
			$statement = $this->db->connection->prepare( $query );
			$statement->execute( [ $customerId, $branchId, $bookingDate, $bookingTime, $guests ] );

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

	public function getBookingsByCustomerId( $customerId ) {
		try {
			$query     = "SELECT b.*, br.name AS branch_name FROM bookings b JOIN branches br ON b.branch_id = br.id WHERE b.customer_id = ?; ";
			$statement = $this->db->connection->prepare( $query );
			$statement->execute( [ $customerId ] );

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

	public function getBookingStatusCounts( $customerId = null ) {
		try {
			$query = "SELECT status, COUNT(*) AS count FROM bookings";
			if ( $customerId !== null ) {
				$query .= " WHERE customer_id = :customer_id";
			}
			$query .= " GROUP BY status";

			$statement = $this->db->connection->prepare( $query );
			if ( $customerId !== null ) {
				$statement->bindParam( ':customer_id', $customerId, PDO::PARAM_INT );
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

}