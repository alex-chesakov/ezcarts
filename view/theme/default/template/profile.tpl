<?php echo $header; ?>

<div class="flex items-center mb-8">
	<a href="<?php echo $go_back;?>" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 w-10 mr-4">
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left h-6 w-6"><path d="m12 19-7-7 7-7"></path><path d="M19 12H5"></path></svg>
	</a>
	<h1 class="text-2xl font-bold"><?php echo $heading_title;?></h1></div>

	<div class="space-y-6">
		<div class="rounded-lg border bg-card text-card-foreground shadow-sm">
			<div class="flex flex-col space-y-1.5 p-6">
<h3 class="text-2xl font-semibold leading-none tracking-tight">Personal Information</h3>
			</div>
			
			<div class="p-6 pt-0 space-y-4">
				<div class="space-y-2">
					<label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="fullName">Full Name</label>
					<input class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm" id="fullName" placeholder="John Doe" value="<?php echo $this->customer->getFirstName();?>" name="firstname">
				</div>
				
				<div class="space-y-2">
					<label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="email">Email</label>
					<input type="email" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm" id="email" placeholder="john@example.com" value="<?php echo $this->customer->getEmail();?>" name="email">
				</div>
				
				<div class="space-y-2">
					<label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="phone">Phone Number</label>
					<input type="tel" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm" id="phone" placeholder="+1 (555) 000-0000" value="<?php echo $this->customer->getTelephone();?>" name="telephone">
				</div>
			</div>
		</div>
		
		<div class="rounded-lg border bg-card text-card-foreground shadow-sm">
			<div class="flex flex-col space-y-1.5 p-6">
				<h3 class="text-2xl font-semibold leading-none tracking-tight">Security</h3>
			</div>
			<div class="p-6 pt-0">
				<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2">Reset Password</button>
			</div>
		</div>
		
		<div class="rounded-lg border bg-card text-card-foreground shadow-sm">
			<div class="flex flex-col space-y-1.5 p-6">
				<h3 class="text-2xl font-semibold leading-none tracking-tight">Payment Methods</h3>
				<p class="text-sm text-muted-foreground">Manage your payment methods and set your primary payment option</p>
			</div>
			
			<div class="p-6 pt-0 space-y-4">
				<div class="flex justify-between items-center">
					<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 mr-2">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-credit-card mr-2 h-4 w-4"><rect width="20" height="14" x="2" y="5" rx="2"></rect><line x1="2" x2="22" y1="10" y2="10"></line></svg>
						Add Credit Card
					</button>
					
					<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-landmark mr-2 h-4 w-4"><line x1="3" x2="21" y1="22" y2="22"></line><line x1="6" x2="6" y1="18" y2="11"></line><line x1="10" x2="10" y1="18" y2="11"></line><line x1="14" x2="14" y1="18" y2="11"></line><line x1="18" x2="18" y1="18" y2="11"></line><polygon points="12 2 20 7 4 7"></polygon></svg>
						Add ACH Account
					</button>
				</div>
				
				<div class="space-y-4">
					<div class="flex items-center justify-between p-4 border rounded-lg">
						<div class="flex items-center">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-credit-card mr-2 h-4 w-4"><rect width="20" height="14" x="2" y="5" rx="2"></rect><line x1="2" x2="22" y1="10" y2="10"></line></svg>
							<div>
								<p class="font-medium">Credit Card</p>
								<p class="text-sm text-gray-500">ending in 4242</p>
							</div>
						</div>
						
						<div class="flex items-center gap-2">
							<span class="text-sm text-primary">Primary</span>
						</div>
					</div>
					
					<div class="flex items-center justify-between p-4 border rounded-lg">
						<div class="flex items-center">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-landmark mr-2 h-4 w-4"><line x1="3" x2="21" y1="22" y2="22"></line><line x1="6" x2="6" y1="18" y2="11"></line><line x1="10" x2="10" y1="18" y2="11"></line><line x1="14" x2="14" y1="18" y2="11"></line><line x1="18" x2="18" y1="18" y2="11"></line><polygon points="12 2 20 7 4 7"></polygon></svg>
							<div>
								<p class="font-medium">ACH Account</p>
								<p class="text-sm text-gray-500">ending in 1234</p>
							</div>
						</div>
						<div class="flex items-center gap-2">
							<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3">Set as Primary</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<?php /*
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <h2><?php echo $text_my_account; ?></h2>
  <div class="content">
    <ul>
      <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
      <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
      <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
    </ul>
  </div>
  <h2><?php echo $text_my_orders; ?></h2>
  <div class="content">
    <ul>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
      <?php if ($reward) { ?>
      <li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
      <?php } ?>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
      <li><a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a></li>
    </ul>
  </div>
  <h2><?php echo $text_my_newsletter; ?></h2>
  <div class="content">
    <ul>
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
    </ul>
  </div>
  <?php echo $content_bottom; ?></div>
*/	?>
<?php echo $footer; ?> 