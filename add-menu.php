<?php

use PerfectFood\Classes\Menu;

include_once 'includes/header.php';

$menu = new Menu();

// Check if the user is an admin
if ( $_SESSION["role"] !== 'admin' ) {
	$_SESSION['errors'][] = 'You do not have access to this page';
	header( 'Location: index.php' );
	exit();
}

// Check if the form has been submitted
if ( $_SERVER["REQUEST_METHOD"] === "POST" ) {
	// Validate form data
	$errors = [];
	if ( empty( $_POST['name'] ) ) {
		$errors[] = "Name is required.";
	}
	if ( empty( $_POST['description'] ) ) {
		$errors[] = "Description is required.";
	}

	$params = [
		'name'        => $_POST['name'],
		'description' => $_POST['description'],
		'active' => $_POST['active'],
	];

	$success = $menu->createMenu( $params );

	// Check if the item creation was successful
	if ( $success ) {
		$_SESSION['info'][] = "Item created successfully.";
		header( "Location: index.php" );
		exit;
	}

	$_SESSION['errors'][] = "Error creating menu item.";

	// If there are any validation errors, display them
	if ( ! empty( $errors ) ) {
		$_SESSION['errors'] = array_merge( $_SESSION['errors'], $errors );
		header( "Location: " . $_SERVER["PHP_SELF"] );
		exit;
	}
}

include_once 'includes/partial/alerts.php';
?>
<div class="container">
	<h2>Create menu Item</h2>
	<!-- Display item details and edit form here -->
	<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
		<div class="row">
			<div class="col-md-12 mb-3">
				<label for="name" class="form-label">Name</label>
				<input required type="text" class="form-control" id="name" name="name">
			</div>
			<div class="col-md-12 mb-3">
				<label for="description" class="form-label">Description</label>
				<textarea required class="form-control" id="description" name="description"></textarea>
			</div>
			<div class="col-md-4 mb-3">
				<label for="active" class="form-label">Active:</label>
				<!-- Hidden input for false value -->
				<input type="hidden" name="active" value="0">
				<!-- Checkbox input to toggle between true and false -->
				<input type="checkbox" id="active" name="active" value="1">
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Save Changes</button>
	</form>
</div>
<?php include_once 'includes/footer.php'; ?>
