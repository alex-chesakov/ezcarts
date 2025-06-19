<?php foreach ($banners as $banner) { ?>
	<?php echo $banner['html_desc'];?>
		
	<div class="flex items-center justify-center">
		<img src="<?php echo $banner['full_image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" class="max-w-full h-auto object-contain animate-fade-up self-center" style="max-height: 350px;"/>
	</div>
<?php } ?>