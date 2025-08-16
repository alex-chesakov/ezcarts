<?php echo $header; ?>
<!-- order -->
<div class="container mx-auto px-4 py-8 mt-16 flex-grow">
	<div class="flex items-center justify-between mb-6">
		<div class="flex items-center gap-3">
			<h1 class="text-2xl font-bold">Order #ORD-<?php echo $order_id;?></h1>
			
			<div class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent hover:bg-primary/80 bg-purple-500 text-white order_status<?php echo $order_status_id;?>"><?php echo $order_status;?></div>
		</div>
		
		<a href="<?php echo $go_orderhistory;?>" class="justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 flex items-center gap-2">
			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left h-4 w-4"><path d="m12 19-7-7 7-7"></path><path d="M19 12H5"></path></svg>
Back to Order History
		</a>
	</div>
	
	<div class="grid grid-cols-1 lg:grid-cols-3 gap-8" id="reload">
		<div class="lg:col-span-2">
			<div class="bg-white p-6 rounded-lg shadow-sm">
				<h2 class="text-lg font-semibold mb-4">Items (<?php echo count($this->data['products']);?>)</h2>
				<?php if($order_status_id < 1){ ?>
					<div class="relative mb-4" id="wrap_search_suggest">
						<input type="text" class="flex h-10 rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm w-full" placeholder="Add product..." value="" id="search_suggest">
						<div class="absolute z-50 w-full mt-1 bg-white border border-gray-200 rounded-md shadow-lg max-h-60 overflow-auto hide" id="result_search_suggest"></div>
					</div>
				<?php };?>
				<div class="space-y-4">

					<?php foreach($products as $product){ ?>
						<div class="flex items-center justify-between p-4 bg-gray-50 rounded-lg item_order_product order_product_<?php echo $product['order_product_id'];?>">
							<div class="flex items-center gap-4 flex-grow">
								<img src="<?php echo $product['thumb'];?>" alt="<?php echo $product['name'];?>" class="w-20 h-20 object-cover rounded">
								<div class="flex-grow">
									<div class="flex items-center justify-between">
										<div class="flex items-center gap-2">
											<h3 class="font-medium"><?php echo $product['name'];?></h3>
										</div>
									</div>
									
									<p class="text-sm text-gray-500 mb-2">ID: <?php echo $product['upc'];?></p>
									
									<div>
										<div class="flex items-center gap-4">
											<div class="flex items-center gap-2">
												<span class="text-sm">Price:</span>
												<span class="text-base">$<?php echo $product['price'];?>/<?php echo $product['type'];?></span>
											</div>
										</div>
										
										<?php if($order_status_id < 1){ ?>
											<div class="flex items-center gap-4">
												<div class="flex items-center gap-2">
													<span class="text-sm">Booked Qty:</span>
													<div class="flex items-center gap-2 q_block_o">
														<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-8 w-8 minus">
															<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-minus h-4 w-4"><path d="M5 12h14"></path></svg>
														</button>
<input type="text" name="" value="<?php echo $product['quantity'];?>" class="w-12 text-center q_replace_o" data-order_product_id="<?php echo $product['order_product_id'];?>"/>
														<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-8 w-8 plus">
															<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus h-4 w-4"><path d="M5 12h14"></path><path d="M12 5v14"></path></svg>
														</button>
													</div>
													<?php if(!empty($product['case_price']) and !empty($product['unit_price'])){ ?>
														<div class="b_select_style">
															<button type="button" class="flex items-center justify-between rounded-md border border-input bg-white px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1 w-[100px] h-8">
																<span class="to_type_html"><?php echo $product['type'];?></span>
																<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50"><path d="m6 9 6 6 6-6"></path></svg>
															</button>
															<div class="b_dropdown">
																<?php if(!empty($product['unit_price'])){ ?>
																	<label><input type="radio" name="select_type_price[<?php echo $product['order_product_id'];?>]" value="unit" <?php if($product['type']=='unit'){ ?>checked<?php };?> data-order_product_id="<?php echo $product['order_product_id'];?>" data-type="Unit Price"><span></span><div>Unit Price</div></label>
																<?php };?>
																<?php if(!empty($product['case_price'])){ ?>
																	<label><input type="radio" name="select_type_price[<?php echo $product['order_product_id'];?>]" value="case" <?php if($product['type']=='case'){ ?>checked<?php };?> data-order_product_id="<?php echo $product['order_product_id'];?>" data-type="Case Price"><span></span><div>Case Price</div></label>
																<?php };?>
															</div>
														</div>
													<?php };?>
												</div>
											</div>
										<?php };?>
									</div>
								</div>
							</div>
							
							<div class="flex flex-col items-end">
								<div class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent hover:bg-primary/80 bg-gray-500 text-white collected_status<?php echo $product['collect_status_id'];?>"><?php echo $product['collect_status'];?>
								</div>
<?php if(empty($order_status_id) or in_array($order_status_id,array(0,1))){ ?>
								<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent h-10 w-10 text-red-500 hover:text-red-600 mt-2 delete_product" data-order_product_id="<?php echo $product['order_product_id'];?>">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash2 h-5 w-5"><path d="M3 6h18"></path><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path><line x1="10" x2="10" y1="11" y2="17"></line><line x1="14" x2="14" y1="11" y2="17"></line></svg>
								</button>
<?php };?>
							</div>
						</div>
					<?php };?>

				</div>
			</div>
