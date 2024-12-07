<?php
require 'vendor/autoload.php'; // Make sure Faker is loaded

// Use Faker with Arabic locale
$faker = Faker\Factory::create('ar_EG');

CONST EVALUATION_COMMENTS = [
    [ 'rating' => '5', 'comment' => "خدمة استثنائية وطعام رائع! مكان يجب زيارته في القاهرة." ],
    [ 'rating' => '4', 'comment' => "تجربة جيدة جدًا، لكن الانتظار كان طويلاً قليلاً." ],
    [ 'rating' => '3', 'comment' => "تجربة عادية، لا شيء مميز حقًا." ],
    [ 'rating' => '2', 'comment' => "مخيبة للآمال. الخدمة كانت بطيئة والطعام كان بارداً." ],
    [ 'rating' => '1', 'comment' => "سيء جدًا! كان لدي آمال كبيرة، لكن كان خيبة أمل كاملة." ],
    [ 'rating' => '5', 'comment' => "أحببتها تمامًا! الأجواء والموظفون كانوا ممتازين." ],
    [ 'rating' => '4', 'comment' => "موقع رائع وأطباق لذيذة، سأعود مرة أخرى!" ],
    [ 'rating' => '3', 'comment' => "كانت تجربة جيدة، لكنني توقعت المزيد من التعليقات." ],
    [ 'rating' => '2', 'comment' => "لم يكن كما تخيلت؛ شعرت أنه أكثر كفخ للسيّاح." ],
    [ 'rating' => '1', 'comment' => "لن أعود مرة أخرى! خدمة العملاء سيئة وطعام رديء." ],
    [ 'rating' => '5', 'comment' => "تجربة رائعة! أفضل شيشة في المدينة!" ],
    [ 'rating' => '4', 'comment' => "قيمة جيدة مقابل المال، استمتعت بالأجواء المحلية." ],
    [ 'rating' => '3', 'comment' => "جيد، لكنني وجدت خيارات أفضل في الجوار." ],
    [ 'rating' => '2', 'comment' => "كانت زيارة مخيبة. تحتاج إلى تحسين." ],
    [ 'rating' => '1', 'comment' => "أسوأ تجربة تناول طعام مررت بها في مصر." ],
    [ 'rating' => '5', 'comment' => "مساء مثالي! الموسيقى الحية أضافت الكثير للأجواء." ],
    [ 'rating' => '4', 'comment' => "تجربة جيدة، لكن الطعام كان يحتاج إلى مزيد من النكهة." ],
    [ 'rating' => '3', 'comment' => "مكان متوسط، الخدمة كانت مقبولة." ],
    [ 'rating' => '2', 'comment' => "الأجواء كانت جميلة، لكن الطعام لم يكن جيدًا." ],
    [ 'rating' => '1', 'comment' => "خدمة العملاء كانت سيئة للغاية، لم أستمتع بزيارتي." ],
];
CONST ORDER_COUNT = 30;
CONST RESERVATION_COUNT = 30;
CONST CUSTOMER_ID = 2;

// Database connection (adjust the credentials as necessary)
$servername = "localhost";
$username = "root";
$password = "root";
$dbname = "family_restaurant";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}

function resetAndImportDataBase($conn)
{

// Disable foreign key checks
    $conn->query("SET FOREIGN_KEY_CHECKS = 0;");

// Correct DROP TABLE query
    $dropTablesQuery = "
    DROP TABLE IF EXISTS `branches`;
    DROP TABLE IF EXISTS `evaluations`;
    DROP TABLE IF EXISTS `reservations`;
    DROP TABLE IF EXISTS `menus`;
    DROP TABLE IF EXISTS `menu_items`;
    DROP TABLE IF EXISTS `orders`;
    DROP TABLE IF EXISTS `order_items`;
    DROP TABLE IF EXISTS `phones`;
    DROP TABLE IF EXISTS `users`;
";

    if ($conn->multi_query($dropTablesQuery)) {
        // Clear all pending results
        while ($conn->next_result()) { }
        echo "Tables dropped successfully.<br>";
    } else {
        die("Error dropping tables: " . $conn->error);
    }

// Load and execute the SQL file
    $sqlFile = file_get_contents('./reset_database.sql');

    if ($conn->multi_query($sqlFile)) {
        // Clear all pending results
        while ($conn->next_result()) { }
        echo "Database reset successfully.<br>";
    } else {
        echo "Error resetting database: " . $conn->error . "<br>";
    }

// Re-enable foreign key checks
    $conn->query("SET FOREIGN_KEY_CHECKS = 1;");
}

