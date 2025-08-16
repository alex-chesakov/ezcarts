<?php echo $header; ?>
<div id="content">

	<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>
	<div class="box">
		<div class="heading">
			<h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
			<div class="buttons">
				<a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
				<a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a>
			</div>
		</div>

		<div class="content">
			<div id="tabs" class="htabs">
				<a href="#tab-general"><?php echo $tab_general; ?></a>
				<a href="#tab-data"><?php echo $tab_data; ?></a>
				<a href="#tab-image"><?php echo $tab_image; ?></a>
			</div>
			
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
				<div id="tab-general">
					<table class="form">
						<tr>
							<td><span class="required">*</span> <?php echo $entry_name; ?></td>
							<td><input type="text" name="name" size="100" value="<?php echo $name; ?>" />
							<?php if (isset($error_name)) { ?>
								<span class="error"><?php echo $error_name; ?></span>
							<?php } ?></td>
						</tr>
						<tr>
							<td><?php echo $entry_description; ?></td>
							<td><textarea name="description" id="description"><?php echo $description; ?></textarea></td>
						</tr>
						<tr>
							<td><?php echo $entry_keyword; ?></td>
							<td><input type="text" name="keyword" value="<?php echo $keyword; ?>" /></td>
						</tr>
					</table>
				</div>

				<div id="tab-data">
					<table class="form">
						<tr>
							<td><?php echo $entry_category; ?></td>
							<td>
								<input type="text" name="category" value="" />
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>
								<div id="product-category" class="scrollbox">
									<div id="product-category<?php echo $category_id; ?>" class="odd"><?php echo $category_name; ?><img src="view/image/delete.png" alt="" />
										<input type="hidden" name="product_category" value="<?php echo $category_id; ?>" />
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td><?php echo $entry_upc; ?></td><td><input type="text" name="upc" value="<?php echo $upc; ?>" /></td>
						</tr>
						<tr>
							<td><?php echo $entry_item; ?></td><td><input type="text" name="item" value="<?php echo $item; ?>" /></td>
						</tr>
						<tr>
							<td><?php echo $entry_bin; ?></td><td><input type="text" name="bin" value="<?php echo $bin; ?>" /></td>
						</tr>
						<tr>
							<td><?php echo $entry_units; ?></td><td><input type="text" name="units" value="<?php echo $units; ?>" /></td>
						</tr>
						<tr>
							<td><?php echo $entry_location; ?></td><td><input type="text" name="location" value="<?php echo $location; ?>" /></td>
						</tr>
						<tr>
							<td><?php echo $entry_price_case; ?></td><td><input type="text" name="case_price" value="<?php echo $case_price; ?>" /></td>
						</tr>
						<tr>
							<td><?php echo $entry_price_unit; ?></td><td><input type="text" name="unit_price" value="<?php echo $unit_price; ?>" /></td>
						</tr>

						<tr>
							<td><?php echo $entry_weight_unit; ?></td><td><input type="text" name="unit_weight" value="<?php echo $unit_weight; ?>" /></td>
						</tr>
						<tr>
							<td><?php echo $entry_weight_case; ?></td><td><input type="text" name="case_weight" value="<?php echo $case_weight; ?>" /></td>
						</tr>

						<tr>
							<td><?php echo $entry_rating; ?></td><td><input type="text" name="rating" value="<?php echo $rating; ?>" /></td>
						</tr>
						<tr>
							<td><?php echo $entry_votes; ?></td><td><input type="text" name="votes" value="<?php echo $votes; ?>" /></td>
						</tr>
						<tr>
							<td><?php echo $entry_merchants; ?></td><td><input type="text" name="merchants" value="<?php echo $merchants; ?>" /></td>
						</tr>
						<tr>
							<td><?php echo $entry_status; ?></td>
							<td>
								<select name="status">
									<?php if ($status) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<option value="0"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
									<?php } ?>
								</select>
							</td>
						</tr>
					</table>
				</div>
			
				<div id="tab-image">
					<table class="form">
						<tr>
							<td><?php echo $entry_image; ?></td>
							<td>
								<div class="image">
									<img src="<?php echo $thumb; ?>" alt="" id="thumb" /><br />
									<input type="hidden" name="image" value="<?php echo $image; ?>" id="image" />
									<a onclick="image_upload('image', 'thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"><?php echo $text_clear; ?></a>
								</div>
							</td>
						</tr>
					</table>
					<table id="images" class="list">
						<thead>
							<tr>
								<td class="left"><?php echo $entry_image; ?></td>
								<td class="right"><?php echo $entry_sort_order; ?></td>
								<td></td>
							</tr>
						</thead>
						<?php $image_row = 0; ?>
						<?php foreach ($product_images as $product_image) { ?>
							<tbody id="image-row<?php echo $image_row; ?>">
								<tr>
									<td class="left"><div class="image"><img src="<?php echo $product_image['thumb']; ?>" alt="" id="thumb<?php echo $image_row; ?>" />
										<input type="hidden" name="product_image[<?php echo $image_row; ?>][image]" value="<?php echo $product_image['image']; ?>" id="image<?php echo $image_row; ?>" />
										<br />
										<a onclick="image_upload('image<?php echo $image_row; ?>', 'thumb<?php echo $image_row; ?>');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb<?php echo $image_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $image_row; ?>').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
									<td class="right"><input type="text" name="product_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $product_image['sort_order']; ?>" size="2" /></td>
									<td class="left"><a onclick="$('#image-row<?php echo $image_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
								</tr>
							</tbody>
							<?php $image_row++; ?>
						<?php } ?>
						<tfoot>
							<tr>
								<td colspan="2"></td>
								<td class="left"><a onclick="addImage();" class="button"><?php echo $button_add_image; ?></a></td>
							</tr>
						</tfoot>
					</table>
				</div>
			
			</form>
		</div>
	</div>
