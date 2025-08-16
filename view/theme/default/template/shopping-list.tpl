<?php echo $header; ?>

<div class="container mx-auto px-4 py-8 flex-1 mt-16" id="wish_tabs">
	<div id="tab2" class="tabs hide">
		<div class="space-y-6">
			<div class="flex items-center justify-between gap-4">
				<div class="flex-1">
					<div class="flex items-center justify-between mb-4">
						<h2 class="text-2xl font-bold">Favorites</h2>
						<button class="justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 flex items-center gap-2 close_tab2">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left h-5 w-5"><path d="m12 19-7-7 7-7"></path><path d="M19 12H5"></path></svg>Back
						</button>
					</div>
					<div class="relative">
						<input type="text" class="flex h-10 rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm w-full search_suggest_s_list" placeholder="Type at least 3 characters to search..." value="">
						<div class="result_search_suggest"></div>
					</div>
				</div>
			</div>
			
			<div class="border rounded-lg overflow-hidden">
				<?php foreach($wish_products as $product){ ?>
					<div class="flex items-center justify-between p-4 border-b wish_product">
					
						<div class="flex items-center gap-4">
							<img src="<?php echo $product['thumb'];?>" alt="<?php echo $product['name'];?>" class="w-16 h-16 object-cover rounded">
							<div>
								<h4 class="font-medium"><?php echo $product['name'];?></h4>
								<p class="text-gray-600">$<?php echo $product['price'];?></p>
							</div>
						</div>
						
						<div class="flex gap-2">
							<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent h-10 w-10 text-red-500 hover:text-red-600 add_wish" data-product_id="<?php echo $product['product_id'];?>">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash2 h-5 w-5"><path d="M3 6h18"></path><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path><line x1="10" x2="10" y1="11" y2="17"></line><line x1="14" x2="14" y1="11" y2="17"></line></svg>
							</button>
							<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 w-10 add_to_cart" data-product_id="<?php echo $product['product_id'];?>" data-quantity="1" data-type="<?php echo $product['type'];?>">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-shopping-cart h-5 w-5"><circle cx="8" cy="21" r="1"></circle><circle cx="19" cy="21" r="1"></circle><path d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12"></path></svg>
							</button>
						</div>
					</div>
				<?php };?>

			</div>
		</div>
	</div>

	<div id="tab1" class="tabs">
		<div class="flex items-center justify-between mb-6">
			<h1 class="text-2xl font-bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Shopping Lists</font></font></h1>
			<a href="<?php echo $go_shop;?>" class="justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&_svg]:size-4 [&_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 flex items-center gap-2">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left h-5 w-5"><path d="m12 19-7-7 7-7"></path><path d="M19 12H5"></path></svg><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Back</font></font>
			</a>
		</div>
	
		<div class="space-y-8">
			<section>
				<button class="inline-flex items-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 w-full justify-between open_tabs" data-tab="2">
					<span class="flex items-center gap-2"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-heart h-5 w-5"><path d="M19 14c1.49-1.46 3-3.21 3-5.5A5.5 5.5 0 0 0 16.5 3c-1.76 0-3 .5-4.5 2-1.5-1.5-2.74-2-4.5-2A5.5 5.5 0 0 0 2 8.5c0 2.3 1.5 4.05 3 5.5l7 7Z"></path></svg>
					<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Favorites</font></font></span>
					<span class="text-gray-500">
						<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Items in the list ( </font></font><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><?php echo count($wish_products);?> </font></font><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">)</font></font>
					</span>
				</button>
			</section>
		
			<section>
		
				<div class="flex items-center justify-between mb-4">
					<h2 class="text-xl font-semibold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Custom Lists</font></font></h2>
					<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50 [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 add_new_s_list" type="button">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus h-4 w-4 mr-2"><path d="M5 12h14"></path><path d="M12 5v14"></path></svg>
						New List
					</button>
				</div>
				
				<div class="space-y-4" id="s_list_block">
					<?php $tab=3;foreach($s_list as $row){ ?>
						<div class="border rounded-lg p-4 item_s_list">
							<button class="inline-flex items-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50 [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 w-full justify-between mb-2 open_tabs" data-tab="<?php echo $tab;?>">
								<span><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><?php echo $row['name'];?></font></font></span>
								<span class="text-gray-500">
									<font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Items in the list ( </font></font><font style="vertical-align: inherit;"><font style="vertical-align: inherit;"><?php echo count($row['products']);?> </font></font><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">)</font></font>
								</span>
							</button>
							<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50 [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent h-9 rounded-md px-3 text-red-500 hover:text-red-600 delete" data-s_list_id="<?php echo $row['s_list_id'];?>">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash h-4 w-4 mr-2"><path d="M3 6h18"></path><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path></svg>
								<font style="vertical-align: inherit;">
									<font style="vertical-align: inherit;">Delete List</font>
								</font>
							</button>
						</div>
					<?php $tab++;};?>
				</div>
			</section>
		</div>
	</div>
	
	<?php $tab=3;foreach($s_list as $row){ ?>
		<div id="tab<?php echo $tab;?>" class="tabs hide">	
			<div class="space-y-6">
				<div class="flex items-center justify-between gap-4">
					<div class="flex-1">
						<div class="flex items-center justify-between mb-4">
							<h2 class="text-2xl font-bold"><?php echo $row['name'];?></h2>
							<button class="justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 flex items-center gap-2 close_tab2">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left h-5 w-5"><path d="m12 19-7-7 7-7"></path><path d="M19 12H5"></path></svg>Back
							</button>
						</div>
						<div class="relative">
							<input type="text" class="flex h-10 rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm w-full search_suggest_s_list" placeholder="Type at least 3 characters to search..." value="" data-s_list_id="<?php echo $row['s_list_id'];?>">
							<div class="result_search_suggest"></div>
						</div>
					</div>
				</div>
				<div class="border rounded-lg overflow-hidden">
					<?php foreach($row['products'] as $product){ ?>
						<div class="flex items-center justify-between p-4 border-b item_s_p">
							<div class="flex items-center gap-4">
								<img src="<?php echo $product['thumb'];?>" alt="<?php echo $product['name'];?>" class="w-16 h-16 object-cover rounded">
								<div>
									<h4 class="font-medium"><?php echo $product['name'];?></h4>
									<p class="text-gray-600">$<?php echo $product['price'];?></p>
								</div>
							</div>
							<div class="flex gap-2">
								<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent h-10 w-10 text-red-500 hover:text-red-600 deletesp" data-s_list_id="<?php echo $row['s_list_id'];?>" data-product_id="<?php echo $product['product_id'];?>">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-trash2 h-5 w-5"><path d="M3 6h18"></path><path d="M19 6v14c0 1-1 2-2 2H7c-1 0-2-1-2-2V6"></path><path d="M8 6V4c0-1 1-2 2-2h4c1 0 2 1 2 2v2"></path><line x1="10" x2="10" y1="11" y2="17"></line><line x1="14" x2="14" y1="11" y2="17"></line></svg>
								</button>
								<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 w-10 add_to_cart" data-product_id="<?php echo $product['product_id'];?>" data-quantity="1" data-type="<?php echo $product['type'];?>">
									<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-shopping-cart h-5 w-5"><circle cx="8" cy="21" r="1"></circle><circle cx="19" cy="21" r="1"></circle><path d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12"></path></svg>
								</button>
							</div>
						</div>
					<?php };?>

				</div>
			</div>
		</div>
	<?php $tab++;};?>
</div>


<div class="fixed inset-0 z-50 bg-black/80 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 overlay_wish"></div>

<div role="dialog" id="modal_add_s_list" aria-describedby="radix-:ro:" aria-labelledby="radix-:rn:" data-state="open" class="fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg duration-200 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[state=closed]:slide-out-to-left-1/2 data-[state=closed]:slide-out-to-top-[48%] data-[state=open]:slide-in-from-left-1/2 data-[state=open]:slide-in-from-top-[48%] sm:rounded-lg">
	<div class="flex flex-col space-y-1.5 text-center sm:text-left">
		<h2 id="radix-:rn:" class="text-lg font-semibold leading-none tracking-tight">Create New List</h2>
	</div>
	<div class="space-y-4 mt-4">
		<input name="s_list_name" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm s_list_name" placeholder="Enter list name" value="">
		<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 w-full add_s_list_name">Create List</button>
	</div>
	
	<button type="button" class="absolute right-4 top-4 rounded-sm opacity-70 ring-offset-background transition-opacity hover:opacity-100 focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2  data-[state=open]:bg-accent data-[state=open]:text-muted-foreground close">
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-x h-4 w-4"><path d="M18 6 6 18"></path><path d="m6 6 12 12"></path></svg>
		<span class="sr-only">Close</span>
	</button>
</div>

<script type="text/javascript"><!--
$(document).ready(function() {
	$('.open_tabs[data-tab]').live("click",function(){
		$('.tabs').addClass('hide');
		$('#tab' + $(this).attr('data-tab')).removeClass('hide');
	});
	$('.close_tab2').live("click",function(){
		$('.tabs').addClass('hide');
		$('#tab1').removeClass('hide');
	});
	$('#wish_tabs').on("click",".add_new_s_list",function(){

		$('.overlay_wish').addClass('visible');
		$('#modal_add_s_list').addClass('visible');
	});
	$('#modal_add_s_list .close').on("click",function(){
		$('.overlay_wish').removeClass('visible');
		$('#modal_add_s_list').removeClass('visible');
	});
	$(document).on("click",function(e){
		var rmb = $("#modal_add_s_list");
		var rmbb = $(".add_new_s_list");
		if ( !rmbb.is(e.target) && !rmb.is(e.target) && rmb.has(e.target).length === 0 && rmb.find('#modal_add_s_list.visible') ) {
			$('.overlay_wish').removeClass('visible');
			$('#modal_add_s_list').removeClass('visible');

		}
	});
	$('.add_s_list_name').live("click",function(){
		$('#notif').remove();
		$('#wish_tabs').addClass('fog');
		
		$.ajax({
			url: 'index.php?route=shopping-list/addname',
			type: 'post',
			data: 's_list_name=' + $('input.s_list_name').val() ,
			dataType: 'json',
			beforeSend: function() {
			},
			complete: function() {
			},
			success: function(json) {
				if(json['success']){
					$('body').append('<section aria-label="Notifications alt+T" tabindex="-1" id="notif"><ol dir="ltr" tabindex="-1" class="toaster group" style="--front-toast-height:53.5px; --offset:32px; --width:356px; --gap:14px;"><li class="flex group toast group-[.toaster]:bg-background group-[.toaster]:text-foreground group-[.toaster]:border-border group-[.toaster]:shadow-lg"><div class=""><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" height="20" width="20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clip-rule="evenodd"></path></svg></div><div class=""><div class="">' + json['success'] + '</div></div></li></ol></section>');
					notif_wish = setTimeout(function(){
						$('#notif').remove();
					},3000);
					$('.overlay_wish').removeClass('visible');
					$('#modal_add_s_list').removeClass('visible');
					
					$('#wish_tabs').load('index.php?route=shopping-list #wish_tabs > *');
					$('#wish_tabs').removeClass('fog');
				}
			}
		});
	});
	$('#wish_tabs').on("click","#s_list_block .delete",function(){
		$('#notif').remove();
		var obj_s_l = $(this);
		$('#wish_tabs').addClass('fog');
		$.ajax({
			url: 'index.php?route=shopping-list/delete',
			type: 'post',
			data: 's_list_id=' + $(this).attr('data-s_list_id') ,
			dataType: 'json',
			beforeSend: function() {
			},
			complete: function() {
				$('#wish_tabs').removeClass('fog');
			},
			success: function(json) {
				if(json['success']){
					$('body').append('<section aria-label="Notifications alt+T" tabindex="-1" id="notif"><ol dir="ltr" tabindex="-1" class="toaster group" style="--front-toast-height:53.5px; --offset:32px; --width:356px; --gap:14px;"><li class="flex group toast group-[.toaster]:bg-background group-[.toaster]:text-foreground group-[.toaster]:border-border group-[.toaster]:shadow-lg"><div class=""><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" height="20" width="20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clip-rule="evenodd"></path></svg></div><div class=""><div class="">' + json['success'] + '</div></div></li></ol></section>');
					notif_wish = setTimeout(function(){
						$('#notif').remove();
					},3000);
					$(obj_s_l).closest('.item_s_list').remove();
				}
			}
		});
	});
	$('.search_suggest_s_list').live("keyup",function(){
		$('.result_search_suggest').addClass('hide');
		$('.result_search_suggest').html('');
		var obj_sug = $(this);
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
							if($(obj_sug).closest('#tab2').length > 0){
html_hide= '<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3 ml-2 add_wish" data-product_id="' + json['products'][k]['product_id'] +'">Add</button>';
							}else{
html+= '<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3 ml-2 add_to_tab" data-s_list_id="' + $(obj_sug).attr('data-s_list_id') + '" data-product_id="' + json['products'][k]['product_id'] +'">Add</button>';
							}
							html+= '</div>';
						}
						$(obj_sug).parent().find('.result_search_suggest').removeClass('hide');
					}else{
						$(obj_sug).parent().find('.result_search_suggest').addClass('hide');
					}
					$(obj_sug).parent().find('.result_search_suggest').html(html);
				}
			});
		}
	});
	$('.deletesp').live("click",function(){
		$('#wish_tabs').addClass('fog');
		$('#notif').remove();
		var obj = $(this);
		$.ajax({
			url: 'index.php?route=shopping-list/deletesp',
			type: 'post',
			data: 's_list_id=' + $(this).attr('data-s_list_id') + '&product_id=' + $(this).attr('data-product_id') ,
			dataType: 'json',
			beforeSend: function() {
			},
			complete: function() {
			},
			success: function(json) {
				if(json['success']){
					$('body').append('<section aria-label="Notifications alt+T" tabindex="-1" id="notif"><ol dir="ltr" tabindex="-1" class="toaster group" style="--front-toast-height:53.5px; --offset:32px; --width:356px; --gap:14px;"><li class="flex group toast group-[.toaster]:bg-background group-[.toaster]:text-foreground group-[.toaster]:border-border group-[.toaster]:shadow-lg"><div class=""><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" height="20" width="20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clip-rule="evenodd"></path></svg></div><div class=""><div class="">' + json['success'] + '</div></div></li></ol></section>');
					notif_wish = setTimeout(function(){
						$('#notif').remove();
					},3000);
					//$(obj).closest('.item_s_p').remove();
					$(obj).closest('.tabs').load('index.php?route=shopping-list #wish_tabs #' + $(obj).closest('.tabs').attr('id') + ' > *');
					$('#tab1').load('index.php?route=shopping-list #tab1 > *');
					$('#wish_tabs').removeClass('fog');
				}
			}
		});
	});
	$('.result_search_suggest .add_to_tab').live("click",function(){
		$('#wish_tabs').addClass('fog');
		$('#notif').remove();
		var obj = $(this);
		$.ajax({
			url: 'index.php?route=shopping-list/addsp',
			type: 'post',
			data: 's_list_id=' + $(this).attr('data-s_list_id') + '&product_id=' + $(this).attr('data-product_id') ,
			dataType: 'json',
			beforeSend: function() {
			},
			complete: function() {
			},
			success: function(json) {

				if(json['success']){
					$('body').append('<section aria-label="Notifications alt+T" tabindex="-1" id="notif"><ol dir="ltr" tabindex="-1" class="toaster group" style="--front-toast-height:53.5px; --offset:32px; --width:356px; --gap:14px;"><li class="flex group toast group-[.toaster]:bg-background group-[.toaster]:text-foreground group-[.toaster]:border-border group-[.toaster]:shadow-lg"><div class=""><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" height="20" width="20"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clip-rule="evenodd"></path></svg></div><div class=""><div class="">' + json['success'] + '</div></div></li></ol></section>');
					notif_wish = setTimeout(function(){
						$('#notif').remove();
					},3000);
					$(obj).closest('.tabs').load('index.php?route=shopping-list #wish_tabs #' + $(obj).closest('.tabs').attr('id') + ' > *');
					$('#wish_tabs').removeClass('fog');
				}
			}
		});

	});
});
//--></script> 
<?php echo $footer;