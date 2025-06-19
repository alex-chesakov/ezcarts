<?php 
class ControllerCatalog extends Controller {
	public function index() {
		
		$this->load->model('tool/image'); 
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else { 
			$page = 1;
		}
		
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}
		
		$this->data['products'] = array();

		$data = array(
			'filter_category_id' => 0,
			'sort'               => $sort,
			'order'              => $order,
			'start'              => ($page - 1) * 18,
			'limit'              => 18
		);

		//	$product_total = $this->model_catalog_product->getTotalProducts($data); 

		$sql = "SELECT * FROM " . DB_PREFIX . "product ";
		if(!empty($this->session->data['location'])){
			$sql.= "WHERE location LIKE '" . $this->db->escape(utf8_strtolower($this->session->data['location'])) . "'";
		}
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}				
			if ($data['limit'] < 1) {
				$data['limit'] = 18;
			}	
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		$query = $this->db->query($sql);
echo $this->session->data['location'];
		foreach ($query->rows as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
			} else {
				$image = false;
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
//				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
				'case_price'       => $case_price,
				'href'        => $this->url->link('product', 'product_id=' . $result['product_id'] )
			);
		}

		$this->template = 'default/template/catalog.tpl';
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer'
		);
$settings = array();
$settings['type_header'] = 2;
$settings['class_body'] = 'min-h-screen flex flex-col';
		
$this->data['header'] = $this->getChild('header',$settings);
$this->response->setOutput($this->render());	
	}
}