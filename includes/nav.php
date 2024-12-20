<nav class="navbar navbar-expand-lg navbar-dark bg-success mb-4">
	<div class="container">
		<a class="navbar-brand" href="index.php">Family Restaurant</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<?php
				$navItems = [
					[ 'Home', 'index.php', 'house' ],
					[ 'Menus', 'menus.php', 'list' ],
					[ 'Search', 'search.php', 'search' ],
					[ 'Branches', 'branches.php', 'map' ],
				];

				// Conditionally add additional navigation items based on the user's role
				if ( isset($_SESSION["role"]) && $_SESSION["role"] === 'admin' ) {
					$navItems[] = [ 'All users', 'users.php', 'people' ];
					$navItems[] = [ 'All reservations', 'reservations.php', 'calendar' ];
					$navItems[] = [ 'All orders', 'orders.php', 'list' ];
				}else{
					// Additional navigation items for non-admin users
					$navItems[] = [ 'Reservation', 'reservation.php', 'calendar' ];
				}

				// Convert to constant if needed
				define( 'NAV_ITEMS', $navItems );

				// Loop through navigation items and generate the links dynamically
				foreach ( NAV_ITEMS as $item ) :
					?>
					<li class="nav-item">
						<a class="nav-link" href="<?php echo $item[1]; ?>">
							<i class="bi bi-<?php echo $item[2]; ?> me-1"></i>
							<?php echo $item[0]; ?>
						</a>
					</li>
				<?php endforeach; ?>
			</ul>
			<ul class="navbar-nav">
				<?php if ( ! empty( $_SESSION['user_logged_in'] ) ) : ?>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<?php echo $_SESSION['email']; ?>
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="account.php">Account</a></li>
							<?php if ( $_SESSION["role"] !== 'admin' ): ?>
								<li><a class="dropdown-item" href="reservations.php">My Reservations</a></li>
								<li><a class="dropdown-item" href="orders.php">My Orders</a></li>
							<?php endif; ?>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="logout.php">Logout</a></li>
						</ul>
					</li>
					<!-- Cart Icon with Count -->
					<li class="nav-item">
						<a class="nav-link" href="cart.php">
							<i class="bi bi-cart3 me-2"></i>
							<span class="d-none d-sm-inline">Cart</span>
							<?php
							// Display the count of items in the cart
							$cartCount = isset( $_SESSION['cart'] ) ? array_sum( $_SESSION['cart'] ) : 0;
							?>
							<?php if ( $cartCount > 0 ) : ?>
								<span class="badge bg-light text-primary"><?php echo $cartCount; ?></span>
							<?php endif; ?>
						</a>
					</li>
				<?php else : ?>
					<li class="nav-item">
						<a class="nav-link" href="login.php">Login</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="register.php">Register</a>
					</li>
				<?php endif; ?>
			</ul>
		</div>
	</div>
</nav>
