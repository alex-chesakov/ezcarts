<?php echo $header; ?>

<div data-state="open">
	<div data-state="open" id="radix-:r1a:" style="transition-duration: 0s; animation-name: none; --radix-collapsible-content-height:2196px; --radix-collapsible-content-width:1062px;">
		<div class="space-y-6">
			<div class="block lg:flex lg:gap-6">
				<div class="flex-1 space-y-6">
					<div class="space-y-4">
						<div class="flex justify-between items-start">
							<div>
								<div class="flex items-center gap-2">
									<h1 class="text-2xl font-bold">Order ORD-<?php echo $order_id;?></h1>
									<div class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent text-white hover:bg-yellow-600 order_status<?php echo $order_status_id;?>"><?php echo $order_status;?></div>
								</div>
								<p class="text-gray-500">Placed on <?php echo $date_added;?></p>
							</div>
<?php if($order_status_id==0 or $order_status_id==1){ /* for new or assigned statusses */?>
	<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 text-primary-foreground h-9 rounded-md px-3 bg-green-500 hover:bg-green-600 w-full md:w-auto" id="start_collector">
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-play mr-2 h-4 w-4"><polygon points="6 3 20 12 6 21 6 3"></polygon></svg>Start Collection
	</button>
<?php }elseif( !empty($start_timer) and in_array($order_status_id,array(0,1,2))){ ?>
	<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 text-primary-foreground h-9 rounded-md px-3 bg-green-500 hover:bg-green-600 w-full md:w-auto <?php if(!empty($stop_timer)){ ?>stop<?php };?>" id="timer">

<?php if(!empty($stop_timer)){
$hours = floor(($stop_timer - $start_timer) / 3600);
$minutes = floor((($stop_timer - $start_timer) % 3600) / 60);
$seconds = ($stop_timer - $start_timer) % 60;
printf("%02d:%02d:%02d", $hours, $minutes, $seconds);
	};?>
	</button>

<script>
$(document).ready(function() {
	$('#timer').live("click",function(){
		$.ajax({
			url: 'index.php?route=sale/ordercollector/timer&token=<?php echo $token; ?>&order_id=<?php echo $order_id;?>',

			dataType: 'json',
			success: function(json) {
				clearInterval(intervalId_timer);

				if(json['start']){
					var startTimestamp_timer = json['start'];
					var clientNow_timer = Math.floor(Date.now() / 1000);
					let elapsed_timer = clientNow_timer - startTimestamp_timer;
$('#timer').removeClass('stop');
					intervalId_timer = setInterval(updateTimer, 1000);
				}
				if(json['stop']){
$('#timer').addClass('stop');
				}
			}
		});
	});
});

var intervalId_timer;

var startTimestamp_timer = <?php echo $start_timer; ?>;
var clientNow_timer = <?php if(!empty($stop_timer)){ echo $stop_timer; }else{ ?>Math.floor(Date.now() / 1000)<?php };?>;
let elapsed_timer = clientNow_timer - startTimestamp_timer;
function formatTime(seconds) {
	let hrs = Math.floor(seconds / 3600);
	let mins = Math.floor((seconds % 3600) / 60);
	let secs = seconds % 60;

	hrs = hrs < 0 ? 0 : hrs;
	mins = mins < 0 ? 0 : mins;
	secs = secs < 0 ? 0 : secs;

	return `${hrs.toString().padStart(2, '0')}:${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
}
function updateTimer() {
	document.getElementById('timer').textContent = formatTime(elapsed_timer);
	elapsed_timer++;
}
updateTimer();

<?php if(empty($stop_timer)){ ?>
	intervalId_timer = setInterval(updateTimer, 1000);
<?php };?>
</script>
<?php }elseif( !empty($start_timer) and !empty($stop_timer) ){ ?>
	<div class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 text-primary-foreground h-9 rounded-md px-3 bg-green-500 w-full md:w-auto"><?php if(!empty($stop_timer)){
$hours = floor(($stop_timer - $start_timer) / 3600);
$minutes = floor((($stop_timer - $start_timer) % 3600) / 60);
$seconds = ($stop_timer - $start_timer) % 60;
printf("%02d:%02d:%02d", $hours, $minutes, $seconds);;
	};?>
	</div>
<?php };?>

						</div>
					</div>
					
					<div data-state="open">
						<div class="rounded-lg border bg-card text-card-foreground shadow-sm">
<input type="checkbox" name="open_spoler_2" value="1" class="hidden input_spoiler" id="open_spoler_2" checked="checked"/>
							<div class="flex p-6 pb-3 title_spoiler">
								<label for="open_spoler_2" class="flex w-full items-center justify-between">
									<h3 class="tracking-tight flex items-center gap-2 text-lg font-medium">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-info h-5 w-5 text-muted-foreground"><circle cx="12" cy="12" r="10"></circle><path d="M12 16v-4"></path><path d="M12 8h.01"></path></svg>Order Details
									</h3>
									<i><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 text-muted-foreground transition-transform duration-200 transform"><path d="m6 9 6 6 6-6"></path></svg></i>
								</label>
							</div>
							
							<div class="spoiler_block">
								<div class="p-6 pt-0">
									<div class="space-y-4">
										<div class="grid gap-x-6 gap-y-3">
											<div class="border-b pb-4">
												<div class="grid grid-cols-2 gap-x-6">
													<div>
														<p class="text-sm text-muted-foreground">Delivery Date</p>
														<p class="font-medium" id="in_a1"><?php echo $date_shipping;?></p>
													</div>
													<div class="space-y-3">
														<div>
															<p class="text-sm text-muted-foreground">Collection Window</p>
															<p class="font-medium"><?php echo $collection_window;?></p>
														</div>
														<div>
															<p class="text-sm text-muted-foreground">Delivery Window</p>
															<p class="font-medium" id="in_a2"><?php echo $time_shipping;?></p>
														</div>
													</div>
												</div>
											</div>
											
											<div class="grid grid-cols-2 gap-x-6">
												<div>
													<p class="text-sm text-muted-foreground">Payment Status</p>
													<p class="font-medium" id="in_a3"><?php echo $order_payment_status;?></p>
												</div>
												<div>
													<p class="text-sm text-muted-foreground">Total Items</p>
													<p class="font-medium"><?php echo count($order_products);?></p>
												</div>
											</div>
										</div>
										
										<div class="grid grid-cols-2 gap-6 pt-2 border-t">
											<div>
												<p class="text-sm font-medium mb-2">Delivery from:</p>
												<div class="space-y-2">
													<div class="text-sm">
														<p class="font-medium text-primary"><?php echo $location;?></p>
														<p class="text-muted-foreground"><?php ?></p>
													</div>
												</div>
											</div>
											
											<div>
												<p class="text-sm font-medium mb-2">Delivery to:</p>
												<div class="text-sm">
													<?php if(!empty($kitchen_checkout)){ ?>
														<p class="font-medium text-primary"></p>
														<p class="text-muted-foreground"><?php echo $kitchen_checkout['name'];?></p>
														<p class="text-muted-foreground"><?php echo $kitchen_checkout['address'];?></p>
														<p class="text-muted-foreground"></p>
													<?php };?>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="rounded-lg border bg-card text-card-foreground shadow-sm">
						<div class="flex space-y-1.5 p-6">
							<div class="flex items-center justify-between w-100">
								<h3 class="text-2xl font-semibold leading-none tracking-tight flex items-center gap-2">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-package2 h-5 w-5"><path d="M3 9h18v10a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V9Z"></path><path d="m3 9 2.45-4.9A2 2 0 0 1 7.24 3h9.52a2 2 0 0 1 1.8 1.1L21 9"></path><path d="M12 3v6"></path></svg>Order Items
								</h3>
<?php if($order_status_id==2){ ?>
								<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 text-muted-foreground" type="button" id="add_products"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus mr-2 h-4 w-4"><path d="M5 12h14"></path><path d="M12 5v14"></path></svg>Add Product</button>
<?php };?>
							</div>
						</div>
						
						<div class="p-6 pt-0">
							<div class="space-y-4" id="recalctotals">
							
								<?php foreach($order_products as $product){ ?>
									<div class="flex border-b pb-4 last:border-0 relative min-h-[160px] opi order_product_id<?php echo $product['order_product_id'];?>" data-order_product_id="<?php echo $product['order_product_id'];?>">
										<div class="space-y-1">
											<div class="flex items-center gap-2 flex-wrap pr-[140px]">
												<p class="font-medium"><?php echo $product['name'];?></p>
											</div>
											<p class="font-medium">BIN: <?php echo $product['bin'];?></p>
											<p class="text-sm text-gray-500 mt-2">Price: $<?php echo number_format((float)$product['price'],2);?>/<?php echo $product['type'];?></p>
											<div class="flex flex-col gap-2 mt-2">
<?php /* collector adjusted status */ ?>
												<?php if((int)$product['status_collect_product']!==1 and empty($product['old_quantity'])){ ?>
													<div class="flex items-center gap-2">
														<label class="text-sm text-gray-500 ">Booked Qty:</label>
														<span class="text-sm font-medium "><?php echo $product['quantity'];?></span>
													</div>
												<?php }else{ ?>
													<div class="flex items-center gap-2">
														<label class="text-sm text-gray-500 line-through text-gray-400">Booked Qty:</label><span class="text-sm font-medium line-through text-gray-400"><?php echo $product['old_quantity'];?></span>
													</div>
													<div class="flex items-center gap-2">
														<label class="text-sm text-green-600">Adjusted Qty:</label>
														<span class="text-sm font-medium text-green-600"><?php echo $product['quantity'];?></span>
													</div>
												<?php };?>
											</div>
										</div>
										
										<div class="absolute right-0 top-0 flex flex-col items-end gap-2 w-[140px]">
<?php /*	изменение collected */	?>
<?php if($order_status_id==2){ ?>
											<div class="dropdown_group block_collected_stat">
												<button class="text-xs px-2 py-1 rounded inline-flex items-center gap-1 hover:opacity-90 transition-opacity change_collected collected_status<?php echo $product['status_collect_product'];?>" type="button">
													<?php echo $product['collected_status'];?>
													<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-3 w-3"><path d="m6 9 6 6 6-6"></path></svg>
												</button>

												<div class="dropdown">
													<?php foreach($all_collected_status as $o_s_id=>$o_s){ ?>
														<label>
														<?php if($product['status_collect_product'] == $o_s_id){ ?>
															<input type="radio" name="change_collected_status" value="<?php echo $o_s_id;?>" checked data-order_product_id="<?php echo $product['order_product_id'];?>" class="thischecked">
														<?php }else{ ?>
															<input type="radio" name="change_collected_status" value="<?php echo $o_s_id;?>" data-order_product_id="<?php echo $product['order_product_id'];?>">
														<?php };?>
														<div class="title_drop"><?php echo $o_s;?></div></label>
													<?php };?>
												</div>
											</div>
<?php }else{ ?>
								
												<button class="text-xs px-2 py-1 rounded inline-flex items-center gap-1 hover:opacity-90 transition-opacity  collected_status<?php echo $product['status_collect_product'];?>" type="button">
													<?php echo $product['collected_status'];?>
												</button>


									
<?php };?>
<?php /* collector adjusted status */ ?>
<div class="flex flex-col items-end gap-1"><span class="font-medium">$<?php echo number_format((float)$product['total'],2);?></span></div>
											<?php /*if((int)$product['status_collect_product']!==1 and empty($product['old_quantity'])){ ?>
												<div class="flex flex-col items-end gap-1"><span class="font-medium">$<?php echo number_format((float)$product['total'],2);?></span></div>
											<?php }else{ ?>
												<div class="flex flex-col items-end gap-1">
													<span class="text-xs font-medium line-through text-gray-400">$<?php echo number_format((float)$product['old_total'],2);?></span>
													<span class="font-medium text-green-600">$<?php echo number_format((float)$product['total'],2);?></span>
												</div>
											<?php };*/ ?>
<?php /*	удаление товара */	?>
<?php if($order_status_id==2){ ?>
											<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 h-8 w-8 text-red-500 hover:text-red-600 hover:bg-red-50 delete_product" data-order_product_id="<?php echo $product['order_product_id'];?>">
												<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash2 h-4 w-4"><path d="M3 6h18"></path><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path><line x1="10" x2="10" y1="11" y2="17"></line><line x1="14" x2="14" y1="11" y2="17"></line></svg>
											</button>
<?php };?>
										</div>
									</div>
								<?php };?>

								
								<div class="pt-4 space-y-2 border-t" id="totals_order">
									<div class="pb-4 border-b space-y-1">
										<p class="text-sm text-gray-500">Collection Status Summary:</p>
										<div class="grid grid-cols-3 gap-4">
											<?php foreach($collection_status as $name_collect=>$collect){ ?>
												<div>
													<p class="text-sm font-medium"><?php echo $collect;?></p>
													<p class="text-xs text-gray-500"><?php echo $name_collect;?></p>
												</div>
											<?php };?>
										</div>
									</div>
									<?php foreach($totals as $to){ ?>
										<div class="flex justify-between text-sm">
											<p class="text-gray-500"><?php echo $to['title'];?></p>
											<div class="flex items-center gap-2">
												<p class="">$<?php echo $to['value'];?></p>
											</div>
										</div>
									<?php };?>
<?php /* in progress */ ?>
<?php if($order_status_id==2){ ?>
									<div class="flex justify-end gap-2 pt-2">
										<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 py-2 bg-green-500 hover:bg-green-600 text-white h-8 text-sm px-3" id="collect_compl">Collection Complete</button>

									</div>
<?php };?>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="w-full lg:w-80 space-y-6" id="load_details_order">
					<div class="hidden lg:block">
						<div data-state="open">
							<div class="rounded-lg border bg-card text-card-foreground shadow-sm">
								<input type="checkbox" name="open_spoler_1" value="1" class="hidden input_spoiler" id="open_spoler_1" checked />
								
								<div class="flex p-6 pb-3 title_spoiler">
									<label for="open_spoler_1" class="flex w-full items-center justify-between">
										<h3 class="tracking-tight flex items-center gap-2 text-lg font-medium">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-file-text h-5 w-5"><path d="M15 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7Z"></path><path d="M14 2v4a2 2 0 0 0 2 2h4"></path><path d="M10 9H8"></path><path d="M16 13H8"></path><path d="M16 17H8"></path></svg>Order Requirements
											
										</h3>
										
									</label>
					
									<i><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 transition-transform duration-200 transform"><path d="m6 9 6 6 6-6"></path></svg></i>
								</div>
								
								<div id="load_req" class="spoiler_block">
									<div class="p-6 pt-0">
										<ul class="list-disc list-inside space-y-1">
											<?php if(!empty($unavailable)){ ?>
												<li class="text-sm text-muted-foreground">
													Allow substitutions for unavailable items
												</li>
											<?php };?>
											<?php if(!empty($collector)){ ?>
												<li class="text-sm text-muted-foreground">
													Call from collector if needed
												</li>
											<?php };?>
											<?php if(!empty($order_req)){ ?>
												<?php foreach($order_req as $o_r){ ?>
													<li><?php echo $o_r['name'];?></li>
												<?php };?>
											<?php };?>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div data-state="open">
						<div class="rounded-lg border bg-card text-card-foreground shadow-sm">
							<input type="checkbox" name="open_spoler_3" value="1" class="hidden input_spoiler" id="open_spoler_3" checked >
							
							<div class="flex flex-col space-y-1.5 p-6 title_spoiler">
								<label for="open_spoler_3" class="flex w-full items-center justify-between">
									<h3 class="font-semibold tracking-tight flex items-center gap-2 text-lg">
										<div class="flex items-center gap-2">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user h-5 w-5"><path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>Customer Information
										</div>

									</h3>
									<i><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 transition-transform duration-200 transform"><path d="m6 9 6 6 6-6"></path></svg></i>
								</label>
							</div>
							
							<div id="radix-:r36:" class="spoiler_block">
								<div class="p-6 pt-0">
									<div class="space-y-4">
										<div>
											<?php if(!empty($customer_checkout)){ ?>
												<p class="font-medium"><?php echo $customer_checkout['firstname'];?></p>
												<p class="text-sm text-gray-500"><?php echo $customer_checkout['email'];?></p>
												<p class="text-sm text-gray-500"><?php echo $customer_checkout['telephone'];?></p>
											<?php };?>
										</div>
										
										<div>
											<p class="font-medium mb-1">Shipping Address</p>
											<?php if(!empty($kitchen_checkout)){ ?>
												<p class="text-sm text-gray-500"><?php echo $kitchen_checkout['name'];?></p>
												<p class="text-sm text-gray-500"><?php echo $kitchen_checkout['address'];?></p>
												<p class="text-sm text-gray-500"></p>
											<?php };?>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="space-y-6">
						<div data-state="open">
						
							<div class="rounded-lg border bg-card text-card-foreground shadow-sm">
								<input type="checkbox" name="open_spoler_4" value="1" class="hidden input_spoiler" id="open_spoler_4" checked >
								
								<div class="flex flex-col space-y-1.5 p-6 title_spoiler">
									<label for="open_spoler_4" class="flex w-full items-center justify-between">
										<h3 class="font-semibold tracking-tight flex items-center justify-between text-lg w-full">
											<div class="flex items-center gap-2">
												<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user-cog h-5 w-5"><circle cx="18" cy="15" r="3"></circle><circle cx="9" cy="7" r="4"></circle><path d="M10 15H6a4 4 0 0 0-4 4v2"></path><path d="m21.7 16.4-.9-.3"></path><path d="m15.2 13.9-.9-.3"></path><path d="m16.6 18.7.3-.9"></path><path d="m19.1 12.2.3-.9"></path><path d="m19.6 18.7-.4-1"></path><path d="m16.8 12.3-.4-1"></path><path d="m14.3 16.6 1-.4"></path><path d="m20.7 13.8 1-.4"></path></svg>Collector Information
											</div>

										</h3>
										<i><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 transition-transform duration-200 transform"><path d="m6 9 6 6 6-6"></path></svg></i>
									</label>
								</div>
								
								<div id="radix-:r3a:" class="spoiler_block">
									<div class="p-6 pt-0">
										<div class="space-y-2">
											<?php if(!empty($collector_data)){ ?>
												<p class="font-medium"><?php echo $collector_data['firstname'];?></p>
												<p class="text-sm text-gray-500"><?php echo $collector_data['email'];?></p>
												<p class="text-sm text-gray-500"><?php echo $collector_data['telephone'];?></p>
											<?php };?>
											<div class="mt-4">
												<h3 class="font-bold text-base mb-1">Collection Window</h3>
												<p class="text-sm text-gray-500"><?php echo $collection_window;?></p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div data-state="open">
							<div class="rounded-lg border bg-card text-card-foreground shadow-sm">
								<div class="flex flex-col space-y-1.5 p-6">
									<button type="button" aria-controls="radix-:r3e:" aria-expanded="true" data-state="open" class="flex w-full items-center justify-between">
										<h3 class="font-semibold tracking-tight flex items-center gap-2 text-lg">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-image h-5 w-5"><rect width="18" height="18" x="3" y="3" rx="2" ry="2"></rect><circle cx="9" cy="9" r="2"></circle><path d="m21 15-3.086-3.086a2 2 0 0 0-2.828 0L6 21"></path></svg>Proof of Collection
										</h3>
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 transition-transform duration-200 transform rotate-180"><path d="m6 9 6 6 6-6"></path></svg>
									</button>
								</div>

								<div data-state="open" id="radix-:r3e:" style="transition-duration: 0s; animation-name: none; --radix-collapsible-content-height:151.438px; --radix-collapsible-content-width:318px;">
									<div class="p-6 pt-0">
										<div>
											<div class="grid grid-cols-2 gap-4">
												<?php for($k=1;$k<=2;$k++){ ?>
													<div class="relative aspect-video rounded-lg border bg-muted">
														<div class="flex h-full items-center justify-center">
															<div>
																<?php if(!empty($proofs) and !empty($proofs[$k])){ ?>
																	<img src="<?php echo $proofs[$k]['resize'];?>">
																	
																<?php }else{ ?>
																	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-upload h-8 w-8 text-gray-400"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="17 8 12 3 7 8"></polyline><line x1="12" x2="12" y1="3" y2="15"></line></svg>
																<?php };?>
															</div>
														</div>
													</div>
												<?php };?>
												
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="modal_file_upload" class="hidden fixed left-[50%] top-[50%] z-50 grid w-full translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[state=closed]:slide-out-to-left-1/2 data-[state=closed]:slide-out-to-top-[48%] data-[state=open]:slide-in-from-left-1/2 data-[state=open]:slide-in-from-top-[48%] sm:rounded-lg max-w-3xl" tabindex="-1">
	<div class="flex flex-col space-y-1.5 text-center sm:text-left">
		<h2 id="radix-:r17:" class="text-lg font-semibold leading-none tracking-tight">Upload Proof of Collection</h2>
	</div>
	
	<div>
		<div class="grid grid-cols-2 gap-4" id="images_uf">
			<?php for($k=1;$k<=2;$k++){ /* count($proofs) */?>
				<div class="relative aspect-video rounded-lg border bg-muted">
					<div class="flex h-full items-center justify-center bu_i overflow-hidden">
						<label class="cursor-pointer" id="upload_file<?php echo $k;?>">
							<?php if(!empty($proofs) and !empty($proofs[$k])){ ?>
								<img src="<?php echo $proofs[$k]['resize'];?>">
								<input type="hidden" class="file_upload<?php echo $k;?>" name="upload[]" value="<?php echo $proofs[$k]['file'];?>">
							<?php }else{ ?>
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-upload h-8 w-8 text-gray-400"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="17 8 12 3 7 8"></polyline><line x1="12" x2="12" y1="3" y2="15"></line></svg>
							<?php };?>
						</label>
						<?php /*			<button class="deletei">delete</button>*/	?>
					</div>
				</div>
			<?php };?>
		</div>
		
		<div class="mt-4 flex justify-end">
			<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 h-10 px-4 py-2 bg-green-500 hover:bg-green-600 text-white" id="save_files">Save</button>
		</div>
		
	</div>
	
	<button type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2  data-[state=open]:bg-accent data-[state=open]:text-muted-foreground close"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg><span class="sr-only">Close</span></button>
</div>



<script type="text/javascript"><!--
function changecoll(objcoll){
	opid = $(objcoll).attr('data-order_product_id');
	opid = parseInt(opid);
	cs = $(objcoll).val();
	var selected_coll = $(objcoll).closest('label').find('.title_drop').html();
	var targ_coll = $(objcoll).closest('.block_collected_stat').find('.change_collected');
	$.ajax({
		url: 'index.php?route=sale/ordercollector/changecoll&token=<?php echo $token; ?>',
		type: 'post',
		data: 'order_product_id=' + opid + '&coll_stat=' + cs + '&order_id=<?php echo $order_id;?>',
		dataType: 'json',
		success: function(json) {
			if(json['success']){
				html = '<div id="notifications_f8"><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span><ol tabindex="-1" class="fixed top-0 z-[100] flex max-h-screen w-full flex-col-reverse p-4 sm:bottom-0 sm:right-0 sm:top-auto sm:flex-col md:max-w-[420px]"><li role="status" aria-live="off" aria-atomic="true" tabindex="0" data-state="open" data-swipe-direction="right" class="group pointer-events-auto relative flex w-full items-center justify-between space-x-4 overflow-hidden rounded-md p-6 pr-8 shadow-lg transition-all data-[swipe=cancel]:translate-x-0 data-[swipe=end]:translate-x-[var(--radix-toast-swipe-end-x)] data-[swipe=move]:translate-x-[var(--radix-toast-swipe-move-x)] data-[swipe=move]:transition-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[swipe=end]:animate-out data-[state=closed]:fade-out-80 data-[state=closed]:slide-out-to-right-full data-[state=open]:slide-in-from-top-full data-[state=open]:sm:slide-in-from-bottom-full border bg-background text-foreground" data-radix-collection-item="" data-swipe="cancel" style="user-select: none; touch-action: none;"><div class="grid gap-1"><div class="text-sm font-semibold">Order status updated</div><div class="text-sm opacity-90">' + json['success'] + '</div></div><button type="button" class="absolute right-2 top-2 rounded-md p-1 text-foreground/50 opacity-0 transition-opacity hover:text-foreground focus:opacity-100 focus:outline-none focus:ring-2 group-hover:opacity-100 group-[.destructive]:text-red-300 group-[.destructive]:hover:text-red-50 group-[.destructive]:focus:ring-red-400 group-[.destructive]:focus:ring-offset-red-600" toast-close="" data-radix-toast-announce-exclude=""><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg></button></li></ol><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span></div>';
				$('body').append(html);
				$(targ_coll).html(selected_coll + '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-3 w-3"><path d="m6 9 6 6 6-6"></path></svg>');
				$('#recalctotals').load("index.php?route=sale/ordercollector/update&order_id=<?php echo $order_id;?>&token=<?php echo $token;?> #recalctotals > *");
					
				$('.overlay').remove();
				$('#modal_change_status').remove();
				$('#notifications_f8').remove();
				$('#modal_delivery_order').remove();
				$('#modal_customer_data').remove();
				$('#modal_collector_data').remove();
				$('#modal_product_data').remove();
			}
		},
	});
}

$(document).ready(function() {

<?php /*	Start Collection - push */ ?>
	$('#start_collector').live("click",function(){
		$.ajax({
			url: 'index.php?route=sale/ordercollector/changestatus&token=<?php echo $token; ?>&order_id=<?php echo $order_id;?>',
			dataType: 'json',
			success: function(json) {
				
				if(json['success']){
					<?php /* html = '<div id="notifications_f8"><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span><ol tabindex="-1" class="fixed top-0 z-[100] flex max-h-screen w-full flex-col-reverse p-4 sm:bottom-0 sm:right-0 sm:top-auto sm:flex-col md:max-w-[420px]"><li role="status" aria-live="off" aria-atomic="true" tabindex="0" data-state="open" data-swipe-direction="right" class="group pointer-events-auto relative flex w-full items-center justify-between space-x-4 overflow-hidden rounded-md p-6 pr-8 shadow-lg transition-all data-[swipe=cancel]:translate-x-0 data-[swipe=end]:translate-x-[var(--radix-toast-swipe-end-x)] data-[swipe=move]:translate-x-[var(--radix-toast-swipe-move-x)] data-[swipe=move]:transition-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[swipe=end]:animate-out data-[state=closed]:fade-out-80 data-[state=closed]:slide-out-to-right-full data-[state=open]:slide-in-from-top-full data-[state=open]:sm:slide-in-from-bottom-full border bg-background text-foreground" data-radix-collection-item="" data-swipe="cancel" style="user-select: none; touch-action: none;"><div class="grid gap-1"><div class="text-sm font-semibold">Order status updated</div><div class="text-sm opacity-90">' + json['success'] + '</div></div><button type="button" class="absolute right-2 top-2 rounded-md p-1 text-foreground/50 opacity-0 transition-opacity hover:text-foreground focus:opacity-100 focus:outline-none focus:ring-2 group-hover:opacity-100 group-[.destructive]:text-red-300 group-[.destructive]:hover:text-red-50 group-[.destructive]:focus:ring-red-400 group-[.destructive]:focus:ring-offset-red-600" toast-close="" data-radix-toast-announce-exclude=""><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg></button></li></ol><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span></div>';
					$('body').append(html);*/	?>
					location.reload();
				}
			}
		});
	});
<?php /*	изменение статуса ТОВАРА */ ?>
<?php /*
	$('.block_collected_stat input[type=radio]').live("change",function(){
		opid = $(this).attr('data-order_product_id');
		opid = parseInt(opid);
		cs = $(this).val();
		var selected_coll = $(this).closest('label').find('.title_drop').html();
		var targ_coll = $(this).closest('.block_collected_stat').find('.change_collected');
		$.ajax({
			url: 'index.php?route=sale/ordercollector/changecoll&token=<?php echo $token; ?>',
			type: 'post',
			data: 'order_product_id=' + opid + '&coll_stat=' + cs + '&order_id=<?php echo $order_id;?>',
			dataType: 'json',
			success: function(json) {

				if(json['success']){
					html = '<div id="notifications_f8"><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span><ol tabindex="-1" class="fixed top-0 z-[100] flex max-h-screen w-full flex-col-reverse p-4 sm:bottom-0 sm:right-0 sm:top-auto sm:flex-col md:max-w-[420px]"><li role="status" aria-live="off" aria-atomic="true" tabindex="0" data-state="open" data-swipe-direction="right" class="group pointer-events-auto relative flex w-full items-center justify-between space-x-4 overflow-hidden rounded-md p-6 pr-8 shadow-lg transition-all data-[swipe=cancel]:translate-x-0 data-[swipe=end]:translate-x-[var(--radix-toast-swipe-end-x)] data-[swipe=move]:translate-x-[var(--radix-toast-swipe-move-x)] data-[swipe=move]:transition-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[swipe=end]:animate-out data-[state=closed]:fade-out-80 data-[state=closed]:slide-out-to-right-full data-[state=open]:slide-in-from-top-full data-[state=open]:sm:slide-in-from-bottom-full border bg-background text-foreground" data-radix-collection-item="" data-swipe="cancel" style="user-select: none; touch-action: none;"><div class="grid gap-1"><div class="text-sm font-semibold">Order status updated</div><div class="text-sm opacity-90">' + json['success'] + '</div></div><button type="button" class="absolute right-2 top-2 rounded-md p-1 text-foreground/50 opacity-0 transition-opacity hover:text-foreground focus:opacity-100 focus:outline-none focus:ring-2 group-hover:opacity-100 group-[.destructive]:text-red-300 group-[.destructive]:hover:text-red-50 group-[.destructive]:focus:ring-red-400 group-[.destructive]:focus:ring-offset-red-600" toast-close="" data-radix-toast-announce-exclude=""><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg></button></li></ol><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span></div>';
					$('body').append(html);
					$(targ_coll).html(selected_coll + '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-3 w-3"><path d="m6 9 6 6 6-6"></path></svg>');
					$('#totals_order').load("index.php?route=sale/ordercollector/update&order_id=<?php echo $order_id;?>&token=<?php echo $token;?> #totals_order > *");
					$('.overlay').remove();
					$('#modal_change_status').remove();
					$('#notifications_f8').remove();
					$('#modal_delivery_order').remove();
					$('#modal_product_data').remove();
				}
			},
		});
	});
*/	?>
<?php /*	Change status collected */ ?>
	$(document).off('click', '.block_collected_stat label').on('click', '.block_collected_stat label', function(e) {
		e.stopPropagation();
		var inp_bcs = $(this).find('input[type=radio]');

		if($(inp_bcs).val() == '1'){
			$('#adjust_modal').remove();
			html = '<div id="adjust_modal" class="z-50 rounded-md border bg-popover text-popover-foreground shadow-md outline-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2 w-48 p-2" tabindex="-1" style="--radix-popover-content-transform-origin:var(--radix-popper-transform-origin); --radix-popover-content-available-width:var(--radix-popper-available-width); --radix-popover-content-available-height:var(--radix-popper-available-height); --radix-popover-trigger-width:var(--radix-popper-anchor-width); --radix-popover-trigger-height:var(--radix-popper-anchor-height);">';
			html+= '<div class="space-y-1">';
			html+= '<div class="space-y-2">';
			html+= '<input type="number" class="flex h-10 rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 md:text-sm w-full" placeholder="Adjusted quantity" value="">';
			html+= '<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2   [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 w-full save">Save</button>';
			html+= '</div>';
			html+= '</div>';
			html+= '</div>';
console.log('open adjust_modal');
			$(inp_bcs).closest('.block_collected_stat').append(html);
$('.block_collected_stat .dropdown').removeClass('open');
		}else{
			
			opid = $(inp_bcs).attr('data-order_product_id');
			opid = parseInt(opid);
			cs = $(inp_bcs).val();
			var selected_coll = $(inp_bcs).closest('label').find('.title_drop').html();
			var targ_coll = $(inp_bcs).closest('.block_collected_stat').find('.change_collected');
			$.ajax({
				url: 'index.php?route=sale/ordercollector/changecoll&token=<?php echo $token; ?>',
				type: 'post',
				data: 'order_product_id=' + opid + '&coll_stat=' + cs + '&order_id=<?php echo $order_id;?>',
				dataType: 'json',
				success: function(json) {

					if(json['success']){
						html = '<div id="notifications_f8"><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span><ol tabindex="-1" class="fixed top-0 z-[100] flex max-h-screen w-full flex-col-reverse p-4 sm:bottom-0 sm:right-0 sm:top-auto sm:flex-col md:max-w-[420px]"><li role="status" aria-live="off" aria-atomic="true" tabindex="0" data-state="open" data-swipe-direction="right" class="group pointer-events-auto relative flex w-full items-center justify-between space-x-4 overflow-hidden rounded-md p-6 pr-8 shadow-lg transition-all data-[swipe=cancel]:translate-x-0 data-[swipe=end]:translate-x-[var(--radix-toast-swipe-end-x)] data-[swipe=move]:translate-x-[var(--radix-toast-swipe-move-x)] data-[swipe=move]:transition-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[swipe=end]:animate-out data-[state=closed]:fade-out-80 data-[state=closed]:slide-out-to-right-full data-[state=open]:slide-in-from-top-full data-[state=open]:sm:slide-in-from-bottom-full border bg-background text-foreground" data-radix-collection-item="" data-swipe="cancel" style="user-select: none; touch-action: none;"><div class="grid gap-1"><div class="text-sm font-semibold">Order status updated</div><div class="text-sm opacity-90">' + json['success'] + '</div></div><button type="button" class="absolute right-2 top-2 rounded-md p-1 text-foreground/50 opacity-0 transition-opacity hover:text-foreground focus:opacity-100 focus:outline-none focus:ring-2 group-hover:opacity-100 group-[.destructive]:text-red-300 group-[.destructive]:hover:text-red-50 group-[.destructive]:focus:ring-red-400 group-[.destructive]:focus:ring-offset-red-600" toast-close="" data-radix-toast-announce-exclude=""><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg></button></li></ol><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span></div>';
						$('body').append(html);
						$(targ_coll).html(selected_coll + '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-3 w-3"><path d="m6 9 6 6 6-6"></path></svg>');
						$('#totals_order').load("index.php?route=sale/ordercollector/update&order_id=<?php echo $order_id;?>&token=<?php echo $token;?> #totals_order > *");
						$('.overlay').remove();
						$('#modal_change_status').remove();
						$('#notifications_f8').remove();
						$('#modal_delivery_order').remove();
						$('#modal_product_data').remove();
						
						changecoll($(inp_bcs));
					}
				},
			});
			
		}
	});
	$('#adjust_modal .save').live("click",function(){
		if($('#adjust_modal input[type=number]').val() > 0){
			var objtmp = $(this);
			$.get("index.php?route=sale/ordercollector/oldq&order_id=<?php echo $order_id;?>&opid=" + $(this).closest('.opi').attr('data-order_product_id') + "&q=" + $('#adjust_modal input[type=number]').val() + "&token=<?php echo $token;?>", function(response) {
				$.ajax({
					url: 'index.php?route=sale/ordercollector/recalctotal&token=<?php echo $token; ?>',
					type: 'post',
					data: 'order_product_id=' + $(objtmp).closest('.opi').find('.q_change').attr('data-order_product_id') + '&quantity=' + $('#adjust_modal input[type=number]').val() + '&order_id=<?php echo $order_id;?>',
					dataType: 'json',
					success: function(json) {
<?php /* reload totals */	?>
						if(json['success']){
							var objtmp2 = $(objtmp).closest('.opi').find('.block_collected_stat input[type=radio]:checked');
							
							$('#recalctotals').load("index.php?route=sale/ordercollector/update&order_id=<?php echo $order_id;?>&token=<?php echo $token;?> #recalctotals > *",false,function(){
								changecoll($(objtmp2));
							});

						}
					},
				});
			}); 

		}
	});


<?php /*	редактирование данных */	?>
	var m_deliveryDate = '<?php echo $date_shipping;?>';
<?php /*	Добавляем товар */ ?>
	$('#add_products').live("click",function(){
		$('.overlay').remove();
		$('#modal_product_data').remove();
		
		html = '<div data-state="open" class="fixed inset-0 z-50 bg-black/80 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 overlay"></div>';
		
		html+= '<div id="modal_product_data" class="fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[state=closed]:slide-out-to-left-1/2 data-[state=closed]:slide-out-to-top-[48%] data-[state=open]:slide-in-from-left-1/2 data-[state=open]:slide-in-from-top-[48%] sm:rounded-lg sm:max-w-[425px]" tabindex="-1" style="pointer-events: auto;">';
		html+= '<div class="flex flex-col space-y-1.5 text-center sm:text-left">';
		html+= '<h2 id="radix-:r1n:" class="text-lg font-semibold leading-none tracking-tight">Add Product</h2>';
		html+= '</div>';
		html+= '<div class="relative w-full">';
		html+= '<div tabindex="-1" class="flex h-full w-full flex-col overflow-hidden bg-popover text-popover-foreground border rounded-md" cmdk-root="">';
		html+= '<label cmdk-label="" for=":r46:" id=":r45:" style="position: absolute; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; border-width: 0px;"></label>';
		html+= '<div class="flex items-center border-b px-3" cmdk-input-wrapper=""><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search mr-2 h-4 w-4 shrink-0 opacity-50"><circle cx="11" cy="11" r="8"></circle><path d="m21 21-4.3-4.3"></path></svg><input class="flex h-11 w-full rounded-md bg-transparent py-3 text-sm outline-none placeholder:text-muted-foreground disabled:cursor-not-allowed disabled:opacity-50" placeholder="Search products..." id="search_load_products" type="text" value=""></div>';
		html+= '<div class="max-h-[300px] overflow-y-auto overflow-x-hidden" cmdk-list="" role="listbox" aria-label="Suggestions" id=":r44:" style="--cmdk-list-height:392px;">';
		html+= '<div cmdk-list-sizer="">';
		html+= '<div class="overflow-hidden text-foreground [&amp;_[cmdk-group-heading]]:px-2 [&amp;_[cmdk-group-heading]]:py-1.5 [&amp;_[cmdk-group-heading]]:text-xs [&amp;_[cmdk-group-heading]]:font-medium [&amp;_[cmdk-group-heading]]:text-muted-foreground" cmdk-group="" role="presentation" data-value="undefined">';
		html+= '<div id="load_products">';
		html+= '</div>';
		html+= '</div>';
		html+= '</div>';
		html+= '</div>';
		html+= '</div>';
		html+= '</div>';
		html+= '<button type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2  data-[state=open]:bg-accent data-[state=open]:text-muted-foreground close"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg><span class="sr-only">Close</span></button>';
		html+= '</div>';
		
		$('body').append(html);
	});
	$('#modal_product_data .close').live("click",function(e){
		$('.overlay').remove();
		$('#modal_product_data').remove();
		$('#notifications_f8').remove();
	});
<?php /*	Поиск товара */ ?>
	$('input#search_load_products').live("keyup",function(){
		$.ajax({
			url: 'index.php?route=sale/ordercollector/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent(this.value) + '&location=' + encodeURIComponent('<?php echo trim($location);?>'),
			dataType: 'json',
			success: function(json) {
				html = '';
				if(json){
					for(k in json){
						if(json[k]){
							html+= '<div class="relative cursor-default select-none rounded-sm px-2 py-1.5 text-sm outline-none data-[selected=\'true\']:bg-accent data-[selected=true]:text-accent-foreground data-[disabled=true]:opacity-50 flex justify-between items-center item_product" id="prod' + json[k]['product_id'] + '" data-value="' + json[k]['name'] + '">';
							html+= '<div class="flex items-center gap-2 flex-1 mr-4">';
							html+= '<span>' + json[k]['name'] + '</span>';
							types = (json[k]['type']).split(",");
							if(types.indexOf('case') != -1){
								start_type = 'Case';
								start_price = json[k]['case_price_num'];
							}
							if(types.indexOf('unit') != -1){
								start_type = 'Unit';
								start_price = json[k]['unit_price_num'];
							}
							if(types.length > 1){
								html+= '<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground rounded-md h-6 px-2 text-xs change_type" ';
								if(types.indexOf('case') != -1){
									html+= 'data-case="' + json[k]['case_price_num'] + '" ';
								}
								if(types.indexOf('unit') != -1){
									html+= 'data-unit="' + json[k]['unit_price_num'] + '" ';
								}
								html+= '>';
								html+= start_type + '</button>';
							}
							html+= '<span class="ml-auto to_price">$' + start_price + '</span>';
							html+= '</div>';
							html+= '<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3 append_order" data-product_id="' + json[k]['product_id'] + '" data-type="' + start_type + '">';
							html+= '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus h-4 w-4"><path d="M5 12h14"></path><path d="M12 5v14"></path></svg></button>';
							html+= '</div>';
						}
					}

					$('#load_products').html(html).addClass('p-1');
				}else{
					$('#load_products').html('').removeClass('p-1');
				}
			}
		});
	});
	$('.item_product .change_type').live("click",function(e){
		append_order = $(this).closest('.item_product').find('.append_order').attr('data-type');
		append_order = append_order.toLowerCase();
		if($(this).attr('data-case') && append_order != 'case'){
			price = $(this).attr('data-case');
			type = 'Case';
			$(this).closest('.item_product').find('.append_order').attr('data-type','case');
		}
		if($(this).attr('data-unit') && append_order != 'unit'){
			price = $(this).attr('data-unit');
			type = 'Unit';
			$(this).closest('.item_product').find('.append_order').attr('data-type','unit');
		}
		$(this).html(type);
		$(this).closest('.item_product').find('.to_price').html('$' + price);
	});
	$('.append_order').live("click",function(e){
		type = $(this).attr('data-type');
		product_id = $(this).attr('data-product_id');
		$.ajax({
			url: 'index.php?route=sale/ordercollector/recalctotal&token=<?php echo $token; ?>',
			type: 'post',
			data: 'product_id=' + product_id + '&type=' + type + '&order_id=<?php echo $order_id;?>',
			dataType: 'json',
			success: function(json) {
				$('#recalctotals').load("index.php?route=sale/ordercollector/update&order_id=<?php echo $order_id;?>&token=<?php echo $token;?> #recalctotals > *");
				$('.overlay').remove();
				$('#modal_change_status').remove();
				$('#notifications_f8').remove();
				$('#modal_delivery_order').remove();
				$('#modal_product_data').remove();
			},
		});
	});
<?php /*	удаление товара */	?>
	$('.delete_product').live("click",function(){
		$.ajax({
			url: 'index.php?route=sale/ordercollector/recalctotal&token=<?php echo $token; ?>',
			type: 'post',
			data: 'del_product_id=' + $(this).attr('data-order_product_id') + '&order_id=<?php echo $order_id;?>',
			dataType: 'json',
			success: function(json) {
				if(json['success']){
					$('#recalctotals').load("index.php?route=sale/ordercollector/update&order_id=<?php echo $order_id;?>&token=<?php echo $token;?> #recalctotals > *");
					$('.overlay').remove();
					$('#modal_change_status').remove();
					$('#notifications_f8').remove();
					$('#modal_delivery_order').remove();
					$('#modal_product_data').remove();
				}
			},
		});
	});

	$("#modal_req .select_req").live("change",function(){
		if($(this).val() == '0'){
			$('.class_for_disabled').attr("disabled","disabled");
			$('.class_for_disabled').addClass('disabled:opacity-50');
		}else{
			$('.class_for_disabled').removeAttr("disabled");
			$('.class_for_disabled').removeClass('disabled:opacity-50');
		}
	});
	$("#modal_req .add_req").live("click",function(){
		if($('#modal_req .select_req').val() != '0'){
			html= '<div class="flex gap-2 req_data">';
			html+= '<input class="flex h-10 w-full rounded-md border border-input px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm bg-gray-50" readonly="" value="' + $('#modal_req .select_req option:selected').text() + '">';
			html+= '<input type="hidden" name="req_a[]" value="' + $('#modal_req .select_req').val() + '"/>';
			html+= '<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10 delete_req" type="button" data-req_id="' + $('#modal_req .select_req').val() + '">×</button>';
			html+= '</div>';
			$('#data_form_req').append(html);
		}
	});
	$("#modal_req .delete_req").live("click",function(){

		$(this).closest('.req_data').remove();
	});
	$('#append_req').live("click",function(){
		$.ajax({
			url: 'index.php?route=sale/order/changereq&token=<?php echo $token; ?>',
			type: 'post',
			data: $('#form_req').serialize(),
			dataType: 'json',
			success: function(json) {

				if(json['success']){
					$('#modal_req').remove();
					$('.overlay').remove();
					$('#load_req').load("index.php?route=sale/ordercollector/update&order_id=<?php echo $order_id;?>&token=<?php echo $token;?> #load_req > *");
				}
			}
		});
	});
	//	modal_req
	$('#modal_req .close').live("click",function(e){
		$('.overlay').remove();
		$('#modal_req').remove();
		$('#notifications_f8').remove();
	});
<?php /*	+	*/	?>
	$('#save_files').live("click",function(){
		$.ajax({
			url: 'index.php?route=sale/ordercollector/savefile&token=<?php echo $token; ?>&order_id=<?php echo $order_id;?>',
			type: 'post',
			data: $('#images_uf input[type=hidden]').serialize() ,
			dataType: 'json',
			success: function(json) {

				if(json['success']){
					location.reload();
<?php /*
					html = '<div id="notifications_f8"><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span><ol tabindex="-1" class="fixed top-0 z-[100] flex max-h-screen w-full flex-col-reverse p-4 sm:bottom-0 sm:right-0 sm:top-auto sm:flex-col md:max-w-[420px]"><li role="status" aria-live="off" aria-atomic="true" tabindex="0" data-state="open" data-swipe-direction="right" class="group pointer-events-auto relative flex w-full items-center justify-between space-x-4 overflow-hidden rounded-md p-6 pr-8 shadow-lg transition-all data-[swipe=cancel]:translate-x-0 data-[swipe=end]:translate-x-[var(--radix-toast-swipe-end-x)] data-[swipe=move]:translate-x-[var(--radix-toast-swipe-move-x)] data-[swipe=move]:transition-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[swipe=end]:animate-out data-[state=closed]:fade-out-80 data-[state=closed]:slide-out-to-right-full data-[state=open]:slide-in-from-top-full data-[state=open]:sm:slide-in-from-bottom-full border bg-background text-foreground" data-radix-collection-item="" data-swipe="cancel" style="user-select: none; touch-action: none;"><div class="grid gap-1"><div class="text-sm font-semibold">The Images are saved</div><div class="text-sm opacity-90"></div></div><button type="button" class="absolute right-2 top-2 rounded-md p-1 text-foreground/50 opacity-0 transition-opacity hover:text-foreground focus:opacity-100 focus:outline-none focus:ring-2 group-hover:opacity-100 group-[.destructive]:text-red-300 group-[.destructive]:hover:text-red-50 group-[.destructive]:focus:ring-red-400 group-[.destructive]:focus:ring-offset-red-600" toast-close="" data-radix-toast-announce-exclude=""><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg></button></li></ol><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span></div>';
					$('body').append(html);
					setTimeout(function(){
						$('#notifications_f8').remove();
					},1000);
*/	?>
				}
				if(json['error']){

					html = '<div id="notifications_f8"><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span><ol tabindex="-1" class="fixed top-0 z-[100] flex max-h-screen w-full flex-col-reverse p-4 sm:bottom-0 sm:right-0 sm:top-auto sm:flex-col md:max-w-[420px]"><li role="status" aria-live="off" aria-atomic="true" tabindex="0" data-state="open" data-swipe-direction="right" class="group pointer-events-auto relative flex w-full items-center justify-between space-x-4 overflow-hidden rounded-md border p-6 pr-8 shadow-lg transition-all data-[swipe=cancel]:translate-x-0 data-[swipe=end]:translate-x-[var(--radix-toast-swipe-end-x)] data-[swipe=move]:translate-x-[var(--radix-toast-swipe-move-x)] data-[swipe=move]:transition-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[swipe=end]:animate-out data-[state=closed]:fade-out-80 data-[state=closed]:slide-out-to-right-full data-[state=open]:slide-in-from-top-full data-[state=open]:sm:slide-in-from-bottom-full destructive group border-destructive bg-destructive text-destructive-foreground" data-radix-collection-item="" style="user-select: none; touch-action: none;"><div class="grid gap-1"><div class="text-sm font-semibold">Error</div><div class="text-sm opacity-90">' + json['error'] + '</div></div><button type="button" class="absolute right-2 top-2 rounded-md p-1 text-foreground/50 opacity-0 transition-opacity hover:text-foreground focus:opacity-100 focus:outline-none focus:ring-2 group-hover:opacity-100 group-[.destructive]:text-red-300 group-[.destructive]:hover:text-red-50 group-[.destructive]:focus:ring-red-400 group-[.destructive]:focus:ring-offset-red-600" toast-close="" data-radix-toast-announce-exclude=""><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg></button></li></ol><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span></div>';
					$('body').append(html);
					setTimeout(function(){
						$('#notifications_f8').remove();
					},5000);
				}
			}
		});
	});

	$('#collect_compl').live("click",function(){
		$('#modal_file_upload').removeClass('hidden');
		$('body').append('<div data-state="open" class="fixed inset-0 z-50 bg-black/80 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 overlay"></div>');
	});
	$('#modal_file_upload .close').live("click",function(e){
		$('.overlay').remove();
		$('#modal_file_upload').addClass('hidden');
		$('#notifications_f8').remove();
	});
	
	$('.overlay').live("click",function(e){
		$('#modal_change_status').remove();
		$('#notifications_f8').remove();
		$('#modal_delivery_order').remove();
		$('#modal_product_data').remove();
		$('#modal_req').remove();
		$('.overlay').remove();
		$('#modal_file_upload').addClass('hidden');
	});

	$(document).on("click",function(e){

		if ( !$("#modal_change_status").is(e.target) && $("#modal_change_status").has(e.target).length === 0 && !$("#modal_change_status").find('#change_status_order')) {
			$('.overlay').remove();
			$('#modal_change_status').remove();
			$('#notifications_f8').remove();
		}
		if ( !$("#adjust_modal").is(e.target) && $("#adjust_modal").has(e.target).length === 0) {
			$('#adjust_modal').remove();
			$('#notifications_f8').remove();
		}
		
	});
});

//--></script> 
<script type="text/javascript" src="view/javascript/jquery/ajaxupload.js"></script>
<script type="text/javascript"><!--
var k_uf = <?php echo 2/*$k;*/;?>;
var i_uf;
function init_au(i_uf){
	new AjaxUpload('#upload_file' + i_uf, {
		action: 'index.php?route=sale/ordercollector/upload&token=<?php echo $token; ?>&order_id=<?php echo $order_id;?>&id_uf=' + i_uf,
		name: 'file',
		autoSubmit: true,
		responseType: 'json',
		onSubmit: function(file, extension) {},
		onComplete: function(file, json) {

			if(json['success']){
				$('#upload_file' + json['id_uf']).html('<img src="' + (json['resize_file']) + '"/><input type="hidden" class="file_upload' + json['id_uf'] + '" name="upload[]" value="' + (json['file']) + '"/>');<?php /*.closest('.bu_i').append('<button class="deletei">delete</button>')*/	?>;
<?php /*
				k_uf = k_uf +1;
				
				$('#images_uf').append('<div class="relative aspect-video rounded-lg border bg-muted bu_i"><div class="flex h-full items-center justify-center"><label class="cursor-pointer " id="upload_file' + (k_uf) + '"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-upload h-8 w-8 text-gray-400"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="17 8 12 3 7 8"></polyline><line x1="12" x2="12" y1="3" y2="15"></line></svg></label></div><button class="deletei">delete</button></div>');
				init_au(k_uf);
*/	?>
			}else{
				$('#upload_file' + json['id_uf']).html('<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-upload h-8 w-8 text-gray-400"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="17 8 12 3 7 8"></polyline><line x1="12" x2="12" y1="3" y2="15"></line></svg>');
			}
		}
	});
}
for (var i_uf = 1; i_uf <= k_uf; i_uf++) {
	init_au(i_uf);
}

//--></script> 
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$('.date').datepicker({dateFormat: 'yy-mm-dd'});
$('.datetime').datetimepicker({
	dateFormat: 'yy-mm-dd',
	timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});
//--></script> 
<script type="text/javascript"><!--
$('.vtabs a').tabs();
//--></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<?php echo $footer; ?>
<?php /*
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/order.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <div id="vtabs" class="vtabs"><a href="#tab-customer"><?php echo $tab_customer; ?></a><a href="#tab-payment"><?php echo $tab_payment; ?></a><a href="#tab-shipping"><?php echo $tab_shipping; ?></a><a href="#tab-product"><?php echo $tab_product; ?></a><a href="#tab-voucher"><?php echo $tab_voucher; ?></a><a href="#tab-total"><?php echo $tab_total; ?></a></div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-customer" class="vtabs-content">
          <table class="form">
            <tr>
              <td class="left"><?php echo $entry_store; ?></td>
              <td class="left"><select name="store_id">
                  <option value="0"><?php echo $text_default; ?></option>
                  <?php foreach ($stores as $store) { ?>
                  <?php if ($store['store_id'] == $store_id) { ?>
                  <option value="<?php echo $store['store_id']; ?>" selected="selected"><?php echo $store['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><?php echo $entry_customer; ?></td>
              <td><input type="text" name="customer" value="<?php echo $customer; ?>" />
                <input type="hidden" name="customer_id" value="<?php echo $customer_id; ?>" />
                <input type="hidden" name="customer_group_id" value="<?php echo $customer_group_id; ?>" /></td>
            </tr>
            <tr>
              <td class="left"><?php echo $entry_customer_group; ?></td>
              <td class="left"><select id="customer_group_id" <?php echo ($customer_id ? 'disabled="disabled"' : ''); ?>>
                  <?php foreach ($customer_groups as $customer_group) { ?>
                  <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
                  <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_firstname; ?></td>
              <td><input type="text" name="firstname" value="<?php echo $firstname; ?>" />
                <?php if ($error_firstname) { ?>
                <span class="error"><?php echo $error_firstname; ?></span>
                <?php } ?></td>
            </tr>

            <tr>
              <td><span class="required">*</span> <?php echo $entry_email; ?></td>
              <td><input type="text" name="email" value="<?php echo $email; ?>" />
                <?php if ($error_email) { ?>
                <span class="error"><?php echo $error_email; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_telephone; ?></td>
              <td><input type="text" name="telephone" value="<?php echo $telephone; ?>" />
                <?php if ($error_telephone) { ?>
                <span class="error"><?php echo $error_telephone; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_fax; ?></td>
              <td><input type="text" name="fax" value="<?php echo $fax; ?>" /></td>
            </tr>
          </table>
        </div>
        <div id="tab-payment" class="vtabs-content">
          <table class="form">
            <tr>
              <td><?php echo $entry_address; ?></td>
              <td><select name="payment_address">
                  <option value="0" selected="selected"><?php echo $text_none; ?></option>
                  <?php foreach ($addresses as $address) { ?>
                  <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname'] . ' ' . $address['lastname'] . ', ' . $address['address_1'] . ', ' . $address['city'] . ', ' . $address['country']; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_firstname; ?></td>
              <td><input type="text" name="payment_firstname" value="<?php echo $payment_firstname; ?>" />
                <?php if ($error_payment_firstname) { ?>
                <span class="error"><?php echo $error_payment_firstname; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_lastname; ?></td>
              <td><input type="text" name="payment_lastname" value="<?php echo $payment_lastname; ?>" />
                <?php if ($error_payment_lastname) { ?>
                <span class="error"><?php echo $error_payment_lastname; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_company; ?></td>
              <td><input type="text" name="payment_company" value="<?php echo $payment_company; ?>" /></td>
            </tr>
            <tr id="company-id-display">
              <td><span id="company-id-required" class="required">*</span> <?php echo $entry_company_id; ?></td>
              <td><input type="text" name="payment_company_id" value="<?php echo $payment_company_id; ?>" /></td>
            </tr>
            <tr id="tax-id-display">
              <td><span id="tax-id-required" class="required">*</span> <?php echo $entry_tax_id; ?></td>
              <td><input type="text" name="payment_tax_id" value="<?php echo $payment_tax_id; ?>" />
                <?php if ($error_payment_tax_id) { ?>
                <span class="error"><?php echo $error_payment_tax_id; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_address_1; ?></td>
              <td><input type="text" name="payment_address_1" value="<?php echo $payment_address_1; ?>" />
                <?php if ($error_payment_address_1) { ?>
                <span class="error"><?php echo $error_payment_address_1; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_address_2; ?></td>
              <td><input type="text" name="payment_address_2" value="<?php echo $payment_address_2; ?>" /></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_city; ?></td>
              <td><input type="text" name="payment_city" value="<?php echo $payment_city; ?>" />
                <?php if ($error_payment_city) { ?>
                <span class="error"><?php echo $error_payment_city; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span id="payment-postcode-required" class="required">*</span> <?php echo $entry_postcode; ?></td>
              <td><input type="text" name="payment_postcode" value="<?php echo $payment_postcode; ?>" />
                <?php if ($error_payment_postcode) { ?>
                <span class="error"><?php echo $error_payment_postcode; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_country; ?></td>
              <td><select name="payment_country_id">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($countries as $country) { ?>
                  <?php if ($country['country_id'] == $payment_country_id) { ?>
                  <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
                <?php if ($error_payment_country) { ?>
                <span class="error"><?php echo $error_payment_country; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_zone; ?></td>
              <td><select name="payment_zone_id">
                </select>
                <?php if ($error_payment_zone) { ?>
                <span class="error"><?php echo $error_payment_zone; ?></span>
                <?php } ?></td>
            </tr>
          </table>
        </div>
        <div id="tab-shipping" class="vtabs-content">
          <table class="form">
            <tr>
              <td><?php echo $entry_address; ?></td>
              <td><select name="shipping_address">
                  <option value="0" selected="selected"><?php echo $text_none; ?></option>
                  <?php foreach ($addresses as $address) { ?>
                  <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname'] . ' ' . $address['lastname'] . ', ' . $address['address_1'] . ', ' . $address['city'] . ', ' . $address['country']; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_firstname; ?></td>
              <td><input type="text" name="shipping_firstname" value="<?php echo $shipping_firstname; ?>" />
                <?php if ($error_shipping_firstname) { ?>
                <span class="error"><?php echo $error_shipping_firstname; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_lastname; ?></td>
              <td><input type="text" name="shipping_lastname" value="<?php echo $shipping_lastname; ?>" />
                <?php if ($error_shipping_lastname) { ?>
                <span class="error"><?php echo $error_shipping_lastname; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_company; ?></td>
              <td><input type="text" name="shipping_company" value="<?php echo $shipping_company; ?>" /></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_address_1; ?></td>
              <td><input type="text" name="shipping_address_1" value="<?php echo $shipping_address_1; ?>" />
                <?php if ($error_shipping_address_1) { ?>
                <span class="error"><?php echo $error_shipping_address_1; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><?php echo $entry_address_2; ?></td>
              <td><input type="text" name="shipping_address_2" value="<?php echo $shipping_address_2; ?>" /></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_city; ?></td>
              <td><input type="text" name="shipping_city" value="<?php echo $shipping_city; ?>" /></td>
            </tr>
            <tr>
              <td><span id="shipping-postcode-required" class="required">*</span> <?php echo $entry_postcode; ?></td>
              <td><input type="text" name="shipping_postcode" value="<?php echo $shipping_postcode; ?>" />
                <?php if ($error_shipping_postcode) { ?>
                <span class="error"><?php echo $error_shipping_postcode; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_country; ?></td>
              <td><select name="shipping_country_id">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($countries as $country) { ?>
                  <?php if ($country['country_id'] == $shipping_country_id) { ?>
                  <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
                <?php if ($error_shipping_country) { ?>
                <span class="error"><?php echo $error_shipping_country; ?></span>
                <?php } ?></td>
            </tr>
            <tr>
              <td><span class="required">*</span> <?php echo $entry_zone; ?></td>
              <td><select name="shipping_zone_id">
                </select>
                <?php if ($error_shipping_zone) { ?>
                <span class="error"><?php echo $error_shipping_zone; ?></span>
                <?php } ?></td>
            </tr>
          </table>
        </div>
        <div id="tab-product" class="vtabs-content">
          <table class="list">
            <thead>
              <tr>
                <td></td>
                <td class="left"><?php echo $column_product; ?></td>
                <td class="left"><?php echo $column_model; ?></td>
                <td class="right"><?php echo $column_quantity; ?></td>
                <td class="right"><?php echo $column_price; ?></td>
                <td class="right"><?php echo $column_total; ?></td>
              </tr>
            </thead>
            <?php $product_row = 0; ?>
            <?php $option_row = 0; ?>
            <?php $download_row = 0; ?>
            <tbody id="product">
              <?php if ($order_products) { ?>
              <?php foreach ($order_products as $order_product) { ?>
              <tr id="product-row<?php echo $product_row; ?>">
                <td class="center" style="width: 3px;"><img src="view/image/delete.png" title="<?php echo $button_remove; ?>" alt="<?php echo $button_remove; ?>" style="cursor: pointer;" onclick="$('#product-row<?php echo $product_row; ?>').remove(); $('#button-update').trigger('click');" /></td>
                <td class="left"><?php echo $order_product['name']; ?><br />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_product_id]" value="<?php echo $order_product['order_product_id']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][product_id]" value="<?php echo $order_product['product_id']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][name]" value="<?php echo $order_product['name']; ?>" />
                  <?php foreach ($order_product['option'] as $option) { ?>
                  - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_option][<?php echo $option_row; ?>][order_option_id]" value="<?php echo $option['order_option_id']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_option][<?php echo $option_row; ?>][product_option_id]" value="<?php echo $option['product_option_id']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_option][<?php echo $option_row; ?>][product_option_value_id]" value="<?php echo $option['product_option_value_id']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_option][<?php echo $option_row; ?>][name]" value="<?php echo $option['name']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_option][<?php echo $option_row; ?>][value]" value="<?php echo $option['value']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_option][<?php echo $option_row; ?>][type]" value="<?php echo $option['type']; ?>" />
                  <?php $option_row++; ?>
                  <?php } ?>
                  <?php foreach ($order_product['download'] as $download) { ?>
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_download][<?php echo $download_row; ?>][order_download_id]" value="<?php echo $download['order_download_id']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_download][<?php echo $download_row; ?>][name]" value="<?php echo $download['name']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_download][<?php echo $download_row; ?>][filename]" value="<?php echo $download['filename']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_download][<?php echo $download_row; ?>][mask]" value="<?php echo $download['mask']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][order_download][<?php echo $download_row; ?>][remaining]" value="<?php echo $download['remaining']; ?>" />
                  <?php $download_row++; ?>
                  <?php } ?></td>
                <td class="left"><?php echo $order_product['model']; ?>
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][model]" value="<?php echo $order_product['model']; ?>" /></td>
                <td class="right"><?php echo $order_product['quantity']; ?>
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][quantity]" value="<?php echo $order_product['quantity']; ?>" /></td>                 
                <td class="right"><?php echo $order_product['price']; ?>
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][price]" value="<?php echo $order_product['price']; ?>" /></td>
                <td class="right"><?php echo $order_product['total']; ?>
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][total]" value="<?php echo $order_product['total']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][tax]" value="<?php echo $order_product['tax']; ?>" />
                  <input type="hidden" name="order_product[<?php echo $product_row; ?>][reward]" value="<?php echo $order_product['reward']; ?>" /></td>
              </tr>
              <?php $product_row++; ?>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="center" colspan="6"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
          <table class="list">
            <thead>
              <tr>
                <td colspan="2" class="left"><?php echo $text_product; ?></td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="left"><?php echo $entry_product; ?></td>
                <td class="left"><input type="text" name="product" value="" />
                  <input type="hidden" name="product_id" value="" /></td>
              </tr>
              <tr id="option"></tr>
              <tr>
                <td class="left"><?php echo $entry_quantity; ?></td>
                <td class="left"><input type="text" name="quantity" value="1" /></td>
              </tr>             
            </tbody>
            <tfoot>
              <tr>
                <td class="left">&nbsp;</td>
                <td class="left"><a id="button-product" class="button"><?php echo $button_add_product; ?></a></td>
              </tr>
            </tfoot>
          </table>
        </div>
        <div id="tab-voucher" class="vtabs-content">
          <table class="list">
            <thead>
              <tr>
                <td></td>
                <td class="left"><?php echo $column_product; ?></td>
                <td class="left"><?php echo $column_model; ?></td>
                <td class="right"><?php echo $column_quantity; ?></td>
                <td class="right"><?php echo $column_price; ?></td>
                <td class="right"><?php echo $column_total; ?></td>
              </tr>
            </thead>
            <tbody id="voucher">
              <?php $voucher_row = 0; ?>
              <?php if ($order_vouchers) { ?>
              <?php foreach ($order_vouchers as $order_voucher) { ?>
              <tr id="voucher-row<?php echo $voucher_row; ?>">
                <td class="center" style="width: 3px;"><img src="view/image/delete.png" title="<?php echo $button_remove; ?>" alt="<?php echo $button_remove; ?>" style="cursor: pointer;" onclick="$('#voucher-row<?php echo $voucher_row; ?>').remove(); $('#button-update').trigger('click');" /></td>
                <td class="left"><?php echo $order_voucher['description']; ?>
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][order_voucher_id]" value="<?php echo $order_voucher['order_voucher_id']; ?>" />
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][voucher_id]" value="<?php echo $order_voucher['voucher_id']; ?>" />
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][description]" value="<?php echo $order_voucher['description']; ?>" />
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][code]" value="<?php echo $order_voucher['code']; ?>" />
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][from_name]" value="<?php echo $order_voucher['from_name']; ?>" />
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][from_email]" value="<?php echo $order_voucher['from_email']; ?>" />
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][to_name]" value="<?php echo $order_voucher['to_name']; ?>" />
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][to_email]" value="<?php echo $order_voucher['to_email']; ?>" />
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][voucher_theme_id]" value="<?php echo $order_voucher['voucher_theme_id']; ?>" />
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][message]" value="<?php echo $order_voucher['message']; ?>" />
                  <input type="hidden" name="order_voucher[<?php echo $voucher_row; ?>][amount]" value="<?php echo $order_voucher['amount']; ?>" /></td>
                <td class="left"></td>
                <td class="right">1</td>
                <td class="right"><?php echo $order_voucher['amount']; ?></td>
                <td class="right"><?php echo $order_voucher['amount']; ?></td>
              </tr>
              <?php $voucher_row++; ?>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="center" colspan="6"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
          <table class="list">
            <thead>
              <tr>
                <td colspan="2" class="left"><?php echo $text_voucher; ?></td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="left"><span class="required">*</span> <?php echo $entry_to_name; ?></td>
                <td class="left"><input type="text" name="to_name" value="" /></td>
              </tr>
              <tr>
                <td class="left"><span class="required">*</span> <?php echo $entry_to_email; ?></td>
                <td class="left"><input type="text" name="to_email" value="" /></td>
              </tr>
              <tr>
                <td class="left"><span class="required">*</span> <?php echo $entry_from_name; ?></td>
                <td class="left"><input type="text" name="from_name" value="" /></td>
              </tr>
              <tr>
                <td class="left"><span class="required">*</span> <?php echo $entry_from_email; ?></td>
                <td class="left"><input type="text" name="from_email" value="" /></td>
              </tr>
              <tr>
                <td class="left"><span class="required">*</span> <?php echo $entry_theme; ?></td>
                <td class="left"><select name="voucher_theme_id">
                    <?php foreach ($voucher_themes as $voucher_theme) { ?>
                    <option value="<?php echo $voucher_theme['voucher_theme_id']; ?>"><?php echo addslashes($voucher_theme['name']); ?></option>
                    <?php } ?>
                  </select></td>
              </tr>
              <tr>
                <td class="left"><?php echo $entry_message; ?></td>
                <td class="left"><textarea name="message" cols="40" rows="5"></textarea></td>
              </tr>
              <tr>
                <td class="left"><span class="required">*</span> <?php echo $entry_amount; ?></td>
                <td class="left"><input type="text" name="amount" value="25.00" size="5" /></td>
              </tr>
            </tbody>
            <tfoot>
              <tr>
                <td class="left">&nbsp;</td>
                <td class="left"><a id="button-voucher" class="button"><?php echo $button_add_voucher; ?></a></td>
              </tr>
            </tfoot>
          </table>
        </div>
        <div id="tab-total" class="vtabs-content">
          <table class="list">
            <thead>
              <tr>
                <td class="left"><?php echo $column_product; ?></td>
                <td class="left"><?php echo $column_model; ?></td>
                <td class="right"><?php echo $column_quantity; ?></td>
                <td class="right"><?php echo $column_price; ?></td>
                <td class="right"><?php echo $column_total; ?></td>
              </tr>
            </thead>
            <tbody id="total">
              <?php $total_row = 0; ?>
              <?php if ($order_products || $order_vouchers || $order_totals) { ?>
              <?php foreach ($order_products as $order_product) { ?>
              <tr>
                <td class="left"><?php echo $order_product['name']; ?><br />
                  <?php foreach ($order_product['option'] as $option) { ?>
                  - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                  <?php } ?></td>
                <td class="left"><?php echo $order_product['model']; ?></td>
                <td class="right"><?php echo $order_product['quantity']; ?></td>
                <td class="right"><?php echo $order_product['price']; ?></td>
                <td class="right"><?php echo $order_product['total']; ?></td>
              </tr>
              <?php } ?>
              <?php foreach ($order_vouchers as $order_voucher) { ?>
              <tr>
                <td class="left"><?php echo $order_voucher['description']; ?></td>
                <td class="left"></td>
                <td class="right">1</td>
                <td class="right"><?php echo $order_voucher['amount']; ?></td>
                <td class="right"><?php echo $order_voucher['amount']; ?></td>
              </tr>
              <?php } ?>
              <?php foreach ($order_totals as $order_total) { ?>
              <tr id="total-row<?php echo $total_row; ?>">
                <td class="right" colspan="4"><?php echo $order_total['title']; ?>:
                  <input type="hidden" name="order_total[<?php echo $total_row; ?>][order_total_id]" value="<?php echo $order_total['order_total_id']; ?>" />
                  <input type="hidden" name="order_total[<?php echo $total_row; ?>][code]" value="<?php echo $order_total['code']; ?>" />
                  <input type="hidden" name="order_total[<?php echo $total_row; ?>][title]" value="<?php echo $order_total['title']; ?>" />
                  <input type="hidden" name="order_total[<?php echo $total_row; ?>][text]" value="<?php echo $order_total['text']; ?>" />
                  <input type="hidden" name="order_total[<?php echo $total_row; ?>][value]" value="<?php echo $order_total['value']; ?>" />
                  <input type="hidden" name="order_total[<?php echo $total_row; ?>][sort_order]" value="<?php echo $order_total['sort_order']; ?>" /></td>
                <td class="right"><?php echo $order_total['value']; ?></td>
              </tr>
              <?php $total_row++; ?>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="center" colspan="5"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
          <table class="list">
            <thead>
              <tr>
                <td class="left" colspan="2"><?php echo $text_order; ?></td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="left"><?php echo $entry_shipping; ?></td>
                <td class="left"><select name="shipping">
                    <option value=""><?php echo $text_select; ?></option>
                    <?php if ($shipping_code) { ?>
                    <option value="<?php echo $shipping_code; ?>" selected="selected"><?php echo $shipping_method; ?></option>
                    <?php } ?>
                  </select>
                  <input type="hidden" name="shipping_method" value="<?php echo $shipping_method; ?>" />
                  <input type="hidden" name="shipping_code" value="<?php echo $shipping_code; ?>" />
                  <?php if ($error_shipping_method) { ?>
                  <span class="error"><?php echo $error_shipping_method; ?></span>
                  <?php } ?></td>
              </tr>
              <tr>
                <td class="left"><?php echo $entry_payment; ?></td>
                <td class="left"><select name="payment">
                    <option value=""><?php echo $text_select; ?></option>
                    <?php if ($payment_code) { ?>
                    <option value="<?php echo $payment_code; ?>" selected="selected"><?php echo $payment_method; ?></option>
                    <?php } ?>
                  </select>
                  <input type="hidden" name="payment_method" value="<?php echo $payment_method; ?>" />
                  <input type="hidden" name="payment_code" value="<?php echo $payment_code; ?>" />
                  <?php if ($error_payment_method) { ?>
                  <span class="error"><?php echo $error_payment_method; ?></span>
                  <?php } ?></td>
              </tr>             
              <tr>
                <td class="left"><?php echo $entry_coupon; ?></td>
                <td class="left"><input type="text" name="coupon" value="" /></td>
              </tr>
              <tr>
                <td class="left"><?php echo $entry_voucher; ?></td>
                <td class="left"><input type="text" name="voucher" value="" /></td>
              </tr>
              <tr>
                <td class="left"><?php echo $entry_reward; ?></td>
                <td class="left"><input type="text" name="reward" value="" /></td>
              </tr>
              <tr>
                <td class="left"><?php echo $entry_order_status; ?></td>
                <td class="left"><select name="order_status_id">
                    <?php foreach ($order_statuses as $order_status) { ?>
                    <?php if ($order_status['order_status_id'] == $order_status_id) { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select></td>
              </tr>
              <tr>
                <td class="left"><?php echo $entry_comment; ?></td>
                <td class="left"><textarea name="comment" cols="40" rows="5"><?php echo $comment; ?></textarea></td>
              </tr>
              <tr>
                <td class="left"><?php echo $entry_affiliate; ?></td>
                <td class="left"><input type="text" name="affiliate" value="<?php echo $affiliate; ?>" />
                  <input type="hidden" name="affiliate_id" value="<?php echo $affiliate_id; ?>" /></td>
              </tr>
            </tbody>
            <tfoot>
              <tr>
                <td class="left">&nbsp;</td>
                <td class="left"><a id="button-update" class="button"><?php echo $button_update_total; ?></a></td>
              </tr>
            </tfoot>
          </table>
        </div>
      </form>
    </div>
  </div>
</div>
*/

?>