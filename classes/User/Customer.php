<?php

namespace PerfectFood\Classes\User;

use PDOException;
use PerfectFood\Classes\DB;

class Customer {
	private DB $db;

	public function __construct() {
		$this->db = new DB();
	}

	public function registerUser( $email, $password, $firstName, $lastName, $city, $street, $houseNumber, $phone ) {
		try {
			// Hash the password before storing it in the database
			$hashedPassword = password_hash( $password, PASSWORD_DEFAULT );

			// Prepare the SQL statement to insert user data into the database
			$stmt = $this->db->connection->prepare( "INSERT INTO customers (first_name, last_name, email, password, city, street, house_number, phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" );
			$stmt->execute( [ $firstName, $lastName, $email, $hashedPassword, $city, $street, $houseNumber, $phone ] );

			// Set session variables
			$_SESSION["customer_logged_in"] = true;
			$_SESSION["email"]              = $email;

			// User registration successful
			return true;
		} catch ( PDOException $e ) {
			// User registration failed
			echo "Registration failed: " . $e->getMessage();

			return false;
		}
	}

	public function loginUser( $email, $password ) {
		try {
			// Retrieve the hashed password from the database for the given email
			$stmt = $this->db->connection->prepare( "SELECT * FROM customers WHERE email = ?" );
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

			// Login failed
			return false;
		} catch ( PDOException $e ) {
			echo "Login failed: " . $e->getMessage();

			return false;
		}
	}

	public function logoutUser() {
		// Unset all session variables
		$_SESSION = [];

		// Destroy the session
		session_destroy();
	}
}