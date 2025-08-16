<?php echo $header; ?>


	<div class="flex-1 flex flex-col items-center justify-center px-4 sm:px-6 lg:px-8">
		<div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
			<div class="flex items-center justify-center mb-8">
				<div class="bg-[#022785] p-1 rounded">
<span class="text-white font-bold">MY</span>
				</div>
				<span class="font-bold text-[#000000e6] ml-1"><?php echo $name;?></span>
			</div>
			<h2 class="text-center text-2xl font-bold text-gray-900 mb-8"><?php echo $heading_title; ?></h2>
			
			<?php if ($error_warning) { ?>
				<div class="error_div"><?php echo $error_warning; ?></div>
			<?php } ?>
			
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="space-y-6">
				<div class="space-y-2">
					<label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="email">Email</label>
					<div class="relative">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-mail absolute left-3 top-3 h-5 w-5 text-gray-400"><rect width="20" height="16" x="2" y="4" rx="2"></rect><path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"></path></svg>
						<input type="email" name="email" value="" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm pl-10" id="email" placeholder="you@example.com" required="">
					</div>
				</div>


				<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 text-primary-foreground h-10 px-4 py-2 w-full bg-[#022785] hover:bg-[#022785]/90" type="submit"><?php echo $button_continue; ?>
				</button>
	
			</form>
		</div>
	</div>

<?php /*
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>

  <h1></h1>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <p><?php echo $text_email; ?></p>
    <h2><?php echo $text_your_email; ?></h2>
    <div class="content">
      <table class="form">
        <tr>
          <td><?php echo $entry_email; ?></td>

        </tr>
      </table>
    </div>
    <div class="buttons">
      <div class="left"><a href="" class="button"></a></div>
      <div class="right">
        <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
      </div>
    </div>
  </form>
  <?php echo $content_bottom; ?></div>
*/	?>
<?php echo $footer; ?>