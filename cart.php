<?php

use PerfectFood\Classes\MenuItem;
use PerfectFood\Classes\User\Customer;

include_once 'includes/header.php';

// Check if the user is already logged in, if yes, redirect to homepage
if ( ! isset( $_SESSION["customer_logged_in"] ) || $_SESSION["customer_logged_in"] !== true ) {
	header( "Location: login.php" );
	exit;
}

// Check if the user is already logged in, if yes, redirect to homepage
if ( empty( $_SESSION['cart'] ) ) {
	header( "Location: menus.php" );
	exit;
}

$menuItems = new MenuItem();
$customer  = new Customer();

// Initialize an array to store cart items with their details
$cartItems = array();

$totalPrice = 0;

// Iterate through each item ID in the cart session
foreach ( $_SESSION['cart'] as $itemId => $quantity ) {
	// Retrieve item details from the database based on the item ID
	$itemDetails = $menuItems->getItemDetailsById( $itemId );

	// Check if item details are found
	if ( $itemDetails ) {
		// Add item details to the cartItems array
		$cartItems[] = array(
			'id'       => $itemId,
			'name'     => $itemDetails['name'],
			'price'    => $itemDetails['price'],
			'quantity' => $quantity,
			'subtotal' => $itemDetails['price'] * $quantity,
		);

		$totalPrice += $itemDetails['price'] * $quantity;
	}
}

// Retrieve customer ID from session
$customerId = $_SESSION['customer_id'];

// Retrieve phone numbers associated with the customer ID
$phoneNumbers = $customer->getPhonesByCustomerId( $customerId );
?>
<div class="container">
	<h1>Cart</h1>

	<table class="table table-striped">
		<thead>
		<tr>
			<th scope="col">#</th>
			<th>Item Name</th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Subtotal</th>
		</tr>
		</thead>
		<tbody>
		<!-- Iterate through cart items and display each item -->
		<?php foreach ( $cartItems as $index => $cartItem ): ?>
			<tr>
				<td><?php echo $index + 1; ?></td>
				<td><?php echo $cartItem["name"]; ?></td>
				<td>$<?php echo $cartItem["price"]; ?></td>
				<td><?php echo $cartItem["quantity"]; ?></td>
				<td>$<?php echo $cartItem["subtotal"]; ?></td>
			</tr>
		<?php endforeach; ?>
		</tbody>
		<tfoot>
		<tr>
			<td colspan="4" class="text-end"><strong>Total:</strong></td>
			<td>$<?php echo $totalPrice; ?></td>
		</tr>
		</tfoot>
	</table>
</div>

<!-- Customer Details Form -->
<div class="row">
	<div class="container">
		<h2 class="mb-4">Checkout</h2>
		<form method="post" action="place_order.php">
			<div class="mb-3">
				<label for="email" class="form-label">Email</label>
				<input type="email" class="form-control" id="email" name="email" required value="<?php echo $_SESSION["email"]; ?>">
			</div>
			<div class="row mb-3">
				<div class="col">
					<label for="first_name" class="form-label">First Name</label>
					<input type="text" class="form-control" id="first_name" name="first_name" required value="<?php echo $_SESSION["first_name"]; ?>">
				</div>
				<div class="col">
					<label for="last_name" class="form-label">Last Name</label>
					<input type="text" class="form-control" id="last_name" name="last_name" required value="<?php echo $_SESSION["last_name"]; ?>">
				</div>
			</div>
			<div class="row mb-3">
				<div class="col-4">
					<label for="city" class="form-label">City</label>
					<input type="text" class="form-control" id="city" name="city" required value="<?php echo $_SESSION["city"]; ?>">
				</div>
				<div class="col-4">
					<label for="street" class="form-label">Street</label>
					<input type="text" class="form-control" id="street" name="street" required value="<?php echo $_SESSION["street"]; ?>">
				</div>
				<div class="col-4">
					<label for="house_number" class="form-label">House Number</label>
					<input type="text" class="form-control" id="house_number" name="house_number" required value="<?php echo $_SESSION["house_number"]; ?>">
				</div>
			</div>
			<div class="row mb-3">
				<?php for ( $i = 1; $i <= 3; $i ++ ): ?>
					<div class="col-4">
						<label for="phone_<?php echo $i; ?>" class="form-label">Phone #<?php echo $i; ?></label>
						<input type="text" class="form-control" id="phone_<?php echo $i; ?>" name="phones[]" value="<?php echo $phoneNumbers[ $i - 1 ]; ?>">
					</div>
				<?php endfor; ?>
			</div>
			<button type="submit" class="btn btn-primary">Checkout</button>
		</form>
	</div>
</div>


<?php include_once 'includes/footer.php' ?>
