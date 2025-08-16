<?php
class ControllerCheckout extends Controller {
	private $error = array(); 
	
	public function index() {
		if (!$this->customer->isLogged()) { $this->redirect($this->url->link('login', '', 'SSL'));}
	
		$this->load->model('tool/image');
		
		$this->data['action'] = $this->url->link("checkout/addorder");
		
		$this->data['link_kitchen'] = $this->url->link('mykitchen');

		if(!empty($this->customer->getLocation())){	//	utf8_strtolower($this->customer->getLocation())
			$location = trim($this->customer->getLocation());
			$this->session->data['location'] = $location;
		}elseif(!empty($this->session->data['location'])){
			$location = trim($this->session->data['location']);
		}else{
			$location = false;
		}

		$this->data['products'] = array();
		$this->data['cart_total'] = 0;
		$this->data['item_quantity'] = 0;
//	get products
		$sql = "SELECT *, c.cart_id AS cart_id, p.name AS name, p.bin AS bin, cp.type AS type, p.case_price AS case_price, p.unit_price AS unit_price, cp.quantity AS quantity, cp.type AS type FROM " . DB_PREFIX . "cart_products cp ";
		$sql.= "LEFT JOIN " . DB_PREFIX . "cart c ON (c.cart_id = cp.cart_id) ";
		$sql.= "LEFT JOIN " . DB_PREFIX . "product p ON (p.product_id = cp.product_id) ";
		$sql.= "WHERE c.customer_id = '" . (int)$this->customer->getId() . "' ";
		$query = $this->db->query($sql);
		$cart_id = 0;
			
		if($query->num_rows){
			foreach ($query->rows as $result) {
				if(!empty($location) and utf8_strtolower(trim($result['location']))==utf8_strtolower($location)){
					if (!empty($result['image']) and file_exists(DIR_IMAGE . $result['image'])) {
						$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
					} else {
						$image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
					}
					if($result['type']=='case'){
						$price = (float)$result['case_price'] * (int)$result['quantity'];
					}else{
						$price = (float)$result['unit_price'] * (int)$result['quantity'];
					}
					$this->data['item_quantity'] = $this->data['item_quantity'] + (int)$result['quantity'];
					$this->data['products'][] = array(
						'product_id'  => $result['product_id'],
						'cart_id'  => $result['cart_id'],
						'thumb'       => $image,
						'name'        => $result['name'],
						'type'        => $result['type'],
						'bin' => $result['bin'],
						'quantity' => $result['quantity'],	
	//						'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
						'price'       => number_format((float)$price,2),
						'href'        => $this->url->link('product', 'product_id=' . $result['product_id'] )
					);
					$this->data['cart_total'] = ((float)$this->data['cart_total'] + (float)$price);
				}else{
					$this->db->query("DELETE FROM " . DB_PREFIX . "cart_products WHERE cart_id = '" . (int)$result['cart_id'] . "'");
					$cart_id = (int)$result['cart_id'];
				}
			}
		}else{
			$this->redirect($this->url->link('shop', '', 'SSL'));
		}

		if( (empty($this->data['cart_total']) or $this->data['cart_total'] < 1) and !empty($cart_id)){
			$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE cart_id = '" . (int)$cart_id . "'");
			$this->redirect($this->url->link('shop', '', 'SSL'));
		}
		$this->data['cart_total'] = number_format((float)$this->data['cart_total'],2);
		
//	kitchen
		$this->data['my_kitchens'] = array();
		$this->data['my_kitchens_select'] = array();
		if($this->customer->isLogged()){
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "my_kitchen WHERE customer_id = '" . (int)$this->customer->getId() . "'");
			if($query->num_rows){
				foreach($query->rows as $row){
					$this->data['my_kitchens'][$row['kitchen_id']] = array(
						'kitchen_id' => $row['kitchen_id'],
						'name' => $row['name'],
						'address' => $row['address']
					);
					if(!empty($this->session->data['kitchen_id']) and $this->session->data['kitchen_id'] == $row['kitchen_id']){
						$this->data['my_kitchens_select'] = array(
							'name' => $row['name'],
							'address' => $row['address'],
							'kitchen_id' => $row['kitchen_id']
						);
						$this->db->query("UPDATE " . DB_PREFIX . "customer SET kitchen_id = '" . (int)$row['kitchen_id'] . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
					}
				}
			}
			//	quantity
			$sql = "SELECT SUM(cp.quantity) as tquantity FROM " . DB_PREFIX . "cart_products cp ";
			$sql.= "LEFT JOIN " . DB_PREFIX . "cart c ON (c.cart_id = cp.cart_id) ";
			$sql.= "WHERE c.customer_id = '" . (int)$this->customer->getId() . "' ";
			$query = $this->db->query($sql);
			if($query->num_rows){
				$this->data['total_cart'] = $query->row['tquantity'];
			}else{
				$this->data['total_cart'] = 0;
			}
		}
		
//  total
		$this->load->model('setting/extension');
		$total_data = array();					
		$total = 0;

		$sort_order = array(); 
		$results = $this->model_setting_extension->getExtensions('total');
		foreach ($results as $key => $value) {
			$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
		}
		array_multisort($sort_order, SORT_ASC, $results);
		foreach ($results as $result) {
			if ($this->config->get($result['code'] . '_status')) {
				$this->load->model('total/' . $result['code']);
				$this->{'model_total_' . $result['code']}->getTotal($total_data, $total);
			}
			$sort_order = array(); 
			foreach ($total_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}
			array_multisort($sort_order, SORT_ASC, $total_data);			
		}

		$this->data['totals'] = $total_data;
/*
				array(6) {
				  ["date_shipping"]=>string(10) "2025-06-29"
				  ["time_shipping"]=>string(4) "9-12"
				  ["unavailable"]=>string(1) "1"
				  ["collector"]=>string(1) "1"
				  ["kitchen_checkout"]=>string(1) "3"
				  ["payment_method"]=>string(3) "cod"
				}
*/
		$this->data['date_shipping'] = '';
		if(isset($this->request->post['date_shipping'])){
			$this->data['date_shipping'] = $this->request->post['date_shipping'];
		}
		$this->data['time_shipping'] = '';
		if(isset($this->request->post['time_shipping'])){
			$this->data['time_shipping'] = $this->request->post['time_shipping'];
		}
		$this->data['time_shipping'] = '';
		if(isset($this->request->post['time_shipping'])){
			$this->data['time_shipping'] = $this->request->post['time_shipping'];
		}
		
		$this->data['error_date_shipping'] = '';
		if(isset($this->error['date_shipping'])){
			$this->data['error_date_shipping'] = $this->error['date_shipping'];
		}
		$this->data['error_time_shipping'] = '';
		if(isset($this->error['time_shipping'])){
			$this->data['error_time_shipping'] = $this->error['time_shipping'];
		}
		$this->data['error_kitchen_checkout'] = '';
		if(isset($this->error['kitchen_checkout'])){
			$this->data['error_kitchen_checkout'] = $this->error['kitchen_checkout'];
		}
		$this->data['error_payment_method'] = '';
		if(isset($this->error['payment_method'])){
			$this->data['error_payment_method'] = $this->error['payment_method'];
		}
		
		$this->template = 'default/template/checkout.tpl';
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'footer',
			'payment_method'
		);
		$settings = array();
		$settings['type_header'] = 2;
		$settings['class_body'] = 'min-h-screen flex flex-col';
		
