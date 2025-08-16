<?php 
class ModelPaymentCOD extends Model {
	public function getMethod($address, $total) {
		$this->language->load('payment/cod');

		if ($this->config->get('cod_total') > 0 && $this->config->get('cod_total') > $total) {
			$status = false;
		} else {
			$status = true;
		}

		$method_data = array();

		if ($status) {  
			$method_data = array(
				'code'       => 'cod',
				'title'      => $this->language->get('text_title'),
				'sort_order' => $this->config->get('cod_sort_order')
			);
		}

		return $method_data;
	}
}
?>