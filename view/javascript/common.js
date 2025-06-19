var notif_cart;
$(document).ready(function() {
console.log('ini common');
	
	

	
	$('.add_to_cart').live("click",function(){
		clearTimeout(notif_cart);
		$('#notif').remove();
		$.ajax({
			url: 'index.php?route=order/add',
			type: 'post',
			data: 'product_id=' + $(this).attr('data-product_id') + '&quantity=' + $(this).attr('data-quantity') + '&type=' + $(this).attr('data-type'),
			dataType: 'json',
			success: function(json) {
console.log(json);
				if (json['success']) {
					$('body').append('<section aria-label="Notifications alt+T" tabindex="-1" id="notif"><ol dir="ltr" tabindex="-1" class="toaster group" style="--front-toast-height:53.5px; --offset:32px; --width:356px; --gap:14px;"><li class="flex group toast group-[.toaster]:bg-background group-[.toaster]:text-foreground group-[.toaster]:border-border group-[.toaster]:shadow-lg"><div class=""><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" height="20" width="20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clip-rule="evenodd"></path></svg></div><div class=""><div class="">Added ' + json['quantity'] + ' item to cart</div></div></li></ol></section>');
					notif_cart = setTimeout(function(){
						$('#notif').remove();
					},3000);
					
					if(json['total_quantity']){
						$('#total_cart').html(json['total_quantity']);
					}
				}	
			}
		});
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

function addToCart(product_id, quantity) {
	quantity = typeof(quantity) != 'undefined' ? quantity : 1;
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: 'product_id=' + product_id + '&quantity=' + quantity,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information, .error').remove();
			if (json['redirect']) {
				location = json['redirect'];
			}
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				$('.success').fadeIn('slow');
				$('#cart-total').html(json['total']);
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
}
function addToWishList(product_id) {
	$.ajax({
		url: 'index.php?route=account/wishlist/add',
		type: 'post',
		data: 'product_id=' + product_id,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, .information').remove();
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
				$('.success').fadeIn('slow');
				$('#wishlist-total').html(json['total']);
				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}	
		}
	});
}