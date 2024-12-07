<?php

use FamilyRestaurant\Classes\User;

include_once 'includes/header.php';

// Check if the user is logged in
if ( ! isset( $_SESSION["user_logged_in"] ) || $_SESSION["user_logged_in"] !== true ) {
	header( "Location: login.php" );
	exit;
}

// Check if the user is an admin
if ( $_SESSION["role"] !== 'admin' ) {
	$_SESSION['errors'][] = 'You do not have access to this page';
	header( 'Location: index.php' );
	exit();
}

// Check if the user ID is provided in the request
if ( ! isset( $_POST['user_id'] ) ) {
	header( "Location: users.php" );
	exit;
}

// Create an instance of the User class
$user = new User();

// Get the user ID from the request
$userID = $_POST['user_id'];

// Attempt to delete the user
$user->deleteUserAccount( $userID );

// Redirect back to the users page
header( "Location: users.php" );
exit;
