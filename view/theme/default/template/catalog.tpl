<?php echo $header; ?>

<div class="group/sidebar-wrapper flex min-h-svh w-full has-[[data-variant=inset]]:bg-sidebar" style="--sidebar-width:16rem; --sidebar-width-icon:3rem;">
	<div class="flex w-full flex-1 pt-16">
		<div class="group peer hidden md:block text-sidebar-foreground" data-state="expanded" data-collapsible="" data-variant="inset" data-side="left">
			<div class="duration-200 relative h-svh w-[--sidebar-width] bg-transparent transition-[width] ease-linear group-data-[collapsible=offcanvas]:w-0 group-data-[side=right]:rotate-180 group-data-[collapsible=icon]:w-[calc(var(--sidebar-width-icon)_+_theme(spacing.4))]"></div>
			
			<div class="duration-200 fixed inset-y-0 z-10 hidden h-svh w-[--sidebar-width] transition-[left,right,width] ease-linear md:flex left-0 group-data-[collapsible=offcanvas]:left-[calc(var(--sidebar-width)*-1)] p-2 group-data-[collapsible=icon]:w-[calc(var(--sidebar-width-icon)_+_theme(spacing.4)_+2px)]">
			
				<div class="flex h-full w-full flex-col bg-sidebar group-data-[variant=floating]:rounded-lg group-data-[variant=floating]:border group-data-[variant=floating]:border-sidebar-border group-data-[variant=floating]:shadow">
				
					<div class="flex min-h-0 flex-1 flex-col gap-2 overflow-auto group-data-[collapsible=icon]:overflow-hidden pt-20">
						<div class="relative flex w-full min-w-0 flex-col p-2">
						
							<div class="duration-200 flex h-8 shrink-0 items-center rounded-md px-2 text-xs font-medium text-sidebar-foreground/70 outline-none ring-sidebar-ring transition-[margin,opa] ease-linear focus-visible:ring-2 [&amp;>svg]:size-4 [&amp;>svg]:shrink-0 group-data-[collapsible=icon]:-mt-8 group-data-[collapsible=icon]:opacity-0">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-store mr-2">
									<path d="m2 7 4.41-4.41A2 2 0 0 1 7.83 2h8.34a2 2 0 0 1 1.42.59L22 7"></path><path d="M4 12v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2v-8"></path><path d="M15 22v-4a2 2 0 0 0-2-2h-2a2 2 0 0 0-2 2v4"></path><path d="M2 7h20"></path><path d="M22 7v3a2 2 0 0 1-2 2a2.7 2.7 0 0 1-1.59-.63.7.7 0 0 0-.82 0A2.7 2.7 0 0 1 16 12a2.7 2.7 0 0 1-1.59-.63.7.7 0 0 0-.82 0A2.7 2.7 0 0 1 12 12a2.7 2.7 0 0 1-1.59-.63.7.7 0 0 0-.82 0A2.7 2.7 0 0 1 8 12a2.7 2.7 0 0 1-1.59-.63.7.7 0 0 0-.82 0A2.7 2.7 0 0 1 4 12a2 2 0 0 1-2-2V7"></path>
								</svg>
									Merchants
							</div>

							<div class="w-full text-sm">
								<div class="space-y-4 px-4 py-2">
									<div class="flex items-center space-x-2">
										<button type="button" role="checkbox" aria-checked="false" data-state="unchecked" value="on" class="peer h-4 w-4 shrink-0 rounded-sm border border-primary ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 data-[state=checked]:bg-primary data-[state=checked]:text-primary-foreground" id="restaurant-depo"></button>
										<label for="restaurant-depo" class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70">Restaurant Depo</label>
									</div>
									
									<div class="flex items-center space-x-2 opacity-50">
										<button type="button" role="checkbox" aria-checked="false" data-state="unchecked" data-disabled="" disabled="" value="on" class="peer h-4 w-4 shrink-0 rounded-sm border border-primary ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 data-[state=checked]:bg-primary data-[state=checked]:text-primary-foreground" id="costco"></button>
										<label for="costco" class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70">Costco
											<span class="ml-2 text-xs bg-[#F2FCE2] text-green-700 px-1.5 py-0.5 rounded-full">Soon</span>
										</label>
									</div>
								</div>
							</div>
						</div>
						
						<div class="relative flex w-full min-w-0 flex-col p-2">
							<div class="duration-200 flex h-8 shrink-0 items-center rounded-md px-2 text-xs font-medium text-sidebar-foreground/70 outline-none ring-sidebar-ring transition-[margin,opa] ease-linear focus-visible:ring-2 [&amp;>svg]:size-4 [&amp;>svg]:shrink-0 group-data-[collapsible=icon]:-mt-8 group-data-[collapsible=icon]:opacity-0">
								<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-layers mr-2">
									<path d="m12.83 2.18a2 2 0 0 0-1.66 0L2.6 6.08a1 1 0 0 0 0 1.83l8.58 3.91a2 2 0 0 0 1.66 0l8.58-3.9a1 1 0 0 0 0-1.83Z"></path><path d="m22 17.65-9.17 4.16a2 2 0 0 1-1.66 0L2 17.65"></path><path d="m22 12.65-9.17 4.16a2 2 0 0 1-1.66 0L2 12.65"></path>
								</svg>
								Categories
							</div>
							
							<div class="w-full text-sm">
								<ul class="flex w-full min-w-0 flex-col gap-1">
									<li class="group/menu-item relative">
										<button class="peer/menu-button flex w-full items-center gap-2 overflow-hidden rounded-md p-2 text-left outline-none ring-sidebar-ring transition-[width,height,padding] focus-visible:ring-2 active:bg-sidebar-accent active:text-sidebar-accent-foreground  disabled:opacity-50 group-has-[[data-sidebar=menu-action]]/menu-item:pr-8 aria- aria-disabled:opacity-50 data-[active=true]:bg-sidebar-accent data-[active=true]:font-medium data-[active=true]:text-sidebar-accent-foreground data-[state=open]:hover:bg-sidebar-accent data-[state=open]:hover:text-sidebar-accent-foreground group-data-[collapsible=icon]:!size-8 group-data-[collapsible=icon]:!p-2 [&amp;>span:last-child]:truncate [&amp;>svg]:size-4 [&amp;>svg]:shrink-0 hover:bg-sidebar-accent hover:text-sidebar-accent-foreground h-8 text-sm">All Products</button>
									</li>
									
									<li class="group/menu-item relative">
										<button class="peer/menu-button flex w-full items-center gap-2 overflow-hidden rounded-md p-2 text-left outline-none ring-sidebar-ring transition-[width,height,padding] focus-visible:ring-2 active:bg-sidebar-accent active:text-sidebar-accent-foreground  disabled:opacity-50 group-has-[[data-sidebar=menu-action]]/menu-item:pr-8 aria- aria-disabled:opacity-50 data-[active=true]:bg-sidebar-accent data-[active=true]:font-medium data-[active=true]:text-sidebar-accent-foreground data-[state=open]:hover:bg-sidebar-accent data-[state=open]:hover:text-sidebar-accent-foreground group-data-[collapsible=icon]:!size-8 group-data-[collapsible=icon]:!p-2 [&amp;>span:last-child]:truncate [&amp;>svg]:size-4 [&amp;>svg]:shrink-0 hover:bg-sidebar-accent hover:text-sidebar-accent-foreground h-8 text-sm">Fruits</button>
									</li>
									
								</ul>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<main class="relative flex min-h-svh flex-1 flex-col bg-background peer-data-[variant=inset]:min-h-[calc(100svh-theme(spacing.4))] md:peer-data-[variant=inset]:m-2 md:peer-data-[state=collapsed]:peer-data-[variant=inset]:ml-2 md:peer-data-[variant=inset]:ml-0 md:peer-data-[variant=inset]:rounded-xl md:peer-data-[variant=inset]:shadow px-4 py-8">
			<div class="flex flex-col space-y-8">
				<div class="flex flex-col md:flex-row justify-between items-center gap-4">
					<div class="flex items-center gap-4 w-full">
						<h1 class="text-3xl font-bold text-gray-900">All Products</h1>
					</div>

					<div class="flex items-center gap-4 w-full md:w-auto">
