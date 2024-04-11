<?php if ( ! empty( $_SESSION['info'] ) && is_array( $_SESSION['info'] ) ): ?>
	<div class="alert alert-success">
		<?php foreach ( $_SESSION['info'] as $message ): ?>
			<p><?php echo htmlspecialchars( $message ); ?></p>
		<?php endforeach; ?>
	</div>
	<?php
	$_SESSION['info'] = [];
endif;
?>

<?php if ( ! empty( $_SESSION['errors'] ) && is_array( $_SESSION['errors'] ) ): ?>
	<div class="alert alert-danger">
		<?php foreach ( $_SESSION['errors'] as $error ): ?>
			<p><?php echo htmlspecialchars( $error ); ?></p>
		<?php endforeach; ?>
	</div>
	<?php
	$_SESSION['errors'] = [];
endif;
?>
