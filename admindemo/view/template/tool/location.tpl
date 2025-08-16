<?php echo $header; ?>

<div class="space-y-6">
	<div class="rounded-lg border bg-card text-card-foreground shadow-sm">
		<div class="flex flex-col space-y-1.5 p-6">
			<h3 class="text-2xl font-semibold leading-none tracking-tight">Location Management</h3>
		</div>
		
		<form action="<?php echo $action; ?>" class="p-6 pt-0 space-y-6" method="post" enctype="multipart/form-data" id="form">
		
			<div class="space-y-2">
				<label class="text-sm font-medium">Cities</label>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
				<div  dir="ltr" class="relative overflow-hidden h-[300px] rounded-md border p-4" style="position: relative; --radix-scroll-area-corner-width:0px; --radix-scroll-area-corner-height:0px;">

					<div data-radix-scroll-area-viewport="" class="h-full w-full rounded-[inherit]" style="overflow: hidden scroll;">
						<div style="min-width: 100%; display: table;">
							<div class="space-y-4">
								
								<?php foreach($locations as $location){ ?>
								<div class="flex items-center space-x-2 location_id<?php echo $location['location_id'];?> ">
									<label class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70" for="location_id<?php echo $location['location_id'];?>"><?php echo $location['location_name'];?></label>
									<input type="text" name="location_id[<?php echo $location['location_id'];?>]" value="<?php echo $location['location_address'];?>" placeholder="Address"/>
								</div>
								<?php };?>

								
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<button class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 w-full sm:w-auto" type="submit" for="form"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-save mr-2 h-4 w-4"><path d="M15.2 3a2 2 0 0 1 1.4.6l3.8 3.8a2 2 0 0 1 .6 1.4V19a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2z"></path><path d="M17 21v-7a1 1 0 0 0-1-1H8a1 1 0 0 0-1 1v7"></path><path d="M7 3v4a1 1 0 0 0 1 1h7"></path></svg>Save Changes</button>

		</form>
	</div>
</div>
<style>[data-radix-scroll-area-viewport]{scrollbar-width:none;-ms-overflow-style:none;-webkit-overflow-scrolling:touch;}[data-radix-scroll-area-viewport]::-webkit-scrollbar{display:none}</style>
<script type="text/javascript"><!--

//--></script> 
<?php echo $footer; ?> 