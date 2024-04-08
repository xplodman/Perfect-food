<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<a class="nav-link" href="./index.php">Home</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="./menus.php">Menus</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Search</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Request</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Booking</a>
				</li>
			</ul>
			<ul class="navbar-nav mb-2 mb-lg-0">
				<?php if ( ! empty( $_SESSION['email'] ) ): ?>
					<li class="nav-item me-2">
						<button class="btn btn-outline-light nav-link" disabled><?php echo $_SESSION['email']; ?></button>
					</li>
					<li class="nav-item">
						<a class="btn btn-danger" href="./logout.php">Logout</a>
					</li>
				<?php else: ?>
					<li class="nav-item me-2">
						<a class="btn btn-success" href="./login.php">Login</a>
					</li>
					<li class="nav-item">
						<a class="btn btn-success" href="./register.php">Register</a>
					</li>
				<?php endif; ?>
			</ul>
		</div>
	</div>
</nav>