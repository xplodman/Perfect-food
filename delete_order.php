<?php

use PerfectFood\Classes\Order;

include_once 'includes/header.php';

// Check if the user is logged in
if ( ! isset( $_SESSION["customer_logged_in"] ) || $_SESSION["customer_logged_in"] !== true ) {
	header( "Location: login.php" );
	exit;
}

// Check if the order ID is provided in the request
if ( ! isset( $_POST['order_id'] ) ) {
	header( "Location: orders.php" );
	exit;
}

// Create an instance of the Order class
$order = new Order();

// Get the order ID from the request
$orderID = $_POST['order_id'];

// Attempt to delete the order
$order->deleteOrder( $orderID );

// Redirect back to the orders page
header( "Location: orders.php" );
exit;
