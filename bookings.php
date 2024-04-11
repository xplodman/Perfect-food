<?php
include_once './includes/header.php';

use PerfectFood\Classes\Book;
use PerfectFood\Classes\Evaluate;

// Check if the user is already logged in, if not, redirect to login page
if ( ! isset( $_SESSION["customer_logged_in"] ) || $_SESSION["customer_logged_in"] !== true ) {
	header( "Location: login.php" );
	exit;
}

$book       = new Book();
$evaluation = new Evaluate();
$customerId = $_SESSION['customer_id'];

// Retrieve orders for the logged-in customer
$bookings = $book->getBookingsByCustomerId( $customerId );
include_once './includes/partial/alerts.php';

?>

<div class="container">
	<h1>Bookings</h1>

	<?php if ( empty( $bookings ) ) : ?>
		<p>No Bookings found.</p>
	<?php else : ?>
		<table class="table table-striped">
			<thead>
			<tr>
				<th>#</th>
				<th>Branch</th>
				<th>Status</th>
				<th>Date</th>
				<th>Time</th>
				<th>Guests</th>
				<th>Rating</th>
				<th>Actions</th>

			</tr>
			</thead>
			<tbody>
			<?php foreach ( $bookings as $index => $booking ) : ?>
				<tr>
					<td><?php echo $index + 1; ?></td>
					<td><?php echo $booking['branch_name']; ?></td>
					<td><?php echo $booking['status']; ?></td>
					<td><?php echo $booking['booking_date']; ?></td>
					<td><?php echo $booking['booking_time']; ?></td>
					<td><?php echo $booking['guests']; ?></td>
					<td>
						<?php if ( $booking['status'] === 'completed' ) :
							if ( $evaluation->entityHasRating( $booking['id'], 'booking' ) ):
								$rating = $evaluation->getEntityRating( $booking['id'], 'booking' );
								?>
								<span class="rating-value"><?php echo $rating['rating']; ?></span>
								<br>
								<small class="form-text text-muted"><?php echo $rating['comment']; ?></small>
							<?php else: ?>
								<form method="get" action="evaluate.php">
									<input type="hidden" name="type" value="booking">
									<input type="hidden" name="id" value="<?php echo $booking['id']; ?>">
									<button type="submit" class="btn btn-info">Rate</button>
								</form>
							<?php endif; ?>
						<?php endif; ?>
					</td>
					<td>
						<?php
						// Convert booking creation time to Unix timestamp
						$bookingCreationTime = strtotime($booking['created_at']) + 7200;

						// Get current Unix timestamp
						$currentTime = time();

						// Calculate time difference in seconds
						$timeDifference = $currentTime - $bookingCreationTime;

						// If the time difference is less than or equal to 1 hour, display the delete button
						if ($timeDifference <= 3600 && $booking['status'] === 'pending') :
							?>
							<form method="post" action="delete_booking.php">
								<input type="hidden" name="booking_id" value="<?php echo $booking['id']; ?>">
								<button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this booking?')">Delete</button>
							</form>
						<?php endif; ?>
					</td>
				</tr>
			<?php endforeach; ?>
			</tbody>

		</table>
	<?php endif; ?>
</div>

<?php include_once './includes/footer.php'; ?>
