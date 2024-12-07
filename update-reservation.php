<?php

use FamilyRestaurant\Classes\Reserve;

include_once 'includes/header.php';

// Check if the user is logged in
if ( ! isset( $_SESSION["user_logged_in"] ) || $_SESSION["user_logged_in"] !== true ) {
	header( "Location: login.php" );
	exit;
}

// Check if the user is an admin
if ( $_SESSION["role"] !== 'admin' ) {
	$_SESSION['errors'][] = 'You do not have access to this page';
	header('Location: index.php');
	exit();
}

// Check if the reservation ID is provided in the request
if ( ! isset( $_POST['reservation_id'] ) ) {
	header( "Location: reservations.php" );
	exit;
}

// Create an instance of the Reserve class
$reservation = new Reserve();

// Attempt to update the reservation
$reservation->modifyReservationStatus( $_POST['reservation_id'], $_POST['status'] );

// Redirect back to the reservations page
header( "Location: reservations.php" );
exit;
