<?php
include_once 'includes/header.php';

use PerfectFood\Classes\Evaluate;
use PerfectFood\Classes\Order;

// Check if the user is already logged in, if not, redirect to login page
if ( ! isset( $_SESSION["user_logged_in"] ) || $_SESSION["user_logged_in"] !== true ) {
	header( "Location: login.php" );
	exit;
}

$orderClass = new Order();
$evaluation = new Evaluate();
$userId     = $_SESSION['user_id'];

// Retrieve orders for the logged-in user
$orders = $orderClass->getOrdersBasedOnUserRole();

include_once 'includes/partial/alerts.php';

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
				<?php if ( $_SESSION["role"] === 'admin' ): ?>
					<th>User</th>
				<?php endif; ?>
				<th>Status</th>
				<th>Total Items</th>
				<th>Total Sum</th>
				<th>Created at</th>
				<th>Rating</th>
				<th>Actions</th>
			</tr>
			</thead>
			<tbody>
			<?php foreach ( $orders as $index => $order ) : ?>
				<tr>
					<td><?php echo $index + 1; ?></td>
					<td><?php echo $order["id"]; ?></td>
					<?php if ( $_SESSION["role"] === 'admin' ): ?>
						<td><?php echo $order['email']; ?></td>
					<?php endif; ?>
					<td><?php echo $order["status"]; ?></td>
					<td><?php echo $order["item_count"]; ?></td>
					<td>$<?php echo number_format( $order["total_sum"] ?? 0, 2 ); ?></td>
					<td><?php echo $order["created_at"]; ?></td>
					<td>
						<?php if ( $order['status'] === 'completed' ) :
							if ( $evaluation->entityHasRating( $order['id'], 'order' ) ):
								$rating = $evaluation->getEntityRating( $order['id'], 'order' );
								?>
								<span class="rating-value"><?php echo $rating['rating']; ?></span>
								<br>
								<small class="form-text text-muted"><?php echo $rating['comment']; ?></small>
							<?php elseif ( $_SESSION["role"] !== 'admin' ): ?>
								<form method="get" action="evaluate.php">
									<input type="hidden" name="type" value="order">
									<input type="hidden" name="id" value="<?php echo $order['id']; ?>">
									<button type="submit" class="btn btn-info">Rate</button>
								</form>
							<?php endif; ?>
						<?php endif; ?>
					</td>
					<td>
						<?php if ( $_SESSION["role"] === 'admin' && ( $order['status'] === 'pending' || $order['status'] === 'in_progress' ) ) :
							if ( $order['status'] === 'pending' ) : ?>
								<form method="post" action="update-order.php">
									<input type="hidden" name="order_id" value="<?php echo $order['id']; ?>">
									<input type="hidden" name="status" value="in_progress">
									<button type="submit" class="btn btn-primary m-2">Mark as In Progress</button>
								</form>
							<?php elseif ( $order['status'] === 'in_progress' ) : ?>
								<form method="post" action="update-order.php">
									<input type="hidden" name="order_id" value="<?php echo $order['id']; ?>">
									<input type="hidden" name="status" value="completed">
									<button type="submit" class="btn btn-success m-2">Mark as Completed</button>
								</form>
							<?php endif; ?>
							<form method="post" action="update-order.php">
								<input type="hidden" name="order_id" value="<?php echo $order['id']; ?>">
								<input type="hidden" name="status" value="cancelled">
								<button type="submit" class="btn btn-danger m-2">Mark as Cancelled</button>
							</form>
						<?php elseif ( $_SESSION["role"] !== 'admin' && $order['status'] === 'pending' ) :
							$orderCreationTime = strtotime( $order['created_at'] ) + 7200;
							$currentTime = time();
							$timeDifference = $currentTime - $orderCreationTime;
							if ( $timeDifference <= 3600 ) : ?>
								<form method="post" action="delete-order.php">
									<input type="hidden" name="order_id" value="<?php echo $order['id']; ?>">
									<button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this order?')">Delete</button>
								</form>
							<?php endif;
						endif; ?>
					</td>
				</tr>
			<?php endforeach; ?>
			</tbody>
		</table>
	<?php endif; ?>
</div>

<?php include_once 'includes/footer.php'; ?>
