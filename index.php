<?php include_once './includes/header.php';
$menuItems = [
	[
		'name'        => 'Vegetable Salad on Plate',
		'image'       => '/assets/images/pexels-photo-1640777.jpeg',
		'description' => 'Fresh mixed vegetable salad served on a plate.',
		'price'       => '$8.99',
	],
	[
		'name'        => 'Fries With Leaves Dish',
		'image'       => '/assets/images/pexels-photo-718742.webp',
		'description' => 'A delicious combination of crispy fries served with fresh salad leaves.',
		'price'       => '$6.99',
	],
	[
		'name'        => 'Fries and Burger on Plate',
		'image'       => '/assets/images/pexels-photo-70497.webp',
		'description' => 'Crispy fries served with a juicy burger on a plate.',
		'price'       => '$10.99',
	],
	[
		'name'        => 'Pasta With Tomato and Basil',
		'image'       => '/assets/images/pexels-photo-1279330.webp',
		'description' => 'Classic pasta dish with tomato sauce and fresh basil leaves.',
		'price'       => '$12.99',
	],
];
?>

<div class="row">
	<?php foreach ( $menuItems as $item ): ?>
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
	<?php endforeach; ?>
</div>

<?php include_once './includes/footer.php' ?>
