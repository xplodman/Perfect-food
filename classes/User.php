<?php

namespace PerfectFood\Classes;

use PDO;
use PDOException;

class User {
	private DB $db;

	public function __construct() {
		$this->db = new DB();
	}

	public function registerUser( $email, $password, $firstName, $lastName, $city, $street, $houseNumber, $role = 'user' ) {
		try {
			// Hash the password before storing it in the database
			$hashedPassword = password_hash( $password, PASSWORD_DEFAULT );

			// Prepare the SQL statement to insert user data into the database
			$stmt = $this->db->connection->prepare( "INSERT INTO users (first_name, last_name, email, password, city, street, house_number, role) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" );
			$stmt->execute( [ $firstName, $lastName, $email, $hashedPassword, $city, $street, $houseNumber ] );

			$userId = $this->getLastInsertedId();

			// Set session variables
			$_SESSION["city"]               = $city;
			$_SESSION["user_logged_in"] = true;
			$_SESSION["email"]              = $email;
			$_SESSION["first_name"]         = $firstName;
			$_SESSION["house_number"]       = $houseNumber;
			$_SESSION["last_name"]          = $lastName;
			$_SESSION["role"]               = $role;
			$_SESSION["street"]             = $street;
			$_SESSION['user_id']        = $userId;

			// User registration successful
			return true;
		} catch ( PDOException $e ) {
			// User registration failed
			$_SESSION['errors'][] = $e->getMessage();

			return false;
		}
	}

	public function getLastInsertedId() {
		// Retrieve the last inserted ID
		return $this->db->connection->lastInsertId();
	}

