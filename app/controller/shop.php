<?php
class ControllerShop extends Controller {
	private $error = array();
	private $limit = 18;//	18

	public function index() {
		
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('login', '', 'SSL');
			$this->redirect($this->url->link('login', '', 'SSL'));
		}
		
		$this->data['heading_title'] = 'All Products';
		
		$this->data['go_mykitchen'] = $this->url->link('mykitchen');
		$this->data['products'] = array();
		
		$this->data['go_shop'] = $this->url->link("shop","");

//	проверяем есть ли локация и кухни
if(!empty($this->session->data['location']) and !empty($this->session->data['kitchen_id'])){
	$this->load->model('tool/image'); 
	if (isset($this->request->get['page'])) {$page = $this->request->get['page'];} else { $page = 1;}
			
	if (isset($this->request->get['sort'])) {$sort = $this->request->get['sort'];} else {$sort = 'name';}

	if (isset($this->request->get['order'])) {$order = $this->request->get['order'];} else {$order = 'ASC';}
	
//	выводим список категорий
		$this->data['categories'] = array();
		$sql = "SELECT * FROM " . DB_PREFIX . "category WHERE status = 1 ORDER BY name ASC";
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
//	получаем список товаров
		$data = array(
			'sort'               => $sort,
			'order'              => $order,
			'start' => ($page - 1) * $this->limit,
			'limit' => $this->limit
		);

		$sql = "SELECT * FROM " . DB_PREFIX . "product ";
		$sql_total = "SELECT COUNT(DISTINCT product_id) AS total FROM " . DB_PREFIX . "product ";
		
		if(!empty($this->session->data['location'])){
			$sql.= "WHERE location LIKE '" . $this->db->escape(utf8_strtolower($this->session->data['location'])) . "'";
			$sql_total.= "WHERE location LIKE '" . $this->db->escape(utf8_strtolower($this->session->data['location'])) . "'";
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
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			} else {
				$image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			}

			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$case_price = (float)$result['case_price'];
			} else {
				$case_price = false;
			}

			$this->data['products'][] = array(
				'product_id'  => $result['product_id'],
				'thumb'       => $image,
				'name'        => $result['name'],
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
				'case_price'       => $case_price,
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
			'common/footer'	
		);
$settings = array();
$settings['type_header'] = 2;//	когда уже авторизованы
$settings['class_body'] = 'min-h-screen flex flex-col';
		
$this->data['header'] = $this->getChild('header',$settings);
		$this->response->setOutput($this->render());
	}
	public function search(){
		$json = array();
		if ($this->customer->isLogged() and !empty($this->session->data['location']) and !empty($this->session->data['kitchen_id']) and !empty($this->request->get['search'])) {
			$json['products'] = array();
			$sql = "SELECT * FROM " . DB_PREFIX . "product WHERE 1=1 ";
			
			if(!empty($this->session->data['location'])){
				$sql.= "AND location LIKE '" . $this->db->escape(utf8_strtolower($this->session->data['location'])) . "'";
			}
			if(!empty($this->request->get['search'])){
				//	немного подчистим search
				$this->request->get['search'] = utf8_substr(strip_tags(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8')), 0, 120);
				$this->request->get['search'] = str_replace(array('"',"'",'%','SELECT','select','INSERT','insert','%22','script'), '', $this->request->get['search']);
				$sql.= "AND name LIKE '%" . $this->db->escape(utf8_strtolower($this->request->get['search'])) . "%'";
			}
			$sql.= "LIMIT 5";
			
			$query = $this->db->query($sql);
			if($query->num_rows){
				$this->load->model('tool/image');
				foreach($query->rows as $result){
					if ($result['image']) {
						$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
					} else {
						$image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
					}
					$json['products'][] = array(
						'product_id'  => $result['product_id'],
						'thumb'       => $image,
						'name'        => $result['name'],
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