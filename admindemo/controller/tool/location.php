<?php    
class ControllerToolLocation extends Controller { 
	private $error = array();

	public function index() {

		$this->data['success'] = '';

		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {

			foreach($this->request->post['location_id'] as $location_id=>$row){
				if(!empty($row)){
					$this->db->query("UPDATE " . DB_PREFIX . "locations SET location_address = '" . $this->db->escape(trim($row)) . "' WHERE location_id = '" . (int)$location_id . "'");
				}
			}

			$this->data['success'] = 'Change location address';

			//	$this->session->data['success'] = $this->language->get('text_success');
			//	$this->redirect($this->url->link('setting/store', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$this->data['action'] = $this->url->link('tool/location', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['locations'] = array();

//	выбираем товары с локализацией и группируем их для вывода из products
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product GROUP BY location ORDER BY location ASC");
		
		if($query->num_rows){
			foreach($query->rows as $row){
				$query_v = $this->db->query("SELECT * FROM " . DB_PREFIX . "locations WHERE location_name LIKE '" . $this->db->escape(trim($row['location'])) . "'");
				if(!$query_v->num_rows){
					$this->db->query("INSERT INTO " . DB_PREFIX . "locations SET location_name = '" . $this->db->escape(trim($row['location'])) . "' ");
				}
			}
		}
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "locations GROUP BY location_name ORDER BY location_name ASC");
		if($query->num_rows){
			foreach($query->rows as $row){
				$this->data['locations'][] = array(
					'location_name' => $row['location_name'],
					'location_id' => $row['location_id'],
					'location_address' => $row['location_address']
				);
			}
		}
			
		
		$this->template = 'tool/location.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}
	
}