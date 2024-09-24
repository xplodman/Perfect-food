<?php

use PerfectFood\Classes\Order;

include_once 'includes/header.php';

// Check if the user is logged in
if ( ! isset( $_SESSION["user_logged_in"] ) || $_SESSION["user_logged_in"] !== true ) {
	header( "Location: login.php" );
	exit;
}

// Check if the order ID is provided in the request
if ( ! isset( $_GET['order_id'] ) ) {
	header( "Location: orders.php" );
	exit;
}

// Create an instance of the Book class
$orderCLass = new Order();

// Attempt to update the order
$orderDetails = $orderCLass->retrieveOrderById( $_GET['order_id'] );

if(empty($orderDetails)){
	header( "Location: orders.php" );
	exit;
}
$orderMainDetails = $orderDetails[0];
?>

<div class="container">
	<h1>Order Details #<?php echo $orderMainDetails['order_id'] ?></h1>
	<p><strong>Order ID:</strong> <?php echo $orderMainDetails['order_id']; ?></p>
	<p><strong>Customer Name:</strong> <?php echo $orderMainDetails['first_name'] . " " . $orderMainDetails['last_name']; ?></p>
	<p><strong>Email:</strong> <?php echo $orderMainDetails['email']; ?></p>
	<p><strong>City:</strong> <?php echo $orderMainDetails['city']; ?></p>
	<p><strong>Street:</strong> <?php echo $orderMainDetails['street']; ?>, House No: <?php echo $orderMainDetails['house_number']; ?></p>
	<p><strong>Phone 1:</strong> <?php echo $orderMainDetails['phone_1']; ?></p>
	<p><strong>Phone 2:</strong> <?php echo $orderMainDetails['phone_2'] ?: 'N/A'; ?></p>
	<p><strong>Phone 3:</strong> <?php echo $orderMainDetails['phone_3'] ?: 'N/A'; ?></p>
	<p><strong>Order Created At:</strong> <?php echo $orderMainDetails['created_at']; ?></p>
	<p><strong>Order Status:</strong> <?php echo $orderMainDetails['status']; ?></p>

	<h2>Order Items</h2>
	<table border="1" class="table table-striped">
		<thead>
		<tr>
			<th>Item Name</th>
			<th>Quantity</th>
			<th>Price Before Discount</th>
			<th>Price After Discount</th>
		</tr>
		</thead>
		<tbody>
		<?php
		$totalPriceBefore = 0;
		$totalPriceAfter = 0;

		foreach ($orderDetails as $item) {
			$totalPriceBefore += $item['price'] * $item['quantity'];
			$totalPriceAfter += $item['price_after_discount'] * $item['quantity'];
			?>
			<tr>
				<td><?php echo $item['name']; ?></td>
				<td><?php echo $item['quantity']; ?></td>
				<td><?php echo number_format($item['price'], 2); ?> EGP</td>
				<td><?php echo number_format($item['price_after_discount'], 2); ?> EGP</td>
			</tr>
			<?php
		}
		?>
		</tbody>
	</table>

	<!-- Display total prices -->
	<h3>Total Price Before Discount: <?php echo number_format($totalPriceBefore, 2); ?> EGP</h3>
	<h3>Total Price After Discount: <?php echo number_format($totalPriceAfter, 2); ?> EGP</h3>

	<div class="d-flex justify-content-between">
		<?php if ( ($_SESSION["role"] === 'admin' || $_SESSION["role"] === 'branch_manager') && ( $orderMainDetails['status'] === 'pending' || $orderMainDetails['status'] === 'in_progress' ) ) :
			if ( $orderMainDetails['status'] === 'pending' ) : ?>
				<form method="post" action="update-order.php">
					<input type="hidden" name="order_id" value="<?php echo $orderMainDetails['order_id']; ?>">
					<input type="hidden" name="status" value="in_progress">
					<button type="submit" class="btn btn-primary m-2">Mark as In Progress</button>
				</form>
			<?php elseif ( $_SESSION["role"] === 'branch_manager' && $orderMainDetails['status'] === 'in_progress' ) : ?>
				<form method="post" action="update-order.php">
					<input type="hidden" name="order_id" value="<?php echo $orderMainDetails['order_id']; ?>">
					<input type="hidden" name="status" value="completed">
					<button type="submit" class="btn btn-success m-2">Mark as Completed</button>
				</form>
			<?php endif; ?>
			<form method="post" action="update-order.php">
				<input type="hidden" name="order_id" value="<?php echo $orderMainDetails['order_id']; ?>">
				<input type="hidden" name="status" value="cancelled">
				<button type="submit" class="btn btn-danger m-2">Mark as Cancelled</button>
			</form>
		<?php elseif ( $_SESSION["role"] !== 'admin' && $orderMainDetails['status'] === 'pending' ) :
			$orderCreationTime = strtotime( $orderMainDetails['created_at'] ) + 3600; // 1 hour.
			$currentTime = time();
			$timeDifference = $currentTime - $orderCreationTime;
			if ( $timeDifference <= 3600 ) : ?>
				<form method="post" action="delete-order.php">
					<input type="hidden" name="order_id" value="<?php echo $orderMainDetails['order_id']; ?>">
					<button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this order?')">Delete</button>
				</form>
			<?php endif;
		endif; ?>
	</div>
</div>

