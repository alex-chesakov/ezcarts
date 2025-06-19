<?php echo $header; ?>

	<section class="h-[720px] relative bg-[#022785] flex items-center">
		<div class="container mx-auto px-4 relative z-10">
			<div class="grid grid-cols-2 gap-8">
				<?php echo $content_top; ?>
			</div>
		</div>
	</section>
	
	<section class="h-[300px] bg-white flex items-center">
		<div class="container mx-auto px-4">
			<div class="text-center -mt-4">
				<?php echo $content_bottom; ?>
			</div>
		</div>
	</section>

<?php echo $footer; ?>