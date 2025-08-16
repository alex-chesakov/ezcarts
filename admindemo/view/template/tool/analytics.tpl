<?php echo $header; ?>

<div class="space-y-6">
	<div class="flex justify-between items-center">
		<h1 class="text-2xl font-bold">Analytics</h1>
	</div>
	
	<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
		<div class="rounded-lg border bg-card text-card-foreground shadow-sm">
			<div class="flex flex-col space-y-1.5 p-6">
				<h3 class="tracking-tight text-sm font-medium text-gray-500">Total Sales</h3>
			</div>
			
			<div class="p-6 pt-0">
				<div class="text-2xl font-bold">$<?php echo $sales_sumtotal;?></div>
				<p class="text-xs text-green-500">+<?php echo (int)$sales_proc_mount;?>% from last month</p>
			</div>
		</div>
		
		<div class="rounded-lg border bg-card text-card-foreground shadow-sm">
			<div class="flex flex-col space-y-1.5 p-6">
				<h3 class="tracking-tight text-sm font-medium text-gray-500">Total Orders</h3>
			</div>
			
			<div class="p-6 pt-0">
				<div class="text-2xl font-bold"><?php echo $orders_sumtotal;?></div>
				<p class="text-xs text-green-500">+<?php echo (int)$orders_proc_mount;?>% from last month</p>
			</div>
		</div>
		
		<div class="rounded-lg border bg-card text-card-foreground shadow-sm">
			<div class="flex flex-col space-y-1.5 p-6">
				<h3 class="tracking-tight text-sm font-medium text-gray-500">Average Order Value</h3>
			</div>
			
			<div class="p-6 pt-0">
				<div class="text-2xl font-bold">$<?php echo $avg_total;?></div>
				<?php if(!empty($avg_proc_mount)){ ?>
					<p class="text-xs text-red-500">-<?php echo (int)$avg_proc_mount;?>% from last month</p>
				<?php };?>
			</div>
		</div>
		
		<div class="rounded-lg border bg-card text-card-foreground shadow-sm">
			<div class="flex flex-col space-y-1.5 p-6">
				<h3 class="tracking-tight text-sm font-medium text-gray-500">Conversion Rate</h3>
			</div>
			
			<div class="p-6 pt-0">
				<div class="text-2xl font-bold">0%</div>
				<p class="text-xs text-green-500">+0% from last month</p>
			</div>
		</div>
	</div>
	
	<div class="rounded-lg border bg-card text-card-foreground shadow-sm">
		<div class="flex flex-col space-y-1.5 p-6">
			<h3 class="text-2xl font-semibold leading-none tracking-tight">Sales Overview</h3>
		</div>
		
		<div class="p-6 pt-0">
			<div class="h-[300px]">
				<div class="recharts-responsive-container" style="width: 100%; height: 100%; min-width: 0px;">
					<div class="recharts-wrapper" style="position: relative; cursor: default; width: 100%; height: 100%; max-height: 300px; max-width: 1012px;">
					
