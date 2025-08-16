<h2 class="text-3xl font-bold mb-4 text-center text-[#212429]"><?php echo $name;?></h2>
<div class="mt-8" id="carousel<?php echo $module;?>">
	<div class="relative px-12 w-full max-w-5xl mx-auto carousel swiper-viewport">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<?php foreach ($banners as $banner) { ?>
					<div class="min-w-0 shrink-0 grow-0 basis-1/6 pl-1 swiper-slide">
						<div class="p-1">
							<img src="<?php echo $banner['full_image'];?>" alt="<?php echo $banner['title'];?>" class="w-full h-auto object-contain max-h-[75px]">
						</div>
					</div>
				<?php };?>
			</div>
		</div>
		<?php /*<div class="swiper-pagination"></div>*/	?>
		
		<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:text-accent-foreground absolute -left-12 top-1/2 -translate-y-1/2 h-12 w-12 bg-no-repeat bg-center hover:bg-gray-100/50 swiper-button-prev" style="background-image: url('/image/arrows-2x.png'); background-size: 200%; background-position: 0% 50%;"><span class="sr-only">Previous slide</span></button>

		<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:text-accent-foreground absolute -right-12 top-1/2 -translate-y-1/2 h-12 w-12 bg-no-repeat bg-center hover:bg-gray-100/50 swiper-button-next" style="background-image: url('/image/arrows-2x.png'); background-size: 200%; background-position: 100% 50%;"><span class="sr-only">Next slide</span></button>
	</div>
</div>



<script type="text/javascript"><!--
$(document).ready(function() {
$('#carousel<?php echo $module;?> .swiper-container').swiper({
	mode: 'horizontal',
	slidesPerView: 6,
	pagination: '.swiper-pagination',
	paginationClickable: true,
	nextButton: '#carousel<?php echo $module;?> .swiper-button-next',
    prevButton: '#carousel<?php echo $module;?> .swiper-button-prev',
	autoplay: 2500,
	loop: true
});
});
--></script>