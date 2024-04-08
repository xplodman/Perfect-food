<div class="col-md-3 mb-4">
	<div class="card">
		<img src="<?php echo $item['image']; ?>" class="card-img-top" alt="<?php echo $item['name']; ?>">
		<div class="card-body">
			<h5 class="card-title"><?php echo $item['name']; ?></h5>
			<p class="card-text"><?php echo $item['description']; ?></p>
			<p class="card-text"><strong>Price:</strong> <?php echo $item['price']; ?></p>
			<button class="btn btn-primary">Add to Cart</button>
		</div>
	</div>
</div>