</div>

<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--

CKEDITOR.replace('description', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});

//--></script>

<script type="text/javascript"><!--
$.widget('custom.catcomplete', $.ui.autocomplete, {
	_renderMenu: function(ul, items) {
		var self = this, currentCategory = '';
		$.each(items, function(index, item) {
			if (item.category != currentCategory) {
				ul.append('<li class="ui-autocomplete-category">' + item.category + '</li>');
				currentCategory = item.category;
			}
			self._renderItem(ul, item);
		});
	}
});
// Category
$('input[name=\'category\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.category_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('#product-category' + ui.item.value).remove();
		$('#product-category').html('<div id="product-category' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="product_category" value="' + ui.item.value + '" /></div>');
		$('#product-category div:odd').attr('class', 'odd');
		$('#product-category div:even').attr('class', 'even');
		return false;
	},
	focus: function(event, ui) {
      return false;
   }
});

$('#product-category div img').live('click', function() {
	$(this).parent().remove();
	
	$('#product-category div:odd').attr('class', 'odd');
	$('#product-category div:even').attr('class', 'even');	
});

//--></script>
 
<script type="text/javascript"><!--
function image_upload(field, thumb) {
	$('#dialog').remove();
	
	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');
	
	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(text) {
						$('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},	
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
//--></script> 
<script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
    html  = '<tbody id="image-row' + image_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb' + image_row + '" /><input type="hidden" name="product_image[' + image_row + '][image]" value="" id="image' + image_row + '" /><br /><a onclick="image_upload(\'image' + image_row + '\', \'thumb' + image_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + image_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + image_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
	html += '    <td class="right"><input type="text" name="product_image[' + image_row + '][sort_order]" value="" size="2" /></td>';
	html += '    <td class="left"><a onclick="$(\'#image-row' + image_row  + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#images tfoot').before(html);
	
	image_row++;
}
//--></script> 
<script type="text/javascript" src="view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$('.date').datepicker({dateFormat: 'yy-mm-dd'});
$('.datetime').datetimepicker({
	dateFormat: 'yy-mm-dd',
	timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
//--></script>
<?php echo $footer; ?>