<?php
class ModelTotalServicefree extends Model {
	public function getTotal(&$total_data, &$total) {

		$s_f = ($total / 100 * 20);
		$s_f = round((float)$s_f, 2);
		$total_data[] = array( 
			'code'       => 'servicefree',
			'title'      => 'Service Free',
			'text'       => '$' . number_format((float)$s_f,2),
			'value'      => (float)$s_f,
			'sort_order' => $this->config->get('servicefree_sort_order')
		);



		$total += (float)$s_f;

	}
}
