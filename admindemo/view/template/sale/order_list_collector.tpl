<?php echo $header; ?>

<div class="space-y-6">
	<div class="flex justify-between items-center">
		<h1 class="text-2xl font-bold"><?php echo $heading_title;?></h1>
	</div>
	
<div class="rounded-lg border bg-card text-card-foreground shadow-sm mb-6">
	<div class="p-6 pt-6">
		<div class="flex gap-4 filter_block collector_filter_order_list">
			<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 reset">All Orders</button>
			
			<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 to_filter_delivery_date" data-dated="<?php echo date('Y-m-d');?>">Today</button>
			
			<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 to_filter_delivery_date" data-dated="<?php echo date('Y-m-d',strtotime('+1 day'));?>">Tomorrow</button>
<?php /*
			<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-[40px] p-0" type="button" aria-haspopup="dialog" aria-expanded="false" aria-controls="radix-:r0:" data-state="closed">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-calendar h-4 w-4"><path d="M8 2v4"></path><path d="M16 2v4"></path><rect width="18" height="18" x="3" y="4" rx="2"></rect><path d="M3 10h18"></path></svg>
			</button>
*/	?>
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
										<td class="p-4 align-middle [&amp;:has([role=checkbox])]:pr-0"><?php echo $order['user'];?></td>
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

function filter() {
	
	url = 'index.php?route=sale/ordercollector&token=<?php echo $token; ?>';

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

$(document).ready(function() {
	$('.filter_block .to_filter_delivery_date').live("click",function(){
		if($(this).attr('data-dated')){
			$('.filter_delivery_date').val($(this).attr('data-dated'));
			filter();
		}
	});
	$('.filter_block .reset').live("click",function(){
		$('.filter_delivery_date').val('');
		filter();
	});
});
//--></script> 
 
<script type="text/javascript"><!--

//--></script> 
<script type="text/javascript"><!--



//--></script>

<?php echo $footer; ?>