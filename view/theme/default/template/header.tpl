<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="/view/theme/default/stylesheet/stylesheet.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="/view/javascript/common.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body>
<div id="root">
	
	<div class="<?php echo $class_body;?>">
<?php /*	type header 1 => not auth */	?>
		<?php if(!empty($type_header) and $type_header==1){ ?>
			<nav class="fixed top-0 left-0 right-0 z-50 bg-white backdrop-blur-md border-b border-gray-100">
				<div class="container mx-auto px-4 h-16 flex items-center justify-between">
					<div class="flex items-center gap-4">
						<div class="flex items-center">
							<div class="bg-[#022785] py-0.5 px-1 rounded">
<span class="text-white font-black-han">MY</span>
							</div>
							<span class="font-black-han text-[#000000e6] ml-1"><?php echo $name;?></span>
						</div>
					</div>
					
					<div class="flex items-center gap-4">
						<a class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2" href='<?php echo $login;?>'><?php echo $text_signin;?></a>
						<?php /*if($logged){ ?>
							<a href="<?php echo !empty($register)?$register:'/';?>" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 h-10 px-4 py-2 bg-[#022785] text-white hover:bg-[#022785]/90">
Sign in
							</a>
						<?php };*/ ?>
						
					</div>
				</div>
			</nav>
		<?php };?>
<?php /*	type header 0 => not auth */	?>
		<?php if(empty($type_header)){ ?>
			<a class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 absolute top-4 left-4" href="/">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-arrow-left mr-2 h-4 w-4"><path d="m12 19-7-7 7-7"></path><path d="M19 12H5"></path>
				</svg><?php echo $button_back; ?>
			</a>
		<?php };?>
<?php /*	type header 2 => auth */	?>
		<?php if(!empty($type_header) and $type_header==2){ ?>
<nav class="fixed top-0 left-0 right-0 z-50 bg-white backdrop-blur-md border-b border-gray-100">
	<div class="container mx-auto px-4 h-16 flex items-center justify-between mobile_b4">
		<div class="flex items-center gap-4 mobile_b5">
			<a href="/" class="flex items-center mobile_b3">
				<div class="bg-[#022785] py-0.5 px-1 rounded">
					<span class="text-white font-black-han">MY</span>
				</div>
				<span class="font-black-han text-[#000000e6] ml-1"><?php echo $name;?></span>
			</a>
<?php //	$locations 
?>
			<?php if(!empty($setlocation)){ ?>
					<?php echo $setlocation;?>
			<?php };?>
		</div>
		
		<div class="flex items-center gap-4 mobile_b6">
			<div class="flex items-center gap-2 mobile_b8">
				<span class="text-sm text-gray-600 mobile_b7">Shopping for:</span>
				<div class="relative kitchen_select_block">
					<button type="button" role="combobox" aria-controls="radix-:r3:" aria-expanded="false" aria-autocomplete="none" dir="ltr" data-state="closed" data-placeholder="" class="flex h-10 items-center justify-between rounded-md border border-input bg-white px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none  focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 [&amp;>span]:line-clamp-1 w-[200px] bar_kitchens">
						<span><?php if(empty($my_kitchens_select)){ ?>Select kitchen<?php 
						}else{ echo '<span class="font-medium">' . $my_kitchens_select['name'] . '</span><span class="text-gray-500">' . $my_kitchens_select['address'] . '</span>'; };?></span>
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-down h-4 w-4 opacity-50" aria-hidden="true"><path d="m6 9 6 6 6-6"></path></svg>
					</button>
					<div class="dropdown sel_menu_kitchens">
						<?php if(!empty($my_kitchens)){ ?>
							<?php foreach($my_kitchens as $kitchen_id=>$kit){ ?>
								<label><input type="radio" name="kitchen" value="<?php echo $kit['kitchen_id'];?>" <?php if(!empty($my_kitchens_select) and $my_kitchens_select['kitchen_id'] == $kit['kitchen_id']){ echo 'checked';};?> class="kitchensel<?php echo $kit['kitchen_id'];?>"/><span></span><div class="name_address"><?php echo $kit['name'];?><div class="address"><?php echo $kit['address'];?></div></div></label>
							<?php };?>
						<?php };?>
						<label><span></span><a href="<?php echo $link_kitchen;?>" class="add_kitchens">+ Add new kitchen</a></label>
					</div>
				</div>
			</div>
			<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 relative" type="button" id="open_mini_cart">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-shopping-cart h-5 w-5">
					<circle cx="8" cy="21" r="1"></circle>
					<circle cx="19" cy="21" r="1"></circle>
					<path d="M2.05 2.05h2l2.66 12.42a2 2 0 0 0 2 1.58h9.78a2 2 0 0 0 1.95-1.57l1.65-7.43H5.12"></path>
				</svg>
				<span class="absolute -top-1 -right-1 bg-red-500 text-white text-xs rounded-full h-4 w-4 flex items-center justify-center " id="total_cart"><?php echo $total_cart?$total_cart:0;?></span>
			</button>
			<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2" type="button" id="button_open_right_menu">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user h-5 w-5" style="pointer-events: none;"><path d="M19 21v-2a4 4 0 0 0-4-4H9a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
			</button>
		</div>
	</div>
</nav>
<script type="text/javascript"><!--
$(document).ready(function() {

});
//--></script>
		<?php };?>
<?php /*	type header 3 => not */	?>
		<?php if(!empty($type_header) and $type_header==3){ ?>
<!-- empty header -->
		<?php };?>
<?php /*
<div id="header">
  <?php if ($logo) { ?>
  <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
  <?php } ?>
  <?php echo $language; ?>
  <?php echo $currency; ?>
  <?php echo $cart; ?>
  <div id="search">
    <div class="button-search"></div>
    <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
  </div>
  <div id="welcome">
    <?php if (!$logged) { ?>
    <?php echo $text_welcome; ?>
    <?php } else { ?>
    <?php echo $text_logged; ?>
    <?php } ?>
  </div>
  <div class="links"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a><a href=""><?php echo $text_account; ?></a><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></div>
</div>
<?php if ($categories) { ?>
<div id="menu">
  <ul>
    <?php foreach ($categories as $category) { ?>
    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>
      <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
    </li>
    <?php } ?>
  </ul>
</div>
<?php } ?>
*/
?>
<div id="notification"></div>
<?php if ($error) { ?>
    <div class="warning"><?php echo $error ?><img src="/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>