		$this->data['header'] = $this->getChild('header',$settings);
		$this->response->setOutput($this->render());
	}
	public function recalctotal(){
		$json = array();
//	recalc data
		if((!empty($this->request->post['apicustomer']) and !empty($this->request->post['apicustomer'])) and !empty($this->request->post['order_id'])){
			$order_id = $this->request->post['order_id'];
			$json = array();
			//	 customer token
			if(!$this->customer->isLogged()){
				$json['error'] = 'not found customer';
			}else{
				$customer_id = $this->customer->getId();

//	verf cart
				$cart_total = 0;
//	get products in cart
				$sql = "SELECT *, p.merchants AS merchants, p.name AS name, p.bin AS bin, cp.type AS type, p.case_price AS case_price, p.unit_price AS unit_price, cp.quantity AS quantity, cp.type AS type, p.location AS location FROM " . DB_PREFIX . "cart_products cp ";
				$sql.= "LEFT JOIN " . DB_PREFIX . "cart c ON (c.cart_id = cp.cart_id) ";
				$sql.= "LEFT JOIN " . DB_PREFIX . "product p ON (p.product_id = cp.product_id) ";
				$sql.= "WHERE c.customer_id = '" . (int)$customer_id . "' ";
				$query = $this->db->query($sql);

				if($query->num_rows){

					foreach ($query->rows as $result) {

						if($result['type']=='case'){
							$price = (float)$result['case_price'];
							$total = (float)$result['case_price'] * (int)$result['quantity'];
						}else{
							$price = (float)$result['unit_price'];
							$total = (float)$result['unit_price'] * (int)$result['quantity'];
						}

//	save prod in cart
						$cart_total = $cart_total + $total;
					}

//  total
					$this->load->model('setting/extension');
					$total_data = array();					
					$total = 0;

					$sort_order = array(); 
					$results = $this->model_setting_extension->getExtensions('total');

					foreach ($results as $key => $value) {
						$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
					}
					array_multisort($sort_order, SORT_ASC, $results);

					foreach ($results as $result) {
						if ($this->config->get($result['code'] . '_status')) {
							$this->load->model('total/' . $result['code']);
							$this->{'model_total_' . $result['code']}->getTotal($total_data, $total);
						}

						$sort_order = array(); 
						foreach ($total_data as $key => $value) {
							$sort_order[$key] = $value['sort_order'];
							if($value['code'] == 'total'){
								$cart_total = (float)$value['value'];
							}
						}
						array_multisort($sort_order, SORT_ASC, $total_data);			
					}

					if(!empty($total_data)){
						foreach($total_data as $row){
							$this->db->query("UPDATE " . DB_PREFIX . "order_total SET title = '" . $this->db->escape($row['title']) . "', text = '" . $this->db->escape($row['text']) . "', `value` = '" . (float)$row['value'] . "', sort_order = '" . (int)$row['sort_order'] . "' WHERE order_id = '" . (int)$order_id . "' AND code = '" . $this->db->escape($row['code']) . "'");
						}
					}

					$this->db->query("UPDATE `" . DB_PREFIX . "order` SET total = '" . (float)$cart_total . "' WHERE order_id = '" . (int)$order_id . "'");
				
					$json['order_id'] = $order_id;
					$json['success'] = true;
				}
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	public function addorder(){

		if ($this->customer->isLogged() and $this->validate()) {
			if(!empty($this->request->get['api'])){

			}else{
				$customer_id = $this->customer->getId();
				$getFirstName = $this->customer->getFirstName();
				$getEmail = $this->customer->getEmail();
				$getTelephone = $this->customer->getTelephone();
			}
			/*
				array(6) {
				  ["date_shipping"]=>string(10) "2025-06-29"
				  ["time_shipping"]=>string(4) "9-12"
				  ["unavailable"]=>string(1) "1"
				  ["collector"]=>string(1) "1"
				  ["kitchen_checkout"]=>string(1) "3"
				  ["payment_method"]=>string(3) "cod"
				}
			*/

			$sql = "INSERT INTO " . DB_PREFIX . "order SET ";
			$sql.= "customer_id = '" . (int)$customer_id . "', ";
			$sql.= "firstname = '" . $this->db->escape($getFirstName) . "', ";
			$sql.= "email = '" . $this->db->escape($getEmail) . "', ";
			$sql.= "telephone = '" . $this->db->escape($getTelephone) . "', ";
			$sql.= "date_shipping = '" . $this->db->escape($this->request->post['date_shipping']) . "', ";
			$sql.= "time_shipping = '" . $this->db->escape($this->request->post['time_shipping']) . "', ";
			if(!empty($this->request->post['unavailable'])){
				$sql.= "unavailable = '1', ";
			}
			if(!empty($this->request->post['collector'])){
				$sql.= "collector = '1', ";
			}
			$sql.= "kitchen_checkout = '" . $this->db->escape($this->request->post['kitchen_checkout']) . "', ";
			$sql.= "payment_method = '" . $this->db->escape($this->request->post['payment_method']) . "', ";
			if(!empty($this->request->server['REMOTE_ADDR'])){
				$sql.= "`ip` = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', ";
			}
			if (isset($this->request->server['HTTP_USER_AGENT'])) {
				$sql.= "`user_agent` = '" . $this->db->escape($this->request->server['HTTP_USER_AGENT']) . "', ";
			}
			$sql.= "date_added = NOW()";
			$this->db->query($sql);
			$order_id = $this->db->getLastId();
			
//	verf cart
			$cart_total = 0;
//	get products in cart
			$sql = "SELECT *, p.merchants AS merchants, p.name AS name, p.bin AS bin, cp.type AS type, p.case_price AS case_price, p.unit_price AS unit_price, cp.quantity AS quantity, cp.type AS type, p.location AS location FROM " . DB_PREFIX . "cart_products cp ";
			$sql.= "LEFT JOIN " . DB_PREFIX . "cart c ON (c.cart_id = cp.cart_id) ";
			$sql.= "LEFT JOIN " . DB_PREFIX . "product p ON (p.product_id = cp.product_id) ";
			$sql.= "WHERE c.customer_id = '" . (int)$customer_id . "' ";
			$query = $this->db->query($sql);
				
			if($query->num_rows){
				foreach ($query->rows as $result) {
					if($result['type']=='case'){
						$price = (float)$result['case_price'];
						$total = (float)$result['case_price'] * (int)$result['quantity'];
					}else{
						$price = (float)$result['unit_price'];
						$total = (float)$result['unit_price'] * (int)$result['quantity'];
					}
					
					$sql = "INSERT INTO " . DB_PREFIX . "order_product SET ";
					
					$sql.= "order_id = '" . (int)$order_id . "', ";
					$sql.= "product_id = '" . (int)$result['product_id'] . "', ";
					$sql.= "name = '" . $this->db->escape($result['name']) . "', ";
					$sql.= "location = '" . $this->db->escape(trim($result['location'])) . "', ";
					$sql.= "type = '" . $this->db->escape($result['type']) . "', ";
					$sql.= "bin = '" . $this->db->escape($result['bin']) . "', ";
					$sql.= "upc = '" . $this->db->escape($result['upc']) . "', ";
					$sql.= "quantity = '" . (int)$result['quantity'] . "', ";
					$sql.= "price = '" . (float)$price . "', ";
					$sql.= "total = '" . (float)$total . "', ";
					$sql.= "merchants = '" . $this->db->escape($result['merchants']) . "' ";
					$this->db->query($sql);
					$cart_total = $cart_total + $total;
				}

// total
				$this->load->model('setting/extension');
				$total_data = array();					
				$total = 0;

				$sort_order = array(); 
				$results = $this->model_setting_extension->getExtensions('total');

				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
				}
				array_multisort($sort_order, SORT_ASC, $results);

				foreach ($results as $result) {
					if ($this->config->get($result['code'] . '_status')) {
						$this->load->model('total/' . $result['code']);
						$this->{'model_total_' . $result['code']}->getTotal($total_data, $total);
	
					}

					$sort_order = array(); 
					foreach ($total_data as $key => $value) {
						$sort_order[$key] = $value['sort_order'];
						if($value['code'] == 'total'){
							$cart_total = (float)$value['value'];
						}
					}
					array_multisort($sort_order, SORT_ASC, $total_data);			
				}

				if(!empty($total_data)){
					foreach($total_data as $row){
						$this->db->query("INSERT INTO " . DB_PREFIX . "order_total SET order_id = '" . (int)$order_id . "', code = '" . $this->db->escape($row['code']) . "', title = '" . $this->db->escape($row['title']) . "', text = '" . $this->db->escape($row['text']) . "', `value` = '" . (float)$row['value'] . "', sort_order = '" . (int)$row['sort_order'] . "'");
					}
				}

				$totals = $total_data;

				$this->db->query("UPDATE `" . DB_PREFIX . "order` SET total = '" . (float)$cart_total . "' WHERE order_id = '" . (int)$order_id . "'");
			}
			if(!empty($this->request->get['api']) and !empty($this->request->get['api'])){
				$json['order_id'] = $order_id;
				$this->response->setOutput(json_encode($json));
				die;
			}else{
				$this->session->data['order_id'] = $order_id;
				$this->redirect($this->url->link('order-confirmation', '', 'SSL'));
			}
		}
		$this->index();
	}
//	valid order
	protected function validate() {
		/*
		array(6) {
		  ["date_shipping"]=>string(10) "2025-06-29"
		  ["time_shipping"]=>string(4) "9-12"
		  ["unavailable"]=>string(1) "1"
		  ["collector"]=>string(1) "1"
		  ["kitchen_checkout"]=>string(1) "3"
		  ["payment_method"]=>string(3) "cod"
		}
		*/
		if(!empty($this->request->post['date_shipping'])){
			if (DateTime::createFromFormat('Y-m-d', $this->request->post['date_shipping']) !== false) {
				
				$today = date('Y-m-d');
				$date_1 = strtotime('+1 day', strtotime($today));
				$date_7 = strtotime('+7 day', strtotime($today));
				
				$date_shipping = strtotime($this->request->post['date_shipping']);
				if($date_shipping < $date_1 or $date_shipping > $date_7){
					$this->error['date_shipping'] = 'invalid date: not today and not older than 7 days';
				}
				
			}else{
				$this->error['date_shipping'] = 'Invalid date format';
			}
		}else{
			$this->error['date_shipping'] = 'select date';
		}
		
		if(empty($this->request->post['time_shipping']) or !in_array($this->request->post['time_shipping'], array('9-12','12-15','15-18')) ){
			$this->error['time_shipping'] = 'Incorrect delivery time';
		}
		
		if(empty($this->request->post['kitchen_checkout'])){
			$this->error['kitchen_checkout'] = 'Select Kitchen';
		}else{
			//	 kitchen
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "my_kitchen WHERE kitchen_id = '" . (int)$this->request->post['kitchen_checkout'] . "' AND customer_id = '" . (int)$this->customer->getId() . "'");
			if(!$query->num_rows){
				$this->error['kitchen_checkout'] = 'Choose the right Kitchen';
			}
		}
		
		if(empty($this->request->post['payment_method'])){
			$this->error['payment_method'] = 'Select payment method';
		}else{
			$no_payment_method = true;
			$this->load->model('setting/extension');
			$results = $this->model_setting_extension->getExtensions('payment');
			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					if ($result['code'] == $this->request->post['payment_method']) {
						$no_payment_method = false;
						break;
					}
				}
			}
			if($no_payment_method){
				$this->error['payment_method'] = 'Please select the correct payment method';
			}
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}  
	}
}