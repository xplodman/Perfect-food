<?php
require 'vendor/autoload.php'; // Load Faker

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

// Function to create random bookings
function createRandomBookings($conn, $faker) {
	// Fetch existing users and branches
	$usersQuery = "SELECT id FROM users WHERE role = 'customer'";
	$usersResult = $conn->query($usersQuery);

	$branchesQuery = "SELECT id FROM branches";
	$branchesResult = $conn->query($branchesQuery);

	$users = [];
	$branches = [];

	// Store users and branches in arrays
	while ($user = $usersResult->fetch_assoc()) {
		$users[] = $user['id'];
	}

	while ($branch = $branchesResult->fetch_assoc()) {
		$branches[] = $branch['id'];
	}

	// Today's date
	$today = date('Y-m-d');

	// Random comments and ratings for evaluations
	$ratingsComments = [
		['rating' => 5, 'comment' => 'خدمة استثنائية وطعام رائع!'],
		['rating' => 4, 'comment' => 'تجربة جيدة جدًا، لكن الانتظار كان طويلاً قليلاً.'],
		['rating' => 3, 'comment' => 'تجربة عادية، لا شيء مميز حقًا.'],
		['rating' => 2, 'comment' => 'مخيبة للآمال. الخدمة كانت بطيئة والطعام كان بارداً.'],
		['rating' => 1, 'comment' => 'أسوأ تجربة تناول طعام مررت بها في مصر.']
	];

	// Create random number of bookings (between 20 and 40)
	$bookingCount = rand(20, 40);

	for ($i = 0; $i < $bookingCount; $i++) {
		// Select random user and branch
		$user_id = $users[array_rand($users)];
		$branch_id = $branches[array_rand($branches)];

		// Generate a random booking date from last month to next month
		$startDate = strtotime("-1 month");
		$endDate = strtotime("+1 month");
		$randomTimestamp = rand($startDate, $endDate);
		$booking_date = date("Y-m-d", $randomTimestamp); // Random date within the range

		// Booking time
		$booking_time = $faker->time($format = 'H:i:s');

		// Number of guests
		$guests = rand(1, 10);

		// Determine the status based on the booking date
		if ($booking_date > $today) {
			// If the booking is in the future, it's either 'in_progress' or 'pending'
			$statusOptions = ['in_progress', 'pending'];
			$status = $statusOptions[array_rand($statusOptions)];
		} else {
			// If the booking is today or in the past, it's either 'completed' or 'cancelled'
			$statusOptions = ['completed', 'cancelled'];
			$status = $statusOptions[array_rand($statusOptions)];
		}

		// Insert the booking
		$bookingQuery = "INSERT INTO bookings (user_id, branch_id, booking_date, booking_time, guests, status, created_at) 
                         VALUES ($user_id, $branch_id, '$booking_date', '$booking_time', $guests, '$status', NOW())";
		$conn->query($bookingQuery);
		$booking_id = $conn->insert_id;

		// Add an evaluation only if the booking is marked as 'completed'
		if ($status === 'completed') {
			// Select a random evaluation from the array
			$randomEvaluation = $ratingsComments[array_rand($ratingsComments)];
			$rating = $randomEvaluation['rating'];
			$comment = $randomEvaluation['comment'];

			// Insert evaluation for the completed booking
			$evaluationQuery = "INSERT INTO evaluations (booking_id, rating, comment, created_at) 
                                VALUES ($booking_id, $rating, '$comment', NOW())";
			$conn->query($evaluationQuery);
		}
	}

	echo "$bookingCount random bookings have been created!";
}

// Call the function to create random bookings
createRandomBookings($conn, $faker);

$conn->close();
