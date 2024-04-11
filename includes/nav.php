<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<a class="nav-link" href="index.php">Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="menus.php">Menus</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="search.php">Search</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="booking.php">Booking</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="branches.php">Branches</a>
				</li>
			</ul>
			<ul class="navbar-nav mb-2 mb-lg-0">
				<?php if ( ! empty( $_SESSION['customer_logged_in'] ) ): ?>
					<li class="nav-item">
						<a class="nav-link" href="bookings.php">My bookings</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="orders.php">My Orders</a>
					</li>
					<li class="nav-item me-2">
						<a href="account.php" class="btn btn-outline-light nav-link"><?php echo $_SESSION['email']; ?></a>
					</li>
					<li class="nav-item">
						<a class="btn btn-danger" href="logout.php">Logout</a>
					</li>
					<!-- Cart Icon with Count -->
					<li class="nav-item">
						<a class="nav-link" href="cart.php">
							<img width="30" src="assets/images/icons-cart.png">
							<?php
							// Display the count of items in the cart
							$cartCount = isset( $_SESSION['cart'] ) ? array_sum( $_SESSION['cart'] ) : 0;
							?>
							<span class="badge bg-primary"><?php echo $cartCount; ?></span>
						</a>
					</li>
				<?php else: ?>
					<li class="nav-item me-2">
						<a class="btn btn-success" href="login.php">Login</a>
					</li>
					<li class="nav-item">
						<a class="btn btn-success" href="register.php">Register</a>
					</li>
				<?php endif; ?>
			</ul>
		</div>
	</div>
</nav>