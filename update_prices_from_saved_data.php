<?php
// Database connection (adjust the credentials as necessary)
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "perfect_food";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}

// Define discount tiers and corresponding discounts
$discountTiers = [100, 200, 300]; // Total price tiers
$discountRates = [0.05, 0.10, 0.20]; // Corresponding discount percentage rates

// Fetch all orders
$orderQuery = "SELECT id FROM orders";
$orderResult = $conn->query($orderQuery);

if ($orderResult->num_rows > 0) {
	// Loop through each order
	while ($orderRow = $orderResult->fetch_assoc()) {
		$orderId = $orderRow['id'];

		// Fetch order items for the current order
		$itemQuery = "SELECT id, item_id, quantity FROM order_items WHERE order_id = $orderId";
		$itemResult = $conn->query($itemQuery);

		$totalOrderPrice = 0;
		$orderItems = [];

		// Calculate total order price and prepare item data
		while ($itemRow = $itemResult->fetch_assoc()) {
			$itemId = $itemRow['item_id'];
			$quantity = $itemRow['quantity'];

			// Fetch the price of the menu item
			$priceQuery = "SELECT price FROM menu_items WHERE id = $itemId";
			$priceResult = $conn->query($priceQuery);
			$menuItem = $priceResult->fetch_assoc();
			$price = $menuItem['price'];

			// Calculate total price for the item and accumulate order total
			$totalItemPrice = $price * $quantity;
			$totalOrderPrice += $totalItemPrice;

			// Store item data for later use
			$orderItems[] = [
				'id' => $itemRow['id'],
				'price' => $price,
				'quantity' => $quantity,
			];
		}

		// Determine discount rate based on total order price
		$discountRate = 0;
		foreach ($discountTiers as $index => $tier) {
			if ($totalOrderPrice > $tier) {
				$discountRate = $discountRates[$index];
			}
		}

		// Update each item with its price and discounted price
		foreach ($orderItems as $item) {
			$priceAfterDiscount = $item['price'] * (1 - $discountRate);

			// Update the item in the database
			$updateQuery = "
                UPDATE order_items 
                SET price = {$item['price']}, price_after_discount = $priceAfterDiscount 
                WHERE id = {$item['id']}
            ";
			$conn->query($updateQuery);
		}
	}
} else {
	echo "No orders found.";
}

$conn->close();
