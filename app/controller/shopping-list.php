<?php 
class ControllerShoppingList extends Controller { 
	public function index() {
		if (!$this->customer->isLogged()) { $this->redirect($this->url->link('login', '', 'SSL'));}
		
		$this->load->model('tool/image');
		
		$this->data['go_shop'] = $this->url->link('shop');
		
		$this->data['wish_products'] = array();
		$query_wish = $this->db->query("SELECT * FROM " . DB_PREFIX . "wish WHERE customer_id = '" . (int)$this->customer->getId() . "'");
		if($query_wish->num_rows){
			foreach($query_wish->rows as $row){
				//$sql = 
				$query_product = $this->db->query("SELECT * FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$row['product_id'] . "' ");
				if($query_product->num_rows){
					if ($query_product->row['image'] and file_exists(DIR_IMAGE  . $query_product->row['image'])) {
						$image = $this->model_tool_image->resize($query_product->row['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
					} else {
						$image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
					}
					$price = number_format((float)$query_product->row['case_price'],2);
					$type = 'case';
					if(!empty($query_product->row['unit_price'])){
						$price = number_format((float)$query_product->row['unit_price'],2);
						$type = 'unit';
					}

					$this->data['wish_products'][] = array(
						'product_id'  => $query_product->row['product_id'],
						'wish_id'  => $row['wish_id'],
						'thumb'       => $image,
						'name'        => $query_product->row['name'],
						'location'        => $query_product->row['location'],
						'description' => utf8_substr(strip_tags(html_entity_decode($query_product->row['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
						'case_price'       => number_format((float)$query_product->row['case_price'],2),
						'unit_price'       => number_format((float)$query_product->row['unit_price'],2),
						'price' => $price,
						'type' => $type,
						'href'        => $this->url->link('product', 'product_id=' . $query_product->row['product_id'] )
					);
				}else{
					$this->db->query("DELETE FROM " . DB_PREFIX . "wish WHERE customer_id = '" . (int)$this->customer->getId() . "' AND product_id = '" . (int)$row['product'] . "'");
				}
			}
		}
		
		$this->data['s_list'] = array();
		$query_s_list = $this->db->query("SELECT * FROM " . DB_PREFIX . "s_list WHERE customer_id = '" . (int)$this->customer->getId() . "'");
		if($query_s_list->num_rows){
			foreach($query_s_list->rows as $row){
				$products = array();
				
				//	s_products
				$query_s_products = $this->db->query("SELECT * FROM " . DB_PREFIX . "s_products sp LEFT JOIN " . DB_PREFIX . "product p ON (p.product_id = sp.product_id) WHERE sp.s_list_id = '" . (int)$row['s_list_id'] . "' AND sp.customer_id = '" . (int)$this->customer->getId() . "'");
				if($query_s_products->num_rows){
					foreach($query_s_products->rows as $prow){
						
						if ($prow['image'] and file_exists(DIR_IMAGE  . $prow['image'])) {
							$image = $this->model_tool_image->resize($prow['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
						} else {
							$image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
						}
						$price = number_format((float)$prow['case_price'],2);
						$type = 'case';
						if(!empty($prow['unit_price'])){
							$price = number_format((float)$prow['unit_price'],2);
							$type = 'unit';
						}
						$products[] = array(
							'product_id'  => $prow['product_id'],
							'thumb'       => $image,
							'name'        => $prow['name'],
							'location'        => $prow['location'],
							'description' => utf8_substr(strip_tags(html_entity_decode($prow['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
							'case_price'       => number_format((float)$prow['case_price'],2),
							'unit_price'       => number_format((float)$prow['unit_price'],2),
							'price' => $price,
							'type' => $type,
							'href'        => $this->url->link('product', 'product_id=' . $prow['product_id'] )
						);
					}
				}
				$this->data['s_list'][$row['s_list_id']] = array(
					's_list_id' => $row['s_list_id'],
					'name' => $row['name'],
					'products' => $products
				);
			}
		}
		
		$this->template = 'default/template/shopping-list.tpl';
		$this->children = array('common/column_left','common/column_right','common/content_top','common/content_bottom','footer');
		$settings = array();
		$settings['type_header'] = 2;
		$settings['class_body'] = 'min-h-screen bg-gray-50 flex flex-col';
				
		$this->data['header'] = $this->getChild('header',$settings);
		$this->response->setOutput($this->render());
	}
	public function addname() {
		$json = array();
		if ($this->customer->isLogged() and !empty($this->request->post['s_list_name'])) {
			$query = $this->db->query("SELECT s_list_id FROM " . DB_PREFIX . "s_list WHERE customer_id = '" . (int)$this->customer->getId() . "' AND name = '" . $this->db->escape($this->request->post['s_list_name']) . "'");
			if($query->num_rows){
$json['success']= 'This shopping list is already there';
			}else{
				$this->db->query("INSERT INTO " . DB_PREFIX . "s_list SET customer_id = '" . (int)$this->customer->getId() . "', name = '" . $this->db->escape($this->request->post['s_list_name']) . "'");
$json['success']= 'New List Created';
				$json['s_list_name'] = $this->request->post['s_list_name'];
				$json['s_list_id'] = $this->db->getLastId();
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	public function delete() {
		$json = array();

		if ($this->customer->isLogged() and !empty($this->request->post['s_list_id'])) {
			$json['debag'] = $this->request->post;
			$query = $this->db->query("SELECT s_list_id FROM " . DB_PREFIX . "s_list WHERE customer_id = '" . (int)$this->customer->getId() . "' AND s_list_id = '" . (int)$this->request->post['s_list_id'] . "'");
	
			if($query->num_rows){
				$this->db->query("DELETE FROM " . DB_PREFIX . "s_list WHERE s_list_id = '" . (int)$query->row['s_list_id'] . "'");
				$this->db->query("DELETE FROM " . DB_PREFIX . "s_products WHERE s_list_id = '" . (int)$query->row['s_list_id'] . "'");
$json['success']= 'List deleted';
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	public function addsp() {
		$json = array();

		if ($this->customer->isLogged() and !empty($this->request->post['s_list_id']) and !empty($this->request->post['product_id'])) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "s_products WHERE s_list_id = '" . (int)$this->request->post['s_list_id'] . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND product_id = '" . (int)$this->request->post['product_id'] . "'");
			if(!$query->num_rows){
				$this->db->query("INSERT INTO " . DB_PREFIX . "s_products SET customer_id = '" . (int)$this->customer->getId() . "', product_id = '" . (int)$this->request->post['product_id'] . "', s_list_id = '" . (int)$this->request->post['s_list_id'] . "'");
$json['success']= 'Item added';
			}else{
$json['success']= 'Item is exist';
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	public function deletesp(){
		$json = array();

		if ($this->customer->isLogged() and !empty($this->request->post['s_list_id']) and !empty($this->request->post['product_id'])) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "s_products WHERE s_list_id = '" . (int)$this->request->post['s_list_id'] . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND product_id = '" . (int)$this->request->post['product_id'] . "'");
$json['debug'] = $query->rows;
			if($query->num_rows){
				$this->db->query("DELETE FROM " . DB_PREFIX . "s_products WHERE customer_id = '" . (int)$this->customer->getId() . "' AND product_id = '" . (int)$this->request->post['product_id'] . "' AND s_list_id = '" . (int)$this->request->post['s_list_id'] . "'");
$json['success']= 'Item removed';
			}else{
$json['success']= 'Item is not exist';
			}
		}
		$this->response->setOutput(json_encode($json));
	}
}