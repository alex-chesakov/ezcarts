<?php echo $header; ?>

<div class="container mx-auto px-4 py-8 flex-1 mt-16">
<!-- rating - back -->
	<div class="flex items-center justify-between gap-4 mb-6">

		<div class="flex items-center gap-2">
<?php /*
			<div  class="flex">

				<?php for($r=0;$r<$product_rating;$r++){ ?>
					<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none  focus-visible:ring-ring focus-visible:ring-offset-2 disabled: disabled:opacity-50 [&amp;_svg]: [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:text-accent-foreground h-9 rounded-md p-0 hover:bg-transparent">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-star h-6 w-6 fill-yellow-400 text-yellow-400"><path d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z"></path></svg>
					</button>
				<?php };?>
				<?php for($r=$product_rating;$r<5;$r++){ ?>
					<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none  focus-visible:ring-ring focus-visible:ring-offset-2 disabled: disabled:opacity-50 [&amp;_svg]: [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:text-accent-foreground h-9 rounded-md p-0 hover:bg-transparent">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-star h-6 w-6 text-gray-300"><path d="M11.525 2.295a.53.53 0 0 1 .95 0l2.31 4.679a2.123 2.123 0 0 0 1.595 1.16l5.166.756a.53.53 0 0 1 .294.904l-3.736 3.638a2.123 2.123 0 0 0-.611 1.878l.882 5.14a.53.53 0 0 1-.771.56l-4.618-2.428a2.122 2.122 0 0 0-1.973 0L6.396 21.01a.53.53 0 0 1-.77-.56l.881-5.139a2.122 2.122 0 0 0-.611-1.879L2.16 9.795a.53.53 0 0 1 .294-.906l5.165-.755a2.122 2.122 0 0 0 1.597-1.16z"></path></svg>
					</button>
				<?php };?>
			</div>
			
			<span class="text-sm text-gray-500">(<?php echo $product_votes;?> votes)</span>
*/	?>			
		</div>

		<a href="<?php echo $go_shop;?>" class="justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none  focus-visible:ring-ring focus-visible:ring-offset-2 disabled: disabled:opacity-50 [&amp;_svg]: [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:text-accent-foreground h-10 px-4 py-2 flex items-center gap-2 hover:bg-gray-100">
			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left h-5 w-5"><path d="m12 19-7-7 7-7"></path><path d="M19 12H5"></path></svg>
Back to shop
		</a>
	</div>
	
	<div class="grid grid-cols-1 md:grid-cols-2 gap-8">
		<div class="space-y-8">
			<div class="relative border rounded-lg p-6">
				<div class="flex items-center gap-2">
