<?php echo $header; ?>

<div class="space-y-6">
	<div class="flex justify-between items-center">
		<h1 class="text-2xl font-bold"><?php echo $heading_title;?></h1>
	</div>
	<div class="rounded-lg border bg-card text-card-foreground shadow-sm mb-6 filter_block">
		<div class="p-6 pt-6">
			<div class="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
				<div class="relative">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search absolute left-2 top-2.5 h-4 w-4 text-muted-foreground"><circle cx="11" cy="11" r="8"></circle><path d="m21 21-4.3-4.3"></path></svg>
					<input name="search_order" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm pl-8" placeholder="Search orders..." value="<?php if(!empty($filter_name)){ echo $filter_name;}?>" id="search_order">
				</div>
<?php if(!empty($locations)){ ?>
	<div class="dropdown_group">
		<button type="button" role="combobox" aria-controls="radix-:r3t:" aria-expanded="false" aria-autocomplete="none" dir="ltr" data-state="closed" data-placeholder="" class="flex h-10 w-full items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1"><span style="pointer-events: none;">Location</span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50" aria-hidden="true"><path d="m6 9 6 6 6-6"></path></svg></button>

		<div class="dropdown">
			<label><input type="radio" name="location" value=""><span></span><div class="title_drop">All</div></label>
			<?php foreach($locations as $location){ ?>
			<label><input type="radio" name="location" value="<?php echo $location;?>"><span></span><div class="title_drop"><?php echo $location;?></div></label>
			<?php };?>
		</div>
	</div>
<?php };?>
<?php if(!empty($collectors)){ ?>
	<div class="dropdown_group">
		<button type="button" role="combobox" aria-controls="radix-:r3u:" aria-expanded="false" aria-autocomplete="none" dir="ltr" data-state="closed" data-placeholder="" class="flex h-10 w-full items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1"><span style="pointer-events: none;">Collector</span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50" aria-hidden="true"><path d="m6 9 6 6 6-6"></path></svg></button>

		<div class="dropdown">
			<label><input type="radio" name="user_id" value=""><span></span><div class="title_drop">All</div></label>
			<?php foreach($collectors as $collector){ ?>
			<label><input type="radio" name="user_id" value="<?php echo $collector['user_id'];?>"><span></span><div class="title_drop"><?php echo $collector['firstname'];?></div></label>
			<?php };?>
		</div>
	</div>
<?php };?>

<?php if(!empty($order_status)){ ?>
	<div class="dropdown_group">
		<button type="button" role="combobox" aria-controls="radix-:r3v:" aria-expanded="false" aria-autocomplete="none" dir="ltr" data-state="closed" data-placeholder="" class="flex h-10 w-full items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1"><span style="pointer-events: none;">Status</span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50" aria-hidden="true"><path d="m6 9 6 6 6-6"></path></svg></button>

		<div class="dropdown">
			<label><input type="radio" name="order_status_id" value=""><span></span><div class="title_drop">All</div></label>
			<?php foreach($order_status as $order_stat){ ?>
			<label><input type="radio" name="order_status_id" value="<?php echo $order_stat['order_status_id'];?>"><span></span><div class="title_drop"><?php echo $order_stat['name'];?></div></label>
			<?php };?>
		</div>
	</div>
<?php };?>
				
