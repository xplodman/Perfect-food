<?php

use PerfectFood\Classes\Branch;

include_once 'includes/header.php';

// Check if the user is already logged in, if not, redirect to login page
if ( ! isset( $_SESSION["user_logged_in"] ) || $_SESSION["user_logged_in"] !== true ) {
	header( "Location: login.php" );
	exit;
}

$branch   = new Branch();
$branches = $branch->retrieveAllBranches();

include_once 'includes/partial/alerts.php';
?>

<div class="container">
	<h1>Book a Table</h1>
	<form method="post" action="submit-booking.php">
		<div class="mb-3">
			<label for="branch" class="form-label">Select Branch:</label>
			<select class="form-select" id="branch" name="branch" required>
				<option value="" disabled selected>Select Branch</option>
				<?php foreach ( $branches as $branch ): ?>
					<option data-max-guests="<?php echo $branch['max_guests'] ?>" value="<?php echo $branch['id']; ?>">
						<?php echo $branch['name'] . ' - ' . $branch['location'] . ' - ' . $branch['contact_info'] . ' (Max guests: '.$branch['max_guests'].')'; ?>
					</option>
				<?php endforeach; ?>

			</select>
		</div>
		<div class="mb-3">
			<label for="date" class="form-label">Date:</label>
			<input type="date" class="form-control" id="date" name="date" required>
		</div>
		<div class="mb-3">
			<label for="time" class="form-label">Time:</label>
			<input type="time" class="form-control" id="time" name="time" required>
		</div>
		<div class="mb-3">
			<label for="guests" class="form-label">Number of Guests:</label>
			<input type="number" class="form-control" id="guests" name="guests" required max="">
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</div>

<?php include_once 'includes/footer.php' ?>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const branchSelect = document.getElementById('branch');
        const guestsInput = document.getElementById('guests');

        branchSelect.addEventListener('change', function() {
            const selectedBranch = branchSelect.options[branchSelect.selectedIndex];
            const maxGuests = selectedBranch.getAttribute('data-max-guests');
            guestsInput.setAttribute('max', maxGuests);
        });
    });
</script>