<span class="bg-blue-100 text-blue-800 text-sm font-medium px-2.5 py-0.5 rounded"><?php echo $product_category_name;?></span>
				</div>
				
				<h1 class="text-3xl font-bold mt-2 mb-6"><?php echo $product_name;?></h1>
				
				<div class="space-y-4">
					<img src="<?php echo $product_popup;?>" alt="<?php echo $product_name;?>" class="w-full rounded-lg shadow-md">
					<?php if(!empty($product_images)){ ?>
						<div class="grid grid-cols-4 gap-2">
							<?php foreach($product_images as $p_i){ ?>
								<img src="<?php echo $p_i;?>" alt="<?php echo $product_name;?> thumbnail 1" class="w-full h-20 object-cover rounded cursor-pointer hover:opacity-75 transition-opacity">
							<?php };?>
						</div>
					<?php };?>
				</div>
				
			</div>
			
			<div class="border rounded-lg p-6">
				<section class="mt-8 bg-gray-50 p-6 rounded-lg">
					<h2 class="text-xl font-semibold mb-4">Product Details</h2>
					
					<div class="space-y-3">
						<?php if(!empty($product_description)){ ?>
							<div class="flex flex-col">
								<span class="text-sm text-gray-500">Description</span>
								
								<p class="text-gray-700"><?php echo $product_description;?></p>
							</div>
						<?php };?>
						
						<?php if(!empty($product_item)){ ?>
							<div class="flex flex-col">
								<span class="text-sm text-gray-500">Item #</span>
								<p class="text-gray-700"><?php echo $product_item;?></p>
							</div>
						<?php };?>
						
						<?php if(!empty($product_upc)){ ?>
							<div class="flex flex-col">
								<span class="text-sm text-gray-500">UPC</span>
								<p class="text-gray-700"><?php echo $product_upc;?></p>
							</div>
						<?php };?>
						
						<?php if(!empty($product_unit_price) and trim($product_unit_price)!=='0' and trim($product_unit_price)!=='0.0000'){ ?>
							<div class="flex flex-col">
								<span class="text-sm text-gray-500">Average unit weight:</span>
								<p class="text-gray-700"><?php if(!preg_match('/[a-zA-Z]+/', $product_unit_price, $matches)){ ?><?php echo (float)$product_unit_price;?> lb<?php }else{ ?><?php echo $product_unit_price;?><?php };?></p>
							</div>
						<?php };?>

						<?php if(!empty($product_case_price) and trim($product_case_price)!=='0' and trim($product_case_price)!=='0.0000'){ ?>
							<div class="flex flex-col">
								<span class="text-sm text-gray-500">Average case weight:</span>
								<p class="text-gray-700"><?php if(!preg_match('/[a-zA-Z]+/', $product_case_price, $matches)){ ?><?php echo (float)$product_case_price;?> lbs<?php }else{ ?><?php echo $product_case_price;?><?php };?></p>
							</div>
						<?php };?>
						
						<?php if(!empty($product_bin)){ ?>
							<div class="flex flex-col">
								<span class="text-sm text-gray-500">BIN</span>
								<p class="text-gray-700"><?php echo $product_bin;?></p>
							</div>
						<?php };?>
						
					</div>
				</section>
			</div>
		</div>
	
		<div class="space-y-8">
			<div class="border rounded-lg p-6 product_info">
				<div class="space-y-6 closest_price">
					<div class="flex items-center justify-between">
					
						<?php if(!empty($product_price)){ ?>
							<div class="b_select_style">
								<button class="flex h-10 items-center justify-between rounded-md border border-input bg-white px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none  focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1 w-[180px]">
									<span class="to_type_price"><?php if($product_price_type == 'case'){ echo 'Case Price';}else{ ?>Unit Price<?php };?></span>
									
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50">
										<path d="m6 9 6 6 6-6"></path>
									</svg>
								</button>
								<div class="b_dropdown">
									<?php if(!empty($product_unit_price) and trim($product_unit_price)!=='0' and trim($product_unit_price)!=='0.0000'){ ?>
										<label><input type="radio" name="select_type_price" value="unit" data-type="Unit Price" data-price="<?php echo $product_unit_price;?>" <?php if($product_price_type == 'unit'){ echo 'checked';};?>/><span></span><div>Unit Price</div></label>
									<?php };?>
									<?php if(!empty($product_case_price) and trim($product_case_price)!=='0' and trim($product_case_price)!=='0.0000'){ ?>
										<label><input type="radio" name="select_type_price" value="case" data-type="Case Price" data-price="<?php echo $product_case_price;?>" <?php if($product_price_type == 'case'){ echo 'checked';};?>/><span></span><div>Case Price</div></label>
									<?php };?>
								</div>
							</div>
						<?php };?>
						
						<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none  focus-visible:ring-ring focus-visible:ring-offset-2 disabled: disabled:opacity-50 [&amp;_svg]: [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10 add_wish <?php if($wish_active){ ?>active<?php };?>" data-product_id="<?php echo $product_id;?>">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-heart h-5 w-5">
								<path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"></path>
							</svg>
						</button>
					</div>
					<?php if(!empty($product_price)){ ?>
						<div class="text-2xl font-bold" id="product_price">$<span class="to_val_price"><?php echo $product_price;?></span></div>
					<?php };?>
					<div class="flex items-center gap-4">
						<div class="flex items-center border rounded-md q_block">
							<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none  focus-visible:ring-ring focus-visible:ring-offset-2 disabled: disabled:opacity-50 [&amp;_svg]: [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 w-10 minus">
								<span >-</span>
							</button>
							<input type="text" name="quantity" value="1" class="w-12 text-center"/> 
							<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none  focus-visible:ring-ring focus-visible:ring-offset-2 disabled: disabled:opacity-50 [&amp;_svg]: [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 w-10 plus">
								<span >+</span>
							</button>
						</div>
					</div>
					
					<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none  focus-visible:ring-ring focus-visible:ring-offset-2 disabled: disabled:opacity-50 [&amp;_svg]: [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 w-full add_to_cart" data-product_id="<?php echo $product_id;?>" data-quantity="1" data-type="<?php if($product_price_type == 'case'){ echo 'case';}else{ echo 'unit'; };?>">
Add to Cart
					</button>
					
				</div>
			</div>
			
			<div class="border rounded-lg p-6">
<h3 class="text-2xl font-semibold mb-6">Similar Products</h3>
				
				<div class="relative" id="carousel_similar">
					<div class="relative px-12 w-full carousel swiper-viewport">
						<div class="swiper-container">
							<div class="swiper-wrapper">
							
								<?php foreach($similar_products as $s_p){ ?>
									<div class="min-w-0 shrink-0 grow-0 pl-4 basis-1/2 swiper-slide">
										<div class="p-2">
											<div class="bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow max-w-[160px]">
												<div class="relative">
													<img src="<?php echo $s_p['thumb'];?>" alt="<?php echo $s_p['name'];?>" class="w-full h-24 object-cover">
<?php if(empty($s_p['case_price']) or empty($s_p['unit_price'])){ ?>
	<button class="add_to_cart absolute top-2 right-2 bg-white hover:bg-gray-100 text-gray-800 p-1 rounded-full shadow-lg transition-colors" data-product_id="<?php echo $s_p['product_id'];?>" data-quantity="1" data-type="<?php echo $s_p['price_type'];?>">
														<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus h-6 w-6"><path d="M5 12h14"></path><path d="M12 5v14"></path></svg>
													</button>
<?php };?>
												</div>
												<div class="p-2">
													<h4 class="text-xs font-semibold text-gray-900 line-clamp-1"><?php echo $s_p['name'];?></h4>
													<p class="text-xs text-gray-600"><?php echo $s_p['category_name'];?></p>
													<div class="mt-2 flex flex-col gap-2">
														<div class="flex flex-col gap-1 closest_price">
															<div class="b_select_style">
																<button type="button" role="combobox" aria-controls="radix-:r23:" aria-expanded="false" aria-autocomplete="none" dir="ltr" data-state="closed" class="flex items-center justify-between rounded-md border border-input bg-white px-3 py-2 ring-offset-background placeholder:text-muted-foreground focus:outline-none  focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1 w-24 h-6 text-xs">
																	<span class="to_type_price"><?php echo $s_p['price_type'];?></span>
																	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50"><path d="m6 9 6 6 6-6"></path></svg>
																</button>
																
																<div class="b_dropdown">
																	<?php if(!empty($s_p['unit_price'])){ ?>
																		<label><input type="radio" name="s_select_type_price<?php echo $s_p['product_id'];?>" value="unit" data-type="Unit Price" data-price="<?php echo $s_p['unit_price'];?>" <?php if($s_p['price_type'] == 'unit'){ echo 'checked="checked" ';};?>/><span></span><div>Unit Price</div></label>
																	<?php };?>
																	<?php if(!empty($s_p['case_price'])){ ?>
																		<label><input type="radio" name="s_select_type_price<?php echo $s_p['product_id'];?>" value="case" data-type="Case Price" data-price="<?php echo $s_p['case_price'];?>" <?php if($s_p['price_type'] == 'case'){ echo 'checked="checked" ';};?>/><span></span><div>Case Price</div></label>
																	<?php };?>
																</div>
															</div>
															<span class="text-xs font-bold text-[#022785]">$<span class="to_val_price"><?php echo $s_p['price'];?></span></span>
														</div>
														<a href="<?php echo $s_p['href'];?>" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md font-medium ring-offset-background transition-colors focus-visible:outline-none  focus-visible:ring-ring focus-visible:ring-offset-2 disabled: disabled:opacity-50 [&amp;_svg]: [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 text-primary-foreground px-4 bg-[#022785] hover:bg-[#022785]/90 text-xs py-0.5 h-6">
Details</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								<?php };?>
							
							</div>
						</div>
						<div class="absolute inset-y-0 left-0 right-0 flex items-center justify-center gap-4 ">
							<div class="pointer-events-auto">
								<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled: disabled:opacity-50 [&amp;_svg]: [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:text-accent-foreground absolute -left-12 top-1/2 -translate-y-1/2 h-12 w-12 bg-no-repeat bg-center hover:bg-gray-100/50 undefined swiper-button-prev" style="background-image: url('/image/arrows-2x.png'); background-size: 200%; background-position: 0% 50%;"><span class="sr-only">Previous slide</span>
								</button>
							</div>
							<div class="pointer-events-auto">
								<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled: disabled:opacity-50 [&amp;_svg]: [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:text-accent-foreground absolute -right-12 top-1/2 -translate-y-1/2 h-12 w-12 bg-no-repeat bg-center hover:bg-gray-100/50 undefined swiper-button-next" style="background-image: url('/image/arrows-2x.png'); background-size: 200%; background-position: 100% 50%;"><span class="sr-only">Next slide</span></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="mt-16">
		<div class="border rounded-lg p-6">
			<h3 data-component-path="src/components/product/ProductCarousel.tsx" data-component-name="h3" data-component-line="45" data-component-file="ProductCarousel.tsx" data-component-content="%7B%22className%22%3A%22text-2xl%20font-semibold%20mb-6%22%7D" class="text-2xl font-semibold mb-6">You might also like</h3>
			
			<div class="relative" id="carousel_like">
				<div class="relative px-12 w-full carousel swiper-viewport">
					<div class="swiper-container">
						<div class="swiper-wrapper">
						
						<?php foreach($like_products as $l_p){ ?>
							<div class="min-w-0 shrink-0 grow-0 pl-4 basis-1/4 swiper-slide">
								<div class="p-2">
									<div class="bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow max-w-[160px]">
										<div class="relative">
											<img src="<?php echo $l_p['thumb'];?>" alt="<?php echo $l_p['name'];?>" class="w-full h-24 object-cover">
<?php if(empty($l_p['case_price']) or empty($l_p['unit_price'])){ ?>
	<button class="add_to_cart absolute top-2 right-2 bg-white hover:bg-gray-100 text-gray-800 p-1 rounded-full shadow-lg transition-colors" data-product_id="<?php echo $l_p['product_id'];?>" data-quantity="1" data-type="<?php echo $l_p['price_type'];?>">
												<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus h-6 w-6">
													<path d="M5 12h14"></path><path d="M12 5v14"></path>
												</svg>
											</button>
<?php };?>
										</div>
										
										<div class="p-2">
											<h4 class="text-xs font-semibold text-gray-900 line-clamp-1"><?php echo $l_p['name'];?></h4>
											<p class="text-xs text-gray-600"><?php echo $l_p['category_name'];?></p>
											<div class="mt-2 flex flex-col gap-2">
											
														<div class="flex flex-col gap-1 closest_price">
															<div class="b_select_style">
																<button type="button" role="combobox" aria-controls="radix-:r23:" aria-expanded="false" aria-autocomplete="none" dir="ltr" data-state="closed" class="flex items-center justify-between rounded-md border border-input bg-white px-3 py-2 ring-offset-background placeholder:text-muted-foreground focus:outline-none  focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1 w-24 h-6 text-xs">
																	<span class="to_type_price"><?php echo $l_p['price_type'];?></span>
																	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50"><path d="m6 9 6 6 6-6"></path></svg>
																</button>
																<div class="b_dropdown">
																	<?php if(!empty($l_p['unit_price'])){ ?>
																		<label><input type="radio" name="l_select_type_price<?php echo $l_p['product_id'];?>" value="unit" data-type="Unit Price" data-price="<?php echo $l_p['unit_price'];?>" <?php if($l_p['price_type'] == 'unit'){ echo 'checked="checked" ';};?>/><span></span><div>Unit Price</div></label>
																	<?php };?>
																	<?php if(!empty($l_p['case_price'])){ ?>
																		<label><input type="radio" name="l_select_type_price<?php echo $l_p['product_id'];?>" value="case" data-type="Case Price" data-price="<?php echo $l_p['case_price'];?>" <?php if($l_p['price_type'] == 'case'){ echo 'checked="checked" ';};?>/><span></span><div>Case Price</div></label>
																	<?php };?>
																</div>
															</div>
															<span class="text-xs font-bold text-[#022785]">$<span class="to_val_price"><?php echo $l_p['price'];?></span></span>
														</div>
											
						
												
												<a href="<?php echo $l_p['href'];?>" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md font-medium ring-offset-background transition-colors focus-visible:outline-none  focus-visible:ring-ring focus-visible:ring-offset-2 disabled: disabled:opacity-50 [&amp;_svg]: [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 text-primary-foreground px-4 bg-[#022785] hover:bg-[#022785]/90 text-xs py-0.5 h-6">Details</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						<?php };?>
						</div>
					</div>
					
					<div class="absolute inset-y-0 left-0 right-0 flex items-center justify-center gap-4 ">
						<div class="pointer-events-auto">
							<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none  focus-visible:ring-ring focus-visible:ring-offset-2 disabled: disabled:opacity-50 [&amp;_svg]: [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:text-accent-foreground absolute -left-12 top-1/2 -translate-y-1/2 h-12 w-12 bg-no-repeat bg-center hover:bg-gray-100/50 undefined swiper-button-prev" style="background-image: url('/image/arrows-2x.png'); background-size: 200%; background-position: 0% 50%;"><span class="sr-only">Previous slide</span>
							</button>
						</div>
						<div class="pointer-events-auto">
							<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none  focus-visible:ring-ring focus-visible:ring-offset-2 disabled: disabled:opacity-50 [&amp;_svg]: [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:text-accent-foreground absolute -right-12 top-1/2 -translate-y-1/2 h-12 w-12 bg-no-repeat bg-center hover:bg-gray-100/50 undefined swiper-button-next" style="background-image: url('/image/arrows-2x.png'); background-size: 200%; background-position: 100% 50%;"><span class="sr-only">Next slide</span></button>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript"><!--
$(document).ready(function() {
	$('.b_select_style > button').on("click",function(){
		$(this).closest('.b_select_style').find('.b_dropdown').toggleClass('open');
	});
	$('.b_select_style input[type=radio]').on("change",function(){
		pr = $(this).attr('data-price');
		$(this).closest('.closest_price').find('.to_val_price').html(pr);
		prt = $(this).attr('data-type');
		$(this).closest('.b_select_style').find('.to_type_price').html(prt);
		$(this).closest('.b_dropdown').removeClass('open');
		if($(this).closest('.product_info')){
			$(this).closest('.product_info').find('.add_to_cart').attr('data-type',$(this).val());
		}
	});
	$(document).on("click",function(e){
		var smko = $(".b_select_style");
		if ( !smko.is(e.target) && smko.has(e.target).length === 0 && smko.find('.b_dropdown.open') ) {
			$('.b_select_style .b_dropdown.open').removeClass('open');
		}
	});
	$('.q_block .minus').on("click",function(){
		q = $(this).next().val();
		q = parseInt(q);
		if(q>1){
			$(this).next().val(q-1);
			$('.add_to_cart').attr("data-quantity",q-1);
		}
	});
	$('.q_block .plus').on("click",function(){
		q = $(this).prev().val();
		q = parseInt(q);
		$(this).prev().val(q+1);
		$('.add_to_cart').attr("data-quantity",q+1);
	});

	$('#carousel_similar .swiper-container').swiper({
		mode: 'horizontal',
		slidesPerView: 3,
		pagination: '.swiper-pagination',
		paginationClickable: true,
		nextButton: '#carousel_similar .swiper-button-next',
		prevButton: '#carousel_similar .swiper-button-prev',
		autoplay: 2500,
		loop: false,
		breakpoints: {
			240: {
				slidesPerView: 1,
			},
			480: {
				slidesPerView: 1,
			},
			767: {
				slidesPerView: 2,
				spaceBetween: 0
			},
			1024: {
				slidesPerView: 3,
				spaceBetween: 0
			}
		}
	});
	$('#carousel_like .swiper-container').swiper({
		mode: 'horizontal',
		slidesPerView: 8,
		pagination: '.swiper-pagination',
		paginationClickable: true,
		nextButton: '#carousel_like .swiper-button-next',
		prevButton: '#carousel_like .swiper-button-prev',
		autoplay: 2500,
		loop: false,
		breakpoints: {
			240: {
				slidesPerView: 1,
			},
			480: {
				slidesPerView: 1,
			},
			767: {
				slidesPerView: 2,
				spaceBetween: 0
			},
			1024: {
				slidesPerView: 4,
				spaceBetween: 0
			}
		}
	});
});

//--></script>
<?php echo $footer; ?>