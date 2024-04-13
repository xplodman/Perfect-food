<?php
use PerfectFood\Classes\Menu;

include_once 'includes/header.php';

// Check if the user is an admin
if ($_SESSION["role"] !== 'admin') {
	$_SESSION['errors'][] = 'You do not have access to this page';
	header('Location: index.php');
	exit();
}

$menu = new Menu();

// Check if the form has been submitted
if ($_SERVER["REQUEST_METHOD"] === "POST") {
	// Check if all required fields are set and not empty
	if (!empty($_POST['menu_id']) && !empty($_POST['name']) && !empty($_POST['description']) && isset($_POST['active'])) {
		$params = [
			'name' => $_POST['name'],
			'description' => $_POST['description'],
			'active' => $_POST['active'],
		];

		$success = $menu->updateMenu($_POST['menu_id'], $params);

		// Check if the update was successful
		if ($success) {
			// Set a success message and redirect to the index page
			$_SESSION['info'][] = "Menu updated successfully.";
			header("Location: index.php");
			exit;
		}

		$_SESSION['errors'][] = "Error updating menu.";
		header("Location: edit-menu.php?menu_id=" . $_POST['menu_id']);
		exit;
	}

	// Handle case where required fields are missing
	$_SESSION['errors'][] = "Please fill in all required fields.";
}

// Check if item ID is provided in the URL
if (!isset($_GET['menu_id']) || !is_numeric($_GET['menu_id'])) {
	$_SESSION['errors'][] = 'Invalid item ID.';
	header('Location: index.php');
	exit();
}

$itemId = $_GET['menu_id'];
$menuDetails = $menu->getMenuDetailsById($itemId);

// Check if item exists
if (!$menuDetails) {
	$_SESSION['errors'][] = 'Item not found.';
	header('Location: index.php');
	exit();
}

include_once 'includes/partial/alerts.php'
?>
<div class="container">
	<h2>Edit Menu</h2>
	<!-- Display item details and edit form here -->
	<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
		<input type="hidden" name="menu_id" value="<?php echo $menuDetails['id']; ?>">
		<div class="row">
			<div class="col-md-12 mb-3">
				<label for="name" class="form-label">Name</label>
				<input required type="text" class="form-control" id="name" name="name" value="<?php echo $menuDetails['name']; ?>">
			</div>
			<div class="col-md-12 mb-3">
				<label for="description" class="form-label">Description</label>
				<textarea required class="form-control" id="description" name="description"><?php echo $menuDetails['description']; ?></textarea>
			</div>
			<div class="col-md-4 mb-3">
				<label for="active" class="form-label">Active:</label>
				<!-- Hidden input for false value -->
				<input type="hidden" name="active" value="0">
				<!-- Checkbox input to toggle between true and false -->
				<input type="checkbox" id="active" name="active" value="1" <?php echo $menuDetails['active'] ? 'checked' : ''; ?>>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Save Changes</button>
	</form>
</div>

<?php include_once 'includes/footer.php'; ?>
