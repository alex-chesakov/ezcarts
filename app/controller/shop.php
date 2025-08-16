<?php
class ControllerShop extends Controller {
	private $error = array();
	private $limit = 18;//	18

	public function index() {
		
		if (!$this->customer->isLogged()) { $this->redirect($this->url->link('login', '', 'SSL'));}

//	success
		if (!empty($this->success)) {
			$this->session->data['success'] = $this->success;;
			$this->redirect($this->url->link('profile', '', 'SSL'));
		} elseif (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {$this->data['success'] = '';}

		if(!empty($this->customer->getLocation())){	//	utf8_strtolower($this->customer->getLocation())
			$location = trim($this->customer->getLocation());
			$this->session->data['location'] = $location;
		}elseif(!empty($this->session->data['location'])){
			$location = trim($this->session->data['location']);
		}else{
			$location = false;
		}

		$this->data['heading_title'] = 'All Products';
		
		$this->data['go_mykitchen'] = $this->url->link('mykitchen');
		$this->data['products'] = array();
		
		$this->data['go_shop'] = $this->url->link("shop","");
			
		if(!empty($location) and !empty($this->session->data['kitchen_id'])){
			$this->load->model('tool/image');
			
			if (isset($this->request->get['page'])) {$page = $this->request->get['page'];} else { $page = 1;}
			
			if (isset($this->request->get['sort'])) {$sort = $this->request->get['sort'];} else {$sort = 'name';}

			if (isset($this->request->get['order'])) {$order = $this->request->get['order'];} else {$order = 'ASC';}
			
			$this->data['categories'] = array();
			$sql = "SELECT * FROM " . DB_PREFIX . "category c WHERE status = 1 ";
			$sql.= "AND EXISTS (SELECT 1  FROM " . DB_PREFIX . "product p WHERE p.category_id = c.category_id) ";
			$sql.= "ORDER BY name ASC";
			$query_cat = $this->db->query($sql);
			if($query_cat->num_rows){
				foreach($query_cat->rows as $row){
					$this->data['categories'][] = array(
						'name' => $row['name'],
						'category_id' => $row['category_id'],
						'href' => $this->url->link("shop","c=" . $row['category_id'])
					);
				}
			}
			$data = array(
				'sort'               => $sort,
				'order'              => $order,
				'start' => ($page - 1) * $this->limit,
				'limit' => $this->limit
			);

			$sql = "SELECT * FROM " . DB_PREFIX . "product ";
			$sql_total = "SELECT COUNT(DISTINCT product_id) AS total FROM " . DB_PREFIX . "product ";


			if(!empty($location)){
				$sql.= "WHERE location LIKE '" . $this->db->escape(utf8_strtolower($location)) . "'";
				$sql_total.= "WHERE location LIKE '" . $this->db->escape(utf8_strtolower($location)) . "'";
			}
			
			if(!empty($this->request->get['c'])){
				$sql.= "AND category_id = '" . (int)$this->request->get['c'] . "'";
				$sql_total.= "AND category_id = '" . (int)$this->request->get['c'] . "'";
			}

			$query_total = $this->db->query($sql_total);
			
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}				
				if ($data['limit'] < 1) {
					$data['limit'] = $this->limit;
				}	
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}
			$query = $this->db->query($sql);

			foreach ($query->rows as $result) {
				//	get name category
				$query_category = $this->db->query("SELECT * FROM " . DB_PREFIX . "category WHERE category_id = '" . (int)$result['category_id'] . "'");
				if($query_category->num_rows){
					$category_name = $query_category->row['name'];
				}else{
					$category_name = "";
				}
				if ($result['image'] and file_exists(DIR_IMAGE  . $result['image'])) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				} else {
					$image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				}
				if(empty($result['unit_price'])){
					$price = (float)$result['case_price'];
					$type = 'case';
				}else{
					$price = (float)$result['unit_price'];
					$type = 'unit';
				}
				$this->data['products'][] = array(
					'product_id'  => $result['product_id'],
					'category_name' => $category_name,
					'thumb'       => $image,
					'type' => $type,
					'name'        => $result['name'],
					'price'       => number_format((float)$price,2),
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
					'case_price'       => (float)$result['case_price'],
					'unit_price'       => (float)$result['unit_price'],
					'href'        => $this->url->link('product', 'product_id=' . $result['product_id'] )
				);
			}
			$pagination = new Pagination();
			$pagination->total = $query_total->row['total'];
			$pagination->page = $page;
			$pagination->limit = $this->limit;
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('shop', 'page={page}');

			$this->data['pagination'] = $pagination->render();
		}

		if(!empty($this->request->get['c'])){
			$sql = "SELECT * FROM " . DB_PREFIX . "category WHERE category_id = '" . (int)$this->request->get['c'] . "'";
			$query_cat = $this->db->query($sql);
			if($query_cat->num_rows){
				$this->data['heading_title'] = $query_cat->row['name'];
			}
		}
		
		$this->template = 'default/template/shop.tpl';
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'footer'	
		);
		$settings = array();
		$settings['type_header'] = 2;
		$settings['class_body'] = 'min-h-screen flex flex-col';
				
		$this->data['header'] = $this->getChild('header',$settings);
		$this->response->setOutput($this->render());
	}

	public function search(){
		$json = array();
		if ($this->customer->isLogged() and !empty($this->customer->getLocation()) and !empty($this->session->data['kitchen_id']) and !empty($this->request->get['search'])) {
			$json['products'] = array();
			$sql = "SELECT * FROM " . DB_PREFIX . "product WHERE 1=1 ";
			
			if(!empty($this->customer->getLocation())){
				$sql.= "AND location LIKE '" . $this->db->escape(utf8_strtolower($this->customer->getLocation())) . "'";
			}
			if(!empty($this->request->get['search'])){
				$this->request->get['search'] = utf8_substr(strip_tags(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8')), 0, 120);
				$this->request->get['search'] = str_replace(array('"',"'",'%','SELECT','select','INSERT','insert','%22','script'), '', $this->request->get['search']);
				$sql.= "AND name LIKE '%" . $this->db->escape(utf8_strtolower($this->request->get['search'])) . "%'";
			}
			$sql.= "LIMIT 5";
			
			$query = $this->db->query($sql);
			if($query->num_rows){
				$this->load->model('tool/image');
				foreach($query->rows as $result){
					if ($result['image'] and file_exists(DIR_IMAGE  . $result['image'])) {
						$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
					} else {
						$image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
					}
					if(empty((float)$result['case_price'])){
						$type = 'unit';
					}else{
						$type = 'case';
					}
					$json['products'][] = array(
						'product_id'  => $result['product_id'],
						'thumb'       => $image,
						'name'        => $result['name'],
						'type'        => $type,
						'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
						'case_price'       => (float)$result['case_price'],
						'unit_price'       => (float)$result['unit_price'],
						'href'        => $this->url->link('product', 'product_id=' . $result['product_id'] )
					);
				}
			}
		}
		$this->response->setOutput(json_encode($json));
	}
}