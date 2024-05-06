<?php

namespace PerfectFood\Classes;

use PDO;
use PDOException;

class Book {
	private $db;

	public function __construct() {
		$this->db = new DB();
	}


	/**
	 * Makes a booking for a user at a branch.
	 *
	 * @param   int     $userId       The ID of the user making the booking.
	 * @param   int     $branchId     The ID of the branch where the booking is made.
	 * @param   string  $bookingDate  The date of the booking.
	 * @param   string  $bookingTime  The time of the booking.
	 * @param   int     $guests       The number of guests for the booking.
	 *
	 * @return bool Returns true if the booking is successful, false otherwise.
	 */
	public function makeBooking( $userId, $branchId, $bookingDate, $bookingTime, $guests ) {
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

	/**
	 * Retrieves bookings based on the user's role.
	 *
	 * @param bool $showAll Flag to indicate whether to retrieve all bookings or limit the results.
	 *
	 * @return array|bool Returns an array containing booking details fetched from the database, or false on failure.
	 */
	public function retrieveBookingsBasedOnUserRole($showAll = false)
	{
		try {
			$isAdmin = ($_SESSION["role"] === 'admin');

			// Base query to retrieve bookings information
			$query = "
	            SELECT 
	                bookings.*, 
	                branches.name AS branch_name, 
	                users.email 
	            FROM 
	                bookings 
	                JOIN branches ON bookings.branch_id = branches.id 
	                LEFT JOIN users ON bookings.user_id = users.id
	        ";

			// Add WHERE clause based on user role
			if (!$isAdmin) {
				$query .= " WHERE bookings.user_id = ?";
			}

			$query .= " ORDER BY bookings.id DESC";

			/**
			 * TODO
			 *
			 * -Add an actor to receive the order from the admin
			 * -Add customer history
			 * -Add validation on first name and last name for text only
			 * -Add validation on numbers
			 * -Add multi address in account
			 * -Correcting the error if registering with a previously registered email
			 */


			// Limit the number of results if showAll is false
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
			$_SESSION['errors'][] = "Error fetching bookings: " . $e->getMessage();
			return false;
		}
	}

	/**
	 * Deletes a booking from the database.
	 *
	 * @param   int  $bookingId  The ID of the booking to be deleted.
	 *
	 * @return void
	 */
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

	/**
	 * Retrieves the counts of bookings based on their status.
	 *
	 * @return array An associative array containing the count of bookings for each status.
	 */
	public function retrieveBookingStatusCounts() {
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

	/**
	 * Modifies the status of a booking.
	 *
	 * @param   int     $bookingId  The ID of the booking to be modified.
	 * @param   string  $status     The new status of the booking.
	 *
	 * @return bool Returns true if the status is successfully modified, false otherwise.
	 */
	public function modifyBookingStatus( $bookingId, $status ) {
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