<?php

namespace PerfectFood\Classes\User;

use PDOException;
use PerfectFood\Classes\DB;

class Customer {
	private DB $db;

	public function __construct() {
		$this->db = new DB();
	}

	public function registerUser( $email, $password, $firstName, $lastName, $city, $street, $houseNumber ) {
		try {
			// Hash the password before storing it in the database
			$hashedPassword = password_hash( $password, PASSWORD_DEFAULT );

			// Prepare the SQL statement to insert user data into the database
			$stmt = $this->db->connection->prepare( "INSERT INTO customers (first_name, last_name, email, password, city, street, house_number) VALUES (?, ?, ?, ?, ?, ?, ?)" );
			$stmt->execute( [ $firstName, $lastName, $email, $hashedPassword, $city, $street, $houseNumber ] );

			// Set session variables
			$_SESSION["customer_logged_in"] = true;
			$_SESSION["email"]              = $email;

			// User registration successful
			return true;
		} catch ( PDOException $e ) {
			// User registration failed
			$_SESSION['errors'][] = $e->getMessage();

			return false;
		}
	}

	public function loginUser( $email, $password ) {
		try {
			// Retrieve the hashed password from the database for the given email
			$stmt = $this->db->connection->prepare( "SELECT * FROM customers WHERE email = ? LIMIT 1" );
			$stmt->execute( [ $email ] );
			$user = $stmt->fetch();

			// Verify the password
			if ( $user && password_verify( $password, $user['password'] ) ) {
				// Login successful

				// Set session variables
				$_SESSION["customer_logged_in"] = true;
				$_SESSION["email"]              = $email;

				return true;
			}

			$_SESSION['errors'][] = 'Email or password is incorrect.';
			// Login failed
			return false;
		} catch ( PDOException $e ) {
			$_SESSION['errors'][] = $e->getMessage();

			return false;
		}
	}

	public function logoutUser() {
		// Unset all session variables
		$_SESSION = [];

		// Destroy the session
		session_destroy();
	}

	public function addPhone($customerId, $phoneNumber) {
		try {
			// Prepare the SQL statement to insert phone number into the database
			$stmt = $this->db->connection->prepare("INSERT INTO phones (customer_id, phone_number) VALUES (?, ?)");
			$stmt->execute([$customerId, $phoneNumber]);
		} catch(PDOException $e) {
			// Error handling for phone number insertion
			echo "Error adding phone number: " . $e->getMessage();
		}
	}

	public function getLastInsertedId() {
		// Retrieve the last inserted ID
		return $this->db->connection->lastInsertId();
	}
}