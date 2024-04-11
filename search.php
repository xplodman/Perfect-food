<?php

use PerfectFood\Classes\Menu;
use PerfectFood\Classes\MenuItem;

include_once 'includes/header.php';

$menu      = new Menu();
$menuItems = new MenuItem();

// Fetch menus
$menus = $menu->getMenus();

// Fetch all menu items
$allItems = $menuItems->getAllMenuItems();

// Handle price filter
$minPrice      = isset( $_GET['min_price'] ) ? (float) $_GET['min_price'] : 0;
$maxPrice      = isset( $_GET['max_price'] ) ? (float) $_GET['max_price'] : PHP_FLOAT_MAX;
$filteredItems = $menuItems->getMenuItemsByPriceRange( $minPrice, $maxPrice );
?>

<div class="container">
	<!-- Add price filter -->
	<form action="search.php" method="GET" class="mb-3">
		<div class="row">
			<div class="col-md-6">
				<label for="min_price" class="form-label">Minimum Price:</label>
				<input type="number" id="min_price" name="min_price" class="form-control" value="<?php echo isset( $_GET['min_price'] ) ? htmlspecialchars( $_GET['min_price'] ) : ''; ?>" placeholder="Enter minimum price">
			</div>
			<div class="col-md-6">
				<label for="max_price" class="form-label">Maximum Price:</label>
				<input type="number" id="max_price" name="max_price" class="form-control" value="<?php echo isset( $_GET['max_price'] ) ? htmlspecialchars( $_GET['max_price'] ) : ''; ?>" placeholder="Enter maximum price">
			</div>
		</div>
		<button type="submit" class="btn btn-primary mt-2">Apply Filter</button>
	</form>

	<!-- Menu items cards -->
	<div class="row">
		<?php if ( empty( $filteredItems ) ) : ?>
			<div class="col-12">
				<p>No items found within the selected price range.</p>
			</div>
		<?php else : ?>
			<?php foreach ( $filteredItems as $item ) : ?>
				<?php require 'includes/partial/items_card.php'; ?>
			<?php endforeach; ?>
		<?php endif; ?>
	</div>

</div>

<?php include_once 'includes/footer.php'; ?>
