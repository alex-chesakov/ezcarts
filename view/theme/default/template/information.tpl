<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>

<div class="container mx-auto px-4 mt-16 flex justify-center">
	<div class="max-w-2xl w-full py-6">
	
		<div class="flex items-center gap-4 mb-8">
			<a href="/" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:text-accent-foreground h-10 px-4 py-2 hover:bg-gray-100"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left h-4 w-4" ><path d="m12 19-7-7 7-7"></path><path d="M19 12H5"></path></svg>
			</a>
			<h1 class="text-3xl font-bold"><?php echo $heading_title; ?></h1>
		</div>
		<div class="flow-root">
			<?php echo $content_top; ?>
			<?php echo $description; ?>
			<?php echo $content_bottom; ?>
		</div>
	</div>
</div>


<?php echo $footer; ?>