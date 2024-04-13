<?php
use PerfectFood\Classes\Menu;
use PerfectFood\Classes\MenuItem;

include_once 'includes/header.php';

// Redirect to login page if user is not logged in
if ( ! isset( $_SESSION["user_logged_in"] ) || $_SESSION["user_logged_in"] !== true ) {
	header( "Location: login.php" );
	exit;
}

$menu = new Menu();
$menuItems = new MenuItem();

// Fetch menus
$menus = $menu->getMenus();

// Fetch all menu items
$allItems = $menuItems->getAllMenuItems();

// Handle price filter
$minPrice = !empty($_GET['min_price']) ? max(0, (float)$_GET['min_price']) : 0; // Ensure min price is not negative
$maxPrice = !empty($_GET['max_price']) ? max($minPrice, (float)$_GET['max_price']) : PHP_FLOAT_MAX; // Ensure max price is not less than min price

$menuId = $_GET['menu_id'] ?? '';
$filteredItems = $menuItems->getMenuItemsByPriceRange($minPrice, $maxPrice, $menuId);
?>

<div class="container">
	<!-- Price filter form -->
	<form action="search.php" method="GET" class="mb-3">
		<div class="row">
			<div class="col-md-4">
				<label for="min_price" class="form-label">Minimum Price:</label>
				<input type="number" id="min_price" name="min_price" class="form-control" value="<?php echo isset( $_GET['min_price'] ) ? htmlspecialchars( $_GET['min_price'] ) : ''; ?>" placeholder="Enter minimum price">
			</div>
			<div class="col-md-4">
				<label for="max_price" class="form-label">Maximum Price:</label>
				<input type="number" id="max_price" name="max_price" class="form-control" value="<?php echo isset( $_GET['max_price'] ) ? htmlspecialchars( $_GET['max_price'] ) : ''; ?>" placeholder="Enter maximum price">
			</div>
			<div class="col-md-4">
				<label for="menu_id" class="form-label">Menu:</label>
				<select id="menu_id" name="menu_id" class="form-select">
					<option value="">All Menus</option>
					<?php foreach ($menus as $menu) : ?>
						<option value="<?php echo $menu['id']; ?>" <?php echo ($menuId == $menu['id']) ? 'selected' : ''; ?>><?php echo $menu['name']; ?></option>
					<?php endforeach; ?>
				</select>
			</div>
		</div>
		<button type="submit" class="btn btn-primary mt-2">Apply Filter</button>
	</form>

	<!-- Display filtered menu items -->
	<div class="row">
		<?php if (empty($filteredItems)) : ?>
			<div class="col-12">
				<div class="alert alert-info" role="alert">
					No items found within the selected price range and menu.
				</div>
			</div>
		<?php else : ?>
			<?php foreach ($filteredItems as $item) : ?>
				<?php require 'includes/partial/items_card.php'; ?>
			<?php endforeach; ?>
		<?php endif; ?>
	</div>
</div>

<?php include_once 'includes/footer.php'; ?>
