<?php 
class ControllerProduct extends Controller {
	public function index() {
		
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('login', '', 'SSL');
			$this->redirect($this->url->link('login', '', 'SSL'));
		}
		
		$this->data['go_shop'] = $this->url->link('shop');
		
		if(!empty($this->session->data['location']) and !empty($this->session->data['kitchen_id']) and !empty($this->request->get['product_id'])){
			$this->load->model('tool/image'); 
			
			//	находим данные товара
			$sql = "SELECT * FROM " . DB_PREFIX . "product ";
			$sql.= "WHERE product_id = '" . (int)$this->request->get['product_id'] . "' ";
			if(!empty($this->session->data['location'])){
				$sql.= "AND location LIKE '" . $this->db->escape(utf8_strtolower($this->session->data['location'])) . "'";
			}
			$query = $this->db->query($sql);
			if($query->num_rows){
				$this->data['product_id'] = (int)$query->row['product_id'];
				
				$this->data['product_name'] = $query->row['name'];
				if ($query->row['image']) {
					$this->data['product_popup'] = $this->model_tool_image->resize($query->row['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
				} else {
					$this->data['product_popup'] = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
				}
				$this->data['product_description'] = $query->row['description'];
				$this->data['product_item'] = $query->row['item'];
				$this->data['product_upc'] = $query->row['upc'];
				$this->data['product_bin'] = $query->row['bin'];
				$this->data['product_unit_price'] = (float)$query->row['unit_price'];
				$this->data['product_case_price'] = (float)$query->row['case_price'];
				$this->data['product_rating'] = (int)$query->row['rating'];
				$this->data['product_votes'] = $query->row['votes'];
				
				//	находим доп изображения товара
				$this->data['product_images'] = array();
				$sql = "SELECT * FROM " . DB_PREFIX . "product_image ";
				$sql.= "WHERE product_id = '" . (int)$this->request->get['product_id'] . "' ";
				$query_images = $this->db->query($sql);
				if($query_images->num_rows){
					foreach($query_images->rows as $row){
						if (file_exists(DIR_IMAGE . $row['image']) and is_file(DIR_IMAGE . $row['image'])) {
							$this->data['product_images'][] = $this->model_tool_image->resize($row['image'], $this->config->get('config_image_popup_width'), $this->config->get('config_image_popup_height'));
						}
					}
				}
				//	находим название категории
				$this->data['product_category_name'] = 'Catalog';
				$sql = "SELECT * FROM " . DB_PREFIX . "category ";
				$sql.= "WHERE category_id = '" . (int)$query->row['category_id'] . "' ";
				$query_cat = $this->db->query($sql);
				if($query_cat->num_rows){
					$this->data['product_category_name'] = $query_cat->row['name'];
				}

				if(!empty($this->data['product_unit_price'])){
					$this->data['product_price'] = $this->data['product_unit_price'];
					$this->data['product_price_type'] = 'unit';
				}
				if(!empty($this->data['product_case_price'])){
					$this->data['product_price'] = $this->data['product_case_price'];
					$this->data['product_price_type'] = 'case';
				}
//	Similar Products = другие продукты из той же категории и локации
				$this->data['similar_products'] = array();
				$sql = "SELECT * FROM " . DB_PREFIX . "product ";
				$sql.= "WHERE category_id = '" . (int)$query->row['category_id'] . "' ";
				if(!empty($this->session->data['location'])){
					$sql.= "AND location LIKE '" . $this->db->escape(utf8_strtolower($this->session->data['location'])) . "'";
				}
				$sql.= " AND product_id <> " . (int)$this->data['product_id'] . " GROUP BY product_id LIMIT 10";
				$query_similar = $this->db->query($sql);
				if($query_similar->num_rows){
					foreach($query_similar->rows as $result){
						if ($result['image']) {
							$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
						} else {
							$image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
						}
						if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
							$case_price = (float)$result['case_price'];
							$price = $case_price;
							$price_type = 'case';
						} else {
							$case_price = false;
						}
						if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
							$unit_price = (float)$result['unit_price'];
							$price = $unit_price;
							$price_type = 'unit';
						} else {
							$unit_price = false;
						}

						//	находим название категории
						$category_name = 'Catalog';
						$sql = "SELECT * FROM " . DB_PREFIX . "category ";
						$sql.= "WHERE category_id = '" . (int)$query->row['category_id'] . "' ";
						$query_cat_sm = $this->db->query($sql);
						if($query_cat_sm->num_rows){
							$category_name = $query_cat_sm->row['name'];
						}
						$this->data['similar_products'][] = array(
							'product_id'  => $result['product_id'],
							'thumb'       => $image,
							'name'        => $result['name'],
							'category_name' => $category_name,
							'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
							'case_price'       => $case_price,
							'unit_price' => $unit_price,
							'price'       => $price,
							'price_type'       => $price_type,
							'href'        => $this->url->link('product', 'product_id=' . $result['product_id'] )
						);
					}
				}
//	Like Products = другие продукты из той же локации
				$this->data['like_products'] = array();
				$sql = "SELECT * FROM " . DB_PREFIX . "product ";
				$sql.= "WHERE 1=1 ";
				if(!empty($this->session->data['location'])){
					$sql.= "AND location LIKE '" . $this->db->escape(utf8_strtolower($this->session->data['location'])) . "'";
				}
				$sql.= " GROUP BY product_id LIMIT 10";
				$query_similar = $this->db->query($sql);
				if($query_similar->num_rows){
					foreach($query_similar->rows as $result){
						if ($result['image']) {
							$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
						} else {
							$image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
						}
						if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
							$case_price = (float)$result['case_price'];
							$price = $case_price;
							$price_type = 'case';
						} else {
							$case_price = false;
						}
						if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
							$unit_price = (float)$result['unit_price'];
							$price = $unit_price;
							$price_type = 'unit';
						} else {
							$unit_price = false;
						}

						//	находим название категории
						$category_name = 'Catalog';
						$sql = "SELECT * FROM " . DB_PREFIX . "category ";
						$sql.= "WHERE category_id = '" . (int)$query->row['category_id'] . "' ";
						$query_cat_sm = $this->db->query($sql);
						if($query_cat_sm->num_rows){
							$category_name = $query_cat_sm->row['name'];
						}
						$this->data['like_products'][] = array(
							'product_id'  => $result['product_id'],
							'thumb'       => $image,
							'name'        => $result['name'],
							'category_name' => $category_name,
							'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
							'case_price'       => $case_price,
							'unit_price' => $unit_price,
							'price'       => $price,
							'price_type'       => $price_type,
							'href'        => $this->url->link('product', 'product_id=' . $result['product_id'] )
						);
					}
				}
			}else{
				$this->redirect($this->url->link('shop', '', 'SSL'));
			}
		}else{
			$this->redirect($this->url->link('shop', '', 'SSL'));
		}
		

		$this->template = 'default/template/product.tpl';
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