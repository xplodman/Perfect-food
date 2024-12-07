<?php
// Include necessary files and classes
use FamilyRestaurant\Classes\Reserve;

include_once 'includes/header.php';
$reserve = new Reserve();
// Check if the form is submitted
if ( $_SERVER["REQUEST_METHOD"] === "POST" ) {
	$userId = $_SESSION['user_id'];

	$reserve->makeReservation( $userId, $_POST['branch'], $_POST['date'], $_POST['time'], $_POST['guests'] );
}

// If form is not submitted, redirect to the reservation page
header( "Location: reservation.php" );
exit();