<?php if(!empty($payment_status)){ ?>
	<div class="dropdown_group">
		<button type="button" role="combobox" aria-controls="radix-:r40:" aria-expanded="false" aria-autocomplete="none" dir="ltr" data-state="closed" data-placeholder="" class="flex h-10 w-full items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1"><span style="pointer-events: none;">Payment Status</span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50" aria-hidden="true"><path d="m6 9 6 6 6-6"></path></svg></button>

		<div class="dropdown">
			<label><input type="radio" name="payment_status_id" value=""><span></span><div class="title_drop">All</div></label>
			<?php foreach($payment_status as $payment_stat){ ?>
			<label><input type="radio" name="payment_status_id" value="<?php echo $payment_stat['payment_status_id'];?>"><span></span><div class="title_drop"><?php echo $payment_stat['payment_status'];?></div></label>
			<?php };?>
		</div>
	</div>
<?php };?>

				<input type="text" name="order_date" value="" placeholder="Order Date" class="inline-flex items-center gap-2 whitespace-nowrap rounded-md text-sm ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 w-full justify-start text-left font-normal filter_order_date"/>

				<input type="text" name="delivery_date" value="" placeholder="Delivery Date" class="inline-flex items-center gap-2 whitespace-nowrap rounded-md text-sm ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 w-full justify-start text-left font-normal filter_delivery_date"/>
			</div>
		</div>
	</div>
	
	<div class="rounded-lg border bg-card text-card-foreground shadow-sm">
		<div class="flex flex-col space-y-1.5 p-6"><h3 class="text-2xl font-semibold leading-none tracking-tight">Recent Orders</h3></div>
		<div class="p-6 pt-0" id="loader">
			<div class="overflow-x-auto">
				<div class="relative w-full overflow-auto">
				
					<table class="w-full caption-bottom text-sm">
						<thead class="[&amp;_tr]:border-b">
							<tr class="border-b transition-colors hover:bg-muted/50 data-[state=selected]:bg-muted">
								<th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Order ID</th>
								<th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Customer</th>
								<th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Date</th>
								<th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Status</th>
								<th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Payment Status</th>
								<th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Total</th>
								<th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Items</th>
								<th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Location</th>
								<th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Collector</th>
								<th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Delivery Date</th>
								<th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Time Window</th>
<?php /*								<th class="h-12 px-4 text-left align-middle font-medium text-muted-foreground [&amp;:has([role=checkbox])]:pr-0">Action</th>*/	?>
							</tr>
						</thead>
						
						<tbody class="[&amp;_tr:last-child]:border-0">
							<?php if ($orders) { ?>
								<?php foreach ($orders as $order) { ?>
					
									<tr class="border-b transition-colors data-[state=selected]:bg-muted cursor-pointer hover:bg-gray-50" onclick="location.href='<?php echo $order['href']; ?>'">
										<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0 font-medium">
											<?php /*if ($order['selected']) { ?>
												<input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
											<?php } else { ?>
												<input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
											<?php }*/ ?>
											ORD-<?php echo $order['order_id']; ?>
										</td>
										<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0"><?php echo $order['customer']; ?></td>
										<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0"><?php echo $order['date_added']; ?></td>
										<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">
											<div class="inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 border-transparent hover:bg-yellow-600 order_status<?php echo $order['order_status_id'];?>"><?php echo $order['status']; ?></div>
										</td>
										<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0"><?php echo $order['payment_status'];?></td>
										<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0">$<?php echo $order['total']; ?></td>
										<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0"><?php echo $order['count']; ?></td>
										<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0"><?php echo $order['location']; ?></td>
<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0"></td>
										<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0"><?php echo $order['date_shipping'];?></td>
										<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0"><?php echo $order['time_shipping'];?></td>
<?php /*<td class="right">
											<?php foreach ($order['action'] as $action) { ?>
												[ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
											<?php } ?>
										</td>*/	?>
									</tr>
								<?php } ?>
							<?php } else { ?>
								<tr>
								  <td class="center" colspan="11"><?php echo $text_no_results; ?></td>
								</tr>
							<?php } ?>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

