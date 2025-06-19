<?php echo $header; ?>
<div class="min-h-screen bg-gray-50 flex flex-col">

	<nav class="fixed top-0 left-0 right-0 z-50 bg-white backdrop-blur-md border-b border-gray-100">
		<div class="container mx-auto px-4 h-16 flex items-center justify-between">
			<div class="flex items-center gap-4">
				<div class="flex items-center">
					<div class="bg-[#022785] py-0.5 px-1 rounded">
<span class="text-white font-black-han">MY</span>
					</div>
					<span class="font-black-han text-[#000000e6] ml-1"><?php echo $name;?></span>
				</div>
			</div>
			
			<div class="flex items-center gap-4">
				<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2" onclick="location.href='<?php echo $login;?>'">Login</button>
				<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 h-10 px-4 py-2 bg-[#022785] text-white hover:bg-[#022785]/90">
					Shop
				</button>
			</div>
		</div>
	</nav>
	
	<div class="flex-1 flex flex-col items-center justify-center px-4 sm:px-6 lg:px-8">
		<div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
			<h2 class="text-center text-2xl font-bold text-gray-900 mb-8"><?php echo $heading_title; ?></h2>
			<p><?php echo $text_error; ?></p>
		</div>
	</div>
</div>
<?php /*
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <div class="content"><?php echo $text_error; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php echo $content_bottom; ?></div>
*/	?>
<?php echo $footer; ?>