<?php echo $header; ?><?php echo $column_left; ?>
<?php echo $column_right; ?>

	<div class="flex-1 flex flex-col items-center justify-center px-4 sm:px-6 lg:px-8">
		<div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
			<div class="flex items-center justify-center mb-8">
				<div class="bg-[#022785] p-1 rounded">
<span class="text-white font-bold">MY</span>
				</div>
				<span class="font-bold text-[#000000e6] ml-1"><?php echo $this->config->get('config_name');?></span>
			</div>
			<h2 class="text-center text-2xl font-bold text-gray-900 mb-8"><?php echo $heading_title; ?></h2>
			<div class="space-y-6">
				<div class="space-y-2">
					<?php echo $content_top; ?>
					<?php echo $text_message; ?>
					<?php echo $content_bottom; ?>

				</div>
			</div>
		</div>
	</div>
	
<?php echo $footer; ?>