<?php

use PerfectFood\Classes\Branch;

include_once 'includes/header.php';

$branch   = new Branch();
$branches = $branch->getAllBranches();

?>

<div class="container">
	<h1>Branches</h1>
	<table class="table">
		<thead>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Location</th>
			<th>Contact Info</th>
		</tr>
		</thead>
		<tbody>
		<?php foreach ( $branches as $branch ): ?>
			<tr>
				<td><?php echo $branch['id']; ?></td>
				<td><?php echo $branch['name']; ?></td>
				<td><?php echo $branch['location']; ?></td>
				<td><?php echo $branch['contact_info']; ?></td>
			</tr>
		<?php endforeach; ?>
		</tbody>
	</table>
</div>

<?php include_once 'includes/footer.php' ?>
