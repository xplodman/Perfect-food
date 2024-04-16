<?php

use PerfectFood\Classes\Book;
use PerfectFood\Classes\MenuItem;
use PerfectFood\Classes\Order;

include_once 'includes/header.php';
include_once 'includes/partial/alerts.php';

// Initialize classes
$menuItems = new MenuItem();
$booking   = new Book();
$order     = new Order();

// Get random menu items
$randomMenuItems = $menuItems->retrieveRandomMenuItemsWithLimit( 4 );
?>

<div class="container">
	<div class="row">
		<!-- Display Random Menu Items -->
		<h2>Random Menu Items</h2>
		<div class="row">
			<?php foreach ( $randomMenuItems as $item ) : ?>
				<?php require 'includes/partial/items_card.php' ?>
			<?php endforeach; ?>
		</div>
	</div>
	<?php if ( isset( $_SESSION["user_logged_in"] ) && $_SESSION["user_logged_in"] === true ):
		// Get counts of orders for each status
		$orderStatusCounts = $order->retrieveOrderStatusCounts();
		?>
		<div class="row mb-2">
			<!-- Orders Status Counts -->
			<div class="col-md-6">
				<h2>Orders Status</h2>
				<ul class="list-group">
					<?php foreach ( $orderStatusCounts as $status => $count ) : ?>
						<li class="list-group-item"><?php echo ucfirst( $status ) . ': ' . $count; ?></li>
					<?php endforeach; ?>
				</ul>
			</div>
			<?php
			// Get counts of bookings for each status
			$bookingStatusCounts = $booking->retrieveBookingStatusCounts();
			?>
			<!-- Bookings Status Counts -->
			<div class="col-md-6">
				<h2>Bookings Status</h2>
				<ul class="list-group">
					<?php foreach ( $bookingStatusCounts as $status => $count ) : ?>
						<li class="list-group-item"><?php echo ucfirst( $status ) . ': ' . $count; ?></li>
					<?php endforeach; ?>
				</ul>
			</div>
		</div>
	<?php endif; ?>
</div>

<?php include_once 'includes/footer.php'; ?>
