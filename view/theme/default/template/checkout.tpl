<?php echo $header; ?>

<div class="container mx-auto px-4 py-8 mt-16 flex-grow">
	<h1 class="text-2xl font-bold mb-8">Checkout</h1>
	
	<form class="grid grid-cols-1 lg:grid-cols-3 gap-8" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
		<div class="lg:col-span-2 space-y-6">
			<div class="bg-white p-6 rounded-lg shadow-sm">
				<h2  class="text-lg font-semibold mb-4">Delivery</h2>
				
				<div class="space-y-4">
					<div>
						<label class="block text-sm font-medium mb-2">Date</label>
						
						<div class="relative" id="date_shipping">
							<div class="relative px-12 w-full max-w-sm mx-auto carousel swiper-viewport">
								<div class="swiper-container">
									<div class="flex -ml-1 swiper-wrapper">
										<?php $open_time = false;
										$today = date('Y-m-d');
										//	$date_month = date('Y-m-d', strtotime('+1 month', strtotime($today)));
										$date_month = date('Y-m-d', strtotime('+1 day', strtotime($today)));
										?>
										<?php for($i=0;$i<7;$i++){ ?>
											<?php $step = strtotime('+' . $i . ' day', strtotime($date_month));?>
											<div class="min-w-0 shrink-0 grow-0 pl-1 basis-1/5 swiper-slide">
												<input type="radio" name="date_shipping" value="<?php echo date('Y-m-d',$step);?>" <?php if( ($i==0 and empty($date_shipping)) or ($date_shipping== date('Y-m-d',$step))){ echo 'checked';$open_time = true;};?> id="date-step<?php echo $i;?>"/>
												<label class="items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2   [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground w-full h-full flex flex-col p-2 min-h-[80px]" for="date-step<?php echo $i;?>">
													<span class="text-sm font-medium"><?php echo date('D',$step);?></span>
													<span class="text-lg"><?php echo date('d',$step);?></span>
													<span class="text-sm"><?php echo date('M',$step);?></span>
												</label>
											</div>
										<?php };?>
									</div>
								</div>
								
								<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:text-accent-foreground absolute -left-12 top-1/2 -translate-y-1/2 h-12 w-12 bg-no-repeat bg-center hover:bg-gray-100/50 swiper-button-prev" style="background-image: url('/image/arrows-2x.png'); background-size: 200%; background-position: 0% 50%;">
									<span class="sr-only">Previous slide</span>
								</button>
								
								<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:text-accent-foreground absolute -right-12 top-1/2 -translate-y-1/2 h-12 w-12 bg-no-repeat bg-center hover:bg-gray-100/50 swiper-button-next" style="background-image: url('/image/arrows-2x.png'); background-size: 200%; background-position: 100% 50%;">
									<span class="sr-only">Next slide</span>
								</button>
							</div>
						</div>
						<?php if(!empty($error_date_shipping)){ ?>
							<div class="error_div"><?php echo $error_date_shipping;?></div>
						<?php };?>
					</div>
					
					<div class="view_time <?php if(empty($error_date_shipping) and empty($open_time)){ ?>hide<?php };?>">
						<label class="block text-sm font-medium mb-2">Time Window</label>
						<div class="grid grid-cols-1 md:grid-cols-3 gap-4">
							<input type="radio" name="time_shipping" value="9-12" id="time9-12" <?php if(!empty($time_shipping) and $time_shipping == '9-12'){ ?>checked<?php };?> />
							<label for="time9-12" class="gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground w-full h-full flex items-center justify-center p-4">9:00 AM - 12:00 PM
								
							</label>
							
							<input type="radio" name="time_shipping" value="12-15" id="time12-15" <?php if(!empty($time_shipping) and $time_shipping == '12-15'){ ?>checked<?php };?> />
							<label for="time12-15" class="gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground w-full h-full flex items-center justify-center p-4">12:00 PM - 3:00 PM
							</label>
							
							<input type="radio" name="time_shipping" value="15-18" id="time15-18" <?php if(!empty($time_shipping) and $time_shipping == '15-18'){ ?>checked<?php };?> />
							<label for="time15-18" class="gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground w-full h-full flex items-center justify-center p-4">3:00 PM - 6:00 PM
							</label>
							
						</div>
						<?php if(!empty($error_time_shipping)){ ?>
							<div class="error_div"><?php echo $error_time_shipping;?></div>
						<?php };?>
					</div>

				</div>
			</div>
			
			<div class="bg-white p-6 rounded-lg shadow-sm">
				<div class="flex justify-between items-center mb-4">
					<h2 class="text-lg font-semibold">Items in the cart (<?php echo $item_quantity;?>)</h2>
					<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2   [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2" type="button" id="open_modal_checkout_cart">View Items
					</button>
				</div>
			</div>
			
			<div class="bg-white p-6 rounded-lg shadow-sm">
				<h2 class="text-lg font-semibold mb-4">Order Requirements</h2>
				<div class="space-y-4">
					<label class="flex items-center gap-2">
						<input type="checkbox" name="unavailable" value="1" class="rounded">
						<span>Allow substitutions for unavailable items</span>
					</label>
					<label class="flex items-center gap-2">
						<input type="checkbox" name="collector" value="1" class="rounded">
						<span>Call from collector if needed</span>
					</label>
				</div>
			</div>
			
			<div class="bg-white p-6 rounded-lg shadow-sm">
				<h2 class="text-lg font-semibold mb-4">Destination</h2>
				<div class="relative kitchen_select_block">
					<button type="button" role="combobox" aria-controls="radix-:rc:" aria-expanded="false" aria-autocomplete="none" dir="ltr" data-state="closed" data-placeholder="" class="flex h-10 w-full items-center justify-between rounded-md border border-input bg-white px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2  [&amp;>span]:line-clamp-1 <?php /*bar_kitchens*/	?>">
						<span><?php if(empty($my_kitchens_select)){ ?>Select kitchen<?php 
							}else{ echo '<span class="font-medium">' . $my_kitchens_select['name'] . '</span><span class="text-gray-500">' . $my_kitchens_select['address'] . '</span>'; };?></span>
						<?php /*<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50"><path d="m6 9 6 6 6-6"></path>
						</svg>*/	?>
					</button>
<?php if(isset($my_kitchens_select['kitchen_id'])){ ?>
	<input type="radio" name="kitchen_checkout" value="<?php echo $my_kitchens_select['kitchen_id'];?>" checked class="hidden"/>
<?php };?>
<?php /*
					<div class="dropdown sel_menu_kitchens">
						<?php if(!empty($my_kitchens)){ ?>
							<?php foreach($my_kitchens as $kitchen_id=>$kit){ ?>
								<label><input type="radio" name="kitchen_checkout" value="<?php echo $kit['kitchen_id'];?>" <?php if(!empty($my_kitchens_select) and $my_kitchens_select['kitchen_id'] == $kit['kitchen_id']){ echo 'checked';};?> class="kitchensel<?php echo $kit['kitchen_id'];?>"/><span></span><div class="name_address"><?php echo $kit['name'];?><div class="address"><?php echo $kit['address'];?></div></div></label>
							<?php };?>
						<?php };?>
						<label><span></span><a href="<?php echo $link_kitchen;?>" class="add_kitchens">+ Add new kitchen</a></label>
					</div>
*/	?>
				</div>
				<?php if(!empty($error_kitchen_checkout) and !isset($my_kitchens_select['kitchen_id'])){ ?>
					<div class="error_div"><?php echo $error_kitchen_checkout;?></div>
				<?php };?>
			</div>
		</div>
		
		<div class="lg:col-span-1">
			<div class="bg-white p-6 rounded-lg shadow-sm sticky top-24">
				<h2 class="text-lg font-semibold mb-4">Order Summary</h2>
				
				<div class="space-y-4" id="checkout_total_order">
					<?php foreach($totals as $tot){ ?>
						<div class="flex justify-between">
							<span><?php echo $tot['title'];?></span>
							<span>$<?php echo $tot['value'];?></span>
						</div>
					<?php };?>

					<div class="bg-white p-6 rounded-lg shadow-sm mb-12" id="payment_method">
						<?php echo $payment_method;?>
						<?php if(!empty($error_payment_method)){ ?>
							<div class="error_div"><?php echo $error_payment_method;?></div>
						<?php };?>
					</div>
					
					<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2    [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 text-primary-foreground h-10 px-4 py-2 w-full bg-green-500 hover:bg-green-600" id="add_order">Place Order</button>
				</div>
			</div>
		</div>
	</form>
</div>

<?php /*	modal products	*/	?>
<div id="modal_checkout_cart" class="hide fixed left-[50%] top-[50%] z-50 grid w-full translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[state=closed]:slide-out-to-left-1/2 data-[state=closed]:slide-out-to-top-[48%] data-[state=open]:slide-in-from-left-1/2 data-[state=open]:slide-in-from-top-[48%] sm:rounded-lg max-w-3xl">
	<div class="flex flex-col space-y-1.5 text-center sm:text-left">
		<h2 id="radix-:ra:" class="text-lg font-semibold leading-none tracking-tight">Your Easy Cart</h2>
		<div class="relative w-full mt-4">
			<input type="text" class="flex h-10 rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 md:text-sm w-full" placeholder="Add product..." value="" id="search_suggest">
			<div class="absolute z-50 w-full mt-1 bg-white border border-gray-200 rounded-md shadow-lg max-h-60 overflow-auto hide" id="result_search_suggest"></div>
		</div>
	</div>
	
	<div class="flex flex-col h-[80vh]">
		<div dir="ltr" class="relative overflow-hidden flex-grow pr-4" style="position: relative; --radix-scroll-area-corner-width:0px; --radix-scroll-area-corner-height:0px;">

		<div data-radix-scroll-area-viewport="" class="h-full w-full rounded-[inherit]" style="overflow: hidden scroll;">
			<div style="min-width: 100%; display: table;">
				<div class="space-y-4">

					<?php foreach($products as $product){ ?>
						<div class="flex items-center justify-between p-4 bg-gray-50 rounded-lg">
							<div class="flex items-center gap-4">
								<img src="<?php echo $product['thumb'];?>" alt="<?php echo $product['name'];?>" class="w-20 h-20 object-cover rounded">
								<div>
									<h3 class="font-medium"><?php echo $product['name'];?></h3>
									<p class="text-sm text-gray-500">$<?php echo $product['price'];?></p>
								</div>
							</div>
							
							<div class="flex items-center gap-4">
								<div class="flex items-center gap-2 q_block_c">
									<button  class="p-1 hover:bg-gray-100 rounded minus">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-minus h-4 w-4">
											<path d="M5 12h14"></path></svg>
									</button>
									<input type="text" name="" value="<?php echo $product['quantity'];?>" class="q_replace w-8 text-center" data-product_id="<?php echo $product['product_id'];?>" data-quantity="<?php echo $product['quantity'];?>" data-type="<?php echo $product['type'];?>" />
									<button class="p-1 hover:bg-gray-100 rounded plus">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus h-4 w-4"><path d="M5 12h14"></path><path d="M12 5v14"></path></svg>
									</button>
								</div>
								
								<button data-cart_id="<?php echo $product['cart_id'];?>" data-product_id="<?php echo $product['product_id'];?>" data-type="<?php echo $product['type'];?>" class="p-2 text-red-500 hover:bg-red-50 rounded-full delete del_from_cart"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash2 h-5 w-5"><path d="M3 6h18"></path><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path><line x1="10" x2="10" y1="11" y2="17"></line><line x1="14" x2="14" y1="11" y2="17"></line></svg>
								</button>
							</div>
						</div>
					<?php };?>
				</div>
			</div>
		</div>
	</div>
	
		<div class="mt-4 flex justify-end gap-2 pt-4 border-t">
			<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 text-primary-foreground h-10 px-4 py-2 bg-green-500 hover:bg-green-600 close">Ok</button>
		</div>
	
	</div>
	
	<button type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2  data-[state=open]:bg-accent data-[state=open]:text-muted-foreground close">
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg>
		<span class="sr-only">Close</span>
	</button>
</div>
<style>[data-radix-scroll-area-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-scroll-area-viewport]::-webkit-scrollbar{display:none}
</style>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.mobile_b6 .mobile_b8').remove();
	$('#search_suggest').live("keyup",function(){
		if($(this).val().length > 2){
			$.ajax({
				url: 'index.php?route=shop/search&search=' + encodeURIComponent($(this).val()),
				dataType: 'json',
				beforeSend: function() {
				},
				complete: function() {
				},
				success: function(json) {
					html = '';
					if(json['products']){
						
						for(k in json['products']){
							html+= '<div class="p-2 hover:bg-gray-100 flex items-center justify-between gap-2 border-b border-gray-100 last:border-b-0"><a href="' + json['products'][k]['href'] +'" class="flex items-center gap-2 flex-1 cursor-pointer">';
							html+= '<img src="' + json['products'][k]['thumb'] +'" alt="' + json['products'][k]['name'] +'" class="w-8 h-8 object-cover rounded">';
							html+= '<div><p class="text-sm font-medium">' + json['products'][k]['name'] +'</p>';
							html+= '<div class="flex gap-2 text-xs text-gray-500">';
							if(json['products'][k]['unit_price']!==0){
							html+= '<span>Unit: $' + json['products'][k]['unit_price'] +'</span>';
							}
							if(json['products'][k]['case_price']!==0){
							html+= '<span>Case: $' + json['products'][k]['case_price'] +'</span>';
							}
							html+= '</div></div></a>';
html_hide= '<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2   [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3 ml-2 add_to_cart" data-quantity="1" data-type="' + json['products'][k]['type'] + '" data-product_id="' + json['products'][k]['product_id'] +'">Add to Cart</button>';
							html+= '</div>';
						}
						$('#result_search_suggest').removeClass('hide');
					}else{
						$('#result_search_suggest').addClass('hide');
					}
					$('#result_search_suggest').html(html);
				}
			});
		}
	});
	$('#open_modal_checkout_cart').live("click",function(){
		$('#modal_checkout_cart').removeClass('hide');
		if($('.overlay_cc').length){
			$('.overlay_cc').addClass('visible');
		}else{
			$('body').append('<div class="fixed inset-0 z-50 bg-black/80 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 overlay_cc visible"></div>');
		}
	});
	
	$('#modal_checkout_cart .close').live("click",function(){
		$('.overlay_cc').removeClass('visible');
		$('#modal_checkout_cart').addClass('hide');
	});
	$(document).live("click",function(e){
		var rmb = $("#modal_checkout_cart");
		var rmbb = $("#open_modal_checkout_cart");
		if ( !rmbb.is(e.target) && !rmb.is(e.target) && rmb.has(e.target).length === 0 ) {
			$('.overlay_cc').removeClass('visible');
			$('#modal_checkout_cart').addClass('hide');
		}
	});

	$('#date_shipping .swiper-container').swiper({
		mode: 'horizontal',
		slidesPerView: 5,
		pagination: '.swiper-pagination',
		paginationClickable: true,
		nextButton: '#date_shipping .swiper-button-next',
		prevButton: '#date_shipping .swiper-button-prev',
		autoplay: false,
		loop: false
	});
	
	$('input[name=date_shipping]').live("change",function(){
		$('.view_time').removeClass('hide');
	});
	
	$('.payment_m_button').live("click",function(){
		$(this).closest('.payment_m_select_block').find('.sel_payment_m').toggleClass('open');
	});
	$(document).on("click",function(e){
		var smko = $(".payment_m_select_block");
		if ( !smko.is(e.target) && smko.has(e.target).length === 0 && smko.find('.sel_payment_m.open') ) {
			$('.sel_payment_m.open').removeClass('open');
		}
	});
	$('#add_order').live("click",function(){
		$.ajax({
			url: 'index.php?route=order/add',
			type: 'post',
			data: 'product_id=' + $(this).attr('data-product_id') + '&quantity=' + $(this).attr('data-quantity') + '&type=' + $(this).attr('data-type'),
			dataType: 'json',
			success: function(json) {
				if (json['success']) {

				}	
			}
		});
		
	});
});
//--></script>
<?php echo $footer;