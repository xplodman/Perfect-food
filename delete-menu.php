<?php

use FamilyRestaurant\Classes\Menu;

include_once 'includes/header.php';

// Check if the user is logged in
if ( ! isset( $_SESSION["user_logged_in"] ) || $_SESSION["user_logged_in"] !== true ) {
	header( "Location: login.php" );
	exit;
}

// Check if the menu ID is provided in the request
if ( ! isset( $_POST['menu_id'] ) ) {
	header( "Location: menus.php" );
	exit;
}

// Create an instance of the Menu class
$menu = new Menu();

// Get the menu ID from the request
$menuID = $_POST['menu_id'];

// Attempt to delete the menu
$menu->deleteMenu( $menuID );

// Redirect back to the menus page
header( "Location: menus.php" );
exit;
