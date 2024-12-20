<?php

// Check if the form is submitted
if ( $_SERVER["REQUEST_METHOD"] === "POST" ) {
	// Update user details
	$user->updateUserProfile( $userId, $_POST );

	// Update phone numbers
	$user->updateUserPhoneList( $userId, $_POST["phones"] );

	// Reload user information
	$user->refreshSessionUserData();

	$_SESSION['info'][] = "User updated successfully.";
	header( 'Location: index.php' );
	exit();
}
$userDetails = $user->retrieveUserDetails( $userId );

// Retrieve phone numbers associated with the user ID
$phoneNumbers = $user->retrieveUserPhoneNumbers( $userId );
include_once 'includes/partial/alerts.php';

?>
<div class="row">
	<h2 class="mb-4">Account details</h2>
	<form method="post" action="<?php echo htmlspecialchars( $_SERVER["PHP_SELF"] ); ?>">
		<input type="hidden" value="<?php echo $userDetails["id"] ?>" name="user_id">
		<div class="mb-3">
			<label for="email" class="form-label">Email</label>
			<input type="email" class="form-control" disabled id="email" value="<?php echo $userDetails["email"]; ?>">
		</div>
		<div class="row mb-3">
			<div class="col">
				<label for="password" class="form-label">New Password</label>
				<input type="password" class="form-control" id="password" name="password" pattern=".{8,}" >
			</div>
			<div class="col">
				<label for="confirm_password" class="form-label">Confirm Password</label>
				<input type="password" class="form-control" id="confirm_password" name="confirm_password" pattern=".{8,}">
			</div>
			<small class="form-text text-muted">Leave blank to keep the current password.</small>
			<small class="form-text text-muted">Password must be at least 8 characters.</small>
		</div>
		<div class="row mb-3">
			<div class="col">
				<label for="first_name" class="form-label">First Name</label>
				<input pattern="[A-Za-z][A-Za-z\s]*" type="text" class="form-control" id="first_name" name="first_name" required value="<?php echo $userDetails["first_name"]; ?>">
			</div>
			<div class="col">
				<label for="middle_name" class="form-label">Middle Name</label>
				<input pattern="[A-Za-z][A-Za-z\s]*" type="text" class="form-control" id="middle_name" name="middle_name" required value="<?php echo $userDetails["middle_name"]; ?>">
			</div>
			<div class="col">
				<label for="last_name" class="form-label">Last Name</label>
				<input pattern="[A-Za-z][A-Za-z\s]*" type="text" class="form-control" id="last_name" name="last_name" required value="<?php echo $userDetails["last_name"]; ?>">
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-4">
				<label for="city" class="form-label">City</label>
				<input type="text" class="form-control" id="city" name="city" required value="<?php echo $userDetails["city"]; ?>">
			</div>
			<div class="col-4">
				<label for="street" class="form-label">Street</label>
				<input type="text" class="form-control" id="street" name="street" required value="<?php echo $userDetails["street"]; ?>">
			</div>
			<div class="col-4">
				<label for="house_number" class="form-label">House Number</label>
				<input type="text" class="form-control" id="house_number" name="house_number" required value="<?php echo $userDetails["house_number"]; ?>">
			</div>
		</div>
		<div class="row mb-3">
			<?php for ( $i = 1; $i <= 3; $i ++ ): ?>
				<div class="col-4">
					<label for="phone_<?php echo $i; ?>" class="form-label">Phone #<?php echo $i; ?></label>
					<input pattern="\d+" type="text" class="form-control" id="phone_<?php echo $i; ?>" name="phones[]" value="<?php echo $phoneNumbers[ $i - 1 ] ?? ''; ?>">
				</div>
			<?php endfor; ?>
		</div>
		<div class="row mb-3">
			<div class="col-4">
				<input name="role" type="hidden" value="<?php echo $userDetails['role'] ?>">
				<?php if ( $_SESSION["role"] === 'admin' ) : ?>
					<label for="role" class="form-label">Role</label>

					<select id="role" name="role" class="form-select">
						<option <?php echo $userDetails["role"] == 'admin' ? 'selected' : ''; ?> value="admin">Admin</option>
						<option <?php echo $userDetails["role"] == 'customer' ? 'selected' : ''; ?> value="customer">Customer</option>
					</select>
				<?php endif; ?>
			</div>
		</div>
		<button type="submit" class="btn btn-primary mb-3">Save</button>
	</form>

	<?php if ( $userDetails["role"] !== 'admin' ) : ?>
		<!-- Delete Account Form -->
		<form method="post" action="delete-account.php" class="mt-3 mb-3">
			<button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete your account?')">Delete Account</button>
		</form>
	<?php endif; ?>
</div>