resetAndImportDataBase($conn);

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

// Function to create random orders and order items
function createRandomOrders($conn, $faker, $discountTiers, $discountRates) {
	// Fetch menu items
	$menuItemsQuery = "SELECT id, price FROM menu_items";
	$menuItemsResult = $conn->query($menuItemsQuery);

	$menuItems = [];
	while ($row = $menuItemsResult->fetch_assoc()) {
		$menuItems[] = $row;
	}

	$statusOptions = ['pending', 'in_progress', 'completed', 'cancelled'];
    $user_id = CUSTOMER_ID;
	for ($i = 0; $i < ORDER_COUNT; $i++) {
		// Insert a new order
		$first_name = $faker->firstName;
		$middle_name = $faker->firstName;
		$last_name = $faker->lastName;
		$email = $faker->email;
		$city = $faker->city;
		$street = $faker->streetName;
		$house_number = rand(1, 100);
		$phone = '01' . $faker->randomElement(['0', '1', '2', '5']) . $faker->numerify('########');

		// Randomly select an order status
		$status = $statusOptions[array_rand($statusOptions)];

		$orderQuery = "INSERT INTO orders (user_id, first_name, middle_name, last_name, email, city, street, house_number, phone_1, status, created_at) 
                   VALUES ('$user_id', '$first_name', '$middle_name', '$last_name', '$email', '$city', '$street', '$house_number', $phone, '$status', NOW())";
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

        // Add evaluation only if status is 'completed' and randomly decide whether to add
        if ($status === 'completed' && rand(0, 1) === 1) {
            addEvaluation($conn, 'order', $order_id);
        }
	}

    echo ORDER_COUNT . " random orders have been created! <br>";
}

function addEvaluation($conn, $type, $id): void
{
    $randomEvaluation = EVALUATION_COMMENTS[array_rand(EVALUATION_COMMENTS)];
    $rating = $randomEvaluation['rating'];
    $comment = $randomEvaluation['comment'];

    $evaluationQuery = "INSERT INTO evaluations ({$type}_id, rating, comment, created_at) 
                        VALUES ($id, $rating, '$comment', NOW())";
    $conn->query($evaluationQuery);
}

// Function to create random reservations
function createRandomReservations($conn, $faker) {
    $branchesQuery = "SELECT id FROM branches";
    $branchesResult = $conn->query($branchesQuery);

    $branches = [];

    while ($branch = $branchesResult->fetch_assoc()) {
        $branches[] = $branch['id'];
    }

    // Today's date
    $today = date('Y-m-d');

    for ($i = 0; $i < RESERVATION_COUNT; $i++) {
        $user_id = CUSTOMER_ID;
        $branch_id = $branches[array_rand($branches)];

        // Generate a random reservation date from last month to next month
        $startDate = strtotime("-1 month");
        $endDate = strtotime("+1 month");
        $randomTimestamp = rand($startDate, $endDate);
        $reservation_date = date("Y-m-d", $randomTimestamp); // Random date within the range

        // Reservation time
        $reservation_time = $faker->time('H:i:s');

        // Number of guests
        $guests = rand(1, 10);

        // Determine the status based on the reservation date
        if ($reservation_date > $today) {
            // If the reservation is in the future, it's either 'in_progress' or 'pending'
            $statusOptions = ['in_progress', 'pending'];
            $status = $statusOptions[array_rand($statusOptions)];
        } else {
            // If the reservation is today or in the past, it's either 'completed' or 'cancelled'
            $statusOptions = ['completed', 'cancelled'];
            $status = $statusOptions[array_rand($statusOptions)];
        }

        // Insert the reservation
        $reservationQuery = "INSERT INTO reservations (user_id, branch_id, reservation_date, reservation_time, guests, status, created_at) 
                         VALUES ($user_id, $branch_id, '$reservation_date', '$reservation_time', $guests, '$status', NOW())";
        $conn->query($reservationQuery);
        $reservation_id = $conn->insert_id;

        // Add an evaluation only if the reservation is marked as 'completed'
        if ($status === 'completed' && rand(0, 1) === 1) {
            addEvaluation($conn, 'reservation', $reservation_id);
        }
    }

    echo RESERVATION_COUNT . " random reservations have been created! <br>";
}

// Create random orders for this user
createRandomOrders($conn, $faker, $discountTiers, $discountRates);

// Create random orders for this user
createRandomReservations($conn, $faker);

$conn->close();
