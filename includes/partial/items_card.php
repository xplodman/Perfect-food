<div class="col-md-3 mb-4">
	<div class="card h-100">
		<form method="post" action="<?php echo $_SERVER["PHP_SELF"]; ?>">
			<input type="hidden" name="item_id" value="<?php echo $item['id']; ?>">
			<img src="<?php echo $item['image']; ?>" class="card-img-top img-fluid" style="height: 16rem;object-fit: cover;width: 100%;" alt="<?php echo $item['name']; ?>">
			<div class="card-body">
				<h5 class="card-title"><?php echo $item['name']; ?></h5>
				<p class="card-text"><?php echo $item['description']; ?></p>
				<p class="card-text">
					<?php if ( isset( $_SESSION["discount"] ) && $_SESSION["discount"] > 0 ) : ?>
						<strong>Price:</strong>
						<del><?php echo $item['price']; ?> EGP</del>
						<br>
						<strong>Discounted Price:</strong> <?php echo $item['price'] - $_SESSION["discount"]." EGP"; ?>
					<?php else : ?>
						<strong>Price:</strong> <?php echo $item['price']." EGP"; ?>
					<?php endif; ?>
				</p>
				<button type="submit" class="btn btn-primary">Add to Cart</button>
			</div>
		</form>
		<?php if ( isset($_SESSION["role"]) && ($_SESSION["role"] === 'admin' || $_SESSION["role"] === 'branch_manager') ): ?>
			<!-- Edit Link -->
			<a class="edit-link position-absolute bottom-0 end-0 p-2" href="edit-item.php?item_id=<?php echo $item['id']; ?>" title="Edit">
				<i class="bi bi-pencil-square"></i>
			</a>
		<?php endif; ?>
	</div>
</div>