<?php if(empty($order_status_id) or in_array($order_status_id,array(0))){ ?>
			<div class="mt-6 flex justify-end">
				<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-destructive text-destructive-foreground hover:bg-destructive/90 h-10 px-4 py-2"  data-order_id="<?php echo $order_id;?>" id="cancel_order">Cancel Order</button>
			</div>
<?php };?>
		</div>
		
		<div class="lg:col-span-1 space-y-6">
			<div class="bg-white p-6 rounded-lg shadow-sm">
				<h2 class="text-lg font-semibold mb-4">Order Summary</h2>
				<div class="space-y-4">

					<?php foreach($totals as $tot){ ?>
						<div class="flex justify-between items-center">
							<span><?php echo $tot['title'];?></span>
							<span>$<?php echo $tot['value'];?></span>
						</div>
					<?php };?>
					
				</div>
			</div>
			
			<div class="bg-white p-6 rounded-lg shadow-sm">
				<h3 class="text-lg font-semibold mb-4">Order Details</h3>
				
				<div class="space-y-6">
					<div>
						<h4 class="font-medium mb-2">Delivery from:</h4>
						<div class="space-y-2">
							<?php foreach($delivery_location as $d_l){ ?>
								<div class="text-sm">
									<span class="font-medium"><?php echo $d_l;?></span>
								</div>
							<?php };?>
						</div>
					</div>
					
					<div>
						<h4 class="font-medium mb-2">Delivery to:</h4>
						<div class="text-sm">
							<span class="font-medium"><?php echo $delivery_kitchen_name;?></span> - <?php echo $delivery_kitchen_address;?>
						</div>
					</div>
					
					<div class="grid grid-cols-2 gap-4">
						<div>
							<h4 class="font-medium mb-2">Delivery date:</h4>
							<div class="text-sm"><?php echo $date_shipping;?></div>
						</div>
						<div>
							<h4 class="font-medium mb-2">Delivery window:</h4>
							<div class="text-sm"><?php echo $time_shipping;?></div>
						</div>
					</div>
					
					<div class="grid grid-cols-2 gap-4">
						<div>
							<h4 class="font-medium mb-2">Collector:</h4>
							<div class="text-sm"><?php if(empty($collector_name)){ ?>TBD<?php }else{ echo $collector_name;}?></div>
						</div>
						<div>
							<h4 class="font-medium mb-2">Collector's phone:</h4>
							<div class="text-sm"><?php if(empty($collector_phone)){ ?>TBD<?php }else{ echo $collector_phone;};?></div>
						</div>
					</div>
					<?php if(!empty($proofs)){ ?>
						<div class="proofs">
							<h4 class="font-medium mb-2">Photo proof of collection:</h4>
							<div class="grid grid-cols-2 gap-4">
								<?php foreach($proofs as $i=>$proof){ ?>
									<button type="button" data-image="<?php echo $proof['file'];?>" class="popupimage">
										<div class="cursor-pointer hover:opacity-80 transition-opacity">
											<img src="<?php echo $proof['resize'];?>" alt="Proof of collection <?php echo $i +1;?>" class="w-full h-32 object-cover rounded-lg">
										</div>
									</button>
								<?php };?>
							</div>
						</div>
					<?php };?>
				</div>
			</div>
		</div>
	</div>
