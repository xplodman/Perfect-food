<?php
use PerfectFood\Classes\Menu;
use PerfectFood\Classes\MenuItem;

include_once './includes/header.php';

$menu = new Menu();
$menuItems = new MenuItem();

// Fetch menus
$menus = $menu->getMenus();

// Fetch all menu items
$allItems = $menuItems->getAllMenuItems();
?>

<div class="container">
	<!-- Menu tabs -->
	<ul class="nav nav-tabs mb-4" id="menuTabs" role="tablist">
		<!-- All tab -->
		<li class="nav-item">
			<a class="nav-link active" id="allTab" data-bs-toggle="tab" href="#allMenu" role="tab">All</a>
		</li>
		<?php foreach ($menus as $menu) : ?>
			<li class="nav-item">
				<a class="nav-link" id="menuTab<?= $menu['id'] ?>" data-bs-toggle="tab" href="#menu<?= $menu['id'] ?>" role="tab"><?= $menu['name'] ?></a>
			</li>
		<?php endforeach; ?>
	</ul>

	<!-- Menu items cards -->
	<div class="tab-content" id="menuTabsContent">
		<!-- All tab content -->
		<div class="tab-pane fade show active" id="allMenu" role="tabpanel">
			<div class="row">
				<?php foreach ($allItems as $item) : ?>
					<?php require './includes/partial/items_card.php' ?>
				<?php endforeach; ?>
			</div>
		</div>

		<!-- Menu tabs content -->
		<?php foreach ($menus as $menu) : ?>
			<div class="tab-pane fade" id="menu<?= $menu['id'] ?>" role="tabpanel">
				<div class="row">
					<?php
					// Fetch menu items for the current menu
					$items = $menuItems->getMenuItemsByMenuId($menu['id']);
					foreach ($items as $item) : ?>
						<div class="col-md-4">
							<div class="card mb-3">
								<img src="<?= $item['image'] ?>" class="card-img-top" alt="<?= $item['name'] ?>">
								<div class="card-body">
									<h5 class="card-title"><?= $item['name'] ?></h5>
									<p class="card-text"><?= $item['description'] ?></p>
									<p class="card-text">Price: $<?= $item['price'] ?></p>
								</div>
							</div>
						</div>
					<?php endforeach; ?>
				</div>
			</div>
		<?php endforeach; ?>
	</div>
</div>

<?php include_once './includes/footer.php' ?>
