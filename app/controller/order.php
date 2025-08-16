<?php 
class ControllerOrder extends Controller { 
	public function index() {
		if (!$this->customer->isLogged() or empty($this->request->get['ord'])) {
			$this->redirect($this->url->link('home', '', 'SSL'));
		}
		
		$this->load->model('tool/image');
		
		$this->data['go_orderhistory'] = $this->url->link('order-history');

		$this->data['products'] = array();
		$this->data['cart_total'] = 0;
		$this->data['order_id'] = '';
		$this->data['delivery_location'] = array();
		$this->data['delivery_kitchen_name'] = '';
		$this->data['delivery_kitchen_address'] = '';
		
		$sql = "SELECT * FROM " . DB_PREFIX . "delivery_window ";//	get order
		$query_time = $this->db->query($sql);
		if($query_time->num_rows){
			foreach($query_time->rows as $rowt){
				$time_shipping[trim($rowt['delivery_short'])] = trim($rowt['delivery_name']);
			}
		}else{
			$time_shipping = array(
				'9-12'=>'9:00 AM - 12:00 PM',
				'12-15'=>'12:00 AM - 3:00 PM',
				'15-18'=>'3:00 AM - 6:00 PM'
			);
		}
		
//	order - mysql
		$sql = "SELECT * FROM " . DB_PREFIX . "order WHERE customer_id = '" . (int)$this->customer->getId() . "' AND order_id = '" . (int)$this->request->get['ord'] . "'";//	get order
		$query_order = $this->db->query($sql);
			
		if($query_order->num_rows){
			
			$this->data['collector_name'] = '';
			$this->data['collector_phone'] = '';

			if(!empty($query_order->row['user_id'])){
				$query_coll = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE user_id = '" . (int)$query_order->row['user_id'] . "'");//	get collector

				if($query_coll->num_rows){
					$this->data['collector_name'] = $query_coll->row['firstname'];
					$this->data['collector_phone'] = !empty($query_coll->row['telephone'])?$query_coll->row['telephone']:'not telephone';
				}
			}
			
			$this->data['order_id'] = $query_order->row['order_id'];
			
			$query_kitchen = $this->db->query("SELECT name,address FROM " . DB_PREFIX . "my_kitchen WHERE customer_id = '" . (int)$this->customer->getId() . "' AND kitchen_id = '" . (int)$query_order->row['kitchen_checkout'] . "'");
			if($query_kitchen->num_rows){
				$this->data['delivery_kitchen_name'] = $query_kitchen->row['name'];
				$this->data['delivery_kitchen_address'] = $query_kitchen->row['address'];
			}
			$this->data['date_shipping'] = date("F d, Y",strtotime($query_order->row['date_shipping']));
			if(!empty($time_shipping[trim($query_order->row['time_shipping'])])){
				$this->data['time_shipping'] = $time_shipping[trim($query_order->row['time_shipping'])];
			}else{
				$this->data['time_shipping'] = $query_order->row['time_shipping'];
			}
			$this->data['collector'] = $query_order->row['collector'];
			
			//	get order status
			$query_status = $this->db->query("SELECT name FROM " . DB_PREFIX . "order_status WHERE order_status_id = '" . (int)$query_order->row['order_status_id'] . "'");
			if($query_status->num_rows){
				$this->data['order_status'] = $query_status->row['name'];
				$this->data['order_status_id'] = $query_order->row['order_status_id'];
			}else{
				$this->data['order_status'] = "";
				$this->data['order_status_id'] = "";
			}
			
			$query_products = $this->db->query("SELECT op.order_product_id AS order_product_id, op.location AS location, op.product_id AS product_id, p.image AS image, op.price AS price, op.type AS type, op.total AS total, op.bin AS bin, op.upc AS upc, op.quantity AS quantity, op.name AS name, p.case_price AS case_price, p.unit_price AS unit_price, op.status_collect_product AS collect_status_id FROM " . DB_PREFIX . "order_product op LEFT JOIN " . DB_PREFIX . "product p ON (p.product_id = op.product_id) WHERE order_id = '" . (int)$query_order->row['order_id'] . "'");//	get order products
			
			foreach ($query_products->rows as $result) {
				if (!empty($result['image']) and file_exists(DIR_IMAGE . $result['image'])) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
				} else {
					$image = $this->model_tool_image->resize('no_image.jpg', $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
				}
				$price = (float)$result['price'];
				
				$query_collect = $this->db->query("SELECT name FROM " . DB_PREFIX . "collected_status WHERE collect_status_id = '" . (int)$result['collect_status_id'] . "'");
				if($query_collect->num_rows){
					$collect_status = $query_collect->row['name'];
				}else{
					$collect_status = $this->data['order_status'];
				}

				$this->data['products'][] = array(
					'product_id'  => $result['product_id'],
					'order_product_id' => $result['order_product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'case_price' => (float)$result['case_price'],
					'unit_price' => (float)$result['unit_price'],
					'type'        => $result['type'],
					'bin' => $result['bin'],
					'upc' => $result['upc'],
					'location' => $result['location'],
					'quantity' => $result['quantity'],
					'collect_status_id' => (int)$result['collect_status_id'],
					'collect_status' => $collect_status,
//					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..',
					'price'       => number_format((float)$price,2),
					'href'        => $this->url->link('product', 'product_id=' . $result['product_id'] )
				);
				$this->data['delivery_location'][$result['location']] = $result['location'];
				
				$this->data['cart_total'] = number_format(((float)$this->data['cart_total'] + (float)$price),2);
			}
		}else{
			$this->redirect($this->url->link('home', '', 'SSL'));
		}
		
		// Order Totals			
		$order_total_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_total` WHERE order_id = '" . (int)$query_order->row['order_id'] . "' ORDER BY sort_order ASC");
		$this->data['totals'] = array();
		if($order_total_query->num_rows){
			foreach ($order_total_query->rows as $order_total) {

				$this->data['totals'][] = array(
					'title' => $order_total['title'],
					'value' => number_format((float)$order_total['value'],2)
				);
			}
		}
		
		if (!empty($query_order->row['proof'])) {
			$proofs = json_decode($query_order->row['proof'],true);
			$this->load->model('tool/image');
			foreach($proofs as $k=>$proof){
				if(is_file(DIR_DOWNLOAD . $proof)){
					copy(DIR_DOWNLOAD . $proof,DIR_IMAGE . 'upload/' . $proof);
					$this->data['proofs'][$k+1] = array(
						'resize' => $this->model_tool_image->resize('upload/' . $proof, 300, 300),
						'file' => $proof
					);
				}
			}
		}else{
			$this->data['proofs'] = array();
		}

		$this->template = 'default/template/order.tpl';
		$this->children = array('common/column_left','common/column_right','common/content_top','common/content_bottom','footer'		);
		$settings = array();
		$settings['type_header'] = 2;
		$settings['class_body'] = 'min-h-screen bg-gray-50 flex flex-col';
				
		$this->data['header'] = $this->getChild('header',$settings);
		$this->response->setOutput($this->render());
	}
	public function delete(){
		$json = array();
		if($this->customer->isLogged() and !empty($this->request->post['cart_id']) and !empty($this->request->post['product_id']) and !empty($this->request->post['type'])){
			$sql = "SELECT *, cp.location AS location, p.name AS name, p.bin AS bin, cp.type AS type, p.case_price AS case_price, p.unit_price AS unit_price, cp.quantity AS quantity, cp.type AS type FROM " . DB_PREFIX . "cart_products cp ";
			$sql.= "LEFT JOIN " . DB_PREFIX . "cart c ON (c.cart_id = cp.cart_id) ";
			$sql.= "LEFT JOIN " . DB_PREFIX . "product p ON (p.product_id = cp.product_id) ";
			$sql.= "WHERE c.customer_id = '" . (int)$this->customer->getId() . "' AND cp.type = '" . $this->db->escape($this->request->post['type']) . "' AND cp.cart_id = '" . (int)$this->request->post['cart_id'] . "' AND cp.product_id = '" . (int)$this->request->post['product_id'] . "'";
			$query = $this->db->query($sql);
			if($query->num_rows){
				$sql = "DELETE FROM " . DB_PREFIX . "cart_products ";
				$sql.= "WHERE location = '" . $this->db->escape($query->row['location']) . "' AND type = '" . $this->db->escape($this->request->post['type']) . "' AND cart_id = '" . (int)$this->request->post['cart_id'] . "' AND product_id = '" . (int)$this->request->post['product_id'] . "'";
				$this->db->query($sql);
				$json['success'] = true;
				$json['delete_class'] = '.cart_id' . $this->request->post['cart_id'] . '.product_id' . $this->request->post['product_id'] . '.type' . $this->request->post['type'];
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	public function add(){
		$json = array();
		
		if($this->customer->isLogged() and !empty($this->request->post['product_id'])){
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$this->request->post['product_id'] . "' ");
			if($query->num_rows){
				$json['location'] = $query->row['location'];
				
				$case_price = $query->row['case_price'];
				$unit_price = $query->row['unit_price'];
				$query = $this->db->query("SELECT cart_id FROM " . DB_PREFIX . "cart WHERE customer_id = '" . (int)$this->customer->getId() . "'");
				if($query->num_rows){
					$cart_id = $query->row['cart_id'];//	 id
				}else{
					$this->db->query("INSERT INTO " . DB_PREFIX . "cart SET customer_id = '" . (int)$this->customer->getId() . "'");
					$cart_id = $this->db->getLastId();//	 id
				}
				
				$sql = "SELECT * FROM " . DB_PREFIX . "cart_products cp ";
				//$sql.= "LEFT JOIN " . DB_PREFIX . "product p ON (p.product_id = cp.product_id) ";
				$sql.= "WHERE cp.cart_id = '" . (int)$cart_id . "' ";
				$sql.= "AND cp.product_id = '" . (int)$this->request->post['product_id'] . "' ";
				if(!empty($this->request->post['type'])){
					if($this->request->post['type']=='case'){
						$this->request->post['type'] = 'case';
					}else{
						$this->request->post['type'] = 'unit';
					}
					$sql.= "AND cp.type = '" . $this->db->escape($this->request->post['type']) . "'";
				}
				$query = $this->db->query($sql);
				
				if($query->num_rows){
					if(empty($this->request->post['replace'])){
						$quantity = $query->row['quantity'];
						if(!empty($this->request->post['quantity'])){
							$quantity = $quantity + (int)$this->request->post['quantity'];
							$json['quantity'] = (int)$this->request->post['quantity'];
						}else{
							$quantity++;
							$json['quantity'] = 1;
						}
					}else{
						$quantity = (int)$this->request->post['quantity'];
						$json['quantity'] = (int)$this->request->post['quantity'];
					}
					$sql = "UPDATE `" . DB_PREFIX . "cart_products` SET `quantity` = '" . (int)$quantity . "' WHERE cart_id = '" . (int)$cart_id . "' ";
					$sql.= "AND product_id = '" . (int)$this->request->post['product_id'] . "' ";
					if(!empty($this->request->post['type'])){
						if($this->request->post['type']=='case'){
							$this->request->post['type'] = 'case';
						}else{
							$this->request->post['type'] = 'unit';
						}
						$sql.= "AND type = '" . $this->db->escape($this->request->post['type']) . "'";
					}
					$this->db->query($sql);
					
				}else{
					$quantity = 1;
					
					$sql = "INSERT INTO " . DB_PREFIX . "cart_products SET cart_id = '" . (int)$cart_id . "'";
					
					$sql.= ", product_id = '" . (int)$this->request->post['product_id'] . "'";
					
					if(!empty($this->request->post['type'])){
						if($this->request->post['type']=='case'){
							$this->request->post['type'] = 'case';
						}else{
							$this->request->post['type'] = 'unit';
						}
						$sql.= ", type = '" . $this->db->escape($this->request->post['type']) . "'";
					}
					if(!empty($this->customer->getLocation())){
						$sql.= ", location = '" . $this->db->escape($this->customer->getLocation()) . "'";
					}
					if(!empty($this->request->post['quantity'])){
						$quantity = (int)$this->request->post['quantity'];
						$sql.= ", quantity = '" . (int)$this->request->post['quantity'] . "'";
						$json['quantity'] = (int)$this->request->post['quantity'];
					}else{
						$json['quantity'] = 1;
					}
					$this->db->query($sql);
				}
				$sql = "SELECT SUM(quantity) as tquantity FROM " . DB_PREFIX . "cart_products WHERE cart_id = '" . (int)$cart_id . "' ";
				$query = $this->db->query($sql);
				if($query->num_rows){
					$json['total_quantity'] = $query->row['tquantity'];
				}else{
					$json['total_quantity'] = 0;
				}
				
				if($this->request->post['type']=='case'){
					$json['total_price'] = (int)$quantity * (float)$case_price;
				}else{
					$json['total_price'] = (int)$quantity * (float)$unit_price;
				}
				
				$json['success'] = true;
			}else{
				
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	public function othertype(){
		$json = array();
		//	order_status_id
		if($this->customer->isLogged() and !empty($this->request->post['order_product_id'])){
			//	order_product_id
			$query_product = $this->db->query("SELECT op.order_id AS order_id, op.type AS otype, p.unit_price AS unit_price, op.quantity AS quantity, p.case_price AS case_price FROM " . DB_PREFIX . "order_product op LEFT JOIN " . DB_PREFIX . "product p ON (p.product_id = op.product_id) LEFT JOIN " . DB_PREFIX . "order o ON (o.order_id = op.order_id) WHERE o.customer_id = '" . (int)$this->customer->getId() . "' AND o.order_status_id = 0 AND op.order_product_id = '" . (int)$this->request->post['order_product_id'] . "' ");//	get order product
			if($query_product->num_rows){

				if($query_product->row['otype'] == 'case' and !empty($query_product->row['unit_price'])){
					$sql = "UPDATE `" . DB_PREFIX . "order_product` SET `type` = 'unit', `price` = '" . (float)$query_product->row['unit_price'] . "', `total` = '" . ((float)$query_product->row['unit_price'] * (int)$query_product->row['quantity']) . "' WHERE order_product_id = '" . (int)$this->request->post['order_product_id'] . "'";
					$this->db->query($sql);
					
					

				}elseif(!empty($query_product->row['case_price'])){
					$sql = "UPDATE `" . DB_PREFIX . "order_product` SET `type` = 'case', `price` = '" . (float)$query_product->row['case_price'] . "', `total` = '" . ((float)$query_product->row['case_price'] * (int)$query_product->row['quantity']) . "' WHERE order_product_id = '" . (int)$this->request->post['order_product_id'] . "'";
					$this->db->query($sql);

				}
				$query_sub_totals = $this->db->query("SELECT SUM(total) AS sub_total FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$query_product->row['order_id'] . "'");
				$this->db->query("UPDATE `" . DB_PREFIX . "order_total` SET `text` = '" . $this->db->escape(number_format((float)$query_sub_totals->row['sub_total'],2)) . "', `value` = '" . (float)$query_sub_totals->row['sub_total'] . "' WHERE code = 'sub_total' AND order_id = '" . (int)$query_product->row['order_id'] . "'");
				$query_totals = $this->db->query("SELECT SUM(value) AS total FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$query_product->row['order_id'] . "' AND NOT code = 'total'");
				$this->db->query("UPDATE `" . DB_PREFIX . "order_total` SET `text` = '" . $this->db->escape(number_format((float)$query_totals->row['total'],2)) . "', `value` = '" . (float)$query_totals->row['total'] . "' WHERE code = 'total' AND order_id = '" . (int)$query_product->row['order_id'] . "'");
					
				$json['success'] = true;
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	public function otherq(){
		$json = array();
		if($this->customer->isLogged() and !empty($this->request->post['order_product_id']) and isset($this->request->post['quantity'])){
			
			$query_product = $this->db->query("SELECT op.order_id AS order_id, op.type AS otype, p.unit_price AS unit_price, op.quantity AS quantity, p.case_price AS case_price FROM " . DB_PREFIX . "order_product op LEFT JOIN " . DB_PREFIX . "product p ON (p.product_id = op.product_id) LEFT JOIN " . DB_PREFIX . "order o ON (o.order_id = op.order_id) WHERE o.customer_id = '" . (int)$this->customer->getId() . "' AND o.order_status_id = 0 AND op.order_product_id = '" . (int)$this->request->post['order_product_id'] . "' ");//	get order product
			if($query_product->num_rows){
				
				if($query_product->row['otype'] == 'unit' and !empty($query_product->row['unit_price'])){
					$sql = "UPDATE `" . DB_PREFIX . "order_product` SET `quantity` = '" . (int)$this->request->post['quantity'] . "', `price` = '" . (float)$query_product->row['unit_price'] . "', `total` = '" . ((float)$query_product->row['unit_price'] * (int)$this->request->post['quantity']) . "' WHERE order_product_id = '" . (int)$this->request->post['order_product_id'] . "'";
					$this->db->query($sql);
				}elseif(!empty($query_product->row['case_price'])){
					$sql = "UPDATE `" . DB_PREFIX . "order_product` SET `quantity` = '" . (int)$this->request->post['quantity'] . "', `price` = '" . (float)$query_product->row['case_price'] . "', `total` = '" . ((float)$query_product->row['case_price'] * (int)$this->request->post['quantity']) . "' WHERE order_product_id = '" . (int)$this->request->post['order_product_id'] . "'";
					$this->db->query($sql);

				}
				$query_sub_totals = $this->db->query("SELECT SUM(total) AS sub_total FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$query_product->row['order_id'] . "'");
				$this->db->query("UPDATE `" . DB_PREFIX . "order_total` SET `text` = '" . $this->db->escape(number_format((float)$query_sub_totals->row['sub_total'],2)) . "', `value` = '" . (float)$query_sub_totals->row['sub_total'] . "' WHERE code = 'sub_total' AND order_id = '" . (int)$query_product->row['order_id'] . "'");
				$query_totals = $this->db->query("SELECT SUM(value) AS total FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$query_product->row['order_id'] . "' AND NOT code = 'total'");
				$this->db->query("UPDATE `" . DB_PREFIX . "order_total` SET `text` = '" . $this->db->escape(number_format((float)$query_totals->row['total'],2)) . "', `value` = '" . (float)$query_totals->row['total'] . "' WHERE code = 'total' AND order_id = '" . (int)$query_product->row['order_id'] . "'");
				$json['success'] = true;
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	public function otherdel(){
		$json = array();
		if($this->customer->isLogged() and !empty($this->request->post['order_product_id'])){
			$query_product = $this->db->query("SELECT op.order_id AS order_id, op.type AS otype, p.unit_price AS unit_price, op.quantity AS quantity, p.case_price AS case_price FROM " . DB_PREFIX . "order_product op LEFT JOIN " . DB_PREFIX . "product p ON (p.product_id = op.product_id) LEFT JOIN " . DB_PREFIX . "order o ON (o.order_id = op.order_id) WHERE o.customer_id = '" . (int)$this->customer->getId() . "' AND o.order_status_id = 0 AND op.order_product_id = '" . (int)$this->request->post['order_product_id'] . "' ");//	get order product
			if($query_product->num_rows){
				$sql = "DELETE FROM " . DB_PREFIX . "order_product WHERE order_product_id = '" . (int)$this->request->post['order_product_id'] . "'";
				$this->db->query($sql);
				$query_sub_totals = $this->db->query("SELECT SUM(total) AS sub_total FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$query_product->row['order_id'] . "'");
				$this->db->query("UPDATE `" . DB_PREFIX . "order_total` SET `text` = '" . $this->db->escape(number_format((float)$query_sub_totals->row['sub_total'],2)) . "', `value` = '" . (float)$query_sub_totals->row['sub_total'] . "' WHERE code = 'sub_total' AND order_id = '" . (int)$query_product->row['order_id'] . "'");
				$query_totals = $this->db->query("SELECT SUM(value) AS total FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$query_product->row['order_id'] . "' AND NOT code = 'total'");
				$this->db->query("UPDATE `" . DB_PREFIX . "order_total` SET `text` = '" . $this->db->escape(number_format((float)$query_totals->row['total'],2)) . "', `value` = '" . (float)$query_totals->row['total'] . "' WHERE code = 'total' AND order_id = '" . (int)$query_product->row['order_id'] . "'");
				$json['success'] = 'Item removed success';
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	public function otheraddp(){
		$json = array();

		if($this->customer->isLogged() and !empty($this->request->post['oproduct_id']) and isset($this->request->post['order_id'])){
			$query_order = $this->db->query("SELECT * FROM " . DB_PREFIX . "order WHERE order_id = '" . (int)$this->request->post['order_id'] . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND order_status_id = 0");
			if($query_order->num_rows){
				$query_product = $this->db->query("SELECT * FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$this->request->post['oproduct_id'] . "'");//	get product
				if($query_product->num_rows){
					$sql = "INSERT INTO " . DB_PREFIX . "order_product SET order_id = '" . (int)$this->request->post['order_id'] . "', product_id = '" . (int)$this->request->post['oproduct_id'] . "', name = '" . $this->db->escape($query_product->row['name']) . "', location = '" . $this->db->escape($query_product->row['location']) . "', bin = '" . $this->db->escape($query_product->row['bin']) . "', upc = '" . $this->db->escape($query_product->row['upc']) . "', quantity = '1', ";
					if(!empty($query_product->row['unit_price'])){
						$sql.= "type = 'unit', price = '" . (float)$query_product->row['unit_price'] . "', total = '" . (float)$query_product->row['unit_price'] . "', ";
					}else{
						$sql.= "type = 'unit', price = '" . (float)$query_product->row['case_price'] . "', total = '" . (float)$query_product->row['case_price'] . "', ";
					}
					$sql.= "merchants = '" . $this->db->escape($query_product->row['merchants']) . "'";
					$this->db->query($sql);//	add product in order

					$query_sub_totals = $this->db->query("SELECT SUM(total) AS sub_total FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$this->request->post['order_id'] . "'");
					$this->db->query("UPDATE `" . DB_PREFIX . "order_total` SET `text` = '" . $this->db->escape(number_format((float)$query_sub_totals->row['sub_total'],2)) . "', `value` = '" . (float)$query_sub_totals->row['sub_total'] . "' WHERE code = 'sub_total' AND order_id = '" . (int)$this->request->post['order_id'] . "'");
					$query_totals = $this->db->query("SELECT SUM(value) AS total FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$this->request->post['order_id'] . "' AND NOT code = 'total'");
					$this->db->query("UPDATE `" . DB_PREFIX . "order_total` SET `text` = '" . $this->db->escape(number_format((float)$query_totals->row['total'],2)) . "', `value` = '" . (float)$query_totals->row['total'] . "' WHERE code = 'total' AND order_id = '" . (int)$this->request->post['order_id'] . "'");
					$json['success'] = 'Item added to order';
				}
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	public function cancelorder(){
		$json = array();

		if($this->customer->isLogged() and isset($this->request->post['order_id'])){
			$query_order = $this->db->query("SELECT * FROM " . DB_PREFIX . "order WHERE order_id = '" . (int)$this->request->post['order_id'] . "' AND customer_id = '" . (int)$this->customer->getId() . "' AND order_status_id = 0");//	IN (0,1,2)
			if($query_order->num_rows){
				$this->db->query("UPDATE `" . DB_PREFIX . "order` SET `order_status_id` = '5' WHERE order_id = '" . (int)$this->request->post['order_id'] . "'");
				$this->db->query("UPDATE `" . DB_PREFIX . "order_product` SET `status_collect_product` = '5' WHERE order_id = '" . (int)$this->request->post['order_id'] . "'");
				$json['success'] = 'Cancel order';
			}
		}
		$this->response->setOutput(json_encode($json));
	}
}