	public function loginUser( $email, $password ) {
		try {
			// Retrieve the hashed password from the database for the given email
			$stmt = $this->db->connection->prepare( "SELECT * FROM users WHERE email = ? LIMIT 1" );
			$stmt->execute( [ $email ] );
			$user = $stmt->fetch();

			// Verify the password
			if ( $user && password_verify( $password, $user['password'] ) ) {
				// Login successful
				$order = new Order();

				// Determine discount based on completed orders count
				$totalPrices = $order->getTotalPricesByUserId( $user['id'] );
				$discount    = $this->calculateDiscountDependOnTotalPrice( $totalPrices );

				// Set session variables
				$_SESSION["city"]               = $user['city'];
				$_SESSION["user_logged_in"] = true;
				$_SESSION["discount"]           = $discount;
				$_SESSION["email"]              = $email;
				$_SESSION["first_name"]         = $user['first_name'];
				$_SESSION["house_number"]       = $user['house_number'];
				$_SESSION["last_name"]          = $user['last_name'];
				$_SESSION["role"]               = $user['role'];
				$_SESSION["street"]             = $user['street'];
				$_SESSION['user_id']        = $user['id'];

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

	private function calculateDiscountDependOnTotalPrice( $totalPrice ) {
		// Define discount tiers and corresponding discounts
		$discountTiers = [ 100, 200, 300 ]; // Total price tiers
		$discountRates = [ 0.05, 0.10, 0.02 ]; // Corresponding discount rates

		// Iterate through tiers and find the appropriate discount rate
		$discountRate = 0; // Default discount rate
		foreach ( $discountTiers as $index => $tier ) {
			if ( $totalPrice >= $tier ) {
				$discountRate = $discountRates[ $index ];
			} else {
				break; // Stop iteration if the total price is less than the current tier
			}
		}

		return $discountRate;
	}

	public function logoutUser() {
		// Unset all session variables
		$_SESSION = [];

		// Destroy the session
		session_destroy();
	}

	public function addPhone( $userId, $phoneNumber ) {
		try {
			// Prepare the SQL statement to insert phone number into the database
			$stmt = $this->db->connection->prepare( "INSERT INTO phones (user_id, phone_number) VALUES (?, ?)" );
			$stmt->execute( [ $userId, $phoneNumber ] );
		} catch ( PDOException $e ) {
			// Error handling for phone number insertion
			$_SESSION['errors'][] = "Error adding phone number: " . $e->getMessage();

		}
	}

	public function getPhonesByUserId( $userId ) {
		try {
			// Prepare the SQL statement to retrieve phone numbers by user ID
			$stmt = $this->db->connection->prepare( "SELECT phone_number FROM phones WHERE user_id = ?" );
			$stmt->execute( [ $userId ] );

			return $stmt->fetchAll( PDO::FETCH_COLUMN );
		} catch ( PDOException $e ) {
			// Error handling for phone number retrieval
			$_SESSION['errors'][] = "Error retrieving phone numbers: " . $e->getMessage();

			return false;
		}
	}

	public function updateUserDetails( $userId, $postData ) {
		try {
			// Prepare the SQL statement to update user details
			$query = "UPDATE users SET 
                  first_name = :first_name, 
                  last_name = :last_name, 
                  city = :city, 
                  street = :street, 
                  house_number = :house_number";

			// Check if password is provided and not empty
			if ( ! empty( $postData['password'] ) && $postData['password'] === $postData['confirm_password'] ) {
				$query .= ", password = :password";
			}

			$query .= " WHERE id = :id";

			$stmt = $this->db->connection->prepare( $query );

			// Bind parameters
			$stmt->bindParam( ':first_name', $postData['first_name'] );
			$stmt->bindParam( ':last_name', $postData['last_name'] );
			$stmt->bindParam( ':city', $postData['city'] );
			$stmt->bindParam( ':street', $postData['street'] );
			$stmt->bindParam( ':house_number', $postData['house_number'] );
			$stmt->bindParam( ':id', $userId );

			// Bind password parameter if provided
			if ( ! empty( $postData['password'] ) && $postData['password'] === $postData['confirm_password'] ) {
				$hashedPassword = password_hash( $postData['password'], PASSWORD_DEFAULT );
				$stmt->bindParam( ':password', $hashedPassword );
			}

			// Execute the statement
			$stmt->execute();

			return true;
		} catch ( PDOException $e ) {
			// Error handling for database update
			$_SESSION['errors'][] = "Error updating user details: " . $e->getMessage();

			return false;
		}
	}

	public function updateUserPhones( $userId, $phoneNumbers ) {
		try {
			// Start a transaction
			$this->db->connection->beginTransaction();

			// Remove existing phone numbers
			$stmtDelete = $this->db->connection->prepare( "DELETE FROM phones WHERE user_id = :user_id" );
			$stmtDelete->bindParam( ':user_id', $userId );
			$stmtDelete->execute();

			// Add new phone numbers
			$stmtInsert = $this->db->connection->prepare( "INSERT INTO phones (user_id, phone_number) VALUES (:user_id, :phone_number)" );
			$stmtInsert->bindParam( ':user_id', $userId );

			foreach ( $phoneNumbers as $phoneNumber ) {
				$stmtInsert->bindParam( ':phone_number', $phoneNumber );
				$stmtInsert->execute();
			}

			// Commit the transaction
			$this->db->connection->commit();

			return true;
		} catch ( PDOException $e ) {
			// Roll back the transaction if an error occurs
			$this->db->connection->rollBack();
			$_SESSION['errors'][] = "Error updating user phones: " . $e->getMessage();

			return false;
		}
	}

	public function reloadUserInfo() {
		try {
			// Retrieve the user information from the database based on the session's user_id
			$stmt = $this->db->connection->prepare( "SELECT * FROM users WHERE id = ?" );
			$stmt->execute( [ $_SESSION['user_id'] ] );
			$user = $stmt->fetch();

			// Check if user information is found
			if ( $user ) {
				// Update session variables with the new user information
				$_SESSION['email']        = $user['email'];
				$_SESSION['first_name']   = $user['first_name'];
				$_SESSION['last_name']    = $user['last_name'];
				$_SESSION['city']         = $user['city'];
				$_SESSION['street']       = $user['street'];
				$_SESSION['house_number'] = $user['house_number'];

				return true;
			}

			// User information not found
			return false;
		} catch ( PDOException $e ) {
			// Error occurred while reloading user information
			$_SESSION['errors'][] = $e->getMessage();

			return false;
		}
	}

	public function deleteUserAccount( $userId ) {
		try {
			// Prepare the SQL statement to delete the user account
			$stmt = $this->db->connection->prepare( "DELETE FROM users WHERE id = ?" );
			$stmt->execute( [ $userId ] );
		} catch ( PDOException $e ) {
			// Error handling for account deletion
			$_SESSION['errors'][] = "Error deleting user account: " . $e->getMessage();
		}
	}

}