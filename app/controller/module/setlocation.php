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
			$json['location'] = $location;
			$json['redirect'] = $this->url->link("home");
		}
		$this->response->setOutput(json_encode($json));
	}
	protected function index($setting = array()) {
		//	проверяем на авторизацию
		if ($this->customer->isLogged()) {
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
				$this->session->data['location'] = $this->request->get['location'];
			}
			
			$this->data['locations'] = array();
			$this->data['location'] = '';
			//	выбираем товары с локализацией и группируем их для вывода
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product GROUP BY location ORDER BY location ASC");//	WHERE code = '" . $this->db->escape($currency) . "'
			if($query->num_rows){
				foreach($query->rows as $row){
					if(!empty($row['location'])){
						$this->data['locations'][trim($row['location'])] = trim($row['location']);
					}
				}
				
				if(empty($this->session->data['location'])){
					$this->data['location'] = reset($this->data['locations']);
					$this->session->data['location'] = $this->data['location'];
					if($this->customer->isLogged()){
						$this->db->query("UPDATE " . DB_PREFIX . "customer SET location = '" . $this->db->escape($this->data['location']) . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
					}
				}

			}

			if(!empty($this->session->data['location']) and !empty($this->data['locations'][trim($this->session->data['location'])])){
				$this->data['location'] = $this->data['locations'][trim($this->session->data['location'])];
				$this->session->data['location'] = $this->data['location'];
				if($this->customer->isLogged()){
					$this->db->query("UPDATE " . DB_PREFIX . "customer SET location = '" . $this->db->escape($this->data['location']) . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
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
			//	проверим выбранную локацию
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