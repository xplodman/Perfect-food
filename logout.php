<?php
// Include the Customer class
use PerfectFood\Classes\User\Customer;

// Include the autoload.php file
require_once './includes/autoload.php';


// Start the session
session_start();

// Create a new Customer object
$customer = new Customer();

// Call the logoutUser method
$customer->logoutUser();

// Redirect the user to the homepage or login page
header( "Location: index.php" );
exit;
