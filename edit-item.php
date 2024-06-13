<?php

use PerfectFood\Classes\Menu;
use PerfectFood\Classes\MenuItem;

include_once 'includes/header.php';

$menuItems = new MenuItem();

// Check if the user is an admin
if ( $_SESSION["role"] !== 'admin' && $_SESSION["role"] !== 'branch_manager' ) {
	$_SESSION['errors'][] = 'You do not have access to this page';
	header( 'Location: index.php' );
	exit();
}

// Check if the form has been submitted
if ( $_SERVER["REQUEST_METHOD"] === "POST" ) {
	// Check if all required fields are set and not empty
	if ( ! empty( $_POST['item_id'] ) && ! empty( $_POST['name'] ) && ! empty( $_POST['description'] ) && ! empty( $_POST['price'] ) && ! empty( $_POST['menu_id'] ) ) {
		$params = [
			'name'        => $_POST['name'],
			'description' => $_POST['description'],
			'price'       => $_POST['price'],
			'menu_id'     => $_POST['menu_id'],
			'image'       => $_POST['current_image'],
		];

		if ( ! empty( $_FILES["image"]["name"] ) ) {
			// Handle image upload
			$targetDir     = "assets/images/";
			$targetFile    = $targetDir . basename( $_FILES["image"]["name"] );
			$imageFileType = strtolower( pathinfo( $targetFile, PATHINFO_EXTENSION ) );
			$uploadOk      = 1;

			// Check if image file is a actual image or fake image
			$check = getimagesize( $_FILES["image"]["tmp_name"] );
			if ( $check !== false ) {
				$uploadOk = 1;
			} else {
				$errors[] = "File is not an image.";
				$uploadOk = 0;
			}

			// Check if file already exists
			if ( file_exists( $targetFile ) ) {
				$errors[] = "Sorry, file already exists.";
				$uploadOk = 0;
			}

			// Check file size
			if ( $_FILES["image"]["size"] > 500000 ) {
				$errors[] = "Sorry, your file is too large.";
				$uploadOk = 0;
			}

			// Allow certain file formats
			if ( $imageFileType !== "jpg" && $imageFileType !== "png" && $imageFileType !== "jpeg"
			     && $imageFileType !== "gif" ) {
				$errors[] = "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
				$uploadOk = 0;
			}

			// If everything is ok, try to upload file
			if ( $uploadOk == 0 ) {
				$errors[] = "Sorry, your file was not uploaded.";
			} elseif ( move_uploaded_file( $_FILES["image"]["tmp_name"], $targetFile ) ) {
				$params['image'] = $targetFile;
			} else {
				$_SESSION['errors'][] = "Sorry, there was an error uploading your file.";
			}
		}

		$success = $menuItems->updateMenuItemDetails( $_POST['item_id'], $params );

		// Check if the update was successful
		if ( $success ) {
			// Set a success message and redirect to the index page
			$_SESSION['info'][] = "Item updated successfully.";
			header( "Location: index.php" );
			exit;
		}

		$_SESSION['errors'][] = "Error updating menu item.";
		header( "Location: edit-item.php?item_id=" . $_POST['item_id'] );
		exit;
	}

	// Handle case where required fields are missing
	$_SESSION['errors'][] = "Please fill in all required fields.";
}

// Check if item ID is provided in the URL
if ( ! isset( $_GET['item_id'] ) || ! is_numeric( $_GET['item_id'] ) ) {
	$_SESSION['errors'][] = 'Invalid item ID.';
	header( 'Location: index.php' );
	exit();
}

$itemId      = $_GET['item_id'];
$menuItems   = new MenuItem();
$itemDetails = $menuItems->retrieveItemDetails( $itemId );

// Check if item exists
if ( ! $itemDetails ) {
	$_SESSION['errors'][] = 'Item not found.';
	header( 'Location: index.php' );
	exit();
}

$menu = new Menu();

// Fetch menus
$menus = $menu->retrieveMenus();

include_once 'includes/partial/alerts.php'
?>
<div class="container">
	<div class="d-flex justify-content-between">
		<h2>Edit Item</h2>
		<form method="post" action="delete-item.php">
			<input type="hidden" name="item_id" value="<?php echo $itemDetails['id']; ?>">
			<button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this item?')">Delete</button>
		</form>
	</div>
	<!-- Display item details and edit form here -->
	<form method="post" action="<?php echo htmlspecialchars( $_SERVER["PHP_SELF"] ); ?>" enctype="multipart/form-data">
		<input type="hidden" name="item_id" value="<?php echo $itemDetails['id']; ?>">
		<div class="row">
			<div class="col-4">
				<label for="current_image" class="form-label">Current Image</label>
				<br>
				<img src="<?php echo $itemDetails['image']; ?>" class="img-fluid mb-3" alt="Current Image">
				<input type="hidden" name="current_image" value="<?php echo $itemDetails['image'] ?>">
				<input type="file" class="form-control" id="image" name="image">
			</div>
			<div class="col-8">
				<div class="col-md-12 mb-3">
					<label for="name" class="form-label">Name</label>
					<input required type="text" class="form-control" id="name" name="name" value="<?php echo $itemDetails['name']; ?>">
				</div>
				<div class="col-md-12 mb-3">
					<label for="description" class="form-label">Description</label>
					<textarea required class="form-control" id="description" name="description"><?php echo $itemDetails['description']; ?></textarea>
				</div>
				<div class="col-md-12 mb-3">
					<label for="price" class="form-label">Price</label>
					<input required type="number" class="form-control" step=".01" id="price" name="price" value="<?php echo $itemDetails['price']; ?>">
				</div>
				<div class="col-md-12 mb-3">
					<label for="menu_id" class="form-label">Menu:</label>
					<select required id="menu_id" name="menu_id" class="form-select">
						<?php foreach ( $menus as $menu ) : ?>
							<option value="<?php echo $menu['id']; ?>" <?php echo ( $itemDetails['menu_id'] == $menu['id'] ) ? 'selected' : ''; ?>><?php echo $menu['name']; ?></option>
						<?php endforeach; ?>
					</select>
				</div>
				<button type="submit" class="btn btn-primary">Save Changes</button>
			</div>

		</div>
	</form>
</div>

<?php include_once 'includes/footer.php'; ?>
