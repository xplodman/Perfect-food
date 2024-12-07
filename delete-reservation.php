<?php

use FamilyRestaurant\Classes\Reserve;

include_once 'includes/header.php';

// Check if the user is logged in
if ( ! isset( $_SESSION["user_logged_in"] ) || $_SESSION["user_logged_in"] !== true ) {
	header( "Location: login.php" );
	exit;
}

// Check if the reservation ID is provided in the request
if ( ! isset( $_POST['reservation_id'] ) ) {
	header( "Location: reservations.php" );
	exit;
}

// Create an instance of the Reserve class
$reservation = new Reserve();

// Get the reservation ID from the request
$reservationId = $_POST['reservation_id'];

// Attempt to delete the reservation
$reservation->deleteReservation( $reservationId );

// Redirect back to the reservations page
header( "Location: reservations.php" );
exit;
