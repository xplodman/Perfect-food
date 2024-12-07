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

include_once 'includes/partial/user-details.php';

include_once 'includes/footer.php';