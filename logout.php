<?php
// Include the User class
use PerfectFood\Classes\User;

// Include the autoload.php file
require_once 'includes/autoload.php';


// Start the session
session_start();

// Create a new User object
$user = new User();

// Call the logoutUser method
$user->logoutUser();

// Redirect the user to the homepage or login page
header( "Location: index.php" );
exit;
