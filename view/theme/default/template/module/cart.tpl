<div id="modal_mini_cart" class="fixed z-50 gap-4 bg-background p-6 shadow-lg transition ease-in-out data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:duration-300 data-[state=open]:duration-500 inset-y-0 right-0 h-full w-3/4 border-l data-[state=closed]:slide-out-to-right data-[state=open]:slide-in-from-right sm:max-w-sm">
	<div class="flex flex-col h-full" id="load_mini_cart">
		<div class="flex flex-col space-y-2 text-center sm:text-left">
			<h2 id="radix-:r4:" class="text-lg font-semibold text-foreground">Cart</h2>
		</div>
		<div dir="ltr" class="relative overflow-hidden flex-1 mt-8 pr-4" style="position: relative; --radix-scroll-area-corner-width:0px; --radix-scroll-area-corner-height:0px;">
			<div class="h-full w-full rounded-[inherit]" style="overflow: hidden auto;">
				<div style="min-width: 100%; display: table;">
					<div class="space-y-4">
<?php foreach($products as $product){ ?>
						<div class="flex items-start gap-4 cart_id<?php echo $product['cart_id'];?> product_id<?php echo $product['product_id'];?> type<?php echo $product['type'];?>">
							<div class="flex-1 flex gap-4">
								<img src="<?php echo $product['thumb'];?>" alt="Fresh Organic Apples" class="w-16 h-16 object-cover rounded">
								<div class="data-c">
									<h3 class="font-medium"><?php echo $product['name'];?></h3>
									<p class="text-sm text-gray-500"><?php echo $product['type'];?></p>
									<div class="flex items-center gap-3 mt-2 q_block_c">
										<button class="p-1 hover:bg-gray-100 rounded minus">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-minus h-4 w-4"><path d="M5 12h14"></path></svg>
										</button>
										<input type="text" name="" value="<?php echo $product['quantity'];?>" class="q_replace text-sm font-medium w-8 text-center" data-product_id="<?php echo $product['product_id'];?>" data-quantity="<?php echo $product['quantity'];?>" data-type="<?php echo $product['type'];?>" />
										<button class="p-1 hover:bg-gray-100 rounded plus">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus h-4 w-4"><path d="M5 12h14"></path><path d="M12 5v14"></path></svg>
										</button>
									</div>
									<p class="text-sm font-medium mt-1 price-c">$<?php echo $product['price'];?></p>
								</div>
							</div>
								
							<button class="p-1 hover:bg-gray-100 rounded del_from_cart" data-cart_id="<?php echo $product['cart_id'];?>" data-product_id="<?php echo $product['product_id'];?>" data-type="<?php echo $product['type'];?>">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash2 h-5 w-5 text-gray-500"><path d="M3 6h18"></path><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path><line x1="10" x2="10" y1="11" y2="17"></line><line x1="14" x2="14" y1="11" y2="17"></line></svg>
							</button>
						</div>
<?php };?>
								
					</div>
				</div>
			</div>
		</div>
				
		<div class="mt-auto pt-6 border-t">
			<div class="space-y-4">
				<div class="flex justify-between font-medium">
					<span >Total</span>
					<span>$<?php echo $cart_total;?></span>
				</div>
				
				<a href="<?php echo $checkout;?>" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 text-primary-foreground h-10 px-4 py-2 w-full bg-[#022785] hover:bg-[#022785]/90">Go to Checkout</a>
			</div>
		</div>
	</div>
	<button type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2  data-[state=open]:bg-secondary close">
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg>
		<span class="sr-only">Close</span>
	</button>
</div>
<style>[data-radix-scroll-area-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-scroll-area-viewport]::-webkit-scrollbar{display:none}
</style>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#open_mini_cart').live("click",function(){
		$('#modal_mini_cart').addClass('visible');
		if($('.overlay_c').length){
			$('.overlay_c').addClass('visible');
		}else{
			$('body').append('<div class="fixed inset-0 z-50 bg-black/80 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 overlay_c visible"></div>');
		}
	});
	$('#modal_mini_cart .close').on("click",function(){
		$('.overlay_c').removeClass('visible');
		$('#modal_mini_cart').removeClass('visible');
	});
	$(document).live("click",function(e){
		var rmb = $("#modal_mini_cart");
		var rmbb = $("#open_mini_cart");
		if ( !rmbb.is(e.target) && !rmb.is(e.target) && rmb.has(e.target).length === 0 ) {
			$('.overlay_c').removeClass('visible');
			$('#modal_mini_cart').removeClass('visible');
		}
	});

});
//--></script>
<?php /*
<div id="cart">
  <div class="heading">
    <h4><?php echo $heading_title; ?></h4>
    <a><span id="cart-total"><?php echo $text_items; ?></span></a></div>
  <div class="content">
    <?php if ($products || $vouchers) { ?>
    <div class="mini-cart-info">
      <table>
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="image"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
            <?php } ?></td>
          <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <div>
              <?php foreach ($product['option'] as $option) { ?>
              - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
              <?php } ?>
              <?php if ($product['recurring']): ?>
              - <small><?php echo $text_payment_profile ?> <?php echo $product['profile']; ?></small><br />
              <?php endif; ?>
            </div></td>
          <td class="quantity">x&nbsp;<?php echo $product['quantity']; ?></td>
          <td class="total"><?php echo $product['total']; ?></td>
          <td class="remove"><img src="catalog/view/theme/default/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $product['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $product['key']; ?>' + ' #cart > *');" /></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="image"></td>
          <td class="name"><?php echo $voucher['description']; ?></td>
          <td class="quantity">x&nbsp;1</td>
          <td class="total"><?php echo $voucher['amount']; ?></td>
          <td class="remove"><img src="catalog/view/theme/default/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $voucher['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $voucher['key']; ?>' + ' #cart > *');" /></td>
        </tr>
        <?php } ?>
      </table>
    </div>
    <div class="mini-cart-total">
      <table>
        <?php foreach ($totals as $total) { ?>
        <tr>
          <td class="right"><b><?php echo $total['title']; ?>:</b></td>
          <td class="right"><?php echo $total['text']; ?></td>
        </tr>
        <?php } ?>
      </table>
    </div>
    <div class="checkout"><a href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a> | <a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></div>
    <?php } else { ?>
    <div class="empty"><?php echo $text_empty; ?></div>
    <?php } ?>
  </div>
</div>
*/	?>