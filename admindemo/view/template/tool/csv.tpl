<?php echo $header; ?>
<div id="content">

	<?php if ($error_warning) { ?>
		<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>
	<?php if ($success) { ?>
		<div class="success"><?php echo $success; ?></div>
	<?php } ?>
	<div class="box">
		<div class="heading">
			<h1><img src="view/image/backup.png" alt="" /> <?php echo $heading_title; ?></h1>
			<div class="buttons">

			</div>
		</div>
		<div class="content">
			<form action="<?php echo $parse; ?>" method="post" enctype="multipart/form-data" id="restore">
				<div class="grid grid-cols-1 md:grid-cols-1 gap-12">
					<div class="rounded-lg border bg-card text-card-foreground shadow-sm">
						<div class="flex flex-col space-y-1.5 p-6"><h3 class="text-2xl font-semibold leading-none tracking-tight">CSV</h3></div>
						<div class="p-6 pt-0 space-y-4">
							<div>
								<label class="text-sm font-medium">Upload CSV<?php if(!empty($csvfile)){ ?>: <?php echo $csvfile;  };?></label>
								<?php if(!empty($csvfile)){ ?>
									<input type="hidden" name="csvfile" value="<?php echo $csvfile;?>"/>
								<?php }else{ ?>
									<input type="file" name="file" class="flex h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-base ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 md:text-sm mt-1" value="">
								<?php };?>
							</div>
							<?php if(!empty($fields_name)){ ?>
								<p>Check the data and click Start</p>
								<div class="overflow-auto">
									<table class="form">
										<tr>
											<?php foreach($fields_name as $field_name){ ?>
												<td><?php echo $field_name;?></td>
											<?php };?>
										</tr>
										<?php foreach($fields as $field){ ?>
											<tr>
												<?php foreach($field as $f){ ?>
													<td><?php echo $f;?></td>
												<?php };?>
											</tr>
										<?php };?>
									</table>
								</div>
							<?php };?>
							<button type="submit" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2  disabled:opacity-50  [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2"><?php if(!empty($csvfile)){ ?>Start<?php }else{ ?>Test<?php };?></button>
							
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<?php echo $footer; ?>