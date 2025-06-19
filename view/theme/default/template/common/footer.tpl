</div>
<footer class="border-t border-gray-100 py-8 bg-[#022785]">
	<div class="container mx-auto px-4">
		<div class="flex flex-col items-center space-y-4">
			<div class="flex gap-6">
				<a href="#" class="text-sm text-white hover:text-gray-200">Terms</a>
				<a href="#" class="text-sm text-white hover:text-gray-200">Privacy</a>
				<a href="#" class="text-sm text-white hover:text-gray-200">Contact</a>
			</div>
			<div class="flex flex-col items-center gap-2">
				<a href="/updates" class="text-sm text-white hover:text-gray-200 font-medium">Updates Center</a>
				<div class="flex items-center gap-2">
					<img src="/image/04eaabc3-a719-47f9-9047-2cc4d46e5a50.png" alt="Green leaf" class="w-6 h-6 object-contain">
					<span class="text-sm text-white">0.5% of our revenue goes for carbon removal</span>
				</div>
			</div>
			<div class="text-sm text-white">&copy; <?php echo date('Y');?> <?php echo $name;?>. All rights reserved.</div>
		</div>
	</div>
</footer>

<?php /*
<div id="footer">
  <?php if ($informations) { ?>
  <div class="column">
    <h3><?php echo $text_information; ?></h3>
    <ul>
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <?php } ?>
  <div class="column">
    <h3><?php echo $text_service; ?></h3>
    <ul>
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
    </ul>
  </div>
  <div class="column">
    <h3><?php echo $text_extra; ?></h3>
    <ul>
      <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
      <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
      <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
      <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
    </ul>
  </div>
  <div class="column">
    <h3><?php echo $text_account; ?></h3>
    <ul>
      <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
    </ul>
  </div>
</div>
*/	?>
<!--
<div  class="fixed inset-0 z-50 bg-black/80 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0" style="pointer-events: auto;" data-aria-hidden="true" aria-hidden="true"></div>

<div role="dialog" id="radix-:re:" data-state="open" class="fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[state=closed]:slide-out-to-left-1/2 data-[state=closed]:slide-out-to-top-[48%] data-[state=open]:slide-in-from-left-1/2 data-[state=open]:slide-in-from-top-[48%] sm:rounded-lg sm:max-w-md" style="pointer-events: auto;">
	<div class="flex flex-col space-y-1.5 text-center sm:text-left">
		<h2 id="radix-:rf:" class="text-lg font-semibold leading-none tracking-tight">Your Location</h2>
		<p id="radix-:rg:" class="text-sm text-muted-foreground">Enter a city name or ZIP code to shop in the closest warehouse.</p>
	</div>
	<div class="flex gap-2 mt-4">
		<input class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm flex-1" placeholder="Enter City or Zip" value="">
			<button data-component-path="src/components/location/LocationPicker.tsx" data-component-name="Button" data-component-line="149" data-component-file="LocationPicker.tsx" data-component-content="%7B%7D" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2">Search</button>
	</div>
	<div data-component-path="src/components/location/LocationPicker.tsx" data-component-name="div" data-component-line="153" data-component-file="LocationPicker.tsx" data-component-content="%7B%22className%22%3A%22mt-4%20space-y-2%22%7D" class="mt-4 space-y-2"><button data-component-path="src/components/location/LocationPicker.tsx" data-component-name="Button" data-component-line="164" data-component-file="LocationPicker.tsx" data-component-content="%7B%7D" class="inline-flex items-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 w-full justify-start">San Jose</button><button data-component-path="src/components/location/LocationPicker.tsx" data-component-name="Button" data-component-line="164" data-component-file="LocationPicker.tsx" data-component-content="%7B%7D" class="inline-flex items-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 w-full justify-start">Concord</button><button data-component-path="src/components/location/LocationPicker.tsx" data-component-name="Button" data-component-line="164" data-component-file="LocationPicker.tsx" data-component-content="%7B%7D" class="inline-flex items-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 w-full justify-start">Oakland</button><button data-component-path="src/components/location/LocationPicker.tsx" data-component-name="Button" data-component-line="164" data-component-file="LocationPicker.tsx" data-component-content="%7B%7D" class="inline-flex items-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 w-full justify-start">Daly City</button><button data-component-path="src/components/location/LocationPicker.tsx" data-component-name="Button" data-component-line="164" data-component-file="LocationPicker.tsx" data-component-content="%7B%7D" class="inline-flex items-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 w-full justify-start">San Francisco</button><button data-component-path="src/components/location/LocationPicker.tsx" data-component-name="Button" data-component-line="164" data-component-file="LocationPicker.tsx" data-component-content="%7B%7D" class="inline-flex items-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 w-full justify-start">Fresno</button></div>
	<button type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none data-[state=open]:bg-accent data-[state=open]:text-muted-foreground"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4" data-component-path="src/components/ui/dialog.tsx" data-component-name="X" data-component-line="46" data-component-file="dialog.tsx" data-component-content="%7B%22className%22%3A%22h-4%20w-4%22%7D"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg><span data-component-path="src/components/ui/dialog.tsx" data-component-name="span" data-component-line="47" data-component-file="dialog.tsx" data-component-content="%7B%22text%22%3A%22Close%22%2C%22className%22%3A%22sr-only%22%7D" class="sr-only">Close</span></button>
