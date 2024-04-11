<?php
include_once './includes/header.php';

use PerfectFood\Classes\User\Customer;

// Check if the user is already logged in, if yes, redirect to homepage
if (!isset($_SESSION["customer_logged_in"]) || $_SESSION["customer_logged_in"] !== true) {
	header("Location: login.php");
	exit;
}

$customer = new Customer();

// Retrieve customer ID from session
$customerId = $_SESSION['customer_id'];

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] === "POST") {
	// Perform the deletion of the user account
	$customer->deleteCustomerAccount($customerId);

	// Log out the user
	session_unset();
	session_destroy();

	// Redirect to the login page or any other page as needed
	header("Location: login.php");
	exit;
}
?>
