<?php

use PerfectFood\Classes\Book;
use PerfectFood\Classes\MenuItem;
use PerfectFood\Classes\Order;

include_once 'includes/header.php';
include_once 'includes/partial/alerts.php';

if ( ! isset( $_SESSION["customer_logged_in"] ) || $_SESSION["customer_logged_in"] !== true ) {
	header( "Location: login.php" );
	exit;
}

$menuItems = new MenuItem();

$booking = new Book();
$order   = new Order();
// Retrieve customer ID from session
$customerId = $_SESSION['customer_id'];

// Count of orders for each status
$orderStatusCounts = $order->getOrderStatusCounts( $customerId );

// Count of bookings for each status
$bookingStatusCounts = $booking->getBookingStatusCounts( $customerId );

?>

<div class="container">
	<!-- Orders Status Counts -->
	<h2>Orders Status</h2>
	<ul>
		<?php foreach ( $orderStatusCounts as $status => $count ) : ?>
			<li><?php echo ucfirst( $status ) . ': ' . $count; ?></li>
		<?php endforeach; ?>
	</ul>

	<!-- Bookings Status Counts -->
	<h2>Bookings Status</h2>
	<ul>
		<?php foreach ( $bookingStatusCounts as $status => $count ) : ?>
			<li><?php echo ucfirst( $status ) . ': ' . $count; ?></li>
		<?php endforeach; ?>
	</ul>

	<!-- Display Random Menu Items -->
	<h2>Random Menu Items</h2>
	<div class="row">
		<?php foreach ( $menuItems->getMenuItemsRandomWithLimit( 4 ) as $item ): ?>
			<?php require 'includes/partial/items_card.php' ?>
		<?php endforeach; ?>
	</div>
</div>


<?php include_once 'includes/footer.php' ?>