</div>
-->	
</div>

<?php /*	ТИП ЗАГОЛОВКА 2 => авторизован */	?>
<?php if($this->customer->isLogged()){ ?>
<div class="fixed inset-0 z-50 bg-black/80 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 overlay_rm"></div>

<div id="radix-:r7:" class="fixed z-50 gap-4 bg-background p-6 shadow-lg transition ease-in-out data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:duration-300 data-[state=open]:duration-500 inset-y-0 right-0 h-full border-l data-[state=closed]:slide-out-to-right data-[state=open]:slide-in-from-right sm:max-w-sm w-[300px] right_menu" style="pointer-events: auto;">
	<div class="flex flex-col space-y-2 text-center sm:text-left">
		<h2 id="radix-:r8:" class="text-lg font-semibold text-foreground">Your Account</h2>
	</div>
	
	<div class="flex flex-col h-full">
		<div class="flex-1 py-4">
			<div class="space-y-4">
				<a href="<?php echo $go_profile;?>" class="inline-flex items-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 w-full justify-start">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user mr-2 h-5 w-5"><path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
Profile
				</a>
				
				<a href="<?php echo $go_mykitchen;?>" class="inline-flex items-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 w-full justify-start">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chef-hat mr-2 h-5 w-5">
						<path d="M17 21a1 1 0 0 0 1-1v-5.35c0-.457.316-.844.727-1.041a4 4 0 0 0-2.134-7.589 5 5 0 0 0-9.186 0 4 4 0 0 0-2.134 7.588c.411.198.727.585.727 1.041V20a1 1 0 0 0 1 1Z"></path>
						<path d="M6 17h12"></path>
					</svg>
My Kitchens
				</a>
				
				<a href="<?php echo $go_orderhistory;?>" class="inline-flex items-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 w-full justify-start">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-history mr-2 h-5 w-5">
						<path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8"></path><path d="M3 3v5h5"></path><path d="M12 7v5l4 2"></path>
					</svg>
Order History
				</a>
				
				<a href="<?php echo $go_shoppinglist;?>" class="inline-flex items-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 w-full justify-start">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-list-todo mr-2 h-5 w-5">
						<rect x="3" y="5" width="6" height="6" rx="1"></rect><path d="m3 17 2 2 4-4"></path><path d="M13 6h8"></path><path d="M13 12h8"></path><path d="M13 18h8"></path>
					</svg>
Shopping List
				</a>
			</div>
		</div>
		
		<div class="shrink-0 bg-border h-[1px] w-full"></div>
		
		<div class="py-4 space-y-4">
<?php /*
			<button class="inline-flex items-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 w-full justify-start">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user mr-2 h-5 w-5"><path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
Sign Up
			</button>*/	?>
			
			<a href="<?php echo $go_logout;?>" class="inline-flex items-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 h-10 px-4 py-2 w-full justify-start text-red-500 hover:text-red-500 hover:bg-red-50">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-log-out mr-2 h-5 w-5">
					<path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" x2="9" y1="12" y2="12"></line>
				</svg>
Log Out
			</a>
		</div>
	</div>
	
	<button type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none data-[state=open]:bg-secondary close">
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4">
			<path d="M18 6 6 18"></path>
		<path d="m6 6 12 12"></path></svg>
		<span class="sr-only">Close</span>
	</button>
</div>

<div id="modal_mini_cart" class="fixed z-50 gap-4 bg-background p-6 shadow-lg transition ease-in-out data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:duration-300 data-[state=open]:duration-500 inset-y-0 right-0 h-full w-3/4 border-l data-[state=closed]:slide-out-to-right data-[state=open]:slide-in-from-right sm:max-w-sm">
	<div class="flex flex-col h-full" id="load_mini_cart">
		<div class="flex flex-col space-y-2 text-center sm:text-left">
			<h2 id="radix-:r4:" class="text-lg font-semibold text-foreground">Cart</h2>
		</div>
		<div dir="ltr" class="relative overflow-hidden flex-1 mt-8 pr-4" style="position: relative; --radix-scroll-area-corner-width:0px; --radix-scroll-area-corner-height:0px;">
<style>[data-radix-scroll-area-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-scroll-area-viewport]::-webkit-scrollbar{display:none}
</style>
			<div class="h-full w-full rounded-[inherit]" style="overflow: hidden scroll;">
				<div style="min-width: 100%; display: table;">
					<div class="space-y-4">
					
						<div class="flex items-start gap-4">
							<div class="flex-1 flex gap-4">
								<img src="https://images.unsplash.com/photo-1619546813926-a78fa6372cd2?auto=format&amp;fit=crop&amp;q=80&amp;w=400" alt="Fresh Organic Apples" class="w-16 h-16 object-cover rounded">
								<div>
									<h3 class="font-medium">Fresh Organic Apples</h3>
									<p class="text-sm text-gray-500">Unit</p>
									<div class="flex items-center gap-3 mt-2">
										<button class="p-1 hover:bg-gray-100 rounded" disabled="">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-minus h-4 w-4"><path d="M5 12h14"></path></svg>
										</button>
										<span class="text-sm font-medium w-8 text-center">1</span>
										<button class="p-1 hover:bg-gray-100 rounded">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus h-4 w-4"><path d="M5 12h14"></path><path d="M12 5v14"></path></svg></button>
									</div>
									<p class="text-sm font-medium mt-1">$4.99</p>
								</div>
							</div>
								
							<button class="p-1 hover:bg-gray-100 rounded">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash2 h-5 w-5 text-gray-500"><path d="M3 6h18"></path><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path><line x1="10" x2="10" y1="11" y2="17"></line><line x1="14" x2="14" y1="11" y2="17"></line></svg>
							</button>
						</div>

								
					</div>
				</div>
			</div>
		</div>
				
		<div class="mt-auto pt-6 border-t">
			<div class="space-y-4">
				<div class="flex justify-between font-medium">
					<span >Total</span>
					
					<span>$38.70</span>
				</div>
				
				<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 text-primary-foreground h-10 px-4 py-2 w-full bg-[#022785] hover:bg-[#022785]/90">Go to Checkout</button>
			</div>
		</div>
	</div>
	<button type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none data-[state=open]:bg-secondary">
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg>
		<span class="sr-only">Close</span>
	</button>
</div>

<script type="text/javascript"><!--
$(document).ready(function() {
	$('#button_open_right_menu').on("click",function(){
		$('.overlay_rm').addClass('visible');
		$('.right_menu').addClass('visible');
	});
	$('.right_menu .close').on("click",function(){
		$('.overlay_rm').removeClass('visible');
		$('.right_menu').removeClass('visible');
	});
	$(document).on("click",function(e){
		var rmb = $(".right_menu");
		var rmbb = $("#button_open_right_menu");
		if ( !rmbb.is(e.target) && !rmb.is(e.target) && rmb.has(e.target).length === 0 && rmb.find('.right_menu.visible') ) {
			$('.overlay_rm').removeClass('visible');
			$('.right_menu').removeClass('visible');
		}
	});
	
	$('#open_mini_cart').on("click",function(){
		$('#modal_mini_cart').toggleClass('visible');
	});
	
});
//--></script>
<?php };?>



<?php 
/*
?>
<?php 
echo 'customer_id = ' . (int)$this->customer->getId() . "\n";

?>
Рабочие БД:<br/>
l_my_kitchen <br/>
<?php 
*/ 
?>
</body></html>