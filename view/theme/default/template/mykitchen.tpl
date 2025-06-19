<?php echo $header; ?>

<div class="container max-w-2xl mx-auto py-20 px-4 flex-grow">
	<div class="flex items-center mb-6">
		<a href="/" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 w-10 mr-4">
			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left h-6 w-6">
				<path d="m12 19-7-7 7-7"></path>
				<path d="M19 12H5"></path>
			</svg>
		</a>
		<h1 class="text-2xl font-bold">My Kitchens</h1>
	</div>
	
	<div class="space-y-6">
		<div class="flex gap-2">
			<input class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm flex-1" placeholder="Enter kitchen name..." value="">
			<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2" id="add_kitchen">Add Kitchen</button>
		</div>
		
		<div class="space-y-4">
			<?php foreach($my_kitchens as $kit){ ?>
				<div class="flex flex-col p-4 bg-white rounded-lg border item_kitchen" data-kitchen="<?php echo $kit['kitchen_id'];?>">
					<div class="flex items-center justify-between mb-2">
						<span class="font-medium"><?php echo $kit['name'];?></span>
						<div class="flex gap-2">
							<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3 change_address" data-kitchen="<?php echo $kit['kitchen_id'];?>">
Change Address</button>
							
							<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-destructive text-destructive-foreground hover:bg-destructive/90 h-9 rounded-md px-3 remove_kitchen" data-kitchen="<?php echo $kit['kitchen_id'];?>">
Remove</button>
						</div>
					</div>
					<p class="text-sm text-gray-600 mt-1 text_address"><?php echo $kit['address'];?></p>
<input class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm mt-2 pac-target-input input_address hide" placeholder="Start typing address..." autocomplete="off">
				</div>
			<?php };?>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.remove_kitchen').on("click",function(){
		var item_kitchen = $(this).closest('.item_kitchen');
		$.ajax({
			url: 'index.php?route=mykitchen/remove&kitchen_id=' + encodeURIComponent($(this).attr('data-kitchen')),
			dataType: 'json',
			beforeSend: function() {
			},
			complete: function() {
			},
			success: function(json) {
				if(json['success']){
					$(item_kitchen).remove();
				}
			}
		});
	});
	$('.change_address').on("click",function(){
		$(this).closest('.item_kitchen').find('.text_address').addClass('hide');
		$(this).closest('.item_kitchen').find('.input_address').removeClass('hide');
	});
});
//--></script>
<?php echo $footer; ?>