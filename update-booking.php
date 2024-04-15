<?php

use PerfectFood\Classes\Book;

include_once 'includes/header.php';

// Check if the user is logged in
if ( ! isset( $_SESSION["user_logged_in"] ) || $_SESSION["user_logged_in"] !== true ) {
	header( "Location: login.php" );
	exit;
}

// Check if the user is an admin
if ($_SESSION["role"] !== 'admin') {
	$_SESSION['errors'][] = 'You do not have access to this page';
	header('Location: index.php');
	exit();
}

// Check if the booking ID is provided in the request
if ( ! isset( $_POST['booking_id'] ) ) {
	header( "Location: bookings.php" );
	exit;
}

// Create an instance of the Book class
$booking = new Book();

// Attempt to update the booking
$booking->modifyBookingStatus( $_POST['booking_id'], $_POST['status'] );

// Redirect back to the bookings page
header( "Location: bookings.php" );
exit;
