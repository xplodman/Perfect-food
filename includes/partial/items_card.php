<div class="col-md-3 mb-4">
	<div class="card">
		<form method="post" action="<?php echo $_SERVER["PHP_SELF"]; ?>">
			<input type="hidden" name="item_id" value="<?php echo $item['id']; ?>">
			<img src="<?php echo $item['image']; ?>" class="card-img-top" alt="<?php echo $item['name']; ?>">
			<div class="card-body">
				<h5 class="card-title"><?php echo $item['name']; ?></h5>
				<p class="card-text"><?php echo $item['description']; ?></p>
				<p class="card-text">
					<?php if ($_SESSION["discount"] > 0): ?>
						<strong>Price:</strong> <del><?php echo $item['price']; ?></del>
						<br>
						<strong>Discounted Price:</strong> <?php echo $item['price'] - $_SESSION["discount"]; ?>
				<?php else: ?>
						<strong>Price:</strong> <?php echo $item['price']; ?>
				<?php endif; ?>
				</p>
				<button type="submit" class="btn btn-primary">Add to Cart</button>
			</div>
		</form>
	</div>
</div>
