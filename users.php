<?php
include_once 'includes/header.php';

use PerfectFood\Classes\Book;
use PerfectFood\Classes\Evaluate;
use PerfectFood\Classes\User;

// Check if the user is already logged in, if not, redirect to login page
if ( ! isset( $_SESSION["user_logged_in"] ) || $_SESSION["user_logged_in"] !== true ) {
	header( "Location: login.php" );
	exit;
}

// Check if the user is an admin
if ( $_SESSION["role"] !== 'admin' ) {
	$_SESSION['errors'][] = 'You do not have access to this page';
	header( 'Location: index.php' );
	exit();
}

$userClass = new User();

// Retrieve bookings for the logged-in customer
$users = $userClass->retrieveAllUsers();
include_once 'includes/partial/alerts.php';

?>

<div class="container">
	<h1><?php echo 'All users'; ?></h1>
	<table class="table table-striped">
		<thead>
		<tr>
			<th>#</th>
			<th>User ID</th>
			<th>Role</th>
			<th>First name</th>
			<th>Last name</th>
			<th>Email</th>
			<th>City</th>
			<th>Street</th>
			<th>House number</th>
			<th>Created at</th>
			<th>Actions</th>
		</tr>
		</thead>
		<tbody>
		<?php foreach ( $users as $index => $user ) : ?>
			<tr>
				<td><?php echo $index + 1; ?></td>
				<td><?php echo $user['id']; ?></td>
				<td><?php echo $user['role']; ?></td>
				<td><?php echo $user['first_name']; ?></td>
				<td><?php echo $user['last_name']; ?></td>
				<td><?php echo $user['email']; ?></td>
				<td><?php echo $user['city']; ?></td>
				<td><?php echo $user['street']; ?></td>
				<td><?php echo $user['house_number']; ?></td>
				<td><?php echo $user['created_at']; ?></td>
				<td>
					<?php if ( $user["role"] !== 'admin' ) : ?>
						<form method="post" action="delete-user.php">
							<input type="hidden" name="user_id" value="<?php echo $user['id']; ?>">
							<button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this user?')">Delete</button>
						</form>
					<?php endif; ?>
					<a href="edit-user.php?user_id=<?php echo $user['id']; ?>" title="Edit" class="me-2 ms-2">
						<i class="bi bi-pencil-square"></i>
					</a>
				</td>
			</tr>
		<?php endforeach; ?>
		</tbody>
	</table>
</div>

<?php include_once 'includes/footer.php'; ?>
