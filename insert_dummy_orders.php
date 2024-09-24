<?php
require 'vendor/autoload.php'; // Make sure Faker is loaded

// Use Faker with Arabic locale
$faker = Faker\Factory::create('ar_EG');

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

// Function to calculate the discount based on total price
function calculateDiscount($totalPrice, $discountTiers, $discountRates) {
	$discount = 0;
	foreach ($discountTiers as $index => $tier) {
		if ($totalPrice > $tier) {
			$discount = $discountRates[$index];
		}
	}
	return $discount;
}

// Function to insert a new user
function insertUser($conn, $first_name, $last_name, $email, $password, $city, $street, $house_number, $phone_number) {
	$hashedPassword = password_hash($password, PASSWORD_BCRYPT);
	$query = "INSERT INTO users (role, first_name, last_name, email, password, city, street, house_number, created_at) 
              VALUES ('customer', '$first_name', '$last_name', '$email', '$hashedPassword', '$city', '$street', '$house_number', NOW())";
	$conn->query($query);
	$user_id = $conn->insert_id; // return newly created user id

	// Insert 1 to 3 random phone numbers
	$phoneCount = rand(1, 3);
	for ($i = 0; $i < $phoneCount; $i++) {
		$phoneQuery = "INSERT INTO phones (user_id, phone_number) VALUES ($user_id, '$phone_number')";
		$conn->query($phoneQuery);
	}

	return $user_id;
}

// Function to create random orders and order items
function createRandomOrders($conn, $user_id, $faker, $discountTiers, $discountRates) {
	// Insert an evaluation for the order in Arabic
	$ratingsComments = [
		[ 'rating' => '5', 'comment' => "خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة." ],
		// Add more comments here...
	];

	// Fetch menu items
	$menuItemsQuery = "SELECT id, price FROM menu_items";
	$menuItemsResult = $conn->query($menuItemsQuery);

	$menuItems = [];
	while ($row = $menuItemsResult->fetch_assoc()) {
		$menuItems[] = $row;
	}

	// Create random number of orders (between 1 and 5)
	$orderCount = rand(5, 10);
	$statusOptions = ['pending', 'in_progress', 'completed', 'cancelled'];

	for ($i = 0; $i < $orderCount; $i++) {
		// Insert a new order
		$first_name = $faker->firstName;
		$last_name = $faker->lastName;
		$email = $faker->email;
		$city = $faker->city;
		$street = $faker->streetName;
		$house_number = rand(1, 100);
		$phone = '01' . $faker->randomElement(['0', '1', '2', '5']) . $faker->numerify('########');

		// Randomly select an order status
		$status = $statusOptions[array_rand($statusOptions)];

		$orderQuery = "INSERT INTO orders (user_id, first_name, last_name, email, city, street, house_number, phone_1, status, created_at) 
                   VALUES ($user_id, '$first_name', '$last_name', '$email', '$city', '$street', '$house_number', $phone, '$status', NOW())";
		$conn->query($orderQuery);
		$order_id = $conn->insert_id;

		// Add random items to the order and calculate the total price
		$itemCount = rand(1, 3);
		$totalPrice = 0;

		for ($j = 0; $j < $itemCount; $j++) {
			$menuItem = $menuItems[array_rand($menuItems)];
			$quantity = rand(1, 5);
			$itemPrice = $menuItem['price'] * $quantity;
			$totalPrice += $itemPrice;

			$orderItemQuery = "INSERT INTO order_items (order_id, item_id, quantity, price, price_after_discount) 
                           VALUES ($order_id, {$menuItem['id']}, $quantity, {$menuItem['price']}, {$menuItem['price']})";
			$conn->query($orderItemQuery);
		}

		if($totalPrice > 100){
			// Calculate the discount based on the total price
			$discountRate = calculateDiscount($totalPrice, $discountTiers, $discountRates);

			// Update each order item with price_after_discount
			$updateOrderItemsQuery = "UPDATE order_items SET price_after_discount = price - (price * $discountRate) WHERE order_id = $order_id";
			$conn->query($updateOrderItemsQuery);
		}

		// Add evaluation only if status is 'completed'
		if ($status === 'completed') {
			// Select a random evaluation from the ratingsComments array
			$randomIndex = array_rand($ratingsComments);
			$rating = $ratingsComments[$randomIndex]['rating'];
			$comment = $ratingsComments[$randomIndex]['comment'];

			$evaluationQuery = "INSERT INTO evaluations (order_id, rating, comment, created_at) 
                            VALUES ($order_id, $rating, '$comment', NOW())";
			$conn->query($evaluationQuery);
		}
	}
}

// Create 4 customers and assign random orders to each
for ($i = 0; $i < 4; $i++) {
	$first_name = $faker->firstName;
	$last_name = $faker->lastName;
	$email = "customer" . ($i + 1) . "@perfect-food.com";
	$password = 'Pa$$w0rd!';
	$city = $faker->city;
	$street = $faker->streetName;
	$house_number = rand(1, 100);
	$phone_number = '01' . $faker->randomElement(['0', '1', '2', '5']) . $faker->numerify('########');

	// Insert new user and get user ID
	$user_id = insertUser($conn, $first_name, $last_name, $email, $password, $city, $street, $house_number, $phone_number);

	// Create random orders for this user
	createRandomOrders($conn, $user_id, $faker, $discountTiers, $discountRates);
}

echo "Dummy customers, orders, and evaluations in Arabic have been created with discounts applied.";

$conn->close();