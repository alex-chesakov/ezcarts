<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>

<?php if ($payment_methods) { ?>
<h2 class="text-lg font-semibold mb-4"><?php echo $text_payment_method; ?></h2>
<?php /*<p><?php echo $text_payment_method; ?></p>*/	?>

<div class="relative payment_m_select_block">
	<button type="button" role="combobox" aria-controls="radix-:rf:" aria-expanded="false" aria-autocomplete="none" dir="ltr" data-state="closed" data-placeholder="" class="flex h-10 w-full items-center justify-between rounded-md border border-input bg-white px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1 payment_m_button"><?php $text = 'Select payment method';
	foreach ($payment_methods as $payment_method) { 
		if ($payment_method['code'] == $code and !empty($code)) { 
			$text = $payment_method['title'];break;
		}; 
	};echo $text; ?></span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50"><path d="m6 9 6 6 6-6"></path></svg>
	</button>
	<div class="dropdown sel_payment_m">
		<?php foreach ($payment_methods as $payment_method) { ?>
			<?php if(!empty($payment_method['code'])){ ?>
				<label>
					<input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" <?php if ($payment_method['code'] == $code and !empty($code)) { ?> checked="checked" <?php };?> class="p_m<?php echo $payment_method['code']; ?>"/>
					<span></span><div class="name_code"><?php echo $payment_method['title']; ?></div>
				</label>
			<?php }else{ ?>
				<a href="/index.php?route=profile">
					<span></span><div class="name_code"><?php echo $payment_method['title']; ?></div>
				</a>
			<?php };?>
		<?php } ?>
	</div>
</div>
<?php } ?>

<?php /*if ($text_agree) { ?>
<div class="buttons">
  <div class="right"><?php echo $text_agree; ?>
    <?php if ($agree) { ?>
    <input type="checkbox" name="agree" value="1" checked="checked" />
    <?php } else { ?>
    <input type="checkbox" name="agree" value="1" />
    <?php } ?>
    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" class="button" />
  </div>
</div>
<?php } else { ?>
<div class="buttons">
  <div class="right">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" class="button" />
  </div>
</div>
<?php }*/ ?>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.payment_m_select_block label input[type=radio]').live("change",function(){
		txt = $(this).closest('label').find('.name_code').html();
		$(this).closest('.payment_m_select_block').find('.payment_m_button').html(txt + '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50"><path d="m6 9 6 6 6-6"></path></svg>');
		$('.sel_payment_m.open').removeClass('open');
	});
	
});
//--></script>
