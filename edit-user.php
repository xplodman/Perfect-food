<?php

use PerfectFood\Classes\Order;
use PerfectFood\Classes\User;

include_once 'includes/header.php';

// Check if the user is an admin
if ( $_SESSION["role"] !== 'admin' ) {
	$_SESSION['errors'][] = 'You do not have access to this page';
	header( 'Location: index.php' );
	exit();
}

$user   = new User();
$userId = $_REQUEST['user_id'];

include_once 'includes/partial/user-details.php';

$orderClass = new Order();

// Retrieve orders for the logged-in user
$orders = $orderClass->retrieveOrdersByUserId( $userId );
?>

	<div class="container">
		<h1>Orders</h1>

		<?php if ( empty( $orders ) ) : ?>
			<p>No orders found.</p>
		<?php else : ?>
			<table class="table table-striped">
				<thead>
				<tr>
					<th scope="col">#</th>
					<th>Order ID</th>
					<th>Status</th>
					<th>Total Items</th>
					<th>Total Sum</th>
					<th>Created at</th>
				</tr>
				</thead>
				<tbody>
				<?php foreach ( $orders as $index => $order ) : ?>
					<tr>
						<td><?php echo $index + 1; ?></td>
						<td><?php echo $order["id"]; ?></td>
						<td><?php echo $order["status"]; ?></td>
						<td><?php echo $order["item_count"]; ?></td>
						<td>$<?php echo number_format( $order["total_sum"] ?? 0, 2 ); ?></td>
						<td><?php echo $order["created_at"]; ?></td>
					</tr>
				<?php endforeach; ?>
				</tbody>
			</table>
		<?php endif; ?>
	</div>

<?php
include_once 'includes/footer.php';
