<?php
use PerfectFood\Classes\Menu;
use PerfectFood\Classes\MenuItem;

include_once 'includes/header.php';

$menuItems = new MenuItem();

// Check if the user is an admin
if ($_SESSION["role"] !== 'admin') {
	$_SESSION['errors'][] = 'You do not have access to this page';
	header('Location: index.php');
	exit();
}

// Check if the form has been submitted
if ($_SERVER["REQUEST_METHOD"] === "POST") {
	// Validate form data
	$errors = [];
	if (empty($_POST['name'])) {
		$errors[] = "Name is required.";
	}
	if (empty($_POST['description'])) {
		$errors[] = "Description is required.";
	}
	if (!isset($_POST['price']) || !is_numeric($_POST['price'])) {
		$errors[] = "Price must be a valid number.";
	}
	if (empty($_POST['menu_id'])) {
		$errors[] = "Menu selection is required.";
	}

	// Handle image upload
	$targetDir = "assets/images/";
	$targetFile = $targetDir . basename($_FILES["image"]["name"]);
	$imageFileType = strtolower(pathinfo($targetFile, PATHINFO_EXTENSION));
	$uploadOk = 1;

	// Check if image file is a actual image or fake image
	$check = getimagesize($_FILES["image"]["tmp_name"]);
	if ($check !== false) {
		$uploadOk = 1;
	} else {
		$errors[] = "File is not an image.";
		$uploadOk = 0;
	}

	// Check if file already exists
	if (file_exists($targetFile)) {
		$errors[] = "Sorry, file already exists.";
		$uploadOk = 0;
	}

	// Check file size
	if ($_FILES["image"]["size"] > 500000) {
		$errors[] = "Sorry, your file is too large.";
		$uploadOk = 0;
	}

	// Allow certain file formats
	if ( $imageFileType !== "jpg" && $imageFileType !== "png" && $imageFileType !== "jpeg"
	    && $imageFileType !== "gif") {
		$errors[] = "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
		$uploadOk = 0;
	}

	// If everything is ok, try to upload file
	if ($uploadOk == 0) {
		$errors[] = "Sorry, your file was not uploaded.";
	} else {
		if (move_uploaded_file($_FILES["image"]["tmp_name"], $targetFile)) {
			// File uploaded successfully, continue with menu item creation
			$params = [
				'name' => $_POST['name'],
				'description' => $_POST['description'],
				'price' => $_POST['price'],
				'image' => $targetFile, // Store image path in the database
				'menu_id' => $_POST['menu_id'],
			];

			$success = $menuItems->createNewMenuItem($params);

			// Check if the item creation was successful
			if ($success) {
				$_SESSION['info'][] = "Item created successfully.";
				header("Location: index.php");
				exit;
			} else {
				$_SESSION['errors'][] = "Error creating menu item.";
			}
		} else {
			$_SESSION['errors'][] = "Sorry, there was an error uploading your file.";
		}
	}

	// If there are any validation errors, display them
	if (!empty($errors)) {
		$_SESSION['errors'] = array_merge($_SESSION['errors'], $errors);
		header("Location: " . $_SERVER["PHP_SELF"]);
		exit;
	}
}

$menu = new Menu();

// Fetch menus
$menus = $menu->retrieveMenus();

include_once 'includes/partial/alerts.php';
?>
<div class="container">
	<h2>Create menu Item</h2>
	<!-- Display item details and edit form here -->
	<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" enctype="multipart/form-data">
		<div class="row">
			<div class="col-md-12 mb-3">
				<label for="name" class="form-label">Name</label>
				<input required type="text" class="form-control" id="name" name="name">
			</div>
			<div class="col-md-12 mb-3">
				<label for="description" class="form-label">Description</label>
				<textarea required class="form-control" id="description" name="description"></textarea>
			</div>
			<div class="col-md-4 mb-3">
				<label for="price" class="form-label">Price</label>
				<input required type="number" class="form-control" step=".01" id="price" name="price">
			</div>
			<div class="col-md-4 mb-3">
				<label for="image" class="form-label">Image</label>
				<input required type="file" class="form-control" id="image" name="image">
			</div>
			<div class="col-md-4 mb-3">
				<label for="menu_id" class="form-label">Menu:</label>
				<select required id="menu_id" name="menu_id" class="form-select">
					<option value="">Select Menu</option>
					<?php foreach ($menus as $menu) : ?>
						<option value="<?php echo $menu['id']; ?>"><?php echo $menu['name']; ?></option>
					<?php endforeach; ?>
				</select>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Create item</button>
	</form>
</div>
<?php include_once 'includes/footer.php'; ?>
