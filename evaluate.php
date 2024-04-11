<?php
include_once './includes/header.php';

use PerfectFood\Classes\Evaluate;

// Check if the user is already logged in, if yes, redirect to homepage
if ( !isset( $_SESSION["customer_logged_in"] ) || $_SESSION["customer_logged_in"] !== true ) {
	header( "Location: index.php" );
	exit;
}

// Check if the form is submitted
if ( $_SERVER["REQUEST_METHOD"] === "POST" ) {
	$evaluate = new Evaluate();
	$evaluate->submitEvaluation($_POST['id'], $_POST['type'], $_POST['rating'], $_POST['comment']);
}

include_once './includes/partial/alerts.php'
?>
	<div class="row">
		<div class="col-md-6 offset-md-3 form-container">
			<h2 class="mb-4">Evaluation Form</h2>
			<form method="post" action="<?php echo htmlspecialchars( $_SERVER["PHP_SELF"] ); ?>">
				<input type="hidden" name="id" value="<?php echo $_GET['id']; ?>">
				<input type="hidden" name="type" value="<?php echo $_GET['type']; ?>">
				<!-- Rating input -->
				<label for="rating">Rating:</label>
				<select name="rating" id="rating" required>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>

				<!-- Comment input -->
				<div class="mb-3">
					<label for="comment" class="form-label">Comment:</label>
					<textarea class="form-control" id="comment" name="comment" rows="3"></textarea>
				</div>
				<button type="submit" class="btn btn-primary">Submit Rating</button>
			</form>
		</div>
	</div>
<?php include_once './includes/footer.php' ?>