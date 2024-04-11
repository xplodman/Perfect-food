<?php

use PerfectFood\Classes\Order;

include_once 'includes/header.php';

$order = new Order();
// Retrieve customer ID from session
$customerId = $_SESSION['customer_id'];

$order->placeOrder( $customerId, $_POST );

include_once 'includes/partial/alerts.php';