<!-- search block -->
						<div class="relative flex-1 md:w-[500px]">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"><circle cx="11" cy="11" r="8"></circle><path d="m21 21-4.3-4.3"></path></svg>
							
							<input class="flex h-10 rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm pl-10 w-full" placeholder="Search products..." value="">
						</div>
<!-- view block -->
						<button class="justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 flex items-center gap-2 view_change">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-list h-4 w-4"><path d="M3 12h.01"></path><path d="M3 18h.01"></path><path d="M3 6h.01"></path><path d="M8 12h13"></path><path d="M8 18h13"></path><path d="M8 6h13"></path></svg>
						</button>
					</div>
				</div>
				
				<div class="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-6 gap-2" data-view="flex flex-col gap-3" id="catalog_block">
<?php foreach($products as $product){ ?>
					<div class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow max-w-[160px] item_product" data-view="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow flex item_product">
						<div class="relative aspect-w-16 aspect-h-9">
							<img src="<?php echo $product['thumb'];?>" alt="<?php echo $product['name'];?>" class="w-full h-24 object-cover">
							<button class="absolute top-2 right-2 bg-white hover:bg-gray-100 text-gray-800 p-1 rounded-full shadow-lg transition-colors"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-plus h-6 w-6"><path d="M5 12h14"></path><path d="M12 5v14"></path></svg></button>
						</div>
						
						<div class="p-2 wrap_pr" data-view="p-2 flex-1 wrap_pr">
							<h3 class="text-xs font-semibold text-gray-900 line-clamp-1"><?php echo $product['name'];?></h3>
							<p class="text-xs text-gray-600">Fruits</p>
							<div class="mt-2 flex flex-col gap-2 buttons_group" data-view="mt-2 flex items-center justify-between buttons_group">
								<span class="text-xs font-bold text-[#022785]">$<?php echo $product['case_price'];?></span>
								<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 text-primary-foreground px-4 bg-[#022785] hover:bg-[#022785]/90 text-xs py-0.5 h-6">Details</button>
							</div>
						</div>
					</div>
<?php };?>		
				</div>
				
				<nav role="navigation" aria-label="pagination" class="mx-auto flex w-full justify-center mt-8">
					<ul data-component-path="src/pages/Shop.tsx" data-component-name="PaginationContent" data-component-line="168" data-component-file="Shop.tsx" data-component-content="%7B%7D" class="flex flex-row items-center gap-1"><li data-component-path="src/pages/Shop.tsx" data-component-name="PaginationItem" data-component-line="169" data-component-file="Shop.tsx" data-component-content="%7B%7D" class=""><a data-component-path="src/pages/Shop.tsx" data-component-name="PaginationPrevious" data-component-line="170" data-component-file="Shop.tsx" data-component-content="%7B%7D" class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 gap-1 pl-2.5  opacity-50" aria-label="Go to previous page" href="#"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-left h-4 w-4" data-component-path="src/components/ui/pagination.tsx" data-component-name="ChevronLeft" data-component-line="72" data-component-file="pagination.tsx" data-component-content="%7B%22className%22%3A%22h-4%20w-4%22%7D"><path d="m15 18-6-6 6-6"></path></svg><span data-component-path="src/components/ui/pagination.tsx" data-component-name="span" data-component-line="73" data-component-file="pagination.tsx" data-component-content="%7B%22text%22%3A%22Previous%22%7D">Previous</span></a></li><li data-component-path="src/pages/Shop.tsx" data-component-name="PaginationItem" data-component-line="177" data-component-file="Shop.tsx" data-component-content="%7B%7D" class=""><a data-component-path="src/pages/Shop.tsx" data-component-name="PaginationLink" data-component-line="178" data-component-file="Shop.tsx" data-component-content="%7B%7D" aria-current="page" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10" href="#">1</a></li><li data-component-path="src/pages/Shop.tsx" data-component-name="PaginationItem" data-component-line="177" data-component-file="Shop.tsx" data-component-content="%7B%7D" class=""><a data-component-path="src/pages/Shop.tsx" data-component-name="PaginationLink" data-component-line="178" data-component-file="Shop.tsx" data-component-content="%7B%7D" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 w-10" href="#">2</a></li><li data-component-path="src/pages/Shop.tsx" data-component-name="PaginationItem" data-component-line="187" data-component-file="Shop.tsx" data-component-content="%7B%7D" class=""><a data-component-path="src/pages/Shop.tsx" data-component-name="PaginationNext" data-component-line="188" data-component-file="Shop.tsx" data-component-content="%7B%7D" class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 gap-1 pr-2.5" aria-label="Go to next page" href="#"><span data-component-path="src/components/ui/pagination.tsx" data-component-name="span" data-component-line="88" data-component-file="pagination.tsx" data-component-content="%7B%22text%22%3A%22Next%22%7D">Next</span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-right h-4 w-4" data-component-path="src/components/ui/pagination.tsx" data-component-name="ChevronRight" data-component-line="89" data-component-file="pagination.tsx" data-component-content="%7B%22className%22%3A%22h-4%20w-4%22%7D"><path d="m9 18 6-6-6-6"></path></svg></a></li></ul>
				</nav>
			</div>
		</main>
	</div>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.view_change').on("click",function(){
		
		svg_html1 = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-grid3x3 h-4 w-4" ><rect width="18" height="18" x="3" y="3" rx="2"></rect><path d="M3 9h18"></path><path d="M3 15h18"></path><path d="M9 3v18"></path><path d="M15 3v18"></path></svg>';
		svg_html2 = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-list h-4 w-4"><path d="M3 12h.01"></path><path d="M3 18h.01"></path><path d="M3 6h.01"></path><path d="M8 12h13"></path><path d="M8 18h13"></path><path d="M8 6h13"></path></svg>';
		
		dw = $('#catalog_block').attr('data-view');
		cw = $('#catalog_block').attr('class');
		
		$('#catalog_block').attr('class',dw);
		$('#catalog_block').attr('data-view',cw);
		
		dw = $('#catalog_block').attr('data-view');
		cw = $('#catalog_block').attr('class');
		

		$('#catalog_block [data-view]').each(function(){
			dw = $(this).attr('data-view');
			cw = $(this).attr('class');
			$(this).attr('class',dw);
			$(this).attr('data-view',cw);
			
		});

	});

});
//--></script>
<?php echo $footer; ?>