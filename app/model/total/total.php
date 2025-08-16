<?php
class ModelTotalTotal extends Model {
	public function getTotal(&$total_data, &$total) {
		$this->language->load('total/total');

		$total_data[] = array(
			'code'       => 'total',
			'title'      => $this->language->get('text_total'),
			'text'       => max(0, $total),
			'value'      => max(0, $total),
			'sort_order' => $this->config->get('total_sort_order')
		);
	}
}
?>