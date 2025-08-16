
<?php
class ModelTotalstripefree extends Model {
	public function getTotal(&$total_data, &$total) {
		//	Credit Card Fee (2.5%)
		//	(38.7+20%) + 2.5% = 47.6
		$s_f = ($total / 100 * 2.5);
		$s_f = round((float)$s_f, 2);
		$total_data[] = array( 
			'code'       => 'stripefree',
			'title'      => 'Credit Card Fee (2.5%)',
			'text'       => '$' . number_format((float)$s_f,2),
			'value'      => (float)$s_f,
			'sort_order' => $this->config->get('stripefree_sort_order')
		);



		$total += (float)$s_f;

	}
}