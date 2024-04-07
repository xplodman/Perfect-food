<?php
include_once './includes/header.php';

use PerfectFood\Classes\User\Customer;

// Check if the user is already logged in, if yes, redirect to homepage
if ( isset( $_SESSION["customer_logged_in"] ) && $_SESSION["customer_logged_in"] === true ) {
	header( "Location: index.php" );
	exit;
}

// Check if the form is submitted
if ( $_SERVER["REQUEST_METHOD"] === "POST" ) {
	// Initialize an empty array to store validation errors
	$errors = [];

	// Retrieve form data
	$email       = $_POST['email'];
	$password    = $_POST['password'];
	$firstName   = $_POST['first_name'];
	$lastName    = $_POST['last_name'];
	$city        = $_POST['city'];
	$street      = $_POST['street'];
	$houseNumber = $_POST['house_number'];
	$phone       = $_POST['phone'];

	// Validate input dat
	if ( empty( $email ) || empty( $password ) || empty( $firstName ) || empty( $lastName ) || empty( $city ) || empty( $street ) || empty( $houseNumber ) || empty( $phone ) ) {
		$errors[] = "All fields are required.";
	}

	// If there are no validation errors, attempt registration
	if ( empty( $errors ) ) {
		// Create a new Customer object
		$customer = new Customer();

		// Attempt to register user
		if ( $customer->registerUser( $email, $password, $firstName, $lastName, $city, $street, $houseNumber, $phone ) ) {
			// Registration successful, create session
			$_SESSION["customer_logged_in"] = true;
			$_SESSION["email"]              = $email;
			header( "Location: index.php" );
			exit;
		}

		// Registration failed
		$errors[] = "Registration failed. Please try again.";
	}

	// Store errors in session for display
	$_SESSION['errors'] = $errors;
}

include_once './includes/partial/errors.php'
?>
	<div class="row">
		<div class="col-md-6 offset-md-3 form-container">
			<h2 class="mb-4">Registration Form</h2>
			<form method="post" action="<?php echo htmlspecialchars( $_SERVER["PHP_SELF"] ); ?>">
				<div class="mb-3">
					<label for="email" class="form-label">Email</label>
					<input type="email" class="form-control" id="email" name="email" required>
				</div>
				<div class="mb-3">
					<label for="password" class="form-label">Password</label>
					<input type="password" class="form-control" id="password" name="password" required>
				</div>
				<div class="row mb-3">
					<div class="col">
						<label for="first_name" class="form-label">First Name</label>
						<input type="text" class="form-control" id="first_name" name="first_name" required>
					</div>
					<div class="col">
						<label for="last_name" class="form-label">Last Name</label>
						<input type="text" class="form-control" id="last_name" name="last_name" required>
					</div>
				</div>
				<div class="mb-3">
					<label for="city" class="form-label">City</label>
					<input type="text" class="form-control" id="city" name="city" required>
				</div>
				<div class="mb-3">
					<label for="street" class="form-label">Street</label>
					<input type="text" class="form-control" id="street" name="street" required>
				</div>
				<div class="row mb-3">
					<div class="col">
						<label for="house_number" class="form-label">House Number</label>
						<input type="text" class="form-control" id="house_number" name="house_number" required>
					</div>
					<div class="col">
						<label for="phone" class="form-label">Phone</label>
						<input type="text" class="form-control" id="phone" name="phone" required>
					</div>
				</div>
				<button type="submit" class="btn btn-primary">Register</button>
			</form>
		</div>
	</div>
<?php include_once './includes/footer.php' ?>