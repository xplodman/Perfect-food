<?php

use PerfectFood\Classes\Book;
use PerfectFood\Classes\MenuItem;
use PerfectFood\Classes\Order;

include_once 'includes/header.php';
include_once 'includes/partial/alerts.php';

// Redirect to login page if user is not logged in
if ( ! isset( $_SESSION["customer_logged_in"] ) || $_SESSION["customer_logged_in"] !== true ) {
	header( "Location: login.php" );
	exit;
}

// Initialize classes
$menuItems = new MenuItem();
$booking   = new Book();
$order     = new Order();

// Retrieve customer ID from session
$customerId = $_SESSION['customer_id'];

// Get counts of orders for each status
$orderStatusCounts = $order->getOrderStatusCounts( $customerId );

// Get counts of bookings for each status
$bookingStatusCounts = $booking->getBookingStatusCounts( $customerId );

// Get random menu items
$randomMenuItems = $menuItems->getMenuItemsRandomWithLimit( 4 );
?>

<div class="container">
	<div class="row mb-2">
		<!-- Orders Status Counts -->
		<div class="col-md-4">
			<h2>Orders Status</h2>
			<ul class="list-group">
				<?php foreach ( $orderStatusCounts as $status => $count ) : ?>
					<li class="list-group-item"><?php echo ucfirst( $status ) . ': ' . $count; ?></li>
				<?php endforeach; ?>
			</ul>
		</div>

		<!-- Bookings Status Counts -->
		<div class="col-md-4">
			<h2>Bookings Status</h2>
			<ul class="list-group">
				<?php foreach ( $bookingStatusCounts as $status => $count ) : ?>
					<li class="list-group-item"><?php echo ucfirst( $status ) . ': ' . $count; ?></li>
				<?php endforeach; ?>
			</ul>
		</div>
	</div>
	<div class="row">
		<!-- Display Random Menu Items -->
		<h2>Random Menu Items</h2>
		<div class="row">
			<?php foreach ( $randomMenuItems as $item ) : ?>
				<?php require 'includes/partial/items_card.php' ?>
			<?php endforeach; ?>
		</div>
	</div>
</div>

<?php include_once 'includes/footer.php'; ?>
