<?php
require_once 'includes/autoload.php';

session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/all.min.css">
	<link rel="stylesheet" href="assets/css/fontawesome.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<style>
		/* Ensure the body takes up at least the full height of the viewport */
		html{
			height:100%;
		}
		body {
    
   			flex-direction: column;
    		min-height: 100%;
			display: flex;
	
		}
		a {
        	text-decoration: none;
        }

		</style>
</head>
<body>
<?php include_once 'includes/add_to_cart_handle.php'; ?>
<?php include_once 'includes/nav.php'; ?>
<div class="container justify-content-center">