<?php /*
						<svg class="recharts-surface" width="1012" height="300" viewBox="0 0 1012 300" style="width: 100%; height: 100%;">
							<title></title>
							<desc></desc>
							<defs>
								<clipPath id="recharts1-clip">
									<rect x="65" y="5" height="260" width="882"></rect>
								</clipPath>
							</defs>
							<g class="recharts-cartesian-grid">
								<g class="recharts-cartesian-grid-horizontal">
									<line stroke-dasharray="3 3" stroke="#ccc" fill="none" x="65" y="5" width="882" height="260" x1="65" y1="265" x2="947" y2="265"></line>
									<line stroke-dasharray="3 3" stroke="#ccc" fill="none" x="65" y="5" width="882" height="260" x1="65" y1="200" x2="947" y2="200"></line>
									<line stroke-dasharray="3 3" stroke="#ccc" fill="none" x="65" y="5" width="882" height="260" x1="65" y1="135" x2="947" y2="135"></line>
									<line stroke-dasharray="3 3" stroke="#ccc" fill="none" x="65" y="5" width="882" height="260" x1="65" y1="70" x2="947" y2="70"></line>
									<line stroke-dasharray="3 3" stroke="#ccc" fill="none" x="65" y="5" width="882" height="260" x1="65" y1="5" x2="947" y2="5"></line>
								</g>
								<g class="recharts-cartesian-grid-vertical">
									<line stroke-dasharray="3 3" stroke="#ccc" fill="none" x="65" y="5" width="882" height="260" x1="65" y1="5" x2="65" y2="265"></line>
									<line stroke-dasharray="3 3" stroke="#ccc" fill="none" x="65" y="5" width="882" height="260" x1="241.4" y1="5" x2="241.4" y2="265"></line>
									<line stroke-dasharray="3 3" stroke="#ccc" fill="none" x="65" y="5" width="882" height="260" x1="417.8" y1="5" x2="417.8" y2="265"></line>
									<line stroke-dasharray="3 3" stroke="#ccc" fill="none" x="65" y="5" width="882" height="260" x1="594.2" y1="5" x2="594.2" y2="265"></line>
									<line stroke-dasharray="3 3" stroke="#ccc" fill="none" x="65" y="5" width="882" height="260" x1="770.6" y1="5" x2="770.6" y2="265"></line>
									<line stroke-dasharray="3 3" stroke="#ccc" fill="none" x="65" y="5" width="882" height="260" x1="947" y1="5" x2="947" y2="265"></line>
								</g>
							</g>
							<g class="recharts-layer recharts-cartesian-axis recharts-xAxis xAxis">
								<line orientation="bottom" width="882" height="30" x="65" y="265" class="recharts-cartesian-axis-line" stroke="#666" fill="none" x1="65" y1="265" x2="947" y2="265"></line>
								<g class="recharts-cartesian-axis-ticks">
									<g class="recharts-layer recharts-cartesian-axis-tick">
										<line orientation="bottom" width="882" height="30" x="65" y="265" class="recharts-cartesian-axis-tick-line" stroke="#666" fill="none" x1="65" y1="271" x2="65" y2="265"></line>
										<text orientation="bottom" width="882" height="30" stroke="none" x="65" y="273" class="recharts-text recharts-cartesian-axis-tick-value" text-anchor="middle" fill="#666"><tspan x="65" dy="0.71em">Jan</tspan></text>
									</g>
									<g class="recharts-layer recharts-cartesian-axis-tick"><line orientation="bottom" width="882" height="30" x="65" y="265" class="recharts-cartesian-axis-tick-line" stroke="#666" fill="none" x1="241.4" y1="271" x2="241.4" y2="265"></line><text orientation="bottom" width="882" height="30" stroke="none" x="241.4" y="273" class="recharts-text recharts-cartesian-axis-tick-value" text-anchor="middle" fill="#666"><tspan x="241.4" dy="0.71em">Feb</tspan></text></g>
									<g class="recharts-layer recharts-cartesian-axis-tick"><line orientation="bottom" width="882" height="30" x="65" y="265" class="recharts-cartesian-axis-tick-line" stroke="#666" fill="none" x1="417.8" y1="271" x2="417.8" y2="265"></line><text orientation="bottom" width="882" height="30" stroke="none" x="417.8" y="273" class="recharts-text recharts-cartesian-axis-tick-value" text-anchor="middle" fill="#666"><tspan x="417.8" dy="0.71em">Mar</tspan></text></g>
									<g class="recharts-layer recharts-cartesian-axis-tick"><line orientation="bottom" width="882" height="30" x="65" y="265" class="recharts-cartesian-axis-tick-line" stroke="#666" fill="none" x1="594.2" y1="271" x2="594.2" y2="265"></line><text orientation="bottom" width="882" height="30" stroke="none" x="594.2" y="273" class="recharts-text recharts-cartesian-axis-tick-value" text-anchor="middle" fill="#666"><tspan x="594.2" dy="0.71em">Apr</tspan></text></g>
									<g class="recharts-layer recharts-cartesian-axis-tick"><line orientation="bottom" width="882" height="30" x="65" y="265" class="recharts-cartesian-axis-tick-line" stroke="#666" fill="none" x1="770.6" y1="271" x2="770.6" y2="265"></line><text orientation="bottom" width="882" height="30" stroke="none" x="770.6" y="273" class="recharts-text recharts-cartesian-axis-tick-value" text-anchor="middle" fill="#666"><tspan x="770.6" dy="0.71em">May</tspan></text></g>
									<g class="recharts-layer recharts-cartesian-axis-tick"><line orientation="bottom" width="882" height="30" x="65" y="265" class="recharts-cartesian-axis-tick-line" stroke="#666" fill="none" x1="947" y1="271" x2="947" y2="265"></line><text orientation="bottom" width="882" height="30" stroke="none" x="947" y="273" class="recharts-text recharts-cartesian-axis-tick-value" text-anchor="middle" fill="#666"><tspan x="947" dy="0.71em">Jun</tspan></text></g>
								</g>
							</g>

							<g class="recharts-layer recharts-cartesian-axis recharts-yAxis yAxis">
								<line orientation="left" width="60" height="260" x="5" y="5" class="recharts-cartesian-axis-line" stroke="#666" fill="none" x1="65" y1="5" x2="65" y2="265"></line>
								<g class="recharts-cartesian-axis-ticks">
									<g class="recharts-layer recharts-cartesian-axis-tick">
										<line orientation="left" width="60" height="260" x="5" y="5" class="recharts-cartesian-axis-tick-line" stroke="#666" fill="none" x1="59" y1="265" x2="65" y2="265"></line>
										<text orientation="left" width="60" height="260" stroke="none" x="57" y="265" class="recharts-text recharts-cartesian-axis-tick-value" text-anchor="end" fill="#666"><tspan x="57" dy="0.355em">0</tspan></text>
									</g>
									<g class="recharts-layer recharts-cartesian-axis-tick"><line orientation="left" width="60" height="260" x="5" y="5" class="recharts-cartesian-axis-tick-line" stroke="#666" fill="none" x1="59" y1="200" x2="65" y2="200"></line><text orientation="left" width="60" height="260" stroke="none" x="57" y="200" class="recharts-text recharts-cartesian-axis-tick-value" text-anchor="end" fill="#666"><tspan x="57" dy="0.355em">1000</tspan></text></g>
									<g class="recharts-layer recharts-cartesian-axis-tick"><line orientation="left" width="60" height="260" x="5" y="5" class="recharts-cartesian-axis-tick-line" stroke="#666" fill="none" x1="59" y1="135" x2="65" y2="135"></line><text orientation="left" width="60" height="260" stroke="none" x="57" y="135" class="recharts-text recharts-cartesian-axis-tick-value" text-anchor="end" fill="#666"><tspan x="57" dy="0.355em">2000</tspan></text></g>
									<g class="recharts-layer recharts-cartesian-axis-tick"><line orientation="left" width="60" height="260" x="5" y="5" class="recharts-cartesian-axis-tick-line" stroke="#666" fill="none" x1="59" y1="70" x2="65" y2="70"></line><text orientation="left" width="60" height="260" stroke="none" x="57" y="70" class="recharts-text recharts-cartesian-axis-tick-value" text-anchor="end" fill="#666"><tspan x="57" dy="0.355em">3000</tspan></text></g>
									<g class="recharts-layer recharts-cartesian-axis-tick"><line orientation="left" width="60" height="260" x="5" y="5" class="recharts-cartesian-axis-tick-line" stroke="#666" fill="none" x1="59" y1="5" x2="65" y2="5"></line><text orientation="left" width="60" height="260" stroke="none" x="57" y="12" class="recharts-text recharts-cartesian-axis-tick-value" text-anchor="end" fill="#666"><tspan x="57" dy="0.355em">4000</tspan></text></g>
								</g>
							</g>
							<g class="recharts-layer recharts-cartesian-axis recharts-yAxis yAxis"><line orientation="right" width="60" height="260" x="947" y="5" class="recharts-cartesian-axis-line" stroke="#666" fill="none" x1="947" y1="5" x2="947" y2="265"></line><g class="recharts-cartesian-axis-ticks"><g class="recharts-layer recharts-cartesian-axis-tick"><line orientation="right" width="60" height="260" x="947" y="5" class="recharts-cartesian-axis-tick-line" stroke="#666" fill="none" x1="953" y1="265" x2="947" y2="265"></line><text orientation="right" width="60" height="260" stroke="none" x="955" y="265" class="recharts-text recharts-cartesian-axis-tick-value" text-anchor="start" fill="#666"><tspan x="955" dy="0.355em">0</tspan></text></g><g class="recharts-layer recharts-cartesian-axis-tick"><line orientation="right" width="60" height="260" x="947" y="5" class="recharts-cartesian-axis-tick-line" stroke="#666" fill="none" x1="953" y1="200" x2="947" y2="200"></line><text orientation="right" width="60" height="260" stroke="none" x="955" y="200" class="recharts-text recharts-cartesian-axis-tick-value" text-anchor="start" fill="#666"><tspan x="955" dy="0.355em">60</tspan></text></g><g class="recharts-layer recharts-cartesian-axis-tick"><line orientation="right" width="60" height="260" x="947" y="5" class="recharts-cartesian-axis-tick-line" stroke="#666" fill="none" x1="953" y1="135" x2="947" y2="135"></line><text orientation="right" width="60" height="260" stroke="none" x="955" y="135" class="recharts-text recharts-cartesian-axis-tick-value" text-anchor="start" fill="#666"><tspan x="955" dy="0.355em">120</tspan></text></g><g class="recharts-layer recharts-cartesian-axis-tick"><line orientation="right" width="60" height="260" x="947" y="5" class="recharts-cartesian-axis-tick-line" stroke="#666" fill="none" x1="953" y1="70" x2="947" y2="70"></line><text orientation="right" width="60" height="260" stroke="none" x="955" y="70" class="recharts-text recharts-cartesian-axis-tick-value" text-anchor="start" fill="#666"><tspan x="955" dy="0.355em">180</tspan></text></g><g class="recharts-layer recharts-cartesian-axis-tick"><line orientation="right" width="60" height="260" x="947" y="5" class="recharts-cartesian-axis-tick-line" stroke="#666" fill="none" x1="953" y1="5" x2="947" y2="5"></line><text orientation="right" width="60" height="260" stroke="none" x="955" y="12" class="recharts-text recharts-cartesian-axis-tick-value" text-anchor="start" fill="#666"><tspan x="955" dy="0.355em">240</tspan></text></g></g></g>

							
							<g class="recharts-layer recharts-line"><path stroke="#8884d8" stroke-width="1" fill="none" width="882" height="260" class="recharts-curve recharts-line-curve" stroke-dasharray="929.46923828125px 0px" d="M65,5C123.8,26.667,182.6,48.333,241.4,70C300.2,91.667,359,135,417.8,135C476.6,135,535.4,84.3,594.2,84.3C653,84.3,711.8,142.15,770.6,142.15C829.4,142.15,888.2,125.9,947,109.65"></path><g class="recharts-layer"></g><g class="recharts-layer recharts-line-dots"><circle r="3" stroke="#8884d8" stroke-width="1" fill="#fff" width="882" height="260" cx="65" cy="5" class="recharts-dot recharts-line-dot"></circle><circle r="3" stroke="#8884d8" stroke-width="1" fill="#fff" width="882" height="260" cx="241.4" cy="70" class="recharts-dot recharts-line-dot"></circle><circle r="3" stroke="#8884d8" stroke-width="1" fill="#fff" width="882" height="260" cx="417.8" cy="135" class="recharts-dot recharts-line-dot"></circle><circle r="3" stroke="#8884d8" stroke-width="1" fill="#fff" width="882" height="260" cx="594.2" cy="84.30000000000001" class="recharts-dot recharts-line-dot"></circle><circle r="3" stroke="#8884d8" stroke-width="1" fill="#fff" width="882" height="260" cx="770.6" cy="142.15000000000003" class="recharts-dot recharts-line-dot"></circle><circle r="3" stroke="#8884d8" stroke-width="1" fill="#fff" width="882" height="260" cx="947" cy="109.64999999999999" class="recharts-dot recharts-line-dot"></circle></g></g>
							<g class="recharts-layer recharts-line"><path stroke="#82ca9d" stroke-width="1" fill="none" width="882" height="260" class="recharts-curve recharts-line-curve" stroke-dasharray="914.8986206054688px 0px" d="M65,5C123.8,19.625,182.6,34.25,241.4,50.5C300.2,66.75,359,102.5,417.8,102.5C476.6,102.5,535.4,60.25,594.2,60.25C653,60.25,711.8,113.333,770.6,113.333C829.4,113.333,888.2,97.083,947,80.833"></path><g class="recharts-layer"></g><g class="recharts-layer recharts-line-dots"><circle r="3" stroke="#82ca9d" stroke-width="1" fill="#fff" width="882" height="260" cx="65" cy="5" class="recharts-dot recharts-line-dot"></circle><circle r="3" stroke="#82ca9d" stroke-width="1" fill="#fff" width="882" height="260" cx="241.4" cy="50.500000000000014" class="recharts-dot recharts-line-dot"></circle><circle r="3" stroke="#82ca9d" stroke-width="1" fill="#fff" width="882" height="260" cx="417.8" cy="102.5" class="recharts-dot recharts-line-dot"></circle><circle r="3" stroke="#82ca9d" stroke-width="1" fill="#fff" width="882" height="260" cx="594.2" cy="60.25000000000001" class="recharts-dot recharts-line-dot"></circle><circle r="3" stroke="#82ca9d" stroke-width="1" fill="#fff" width="882" height="260" cx="770.6" cy="113.33333333333333" class="recharts-dot recharts-line-dot"></circle><circle r="3" stroke="#82ca9d" stroke-width="1" fill="#fff" width="882" height="260" cx="947" cy="80.83333333333333" class="recharts-dot recharts-line-dot"></circle></g></g>

						</svg>
*/	?>						

					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<?php echo $footer; ?> 