<?php
include_once 'includes/header.php';

use FamilyRestaurant\Classes\User;

// Check if the user is already logged in, if yes, redirect to homepage
if ( isset( $_SESSION["user_logged_in"] ) && $_SESSION["user_logged_in"] === true ) {
	header( "Location: index.php" );
	exit;
}

if ( $_SERVER["REQUEST_METHOD"] === "POST" ) {
	// Create a new User object
	$user = new User();

	// Retrieve email and password from the form
	$email    = $_POST['email'];
	$password = $_POST['password'];

	// Attempt to login
	if ( $user->authenticateUser( $email, $password ) ) {
		// Login successful, create session
		$_SESSION["user_logged_in"] = true;
		$_SESSION["email"]              = $email;
		header( "Location: index.php" );
		exit;
	}
}
include_once 'includes/partial/alerts.php'
?>
	<div class="row">
		<div class="col-md-6 offset-md-3">
			<h2 class="mb-4">Login Form</h2>
			<form method="post" action="<?php echo $_SERVER["PHP_SELF"]; ?>">
				<div class="mb-3">
					<label for="email" class="form-label">Email</label>
					<input type="email" class="form-control" id="email" name="email" required>
				</div>
				<div class="mb-3">
					<label for="password" class="form-label">Password</label>
					<input type="password" class="form-control" id="password" name="password" required>
				</div>
				<button type="submit" class="btn btn-primary">Login</button>
			</form>
		</div>
	</div>
<?php include_once 'includes/footer.php' ?>