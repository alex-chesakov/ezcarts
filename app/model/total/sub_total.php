<?php
class ModelTotalSubTotal extends Model {
	public function getTotal(&$total_data, &$total) {
		$this->language->load('total/sub_total');
		
		$sub_total = $this->cart->getSubTotal();

		$total_data[] = array( 
			'code'       => 'sub_total',
			'title'      => $this->language->get('text_sub_total'),
			'text'       => number_format(($sub_total),2),
			'value'      => $sub_total,
			'sort_order' => $this->config->get('sub_total_sort_order')
		);
		
		$total += $sub_total;
	}
}
?>