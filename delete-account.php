<?php
include_once 'includes/header.php';

use FamilyRestaurant\Classes\User;

// Check if the user is already logged in, if yes, redirect to homepage
if ( ! isset( $_SESSION["user_logged_in"] ) || $_SESSION["user_logged_in"] !== true ) {
	header( "Location: login.php" );
	exit;
}

$user = new User();

// Retrieve user ID from session
$userId = $_SESSION['user_id'];

// Check if the form is submitted
if ( $_SERVER["REQUEST_METHOD"] === "POST" ) {
	// Perform the deletion of the user account
	$user->deleteUserAccount( $userId );

	// Log out the user
	session_unset();
	session_destroy();

	// Redirect to the login page or any other page as needed
	header( "Location: login.php" );
	exit;
}
?>