</div>

<?php if($order_status_id < 1){ ?>
<script type="text/javascript"><!--
$(document).ready(function() {
	
	$('.b_select_style > button').live("click",function(){
		$(this).closest('.b_select_style').find('.b_dropdown').toggleClass('open');
	});
	$('.b_select_style input[type=radio]').live("change",function(){
		var obj = $(this).closest('.item_order_product');
		order_product_id = $(this).attr('data-order_product_id');
		$(this).closest('.b_select_style').find('.to_type_html').html($(this).attr('data-type'));
		$(this).closest('.b_dropdown').removeClass('open');

		$.ajax({
			url: 'index.php?route=order/othertype',
			type: 'post',
			data: 'order_product_id=' + $(this).attr('data-order_product_id'),
			dataType: 'json',
			success: function(json) {
				if (json['success']) {
					$('#reload').load('/index.php?route=order&ord=<?php echo $order_id;?> #reload > *');
					//	reload
				}	
			}
		});
	});
	$(document).on("click",function(e){
		var smko = $(".b_select_style");
		if ( !smko.is(e.target) && smko.has(e.target).length === 0 && smko.find('.b_dropdown.open') ) {
			$('.b_select_style .b_dropdown.open').removeClass('open');
		}
	});
	
	$('.q_block_o .minus').live("click",function(){
		q = $(this).next().val();
		q = parseInt(q);
		if(q>1){
			$(this).next().val(q-1);
			$(this).next().attr("data-quantity",q-1);
			$(this).next().trigger('change');
		}
	});
	$('.q_block_o .plus').live("click",function(){
		q = $(this).prev().val();
		q = parseInt(q);
		$(this).prev().val(q+1);
		$(this).prev().attr("data-quantity",q+1);
		$(this).prev().trigger('change');
	});
	$('.q_replace_o').live("change",function(){
		var qr = $(this);
	
		$.ajax({
			url: 'index.php?route=order/otherq',
			type: 'post',
			data: 'order_product_id=' + $(qr).attr('data-order_product_id') + '&quantity=' + $(qr).val(),
			dataType: 'json',
			success: function(json) {
				if (json['success']) {
					$('#reload').load('/index.php?route=order&ord=<?php echo $order_id;?> #reload > *');
					//	reload
				}	
			}
		});
	});
	
	$('.delete_product[data-order_product_id]').live("click",function(){
		clearTimeout(notif_order);
		$('#notif').remove();
		var qr = $(this);

		$.ajax({
			url: 'index.php?route=order/otherdel',
			type: 'post',
			data: 'order_product_id=' + $(qr).attr('data-order_product_id') ,
			dataType: 'json',
			success: function(json) {
				if (json['success']) {
					$('#reload').load('/index.php?route=order&ord=<?php echo $order_id;?> #reload > *');
					$('body').append('<section aria-label="Notifications alt+T" tabindex="-1" id="notif"><ol dir="ltr" tabindex="-1" class="toaster group" style="--front-toast-height:53.5px; --offset:32px; --width:356px; --gap:14px;"><li class="flex group toast group-[.toaster]:bg-background group-[.toaster]:text-foreground group-[.toaster]:border-border group-[.toaster]:shadow-lg"><div class=""><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" height="20" width="20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clip-rule="evenodd"></path></svg></div><div class=""><div class="">' + json['success'] + '</div></div></li></ol></section>');
					notif_order = setTimeout(function(){
						$('#notif').remove();
					},3000);
				}	
			}
		});
	});
	
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
							html+= '<span>Unit: $' + json['products'][k]['unit_price'] +'</span>';
							html+= '<span>Case: $' + json['products'][k]['case_price'] +'</span>';
							html+= '</div></div></a>';
							html+= '<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3 ml-2 add_to_order" data-quantity="1" data-type="' + json['products'][k]['type'] + '" data-product_id="' + json['products'][k]['product_id'] +'">Add</button>';
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
	$(document).on("click",function(e){
		var smko = $("#wrap_search_suggest");
		if ( !smko.is(e.target) && smko.has(e.target).length === 0 && smko.find('#result_search_suggest') ) {
			$('#result_search_suggest').addClass('hide');
		}
	});

	$('#result_search_suggest .add_to_order[data-product_id]').live("click",function(){

		clearTimeout(notif_order);
		$('#notif').remove();
		var obj = $(this);
		//	data-product_id

		$.ajax({
			url: 'index.php?route=order/otheraddp',
			type: 'post',
			data: 'oproduct_id=' + $(obj).attr('data-product_id') + '&order_id=<?php echo $order_id;?>' ,
			dataType: 'json',
			success: function(json) {

				if (json['success']) {
					$('#reload').load('/index.php?route=order&ord=<?php echo $order_id;?> #reload > *');
$('body').append('<section aria-label="Notifications alt+T" tabindex="-1" id="notif"><ol dir="ltr" tabindex="-1" class="toaster group" style="--front-toast-height:53.5px; --offset:32px; --width:356px; --gap:14px;"><li class="flex group toast group-[.toaster]:bg-background group-[.toaster]:text-foreground group-[.toaster]:border-border group-[.toaster]:shadow-lg"><div class=""><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" height="20" width="20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clip-rule="evenodd"></path></svg></div><div class=""><div class="">' + json['success'] + '</div></div></li></ol></section>');
					notif_order = setTimeout(function(){
						$('#notif').remove();
					},3000);
				}	
			}
		});
	});
});
//--></script>
<?php };?>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.popupimage').live("click",function(){
		if($(this).attr('data-image')){
			html ='<div class="overlay fixed inset-0 z-50 bg-black/80 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0"></div>';
			html+= '<div id="radix-popupimage" class="fixed left-[50%] top-[50%] z-50 grid w-full translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[state=closed]:slide-out-to-left-1/2 data-[state=closed]:slide-out-to-top-[48%] data-[state=open]:slide-in-from-left-1/2 data-[state=open]:slide-in-from-top-[48%] sm:rounded-lg max-w-3xl">';
			html+= '<img src="/image/upload/' + $(this).attr('data-image') + '" alt="Proof of collection" class="w-full object-contain max-h-[80vh]"><button type="button" class="close absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 data-[state=open]:bg-accent data-[state=open]:text-muted-foreground">';
			html+= '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4" data-component-path="src/components/ui/dialog.tsx" data-component-name="X" data-component-line="46" data-component-file="dialog.tsx" data-component-content="%7B%22className%22%3A%22h-4%20w-4%22%7D"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg>';
			html+= '<span class="sr-only">Close</span></button></div>';
			$('body').append(html);
		}
	});
	$('#radix-popupimage .close').live("click",function(){
		$('.overlay').fadeOut("fast",function(){ $('.overlay').remove();});
		$('#radix-popupimage').fadeOut("fast",function(){ $('#radix-popupimage').remove();});
	});
<?php if(empty($order_status_id) or in_array($order_status_id,array(0))){ ?>
	$('#cancel_order').live("click",function(){

		$.ajax({
			url: '/index.php?route=order/cancelorder',
			type: 'post',
			data: 'order_id=' + $(this).attr('data-order_id') ,
			dataType: 'json',
			success: function(json) {

				if (json['success']) {
					location.href = '/index.php?route=order-history';
				}	
			}
		});
	});
<?php };?>
	$('.overlay').live("click",function(){
		$('.overlay').fadeOut("fast",function(){ $('.overlay').remove();});
		$('#radix-popupimage').fadeOut("fast",function(){ $('#radix-popupimage').remove();});
		
	});
});
//--></script>
<?php echo $footer;