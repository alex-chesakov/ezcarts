<?php echo $header; ?>

<div class="space-y-6 grid_block" id="change_view_block">
	<div class="flex justify-between items-center">
		<h1 class="text-2xl font-bold"><?php echo $heading_title; ?></h1>
		<div class="flex gap-2 change_view">
			<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 h-10 w-10 bg-primary text-primary-foreground hover:bg-primary/90 grid_view"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-grid3x3 h-4 w-4"><rect width="18" height="18" x="3" y="3" rx="2"></rect><path d="M3 9h18"></path><path d="M3 15h18"></path><path d="M9 3v18"></path><path d="M15 3v18"></path></svg></button>
			<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 h-10 w-10 border border-input bg-background hover:bg-accent hover:text-accent-foreground list_view"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-list h-4 w-4"><path d="M3 12h.01"></path><path d="M3 18h.01"></path><path d="M3 6h.01"></path><path d="M8 12h13"></path><path d="M8 18h13"></path><path d="M8 6h13"></path></svg></button>
		</div>
	</div>
	<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>
	<?php if ($success) { ?>
		<div class="success"><?php echo $success; ?></div>
	<?php } ?>
  
	<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6" id="grid_block">

		<?php if ($products) { ?>
			<?php foreach ($products as $product) { ?>
				<div class="rounded-lg border bg-card text-card-foreground shadow-sm hover:shadow-lg transition-shadow">
					<div class="flex flex-col space-y-1.5 p-6">
						<div class="w-full h-48 overflow-hidden rounded-t-lg">
							<img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" class="w-full h-full object-cover">
						</div>
						<h3 class="text-2xl font-normal leading-none tracking-tight mt-4">
							<?php echo $product['name']; ?></h3>
					</div>
					<div class="p-6 pt-0">
						<div class="space-y-2">
							<p class="text-sm text-gray-600 line-clamp-2">
								<?php if(!empty($product['description']) and !empty(strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8')))){ ?>
									<?php echo utf8_substr(strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8')), 0, 220) . '..'; ?>
								<?php };?>
							</p>
							<div class="flex justify-between items-center">
								<?php if(!empty($product['unit_price'])){ ?><span class="text-lg font-bold">$<?php echo number_format((float)$product['unit_price'],2); ?></span><?php };?>
								<span class="text-sm text-gray-500">Stock: <?php echo $product['units']; ?></span>
							</div>
							<div class="flex justify-between items-center">
								<?php if(!empty($product['case_price'])){ ?><span class="text-lg font-bold">$<?php echo number_format((float)$product['case_price'],2); ?></span><?php };?>
								<span class="text-sm text-gray-500"></span>
							</div>
							<div class="flex items-center gap-2">
<?php /*								<span class="text-sm text-gray-500">Rating: <?php echo $product['rating']; ?>/5</span>*/	?>
								<span class="text-sm text-gray-500">Category: <a href="<?php echo $product['category_href'];?>"><?php echo $product['category_name'];?></a></span>
							</div>
							<?php /*
							<div class="flex items-center gap-2">
								<?php foreach ($product['action'] as $action) { ?>
									<span class="text-sm text-gray-500">[ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]</span>
								<?php } ?>
							</div>
							*/	?>
						</div>
					</div>
				</div>
			<?php } ?>
		<?php };?>
	</div>
	
<div class="rounded-md border" id="list_block">
	<div class="relative w-full overflow-auto">
		<?php if ($products) { ?>
			<table class="w-full caption-bottom text-sm">
				<thead class="[&amp;_tr]:border-b">
					<tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
						<th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Product</th>
						<th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Category</th>
						<th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Price</th>
						<th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Stock</th>
<?php /*						<th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Rating</th>*/	?>
<?php /*						<th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Action</th>*/	?>
					</tr>
				</thead>
				
				<tbody class="[&amp;_tr:last-child]:border-0">
					<?php foreach ($products as $product) { ?>
					<tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
						<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 font-medium">
							<div class="flex items-center gap-4">
								<img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" class="w-12 h-12 object-cover rounded">
								<div>
									<p class="font-medium"><?php echo $product['name']; ?></p>
<p class="text-sm text-gray-500 line-clamp-1"><?php if(!empty($product['description']) and !empty(strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8')))){ ?><?php echo utf8_substr(strip_tags(html_entity_decode($product['description'], ENT_QUOTES, 'UTF-8')), 0, 220) . '..'; ?><?php };?></p>
								</div>
							</div>
						</td>
						<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0"><a href="<?php echo $product['category_href'];?>"><?php echo $product['category_name'];?></a></td>
<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
<?php if(!empty($product['unit_price'])){ ?>$<?php echo number_format((float)$product['unit_price'],2); ?>/unit<?php if(!empty($product['case_price'])){ ?>, <?php };?><?php };?> <?php if(!empty($product['case_price'])){ ?>$<?php echo number_format((float)$product['case_price'],2); ?>/case<?php };?></td>
						<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0"><?php echo $product['units']; ?></td>
<?php /*						<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0"><?php echo $product['rating']; ?>/5</td>*/	?>
<?php /*						<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
														<?php foreach ($product['action'] as $action) { ?>
									<span class="text-sm text-gray-500">[ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]</span>
								<?php } ?>
						</td>*/	?>
					</tr>
					<?php };?>
				</tbody>
			</table>
		<?php };?>
	</div>
</div>
	
</div>
<div class="pagination"><?php echo $pagination; ?></div>
<script type="text/javascript" src="view/javascript/jquery.total-storage.min.js"></script> 

<script type="text/javascript"><!--
$(document).ready(function() {
	$('.change_view button').on("click",function(){
		$('.change_view button').removeClass('bg-primary text-primary-foreground hover:bg-primary/90');
		$('.change_view button').addClass('border border-input bg-background hover:bg-accent hover:text-accent-foreground');
		if($(this).hasClass("grid_view")) {
			$('#change_view_block').removeClass('list_block');
			$('#change_view_block').addClass('grid_block');

			$.totalStorage('view_status', 'grid'); 
		}else{
			$('#change_view_block').removeClass('grid_block');
			$('#change_view_block').addClass('list_block');

			$.totalStorage('view_status', 'list'); 
		}
		$(this).addClass('bg-primary text-primary-foreground hover:bg-primary/90');
		$(this).removeClass('border border-input bg-background hover:bg-accent hover:text-accent-foreground');
	});
	
	view_status = $.totalStorage('view_status');
	if(view_status == 'list'){
		$('.change_view button.list_view').trigger('click');
	}else{
		$('.change_view button.grid_view').trigger('click');
	}
	
});
//--></script> 
<script type="text/javascript"><!--

//--></script> 
<?php echo $footer; ?>