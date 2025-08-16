var notif_cart;
var notif_wish;
var notif_order;
$(document).ready(function() {
console.log('ini common');

	$('[data-href]').live("click",function(){
		href = $(this).attr('data-href');
		if(href){
			location.href = href;
		}
	});
	$('.del_from_cart').live("click",function(){
		$.ajax({
			url: 'index.php?route=order/delete',
			type: 'post',
			data: 'product_id=' + $(this).attr('data-product_id') + '&cart_id=' + $(this).attr('data-cart_id') + '&type=' + $(this).attr('data-type'),
			dataType: 'json',
			success: function(json) {
				if(json['success']){
					if(json['delete_class']){
						$(json['delete_class']).remove();
						//	reload products in mini cart
						if($('#load_mini_cart')){
							$('#load_mini_cart').load('index.php?route=home #load_mini_cart > *');
						}
						//	reload total in cart
						if($('#checkout_total_order')){
							$('#checkout_total_order').load('index.php?route=checkout #checkout_total_order > *');
						}
						//	reload products in cart
						if($('#modal_checkout_cart')){
							$('#modal_checkout_cart').load('index.php?route=checkout #modal_checkout_cart > *');
						}
$('#open_mini_cart').load('index.php?route=checkout #open_mini_cart > *');
					}
				}
			}
		});
	});
	$('.add_to_cart').live("click",function(){
		clearTimeout(notif_cart);
		$('#notif').remove();
		$.ajax({
			url: 'index.php?route=order/add',
			type: 'post',
			data: 'product_id=' + $(this).attr('data-product_id') + '&quantity=' + $(this).attr('data-quantity') + '&type=' + $(this).attr('data-type'),
			dataType: 'json',
			success: function(json) {
console.log( json );
				if (json['success']) {
					$('body').append('<section aria-label="Notifications alt+T" tabindex="-1" id="notif"><ol dir="ltr" tabindex="-1" class="toaster group" style="--front-toast-height:53.5px; --offset:32px; --width:356px; --gap:14px;"><li class="flex group toast group-[.toaster]:bg-background group-[.toaster]:text-foreground group-[.toaster]:border-border group-[.toaster]:shadow-lg"><div class=""><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" height="20" width="20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clip-rule="evenodd"></path></svg></div><div class=""><div class="">Added ' + json['quantity'] + ' item to cart</div></div></li></ol></section>');
					notif_cart = setTimeout(function(){
						$('#notif').remove();
					},3000);
					if(json['location']){
						if( cart_locations.indexOf($(this).attr('data-v')) ){
						}else{
							cart_locations.push(json['location']);//	add locations
						}
					}
					if(json['total_quantity']){
						$('#total_cart').html(json['total_quantity']);
					}
					//	reload products in mini cart
					if($('#load_mini_cart')){
						$('#load_mini_cart').load('index.php?route=home #load_mini_cart > *',false,function(){
		console.log('reload #load_mini_cart');
	});
					}
					//	reload total in cart
					if($('#checkout_total_order')){
						$('#checkout_total_order').load('index.php?route=checkout #checkout_total_order > *',false,function(){
		console.log('reload #checkout_total_order');
	});
					}
					//	reload products in cart
					if($('#modal_checkout_cart')){
						$('#modal_checkout_cart').load('index.php?route=checkout #modal_checkout_cart > *',false,function(){
		console.log('reload #modal_checkout_cart');
	});
					}
if($('#open_mini_cart')){
	$('#open_mini_cart').load('index.php?route=home #open_mini_cart > *',false,function(){
		console.log('reload #open_mini_cart');
	});
}
				}	
			}
		});
	});
	
	$('.q_block_c .minus').live("click",function(){
		q = $(this).next().val();
		q = parseInt(q);
		if(q>1){
			$(this).next().val(q-1);
			$(this).next().attr("data-quantity",q-1);
			$(this).next().trigger('change');
			if($('#checkout_total_order')){
				$('#checkout_total_order').load('index.php?route=checkout #checkout_total_order > *');
			}
			if($('#modal_checkout_cart')){
				$('#modal_checkout_cart').load('index.php?route=checkout #modal_checkout_cart > *');
			}
			if($('#load_mini_cart')){
				$('#load_mini_cart').load('index.php?route=home #load_mini_cart > *');
			}
		}
	});
	$('.q_block_c .plus').live("click",function(){
		q = $(this).prev().val();
		q = parseInt(q);
		$(this).prev().val(q+1);
		$(this).prev().attr("data-quantity",q+1);
		$(this).prev().trigger('change');
		if($('#checkout_total_order')){
			$('#checkout_total_order').load('index.php?route=checkout #checkout_total_order > *');
		}
		if($('#modal_checkout_cart')){
			$('#modal_checkout_cart').load('index.php?route=checkout #modal_checkout_cart > *');
		}
		if($('#load_mini_cart')){
			$('#load_mini_cart').load('index.php?route=home #load_mini_cart > *');
		}
	});
	$('.q_replace').live("change",function(){
		var qr = $(this);
		clearTimeout(notif_cart);
		$('#notif').remove();
		$.ajax({
			url: 'index.php?route=order/add',
			type: 'post',
			data: 'replace=1&product_id=' + $(qr).attr('data-product_id') + '&quantity=' + $(qr).val() + '&type=' + $(qr).attr('data-type'),
			dataType: 'json',
			success: function(json) {
				if (json['success']) {
					$('#modal_mini_cart').load('index.php?route=module/cart #modal_mini_cart > *');
					$('#open_mini_cart').load('index.php?route=checkout #open_mini_cart > *');
					$('#checkout_total_order').load('index.php?route=checkout #checkout_total_order > *');
				}	
			}
		});
	});

	$('.bar_kitchens').on("click",function(){
		$(this).closest('.kitchen_select_block').find('.sel_menu_kitchens').toggleClass('open');
	});
	$('.sel_menu_kitchens label input[type=radio]').on("change",function(){
		var sel_kit_i = $(this);
		$.ajax({
			url: 'index.php?route=mykitchen/changekitchen&kitchen_id=' + encodeURIComponent($(this).val()),
			dataType: 'json',
			beforeSend: function() {},
			complete: function() {},
			success: function(json) {

				if(json['success']){
					$('.bar_kitchens').html( '<span class="font-medium">' + json['success']['name'] + '</span><span class="text-gray-500">' + json['success']['address'] + '</span>');
					
					if($('input[name=kitchen_checkout]').length){
						$('input[name=kitchen_checkout].kitchensel' + $(sel_kit_i).val() ).prop("checked", true);
					}
					if($('input[name=kitchen]').length){
						$('input[name=kitchen].kitchensel' + $(sel_kit_i).val() ).prop("checked", true);
					}
					$('.sel_menu_kitchens.open').removeClass('open');
location.reload();
				}
				if(json['redirect']){
					if($('input[name=kitchen_checkout]').length){
						console.log('no redirect -> kitchen change');
					}else{
						location.href = json['redirect'];
					}
				}
			}
		});
	});
	$(document).on("click",function(e){
		var smko = $(".kitchen_select_block");
		if ( !smko.is(e.target) && smko.has(e.target).length === 0 && smko.find('.sel_menu_kitchens.open') ) {
			$('.sel_menu_kitchens.open').removeClass('open');
		}
	});
	$('.add_wish').live("click",function(){
		if($('#wish_tabs #tab2')){
			$('#wish_tabs').addClass('fog');
		}
		clearTimeout(notif_wish);
		$('#notif').remove();
		var obj_wish = $(this);
		if($(this).attr('data-product_id')){

			product_id = $(this).attr('data-product_id');
			$.ajax({
				url: 'index.php?route=product/wish',
				type: 'post',
				data: 'product=' + product_id ,
				dataType: 'json',
				beforeSend: function() {
				},
				complete: function() {
				},
				success: function(json) {
					if(json['success']){
						$(obj_wish).toggleClass('active');
						$('body').append('<section aria-label="Notifications alt+T" tabindex="-1" id="notif"><ol dir="ltr" tabindex="-1" class="toaster group" style="--front-toast-height:53.5px; --offset:32px; --width:356px; --gap:14px;"><li class="flex group toast group-[.toaster]:bg-background group-[.toaster]:text-foreground group-[.toaster]:border-border group-[.toaster]:shadow-lg"><div class=""><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" height="20" width="20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clip-rule="evenodd"></path></svg></div><div class=""><div class="">' + json['success'] + '</div></div></li></ol></section>');
						notif_wish = setTimeout(function(){
							$('#notif').remove();
						},3000);
						if($(obj_wish).closest('.wish_product')){
							$(obj_wish).closest('.wish_product').remove();
						}
						if($('#wish_tabs #tab2')){
							$('#wish_tabs #tab2').load('index.php?route=shopping-list #wish_tabs #tab2 > *');
							$('#tab1').load('index.php?route=shopping-list #tab1 > *');
							$('#wish_tabs').removeClass('fog');
						}
					}
				}
			});
		}
	});
	
});

function getURLVar(key) {
	var value = [];
	var query = String(document.location).split('?');
	if (query[1]) {
		var part = query[1].split('&');
		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');
			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}
		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
} 

