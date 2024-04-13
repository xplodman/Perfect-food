<?php

use PerfectFood\Classes\Order;

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

// Check if the order ID is provided in the request
if ( ! isset( $_POST['order_id'] ) ) {
	header( "Location: orders.php" );
	exit;
}

// Create an instance of the Book class
$order = new Order();

// Attempt to update the order
$order->updateOrder( $_POST['order_id'], $_POST['status'] );

// Redirect back to the orders page
header( "Location: orders.php" );
exit;
