<?php

use PerfectFood\Classes\MenuItem;

include_once './includes/header.php';

$menuItems = new MenuItem();
?>

<div class="row">
	<?php foreach ( $menuItems->getMenuItemsRandomWithLimit(4) as $item ): ?>
	<?php require './includes/partial/items_card.php' ?>
	<?php endforeach; ?>
</div>

<?php include_once './includes/footer.php' ?>
