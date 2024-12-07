<?php

use FamilyRestaurant\Classes\Reserve;
use FamilyRestaurant\Classes\Evaluate;
use FamilyRestaurant\Classes\MenuItem;
use FamilyRestaurant\Classes\Order;

include_once 'includes/header.php';
include_once 'includes/partial/alerts.php';

// Initialize classes
$menuItems = new MenuItem();
$reservation   = new Reserve();
$order     = new Order();
$evaluate     = new Evaluate();

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
				<div class="card mb-3">
					<div class="card-body">
						<h5 class="card-title">Orders Status Summary</h5>
						<ul>
							<?php foreach ( $orderStatusCounts as $status => $count ) : ?>
								<li><?php echo ucfirst( $status ) . ': ' . $count; ?></li>
							<?php endforeach; ?>
						</ul>
					</div>
				</div>
			</div>
			<?php
			// Get counts of reservations for each status
			$reservationStatusCounts = $reservation->retrieveReservationStatusCounts();
			?>
			<!-- Reservations Status Counts -->
			<div class="col-md-6">
				<div class="card mb-3">
					<div class="card-body">
						<h5 class="card-title">Reservations Status Summary</h5>
						<ul>
							<?php foreach ( $reservationStatusCounts as $status => $count ) : ?>
								<li><?php echo ucfirst( $status ) . ': ' . $count; ?></li>
							<?php endforeach; ?>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<?php if ( $_SESSION["role"] === 'admin' ): ?>
		<div class="row">
			<div class="col-md-6">
				<div class="card mb-3">
					<div class="card-body">
						<h5 class="card-title">Orders Ratings Summary</h5>
						<ul>
							<li>Total Ratings Today: <span><?php echo $evaluate->totalRatingsToday('order'); ?></span></li>
							<li>Average Rating Today: <span><?php echo $evaluate->averageRatingToday('order'); ?></span></li>
							<li>Total Ratings This Month: <span><?php echo $evaluate->totalRatingsThisMonth('order'); ?></span></li>
							<li>Average Rating This Month: <span><?php echo $evaluate->averageRatingThisMonth('order'); ?></span></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card mb-3">
					<div class="card-body">
						<h5 class="card-title">Reservations Ratings Summary</h5>
						<ul>
							<li>Total Ratings Today: <span><?php echo $evaluate->totalRatingsToday('reservation'); ?></span></li>
							<li>Average Rating Today: <span><?php echo $evaluate->averageRatingToday('reservation'); ?></span></li>
							<li>Total Ratings This Month: <span><?php echo $evaluate->totalRatingsThisMonth('reservation'); ?></span></li>
							<li>Average Rating This Month: <span><?php echo $evaluate->averageRatingThisMonth('reservation'); ?></span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	<?php endif; ?>
	<?php endif; ?>
</div>

<?php include_once 'includes/footer.php'; ?>