<?php /*
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/order.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').attr('action', '<?php echo $invoice; ?>'); $('#form').attr('target', '_blank'); $('#form').submit();" class="button"><?php echo $button_invoice; ?></a><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('#form').attr('action', '<?php echo $delete; ?>'); $('#form').attr('target', '_self'); $('#form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="content">
      <form action="" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="right"><?php if ($sort == 'o.order_id') { ?>
                <a href="<?php echo $sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_order_id; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_order; ?>"><?php echo $column_order_id; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'customer') { ?>
                <a href="<?php echo $sort_customer; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_customer; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_customer; ?>"><?php echo $column_customer; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'status') { ?>
                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                <?php } ?></td>
              <td class="right"><?php if ($sort == 'o.total') { ?>
                <a href="<?php echo $sort_total; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_total; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_total; ?>"><?php echo $column_total; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'o.date_added') { ?>
                <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'o.date_modified') { ?>
                <a href="<?php echo $sort_date_modified; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_modified; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_date_modified; ?>"><?php echo $column_date_modified; ?></a>
                <?php } ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <tr class="filter">
              <td></td>
              <td align="right"><input type="text" name="filter_order_id" value="<?php echo $filter_order_id; ?>" size="4" style="text-align: right;" /></td>
              <td><input type="text" name="filter_customer" value="<?php echo $filter_customer; ?>" /></td>
              <td><select name="filter_order_status_id">
                  <option value="*"></option>
                  <?php if ($filter_order_status_id == '0') { ?>
                  <option value="0" selected="selected"><?php echo $text_missing; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_missing; ?></option>
                  <?php } ?>
                  <?php foreach ($order_statuses as $order_status) { ?>
                  <?php if ($order_status['order_status_id'] == $filter_order_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td align="right"><input type="text" name="filter_total" value="<?php echo $filter_total; ?>" size="4" style="text-align: right;" /></td>
              <td><input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" size="12" class="date" /></td>
              <td><input type="text" name="filter_date_modified" value="<?php echo $filter_date_modified; ?>" size="12" class="date" /></td>
              <td align="right"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>
            </tr>

          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>

*/
?>
<script type="text/javascript"><!--
$('.filter_block input').live("change",function(){
	filter();
});
var time_keyup;
$(document).ready(function() {
	
	$('#search_order').live("keyup",function(){
		clearTimeout(time_keyup);

		if($(this).val().length > 1){
			time_keyup = setTimeout( function(){ 
				filter();
			},1500);
		}else if($(this).val().length == 0){
			time_keyup = setTimeout( function(){ 
				filter();
			},1500);
		}
	});

});
function filter() {
	
	url = 'index.php?route=sale/order&token=<?php echo $token; ?>';	
	
	var filter_name = $('#search_order').attr('value');
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}
	var filter_location = $('input[name=\'location\']:checked').attr('value');
	if (filter_location) {
		url += '&location=' + encodeURIComponent(filter_location);
	}
	var filter_customer = $('input[name=\'user_id\']:checked').attr('value');
	if (filter_customer) {
		url += '&user_id=' + encodeURIComponent(filter_customer);
	}
	var filter_order_status_id = $('input[name=\'order_status_id\']:checked').attr('value');
	if (filter_order_status_id) {
		url += '&filter_order_status_id=' + encodeURIComponent(filter_order_status_id);
	}
	var filter_payment_status_id = $('input[name=\'payment_status_id\']:checked').attr('value');
	if (filter_payment_status_id) {
		url += '&filter_payment_status_id=' + encodeURIComponent(filter_payment_status_id);
	}
	var filter_order_date = $('input[name=\'order_date\']').attr('value');
	if (filter_order_date) {
		url += '&filter_order_date=' + encodeURIComponent(filter_order_date);
	}
	var filter_delivery_date = $('input[name=\'delivery_date\']').attr('value');
	if (filter_delivery_date) {
		url += '&filter_delivery_date=' + encodeURIComponent(filter_delivery_date);
	}
	
	$('#loader').load(url + ' #loader > *');
	history.pushState(null, null, url);
}
//--></script>
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$('.filter_order_date').datepicker({dateFormat: 'yy-mm-dd'});
$('.filter_delivery_date').datepicker({dateFormat: 'yy-mm-dd'});

//--></script> 
 
<script type="text/javascript"><!--

//--></script> 
<script type="text/javascript"><!--



//--></script>

<?php echo $footer; ?>