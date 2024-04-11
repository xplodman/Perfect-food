<?php
include_once 'includes/header.php';

use PerfectFood\Classes\User\Customer;

// Check if the user is already logged in, if yes, redirect to homepage
if ( ! isset( $_SESSION["customer_logged_in"] ) || $_SESSION["customer_logged_in"] !== true ) {
	header( "Location: login.php" );
	exit;
}

$customer = new Customer();

// Retrieve customer ID from session
$customerId = $_SESSION['customer_id'];

// Check if the form is submitted
if ( $_SERVER["REQUEST_METHOD"] === "POST" ) {
	// Update customer details
	$customer->updateCustomerDetails( $customerId, $_POST );

	// Update phone numbers
	$customer->updateCustomerPhones( $customerId, $_POST["phones"] );

	// Reload customer information
	$customer->reloadCustomerInfo();
}

// Retrieve phone numbers associated with the customer ID
$phoneNumbers = $customer->getPhonesByCustomerId( $customerId );
include_once 'includes/partial/alerts.php'
?>
	<div class="row">
		<div class="col-md-6 offset-md-3 form-container">
			<h2 class="mb-4">Account details</h2>
			<form method="post" action="<?php echo htmlspecialchars( $_SERVER["PHP_SELF"] ); ?>">
				<div class="mb-3">
					<label for="email" class="form-label">Email</label>
					<input type="email" class="form-control" disabled id="email" value="<?php echo $_SESSION["email"]; ?>">
				</div>
				<div class="row mb-3">
					<div class="col">
						<label for="password" class="form-label">New Password</label>
						<input type="password" class="form-control" id="password" name="password">
					</div>
					<div class="col">
						<label for="confirm_password" class="form-label">Confirm Password</label>
						<input type="password" class="form-control" id="confirm_password" name="confirm_password">
					</div>
					<small class="form-text text-muted">Leave blank to keep the current password.</small>
				</div>
				<div class="row mb-3">
					<div class="col">
						<label for="first_name" class="form-label">First Name</label>
						<input type="text" class="form-control" id="first_name" name="first_name" required value="<?php echo $_SESSION["first_name"]; ?>">
					</div>
					<div class="col">
						<label for="last_name" class="form-label">Last Name</label>
						<input type="text" class="form-control" id="last_name" name="last_name" required value="<?php echo $_SESSION["last_name"]; ?>">
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-4">
						<label for="city" class="form-label">City</label>
						<input type="text" class="form-control" id="city" name="city" required value="<?php echo $_SESSION["city"]; ?>">
					</div>
					<div class="col-4">
						<label for="street" class="form-label">Street</label>
						<input type="text" class="form-control" id="street" name="street" required value="<?php echo $_SESSION["street"]; ?>">
					</div>
					<div class="col-4">
						<label for="house_number" class="form-label">House Number</label>
						<input type="text" class="form-control" id="house_number" name="house_number" required value="<?php echo $_SESSION["house_number"]; ?>">
					</div>
				</div>
				<div class="row mb-3">
					<?php for ( $i = 1; $i <= 3; $i ++ ): ?>
						<div class="col-4">
							<label for="phone_<?php echo $i; ?>" class="form-label">Phone #<?php echo $i; ?></label>
							<input type="text" class="form-control" id="phone_<?php echo $i; ?>" name="phones[]" value="<?php echo $phoneNumbers[ $i - 1 ]; ?>">
						</div>
					<?php endfor; ?>
				</div>
				<button type="submit" class="btn btn-primary">Save</button>
			</form>

			<!-- Delete Account Form -->
			<form method="post" action="delete_account.php" class="mt-3">
				<button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete your account?')">Delete Account</button>
			</form>
		</div>
	</div>
<?php include_once 'includes/footer.php' ?>