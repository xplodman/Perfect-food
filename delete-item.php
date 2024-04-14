<?php

use PerfectFood\Classes\MenuItem;

include_once 'includes/header.php';

// Check if the user is logged in
if ( ! isset( $_SESSION["user_logged_in"] ) || $_SESSION["user_logged_in"] !== true ) {
	header( "Location: login.php" );
	exit;
}

// Check if the item ID is provided in the request
if ( ! isset( $_POST['item_id'] ) ) {
	header( "Location: items.php" );
	exit;
}

// Create an instance of the MenuItem class
$item = new MenuItem();

// Get the item ID from the request
$itemID = $_POST['item_id'];

// Attempt to delete the item
$item->deleteMenuItem( $itemID );

// Redirect back to the menus page
header( "Location: menus.php" );
exit;
