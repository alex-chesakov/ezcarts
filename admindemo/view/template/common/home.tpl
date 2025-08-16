<?php echo $header; ?>

  
<h2 class="text-3xl font-bold tracking-tight mb-2"><?php echo $heading_title; ?></h2>
<p class="text-muted-foreground mb-6"><?php echo $text_overview; ?></p>

<?php if(empty($panel)){?>
<div class="space-y-6">
	<div class="flex justify-between items-center mb-4">
		<h3 class="text-xl font-semibold">Number of Orders</h3>
		<div class="dropdown_group">
			<button type="button" role="combobox" aria-controls="radix-:r0:" aria-expanded="false" aria-autocomplete="none" dir="ltr" data-state="closed" class="flex h-10 items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1 w-[180px]">
				<span style="">Lifetime</span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50" aria-hidden="true"><path d="m6 9 6 6 6-6"></path></svg>
			</button>
			<div class="dropdown">
				<label><input type="radio" name="period" value="" <?php if(empty($period)){ echo 'checked';};?>><span></span><div class="title_drop">All</div></label>
				<label><input type="radio" name="period" value="day" <?php if(!empty($period) and $period=='day'){ echo 'checked';};?>><span></span><div class="title_drop"><?php echo $text_day; ?></div></label>
				<label><input type="radio" name="period" value="week" <?php if(!empty($period) and $period=='week'){ echo 'checked';};?>><span></span><div class="title_drop"><?php echo $text_week; ?></div></label>
				<label><input type="radio" name="period" value="month" <?php if(!empty($period) and $period=='month'){ echo 'checked';};?>><span></span><div class="title_drop"><?php echo $text_month; ?></div></label>
				<label><input type="radio" name="period" value="year" <?php if(!empty($period) and $period=='year'){ echo 'checked';};?>><span></span><div class="title_drop"><?php echo $text_year; ?></div></label>
			</div>
		</div>
	</div>
	<div class="grid grid-cols-1 gap-4 md:grid-cols-3" id="load1">
		<?php foreach($orders_location as $key=>$row){ ?>
			<div class="border text-card-foreground bg-white rounded-xl shadow-sm hover:shadow-md transition-shadow">
				<div class="p-6 flex flex-row items-center justify-between space-y-0 pb-2">
					<h3 class="tracking-tight text-sm font-medium"><?php echo $key;?></h3>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-map-pin h-4 w-4 text-primary"><path d="M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0"></path><circle cx="12" cy="10" r="3"></circle></svg>
				</div>
				<div class="p-6 pt-0"><div class="text-2xl font-bold"><?php echo $row;?></div><p class="text-xs text-muted-foreground mt-1"><?php echo $text_total_sale; ?></p></div>
			</div>
		<?php };?>
		
	</div>

	<?php if ($error_image) { ?>
		<div class="warning"><?php echo $error_image; ?></div>
	<?php } ?>
	<?php if ($error_image_cache) { ?>
		<div class="warning"><?php echo $error_image_cache; ?></div>
	<?php } ?>
	<?php if ($error_cache) { ?>
		<div class="warning"><?php echo $error_cache; ?></div>
	<?php } ?>
	<?php if ($error_logs) { ?>
		<div class="warning"><?php echo $error_logs; ?></div>
	<?php } ?>
</div>

<!--[if IE]>
<script type="text/javascript" src="view/javascript/jquery/flot/excanvas.js"></script>
<![endif]--> 

<script type="text/javascript"><!--

$(document).ready(function() {
	$('.dropdown_group input[type=radio]').live("click",function(){
		var period = $(this).val();
		$(this).closest('.dropdown_group').find('button').html($(this).parent().find('.title_drop').html());
		link_load = 'index.php?route=common/home&period=' + period + '&token=<?php echo $token;?> #load1 > *';
		$('#load1').load(link_load,function(){
			history.pushState(null, null, 'index.php?route=common/home&period=' + period + '&token=<?php echo $token;?>');
		});
	});
	<?php if(!empty($period)){ ?>
		$('.dropdown_group input[type=radio]:checked').closest('.dropdown_group').find('button').html($('.dropdown_group input[type=radio]:checked').parent().find('.title_drop').html());
	<?php };?>
});
//--></script> 
<?php }else{ ?>
<div class="grid gap-4 md:grid-cols-2">
	<div class="rounded-lg border bg-card text-card-foreground shadow-sm" id="order_pro_time">
		<div class="p-6 flex flex-row items-center justify-between space-y-0 pb-2">
			<div class="space-y-1">
				<h3 class="tracking-tight text-sm font-medium">Order Processing Time</h3>
				
				<div class="dropdown_group">
					<button type="button" role="combobox" aria-controls="radix-:r0:" aria-expanded="false" aria-autocomplete="none" dir="ltr" data-state="closed" class="flex h-10 items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1 w-[180px]">
						<span style="">Lifetime</span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50" aria-hidden="true"><path d="m6 9 6 6 6-6"></path></svg>
					</button>
					<div class="dropdown">
						<label><input type="radio" name="period" value="" <?php if(empty($period)){ echo 'checked';};?>><span></span><div class="title_drop">All</div></label>
						<label><input type="radio" name="period" value="day" <?php if(!empty($period) and $period=='day'){ echo 'checked';};?>><span></span><div class="title_drop"><?php echo $text_day; ?></div></label>
						<label><input type="radio" name="period" value="week" <?php if(!empty($period) and $period=='week'){ echo 'checked';};?>><span></span><div class="title_drop"><?php echo $text_week; ?></div></label>
						<label><input type="radio" name="period" value="month" <?php if(!empty($period) and $period=='month'){ echo 'checked';};?>><span></span><div class="title_drop"><?php echo $text_month; ?></div></label>
						<label><input type="radio" name="period" value="year" <?php if(!empty($period) and $period=='year'){ echo 'checked';};?>><span></span><div class="title_drop"><?php echo $text_year; ?></div></label>
					</div>
				</div>
				
			</div>
			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-clock h-4 w-4 text-muted-foreground"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
		</div>
		
		<div class="p-6 pt-0 order_pro_time">
			<div class="text-2xl font-bold"><?php if(!empty($p_orders1)){ echo $p_orders1; }else{ ?>N/A<?php };?></div>
		</div>
	</div>
	
	<div class="rounded-lg border bg-card text-card-foreground shadow-sm" id="order_compl_time">
		<div class="p-6 flex flex-row items-center justify-between space-y-0 pb-2">
			<div class="space-y-1">
				<h3 class="tracking-tight text-sm font-medium">Completed Orders</h3>
				
				<div class="dropdown_group">
					<button type="button" role="combobox" aria-controls="radix-:r0:" aria-expanded="false" aria-autocomplete="none" dir="ltr" data-state="closed" class="flex h-10 items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1 w-[180px]">
						<span style="">Lifetime</span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50" aria-hidden="true"><path d="m6 9 6 6 6-6"></path></svg>
					</button>
					<div class="dropdown">
						<label><input type="radio" name="period2" value="" <?php if(empty($period)){ echo 'checked';};?>><span></span><div class="title_drop">All</div></label>
						<label><input type="radio" name="period2" value="day" <?php if(!empty($period) and $period=='day'){ echo 'checked';};?>><span></span><div class="title_drop"><?php echo $text_day; ?></div></label>
						<label><input type="radio" name="period2" value="week" <?php if(!empty($period) and $period=='week'){ echo 'checked';};?>><span></span><div class="title_drop"><?php echo $text_week; ?></div></label>
						<label><input type="radio" name="period2" value="month" <?php if(!empty($period) and $period=='month'){ echo 'checked';};?>><span></span><div class="title_drop"><?php echo $text_month; ?></div></label>
						<label><input type="radio" name="period2" value="year" <?php if(!empty($period) and $period=='year'){ echo 'checked';};?>><span></span><div class="title_drop"><?php echo $text_year; ?></div></label>
					</div>
				</div>
			</div>
			
			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-circle-check-big h-4 w-4 text-muted-foreground"><path d="M21.801 10A10 10 0 1 1 17 3.335"></path><path d="m9 11 3 3L22 4"></path></svg>
		</div>
		
		<div class="p-6 pt-0 order_compl_time">
			<div class="text-2xl font-bold"><?php echo $p_orders2;?></div>
		</div>
	</div>
</div>
<script type="text/javascript"><!--

$(document).ready(function() {
	$('#order_pro_time .dropdown_group input[type=radio]').live("click",function(){
		var period = $(this).val();
		$(this).closest('.dropdown_group').find('button').html($(this).parent().find('.title_drop').html());
		link_load = 'index.php?route=common/home&period=' + period + '&token=<?php echo $token;?> #order_pro_time .order_pro_time > *';
		$('#order_pro_time .order_pro_time').load(link_load,function(){
			history.pushState(null, null, 'index.php?route=common/home&period=' + period + '&token=<?php echo $token;?>');
		});
	});
	$('#order_compl_time .dropdown_group input[type=radio]').live("click",function(){
		var period2 = $(this).val();
		$(this).closest('.dropdown_group').find('button').html($(this).parent().find('.title_drop').html());
		link_load = 'index.php?route=common/home&period2=' + period2 + '&token=<?php echo $token;?> #order_compl_time .order_compl_time > *';
		$('#order_compl_time .order_compl_time').load(link_load,function(){
			history.pushState(null, null, 'index.php?route=common/home&period2=' + period2 + '&token=<?php echo $token;?>');
		});
	});
	<?php if(!empty($period)){ ?>
		$('.dropdown_group input[type=radio]:checked').closest('.dropdown_group').find('button').html($('.dropdown_group input[type=radio]:checked').parent().find('.title_drop').html());
	<?php };?>
});
//--></script> 
<?php };?>
<?php echo $footer; ?>