<?php

use PerfectFood\Classes\Branch;

include_once 'includes/header.php';

$branch   = new Branch();
$branches = $branch->getAllBranches();

include_once 'includes/partial/alerts.php';
?>

<div class="container">
	<h1>Book a Table</h1>
	<form method="post" action="submit_booking.php">
		<div class="mb-3">
			<label for="branch" class="form-label">Select Branch:</label>
			<select class="form-select" id="branch" name="branch" required>
				<option value="" disabled selected>Select Branch</option>
				<?php foreach ( $branches as $branch ): ?>
					<option value="<?php echo $branch['id']; ?>">
						<?php echo $branch['name']; ?> - <?php echo $branch['location']; ?> - <?php echo $branch['contact_info']; ?>
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
			<input type="number" class="form-control" id="guests" name="guests" required>
		</div>
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
</div>

<?php include_once 'includes/footer.php' ?>
