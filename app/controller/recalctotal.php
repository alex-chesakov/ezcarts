<?php
class Controllerrecalctotal extends Controller {
	
	public function index() {
		$json = array();
		
		$this->load->model('setting/extension');
		$total_data = array();					
		$total = 0;

		$sort_order = array(); 
		$results = $this->model_setting_extension->getExtensions('total');
		foreach ($results as $key => $value) {
			$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
		}
		array_multisort($sort_order, SORT_ASC, $results);
		foreach ($results as $result) {
			if ($this->config->get($result['code'] . '_status')) {
				$this->load->model('total/' . $result['code']);
				$this->{'model_total_' . $result['code']}->getTotal($total_data, $total);
			}
			$sort_order = array(); 
			foreach ($total_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}
			array_multisort($sort_order, SORT_ASC, $total_data);			
		}

		$json['totals'] = $total_data;
		
		$this->response->setOutput(json_encode($json));
	}
	
}