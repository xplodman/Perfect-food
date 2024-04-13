<?php
// Include necessary files and classes
use PerfectFood\Classes\Book;

include_once 'includes/header.php';
$book = new Book();
// Check if the form is submitted
if ( $_SERVER["REQUEST_METHOD"] === "POST" ) {
	$userId = $_SESSION['user_id'];

	$book->book( $userId, $_POST['branch'], $_POST['date'], $_POST['time'], $_POST['guests'] );
}

// If form is not submitted, redirect to the booking page
header( "Location: booking.php" );
exit();
