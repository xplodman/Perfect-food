<?php

use PerfectFood\Classes\Order;

include_once 'includes/header.php';

$order = new Order();
// Retrieve user ID from session
$userId = $_SESSION['user_id'];

$order->placeOrder( $userId, $_POST );

include_once 'includes/partial/alerts.php';
