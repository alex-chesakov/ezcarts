<?php echo $header; ?>

<div class="container mx-auto px-4 py-8 mt-16 flex-grow">
	<div class="max-w-2xl mx-auto bg-white p-8 rounded-lg shadow-sm">
		<div class="text-center space-y-4">
			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check mx-auto h-16 w-16 text-green-500"><circle cx="12" cy="12" r="10"></circle><path d="m9 12 2 2 4-4"></path></svg>
			<h1 class="text-2xl font-bold text-gray-900">Order Confirmed!</h1>
			<p class="text-gray-600">Thank you for your order. We'll start processing it right away.</p>
		</div>
		<div class="mt-8 border-t pt-8">
			<h2 class="text-lg font-semibold mb-4">Order Summary</h2>
			<div class="space-y-4">
				<div class="flex justify-between">
					<span class="text-gray-600">Order Total</span>
					<span class="font-semibold">$<?php echo $total;?></span>
				</div>
				<div class="flex justify-between">
					<span class="text-gray-600">Delivery Date</span>
					<span class="font-semibold"><?php echo $date_shipping;?></span>
				</div>
				<div class="flex justify-between">
					<span class="text-gray-600">Time Window</span>
					<span class="font-semibold"><?php echo $time_shipping;?></span>
				</div>
			</div>
		</div>
		<div class="mt-8 space-y-4">
	
			<a href="<?php echo $go_shop;?>" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 text-primary-foreground h-10 px-4 py-2 w-full bg-green-500 hover:bg-green-600">Continue Shopping</a>
		</div>
	</div>
</div>

<?php echo $footer; ?>