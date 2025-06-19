<?php
class Pagination {
	public $total = 0;
	public $page = 1;
	public $limit = 18;
	public $num_links = 10;
	public $url = '';
	public $text = 'Showing {start} to {end} of {total} ({pages} Pages)';
	public $text_first = '|&lt;';
	public $text_last = '&gt;|';
	public $text_next = 'Next';
	public $text_prev = 'Previous';
	public $style_links = 'links';
	public $style_results = 'results';

	public function render() {
		$total = $this->total;
		
		if ($this->page < 1) {
			$page = 1;
		} else {
			$page = $this->page;
		}
		
		if (!(int)$this->limit) {
			$limit = 10;
		} else {
			$limit = $this->limit;
		}
		
		$num_links = $this->num_links;
		$num_pages = ceil($total / $limit);
		
		$output = '';
		
		if ($page > 1) {
			$output .= '<li class=""><a href="' . str_replace('{page}', $page - 1, $this->url) . '" class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 gap-1 pl-2.5 pointer-events-none opacity-50" aria-label="Go to previous page"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-left h-4 w-4"><path d="m15 18-6-6 6-6"></path></svg><span>' . $this->text_prev . '</span></a></li>';
		}

		if ($num_pages > 1) {
			if ($num_pages <= $num_links) {
				$start = 1;
				$end = $num_pages;
			} else {
				$start = $page - floor($num_links / 2);
				$end = $page + floor($num_links / 2);
			
				if ($start < 1) {
					$end += abs($start) + 1;
					$start = 1;
				}
						
				if ($end > $num_pages) {
					$start -= ($end - $num_pages);
					$end = $num_pages;
				}
			}

			if ($start > 1) {
				$output .= '<li class="">....</li>';
			}

			for ($i = $start; $i <= $end; $i++) {
				if ($page == $i) {
					$output .= '<li class=""><a class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10">' . $i . '</a></li>';
				} else {
					$output .= '<li class=""><a href="' . str_replace('{page}', $i, $this->url) . '" class="inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-10 w-10">' . $i . '</a></li>';
				}	
			}
							
			if ($end < $num_pages) {
				$output .= '<li class="">....</li>';
			}
		}
		
		if ($page < $num_pages) {
			$output .= '<li class=""><a href="' . str_replace('{page}', $page + 1, $this->url) . '" class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 [&amp;_svg]:pointer-events-none [&amp;_svg]:size-4 [&amp;_svg]:shrink-0 hover:bg-accent hover:text-accent-foreground h-10 px-4 py-2 gap-1 pr-2.5" aria-label="Go to next page" href="#"><span>' . $this->text_next . '</span><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-chevron-right h-4 w-4"><path d="m9 18 6-6-6-6"></path></svg></a></li>';
//			$output .= ' <a href="' . str_replace('{page}', $num_pages, $this->url) . '">' . $this->text_last . '</a> ';
		}
		
		$find = array(
			'{start}',
			'{end}',
			'{total}',
			'{pages}'
		);
		
		$replace = array(
			($total) ? (($page - 1) * $limit) + 1 : 0,
			((($page - 1) * $limit) > ($total - $limit)) ? $total : ((($page - 1) * $limit) + $limit),
			$total, 
			$num_pages
		);
		
		return ($output ? '<nav class="mx-auto flex w-full justify-center mt-8 ' . $this->style_links . '"><ul class="flex flex-row items-center gap-1">' . $output . '</ul></nav>' : '') ;// '<div class="' . $this->style_results . '">' . str_replace($find, $replace, $this->text) . '</div>';
	}
}
?>