<?php

use PerfectFood\Classes\Menu;
use PerfectFood\Classes\MenuItem;

include_once 'includes/header.php';

$menu      = new Menu();
$menuItems = new MenuItem();

// Fetch menus
$menus = $menu->retrieveMenus();

// Fetch all menu items
$allItems = $menuItems->retrieveAllMenuItems();
include_once 'includes/partial/alerts.php'
?>

<div class="container">
	<!-- Add menu and menu item buttons -->
	<div class="d-flex justify-content-end mb-4">
		<?php if (isset($_SESSION["role"]) && ($_SESSION["role"] === 'admin' || $_SESSION["role"] === 'branch_manager')) : ?>
			<a href="add-menu.php" class="btn btn-success ms-2">Add Menu</a>
			<a href="add-item.php" class="btn btn-success ms-2">Add Menu Item</a>
		<?php endif; ?>
	</div>

	<!-- Menu tabs -->
	<ul class="nav nav-tabs mb-4" id="menuTabs" role="tablist">
		<!-- All tab -->
		<li class="nav-item">
			<a class="nav-link active" id="allTab" data-bs-toggle="tab" href="#allMenu" role="tab">All</a>
		</li>
		<?php foreach ( $menus as $menu ) : ?>
			<li class="nav-item d-flex align-items-center"> <!-- Use flexbox utilities -->
				<a class="nav-link" id="menuTab<?php echo $menu['id'] ?>" data-bs-toggle="tab" href="#menu<?php echo $menu['id'] ?>" role="tab"><?php echo $menu['name'] ?></a>
				<?php if (isset($_SESSION["role"]) && ($_SESSION["role"] === 'admin' || $_SESSION["role"] === 'branch_manager')) : ?>
					<!-- Edit Link -->
					<a href="edit-menu.php?menu_id=<?php echo $menu['id']; ?>" title="Edit" class="me-2 ms-2">
						<i class="bi bi-pencil-square"></i>
					</a>
				<?php endif; ?>
			</li>
		<?php endforeach; ?>
	</ul>

	<!-- Menu items cards -->
	<div class="tab-content" id="menuTabsContent">
		<!-- All tab content -->
		<div class="tab-pane fade show active" id="allMenu" role="tabpanel">
			<div class="row">
				<?php foreach ( $allItems as $item ) : ?>
					<?php require 'includes/partial/items_card.php' ?>
				<?php endforeach; ?>
			</div>
		</div>

		<!-- Menu tabs content -->
		<?php foreach ( $menus as $menu ) : ?>
			<div class="tab-pane fade" id="menu<?php echo $menu['id'] ?>" role="tabpanel">
				<div class="row">
					<?php
					// Fetch menu items for the current menu
					$items = $menuItems->retrieveMenuItemsByMenuId( $menu['id'] );
					foreach ( $items as $item ) : ?>
						<?php require 'includes/partial/items_card.php' ?>
					<?php endforeach; ?>
				</div>
			</div>
		<?php endforeach; ?>
	</div>
</div>

<?php include_once 'includes/footer.php' ?>
