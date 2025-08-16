<?php
class ControllerMyKitchen extends Controller {
/*

INSERT INTO `l_my_kitchen` (`kitchen_id`, `customer_id`, `name`, `address`) VALUES (NULL, '1', 'Aurora2', '1234 Meridian Ave, San Jose, CA 95125');
*/
	private $error = array();
	public function changeaddress(){
		$json = array();

		if ($this->customer->isLogged() and !empty($this->request->get['kitchen_id']) and !empty($this->request->post['address'])){
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "my_kitchen WHERE customer_id = '" . (int)$this->customer->getId() . "' AND kitchen_id='" . (int)$this->request->get['kitchen_id'] . "'");
			if($query->num_rows){

				$this->db->query("UPDATE " . DB_PREFIX . "my_kitchen SET address = '" . $this->db->escape(trim($this->request->post['address'])) . "' WHERE kitchen_id = '" . (int)$query->row['kitchen_id'] . "' AND customer_id = '" . (int)$this->customer->getId() . "'");
				
				$json['success'] = array(
					'name' => $query->row['name'],
					'address' => $this->request->post['address']
				);
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	public function add(){
		$json = array();
		if ($this->customer->isLogged() and !empty($this->request->get['name'])){
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "my_kitchen WHERE customer_id = '" . (int)$this->customer->getId() . "' AND name LIKE '" . $this->db->escape(trim($this->request->get['name'])) . "'");
			if($query->num_rows){
				
			}else{
				$this->db->query("INSERT INTO " . DB_PREFIX . "my_kitchen SET customer_id = '" . (int)$this->customer->getId() . "', name='" . $this->db->escape(trim($this->request->get['name'])) . "'");
				
				$json['success'] = trim($this->request->get['name']);
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	public function changekitchen(){
		$json = array();
		if ($this->customer->isLogged() and !empty($this->request->get['kitchen_id'])){
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "my_kitchen WHERE customer_id = '" . (int)$this->customer->getId() . "' AND kitchen_id='" . (int)$this->request->get['kitchen_id'] . "'");
			if($query->num_rows){
				$this->session->data['kitchen_id'] = $query->row['kitchen_id'];
//	reset approved_location for google geo
				$this->db->query("UPDATE " . DB_PREFIX . "customer SET approved_location = 0, kitchen_id = '" . (int)$query->row['kitchen_id'] . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
				$json['success'] = array(
					'name' => $query->row['name'],
					'address' => $query->row['address']
				);
				$json['redirect'] = $this->url->link("shop");
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	public function remove() {
		$json = array();
		if ($this->customer->isLogged() and !empty($this->request->get['kitchen_id'])){
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "my_kitchen WHERE customer_id = '" . (int)$this->customer->getId() . "' AND kitchen_id='" . (int)$this->request->get['kitchen_id'] . "'");
			if($query->num_rows){
				$this->db->query("DELETE FROM " . DB_PREFIX . "my_kitchen WHERE customer_id = '" . (int)$this->customer->getId() . "' AND kitchen_id='" . (int)$this->request->get['kitchen_id'] . "'");
$json['success'] = 'Success Delete Kitchen: ' . $query->row['name'];
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('login', '', 'SSL');
			$this->redirect($this->url->link('login', '', 'SSL'));
		}

		$this->data['my_kitchens'] = array();
		if($this->customer->isLogged()){
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "my_kitchen WHERE customer_id = '" . (int)$this->customer->getId() . "'");
			if($query->num_rows){
				foreach($query->rows as $row){
					$this->data['my_kitchens'][$row['kitchen_id']] = array(
						'kitchen_id' => $row['kitchen_id'],
						'name' => $row['name'],
						'address' => $row['address']
					);
				}
			}
			
		}
		
		
		$this->template = 'default/template/mykitchen.tpl';
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'footer'	
		);
$settings = array();
$settings['type_header'] = 3;
$settings['class_body'] = 'min-h-screen flex flex-col';
		
$this->data['header'] = $this->getChild('header',$settings);
		$this->response->setOutput($this->render());
	}
}