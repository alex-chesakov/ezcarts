<?php echo $header; ?>

<div data-state="open">
	<div data-state="open" id="radix111" style="transition-duration: 0s; animation-name: none; --radix-collapsible-content-height:2196px; --radix-collapsible-content-width:1062px;">
		<div class="space-y-6">
			<div class="block lg:flex lg:gap-6">
				<div class="flex-1 space-y-6">
					<div class="space-y-4">
						<div class="flex justify-between items-start">
							<div>
								<div class="flex items-center gap-2">
									<h1 class="text-2xl font-bold">Order ORD-<?php echo $order_id;?></h1>
									<div class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent text-white hover:bg-yellow-600 order_status<?php echo $order_status_id;?>" data-o-s="<?php echo $order_status_id;?>"><?php echo $order_status;?></div>
									
									<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2   [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 w-10" type="button" aria-haspopup="dialog" aria-expanded="false" aria-controls="radix-:r1b:" data-state="closed" id="change_status_order"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-pen h-4 w-4"><path d="M21.174 6.812a1 1 0 0 0-3.986-3.987L3.842 16.174a2 2 0 0 0-.5.83l-1.321 4.352a.5.5 0 0 0 .623.622l4.353-1.32a2 2 0 0 0 .83-.497z"></path></svg></button>
								</div>
								<p class="text-gray-500">Placed on <?php echo $date_added;?></p>
							</div>
						</div>
					</div>
					
					<div data-state="open">
						<div class="rounded-lg border bg-card text-card-foreground shadow-sm">
<?php /*	открывашка блока */?>
							<input type="checkbox" name="open_spoler_2" value="1" class="hidden input_spoiler" id="open_spoler_2" checked="checked"/>
							<div class="flex p-6 pb-3 title_spoiler">
								<label for="open_spoler_2" class="flex w-full items-center justify-between">
									<h3 class="tracking-tight flex items-center gap-2 text-lg font-medium">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-info h-5 w-5 text-muted-foreground"><circle cx="12" cy="12" r="10"></circle><path d="M12 16v-4"></path><path d="M12 8h.01"></path></svg>Order Details
										<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2   [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 w-10" type="button" aria-haspopup="dialog" aria-expanded="false" aria-controls="radix-:r1f:" data-state="closed" id="change_delivery_order"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-pen h-4 w-4"><path d="M21.174 6.812a1 1 0 0 0-3.986-3.987L3.842 16.174a2 2 0 0 0-.5.83l-1.321 4.352a.5.5 0 0 0 .623.622l4.353-1.32a2 2 0 0 0 .83-.497z"></path></svg></button>
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
								<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 text-muted-foreground" type="button" id="add_products"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus mr-2 h-4 w-4"><path d="M5 12h14"></path><path d="M12 5v14"></path></svg>Add Product</button>
							</div>
						</div>
						
						<div class="p-6 pt-0">
							<div class="space-y-4" id="recalctotals">
<?php /*	PRODUCTS => START */ ?>
								<?php foreach($order_products as $product){ ?>
									<div class="flex border-b pb-4 last:border-0 relative min-h-[160px] opi order_product_id<?php echo $product['order_product_id'];?>" data-order_product_id="<?php echo $product['order_product_id'];?>">
										<div class="space-y-1">
											<div class="flex items-center gap-2 flex-wrap pr-[140px]">
												<p class="font-medium"><?php echo $product['name'];?></p>
											</div>
											<p class="font-medium">BIN: <?php echo $product['bin'];?></p>
											<p class="text-sm text-gray-500 mt-2">Price: $<?php echo number_format((float)$product['price'],2);?>/<?php echo $product['type'];?></p>
											<div class="flex flex-col gap-2 mt-2">
												
												<?php if(!in_array($product['status_collect_product'],array(1,3,4)) ){ ?>
													<div class="flex items-center gap-2" data-sop="<?php echo $product['status_collect_product'];?>">
														<label class="text-sm text-gray-500 ">Booked Qty:</label>
<?php /*	количество */	?>

														<div class="flex items-center q">
															<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-8 w-8 rounded-r-none minus"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-minus h-4 w-4"><path d="M5 12h14"></path></svg></button>
															<input type="number" data-order_product_id="<?php echo $product['order_product_id'];?>" class="flex border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm w-16 h-8 rounded-none text-center [appearance:textfield] [&amp;::-webkit-outer-spin-button]:appearance-none [&amp;::-webkit-inner-spin-button]:appearance-none q_change" value="<?php echo $product['quantity'];?>">
															<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-8 w-8 rounded-l-none plus"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus h-4 w-4"><path d="M5 12h14"></path><path d="M12 5v14"></path></svg></button>
														</div>
													</div>
												<?php }else{ ?>
													<div class="hidden q">
														<input type="number" data-order_product_id="<?php echo $product['order_product_id'];?>" class="q_change" value="<?php echo $product['quantity'];?>">
													</div>
													<div class="flex items-center gap-2">
														<label class="text-sm text-gray-500 line-through text-gray-400">Booked Qty:</label><span class="text-sm font-medium line-through text-gray-400"><?php echo $product['old_quantity'];?></span>
													</div>
													<div class="flex items-center gap-2">
														<label class="text-sm text-green-600">Adjusted Qty:</label>
														<span class="text-sm font-medium text-green-600"><?php echo $product['quantity'];?></span>
													</div>
												<?php };?>
												
												<?php if(!empty($product['open_sel_type']) and (int)$product['status_collect_product']!==1 and empty($product['old_quantity'])){ ?>
													<button data-order_product_id="<?php echo $product['order_product_id'];?>" type="button" role="combobox" aria-controls="radix-:r1p:" aria-expanded="false" aria-autocomplete="none" dir="ltr" data-state="closed" class="flex items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1 w-24 h-8 change_type_p">
														<span><?php echo $product['type'];?></span>
														<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50" aria-hidden="true"><path d="m6 9 6 6 6-6"></path></svg>
													</button>
												<?php };?>
											</div>
										</div>
										
										<div class="absolute right-0 top-0 flex flex-col items-end gap-2 w-[140px]">
<?php /*	COLLECTED Status */	?>
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
											
<?php /* collector adjusted status */ ?>
											<?php /*if((int)$product['status_collect_product']!==1 and empty($product['old_quantity'])){ ?>
												<div class="flex flex-col items-end gap-1"><span class="font-medium">$<?php echo number_format((float)$product['total'],2);?></span></div>
											<?php }else{ ?>
												<div class="flex flex-col items-end gap-1">
													<span class="text-xs font-medium line-through text-gray-400">$<?php echo number_format((float)$product['old_total'],2);?></span>
													<span class="font-medium text-green-600">$<?php echo number_format((float)$product['total'],2);?></span>
												</div>
											<?php };*/?>
<div class="flex flex-col items-end gap-1"><span class="font-medium">$<?php echo number_format((float)$product['total'],2);?></span></div>
<?php /*	удаление товара */	?>
											<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 h-8 w-8 text-red-500 hover:text-red-600 hover:bg-red-50 delete_product" data-order_product_id="<?php echo $product['order_product_id'];?>">
												<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash2 h-4 w-4"><path d="M3 6h18"></path><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path><line x1="10" x2="10" y1="11" y2="17"></line><line x1="14" x2="14" y1="11" y2="17"></line></svg>
											</button>
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
										<?php /*if($to['total'] == $to['old_total']){ ?>
											<div class="flex justify-between text-sm">
												<p class="text-gray-500"><?php echo $to['title'];?></p>
												<div class="flex items-center gap-2">
													<p class="">$<?php echo $to['value'];?></p>
												</div>
											</div>
										<?php }elseif($to['code'] == 'sub_total' or $to['code'] == 'total'){ ?>
											<div class="flex justify-between text-sm">
												<p class="text-gray-500"><?php echo $to['title'];?></p>
												<div class="flex items-center gap-2">
													<p class="line-through text-gray-400">$<?php echo number_format((float)$to['old_total'],2);?></p>
													<p class="text-green-600">$<?php echo $to['value'];?></p></div>
												</div>
										<?php }else{ ?>
											<div class="flex justify-between text-sm">
												<p class="text-gray-500"><?php echo $to['title'];?></p>
												<div class="flex items-center gap-2">
													<p class="">$<?php echo $to['value'];?></p>
												</div>
											</div>
										<?php };*/ ?>
									<?php };?>
	
		
									<div class="flex justify-end gap-2 pt-2">
										<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 py-2 bg-green-500 hover:bg-green-600 text-white h-8 text-sm px-3 collect_complete">Collection Complete</button>
										<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 py-2 bg-[#ea384c] hover:bg-[#ea384c]/90 text-white h-8 text-sm px-3" id="deb_pay">Charge Client</button>
									</div>
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
									<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 w-10 button_req" type="button" aria-haspopup="dialog" aria-expanded="false" aria-controls="radix-:r33:" data-state="closed"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-pen h-4 w-4"><path d="M21.174 6.812a1 1 0 0 0-3.986-3.987L3.842 16.174a2 2 0 0 0-.5.83l-1.321 4.352a.5.5 0 0 0 .623.622l4.353-1.32a2 2 0 0 0 .83-.497z"></path></svg></button>
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
										<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 w-10" type="button" id="edit_customer_data_button">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-pen h-4 w-4"><path d="M21.174 6.812a1 1 0 0 0-3.986-3.987L3.842 16.174a2 2 0 0 0-.5.83l-1.321 4.352a.5.5 0 0 0 .623.622l4.353-1.32a2 2 0 0 0 .83-.497z"></path></svg>
										</button>
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
											<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 w-10" type="button" id="button_collector_info">
												<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-pen h-4 w-4"><path d="M21.174 6.812a1 1 0 0 0-3.986-3.987L3.842 16.174a2 2 0 0 0-.5.83l-1.321 4.352a.5.5 0 0 0 .623.622l4.353-1.32a2 2 0 0 0 .83-.497z"></path></svg>
											</button>
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
											<div class="grid grid-cols-2 gap-4" id="images_uf">
<?php for($k=1;$k<=2;$k++){ /* count($proofs) */?>
	<div class="relative aspect-video rounded-lg border bg-muted">
		<div class="flex h-full items-center justify-center bu_i">
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
<?php /*
<div class="relative aspect-video rounded-lg border bg-muted bu_i">
	<div class="flex h-full items-center justify-center">
		<label class="cursor-pointer" id="upload_file<?php echo $k;?>">
			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-upload h-8 w-8 text-gray-400"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="17 8 12 3 7 8"></polyline><line x1="12" x2="12" y1="3" y2="15"></line></svg>
		</label>
	</div>
</div>
*/	?>
												<?php /*if(!empty($proofs)){ ?>
													<?php foreach($proofs as $proof){ ?>
														<div class="relative aspect-video rounded-lg border bg-muted">
															<div class="flex h-full items-center justify-center">
																<label class="cursor-pointer    " id="upload_file1"><img src="http://litr/image/cache/upload/bf4bd6012b52b2df4c8aa52c96e8f55a-300x300.jpg"><input type="hidden" class="file_upload1" name="upload[]" value="bf4bd6012b52b2df4c8aa52c96e8f55a.jpg"></label>
															</div>
														</div>
													<?php };?>
												<?php }else{ ?>
													<div class="relative aspect-video rounded-lg border bg-muted">
														<div class="flex h-full items-center justify-center">
															<label class="cursor-pointer" id="upload_file1">
																<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-upload h-8 w-8 text-gray-400"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="17 8 12 3 7 8"></polyline><line x1="12" x2="12" y1="3" y2="15"></line></svg>
															</label>
														</div>
													</div>
													
													<div class="relative aspect-video rounded-lg border bg-muted">
														<div class="flex h-full items-center justify-center">
															<label class="cursor-pointer" id="upload_file2">
																<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-upload h-8 w-8 text-gray-400"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="17 8 12 3 7 8"></polyline><line x1="12" x2="12" y1="3" y2="15"></line></svg>
															</label>
														</div>
													</div>
												<?php };*/ ?>
											</div>
											<div class="mt-4 flex justify-end">
												<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 h-10 px-4 py-2 bg-green-500 hover:bg-green-600 text-white" id="save_files">Save</button>
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

<script type="text/javascript"><!--
var timer_slp;
function changecoll(objcoll){
console.log( 'order_form changecoll()' );
	opid = $(objcoll).attr('data-order_product_id');
	opid = parseInt(opid);
	cs = $(objcoll).val();
	var selected_coll = $(objcoll).closest('label').find('.title_drop').html();
	var targ_coll = $(objcoll).closest('.block_collected_stat').find('.change_collected');
	$.ajax({
		url: 'index.php?route=sale/order/changecoll&token=<?php echo $token; ?>',
		type: 'post',
		data: 'order_product_id=' + opid + '&coll_stat=' + cs + '&order_id=<?php echo $order_id;?>',
		dataType: 'json',
		success: function(json) {
console.log( 'sale/order/changecoll:' + JSON.stringify(json) );
			if(json['success']){
				html = '<div id="notifications_f8"><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span><ol tabindex="-1" class="fixed top-0 z-[100] flex max-h-screen w-full flex-col-reverse p-4 sm:bottom-0 sm:right-0 sm:top-auto sm:flex-col md:max-w-[420px]"><li role="status" aria-live="off" aria-atomic="true" tabindex="0" data-state="open" data-swipe-direction="right" class="group pointer-events-auto relative flex w-full items-center justify-between space-x-4 overflow-hidden rounded-md p-6 pr-8 shadow-lg transition-all data-[swipe=cancel]:translate-x-0 data-[swipe=end]:translate-x-[var(--radix-toast-swipe-end-x)] data-[swipe=move]:translate-x-[var(--radix-toast-swipe-move-x)] data-[swipe=move]:transition-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[swipe=end]:animate-out data-[state=closed]:fade-out-80 data-[state=closed]:slide-out-to-right-full data-[state=open]:slide-in-from-top-full data-[state=open]:sm:slide-in-from-bottom-full border bg-background text-foreground" data-radix-collection-item="" data-swipe="cancel" style="user-select: none; touch-action: none;"><div class="grid gap-1"><div class="text-sm font-semibold">Order status updated</div><div class="text-sm opacity-90">' + json['success'] + '</div></div><button type="button" class="absolute right-2 top-2 rounded-md p-1 text-foreground/50 opacity-0 transition-opacity hover:text-foreground focus:opacity-100 focus:outline-none focus:ring-2 group-hover:opacity-100 group-[.destructive]:text-red-300 group-[.destructive]:hover:text-red-50 group-[.destructive]:focus:ring-red-400 group-[.destructive]:focus:ring-offset-red-600" toast-close="" data-radix-toast-announce-exclude=""><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg></button></li></ol><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span></div>';
				$('body').append(html);
				$(targ_coll).html(selected_coll + '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-3 w-3"><path d="m6 9 6 6 6-6"></path></svg>');
//				$('#recalctotals').load("index.php?route=sale/order/update&order_id=<?php echo $order_id;?>&token=<?php echo $token;?> #recalctotals > *");
					
				$('.overlay').remove();
				$('#modal_change_status').remove();
				$('#notifications_f8').remove();
				$('#modal_delivery_order').remove();
				$('#modal_customer_data').remove();
				$('#modal_collector_data').remove();
				$('#modal_product_data').remove();
				
				$('#radix111').load("index.php?route=sale/order/update&order_id=<?php echo $order_id;?>&token=<?php echo $token;?> #radix111 > *",false,function(){
console.log('changecoll: reload page');
				});
			}
		},
	});
}

$(document).ready(function() {
	$('#change_status_order').live("click",function(){
console.log( 'order_form #change_status_order' );
		$('.overlay').remove();
		$('#modal_change_status').remove();
		$('#notifications_f8').remove();
		
		html = '<div data-state="open" class="fixed inset-0 z-50 bg-black/80 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 overlay"></div>';
		html+= '<div role="dialog" id="modal_change_status" aria-describedby="radix-:r3:" aria-labelledby="radix-:r2:" data-state="open" class="fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[state=closed]:slide-out-to-left-1/2 data-[state=closed]:slide-out-to-top-[48%] data-[state=open]:slide-in-from-left-1/2 data-[state=open]:slide-in-from-top-[48%] sm:rounded-lg" tabindex="-1" style="pointer-events: auto;">';
		html+= '<div class="flex flex-col space-y-1.5 text-center sm:text-left"><h2 id="radix-:r2:" class="text-lg font-semibold leading-none tracking-tight">Edit Order Status</h2></div>';
		html+= '<form class="space-y-4">';
		html+= '<div class="grid gap-2">';
		html+= '<div class="dropdown_group">';
		html+= '<button type="button" role="combobox" aria-controls="radix-:r2q:" aria-expanded="false" aria-autocomplete="none" dir="ltr" data-state="closed" class="flex h-10 w-full items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1"><span style="pointer-events: none;"><?php echo $order_status;?></span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50" aria-hidden="true"><path d="m6 9 6 6 6-6"></path></svg></button>';

		html+= '<div class="dropdown">';
		<?php foreach($order_statuses as $o_s_id=>$o_s){ ?>
			html+= '<label>';
			<?php if($order_status_id == $o_s_id){ ?>
				html+= '<input type="radio" name="change_order_status_id" value="<?php echo $o_s_id;?>" checked>';
			<?php }else{ ?>
				html+= '<input type="radio" name="change_order_status_id" value="<?php echo $o_s_id;?>">';
			<?php };?>
			html+= '<span></span><div class="title_drop"><?php echo $o_s;?></div></label>';
		<?php };?>
		html+= '</div>';
		html+= '</div>';
		html+= '</div>';
		html+= '<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 w-full" id="save_order_status" type="button">Save Changes</button>';
		html+= '</form>';
		html+= '<button type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none data-[state=open]:bg-accent data-[state=open]:text-muted-foreground close"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg><span class="sr-only">Close</span></button>';
		html+= '</div>';
		$('body').append(html);
	});

	$('#save_order_status').live("click",function(){
console.log( 'order_form #save_order_status' );
		$.ajax({
			url: 'index.php?route=sale/order/changestatus&token=<?php echo $token; ?>&order_id=<?php echo $order_id;?>&order_status_id=' + encodeURIComponent($('#modal_change_status input[type=radio]:checked').val()),
			dataType: 'json',
			success: function(json) {
console.log( 'sale/order/changestatus:' + JSON.stringify(json) );
				if(json['success']){
					html = '<div id="notifications_f8"><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span><ol tabindex="-1" class="fixed top-0 z-[100] flex max-h-screen w-full flex-col-reverse p-4 sm:bottom-0 sm:right-0 sm:top-auto sm:flex-col md:max-w-[420px]"><li role="status" aria-live="off" aria-atomic="true" tabindex="0" data-state="open" data-swipe-direction="right" class="group pointer-events-auto relative flex w-full items-center justify-between space-x-4 overflow-hidden rounded-md p-6 pr-8 shadow-lg transition-all data-[swipe=cancel]:translate-x-0 data-[swipe=end]:translate-x-[var(--radix-toast-swipe-end-x)] data-[swipe=move]:translate-x-[var(--radix-toast-swipe-move-x)] data-[swipe=move]:transition-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[swipe=end]:animate-out data-[state=closed]:fade-out-80 data-[state=closed]:slide-out-to-right-full data-[state=open]:slide-in-from-top-full data-[state=open]:sm:slide-in-from-bottom-full border bg-background text-foreground" data-radix-collection-item="" data-swipe="cancel" style="user-select: none; touch-action: none;"><div class="grid gap-1"><div class="text-sm font-semibold">Order status updated</div><div class="text-sm opacity-90">' + json['success'] + '</div></div><button type="button" class="absolute right-2 top-2 rounded-md p-1 text-foreground/50 opacity-0 transition-opacity hover:text-foreground focus:opacity-100 focus:outline-none focus:ring-2 group-hover:opacity-100 group-[.destructive]:text-red-300 group-[.destructive]:hover:text-red-50 group-[.destructive]:focus:ring-red-400 group-[.destructive]:focus:ring-offset-red-600" toast-close="" data-radix-toast-announce-exclude=""><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg></button></li></ol><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span></div>';
					$('body').append(html);
					$('#change_status_order').prev().removeClass('order_status' + $('#change_status_order').prev().attr('data-o-s')).attr('data-o-s', $('#modal_change_status input[type=radio]:checked').val()).addClass('order_status' + $('#modal_change_status input[type=radio]:checked').val()).html($('#modal_change_status input[type=radio]:checked').closest('label').find('.title_drop').html());
				}
			}
		});
	});
	$('#modal_change_status .close').live("click",function(e){
console.log( 'order_form #modal_change_status' );
		$('.overlay').remove();
		$('#modal_change_status').remove();
		$('#notifications_f8').remove();
	});
<?php /*	редактирование данных */	?>
	var m_deliveryDate = '<?php echo $date_shipping;?>';
	$('#change_delivery_order').live("click",function(){
console.log( 'order_form #change_delivery_order' );
		$('.overlay').remove();
		$('#modal_delivery_order').remove();
		
		html = '<div data-state="open" class="fixed inset-0 z-50 bg-black/80 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 overlay"></div>';
		
		html+= '<div id="modal_delivery_order" class="fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[state=closed]:slide-out-to-left-1/2 data-[state=closed]:slide-out-to-top-[48%] data-[state=open]:slide-in-from-left-1/2 data-[state=open]:slide-in-from-top-[48%] sm:rounded-lg" tabindex="-1" style="pointer-events: auto;">';
		html+= '<div class="flex flex-col space-y-1.5 text-center sm:text-left"><h2 id="radix-:r6:" class="text-lg font-semibold leading-none tracking-tight">Edit Order Details</h2></div>';
		html+= '<form class="space-y-4"><div class="grid gap-2">';
		html+= '<label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="deliveryDate">Delivery Date</label>';
		html+= '<input class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm" id="deliveryDate" name="deliveryDate" value="' + m_deliveryDate + '">';
		html+= '</div>';
		
		html+= '<div class="grid gap-2">';
		html+= '<label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="deliveryWindow">Delivery Window</label>';
		
		html+= '<div class="dropdown_group">';
		html+= '<button type="button" role="combobox" aria-controls="radix-:r60:" aria-expanded="false" aria-autocomplete="none" dir="ltr" data-state="closed" class="flex h-10 w-full items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1"><span style="pointer-events: none;"><?php echo $time_shipping;?></span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50" aria-hidden="true"><path d="m6 9 6 6 6-6"></path></svg></button>';

		html+= '<div class="dropdown">';
		<?php foreach($delivery_times as $d_t_id=>$d_t){ ?>
			html+= '<label>';
			<?php if($time_shipping_short == $d_t['delivery_short']){ ?>
				html+= '<input type="radio" name="deliveryWindow" value="<?php echo $d_t['delivery_short'];?>" checked>';
			<?php }else{ ?>
				html+= '<input type="radio" name="deliveryWindow" value="<?php echo $d_t['delivery_short'];?>">';
			<?php };?>
			html+= '<span></span><div class="title_drop"><?php echo $d_t['delivery_name'];?></div></label>';
		<?php };?>
		html+= '</div>';
		html+= '</div>';
		
		html+= '</div>';
		html+= '<div class="grid gap-2">';
		html+= '<label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="paymentStatus">Payment Status</label>';
		html+= '<select id="paymentStatus" name="paymentStatus" class="flex h-9 w-full rounded-md border px-3 py-1 bg-green-50 text-green-700 border-green-200">';
		<?php foreach($payment_statuses as $p_s){ ?>
			html+= '<option value="<?php echo $p_s['payment_status_id'];?>" class="bg-green-50 text-green-700" <?php echo $p_s['selected'];?>><?php echo $p_s['payment_status'];?></option>';
		<?php };?>
		html+= '</select>';
		html+= '</div>';
		html+= '<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 w-full" id="save_delivery_order" type="button">Save Changes</button>';
		html+= '</form>';
		html+= '<button type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none data-[state=open]:bg-accent data-[state=open]:text-muted-foreground close"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg><span class="sr-only">Close</span></button>';
		html+= '</div>';
		$('body').append(html);
	});
	$('#modal_delivery_order .close').live("click",function(e){
console.log( 'order_form #modal_delivery_order' );
		$('.overlay').remove();
		$('#modal_delivery_order').remove();
		$('#notifications_f8').remove();
	});
	$('#save_delivery_order').live("click",function(){
console.log( 'order_form #save_delivery_order' );
		$.ajax({
			url: 'index.php?route=sale/order/changedelivery&token=<?php echo $token; ?>&order_id=<?php echo $order_id;?>&deliveryDate=' + encodeURIComponent($('#modal_delivery_order input#deliveryDate').val()) + '&deliveryWindow=' + encodeURIComponent($('#modal_delivery_order input[name=deliveryWindow]:checked').val()) + '&paymentStatus=' + encodeURIComponent($('#modal_delivery_order #paymentStatus').val()),
			dataType: 'json',
			success: function(json) {
console.log( 'sale/order/changedelivery:' + JSON.stringify(json) );
				if(json['success']){
					html = '<div id="notifications_f8"><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span><ol tabindex="-1" class="fixed top-0 z-[100] flex max-h-screen w-full flex-col-reverse p-4 sm:bottom-0 sm:right-0 sm:top-auto sm:flex-col md:max-w-[420px]"><li role="status" aria-live="off" aria-atomic="true" tabindex="0" data-state="open" data-swipe-direction="right" class="group pointer-events-auto relative flex w-full items-center justify-between space-x-4 overflow-hidden rounded-md p-6 pr-8 shadow-lg transition-all data-[swipe=cancel]:translate-x-0 data-[swipe=end]:translate-x-[var(--radix-toast-swipe-end-x)] data-[swipe=move]:translate-x-[var(--radix-toast-swipe-move-x)] data-[swipe=move]:transition-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[swipe=end]:animate-out data-[state=closed]:fade-out-80 data-[state=closed]:slide-out-to-right-full data-[state=open]:slide-in-from-top-full data-[state=open]:sm:slide-in-from-bottom-full border bg-background text-foreground" data-radix-collection-item="" data-swipe="cancel" style="user-select: none; touch-action: none;"><div class="grid gap-1"><div class="text-sm font-semibold">Order status updated</div><div class="text-sm opacity-90">' + json['success'] + '</div></div><button type="button" class="absolute right-2 top-2 rounded-md p-1 text-foreground/50 opacity-0 transition-opacity hover:text-foreground focus:opacity-100 focus:outline-none focus:ring-2 group-hover:opacity-100 group-[.destructive]:text-red-300 group-[.destructive]:hover:text-red-50 group-[.destructive]:focus:ring-red-400 group-[.destructive]:focus:ring-offset-red-600" toast-close="" data-radix-toast-announce-exclude=""><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg></button></li></ol><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span></div>';
					$('body').append(html);
					
					if(json['in_a1']){
						$('#in_a1').html(json['in_a1']);
						m_deliveryDate = json['in_a1'];
					}
					if(json['in_a2']){
						$('#in_a2').html(json['in_a2']);
					}
					if(json['in_a3']){
						$('#in_a3').html(json['in_a3']);
					}
					
				}
			}
		});
	});
	
	$('#edit_customer_data_button').live("click",function(){
console.log( 'order_form #edit_customer_data_button' );
		$('.overlay').remove();
		$('#modal_customer_data').remove();
		
		html = '<div data-state="open" class="fixed inset-0 z-50 bg-black/80 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 overlay"></div>';
		
		html+= '<div id="modal_customer_data" class="fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[state=closed]:slide-out-to-left-1/2 data-[state=closed]:slide-out-to-top-[48%] data-[state=open]:slide-in-from-left-1/2 data-[state=open]:slide-in-from-top-[48%] sm:rounded-lg" tabindex="-1" style="pointer-events: auto;">';
		html+= '<div class="flex flex-col space-y-1.5 text-center sm:text-left"><h2 id="radix-:r1u:" class="text-lg font-semibold leading-none tracking-tight">Edit Customer Information</h2></div>';
		html+= '<form class="space-y-4">';
		html+= '<div class="space-y-4">';
		html+= '<div class="grid gap-2">';
		html+= '<label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70">Customer</label>';
		html+= '<input class="flex h-10 w-full rounded-md border border-input px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm bg-gray-100" name="firstname" readonly="" id="cutomer_firstname" value="<?php if(!empty($customer_checkout)){ echo $customer_checkout['firstname'];};?>">';
		html+= '</div>';
		html+= '<div class="grid gap-2"><label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="email">Email</label><input type="email" class="flex h-10 w-full rounded-md border border-input px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm bg-gray-100" id="mcemail" name="email" readonly="" value="<?php if(!empty($customer_checkout)){ echo $customer_checkout['email'];};?>"></div>';
		html+= '<div class="grid gap-2">';
		html+= '<label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="phone">Phone</label>';
		html+= '<input class="flex h-10 w-full rounded-md border border-input px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm bg-gray-100" id="mcphone" name="phone" readonly="" value="<?php if(!empty($customer_checkout)){ echo $customer_checkout['telephone'];};?>">';
		html+= '</div>';
		html+= '</div>';
		html+= '<div class="space-y-4">';
		html+= '<h4 class="font-medium">Shipping Address</h4>';
		html+= '<div class="grid gap-2">';
		html+= '<label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="location">Select Location</label>';
		html+= '<div class="dropdown_group">';
		html+= '<button type="button" role="combobox" aria-controls="radix-:r2q:" aria-expanded="false" aria-autocomplete="none" dir="ltr" data-state="closed" class="flex h-10 w-full items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1">';
		html+= '<span><?php echo $location;?></span>';
		html+= '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50" aria-hidden="true"><path d="m6 9 6 6 6-6"></path></svg>';
		html+= '</button>';
		html+= '<div class="dropdown">';
		<?php foreach($all_locations as $a_loc){ ?>
			html+= '<label>';
			<?php if($location_key == $a_loc){ ?>
				html+= '<input type="radio" name="order_location" value="<?php echo $a_loc;?>" checked>';
			<?php }else{ ?>
				html+= '<input type="radio" name="order_location" value="<?php echo $a_loc;?>">';
			<?php };?>
			html+= '<span></span><div class="title_drop"><?php echo $a_loc;?></div></label>';
		<?php };?>
		html+= '</div>';
		html+= '</div>';
		
		html+= '</div>';
		html+= '</div>';
		html+= '<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 w-full" id="change_customer_data" type="button">Save Changes</button>';
		html+= '</form>';
		html+= '<button type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none data-[state=open]:bg-accent data-[state=open]:text-muted-foreground close"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg><span class="sr-only">Close</span></button>';
		html+= '</div>';
		$('body').append(html);
	});
	$('#modal_customer_data .close').live("click",function(e){
console.log( 'order_form #modal_customer_data-close' );
		$('.overlay').remove();
		$('#modal_customer_data').remove();
		$('#notifications_f8').remove();
	});
	$('#change_customer_data').live("click",function(){
console.log( 'order_form #change_customer_data' );
		$.ajax({
			url: 'index.php?route=sale/order/changecustomer&token=<?php echo $token; ?>&order_id=<?php echo $order_id;?>&location=' + encodeURIComponent($('#modal_customer_data input[name=order_location]:checked').val()) ,<?php /* + '&firstname=' + encodeURIComponent($('#modal_customer_data input#cutomer_firstname').val()) + '&email=' + encodeURIComponent($('#modal_customer_data #mcemail').val()) + '&phone=' + encodeURIComponent($('#modal_customer_data #mcphone').val()) */ ?>
			dataType: 'json',
			success: function(json) {
console.log( 'sale/order/changecustomer:' + JSON.stringify(json) );
				if(json['success']){
					html = '<div id="notifications_f8"><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span><ol tabindex="-1" class="fixed top-0 z-[100] flex max-h-screen w-full flex-col-reverse p-4 sm:bottom-0 sm:right-0 sm:top-auto sm:flex-col md:max-w-[420px]"><li role="status" aria-live="off" aria-atomic="true" tabindex="0" data-state="open" data-swipe-direction="right" class="group pointer-events-auto relative flex w-full items-center justify-between space-x-4 overflow-hidden rounded-md p-6 pr-8 shadow-lg transition-all data-[swipe=cancel]:translate-x-0 data-[swipe=end]:translate-x-[var(--radix-toast-swipe-end-x)] data-[swipe=move]:translate-x-[var(--radix-toast-swipe-move-x)] data-[swipe=move]:transition-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[swipe=end]:animate-out data-[state=closed]:fade-out-80 data-[state=closed]:slide-out-to-right-full data-[state=open]:slide-in-from-top-full data-[state=open]:sm:slide-in-from-bottom-full border bg-background text-foreground" data-radix-collection-item="" data-swipe="cancel" style="user-select: none; touch-action: none;"><div class="grid gap-1"><div class="text-sm font-semibold">Order status updated</div><div class="text-sm opacity-90">' + json['success'] + '</div></div><button type="button" class="absolute right-2 top-2 rounded-md p-1 text-foreground/50 opacity-0 transition-opacity hover:text-foreground focus:opacity-100 focus:outline-none focus:ring-2 group-hover:opacity-100 group-[.destructive]:text-red-300 group-[.destructive]:hover:text-red-50 group-[.destructive]:focus:ring-red-400 group-[.destructive]:focus:ring-offset-red-600" toast-close="" data-radix-toast-announce-exclude=""><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg></button></li></ol><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span></div>';
					$('body').append(html);
					
					if(json['in_a1']){
						$('#in_a1').html(json['in_a1']);
						m_deliveryDate = json['in_a1'];
					}
					if(json['in_a2']){
						$('#in_a2').html(json['in_a2']);
					}
					if(json['in_a3']){
						$('#in_a3').html(json['in_a3']);
					}
					
				}
			}
		});
	});
	$('#button_collector_info').live("click",function(){
console.log( 'order_form #button_collector_info' );
		$('.overlay').remove();
		$('#modal_collector_data').remove();
		
		html = '<div data-state="open" class="fixed inset-0 z-50 bg-black/80 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 overlay"></div>';
		
		html+= '<div id="modal_collector_data" class="fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[state=closed]:slide-out-to-left-1/2 data-[state=closed]:slide-out-to-top-[48%] data-[state=open]:slide-in-from-left-1/2 data-[state=open]:slide-in-from-top-[48%] sm:rounded-lg" tabindex="-1">';
		html+= '<div class="flex flex-col space-y-1.5 text-center sm:text-left"><h2 id="radix-:r22:" class="text-lg font-semibold leading-none tracking-tight">Edit Collector Information</h2></div>';
		html+= '<form class="space-y-4">';

		html+= '<div class="grid gap-2">';
		html+= '<label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="name">Name</label>';
		
		html+= '<div class="dropdown_group">';
		html+= '<button type="button" role="combobox" aria-controls="radix-:r2q:" aria-expanded="false" aria-autocomplete="none" dir="ltr" data-state="closed" data-placeholder="" class="flex h-10 w-full items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1"><span style="pointer-events: none;">';
		html+= '<?php echo !empty($collector_data['firstname'])?$collector_data['firstname']:'Select a collector';?>';
		html+= '</span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50" aria-hidden="true"><path d="m6 9 6 6 6-6"></path></svg></button>';
		html+= '<div class="dropdown">';
		<?php foreach($collectors_data as $u_id=>$c_d){ ?>
			html+= '<label>';
			<?php if(!empty($collector_data) and $collector_data['user_id'] == $u_id){ ?>
				html+= '<input type="radio" name="user_id" value="<?php echo $u_id;?>" checked data-email="<?php echo $c_d['email'];?>" data-phone="<?php echo $c_d['telephone'];?>">';
			<?php }else{ ?>
				html+= '<input type="radio" name="user_id" value="<?php echo $u_id;?>" data-email="<?php echo $c_d['email'];?>" data-phone="<?php echo $c_d['telephone'];?>">';
			<?php };?>
			html+= '<span></span><div class="title_drop"><?php echo $c_d['firstname'];?></div></label>';
		<?php };?>
		html+= '</div>';
		html+= '</div>';
		html+= '</div>';
		
		html+= '<div class="grid gap-2">';
		html+= '<label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="phone">Phone</label>';
		html+= '<input class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm" id="phone" name="phone" disabled="" value="<?php if(!empty($collector_data)){ echo $collector_data['telephone'];};?>">';
		html+= '</div>';
		html+= '<div class="grid gap-2"><label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="email">Email</label><input type="email" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm" id="email" name="email" disabled="" value="<?php if(!empty($collector_data)){ echo $collector_data['email'];};?>"></div>';
		html+= '<div class="grid gap-2">';
		html+= '<label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="collectionWindow">Collection Window</label>';

		html+= '<div class="dropdown_group">';
		html+= '<button type="button" role="combobox" aria-controls="radix-:r2r:" aria-expanded="false" aria-autocomplete="none" dir="ltr" data-state="closed" class="flex h-10 w-full items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1"><span style="pointer-events: none;"><?php if(!empty($collection_window)){ echo $collection_window;};?></span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50" aria-hidden="true"><path d="m6 9 6 6 6-6"></path></svg></button>';

		html+= '<div class="dropdown">';
		<?php foreach($delivery_times as $d_t_id=>$d_t){ ?>
			html+= '<label>';
			<?php if(trim($collection_window2) == trim($d_t['delivery_short'])){ ?>
				html+= '<input type="radio" name="collectionWindow" value="<?php echo $d_t['delivery_short'];?>" checked>';
			<?php }else{ ?>
				html+= '<input type="radio" name="collectionWindow" value="<?php echo $d_t['delivery_short'];?>">';
			<?php };?>
			html+= '<span data-d2="<?php echo $collection_window2;?>"></span><div class="title_drop"><?php echo $d_t['delivery_name'];?></div></label>';
		<?php };?>
		html+= '</div>';
		html+= '</div>';
		
		html+= '</div>';
		html+= '<div class="space-y-2">';
		html+= '<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 w-full" type="button" id="save_collector">Save Changes</button>';
		html+= '<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-destructive text-destructive-foreground hover:bg-destructive/90 h-10 px-4 py-2 w-full" id="removecollector" type="button"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash2 h-4 w-4 mr-2"><path d="M3 6h18"></path><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path><line x1="10" x2="10" y1="11" y2="17"></line><line x1="14" x2="14" y1="11" y2="17"></line></svg>Remove Collector</button>';
		html+= '</div>';
		html+= '</form>';
		html+= '<button type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none data-[state=open]:bg-accent data-[state=open]:text-muted-foreground close"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg><span class="sr-only">Close</span></button></div>';
		$('body').append(html);
	});
	$('#modal_collector_data .close').live("click",function(e){
console.log( 'order_form #modal_collector_data-close' );
		$('.overlay').remove();
		$('#modal_collector_data').remove();
		$('#notifications_f8').remove();
	});
	$('#modal_collector_data input[name=user_id]').live("change",function(){
console.log( 'order_form #modal_collector_data-input' );
		$('#modal_collector_data #phone').attr('value',$(this).attr('data-phone'));
		$('#modal_collector_data #email').attr('value',$(this).attr('data-email'));
	});
	$('#save_collector').live("click",function(){
console.log( 'order_form #save_collector' );
		$('#notifications_f8').remove();
		$.ajax({
			url: 'index.php?route=sale/order/changecollector&token=<?php echo $token; ?>&order_id=<?php echo $order_id;?>&user_id=' + encodeURIComponent($('#modal_collector_data input[name=user_id]:checked').val()) + '&collectionWindow=' + encodeURIComponent($('#modal_collector_data input[name=collectionWindow]:checked').val()) ,
			dataType: 'json',
			success: function(json) {
console.log( 'sale/order/changecollector:' + JSON.stringify(json) );
				if(json['success']){
					html = '<div id="notifications_f8"><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span><ol tabindex="-1" class="fixed top-0 z-[100] flex max-h-screen w-full flex-col-reverse p-4 sm:bottom-0 sm:right-0 sm:top-auto sm:flex-col md:max-w-[420px]"><li role="status" aria-live="off" aria-atomic="true" tabindex="0" data-state="open" data-swipe-direction="right" class="group pointer-events-auto relative flex w-full items-center justify-between space-x-4 overflow-hidden rounded-md p-6 pr-8 shadow-lg transition-all data-[swipe=cancel]:translate-x-0 data-[swipe=end]:translate-x-[var(--radix-toast-swipe-end-x)] data-[swipe=move]:translate-x-[var(--radix-toast-swipe-move-x)] data-[swipe=move]:transition-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[swipe=end]:animate-out data-[state=closed]:fade-out-80 data-[state=closed]:slide-out-to-right-full data-[state=open]:slide-in-from-top-full data-[state=open]:sm:slide-in-from-bottom-full border bg-background text-foreground" data-radix-collection-item="" data-swipe="cancel" style="user-select: none; touch-action: none;"><div class="grid gap-1"><div class="text-sm font-semibold">Order status updated</div><div class="text-sm opacity-90">' + json['success'] + '</div></div><button type="button" class="absolute right-2 top-2 rounded-md p-1 text-foreground/50 opacity-0 transition-opacity hover:text-foreground focus:opacity-100 focus:outline-none focus:ring-2 group-hover:opacity-100 group-[.destructive]:text-red-300 group-[.destructive]:hover:text-red-50 group-[.destructive]:focus:ring-red-400 group-[.destructive]:focus:ring-offset-red-600" toast-close="" data-radix-toast-announce-exclude=""><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg></button></li></ol><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span></div>';
					$('body').append(html);
					setTimeout(function(){
						location.reload();
					},2000);
					//	$('#load_details_order').load("index.php?route=sale/order/update&order_id=<?php echo $order_id;?>&token=<?php echo $token;?> #load_details_order > *");
				}
				
				if(json['error']){
					html = '<div id="notifications_f8"><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span><ol tabindex="-1" class="fixed top-0 z-[100] flex max-h-screen w-full flex-col-reverse p-4 sm:bottom-0 sm:right-0 sm:top-auto sm:flex-col md:max-w-[420px]"><li role="status" aria-live="off" aria-atomic="true" tabindex="0" data-state="open" data-swipe-direction="right" class="group pointer-events-auto relative flex w-full items-center justify-between space-x-4 overflow-hidden rounded-md p-6 pr-8 shadow-lg transition-all data-[swipe=cancel]:translate-x-0 data-[swipe=end]:translate-x-[var(--radix-toast-swipe-end-x)] data-[swipe=move]:translate-x-[var(--radix-toast-swipe-move-x)] data-[swipe=move]:transition-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[swipe=end]:animate-out data-[state=closed]:fade-out-80 data-[state=closed]:slide-out-to-right-full data-[state=open]:slide-in-from-top-full data-[state=open]:sm:slide-in-from-bottom-full border bg-background text-foreground" data-radix-collection-item="" data-swipe="cancel" style="user-select: none; touch-action: none;"><div class="grid gap-1"><div class="text-sm font-semibold error">' + json['error'] + '</div></div><button type="button" class="absolute right-2 top-2 rounded-md p-1 text-foreground/50 opacity-0 transition-opacity hover:text-foreground focus:opacity-100 focus:outline-none focus:ring-2 group-hover:opacity-100 group-[.destructive]:text-red-300 group-[.destructive]:hover:text-red-50 group-[.destructive]:focus:ring-red-400 group-[.destructive]:focus:ring-offset-red-600" toast-close="" data-radix-toast-announce-exclude=""><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg></button></li></ol><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span></div>';
					$('body').append(html);
					setTimeout(function(){
						$('#notifications_f8').remove();
					},2000);
				}

			}
		});
	});
	$('#removecollector').live("click",function(){
console.log( 'order_form #removecollector' );
		$.ajax({
			url: 'index.php?route=sale/order/removecollector&token=<?php echo $token; ?>&order_id=<?php echo $order_id;?>',
			dataType: 'json',
			success: function(json) {
console.log( 'sale/order/removecollector:' + JSON.stringify(json) );
				if(json['success']){
					html = '<div id="notifications_f8"><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span><ol tabindex="-1" class="fixed top-0 z-[100] flex max-h-screen w-full flex-col-reverse p-4 sm:bottom-0 sm:right-0 sm:top-auto sm:flex-col md:max-w-[420px]"><li role="status" aria-live="off" aria-atomic="true" tabindex="0" data-state="open" data-swipe-direction="right" class="group pointer-events-auto relative flex w-full items-center justify-between space-x-4 overflow-hidden rounded-md p-6 pr-8 shadow-lg transition-all data-[swipe=cancel]:translate-x-0 data-[swipe=end]:translate-x-[var(--radix-toast-swipe-end-x)] data-[swipe=move]:translate-x-[var(--radix-toast-swipe-move-x)] data-[swipe=move]:transition-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[swipe=end]:animate-out data-[state=closed]:fade-out-80 data-[state=closed]:slide-out-to-right-full data-[state=open]:slide-in-from-top-full data-[state=open]:sm:slide-in-from-bottom-full border bg-background text-foreground" data-radix-collection-item="" data-swipe="cancel" style="user-select: none; touch-action: none;"><div class="grid gap-1"><div class="text-sm font-semibold">Order status updated</div><div class="text-sm opacity-90">' + json['success'] + '</div></div><button type="button" class="absolute right-2 top-2 rounded-md p-1 text-foreground/50 opacity-0 transition-opacity hover:text-foreground focus:opacity-100 focus:outline-none focus:ring-2 group-hover:opacity-100 group-[.destructive]:text-red-300 group-[.destructive]:hover:text-red-50 group-[.destructive]:focus:ring-red-400 group-[.destructive]:focus:ring-offset-red-600" toast-close="" data-radix-toast-announce-exclude=""><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg></button></li></ol><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span></div>';
					$('body').append(html);
					
					$('#load_details_order').load("index.php?route=sale/order/update&order_id=<?php echo $order_id;?>&token=<?php echo $token;?> #load_details_order > *");
				}
			}
		});
	});
	
	$('#add_products').live("click",function(){
console.log( 'order_form #add_products' );
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
		html+= '<button type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none data-[state=open]:bg-accent data-[state=open]:text-muted-foreground close"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg><span class="sr-only">Close</span></button>';
		html+= '</div>';
		
		$('body').append(html);
	});
	$('#modal_product_data .close').live("click",function(e){
console.log( 'order_form #modal_product_data-close' );
		$('.overlay').remove();
		$('#modal_product_data').remove();
		$('#notifications_f8').remove();
	});
	//	search_load_products

	$('input#search_load_products').live("keyup",function(){
console.log( 'order_form input#search_load_products' );
		var this_slp = $(this);
		clearTimeout(timer_slp);
		timer_slp = setTimeout(function(){

			$.ajax({
				url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' + encodeURIComponent($(this_slp).val()) + '&location=' + encodeURIComponent('<?php echo trim($location_key);?>'),
				dataType: 'json',
				success: function(json) {
console.log( 'catalog/product/autocomplete:' + JSON.stringify(json) );
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
									html+= '<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground rounded-md h-6 px-2 text-xs change_type" ';
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
								html+= '<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3 append_order" data-product_id="' + json[k]['product_id'] + '" data-type="' + start_type + '">';
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
		},1000);
	});
	$('.item_product .change_type').live("click",function(e){
console.log('order_form .item_product-change_type');
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
console.log('order_form .append_order');
		$('#radix111').addClass('disabled');
		type = $(this).attr('data-type');
		product_id = $(this).attr('data-product_id');
		$.ajax({
			url: 'index.php?route=sale/order/recalctotal&token=<?php echo $token; ?>',
			type: 'post',
			data: 'product_id=' + product_id + '&type=' + type + '&order_id=<?php echo $order_id;?>',
			dataType: 'json',
			success: function(json) {
console.log( 'catalog/product/autocomplete:' + JSON.stringify(json) );
				$('#recalctotals').load("index.php?route=sale/order/update&order_id=<?php echo $order_id;?>&token=<?php echo $token;?> #recalctotals > *",{},function(){
					$('#radix111').removeClass('disabled');
				});
				$('.overlay').remove();
				$('#modal_change_status').remove();
				$('#notifications_f8').remove();
				$('#modal_delivery_order').remove();
				$('#modal_customer_data').remove();
				$('#modal_collector_data').remove();
				$('#modal_product_data').remove();
			},
		});
	});
	$('.collect_complete').live("click",function(){
console.log('order_form .collect_complete');
		$.ajax({
			url: 'index.php?route=sale/order/collcomplete&order_id=<?php echo $order_id;?>&token=<?php echo $token;?>',
			type: 'post',
			data: 'del_product_id=' + $(this).attr('data-order_product_id') + '&order_id=<?php echo $order_id;?>',
			dataType: 'json',
			success: function(json) {
console.log( 'sale/order/collcomplete:' + JSON.stringify(json) );
				$('#radix111').load("index.php?route=sale/order/update&order_id=<?php echo $order_id;?>&token=<?php echo $token;?> #radix111 > *");
			}
		});
	});
	$('.delete_product').live("click",function(){
console.log('order_form .delete_product');
		$.ajax({
			url: 'index.php?route=sale/order/recalctotal&token=<?php echo $token; ?>',
			type: 'post',
			data: 'del_product_id=' + $(this).attr('data-order_product_id') + '&order_id=<?php echo $order_id;?>',
			dataType: 'json',
			success: function(json) {
console.log( 'sale/order/recalctotal:' + JSON.stringify(json) );
				if(json['success']){

					$('#radix111').load("index.php?route=sale/order/update&order_id=<?php echo $order_id;?>&token=<?php echo $token;?> #radix111 > *");
					
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
	});
	$('.q .minus').live("click",function(){
		q = $(this).next().val();
		if(q && q > 1){
			q = parseInt(q);
			$(this).next().val(q - 1);
			$('.q .q_change').trigger('change');
		}
	});
	$('.q .plus').live("click",function(){
		q = $(this).prev().val();
		if(q){
			q = parseInt(q);
			$(this).prev().val(q + 1);
			$('.q .q_change').trigger('change');
		}
	});
	$('.q .q_change').live("change",function(){
console.log('order_form .q_change');
		opid = $(this).attr('data-order_product_id');
		opid = parseInt(opid);
		q = $(this).val();
		$('#radix111').addClass('disabled');
		$.ajax({
			url: 'index.php?route=sale/order/recalctotal&token=<?php echo $token; ?>',
			type: 'post',
			data: 'order_product_id=' + opid + '&quantity=' + q + '&order_id=<?php echo $order_id;?>',
			dataType: 'json',
			success: function(json) {
console.log( 'sale/order/recalctotal:' + JSON.stringify(json) );
<?php /* обновляем только тоталсы */	?>
				if(json['success']){
					$('#recalctotals').load("index.php?route=sale/order/update&order_id=<?php echo $order_id;?>&token=<?php echo $token;?> #recalctotals > *",{},function(){
						$('#radix111').removeClass('disabled');
					});
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
	});
<?php /*	Change status collected */ ?>
	$(document).off('click', '.block_collected_stat label').on('click', '.block_collected_stat label', function(e) {
		e.stopPropagation();
console.log('order_form .block_collected_stat-label');
		var inp_bcs = $(this).find('input[type=radio]');

		if($(inp_bcs).val() == '1'){<?php /* <- Collected adjusted STATUS */	?>
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
		}else if($(inp_bcs).val() == '3' || $(inp_bcs).val() == '4'){<?php /* <- Out of Stock OR Substituted STATUS */ ?>
			var objtmp = $(inp_bcs);
			$.get("index.php?route=sale/order/oldq&order_id=<?php echo $order_id;?>&opid=" + $(inp_bcs).closest('.opi').attr('data-order_product_id') + "&q=0&token=<?php echo $token;?>", function(response) {
console.log( 'sale/order/oldq: ' + response );
				$.ajax({
					url: 'index.php?route=sale/order/recalctotal&token=<?php echo $token; ?>',
					type: 'post',
					data: 'order_product_id=' + $(objtmp).closest('.opi').find('.q_change').attr('data-order_product_id') + '&quantity=' + $('#adjust_modal input[type=number]').val() + '&order_id=<?php echo $order_id;?>',
					dataType: 'json',
					success: function(json) {
console.log( 'sale/order/recalctotal:' + JSON.stringify(json) );
<?php /* reload totals */	?>
						if(json['success']){
							var objtmp2 = $(objtmp).closest('.opi').find('.block_collected_stat input[type=radio]:checked');
							
							$('#recalctotals').load("index.php?route=sale/order/update&order_id=<?php echo $order_id;?>&token=<?php echo $token;?> #recalctotals > *",false,function(){
console.log('Change status collected -> to changecoll');
								changecoll($(objtmp2));
							});

						}
					},
				});
			}); 
		}else{
console.log('Change status collected -> to changecoll');
			changecoll($(inp_bcs));
		}
		
	});
	$('#adjust_modal .save').live("click",function(){
console.log('order_form #adjust_modal-save');
		if($('#adjust_modal input[type=number]').val() > 0){

			var objtmp = $(this);
			$.get("index.php?route=sale/order/oldq&order_id=<?php echo $order_id;?>&opid=" + $(this).closest('.opi').attr('data-order_product_id') + "&q=" + $('#adjust_modal input[type=number]').val() + "&token=<?php echo $token;?>", function(response) {

console.log( 'sale/order/oldq: ' + response );
				$.ajax({
					url: 'index.php?route=sale/order/recalctotal&token=<?php echo $token; ?>',
					type: 'post',
					data: 'order_product_id=' + $(objtmp).closest('.opi').find('.q_change').attr('data-order_product_id') + '&quantity=' + $('#adjust_modal input[type=number]').val() + '&order_id=<?php echo $order_id;?>',
					dataType: 'json',
					success: function(json) {
console.log( 'sale/order/recalctotal:' + JSON.stringify(json) );
<?php /* reload totals */	?>
						if(json['success']){
							var objtmp2 = $(objtmp).closest('.opi').find('.block_collected_stat input[type=radio]:checked');
							
							$('#recalctotals').load("index.php?route=sale/order/update&order_id=<?php echo $order_id;?>&token=<?php echo $token;?> #recalctotals > *",false,function(){
console.log('Adjusted Save -> to changecoll');
								changecoll($(objtmp2));
							});

						}
					},
				});
			}); 

		}
	});
	$('.change_type_p').live("click",function(){
console.log('order_form .change_type_p');
		opid = $(this).attr('data-order_product_id');
		opid = parseInt(opid);
		$.ajax({
			url: 'index.php?route=sale/order/changetype&token=<?php echo $token; ?>',
			type: 'post',
			data: 'order_product_id=' + opid + '&order_id=<?php echo $order_id;?>',
			dataType: 'json',
			success: function(json) {
console.log( 'sale/order/changetype:' + JSON.stringify(json) );
					$('#recalctotals').load("index.php?route=sale/order/update&order_id=<?php echo $order_id;?>&token=<?php echo $token;?> #recalctotals > *");
					$('.overlay').remove();
					$('#modal_change_status').remove();
					$('#notifications_f8').remove();
					$('#modal_delivery_order').remove();
					$('#modal_customer_data').remove();
					$('#modal_collector_data').remove();
					$('#modal_product_data').remove();
			}
		});
	});
	$('.button_req').live("click",function(){
console.log('order_form .button_req');
		html = '<div data-state="open" class="fixed inset-0 z-50 bg-black/80 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 overlay"></div>';
		
		html+= '<div role="dialog" id="modal_req" aria-describedby="radix-:r35:" aria-labelledby="radix-:r34:" data-state="open" class="fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[state=closed]:slide-out-to-left-1/2 data-[state=closed]:slide-out-to-top-[48%] data-[state=open]:slide-in-from-left-1/2 data-[state=open]:slide-in-from-top-[48%] sm:rounded-lg" tabindex="-1" style="pointer-events: auto;">';
		html+= '<div class="flex flex-col space-y-1.5 text-center sm:text-left">';
		html+= '<h2 id="radix-:r34:" class="text-lg font-semibold leading-none tracking-tight">Edit Requirements</h2>';
		html+= '<p id="radix-:r35:" class="text-sm text-muted-foreground">Select requirements from the dictionary or remove existing ones.</p>';
		html+= '</div>';
		html+= '<form class="space-y-4" id="form_req">';
		html+= '<input type="hidden" name="order_id" value="<?php echo $order_id;?>"/>';
		html+= '<div id="data_form_req" class="space-y-4">';
		<?php if(!empty($order_req)){ ?>
			<?php foreach($order_req as $o_r){ ?>
		html+= '<div class="flex gap-2 req_data">';
		html+= '<input class="flex h-10 w-full rounded-md border border-input px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm bg-gray-50" readonly="" value="<?php echo $o_r['name'];?>">';
		html+= '<input type="hidden" name="req_a[]" value="<?php echo $o_r['req_id'];?>"/>';
		html+= '<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10 delete_req" type="button" data-req_id="<?php echo $o_r['req_id'];?>">×</button>';
		html+= '</div>';
			<?php };?>
		<?php };?>
		html+= '</div>';
		html+= '<div class="flex gap-2">';
		html+= '<select name="req" class="flex h-10 items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1 w-full select_req">';
		html+= '<option value="0">Select a requirement</option>';
		<?php if(!empty($reqs)){ ?>
			<?php foreach($reqs as $req){ ?>
		html+= '<option value="<?php echo $req['req_id'];?>"><?php echo $req['name'];?></option>';
			<?php };?>
		<?php };?>
		html+= '</select>';
		html+= '<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 class_for_disabled add_req" type="button" disabled="">Add</button>';
		html+= '</div>';
		html+= '<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 w-full class_for_disabled" type="button" id="append_req">Save Changes</button>';
		html+= '</form>';
		html+= '<button type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 data-[state=open]:bg-accent data-[state=open]:text-muted-foreground close">';
		html+= '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg>';
		html+= '<span class="sr-only">Close</span>';
		html+= '</button>';
		html+= '</div>';
		$('body').append(html);
	});
	$("#modal_req .select_req").live("change",function(){
console.log('order_form #modal_req-select_req');
		if($(this).val() == '0'){
			$('.class_for_disabled').attr("disabled","disabled");
			$('.class_for_disabled').addClass('disabled:opacity-50');
		}else{
			$('.class_for_disabled').removeAttr("disabled");
			$('.class_for_disabled').removeClass('disabled:opacity-50');
		}
	});
	$("#modal_req .add_req").live("click",function(){
console.log('order_form #modal_req-add_req');
		if($('#modal_req .select_req').val() != '0'){
			html= '<div class="flex gap-2 req_data">';
			html+= '<input class="flex h-10 w-full rounded-md border border-input px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm bg-gray-50" readonly="" value="' + $('#modal_req .select_req option:selected').text() + '">';
			html+= '<input type="hidden" name="req_a[]" value="' + $('#modal_req .select_req').val() + '"/>';
			html+= '<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10 delete_req" type="button" data-req_id="' + $('#modal_req .select_req').val() + '">×</button>';
			html+= '</div>';
			$('#data_form_req').append(html);
		}
	});
	$("#modal_req .delete_req").live("click",function(){
console.log('order_form #modal_req-delete_req');
		$(this).closest('.req_data').remove();
	});
	$('#append_req').live("click",function(){
console.log('order_form #append_req');
		$.ajax({
			url: 'index.php?route=sale/order/changereq&token=<?php echo $token; ?>',
			type: 'post',
			data: $('#form_req').serialize(),
			dataType: 'json',
			success: function(json) {
console.log( 'sale/order/changereq:' + JSON.stringify(json) );
				if(json['success']){
					$('#modal_req').remove();
					$('.overlay').remove();
					$('#load_req').load("index.php?route=sale/order/update&order_id=<?php echo $order_id;?>&token=<?php echo $token;?> #load_req > *");
				}
			}
		});
	});
	//	modal_req
	$('#modal_req .close').live("click",function(e){
console.log('order_form #modal_req-close');
		$('.overlay').remove();
		$('#modal_req').remove();
		$('#notifications_f8').remove();
	});
	$('#save_files').live("click",function(){
console.log('order_form #save_files');
		$.ajax({
			url: 'index.php?route=sale/order/savefile&token=<?php echo $token; ?>&order_id=<?php echo $order_id;?>',
			type: 'post',
			data: $('#images_uf input[type=hidden]').serialize() ,
			dataType: 'json',
			success: function(json) {
console.log( 'sale/order/savefile:' + JSON.stringify(json) );
				if(json['success']){
					html = '<div id="notifications_f8"><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span><ol tabindex="-1" class="fixed top-0 z-[100] flex max-h-screen w-full flex-col-reverse p-4 sm:bottom-0 sm:right-0 sm:top-auto sm:flex-col md:max-w-[420px]"><li role="status" aria-live="off" aria-atomic="true" tabindex="0" data-state="open" data-swipe-direction="right" class="group pointer-events-auto relative flex w-full items-center justify-between space-x-4 overflow-hidden rounded-md p-6 pr-8 shadow-lg transition-all data-[swipe=cancel]:translate-x-0 data-[swipe=end]:translate-x-[var(--radix-toast-swipe-end-x)] data-[swipe=move]:translate-x-[var(--radix-toast-swipe-move-x)] data-[swipe=move]:transition-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[swipe=end]:animate-out data-[state=closed]:fade-out-80 data-[state=closed]:slide-out-to-right-full data-[state=open]:slide-in-from-top-full data-[state=open]:sm:slide-in-from-bottom-full border bg-background text-foreground" data-radix-collection-item="" data-swipe="cancel" style="user-select: none; touch-action: none;"><div class="grid gap-1"><div class="text-sm font-semibold">The Images are saved</div><div class="text-sm opacity-90"></div></div><button type="button" class="absolute right-2 top-2 rounded-md p-1 text-foreground/50 opacity-0 transition-opacity hover:text-foreground focus:opacity-100 focus:outline-none focus:ring-2 group-hover:opacity-100 group-[.destructive]:text-red-300 group-[.destructive]:hover:text-red-50 group-[.destructive]:focus:ring-red-400 group-[.destructive]:focus:ring-offset-red-600" toast-close="" data-radix-toast-announce-exclude=""><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg></button></li></ol><span aria-hidden="true" tabindex="0" style="position: fixed; border: 0px; width: 1px; height: 1px; padding: 0px; margin: -1px; overflow: hidden; clip: rect(0px, 0px, 0px, 0px); white-space: nowrap; overflow-wrap: normal;"></span></div>';
					$('body').append(html);
					setTimeout(function(){
						$('#notifications_f8').remove();
					},2000);
				}
			}
		});
	});
	$('#deb_pay').live("click",function(){
console.log('order_form #deb_pay');
		const result = confirm('Are you sure you want to charge the client?');
		if (result) {
			$.ajax({
				url: 'index.php?route=sale/order/debpay&token=<?php echo $token; ?>',
				type: 'post',
				data: 'order_id=<?php echo $order_id;?>',
				dataType: 'json',
				success: function(json) {
console.log( 'sale/order/debpay:' + JSON.stringify(json) );
					if(json['success']){
						location.reload();
					}
				}
			});
		} else {

		}

	});
	
	$('.overlay').live("click",function(e){
console.log('order_form .overlay');
		$('#modal_change_status').remove();
		$('#notifications_f8').remove();
		$('#modal_delivery_order').remove();
		$('#modal_customer_data').remove();
		$('#modal_collector_data').remove();
		$('#modal_product_data').remove();
		$('#modal_req').remove();
		$('.overlay').remove();
	});
	$(document).on("click",function(e){

		if ( !$("#modal_change_status").is(e.target) && $("#modal_change_status").has(e.target).length === 0 && !$("#modal_change_status").find('#change_status_order')) {
console.log('order_form #modal_change_status hide');
			$('.overlay').remove();
			$('#modal_change_status').remove();
			$('#notifications_f8').remove();
		}
		if ( !$("#adjust_modal").is(e.target) && $("#adjust_modal").has(e.target).length === 0 ) {
console.log('order_form #adjust_modal hide');
			$('#adjust_modal').remove();
			$('#notifications_f8').remove();
		}
		
	});
});

//--></script> 
<script type="text/javascript"><!--

//--></script> 

<script type="text/javascript" src="view/javascript/jquery/ajaxupload.js"></script>
<script type="text/javascript"><!--
var k_uf = <?php echo 2/*$k;*/;?>;
var i_uf;
function init_au(i_uf){
	new AjaxUpload('#upload_file' + i_uf, {
		action: 'index.php?route=sale/order/upload&token=<?php echo $token; ?>&order_id=<?php echo $order_id;?>&id_uf=' + i_uf,
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
<?php echo $footer; ?>