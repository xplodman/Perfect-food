<?php
use PerfectFood\Classes\Menu;
use PerfectFood\Classes\MenuItem;

include_once 'includes/header.php';

$menuItems = new MenuItem();

// Check if the user is an admin
if ($_SESSION["role"] !== 'admin') {
	$_SESSION['errors'][] = 'You do not have access to this page';
	header('Location: index.php');
	exit();
}

// Check if the form has been submitted
if ($_SERVER["REQUEST_METHOD"] === "POST") {
	// Check if all required fields are set and not empty
	if (!empty($_POST['item_id']) && !empty($_POST['name']) && !empty($_POST['description']) && !empty($_POST['price']) && !empty($_POST['image']) && !empty($_POST['menu_id'])) {
		$params = [
			'name' => $_POST['name'],
			'description' => $_POST['description'],
			'price' => $_POST['price'],
			'image' => $_POST['image'],
			'menu_id' => $_POST['menu_id'],
		];

		$success = $menuItems->updateMenuItem($_POST['item_id'], $params);

		// Check if the update was successful
		if ($success) {
			// Set a success message and redirect to the index page
			$_SESSION['info'][] = "Item updated successfully.";
			header("Location: index.php");
			exit;
		}

		$_SESSION['errors'][] = "Error updating menu item.";
		header("Location: edit-item.php?item_id=" . $_POST['item_id']);
		exit;
	}

	// Handle case where required fields are missing
	$_SESSION['errors'][] = "Please fill in all required fields.";
}

// Check if item ID is provided in the URL
if (!isset($_GET['item_id']) || !is_numeric($_GET['item_id'])) {
	$_SESSION['errors'][] = 'Invalid item ID.';
	header('Location: index.php');
	exit();
}

$itemId = $_GET['item_id'];
$menuItems = new MenuItem();
$itemDetails = $menuItems->getItemDetailsById($itemId);

// Check if item exists
if (!$itemDetails) {
	$_SESSION['errors'][] = 'Item not found.';
	header('Location: index.php');
	exit();
}

$menu = new Menu();

// Fetch menus
$menus = $menu->getMenus();

include_once 'includes/partial/alerts.php'
?>
<div class="container">
	<h2>Edit Item</h2>
	<!-- Display item details and edit form here -->
	<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
		<input type="hidden" name="item_id" value="<?php echo $itemDetails['id']; ?>">
		<div class="row">
			<div class="col-md-12 mb-3">
				<label for="name" class="form-label">Name</label>
				<input required type="text" class="form-control" id="name" name="name" value="<?php echo $itemDetails['name']; ?>">
			</div>
			<div class="col-md-12 mb-3">
				<label for="description" class="form-label">Description</label>
				<textarea required class="form-control" id="description" name="description"><?php echo $itemDetails['description']; ?></textarea>
			</div>
			<div class="col-md-4 mb-3">
				<label for="price" class="form-label">Price</label>
				<input required type="number" class="form-control" step=".01" id="price" name="price" value="<?php echo $itemDetails['price']; ?>">
			</div>
			<div class="col-md-4 mb-3">
				<label for="image" class="form-label">Image URL</label>
				<input required type="text" class="form-control" id="image" name="image" value="<?php echo $itemDetails['image']; ?>">
			</div>
			<div class="col-md-4 mb-3">
				<label for="menu_id" class="form-label">Menu:</label>
				<select required id="menu_id" name="menu_id" class="form-select">
					<?php foreach ($menus as $menu) : ?>
						<option value="<?php echo $menu['id']; ?>" <?php echo ($itemDetails['menu_id'] == $menu['id']) ? 'selected' : ''; ?>><?php echo $menu['name']; ?></option>
					<?php endforeach; ?>
				</select>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Save Changes</button>
	</form>
</div>

<?php include_once 'includes/footer.php'; ?>
