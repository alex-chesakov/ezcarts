<?php
class ControllerModuleSetlocation extends Controller {
	private $error = array();
	public function search() {
		$json = array();
		$json['find'] = '';
		if(!empty($this->request->get['search'])) {
			$this->request->get['search'] = utf8_strtolower($this->request->get['search']);
			$this->request->get['search'] = utf8_substr(strip_tags(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8')), 0, 120) ;
			$this->request->get['search'] = str_replace(array('"',"'",'%','SELECT','select','INSERT','insert','%22','script'), '', $this->request->get['search']);
			$query = $this->db->query("SELECT location FROM " . DB_PREFIX . "product WHERE location LIKE '%" . $this->db->escape($this->request->get['search']) . "%'");
			if($query->num_rows){
				$json['find'] = $query->row['location'];
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	public function ajax() {
		$json = array();
		if($location = $this->validate()) {
			$this->session->data['location'] = $location;
			$this->db->query("UPDATE " . DB_PREFIX . "customer SET location = '" . $this->db->escape(trim($location)) . "', approved_location = '1' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
			
			$json['location'] = $location;
			$json['redirect'] = $this->url->link("home");

			$query = $this->db->query("SELECT cart_id FROM " . DB_PREFIX . "cart WHERE customer_id = '" . (int)$this->customer->getId() . "'");
			if($query->num_rows){
	
				$this->db->query("DELETE FROM " . DB_PREFIX . "cart_products WHERE cart_id = '" . (int)$query->row['cart_id'] . "' AND location NOT LIKE '" . $this->db->escape($location) . "'");
				
			
				$query_p = $this->db->query("SELECT product_id FROM " . DB_PREFIX . "cart_products WHERE cart_id = '" . (int)$query->row['cart_id'] . "'");
				if(!$query_p->num_rows){
				
					$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE customer_id = '" . (int)$this->customer->getId() . "'");
		
					$query = $this->db->query("SELECT cart_id FROM " . DB_PREFIX . "cart ORDER BY cart_id DESC LIMIT 1");
					if($query->num_rows){
						$cart_id = $query->row['cart_id'];
						$cart_id = $cart_id +1;
					}else{
						$cart_id = 0;
					}
					$this->db->query("ALTER TABLE `" . DB_PREFIX . "cart` AUTO_INCREMENT = " . (int)$cart_id);
				}
				
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	protected function index($setting = array()) {
		
		if ($this->customer->isLogged()) {
			
			if(!empty($this->customer->getLocation())){	//	utf8_strtolower($this->customer->getLocation())
				$location = trim($this->customer->getLocation());
				$this->session->data['location'] = $location;
			}elseif(!empty($this->session->data['location'])){
				$location = trim($this->session->data['location']);
			}else{
				$location = false;
			}

			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
				$this->session->data['location'] = trim($this->request->get['location']);
				$location = trim($this->request->get['location']);
				$this->db->query("UPDATE " . DB_PREFIX . "customer SET location = '" . $this->db->escape(trim($location)) . "', approved_location = '1' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
			}
			$this->data['cart_locations'] = array();

			$sql = "SELECT cp.location AS location FROM " . DB_PREFIX . "cart_products cp ";
			$sql.= "LEFT JOIN " . DB_PREFIX . "cart c ON (c.cart_id = cp.cart_id) ";
			$sql.= "WHERE c.customer_id = '" . (int)$this->customer->getId() . "' ";
			$query = $this->db->query($sql);
			if($query->num_rows){
				foreach($query->rows as $row){
					$this->data['cart_locations'][$row['location']] = $row['location'];
				}
			}
			
			$this->data['locations'] = array();
			$this->data['location'] = '';
		
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product GROUP BY location ORDER BY location ASC");//	WHERE code = '" . $this->db->escape($currency) . "'
			if($query->num_rows){
				foreach($query->rows as $row){
					if(!empty($row['location'])){
						$this->data['locations'][trim($row['location'])] = trim($row['location']);
					}
				}
				
				if(empty($location)){
					$this->data['location'] = reset($this->data['locations']);
					
					$location = trim($this->data['location']);
					$this->session->data['location'] = $location;
					
					if($this->customer->isLogged()){
						$this->db->query("UPDATE " . DB_PREFIX . "customer SET location = '" . $this->db->escape($location) . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
					}
				}

			}

			if(!empty($location) and !empty($this->data['locations'][trim($location)])){
				$this->data['location'] = $this->data['locations'][trim($location)];
				$location = trim($this->data['location']);
				$this->session->data['location'] = $location;
				if($this->customer->isLogged()){
					$this->db->query("UPDATE " . DB_PREFIX . "customer SET location = '" . $this->db->escape($location) . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
				}
			}

			if (isset($this->error['warning'])) {
				$this->data['error_warning'] = $this->error['warning'];
			} else {
				$this->data['error_warning'] = '';
			}
		
			$this->template = 'default/template/module/setlocation.tpl';
			$this->render();
		}
	}
	private function validate(){
		if ($this->customer->isLogged()) {
		
			if(!empty($this->request->get['location'])){
				$this->request->get['location'] = utf8_strtolower($this->request->get['location']);
				$this->request->get['location'] = utf8_substr(strip_tags(html_entity_decode($this->request->get['location'], ENT_QUOTES, 'UTF-8')), 0, 120) ;
				$this->request->get['location'] = str_replace(array('"',"'",'%','SELECT','select','INSERT','insert','%22','script'), '', $this->request->get['location']);
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product WHERE location LIKE '" . $this->db->escape($this->request->get['location']) . "'");
				if($query->num_rows){
					return $query->row['location'];
				}else{
$this->error['warning'] = 'Not location';
				}
			}else{
$this->error['warning'] = 'Not location';
			}
		}
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}