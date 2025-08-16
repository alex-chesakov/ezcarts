<button class="justify-center whitespace-nowrap rounded-md ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 flex items-center gap-2 text-sm font-normal" type="button" aria-haspopup="dialog" aria-expanded="false" aria-controls="radix-:r0:" data-state="closed" id="select_location">
	<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-map-pin h-4 w-4"><path d="M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0"></path><circle cx="12" cy="10" r="3"></circle></svg>
	<?php echo $location;?>
</button>

<script type="text/javascript"><!--
<?php if(!empty($cart_locations)){ ?>
	var cart_locations = ['<?php echo implode("','",$cart_locations);?>'];
<?php }else{ ?>
	var cart_locations = [];
<?php };?>
$('#select_location').bind('click', function() {
	html = '<div class="fixed inset-0 z-50 bg-black/80 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 overlay" style="" data-aria-hidden="true" aria-hidden="true"></div>';
	html+= '<div role="dialog" data-state="open" class="fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[state=closed]:slide-out-to-left-1/2 data-[state=closed]:slide-out-to-top-[48%] data-[state=open]:slide-in-from-left-1/2 data-[state=open]:slide-in-from-top-[48%] sm:rounded-lg sm:max-w-md" style="" id="location_modal">';
	html+= '<div class="flex flex-col space-y-1.5 text-center sm:text-left"><h2 id="radix-:rf:" class="text-lg font-semibold leading-none tracking-tight">Your Location</h2>';
	html+= '<p id="radix-:rg:" class="text-sm text-muted-foreground">Enter a city name or ZIP code to shop in the closest warehouse.</p>';
	html+= '</div><div class="flex gap-2 mt-4">';
	html+= '<input class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm flex-1" placeholder="Enter City or Zip" value="">';
	html+= '<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 search">Search</button>';
	html+= '</div><div class="mt-4 space-y-2 load">';
	<?php foreach($locations as $loc){ ?>
		html+= '<button class="inline-flex items-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 w-full justify-start select_location" data-v="<?php echo $loc;?>"><?php echo $loc;?></button>';
	<?php };?>
	html+= '</div>';
	html+= '<button type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2  data-[state=open]:bg-accent data-[state=open]:text-muted-foreground close"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg><span class="sr-only">Close</span></button>';
	html+= '</div>';
	$('body').append(html);
	
	$('#location_modal button.search').live("click",function(){
		$.ajax({
			url: 'index.php?route=module/setlocation/search&search=' + encodeURIComponent($(this).prev().val()),
			dataType: 'json',
			beforeSend: function() {
				$('#location_modal .load .select_location').show();
				$('#location_modal .load .select_location.find').remove();
			},
			complete: function() { },
			success: function(json) {
				if (json['find']) {
					$('#location_modal .load .select_location').each(function(){
						if(json['find'].toLowerCase() == $(this).html().toLowerCase()){
							$(this).hide();
						}
					});
					$('#location_modal .load').prepend('<button class="inline-flex items-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input hover:text-accent-foreground h-10 px-4 py-2 w-full justify-start bg-blue-50 hover:bg-blue-100 select_location find" data-v="' + json['find'] + '">' + json['find'] + ' (Best Match)</button>');
				}
			}
		});
	});
	$('.overlay').live("click",function(){
		$('#location_modal').fadeOut("fast",function(){ $('#location_modal').remove();});
		$('.overlay').fadeOut("fast",function(){ $('.overlay').remove();});
	});
	$('#location_modal .close').live("click",function(){
		$('#location_modal').fadeOut("fast",function(){ $('#location_modal').remove();});
		$('.overlay').fadeOut("fast",function(){ $('.overlay').remove();});
	});
	$('#location_modal .select_location').live("click",function(){

		if(cart_locations.length < 1 || cart_locations.indexOf($(this).attr('data-v')) == 0 ){
			querysetlocation($(this).attr('data-v'));
		}else{
			$('#location_modal').remove();
			$('.overlay').remove();
			html = '<div class="fixed inset-0 z-50 bg-black/80 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 overlay" style="" data-aria-hidden="true" aria-hidden="true"></div>';
			html+= '<div role="dialog" data-state="open" class="fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[state=closed]:slide-out-to-left-1/2 data-[state=closed]:slide-out-to-top-[48%] data-[state=open]:slide-in-from-left-1/2 data-[state=open]:slide-in-from-top-[48%] sm:rounded-lg sm:max-w-md" style="" id="location_modal">';
			html+= '<div class="flex flex-col space-y-1.5 text-center sm:text-left"><h2 id="radix-:rf:" class="text-lg font-semibold leading-none tracking-tight">Your Location</h2>';
			html+= '<p id="radix-:rg:" class="text-sm text-muted-foreground">You are changing the warehouse. All items will be removed from the cart. Yes/no</p>';
			html+= '</div><div class="flex gap-2 mt-4">';
			html+= '</div><div class="mt-4 space-y-2 load">';
			html+= '<div class="flex justify-between">';
			html+= '<button type="button" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&_svg]:size-4 [&_svg]:shrink-0 text-primary-foreground px-4 bg-[#022785] hover:bg-[#022785]/90 text-xs py-0.5 h-6">NO</button><button type="button" class="go_new_location inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&_svg]:size-4 [&_svg]:shrink-0 text-primary-foreground px-4 bg-[#022785] hover:bg-[#022785]/90 text-xs py-0.5 h-6" data-v="' + $(this).attr('data-v') + '">YES</button>';
			html+= '</div>';
			html+= '</div>';
			html+= '<button type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2  data-[state=open]:bg-accent data-[state=open]:text-muted-foreground close"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg><span class="sr-only">Close</span></button>';
			html+= '</div>';
			$('body').append(html);

		}

	});
});
$('.go_new_location').live("click",function(){
	querysetlocation($(this).attr('data-v'));
});
function querysetlocation(datav){
	$.ajax({
		url: 'index.php?route=module/setlocation/ajax&location=' + encodeURIComponent(datav),
		dataType: 'json',
		beforeSend: function() {
		},
		complete: function() {
		},
		success: function(json) {

			if (json['redirect']) {
				location.href = json['redirect'];
			}
		}
	});
}
//--></script>