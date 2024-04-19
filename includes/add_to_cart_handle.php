<?php
// Check if the item id is sent via POST
if ( ( $_SERVER["REQUEST_METHOD"] === "POST" ) && isset( $_POST['item_id'] ) ) {
	// Check if the user is not logged in, if yes, redirect to login
	if ( ! isset( $_SESSION["user_logged_in"] ) || $_SESSION["user_logged_in"] !== true ) {
		header( "Location: login.php" );
		exit;
	}

	// Increment the count of the item in the session cart array
	$_SESSION['cart'][ $_POST['item_id'] ] = isset( $_SESSION['cart'][ $_POST['item_id'] ] ) ? $_SESSION['cart'][ $_POST['item_id'] ] + 1 : 1;
}
