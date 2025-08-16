<?php echo $header; ?>

<div class="container mx-auto px-4 py-8 mt-16 flex-grow">
	<div class="flex justify-between items-center mb-6">
		<div class="flex items-center gap-4">
			<h1 class="text-2xl font-bold">Order History</h1>
			<div class="relative history_select_block">
				<button type="button" role="combobox" aria-controls="radix-:r9:" aria-expanded="false" aria-autocomplete="none" dir="ltr" data-state="closed" class="flex h-10 items-center justify-between rounded-md border border-input bg-white px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1 w-[180px] bar_history">
					<span>All Orders</span>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50" aria-hidden="true"><path d="m6 9 6 6 6-6"></path></svg>
				</button>
				<div class="dropdown sel_menu_history">
							<label>
								<input type="radio" name="order_status_id" value="-1" class="orderstatussel-1"/>
								<span></span>
								<div>All Orders</div>
							</label>
					<?php if(!empty($order_status)){ ?>
						<?php foreach($order_status as $order_status_id=>$o_status){ ?>
							<label>
								<input type="radio" name="order_status_id" value="<?php echo $order_status_id;?>" <?php if(!empty($order_status_id_selected) and $order_status_id_selected == $order_status_id){ echo 'checked';};?> class="orderstatussel<?php echo $order_status_id;?>"/>
								<span></span>
								<div><?php echo $o_status['name'];?></div>
							</label>
						<?php };?>
					<?php };?>
				</div>
			</div>
		</div>
		<a href="<?php echo $go_shop;?>" class="justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 flex items-center gap-2">
			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left h-4 w-4"><path d="m12 19-7-7 7-7"></path><path d="M19 12H5"></path></svg>Back to Shop
		</a>
	</div>
	
	<div dir="ltr" class="relative overflow-hidden h-[600px] rounded-md border p-4" style="position: relative; --radix-scroll-area-corner-width:0px; --radix-scroll-area-corner-height:0px;">
		<div data-radix-scroll-area-viewport="" class="h-full w-full rounded-[inherit]" style="overflow: hidden scroll;">
			<div style="min-width: 100%; display: table;" id="load_block">
				<div class="space-y-4">
					<?php foreach($orders as $order_id=>$order){ ?>
						<div data-href="<?php echo $order['href'];?>" class="rounded-lg border bg-card text-card-foreground shadow-sm cursor-pointer hover:shadow-md transition-shadow">
							<div class="flex items-center justify-between p-4">
								<div class="space-y-1">
									<div class="flex items-center gap-3">
										<p class="font-medium">Order #ORD-<?php echo $order_id;?></p>
										<div class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent hover:bg-primary/80 bg-blue-500 text-white order_status<?php echo $order['order_status_id'];?>"><?php echo $order['status'];?></div>
										<span class="text-sm text-gray-500">Items(<?php echo $order['count_products'];?>)</span>
									</div>
									<p class="text-sm text-gray-500"><?php echo $order['date_shipping'];?></p>
									<p class="text-sm text-gray-500"><?php echo $order['time_shipping'];?></p>
									<p class="text-sm text-gray-600"><?php echo $order['kitchen_checkout'];?></p>
								</div>
							</div>
						</div>
					<?php };?>
				</div>
			</div>
		</div>
	</div>
	

</div>
<style>[data-radix-scroll-area-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-scroll-area-viewport]::-webkit-scrollbar{display:none}
</style>

<script type="text/javascript"><!--
$(document).ready(function() {
	$('.bar_history').on("click",function(){
		$(this).closest('.history_select_block').find('.sel_menu_history').toggleClass('open');
	});
	$(document).on("click",function(e){
		var smko = $(".history_select_block");
		if ( !smko.is(e.target) && smko.has(e.target).length === 0 && smko.find('.sel_menu_history.open') ) {
			$('.sel_menu_history.open').removeClass('open');
		}
	});
	$('.sel_menu_history label input[type=radio]').on("change",function(){
		var sel_hi_text = $(this).closest('label').find('div').html();
		$('.bar_history span').html(sel_hi_text);
		$('.sel_menu_history.open').removeClass('open');
		$('#load_block').load('index.php?route=order-history&order_status_id=' + $(this).val() + ' #load_block > *');
	});
	$('.cancel_order').live("click",function(){
		$.ajax({
			url: 'index.php?route=order/cancelorder',
			type: 'post',
			data: 'order_id=' + $(this).attr('data-order_id') ,
			dataType: 'json',
			success: function(json) {
console.log( json );
				if (json['success']) {
//					location.href = '/index.php?route=order';
				}	
			}
		});
	});
});
//--></script>	
<?php echo $footer;