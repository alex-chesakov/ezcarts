<?php 
class ControllerModuleCart extends Controller {
	public function index() {
		if($this->customer->isLogged()){
		
			$this->language->load('module/cart');

			if (isset($this->request->get['remove'])) {
				$this->cart->remove($this->request->get['remove']);
			}
			
			if(!empty($this->customer->getLocation())){	//	utf8_strtolower($this->customer->getLocation())
				$location = trim($this->customer->getLocation());
				$this->session->data['location'] = $location;
			}elseif(!empty($this->session->data['location'])){
				$location = trim($this->session->data['location']);
			}else{
				$location = false;
			}

		// Totals
		$this->load->model('setting/extension');

		$total_data = array();					
		$total = 0;
		$taxes = 0;

		// Display prices
		if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
			$sort_order = array(); 

			$results = $this->model_setting_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('total/' . $result['code']);

					$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
				}

				$sort_order = array(); 

				foreach ($total_data as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}

				array_multisort($sort_order, SORT_ASC, $total_data);			
			}		
		}

		$this->data['totals'] = $total_data;

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_items'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() , $total);
		$this->data['text_empty'] = $this->language->get('text_empty');
		$this->data['text_cart'] = $this->language->get('text_cart');
		$this->data['text_checkout'] = $this->language->get('text_checkout');
		$this->data['text_payment_profile'] = $this->language->get('text_payment_profile');

		$this->data['button_remove'] = $this->language->get('button_remove');

			$this->load->model('tool/image');

			$this->data['products'] = array();
			$this->data['cart_total'] = 0;

			$sql = "SELECT *, c.cart_id AS cart_id, p.name AS name, cp.type AS type, p.case_price AS case_price, p.unit_price AS unit_price, cp.quantity AS quantity, cp.type AS type FROM " . DB_PREFIX . "cart_products cp ";
			$sql.= "LEFT JOIN " . DB_PREFIX . "cart c ON (c.cart_id = cp.cart_id) ";
			$sql.= "LEFT JOIN " . DB_PREFIX . "product p ON (p.product_id = cp.product_id) ";
			$sql.= "WHERE c.customer_id = '" . (int)$this->customer->getId() . "' ";
			$query = $this->db->query($sql);
			
			if($query->num_rows){
				foreach ($query->rows as $result) {
if(!empty($location) and utf8_strtolower(trim($result['location']))==utf8_strtolower($location)){
					if (!empty($result['image']) and file_exists(DIR_IMAGE . $result['image'])) {
						$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
					} else {
						$image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
					}
					if($result['type']=='case'){
						$price = floatval($result['case_price']) * (int)$result['quantity'];
					}else{
						$price = floatval($result['unit_price']) * (int)$result['quantity'];
					}

					$this->data['products'][] = array(
						'cart_id'  => $result['cart_id'],
						'product_id'  => $result['product_id'],
						'thumb'       => $image,
						'name'        => $result['name'],
						'type'        => $result['type'],
						'quantity' => $result['quantity'],
						
//						'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
						'price'       => number_format((float)$price,2),
						'href'        => $this->url->link('product', 'product_id=' . $result['product_id'] )
					);

					$this->data['cart_total'] = ((float)$this->data['cart_total'] + ((float)$price));
}else{
	$this->db->query("DELETE FROM " . DB_PREFIX . "cart_products WHERE cart_id = '" . (int)$result['cart_id'] . "'");
}
				}
			}

			$this->data['cart_total'] = number_format($this->data['cart_total'],2, '.', ',');
			

			$this->data['checkout'] = $this->url->link('checkout', '', 'SSL');
			$this->template = 'default/template/module/cart.tpl';
			$this->response->setOutput($this->render());
		}		
	}
}
?>