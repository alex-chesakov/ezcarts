<?php echo $header; ?>

	<div class="flex-1 flex flex-col items-center justify-center px-4 sm:px-6 lg:px-8">
		<div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
			<div class="flex items-center justify-center mb-8">
				<div class="bg-[#022785] p-1 rounded">
<span class="text-white font-bold">MY</span>
				</div>
				<span class="font-bold text-[#000000e6] ml-1"><?php echo $name;?></span>
			</div>
			<h2 class="text-center text-2xl font-bold text-gray-900 mb-8"><?php echo $text_returning_customer; ?></h2>
			
			<?php if ($success) { ?>
				<div class="success"><?php echo $success; ?></div>
			<?php } ?>
			<?php if ($error_warning) { ?>
				<div class="error_div"><?php echo $error_warning; ?></div>
			<?php } ?>
			
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="space-y-6">
				<div class="space-y-2">
					<label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="email">Email</label>
					<div class="relative">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-mail absolute left-3 top-3 h-5 w-5 text-gray-400"><rect width="20" height="16" x="2" y="4" rx="2"></rect><path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"></path></svg>
						<input type="email" name="email" value="<?php echo $email; ?>" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm pl-10" id="email" placeholder="you@example.com" required="">
					</div>
				</div>
				<div class="space-y-2">
					<label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="password">Password</label>
					<div class="relative">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-lock absolute left-3 top-3 h-5 w-5 text-gray-400" data-component-path="src/pages/Login.tsx">
							<rect width="18" height="11" x="3" y="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
						</svg>
						<input type="password" name="password" value="<?php echo $password; ?>" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm pl-10" id="password" placeholder="••••••••" required="">
					</div>
				</div>
				<div class="flex items-center justify-between">
					<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 underline-offset-4 hover:underline h-10 px-4 py-2 text-sm text-primary" type="button" onclick="location.href='<?php echo $register; ?>'">
						<?php echo $text_register; ?>
					</button>
					<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 underline-offset-4 hover:underline h-10 px-4 py-2 text-sm text-primary" type="button" onclick="location.href='<?php echo $forgotten; ?>'"><?php echo $text_forgotten; ?></button>
				</div>
				<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 text-primary-foreground h-10 px-4 py-2 w-full bg-[#022785] hover:bg-[#022785]/90" type="submit"><?php echo $button_login; ?>
				</button>
				<?php if ($redirect) { ?>
					<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
				<?php } ?>
			</form>
		</div>
	</div>

<?php /*

<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>

  <h1><?php echo $heading_title; ?></h1>
  <div class="login-content">
    <div class="left">
      <h2></h2>
      <div class="content">
        <p><b></b></p>

        <a href="" class="button"><?php echo $button_continue; ?></a></div>
    </div>
    <div class="right">
      <h2><?php echo $text_returning_customer; ?></h2>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="content">
          <p><?php echo $text_i_am_returning_customer; ?></p>
          <b><?php echo $entry_email; ?></b><br />

          <br />
          <br />
          <b><?php echo $entry_password; ?></b><br />
          <?php echo $text_register_account; ?>
          <br />

          <br />
          <input type="submit" value="" class="button" />
          
        </div>
      </form>
    </div>
  </div>
  <?php echo $content_bottom; ?></div>
*/	?>
<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#login').submit();
	}
});
//--></script> 
<?php echo $footer; ?>