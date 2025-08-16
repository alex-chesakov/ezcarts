<?php echo $header; ?>

	<div class="flex-1 flex flex-col items-center justify-center px-4 sm:px-6 lg:px-8 py-12 mt-8 mb-8">
		<div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
			<div class="flex items-center justify-center mb-8">
				<div class="bg-[#022785] p-1 rounded">
<span class="text-white font-bold">MY</span>
				</div>
				<span class="font-bold text-[#000000e6] ml-1"><?php echo $name;?></span>
			</div>

			<h2 class="text-center text-2xl font-bold text-gray-900 mb-8"><?php echo $heading_title;?></h2>
<?php if ($error_warning) { ?>
<div class="error_div"><?php echo $error_warning; ?></div>
<?php } ?>
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="space-y-6">
				<div class="space-y-2">
					<label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="name"><?php echo $entry_firstname; ?></label>
					<div class="relative">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user absolute left-3 top-3 h-5 w-5 text-gray-400" data-component-path="src/components/signup/PersonalInfoSection.tsx"><path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>

						<input type="text" name="firstname" value="<?php echo $firstname; ?>" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm pl-10" id="name" placeholder="John Doe" required="">
						<?php if ($error_firstname) { ?>
							<div class="error"><?php echo $error_firstname; ?></div>
						<?php } ?>
					</div>
				</div>

				<div class="space-y-2">
					<label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="phone"><?php echo $entry_telephone; ?></label>
					<div class="relative">
						<input type="tel" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm pl-3" id="phone" placeholder="+1 (555) 555-5555" name="telephone" value="<?php echo $telephone; ?>" required="">
						<?php if ($error_telephone) { ?>
							<div class="error"><?php echo $error_telephone; ?></div>
						<?php } ?>
					</div>
				</div>

				<div class="space-y-2">
					<label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="email"><?php echo $entry_email; ?></label>
					<div class="relative">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-mail absolute left-3 top-3 h-5 w-5 text-gray-400"><rect width="20" height="16" x="2" y="4" rx="2"></rect><path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"></path></svg>
						<input type="email" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm pl-10" id="email" placeholder="you@example.com" required="" name="email" value="<?php echo $email; ?>">
						<?php if ($error_email) { ?>
							<div class="error"><?php echo $error_email; ?></div>
						<?php } ?>
					</div>
				</div>

				<div class="space-y-2">
					<label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="password"><?php echo $entry_password; ?></label>
					<div class="relative">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-lock absolute left-3 top-3 h-5 w-5 text-gray-400"><rect width="18" height="11" x="3" y="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
						</svg>
						<input type="password" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm pl-10" id="password" placeholder="••••••••" required="" name="password" value="<?php echo $password; ?>">
						<?php if ($error_password) { ?>
							<div class="error"><?php echo $error_password; ?></div>
						<?php } ?>
					</div>
				</div>
				<?php if ($text_agree) { ?>
					<div class="flex justify-center">
						<div class="border border-gray-200 rounded-md p-4">
							<div class="flex items-center space-x-2">
								
								<?php if ($agree) { ?>
									<input type="checkbox" name="agree" value="1" checked="checked" style="margin: 0px; width: 16px; height: 16px;" id="terms"/>
								<?php } else { ?>
									<input type="checkbox" name="agree" value="1" style="margin: 0px; width: 16px; height: 16px;" id="terms"/>
								<?php } ?>
								<?php /*<label class="peer h-4 w-4 shrink-0 rounded-sm border ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 data-[state=checked]:bg-primary data-[state=checked]:text-primary-foreground border-primary" for="terms"></label>*/	?>
								<label class="font-medium peer-disabled:cursor-not-allowed peer-disabled:opacity-70 text-sm" for="terms"><?php echo $text_agree; ?></label>
							</div>
						</div>
					</div>
				<?php } ?>
				<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 text-primary-foreground h-10 px-4 py-2 w-full bg-[#022785] hover:bg-[#022785]/90" type="submit">Sign Up</button>
			</form>
		</div>
	</div>



<?php /*
<?php echo $column_left; ?>
<?php echo $column_right; ?>
<?php echo $content_top; ?>
<?php echo $content_bottom; ?>
*/	?>



<script type="text/javascript"><!--


//--></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		width: 640,
		height: 480
	});
});
//--></script> 
<?php echo $footer; ?>