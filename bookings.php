<?php
include_once 'includes/header.php';

use PerfectFood\Classes\Book;
use PerfectFood\Classes\Evaluate;

// Check if the user is already logged in, if not, redirect to login page
if ( ! isset( $_SESSION["user_logged_in"] ) || $_SESSION["user_logged_in"] !== true ) {
	header( "Location: login.php" );
	exit;
}

$book            = new Book();
$evaluationClass = new Evaluate();
$showAll         = isset( $_GET['show_all'] ) && $_GET['show_all'] === '1';

// Retrieve bookings for the logged-in customer
$bookings = $book->retrieveBookingsBasedOnUserRole( $showAll );
include_once 'includes/partial/alerts.php';

?>

<div class="container">
	<h1>Bookings</h1>
	<!-- Checkbox to toggle showing all Bookings -->
	<form method="get" action="<?php echo $_SERVER['PHP_SELF']; ?>">
		<div class="form-check">
			<input class="form-check-input" type="checkbox" value="1" id="showAllCheckbox" name="show_all" <?php echo $showAll ? 'checked' : ''; ?>>
			<label class="form-check-label" for="showAllCheckbox">
				Show All Bookings
			</label>
		</div>
		<button type="submit" class="btn btn-primary mt-3">Apply</button>
	</form>

	<?php if ( empty( $bookings ) ) : ?>
		<p>No Bookings found.</p>
	<?php else : ?>
		<table class="table table-striped">
			<thead>
			<tr>
				<th>#</th>
				<th>Booking ID</th>
				<?php if ( $_SESSION["role"] === 'admin' ): ?>
					<th>User</th>
				<?php endif; ?>
				<th>Branch</th>
				<th>Status</th>
				<th>Date</th>
				<th>Time</th>
				<th>Guests</th>
				<th>Evaluation</th>
				<th>Actions</th>

			</tr>
			</thead>
			<tbody>
			<?php foreach ( $bookings as $index => $booking ) : ?>
				<tr>
					<td><?php echo $index + 1; ?></td>
					<td><?php echo $booking['id']; ?></td>
					<?php if ( $_SESSION["role"] === 'admin' ): ?>
						<td><?php echo $booking['email']; ?></td>
					<?php endif; ?>
					<td><?php echo $booking['branch_name']; ?></td>
					<td><?php echo $booking['status']; ?></td>
					<td><?php echo $booking['booking_date']; ?></td>
					<td><?php echo $booking['booking_time']; ?></td>
					<td><?php echo $booking['guests']; ?></td>
					<td>
						<?php if ( $booking['status'] === 'completed' ) :
							if ( $evaluationClass->hasEvaluationForEntity( $booking['id'], 'booking' ) ) :
								$evaluation = $evaluationClass->getEntityEvaluationDetails( $booking['id'], 'booking' );
								if ( ! empty( $evaluation ) ): ?>
									<span class="evaluation-value"><?php echo $evaluation['rating']; ?></span>
									<br>
									<small class="form-text text-muted"><?php echo $evaluation['comment']; ?></small>
								<?php endif; ?>
							<?php elseif ( $_SESSION["role"] !== 'admin' ): ?>
								<form method="get" action="evaluate.php">
									<input type="hidden" name="type" value="booking">
									<input type="hidden" name="id" value="<?php echo $booking['id']; ?>">
									<button type="submit" class="btn btn-info">Rate</button>
								</form>
							<?php endif;
						endif; ?>
					</td>
					<td>
						<?php if (($_SESSION["role"] === 'admin' || $_SESSION["role"] === 'branch_manager') && ( $booking['status'] === 'pending' || $booking['status'] === 'in_progress' ) ) :
							if ( $booking['status'] === 'pending' ) : ?>
								<form method="post" action="update-booking.php">
									<input type="hidden" name="booking_id" value="<?php echo $booking['id']; ?>">
									<input type="hidden" name="status" value="in_progress">
									<button type="submit" class="btn btn-primary m-2">Mark as In Progress</button>
								</form>
							<?php elseif ( $_SESSION["role"] === 'branch_manager' && $booking['status'] === 'in_progress' ) : ?>
								<form method="post" action="update-booking.php">
									<input type="hidden" name="booking_id" value="<?php echo $booking['id']; ?>">
									<input type="hidden" name="status" value="completed">
									<button type="submit" class="btn btn-success m-2">Mark as Completed</button>
								</form>
							<?php endif; ?>
							<form method="post" action="update-booking.php">
								<input type="hidden" name="booking_id" value="<?php echo $booking['id']; ?>">
								<input type="hidden" name="status" value="cancelled">
								<button type="submit" class="btn btn-danger m-2">Mark as Cancelled</button>
							</form>
						<?php elseif ( $_SESSION["role"] !== 'admin' && $booking['status'] === 'pending' ) :
							$bookingCreationTime = strtotime( $booking['created_at'] ) + 3600; // 1 hour.
							$currentTime = time();
							$timeDifference = $currentTime - $bookingCreationTime;
							if ( $timeDifference <= 3600 ) : ?>
								<form method="post" action="delete-booking.php">
									<input type="hidden" name="booking_id" value="<?php echo $booking['id']; ?>">
									<button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this booking?')">Delete</button>
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
