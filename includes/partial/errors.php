<?php if ( ! empty( $_SESSION['errors'] ) && is_array( $_SESSION['errors'] ) ): ?>
	<div class="alert alert-danger">
		<?php foreach ( $_SESSION['errors'] as $error ): ?>
			<p><?php echo htmlspecialchars( $error ); ?></p>
		<?php endforeach; ?>
	</div>
<?php endif; ?>
