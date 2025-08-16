<?php
class ControllerSaleOrderCollector extends Controller {
	private $error = array();
	public function timer(){
		$json = array();
		if( !empty($this->request->get['order_id']) ){
			$order_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$this->request->get['order_id'] . "' AND order_status_id IN (1,2)");
			if($order_query->num_rows and !empty($order_query->row['timer'])){
				$timer = json_decode($order_query->row['timer'],true);
				if(!empty($timer) and !empty($timer['stop'])){//	if timer is pause
					//	start timer
					$new_start['start'] = time() - ($timer['stop'] - $timer['start']);
					
					$json['start'] = $new_start['start'];
				}else{
					if(empty($timer['start'])){
						$timer['start'] = time() - 600;
					}
					$new_start['start'] = $timer['start'];
					$new_start['stop'] = time();
					
					$json['stop'] = $new_start;
				}
				$this->db->query("UPDATE `" . DB_PREFIX . "order` SET timer = '" . $this->db->escape(json_encode($new_start)) . "' WHERE order_id = '" . (int)$this->request->get['order_id'] . "'");
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	public function oldq(){
		$json = array();
		if( !empty($this->request->get['order_id']) and !empty($this->request->get['opid']) and !empty($this->request->get['q'])){
			$order_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$this->request->get['order_id'] . "' AND order_status_id IN (0,1,2)");
			if($order_query->num_rows){
				$this->db->query("UPDATE `" . DB_PREFIX . "order_product` SET `old_quantity` = `quantity`, `quantity` = '" . (int)$this->request->get['q'] . "' WHERE order_id = '" . (int)$this->request->get['order_id'] . "' AND order_product_id = '" . (int)$this->request->get['opid'] . "'");
				$json['success'] = 'Change quantity';
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	public function collcomplete(){
		$json = array();
		if( !empty($this->request->get['order_id']) ){
			$order_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$this->request->get['order_id'] . "' AND order_status_id IN (0,1,2)");
			if($order_query->num_rows){
				$this->db->query("UPDATE `" . DB_PREFIX . "order` SET `order_status_id` = '3' WHERE order_id = '" . (int)$this->request->get['order_id'] . "'");
				$this->db->query("UPDATE `" . DB_PREFIX . "order_product` SET `status_collect_product` = '2' WHERE order_id = '" . (int)$this->request->get['order_id'] . "'");
				$json['success'] = 'Cancel order';
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_model']) || isset($this->request->get['filter_category_id'])) {
			$this->load->model('catalog/product');

			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
			} else {
				$filter_name = '';
			}
			
			if (isset($this->request->get['location'])) {
				$filter_location = $this->request->get['location'];
			} else {
				$filter_location = '';
			}

			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];	
			} else {
				$limit = 20;	
			}			

			$data = array('filter_name'  => $filter_name,'filter_location' => $filter_location,'start'=> 0,'limit'=> $limit);

			$results = $this->model_catalog_product->getProducts($data);

			foreach ($results as $result) {
				if(!empty($result['product_id']) and !empty($result['name'])){
					$type = 'unit,case';
					$result['unit_price'] = (float)$result['unit_price'];
					$result['case_price'] = (float)$result['case_price'];
					if(empty($result['case_price'])){
						$type = 'unit';
					}
					if(empty($result['unit_price'])){
						$type = 'case';
					}
					$json[$result['product_id']] = array(
						'product_id' => $result['product_id'],
						'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),	
						'unit_price' => $result['unit_price'],
						'case_price' => $result['case_price'],
						'unit_price_num' => number_format($result['unit_price'],2),
						'case_price_num' => number_format($result['case_price'],2),
						'type' => $type
					);
				}
			}
		}

		$this->response->setOutput(json_encode($json));
	}
//	+
	public function savefile(){
		$json = array();
		if( !empty($this->request->get['order_id']) and !empty($this->request->post['upload']) and count($this->request->post['upload']) > 1 ){
			$order_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$this->request->get['order_id'] . "' AND order_status_id IN (0,1,2)");
			if($order_query->num_rows){
				$proof = array();
				foreach($this->request->post['upload'] as $upload){
					$upload = trim($upload);
					if(file_exists(DIR_IMAGE . 'upload/' . $upload)){
						$proof[] = $upload;
						copy(DIR_IMAGE . 'upload/' . $upload, DIR_DOWNLOAD . $upload);
						unlink(DIR_IMAGE . 'upload/' . $upload);
					}
				}
				if(!empty($proof)){
					$sql = "UPDATE " . DB_PREFIX . "order SET ";
					$sql.= "proof = '" . $this->db->escape(json_encode($proof)) . "' ";
					$sql.= "WHERE order_id = '" . (int)$this->request->get['order_id'] . "'";
					$this->db->query($sql);
					$json['success'] = true;
					//	set Status Collected
					$order_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$this->request->get['order_id'] . "'");
					if($order_query->num_rows){
						if(!empty($order_query->row['timer'])){
							$timer = json_decode($order_query->row['timer'],true);
							if(empty($timer['start'])){
								$timer['start'] = time() - 600;
							}
							$timer['stop'] = time();
						}
						$sql = "UPDATE `" . DB_PREFIX . "order` SET `order_status_id` = '3', timer = '" . $this->db->escape(json_encode($timer)) . "' WHERE order_id = '" . (int)$this->request->get['order_id'] . "'";
						$this->db->query($sql);
					}
					
				}else{
					$json['error'] = 'Please upload 2 images before completing';
				}
			}
		}else{
			$json['error'] = 'Please upload 2 images before completing';
		}
		$this->response->setOutput(json_encode($json));
	}
	public function changereq(){
		$json = array();
		if( !empty($this->request->post['order_id']) and !empty($this->request->post['req_a']) ){
			$order_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$this->request->post['order_id'] . "' AND order_status_id IN (0,1,2)");
			if($order_query->num_rows){
				if(is_array($this->request->post['req_a'])){
					$massive_req = array();
					foreach($this->request->post['req_a'] as $req_a){
						$req_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "req_dop` WHERE req_id = '" . (int)$req_a . "'");
						if($req_query->num_rows){
							$massive_req[(int)$req_a] = array(
								'req_id' => (int)$req_a,
								'name' => $req_query->row['req_name']
							);
							
						}
					}
					if(!empty($massive_req)){
						$req = json_encode($massive_req);
						$sql = "UPDATE " . DB_PREFIX . "order SET ";
						$sql.= "req = '" . $this->db->escape($req) . "' ";
						$sql.= "WHERE order_id = '" . (int)$this->request->post['order_id'] . "'";
						$this->db->query($sql);
						$json['success'] = true;
					}
				}
			}
		}
		$this->response->setOutput(json_encode($json));
	}

	public function changecoll(){
		$json = array();

		if( !empty($this->request->post['order_id']) and !empty($this->request->post['order_product_id']) and isset($this->request->post['coll_stat']) ){
			$order_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$this->request->post['order_id'] . "' AND order_status_id IN (0,1,2)");
			if($order_query->num_rows){
				$cs_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "collected_status` WHERE collect_status_id = '" . (int)$this->request->post['coll_stat'] . "'");
				if($cs_query->num_rows){
					$this->db->query("UPDATE " . DB_PREFIX . "order_product SET status_collect_product = '" . (int)$this->request->post['coll_stat'] . "' WHERE order_product_id = '" . (int)$this->request->post['order_product_id'] . "'");
//	collected_status
					$json['success'] = '<b>Status updated</b><br/>Item status changed to ' . $cs_query->row['name'];
				}
			}
		}
		$this->response->setOutput(json_encode($json));
	}
//	+	ПЕРЕРАСЧЕТ ТОВАРА
	public function recalctotal(){
		$json = array();

		if( !empty($this->request->post['order_id']) and 
			(
				(!empty($this->request->post['product_id']) and !empty($this->request->post['type'])) or 
				(!empty($this->request->post['del_product_id'])) or 
				(!empty($this->request->post['order_product_id']) and !empty($this->request->post['quantity']))
			)
		){

			$order_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$this->request->post['order_id'] . "'");
			if($order_query->num_rows){
				$customer_id = $order_query->row['customer_id'];
//	бэкапим товары из корзины в переменную
				$cart_tmp = array();
				$query_cart = $this->db->query("SELECT * FROM `" . DB_PREFIX . "cart` WHERE customer_id = '" . (int)$customer_id . "'");
				if($query_cart->num_rows){//	если есть в корзине что-то у пользователя
					$cart_tmp['cart'] = $query_cart->row;

					$query_cart_p = $this->db->query("SELECT * FROM `" . DB_PREFIX . "cart_products` WHERE cart_id = '" . (int)$query_cart->row['cart_id'] . "'");
					$cart_tmp['cart_products'] = $query_cart_p->rows;
					if(!empty($cart_tmp)){
						//	теперь удаляем из корзины всё
						$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE customer_id = '" . (int)$customer_id . "'");
						$this->db->query("DELETE FROM " . DB_PREFIX . "cart_products WHERE cart_id = '" . (int)$query_cart->row['cart_id'] . "'");
					}
				}

				$quantity = 1;
				if(!empty($this->request->post['quantity']) and (int)$this->request->post['quantity'] > 0){
					$quantity = (int)$this->request->post['quantity'];
				}
				
				if( !empty($this->request->post['product_id']) and !empty($this->request->post['type']) ){
//	пишем новый товар в заказ: product_id и type, но сначала ищем этот продукт в БД
					$order_product_query = $this->db->query("SELECT order_product_id, quantity, price, total FROM `" . DB_PREFIX . "order_product` WHERE order_id = '" . (int)$this->request->post['order_id'] . "' AND product_id = '" . (int)$this->request->post['product_id'] . "' AND type LIKE '" . $this->db->escape(trim($this->request->post['type'])) . "' ");

					if($order_product_query->num_rows){
//	если есть такой товар, то плюсуем его количество
						$sql = "UPDATE " . DB_PREFIX . "order_product SET ";
						$sql.= "quantity = '" . ((int)$order_product_query->row['quantity'] + (int)$quantity) . "', ";
						$sql.= "total = '" . ((float)$order_product_query->row['price'] * ((int)$order_product_query->row['quantity'] + (int)$quantity)) . "' ";
						$sql.= "WHERE order_product_id = '" . (int)$order_product_query->row['order_product_id'] . "'";
						$this->db->query($sql);
					}else{//	либо пишем новый
//	ищем товар в БД
						$query_product = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product` WHERE product_id = '" . (int)$this->request->post['product_id'] . "'");

						if($query_product->num_rows){//	если такой товар есть
							$sql = "INSERT INTO " . DB_PREFIX . "order_product SET ";
							$sql.= "order_id = '" . (int)$this->request->post['order_id'] . "', ";
							$sql.= "product_id = '" . (int)$this->request->post['product_id'] . "', ";
							$sql.= "name = '" . $this->db->escape(trim($query_product->row['name'])) . "', ";
							$sql.= "location = '" . $this->db->escape(trim($query_product->row['location'])) . "', ";
							
							$sql.= "bin = '" . $this->db->escape(trim($query_product->row['bin'])) . "', ";
							$sql.= "upc = '" . $this->db->escape(trim($query_product->row['upc'])) . "', ";
							$sql.= "quantity = '" . (int)$quantity . "', ";
							if(utf8_strtolower(trim($this->request->post['type'])) == 'case'){
								$sql.= "price = '" . (float)$query_product->row['case_price'] . "', ";
								$sql.= "total = '" . ((float)$query_product->row['case_price'] * (int)$quantity)  . "', ";
								$sql.= "type = 'case', ";
							}else{
								$sql.= "price = '" . (float)$query_product->row['unit_price'] . "', ";
								$sql.= "total = '" . ((float)$query_product->row['unit_price'] * (int)$quantity)  . "', ";
								$sql.= "type = 'unit', ";
							}
							$sql.= "merchants = '" . $this->db->escape(trim($query_product->row['merchants'])) . "'";
							$this->db->query($sql);
						}
					}
				}
//	удаляем товар
				if(!empty($this->request->post['del_product_id'])){
					$this->db->query("DELETE FROM " . DB_PREFIX . "order_product WHERE order_product_id = '" . (int)$this->request->post['del_product_id'] . "'");
				}
//	корректируем количество
				if(!empty($this->request->post['order_product_id'])){
					$sql = "UPDATE " . DB_PREFIX . "order_product SET ";
					$sql.= "quantity = '" . (int)$quantity . "', ";
					$sql.= "total = (price * " . (int)$quantity . ") ";
					$sql.= "WHERE order_product_id = '" . (int)$this->request->post['order_product_id'] . "'";
					$this->db->query($sql);
				}
//	перебрасываем товары из заказа в корзину
				$order_product_query = $this->db->query("SELECT product_id, type, quantity, location FROM `" . DB_PREFIX . "order_product` WHERE order_id = '" . (int)$this->request->post['order_id'] . "'");
				if($order_product_query->num_rows){
					$array_order_products = $order_product_query->rows;


					$this->db->query("INSERT INTO " . DB_PREFIX . "cart SET customer_id = '" . (int)$customer_id . "'");
					$cart_id = $this->db->getLastId();

					$array_order_products = array();
					foreach($order_product_query->rows as $rowp){
						if(!isset($array_order_products[(int)$cart_id . ':' . (int)$rowp['product_id'] . ':' . trim($rowp['type'])])){
							$array_order_products[(int)$cart_id . ':' . (int)$rowp['product_id'] . ':' . trim($rowp['type'])] = $rowp['quantity'];
							$sql = "INSERT INTO " . DB_PREFIX . "cart_products SET cart_id = '" . (int)$cart_id . "', product_id = '" . (int)$rowp['product_id'] . "', type = '" . $this->db->escape(trim($rowp['type'])) . "', quantity = '" . (int)$rowp['quantity'] . "', location = '" . $this->db->escape(trim($rowp['location'])) . "'";
						}else{
							$array_order_products[(int)$cart_id . ':' . (int)$rowp['product_id'] . ':' . trim($rowp['type'])] = $array_order_products[(int)$cart_id . ':' . (int)$rowp['product_id'] . ':' . trim($rowp['type'])] + $rowp['quantity'];
							$sql = "UPDATE " . DB_PREFIX . "cart_products SET quantity = '" . (int)$array_order_products[(int)$cart_id . ':' . (int)$rowp['product_id'] . ':' . trim($rowp['type'])] . "', location = '" . $this->db->escape(trim($rowp['location'])) . "' WHERE cart_id = '" . (int)$cart_id . "' AND product_id = '" . (int)$rowp['product_id'] . "' AND type = '" . $this->db->escape(trim($rowp['type'])) . "'";
						}
						
						$this->db->query($sql);

					}
//	нам нужен токен для пользователя, чтобы правильно авторизоваться во фронтенде
					$token = md5(mt_rand());//	пишем токен

					$this->db->query("UPDATE " . DB_PREFIX . "customer SET token = '" . $this->db->escape($token) . "' WHERE customer_id = '" . (int)$customer_id . "'");
			
//	готовим переменные для переброски во фронтенд
					$post_data = array();
					$post_data["date_shipping"] = $order_query->row["date_shipping"];
					$post_data["time_shipping"] = $order_query->row["time_shipping"];
					$post_data["unavailable"] = $order_query->row["unavailable"];
					$post_data["collector"] = $order_query->row["collector"];
					$post_data["kitchen_checkout"] = $order_query->row["kitchen_checkout"];
					$post_data["payment_method"] = $order_query->row["payment_method"];
					$post_data["order_id"] = (int)$this->request->post['order_id'];
					$post_data["apicustomer"] = $token;

					$url = HTTPS_CATALOG . 'index.php?route=checkout/recalctotal';//	checkout/recalctotal

					$curl = curl_init($url);
					//	curl_setopt($curl, CURLOPT_PORT, 443);
					curl_setopt($curl, CURLOPT_HEADER, 0);
					//curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
					curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
					//curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
					//curl_setopt($curl, CURLOPT_FRESH_CONNECT, 1);
					curl_setopt($curl, CURLOPT_POST, 1);
					curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($post_data));

					$response_data = curl_exec($curl);
					curl_close($curl);
					
					if(!empty($response_data)){
						$success_data = json_decode($response_data,true);
						if(!empty($success_data) and !empty($success_data['success']) and !empty($success_data['order_id'])){
$json['success'] = $success_data['order_id'];
						}
					}
//	не забываем в любом случае вернуть корзину обратно
					if(!empty($cart_tmp)){
						if(!empty($cart_tmp['cart']) and !empty($cart_tmp['cart']['cart_id'])){

							$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE cart_id = '" . (int)$cart_id . "'");
							$this->db->query("DELETE FROM " . DB_PREFIX . "cart_products WHERE cart_id = '" . (int)$cart_id . "'");

//	теперь возвращаем корзину на место
							unset($cart_tmp['cart']['cart_id']);//	убираем cart_id

							$this->db->query("INSERT INTO " . DB_PREFIX . "cart SET customer_id = '" . (int)$cart_tmp['cart']['customer_id'] . "'");
							if(!empty($cart_tmp['cart_products'])){
//	возвращаем товары корзины на место
								$cart_id = $this->db->getLastId();//	извлекаем новый cart_id
								
								foreach($cart_tmp['cart_products'] as $k=>$cart_products){
									$sql = "INSERT INTO " . DB_PREFIX . "cart_products SET ";
									foreach($cart_products as $k=>$cart_product){
										if($k == 'cart_id'){
											$sql.= "cart_id = '" . (int)$cart_id . "',";
										}else{
											$sql.= $k . "='" . $this->db->escape($cart_product) . "',";
										}
									}
									$sql = substr($sql, 0, -1);
									$this->db->query($sql);
								}
							}
						}
					}
				}
			}
		}
		$this->response->setOutput(json_encode($json));
	}
	public function index() {
		$this->language->load('sale/order');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('sale/order');
		$this->getList();
	}
	public function changestatus() {
		$json = array();
$this->request->get['order_status_id'] = 2;//	In progress
		//	проверяем наличие order_id
		if(!empty($this->request->get['order_id'])){
			$order_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$this->request->get['order_id'] . "' AND order_status_id IN (0,1,2)");
			if($order_query->num_rows){
				//	проверяем order_status_id
				$order_status_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_status` WHERE order_status_id = '" . (int)$this->request->get['order_status_id'] . "'");
				if($order_status_query->num_rows){
$timer = array(
	'start' => time()
);
					$sql = "UPDATE `" . DB_PREFIX . "order` SET order_status_id = '" . (int)$this->request->get['order_status_id'] . "', timer = '" . $this->db->escape(json_encode($timer)) . "' WHERE order_id = '" . (int)$this->request->get['order_id'] . "'";
					$this->db->query($sql);
					$json['success'] = 'Status changed to ' . $order_status_query->row['name'];
				}
			}
		}
		$this->response->setOutput(json_encode($json));
	}

//	###########################	СТРАНИЦА ЗАКАЗА
	public function getForm() {
		$this->load->model('sale/customer');

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_wait'] = $this->language->get('text_wait');
		$this->data['text_product'] = $this->language->get('text_product');
		$this->data['text_voucher'] = $this->language->get('text_voucher');
		$this->data['text_order'] = $this->language->get('text_order');

		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['entry_customer'] = $this->language->get('entry_customer');
		$this->data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$this->data['entry_firstname'] = $this->language->get('entry_firstname');
		$this->data['entry_lastname'] = $this->language->get('entry_lastname');
		$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['entry_telephone'] = $this->language->get('entry_telephone');
		$this->data['entry_fax'] = $this->language->get('entry_fax');
		$this->data['entry_order_status'] = $this->language->get('entry_order_status');
		$this->data['entry_comment'] = $this->language->get('entry_comment');
		$this->data['entry_affiliate'] = $this->language->get('entry_affiliate');
		$this->data['entry_address'] = $this->language->get('entry_address');
		$this->data['entry_company'] = $this->language->get('entry_company');
		$this->data['entry_company_id'] = $this->language->get('entry_company_id');
		$this->data['entry_tax_id'] = $this->language->get('entry_tax_id');
		$this->data['entry_address_1'] = $this->language->get('entry_address_1');
		$this->data['entry_address_2'] = $this->language->get('entry_address_2');
		$this->data['entry_city'] = $this->language->get('entry_city');
		$this->data['entry_postcode'] = $this->language->get('entry_postcode');
		$this->data['entry_zone'] = $this->language->get('entry_zone');
		$this->data['entry_zone_code'] = $this->language->get('entry_zone_code');
		$this->data['entry_country'] = $this->language->get('entry_country');
		$this->data['entry_product'] = $this->language->get('entry_product');
		$this->data['entry_option'] = $this->language->get('entry_option');
		$this->data['entry_quantity'] = $this->language->get('entry_quantity');
		$this->data['entry_to_name'] = $this->language->get('entry_to_name');
		$this->data['entry_to_email'] = $this->language->get('entry_to_email');
		$this->data['entry_from_name'] = $this->language->get('entry_from_name');
		$this->data['entry_from_email'] = $this->language->get('entry_from_email');
		$this->data['entry_theme'] = $this->language->get('entry_theme');
		$this->data['entry_message'] = $this->language->get('entry_message');
		$this->data['entry_amount'] = $this->language->get('entry_amount');
		$this->data['entry_shipping'] = $this->language->get('entry_shipping');
		$this->data['entry_payment'] = $this->language->get('entry_payment');
		$this->data['entry_voucher'] = $this->language->get('entry_voucher');
		$this->data['entry_coupon'] = $this->language->get('entry_coupon');
		$this->data['entry_reward'] = $this->language->get('entry_reward');

		$this->data['column_product'] = $this->language->get('column_product');
		$this->data['column_model'] = $this->language->get('column_model');
		$this->data['column_quantity'] = $this->language->get('column_quantity');
		$this->data['column_price'] = $this->language->get('column_price');
		$this->data['column_total'] = $this->language->get('column_total');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_product'] = $this->language->get('button_add_product');
		$this->data['button_add_voucher'] = $this->language->get('button_add_voucher');
		$this->data['button_update_total'] = $this->language->get('button_update_total');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['button_upload'] = $this->language->get('button_upload');

		$this->data['tab_order'] = $this->language->get('tab_order');
		$this->data['tab_customer'] = $this->language->get('tab_customer');
		$this->data['tab_payment'] = $this->language->get('tab_payment');
		$this->data['tab_shipping'] = $this->language->get('tab_shipping');
		$this->data['tab_product'] = $this->language->get('tab_product');
		$this->data['tab_voucher'] = $this->language->get('tab_voucher');
		$this->data['tab_total'] = $this->language->get('tab_total');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['firstname'])) {
			$this->data['error_firstname'] = $this->error['firstname'];
		} else {
			$this->data['error_firstname'] = '';
		}

		if (isset($this->error['lastname'])) {
			$this->data['error_lastname'] = $this->error['lastname'];
		} else {
			$this->data['error_lastname'] = '';
		}

		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}

		if (isset($this->error['telephone'])) {
			$this->data['error_telephone'] = $this->error['telephone'];
		} else {
			$this->data['error_telephone'] = '';
		}

		if (isset($this->error['payment_firstname'])) {
			$this->data['error_payment_firstname'] = $this->error['payment_firstname'];
		} else {
			$this->data['error_payment_firstname'] = '';
		}

		if (isset($this->error['payment_lastname'])) {
			$this->data['error_payment_lastname'] = $this->error['payment_lastname'];
		} else {
			$this->data['error_payment_lastname'] = '';
		}

		if (isset($this->error['payment_address_1'])) {
			$this->data['error_payment_address_1'] = $this->error['payment_address_1'];
		} else {
			$this->data['error_payment_address_1'] = '';
		}

		if (isset($this->error['payment_city'])) {
			$this->data['error_payment_city'] = $this->error['payment_city'];
		} else {
			$this->data['error_payment_city'] = '';
		}

		if (isset($this->error['payment_postcode'])) {
			$this->data['error_payment_postcode'] = $this->error['payment_postcode'];
		} else {
			$this->data['error_payment_postcode'] = '';
		}

		if (isset($this->error['payment_tax_id'])) {
			$this->data['error_payment_tax_id'] = $this->error['payment_tax_id'];
		} else {
			$this->data['error_payment_tax_id'] = '';
		}

		if (isset($this->error['payment_country'])) {
			$this->data['error_payment_country'] = $this->error['payment_country'];
		} else {
			$this->data['error_payment_country'] = '';
		}

		if (isset($this->error['payment_zone'])) {
			$this->data['error_payment_zone'] = $this->error['payment_zone'];
		} else {
			$this->data['error_payment_zone'] = '';
		}

		if (isset($this->error['payment_method'])) {
			$this->data['error_payment_method'] = $this->error['payment_method'];
		} else {
			$this->data['error_payment_method'] = '';
		}

		if (isset($this->error['shipping_firstname'])) {
			$this->data['error_shipping_firstname'] = $this->error['shipping_firstname'];
		} else {
			$this->data['error_shipping_firstname'] = '';
		}

		if (isset($this->error['shipping_lastname'])) {
			$this->data['error_shipping_lastname'] = $this->error['shipping_lastname'];
		} else {
			$this->data['error_shipping_lastname'] = '';
		}

		if (isset($this->error['shipping_address_1'])) {
			$this->data['error_shipping_address_1'] = $this->error['shipping_address_1'];
		} else {
			$this->data['error_shipping_address_1'] = '';
		}

		if (isset($this->error['shipping_city'])) {
			$this->data['error_shipping_city'] = $this->error['shipping_city'];
		} else {
			$this->data['error_shipping_city'] = '';
		}

		if (isset($this->error['shipping_postcode'])) {
			$this->data['error_shipping_postcode'] = $this->error['shipping_postcode'];
		} else {
			$this->data['error_shipping_postcode'] = '';
		}

		if (isset($this->error['shipping_country'])) {
			$this->data['error_shipping_country'] = $this->error['shipping_country'];
		} else {
			$this->data['error_shipping_country'] = '';
		}

		if (isset($this->error['shipping_zone'])) {
			$this->data['error_shipping_zone'] = $this->error['shipping_zone'];
		} else {
			$this->data['error_shipping_zone'] = '';
		}

		if (isset($this->error['shipping_method'])) {
			$this->data['error_shipping_method'] = $this->error['shipping_method'];
		} else {
			$this->data['error_shipping_method'] = '';
		}

		$url = '';

//		if (isset($this->request->get['filter_order_id'])) {$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];}

		if (isset($this->request->get['filter_customer'])) {
			$url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_order_status_id'])) {
			$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
		}

		if (isset($this->request->get['filter_total'])) {
			$url .= '&filter_total=' . $this->request->get['filter_total'];
		}

		if (isset($this->request->get['filter_order_date'])) {$url .= '&filter_order_date=' . $this->request->get['filter_order_date'];}
		if (isset($this->request->get['filter_delivery_date'])) {$url .= '&filter_delivery_date=' . $this->request->get['filter_delivery_date'];}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('sale/ordercollector', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' :: '
		);

		if (!isset($this->request->get['order_id'])) {
			$this->data['action'] = $this->url->link('sale/ordercollector/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('sale/ordercollector/update', 'token=' . $this->session->data['token'] . '&order_id=' . $this->request->get['order_id'] . $url, 'SSL');
		}

		$this->data['cancel'] = $this->url->link('sale/ordercollector', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['order_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$order_info = $this->model_sale_order->getOrder($this->request->get['order_id'],$this->user->getId());
		}
		if(empty($order_info)){
$this->redirect($this->url->link('sale/ordercollector', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->request->get['order_id'])) {
			$this->data['order_id'] = $this->request->get['order_id'];
		} else {
			$this->data['order_id'] = 0;
		}

		$this->data['start_timer'] = '';
		$this->data['stop_timer'] = '';
		if (!empty($order_info) and !empty($order_info['timer'])) {
			$timer = json_decode($order_info['timer'],true);

			if(!empty($timer['start'])){
				$this->data['start_timer'] = $timer['start'];
			}
			if(!empty($timer['stop'])){
				$this->data['stop_timer'] = $timer['stop'];
			}
		}

		if (isset($this->request->post['customer'])) {$this->data['customer'] = $this->request->post['customer'];} elseif (!empty($order_info)) {$this->data['customer'] = $order_info['customer'];} else {$this->data['customer'] = '';}

		if (isset($this->request->post['customer_id'])) {$this->data['customer_id'] = $this->request->post['customer_id'];} elseif (!empty($order_info)) {$this->data['customer_id'] = $order_info['customer_id'];} else {$this->data['customer_id'] = '';}

		if (isset($this->request->post['firstname'])) {$this->data['firstname'] = $this->request->post['firstname'];} elseif (!empty($order_info)) {$this->data['firstname'] = $order_info['firstname'];} else {$this->data['firstname'] = '';}

		if (isset($this->request->post['email'])) {$this->data['email'] = $this->request->post['email'];} elseif (!empty($order_info)) {$this->data['email'] = $order_info['email'];} else {$this->data['email'] = '';}

		if (isset($this->request->post['telephone'])) {$this->data['telephone'] = $this->request->post['telephone'];} elseif (!empty($order_info)) {$this->data['telephone'] = $order_info['telephone'];} else {$this->data['telephone'] = '';}

		if (isset($this->request->post['order_status_id'])) {$this->data['order_status_id'] = $this->request->post['order_status_id'];} elseif (!empty($order_info)) {$this->data['order_status_id'] = $order_info['order_status_id'];} else {$this->data['order_status_id'] = '';}

		$this->load->model('localisation/order_status');

		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['comment'])) {$this->data['comment'] = $this->request->post['comment'];} elseif (!empty($order_info)) {$this->data['comment'] = $order_info['comment'];} else {$this->data['comment'] = '';}

		if (isset($this->request->post['payment_method'])) {$this->data['payment_method'] = $this->request->post['payment_method'];} elseif (!empty($order_info)) {$this->data['payment_method'] = $order_info['payment_method'];} else {$this->data['payment_method'] = '';}

		if (isset($this->request->post['date_shipping'])) {
			$this->data['date_shipping'] = $this->request->post['date_shipping'];
		} elseif (!empty($order_info)) {
			$this->data['date_shipping'] = $order_info['date_shipping'];
//	$this->data['date_shipping'] = date("F d, Y",strtotime($query_order->row['date_shipping']));
		} else {
			$this->data['date_shipping'] = '';
		}

		$time_shipping = array();
		$this->data['delivery_times'] = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "delivery_window ORDER BY delivery_name ASC");
		if($query->num_rows){
			foreach($query->rows as $row){
				$this->data['delivery_times'][$row['delivery_id']] = array(
					'delivery_name' => $row['delivery_name'],
					'delivery_short' => $row['delivery_short'],
					'delivery_id' => $row['delivery_id']
				);
				$time_shipping[trim($row['delivery_short'])] = $row['delivery_name'];
			}
		}

		if (isset($this->request->post['time_shipping'])) {
			$this->data['time_shipping'] = $time_shipping[$this->request->post['time_shipping']];
		} elseif (!empty($order_info)) {
			if(empty($time_shipping[trim($order_info['time_shipping'])])){
				$this->data['time_shipping'] = $order_info['time_shipping'];
			}else{
				$this->data['time_shipping'] = $time_shipping[trim($order_info['time_shipping'])];
			}
		} else {
			$this->data['time_shipping'] = '';
		}

		$this->data['time_shipping_short'] = trim($order_info['time_shipping']);

		if (!empty($order_info)) {
			if(!empty($time_shipping[trim($order_info['collection_window'])])){
				$this->data['collection_window'] = $time_shipping[trim($order_info['collection_window'])];
			}else{
				$this->data['collection_window'] = $order_info['collection_window'];
			}
		} else {$this->data['collection_window'] = '';}
		
		$this->data['collection_window2'] = $order_info['collection_window'];

		if (!empty($this->request->post['unavailable'])) {
			$this->data['unavailable'] = 1;
		} elseif (!empty($order_info) and !empty($order_info['unavailable'])) {
			$this->data['unavailable'] = 1;
		} else {
			$this->data['unavailable'] = 0;
		}

		if (!empty($this->request->post['collector'])) {
			$this->data['collector'] = 1;
		} elseif (!empty($order_info) and !empty($order_info['collector'])) {
			$this->data['collector'] = 1;
		} else {
			$this->data['collector'] = 0;
		}
		
		$this->data['collector_data'] = array();
		$this->data['collectors_data'] = array();
	
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE user_group_id > 1");//	user_group_id всегда выше 1. так как 1 = администратор
		if($query->num_rows){
			foreach($query->rows as $row){
				if(!empty($order_info) and (int)$order_info['user_id'] == (int)$row['user_id']){
					$this->data['collector_data'] = array(
						'firstname' => $query->row['firstname'],
						'user_id' => $query->row['user_id'],
						'email' => $query->row['email'],
						'telephone' => $query->row['telephone']
					);
				}
				$this->data['collectors_data'][$row['user_id']] = array(
					'firstname' => $row['firstname'],
					'email' => $row['email'],
					'telephone' => $row['telephone']
				);
			}
		}
		
		
		$this->data['payment_statuses'] = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "payment_status ORDER BY payment_status ASC");
		if($query->num_rows){
			foreach($query->rows as $row){
				if($order_info['payment_status_id'] == $row['payment_status_id']){
					$selected = 'selected';
				}else{
					$selected = '';
				}
				$this->data['payment_statuses'][$row['payment_status_id']] = array(
					'payment_status' => $row['payment_status'],
					'payment_status_id' => $row['payment_status_id'],
					'selected' => $selected
				);
			}
		}
		
		$this->data['reqs'] = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "req_dop ORDER BY req_name ASC");
		if($query->num_rows){
			foreach($query->rows as $row){
				$this->data['reqs'][(int)$row['req_id']] = array(
					'req_id' => (int)$row['req_id'],
					'name' => $row['req_name']
				);
			}
		}

		if (!empty($order_info)) {
			$this->data['date_added'] = date("F d, Y",strtotime($order_info['date_added']));
		} else {
			$this->data['date_added'] = date("F d, Y");
		}
		
		if (!empty($order_info) and !empty($order_info['req'])) {
			$this->data['order_req'] = json_decode($order_info['req'],true);
		}else{
			$this->data['order_req'] = array();
		}
		
		if (!empty($order_info) and !empty($order_info['proof'])) {
			$proofs = json_decode($order_info['proof'],true);
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

		$order_statuses = array();
		$this->data['order_status'] = '';
		$order_status_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_status");
		if($order_status_query->num_rows){
			foreach($order_status_query->rows as $row){ 
				$order_statuses[$row['order_status_id']] = $row['name'];
			}
			if(!empty($order_statuses[$this->data['order_status_id']])){
				$this->data['order_status'] = $order_statuses[$this->data['order_status_id']];
			}
		}
		$this->data['order_statuses'] = $order_statuses;

		$this->data['collected_status'] = '';
		$collected_status = array();
		$order_status_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "collected_status");
		if($order_status_query->num_rows){
			foreach($order_status_query->rows as $row){
				$collected_status[$row['collect_status_id']] = $row['name'];
			}
		}

		$this->data['order_payment_status'] = '';
		$payment_status_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "payment_status WHERE payment_status_id = '" . (int)$order_info['payment_status_id'] . "'");
		if($payment_status_query->num_rows){
			$this->data['order_payment_status'] = $payment_status_query->row['payment_status'];
		}
		//	kitchen_checkout
		$this->data['kitchen_checkout'] = '';
		$kitchen_checkout_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "my_kitchen WHERE kitchen_id = '" . (int)$order_info['kitchen_checkout'] . "'");
		if($kitchen_checkout_query->num_rows){
			$this->data['kitchen_checkout'] = array(
				'name' => $kitchen_checkout_query->row['name'],
				'address' => $kitchen_checkout_query->row['address']
			);
		}
		//	customer_checkout
		$this->data['customer_checkout'] = array(
			'firstname' => $order_info['firstname'],
			'email' => $order_info['email'],
			'telephone' => $order_info['telephone']
		);
		
		//	выбираем товары с локализацией и группируем их для вывода
		$this->data['all_locations'] = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product GROUP BY location ORDER BY location ASC");//	WHERE code = '" . $this->db->escape($currency) . "'
		if($query->num_rows){
			foreach($query->rows as $row){
				if(!empty($row['location'])){
					$this->data['all_locations'][trim($row['location'])] = trim($row['location']);
				}
			}
		}

		if (isset($this->request->post['order_product'])) {
			$order_products = $this->request->post['order_product'];
		} elseif (isset($this->request->get['order_id'])) {
			$order_products = $this->model_sale_order->getOrderProducts($this->request->get['order_id']);
		} else {
			$order_products = array();
		}

		$collection_status = array();
		
		$this->load->model('catalog/product');

		$this->document->addScript('view/javascript/jquery/ajaxupload.js');

		$this->data['order_products'] = array();
		
		$locations = array();
		
		foreach ($order_products as $order_product) {
			$locations[trim($order_product['location'])] = trim($order_product['location']);
			
			if(in_array($order_product['status_collect_product'],array(0,1,2))){
				if(!isset($collection_status[$collected_status[$order_product['status_collect_product']]])){
					$collection_status[$collected_status[$order_product['status_collect_product']]] = 0;
				}
				$collection_status[$collected_status[$order_product['status_collect_product']]]++;
			}
			//	проверяем наличие товара другого типа в самом заказе
			if( (trim($order_product['type']) == 'unit' and isset($this->data['order_products'][(int)$order_product['product_id'] . ':case'])) or (trim($order_product['type']) == 'case' and isset($this->data['order_products'][(int)$order_product['product_id'] . ':unit'])) ){
				$open_sel_type = false;
			}else{
				$open_sel_type = true;
			}
			$product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$order_product['product_id'] . "'");
			if($product_query->num_rows){
				if(!empty((float)$product_query->row['unit_price']) and !empty((float)$product_query->row['case_price'])){
					$open_sel_type = true;
				}else{
					$open_sel_type = false;
				}
			}
//	echo $order_product['name'] . '=' . $product_query->row['unit_price'] . ', ' . $product_query->row['case_price'] . '<br/>';
			$this->data['order_products'][(int)$order_product['product_id'] . ':' . trim($order_product['type'])] = array(
				'order_product_id' => $order_product['order_product_id'],
				'order_id' => $order_product['order_id'],
				'product_id'       => $order_product['product_id'],
				'name'             => $order_product['name'],
				'location' => $order_product['location'],
				'type' => $order_product['type'],
				'open_sel_type' => $open_sel_type,
				'bin' => $order_product['bin'],
				'upc'           => $order_product['upc'],
				'quantity' => (int)$order_product['quantity'],
				'old_quantity' => (int)$order_product['old_quantity'],
				'price'            => $order_product['price'],
				'total'            => $order_product['total'],
				'old_total' => (int)$order_product['old_quantity'] * (float)$order_product['price'],
				'merchants'         => $order_product['merchants'],
				'status_collect_product' => $order_product['status_collect_product'],
				'collected_status' => isset($collected_status[$order_product['status_collect_product']])?$collected_status[$order_product['status_collect_product']]:$order_product['status_collect_product']
			);
		}
		// Order Totals			
		$order_total_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_total` WHERE order_id = '" . (int)$this->request->get['order_id'] . "' ORDER BY sort_order ASC");
		$this->data['totals'] = array();
		if($order_total_query->num_rows){
			foreach ($order_total_query->rows as $order_total) {
				$this->data['totals'][] = array(
					'title' => $order_total['title'],
					'value' => number_format((float)$order_total['value'],2)
				);
			}
		}
		
		if(!empty($collected_status)){
			foreach($collected_status as $id=>$row){
				if(in_array($id,array(0,1,2))){

					if(!empty($collection_status[$row])){
						$this->data['collection_status'][$row] = $collection_status[$row];
					}else{
						$this->data['collection_status'][$row] = 0;
					}
				}
			}
			$this->data['all_collected_status'] = $collected_status;
		}

		if (isset($this->request->post['location'])) {$this->data['location'] = implode(", ",$this->request->post['location']);} elseif (!empty($order_info)) {$this->data['location'] = implode(", ",$locations);} else {$this->data['location'] = '';}

		if (isset($this->request->post['order_total'])) {
			$this->data['order_totals'] = $this->request->post['order_total'];
		} elseif (isset($this->request->get['order_id'])) {
			$this->data['order_totals'] = $this->model_sale_order->getOrderTotals($this->request->get['order_id']);
		} else {
			$this->data['order_totals'] = array();
		}

		$this->template = 'sale/order_form_collector.tpl';
		$this->children = array('common/header','common/footer');

		$this->response->setOutput($this->render());
	}
//	##############################	СПИСОК
	protected function getList() {
		if (isset($this->request->get['location'])) {$filter_location = $this->request->get['location'];} else {$filter_location = null;}
		$filter_user_id = $this->user->getId();
		if (isset($this->request->get['filter_order_status_id'])) {$filter_order_status_id = $this->request->get['filter_order_status_id'];} else {$filter_order_status_id = null;}
		if (isset($this->request->get['filter_payment_status_id'])) {$filter_payment_status_id = $this->request->get['filter_payment_status_id'];} else {$filter_payment_status_id = null;}
		if (isset($this->request->get['filter_order_date'])) {$filter_order_date = $this->request->get['filter_order_date'];} else {$filter_order_date = null;}
		if (isset($this->request->get['filter_delivery_date'])) {$filter_delivery_date = $this->request->get['filter_delivery_date'];} else {$filter_delivery_date = null;}

//		if (isset($this->request->get['filter_order_id'])) {$filter_order_id = $this->request->get['filter_order_id'];} else {$filter_order_id = null;}
//		if (isset($this->request->get['filter_customer'])) {$filter_customer = $this->request->get['filter_customer'];} else {$filter_customer = null;}
//		if (isset($this->request->get['filter_total'])) {$filter_total = $this->request->get['filter_total'];} else {$filter_total = null;}

		if (isset($this->request->get['sort'])) {$sort = $this->request->get['sort'];} else {$sort = 'o.order_id';}
		if (isset($this->request->get['order'])) {$order = $this->request->get['order'];} else {$order = 'DESC';}

		if (isset($this->request->get['page'])) {$page = $this->request->get['page'];} else {$page = 1;}

		$url = '';
		
//		if (isset($this->request->get['filter_order_id'])) {$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];}

		if (isset($this->request->get['filter_customer'])) {
			$url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_order_status_id'])) {
			$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
		}

		if (isset($this->request->get['filter_total'])) {
			$url .= '&filter_total=' . $this->request->get['filter_total'];
		}

		if (isset($this->request->get['filter_order_date'])) {
			$url .= '&filter_order_date=' . $this->request->get['filter_order_date'];
		}

		if (isset($this->request->get['filter_delivery_date'])) {$url .= '&filter_delivery_date=' . $this->request->get['filter_delivery_date'];}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array('text'      => $this->language->get('heading_title'),'href'      => $this->url->link('sale/ordercollector', 'token=' . $this->session->data['token'] . $url, 'SSL'),'separator' => ' :: ');

		$this->data['invoice'] = $this->url->link('sale/ordercollector/invoice', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['insert'] = $this->url->link('sale/ordercollector/insert', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['delete'] = $this->url->link('sale/ordercollector/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['locations'] = array();
		$query = $this->db->query("SELECT location FROM " . DB_PREFIX . "order_product GROUP BY location");
		if($query->num_rows){
			foreach($query->rows as $row){
				$this->data['locations'][] = $row['location'];
			}
		}

		$this->data['collectors'] = array();
		$query = $this->db->query("SELECT u.user_id AS user_id, u.firstname, u.email, u.telephone FROM " . DB_PREFIX . "order o LEFT JOIN " . DB_PREFIX . "user u ON (o.user_id = u.user_id) WHERE u.user_group_id > 1 GROUP BY u.user_id");
		if($query->num_rows){
			foreach($query->rows as $row){
				$this->data['collectors'][$row['user_id']] = array(
					'firstname' => $row['firstname'],
					'user_id' => $row['user_id'],
					'email' => $row['email'],
					'telephone' => $row['telephone']
				);
			}
		}

		$this->data['order_status'] = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order o LEFT JOIN " . DB_PREFIX . "order_status os ON (o.order_status_id = os.order_status_id) GROUP BY o.order_status_id");
		if($query->num_rows){
			foreach($query->rows as $row){
				$this->data['order_status'][$row['order_status_id']] = array(
					'name' => $row['name'],
					'order_status_id' => $row['order_status_id']
				);
			}
		}

		$this->data['payment_status'] = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order o LEFT JOIN " . DB_PREFIX . "payment_status ps ON (o.payment_status_id = ps.payment_status_id) GROUP BY ps.payment_status_id");
		if($query->num_rows){
			foreach($query->rows as $row){
				$this->data['payment_status'][$row['payment_status_id']] = array(
					'payment_status' => $row['payment_status'],
					'payment_status_id' => $row['payment_status_id']
				);
			}
		}

		$this->data['orders'] = array();
$time_shipping = array(
			'9-12'=>'9:00 AM - 12:00 PM',
			'12-15'=>'12:00 AM - 3:00 PM',
			'15-18'=>'3:00 AM - 6:00 PM'
		);
			
		$data = array(
			'filter_location' => $filter_location,
			'filter_user_id'        => $filter_user_id,
			'filter_order_status_id' => $filter_order_status_id,
			'filter_payment_status_id' => $filter_payment_status_id,
			'filter_order_date'      => $filter_order_date,
			'filter_delivery_date'   => $filter_delivery_date,
//			'filter_customer'	     => $filter_customer,
//			'filter_total'           => $filter_total,		
			'sort'                   => $sort,
			'order'                  => $order,
			'start'                  => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit'                  => $this->config->get('config_admin_limit')
		);

		$order_total = $this->model_sale_order->getTotalOrders($data);

		$results = $this->model_sale_order->getOrders($data);

		foreach ($results as $result) {
			$locations = array();
			$count_products = 0;
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$result['order_id'] . "'");
			if($query->num_rows){
				foreach($query->rows as $row){
					$locations[trim($row['location'])] = trim($row['location']);
					$count_products = $count_products + (int)$row['quantity'];
				}
			}
			$location = '';
			if(!empty($locations) and is_array($locations)){
				$location = implode(", ", $locations);
			}
			
			$action = array();

//			$action[] = array(
//				'text' => $this->language->get('text_view'),
//				'href' => $this->url->link('sale/ordercollector/info', 'token=' . $this->session->data['token'] . '&order_id=' . $result['order_id'] . $url, 'SSL')
//			);

			if (strtotime($result['date_added']) > strtotime('-' . (int)$this->config->get('config_order_edit') . ' day')) {
				$action[] = array(
					'text' => $this->language->get('text_edit'),
					'href' => $this->url->link('sale/ordercollector/update', 'token=' . $this->session->data['token'] . '&order_id=' . $result['order_id'] . $url, 'SSL')
				);
			}
			$user = 'N/A';
			if(!empty($result['user_id'])){
				$user_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE user_id = '" . (int)$result['user_id'] . "'");
				if($user_query->num_rows){
					if(!empty($user_query->row['firstname'])){
						$user = $user_query->row['firstname'];
					}else{
						$user = $user_query->row['username'];
					}
					
				}				
			}

			$this->data['orders'][] = array(
				'order_id'      => $result['order_id'],
				'payment_status' => $result['payment_status'],
				'customer'      => $result['customer'],
				'status'        => $result['status'],
				'order_status_id' => $result['order_status_id'],
				'count' => $count_products,
				'location' => $location,
				'time_shipping' => !empty($time_shipping[trim($result['time_shipping'])])?$time_shipping[trim($result['time_shipping'])]:$result['time_shipping'],
				'total'         => number_format((float)$result['total'],2),
				'date_added'    => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'date_shipping' => date($this->language->get('date_format_short'), strtotime($result['date_shipping'])),
				'selected'      => isset($this->request->post['selected']) && in_array($result['order_id'], $this->request->post['selected']),
				'action'        => $action,
				'user' => $user,
				'href' => $this->url->link('sale/ordercollector/update', 'token=' . $this->session->data['token'] . '&order_id=' . $result['order_id'] . $url, 'SSL')
			);
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_missing'] = $this->language->get('text_missing');

		$this->data['column_order_id'] = $this->language->get('column_order_id');
		$this->data['column_customer'] = $this->language->get('column_customer');
		$this->data['column_status'] = $this->language->get('column_status');
		$this->data['column_total'] = $this->language->get('column_total');
		$this->data['column_date_added'] = $this->language->get('column_date_added');
		$this->data['column_date_modified'] = $this->language->get('column_date_modified');
		$this->data['column_action'] = $this->language->get('column_action');

		$this->data['button_invoice'] = $this->language->get('button_invoice');
		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['button_filter'] = $this->language->get('button_filter');

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$url = '';

//		if (isset($this->request->get['filter_order_id'])) {$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];}

		if (isset($this->request->get['filter_customer'])) {
			$url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_order_status_id'])) {
			$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
		}

		if (isset($this->request->get['filter_total'])) {
			$url .= '&filter_total=' . $this->request->get['filter_total'];
		}

		if (isset($this->request->get['filter_order_date'])) {$url .= '&filter_order_date=' . $this->request->get['filter_order_date'];}
		if (isset($this->request->get['filter_delivery_date'])) {$url .= '&filter_delivery_date=' . $this->request->get['filter_delivery_date'];}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['sort_order'] = $this->url->link('sale/ordercollector', 'token=' . $this->session->data['token'] . '&sort=o.order_id' . $url, 'SSL');
		$this->data['sort_customer'] = $this->url->link('sale/ordercollector', 'token=' . $this->session->data['token'] . '&sort=customer' . $url, 'SSL');
		$this->data['sort_status'] = $this->url->link('sale/ordercollector', 'token=' . $this->session->data['token'] . '&sort=status' . $url, 'SSL');
		$this->data['sort_total'] = $this->url->link('sale/ordercollector', 'token=' . $this->session->data['token'] . '&sort=o.total' . $url, 'SSL');
		$this->data['sort_date_added'] = $this->url->link('sale/ordercollector', 'token=' . $this->session->data['token'] . '&sort=o.date_added' . $url, 'SSL');
		$this->data['sort_date_modified'] = $this->url->link('sale/ordercollector', 'token=' . $this->session->data['token'] . '&sort=o.date_modified' . $url, 'SSL');

		$url = '';

//		if (isset($this->request->get['filter_order_id'])) {$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];}

		if (isset($this->request->get['filter_customer'])) {
			$url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_order_status_id'])) {
			$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
		}

		if (isset($this->request->get['filter_total'])) {
			$url .= '&filter_total=' . $this->request->get['filter_total'];
		}

		if (isset($this->request->get['filter_order_date'])) {$url .= '&filter_order_date=' . $this->request->get['filter_order_date'];}
		if (isset($this->request->get['filter_delivery_date'])) {$url .= '&filter_delivery_date=' . $this->request->get['filter_delivery_date'];}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $order_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('sale/ordercollector', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

//		$this->data['filter_order_id'] = $filter_order_id;
//		$this->data['filter_customer'] = $filter_customer;
		$this->data['filter_order_status_id'] = $filter_order_status_id;
//		$this->data['filter_total'] = $filter_total;
		$this->data['filter_order_date'] = $filter_order_date;
		$this->data['filter_delivery_date'] = $filter_delivery_date;

		$this->load->model('localisation/order_status');

		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'sale/order_list_collector.tpl';
		$this->children = array('common/header','common/footer');
		$this->response->setOutput($this->render());
	}

	public function update() {
		$this->language->load('sale/order');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('sale/order');
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_sale_order->editOrder($this->request->get['order_id'], $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$url = '';
//			if (isset($this->request->get['filter_order_id'])) {$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];}
			if (isset($this->request->get['filter_customer'])) {
				$url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
			}
			if (isset($this->request->get['filter_order_status_id'])) {
				$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
			}
			if (isset($this->request->get['filter_total'])) {
				$url .= '&filter_total=' . $this->request->get['filter_total'];
			}
			if (isset($this->request->get['filter_order_date'])) {$url .= '&filter_order_date=' . $this->request->get['filter_order_date'];}
			if (isset($this->request->get['filter_delivery_date'])) {$url .= '&filter_delivery_date=' . $this->request->get['filter_delivery_date'];}
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			$this->redirect($this->url->link('sale/ordercollector', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->language->load('sale/order');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/order');

		if (isset($this->request->post['selected']) && ($this->validateDelete())) {
			foreach ($this->request->post['selected'] as $order_id) {
				$this->model_sale_order->deleteOrder($order_id);
				$this->openbay->deleteOrder($order_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

//			if (isset($this->request->get['filter_order_id'])) {$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];}

			if (isset($this->request->get['filter_customer'])) {
				$url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_order_status_id'])) {
				$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
			}

			if (isset($this->request->get['filter_total'])) {
				$url .= '&filter_total=' . $this->request->get['filter_total'];
			}

			if (isset($this->request->get['filter_order_date'])) {$url .= '&filter_order_date=' . $this->request->get['filter_order_date'];}
			if (isset($this->request->get['filter_delivery_date'])) {$url .= '&filter_delivery_date=' . $this->request->get['filter_delivery_date'];}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('sale/ordercollector', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'sale/order')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	public function info() {
		$this->load->model('sale/order');

		if (isset($this->request->get['order_id'])) {
			$order_id = $this->request->get['order_id'];
		} else {
			$order_id = 0;
		}

		$order_info = $this->model_sale_order->getOrder($order_id);

		if ($order_info) {
			$this->language->load('sale/order');

			$this->document->setTitle($this->language->get('heading_title'));

			$this->data['heading_title'] = $this->language->get('heading_title');

			$this->data['text_amazon_order_id'] = $this->language->get('text_amazon_order_id');
			$this->data['text_name'] = $this->language->get('text_name');
			$this->data['text_order_id'] = $this->language->get('text_order_id');
			$this->data['text_invoice_no'] = $this->language->get('text_invoice_no');
			$this->data['text_invoice_date'] = $this->language->get('text_invoice_date');
			$this->data['text_store_name'] = $this->language->get('text_store_name');
			$this->data['text_store_url'] = $this->language->get('text_store_url');
			$this->data['text_customer'] = $this->language->get('text_customer');
			$this->data['text_customer_group'] = $this->language->get('text_customer_group');
			$this->data['text_email'] = $this->language->get('text_email');
			$this->data['text_telephone'] = $this->language->get('text_telephone');
			$this->data['text_fax'] = $this->language->get('text_fax');
			$this->data['text_total'] = $this->language->get('text_total');
			$this->data['text_reward'] = $this->language->get('text_reward');
			$this->data['text_order_status'] = $this->language->get('text_order_status');
			$this->data['text_comment'] = $this->language->get('text_comment');
			$this->data['text_affiliate'] = $this->language->get('text_affiliate');
			$this->data['text_commission'] = $this->language->get('text_commission');
			$this->data['text_ip'] = $this->language->get('text_ip');
			$this->data['text_forwarded_ip'] = $this->language->get('text_forwarded_ip');
			$this->data['text_user_agent'] = $this->language->get('text_user_agent');
			$this->data['text_accept_language'] = $this->language->get('text_accept_language');
			$this->data['text_date_added'] = $this->language->get('text_date_added');
			$this->data['text_date_modified'] = $this->language->get('text_date_modified');
			$this->data['text_firstname'] = $this->language->get('text_firstname');
			$this->data['text_lastname'] = $this->language->get('text_lastname');
			$this->data['text_company'] = $this->language->get('text_company');
			$this->data['text_company_id'] = $this->language->get('text_company_id');
			$this->data['text_tax_id'] = $this->language->get('text_tax_id');
			$this->data['text_address_1'] = $this->language->get('text_address_1');
			$this->data['text_address_2'] = $this->language->get('text_address_2');
			$this->data['text_city'] = $this->language->get('text_city');
			$this->data['text_postcode'] = $this->language->get('text_postcode');
			$this->data['text_zone'] = $this->language->get('text_zone');
			$this->data['text_zone_code'] = $this->language->get('text_zone_code');
			$this->data['text_country'] = $this->language->get('text_country');
			$this->data['text_shipping_method'] = $this->language->get('text_shipping_method');
			$this->data['text_payment_method'] = $this->language->get('text_payment_method');
			$this->data['text_download'] = $this->language->get('text_download');
			$this->data['text_wait'] = $this->language->get('text_wait');
			$this->data['text_generate'] = $this->language->get('text_generate');
			$this->data['text_reward_add'] = $this->language->get('text_reward_add');
			$this->data['text_reward_remove'] = $this->language->get('text_reward_remove');
			$this->data['text_commission_add'] = $this->language->get('text_commission_add');
			$this->data['text_commission_remove'] = $this->language->get('text_commission_remove');
			$this->data['text_credit_add'] = $this->language->get('text_credit_add');
			$this->data['text_credit_remove'] = $this->language->get('text_credit_remove');
			$this->data['text_country_match'] = $this->language->get('text_country_match');
			$this->data['text_country_code'] = $this->language->get('text_country_code');
			$this->data['text_high_risk_country'] = $this->language->get('text_high_risk_country');
			$this->data['text_distance'] = $this->language->get('text_distance');
			$this->data['text_ip_region'] = $this->language->get('text_ip_region');
			$this->data['text_ip_city'] = $this->language->get('text_ip_city');
			$this->data['text_ip_latitude'] = $this->language->get('text_ip_latitude');
			$this->data['text_ip_longitude'] = $this->language->get('text_ip_longitude');
			$this->data['text_ip_isp'] = $this->language->get('text_ip_isp');
			$this->data['text_ip_org'] = $this->language->get('text_ip_org');
			$this->data['text_ip_asnum'] = $this->language->get('text_ip_asnum');
			$this->data['text_ip_user_type'] = $this->language->get('text_ip_user_type');
			$this->data['text_ip_country_confidence'] = $this->language->get('text_ip_country_confidence');
			$this->data['text_ip_region_confidence'] = $this->language->get('text_ip_region_confidence');
			$this->data['text_ip_city_confidence'] = $this->language->get('text_ip_city_confidence');
			$this->data['text_ip_postal_confidence'] = $this->language->get('text_ip_postal_confidence');
			$this->data['text_ip_postal_code'] = $this->language->get('text_ip_postal_code');
			$this->data['text_ip_accuracy_radius'] = $this->language->get('text_ip_accuracy_radius');
			$this->data['text_ip_net_speed_cell'] = $this->language->get('text_ip_net_speed_cell');
			$this->data['text_ip_metro_code'] = $this->language->get('text_ip_metro_code');
			$this->data['text_ip_area_code'] = $this->language->get('text_ip_area_code');
			$this->data['text_ip_time_zone'] = $this->language->get('text_ip_time_zone');
			$this->data['text_ip_region_name'] = $this->language->get('text_ip_region_name');
			$this->data['text_ip_domain'] = $this->language->get('text_ip_domain');
			$this->data['text_ip_country_name'] = $this->language->get('text_ip_country_name');
			$this->data['text_ip_continent_code'] = $this->language->get('text_ip_continent_code');
			$this->data['text_ip_corporate_proxy'] = $this->language->get('text_ip_corporate_proxy');
			$this->data['text_anonymous_proxy'] = $this->language->get('text_anonymous_proxy');
			$this->data['text_proxy_score'] = $this->language->get('text_proxy_score');
			$this->data['text_is_trans_proxy'] = $this->language->get('text_is_trans_proxy');
			$this->data['text_free_mail'] = $this->language->get('text_free_mail');
			$this->data['text_carder_email'] = $this->language->get('text_carder_email');
			$this->data['text_high_risk_username'] = $this->language->get('text_high_risk_username');
			$this->data['text_high_risk_password'] = $this->language->get('text_high_risk_password');
			$this->data['text_bin_match'] = $this->language->get('text_bin_match');
			$this->data['text_bin_country'] = $this->language->get('text_bin_country');
			$this->data['text_bin_name_match'] = $this->language->get('text_bin_name_match');
			$this->data['text_bin_name'] = $this->language->get('text_bin_name');
			$this->data['text_bin_phone_match'] = $this->language->get('text_bin_phone_match');
			$this->data['text_bin_phone'] = $this->language->get('text_bin_phone');
			$this->data['text_customer_phone_in_billing_location'] = $this->language->get('text_customer_phone_in_billing_location');
			$this->data['text_ship_forward'] = $this->language->get('text_ship_forward');
			$this->data['text_city_postal_match'] = $this->language->get('text_city_postal_match');
			$this->data['text_ship_city_postal_match'] = $this->language->get('text_ship_city_postal_match');
			$this->data['text_score'] = $this->language->get('text_score');
			$this->data['text_explanation'] = $this->language->get('text_explanation');
			$this->data['text_risk_score'] = $this->language->get('text_risk_score');
			$this->data['text_queries_remaining'] = $this->language->get('text_queries_remaining');
			$this->data['text_maxmind_id'] = $this->language->get('text_maxmind_id');
			$this->data['text_error'] = $this->language->get('text_error');

			$this->data['column_product'] = $this->language->get('column_product');
			$this->data['column_model'] = $this->language->get('column_model');
			$this->data['column_quantity'] = $this->language->get('column_quantity');
			$this->data['column_price'] = $this->language->get('column_price');
			$this->data['column_total'] = $this->language->get('column_total');
			$this->data['column_download'] = $this->language->get('column_download');
			$this->data['column_filename'] = $this->language->get('column_filename');
			$this->data['column_remaining'] = $this->language->get('column_remaining');

			$this->data['entry_order_status'] = $this->language->get('entry_order_status');
			$this->data['entry_notify'] = $this->language->get('entry_notify');
			$this->data['entry_comment'] = $this->language->get('entry_comment');

			$this->data['button_invoice'] = $this->language->get('button_invoice');
			$this->data['button_cancel'] = $this->language->get('button_cancel');
			$this->data['button_add_history'] = $this->language->get('button_add_history');

			$this->data['tab_order'] = $this->language->get('tab_order');
			$this->data['tab_payment'] = $this->language->get('tab_payment');
			$this->data['tab_shipping'] = $this->language->get('tab_shipping');
			$this->data['tab_product'] = $this->language->get('tab_product');
			$this->data['tab_history'] = $this->language->get('tab_history');
			$this->data['tab_fraud'] = $this->language->get('tab_fraud');

			$this->data['token'] = $this->session->data['token'];

			$url = '';

//			if (isset($this->request->get['filter_order_id'])) {$url .= '&filter_order_id=' . $this->request->get['filter_order_id'];}

			if (isset($this->request->get['filter_customer'])) {
				$url .= '&filter_customer=' . urlencode(html_entity_decode($this->request->get['filter_customer'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_order_status_id'])) {
				$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
			}

			if (isset($this->request->get['filter_total'])) {
				$url .= '&filter_total=' . $this->request->get['filter_total'];
			}

			if (isset($this->request->get['filter_order_date'])) {$url .= '&filter_order_date=' . $this->request->get['filter_order_date'];}
			if (isset($this->request->get['filter_delivery_date'])) {$url .= '&filter_delivery_date=' . $this->request->get['filter_delivery_date'];}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->data['breadcrumbs'] = array();

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => false
			);

			$this->data['breadcrumbs'][] = array('text'      => $this->language->get('heading_title'),'href'      => $this->url->link('sale/ordercollector', 'token=' . $this->session->data['token'] . $url, 'SSL'),'separator' => ' :: ');

			$this->data['invoice'] = $this->url->link('sale/ordercollector/invoice', 'token=' . $this->session->data['token'] . '&order_id=' . (int)$this->request->get['order_id'], 'SSL');
			$this->data['cancel'] = $this->url->link('sale/ordercollector', 'token=' . $this->session->data['token'] . $url, 'SSL');

			$this->data['order_id'] = $this->request->get['order_id'];

			if ($order_info['invoice_no']) {
				$this->data['invoice_no'] = $order_info['invoice_prefix'] . $order_info['invoice_no'];
			} else {
				$this->data['invoice_no'] = '';
			}

			$this->data['amazon_order_id'] = $order_info['amazon_order_id'];
			$this->data['store_name'] = $order_info['store_name'];
			$this->data['store_url'] = $order_info['store_url'];
			$this->data['firstname'] = $order_info['firstname'];
			$this->data['lastname'] = $order_info['lastname'];

			if ($order_info['customer_id']) {
				$this->data['customer'] = $this->url->link('sale/customer/update', 'token=' . $this->session->data['token'] . '&customer_id=' . $order_info['customer_id'], 'SSL');
			} else {
				$this->data['customer'] = '';
			}

			$this->load->model('sale/customer_group');

			$customer_group_info = $this->model_sale_customer_group->getCustomerGroup($order_info['customer_group_id']);

			if ($customer_group_info) {
				$this->data['customer_group'] = $customer_group_info['name'];
			} else {
				$this->data['customer_group'] = '';
			}

			$this->data['email'] = $order_info['email'];
			$this->data['telephone'] = $order_info['telephone'];
			$this->data['fax'] = $order_info['fax'];
			$this->data['comment'] = nl2br($order_info['comment']);
			$this->data['shipping_method'] = $order_info['shipping_method'];
			$this->data['payment_method'] = $order_info['payment_method'];
			$this->data['total'] = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value']);

			if ($order_info['total'] < 0) {
				$this->data['credit'] = $order_info['total'];
			} else {
				$this->data['credit'] = 0;
			}

			$this->load->model('sale/customer');

			$this->data['credit_total'] = $this->model_sale_customer->getTotalTransactionsByOrderId($this->request->get['order_id']);

			$this->data['reward'] = $order_info['reward'];

			$this->data['reward_total'] = $this->model_sale_customer->getTotalCustomerRewardsByOrderId($this->request->get['order_id']);

			$this->data['affiliate_firstname'] = $order_info['affiliate_firstname'];
			$this->data['affiliate_lastname'] = $order_info['affiliate_lastname'];


			$this->data['affiliate'] = '';
			

			$this->data['commission'] = $this->currency->format($order_info['commission'], $order_info['currency_code'], $order_info['currency_value']);

			$this->load->model('sale/affiliate');

			$this->data['commission_total'] = $this->model_sale_affiliate->getTotalTransactionsByOrderId($this->request->get['order_id']);

			$this->load->model('localisation/order_status');

			$order_status_info = $this->model_localisation_order_status->getOrderStatus($order_info['order_status_id']);

			if ($order_status_info) {
				$this->data['order_status'] = $order_status_info['name'];
			} else {
				$this->data['order_status'] = '';
			}

			$this->data['ip'] = $order_info['ip'];
			$this->data['forwarded_ip'] = $order_info['forwarded_ip'];
			$this->data['user_agent'] = $order_info['user_agent'];
			$this->data['accept_language'] = $order_info['accept_language'];
			$this->data['date_added'] = date($this->language->get('date_format_short'), strtotime($order_info['date_added']));
			$this->data['date_modified'] = date($this->language->get('date_format_short'), strtotime($order_info['date_modified']));
			$this->data['payment_firstname'] = $order_info['payment_firstname'];
			$this->data['payment_lastname'] = $order_info['payment_lastname'];
			$this->data['payment_company'] = $order_info['payment_company'];
			$this->data['payment_company_id'] = $order_info['payment_company_id'];
			$this->data['payment_tax_id'] = $order_info['payment_tax_id'];
			$this->data['payment_address_1'] = $order_info['payment_address_1'];
			$this->data['payment_address_2'] = $order_info['payment_address_2'];
			$this->data['payment_city'] = $order_info['payment_city'];
			$this->data['payment_postcode'] = $order_info['payment_postcode'];
			$this->data['payment_zone'] = $order_info['payment_zone'];
			$this->data['payment_zone_code'] = $order_info['payment_zone_code'];
			$this->data['payment_country'] = $order_info['payment_country'];
			$this->data['shipping_firstname'] = $order_info['shipping_firstname'];
			$this->data['shipping_lastname'] = $order_info['shipping_lastname'];
			$this->data['shipping_company'] = $order_info['shipping_company'];
			$this->data['shipping_address_1'] = $order_info['shipping_address_1'];
			$this->data['shipping_address_2'] = $order_info['shipping_address_2'];
			$this->data['shipping_city'] = $order_info['shipping_city'];
			$this->data['shipping_postcode'] = $order_info['shipping_postcode'];
			$this->data['shipping_zone'] = $order_info['shipping_zone'];
			$this->data['shipping_zone_code'] = $order_info['shipping_zone_code'];
			$this->data['shipping_country'] = $order_info['shipping_country'];

			$this->data['products'] = array();

			$products = $this->model_sale_order->getOrderProducts($this->request->get['order_id']);

			foreach ($products as $product) {
				$option_data = array();

				$options = $this->model_sale_order->getOrderOptions($this->request->get['order_id'], $product['order_product_id']);

				foreach ($options as $option) {
					if ($option['type'] != 'file') {
						$option_data[] = array(
							'name'  => $option['name'],
							'value' => $option['value'],
							'type'  => $option['type']
						);
					} else {
						$option_data[] = array(
							'name'  => $option['name'],
							'value' => utf8_substr($option['value'], 0, utf8_strrpos($option['value'], '.')),
							'type'  => $option['type'],
							'href'  => $this->url->link('sale/ordercollector/download', 'token=' . $this->session->data['token'] . '&order_id=' . $this->request->get['order_id'] . '&order_option_id=' . $option['order_option_id'], 'SSL')
						);
					}
				}

				$this->data['products'][] = array(
					'order_product_id' => $product['order_product_id'],
					'product_id'       => $product['product_id'],
					'name'    	 	   => $product['name'],
					'model'    		   => $product['model'],
					'option'   		   => $option_data,
					'quantity'		   => $product['quantity'],
					'price'    		   => $this->currency->format($product['price'] + ($this->config->get('config_tax') ? $product['tax'] : 0), $order_info['currency_code'], $order_info['currency_value']),
					'total'    		   => $this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value']),
					'href'     		   => $this->url->link('catalog/product/update', 'token=' . $this->session->data['token'] . '&product_id=' . $product['product_id'], 'SSL')
				);
			}

			$this->data['vouchers'] = array();

			$vouchers = $this->model_sale_order->getOrderVouchers($this->request->get['order_id']);

			foreach ($vouchers as $voucher) {
				$this->data['vouchers'][] = array(
					'description' => $voucher['description'],
					'amount'      => $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value']),
					'href'        => $this->url->link('sale/voucher/update', 'token=' . $this->session->data['token'] . '&voucher_id=' . $voucher['voucher_id'], 'SSL')
				);
			}

			$this->data['totals'] = $this->model_sale_order->getOrderTotals($this->request->get['order_id']);

			$this->data['downloads'] = array();

			foreach ($products as $product) {
				$results = $this->model_sale_order->getOrderDownloads($this->request->get['order_id'], $product['order_product_id']);

				foreach ($results as $result) {
					$this->data['downloads'][] = array(
						'name'      => $result['name'],
						'filename'  => $result['mask'],
						'remaining' => $result['remaining']
					);
				}
			}

			$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

			$this->data['order_status_id'] = $order_info['order_status_id'];

			// Fraud
			$this->load->model('sale/fraud');

			$fraud_info = $this->model_sale_fraud->getFraud($order_info['order_id']);

			if ($fraud_info) {
				$this->data['country_match'] = $fraud_info['country_match'];

				if ($fraud_info['country_code']) {
					$this->data['country_code'] = $fraud_info['country_code'];
				} else {
					$this->data['country_code'] = '';
				}

				$this->data['high_risk_country'] = $fraud_info['high_risk_country'];
				$this->data['distance'] = $fraud_info['distance'];

				if ($fraud_info['ip_region']) {
					$this->data['ip_region'] = $fraud_info['ip_region'];
				} else {
					$this->data['ip_region'] = '';
				}

				if ($fraud_info['ip_city']) {
					$this->data['ip_city'] = $fraud_info['ip_city'];
				} else {
					$this->data['ip_city'] = '';
				}

				$this->data['ip_latitude'] = $fraud_info['ip_latitude'];
				$this->data['ip_longitude'] = $fraud_info['ip_longitude'];

				if ($fraud_info['ip_isp']) {
					$this->data['ip_isp'] = $fraud_info['ip_isp'];
				} else {
					$this->data['ip_isp'] = '';
				}

				if ($fraud_info['ip_org']) {
					$this->data['ip_org'] = $fraud_info['ip_org'];
				} else {
					$this->data['ip_org'] = '';
				}

				$this->data['ip_asnum'] = $fraud_info['ip_asnum'];

				if ($fraud_info['ip_user_type']) {
					$this->data['ip_user_type'] = $fraud_info['ip_user_type'];
				} else {
					$this->data['ip_user_type'] = '';
				}

				if ($fraud_info['ip_country_confidence']) {
					$this->data['ip_country_confidence'] = $fraud_info['ip_country_confidence'];
				} else {
					$this->data['ip_country_confidence'] = '';
				}

				if ($fraud_info['ip_region_confidence']) {
					$this->data['ip_region_confidence'] = $fraud_info['ip_region_confidence'];
				} else {
					$this->data['ip_region_confidence'] = '';
				}

				if ($fraud_info['ip_city_confidence']) {
					$this->data['ip_city_confidence'] = $fraud_info['ip_city_confidence'];
				} else {
					$this->data['ip_city_confidence'] = '';
				}

				if ($fraud_info['ip_postal_confidence']) {
					$this->data['ip_postal_confidence'] = $fraud_info['ip_postal_confidence'];
				} else {
					$this->data['ip_postal_confidence'] = '';
				}

				if ($fraud_info['ip_postal_code']) {
					$this->data['ip_postal_code'] = $fraud_info['ip_postal_code'];
				} else {
					$this->data['ip_postal_code'] = '';
				}

				$this->data['ip_accuracy_radius'] = $fraud_info['ip_accuracy_radius'];

				if ($fraud_info['ip_net_speed_cell']) {
					$this->data['ip_net_speed_cell'] = $fraud_info['ip_net_speed_cell'];
				} else {
					$this->data['ip_net_speed_cell'] = '';
				}

				$this->data['ip_metro_code'] = $fraud_info['ip_metro_code'];
				$this->data['ip_area_code'] = $fraud_info['ip_area_code'];

				if ($fraud_info['ip_time_zone']) {
					$this->data['ip_time_zone'] = $fraud_info['ip_time_zone'];
				} else {
					$this->data['ip_time_zone'] = '';
				}

				if ($fraud_info['ip_region_name']) {
					$this->data['ip_region_name'] = $fraud_info['ip_region_name'];
				} else {
					$this->data['ip_region_name'] = '';
				}

				if ($fraud_info['ip_domain']) {
					$this->data['ip_domain'] = $fraud_info['ip_domain'];
				} else {
					$this->data['ip_domain'] = '';
				}

				if ($fraud_info['ip_country_name']) {
					$this->data['ip_country_name'] = $fraud_info['ip_country_name'];
				} else {
					$this->data['ip_country_name'] = '';
				}

				if ($fraud_info['ip_continent_code']) {
					$this->data['ip_continent_code'] = $fraud_info['ip_continent_code'];
				} else {
					$this->data['ip_continent_code'] = '';
				}

				if ($fraud_info['ip_corporate_proxy']) {
					$this->data['ip_corporate_proxy'] = $fraud_info['ip_corporate_proxy'];
				} else {
					$this->data['ip_corporate_proxy'] = '';
				}

				$this->data['anonymous_proxy'] = $fraud_info['anonymous_proxy'];
				$this->data['proxy_score'] = $fraud_info['proxy_score'];

				if ($fraud_info['is_trans_proxy']) {
					$this->data['is_trans_proxy'] = $fraud_info['is_trans_proxy'];
				} else {
					$this->data['is_trans_proxy'] = '';
				}

				$this->data['free_mail'] = $fraud_info['free_mail'];
				$this->data['carder_email'] = $fraud_info['carder_email'];

				if ($fraud_info['high_risk_username']) {
					$this->data['high_risk_username'] = $fraud_info['high_risk_username'];
				} else {
					$this->data['high_risk_username'] = '';
				}

				if ($fraud_info['high_risk_password']) {
					$this->data['high_risk_password'] = $fraud_info['high_risk_password'];
				} else {
					$this->data['high_risk_password'] = '';
				}

				$this->data['bin_match'] = $fraud_info['bin_match'];

				if ($fraud_info['bin_country']) {
					$this->data['bin_country'] = $fraud_info['bin_country'];
				} else {
					$this->data['bin_country'] = '';
				}

				$this->data['bin_name_match'] = $fraud_info['bin_name_match'];

				if ($fraud_info['bin_name']) {
					$this->data['bin_name'] = $fraud_info['bin_name'];
				} else {
					$this->data['bin_name'] = '';
				}

				$this->data['bin_phone_match'] = $fraud_info['bin_phone_match'];

				if ($fraud_info['bin_phone']) {
					$this->data['bin_phone'] = $fraud_info['bin_phone'];
				} else {
					$this->data['bin_phone'] = '';
				}

				if ($fraud_info['customer_phone_in_billing_location']) {
					$this->data['customer_phone_in_billing_location'] = $fraud_info['customer_phone_in_billing_location'];
				} else {
					$this->data['customer_phone_in_billing_location'] = '';
				}

				$this->data['ship_forward'] = $fraud_info['ship_forward'];

				if ($fraud_info['city_postal_match']) {
					$this->data['city_postal_match'] = $fraud_info['city_postal_match'];
				} else {
					$this->data['city_postal_match'] = '';
				}

				if ($fraud_info['ship_city_postal_match']) {
					$this->data['ship_city_postal_match'] = $fraud_info['ship_city_postal_match'];
				} else {
					$this->data['ship_city_postal_match'] = '';
				}

				$this->data['score'] = $fraud_info['score'];
				$this->data['explanation'] = $fraud_info['explanation'];
				$this->data['risk_score'] = $fraud_info['risk_score'];
				$this->data['queries_remaining'] = $fraud_info['queries_remaining'];
				$this->data['maxmind_id'] = $fraud_info['maxmind_id'];
				$this->data['error'] = $fraud_info['error'];
			} else {
				$this->data['maxmind_id'] = '';
			}

			if($this->hasAction('payment/' . $order_info['payment_code'] . '/orderAction') == true){
				$this->data['payment_action'] = $this->getChild('payment/' . $order_info['payment_code'] . '/orderAction');
			}else{
				$this->data['payment_action'] = '';
			}

			$this->template = 'sale/order_info.tpl';
			$this->children = array(
				'common/header',
				'common/footer'
			);

			$this->response->setOutput($this->render());
		} else {
			$this->language->load('error/not_found');

			$this->document->setTitle($this->language->get('heading_title'));

			$this->data['heading_title'] = $this->language->get('heading_title');

			$this->data['text_not_found'] = $this->language->get('text_not_found');

			$this->data['breadcrumbs'] = array();

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => false
			);

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('error/not_found', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
			);

			$this->template = 'error/not_found.tpl';
			$this->children = array(
				'common/header',
				'common/footer'
			);

			$this->response->setOutput($this->render());
		}
	}


	public function addReward() {
		$this->language->load('sale/order');

		$json = array();

		if (!$this->user->hasPermission('modify', 'sale/order')) {
			$json['error'] = $this->language->get('error_permission');
		} elseif (isset($this->request->get['order_id'])) {
			$this->load->model('sale/order');

			$order_info = $this->model_sale_order->getOrder($this->request->get['order_id']);

			if ($order_info && $order_info['customer_id']) {
				$this->load->model('sale/customer');

				$reward_total = $this->model_sale_customer->getTotalCustomerRewardsByOrderId($this->request->get['order_id']);

				if (!$reward_total) {
					$this->model_sale_customer->addReward($order_info['customer_id'], $this->language->get('text_order_id') . ' #' . $this->request->get['order_id'], $order_info['reward'], $this->request->get['order_id']);

					$json['success'] = $this->language->get('text_reward_added');
				} else {
					$json['error'] = $this->language->get('error_action');
				}
			} else {
				$json['error'] = $this->language->get('error_action');
			}
		}

		$this->response->setOutput(json_encode($json));
	}

	public function removeReward() {
		$this->language->load('sale/order');

		$json = array();

		if (!$this->user->hasPermission('modify', 'sale/order')) {
			$json['error'] = $this->language->get('error_permission');
		} elseif (isset($this->request->get['order_id'])) {
			$this->load->model('sale/order');

			$order_info = $this->model_sale_order->getOrder($this->request->get['order_id']);

			if ($order_info && $order_info['customer_id']) {
				$this->load->model('sale/customer');

				$this->model_sale_customer->deleteReward($this->request->get['order_id']);

				$json['success'] = $this->language->get('text_reward_removed');
			} else {
				$json['error'] = $this->language->get('error_action');
			}
		}

		$this->response->setOutput(json_encode($json));
	}

	public function addCommission() {
		$this->language->load('sale/order');

		$json = array();

		if (!$this->user->hasPermission('modify', 'sale/order')) {
			$json['error'] = $this->language->get('error_permission');
		} elseif (isset($this->request->get['order_id'])) {
			$this->load->model('sale/order');

			$order_info = $this->model_sale_order->getOrder($this->request->get['order_id']);

			if ($order_info && $order_info['affiliate_id']) {
				$this->load->model('sale/affiliate');

				$affiliate_total = $this->model_sale_affiliate->getTotalTransactionsByOrderId($this->request->get['order_id']);

				if (!$affiliate_total) {
					$this->model_sale_affiliate->addTransaction($order_info['affiliate_id'], $this->language->get('text_order_id') . ' #' . $this->request->get['order_id'], $order_info['commission'], $this->request->get['order_id']);

					$json['success'] = $this->language->get('text_commission_added');
				} else {
					$json['error'] = $this->language->get('error_action');
				}
			} else {
				$json['error'] = $this->language->get('error_action');
			}
		}

		$this->response->setOutput(json_encode($json));
	}

	public function removeCommission() {
		$this->language->load('sale/order');

		$json = array();

		if (!$this->user->hasPermission('modify', 'sale/order')) {
			$json['error'] = $this->language->get('error_permission');
		} elseif (isset($this->request->get['order_id'])) {
			$this->load->model('sale/order');

			$order_info = $this->model_sale_order->getOrder($this->request->get['order_id']);

			if ($order_info && $order_info['affiliate_id']) {
				$this->load->model('sale/affiliate');

				$this->model_sale_affiliate->deleteTransaction($this->request->get['order_id']);

				$json['success'] = $this->language->get('text_commission_removed');
			} else {
				$json['error'] = $this->language->get('error_action');
			}
		}

		$this->response->setOutput(json_encode($json));
	}

	public function history() {
		$this->language->load('sale/order');

		$this->data['error'] = '';
		$this->data['success'] = '';

		$this->load->model('sale/order');

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if (!$this->user->hasPermission('modify', 'sale/order')) {
				$this->data['error'] = $this->language->get('error_permission');
			}

			if (!$this->data['error']) {
				$this->model_sale_order->addOrderHistory($this->request->get['order_id'], $this->request->post);

				$this->data['success'] = $this->language->get('text_success');
			}
		}

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_date_added'] = $this->language->get('column_date_added');
		$this->data['column_status'] = $this->language->get('column_status');
		$this->data['column_notify'] = $this->language->get('column_notify');
		$this->data['column_comment'] = $this->language->get('column_comment');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$this->data['histories'] = array();

		$results = $this->model_sale_order->getOrderHistories($this->request->get['order_id'], ($page - 1) * 10, 10);

		foreach ($results as $result) {
			$this->data['histories'][] = array(
				'notify'     => $result['notify'] ? $this->language->get('text_yes') : $this->language->get('text_no'),
				'status'     => $result['status'],
				'comment'    => nl2br($result['comment']),
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$history_total = $this->model_sale_order->getTotalOrderHistories($this->request->get['order_id']);

		$pagination = new Pagination();
		$pagination->total = $history_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('sale/ordercollector/history', 'token=' . $this->session->data['token'] . '&order_id=' . $this->request->get['order_id'] . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->template = 'sale/order_history.tpl';

		$this->response->setOutput($this->render());
	}

	public function download() {
		$this->load->model('sale/order');

		if (isset($this->request->get['order_option_id'])) {
			$order_option_id = $this->request->get['order_option_id'];
		} else {
			$order_option_id = 0;
		}

		$option_info = $this->model_sale_order->getOrderOption($this->request->get['order_id'], $order_option_id);

		if ($option_info && $option_info['type'] == 'file') {
			$file = DIR_DOWNLOAD . $option_info['value'];
			$mask = basename(utf8_substr($option_info['value'], 0, utf8_strrpos($option_info['value'], '.')));

			if (!headers_sent()) {
				if (file_exists($file)) {
					header('Content-Type: application/octet-stream');
					header('Content-Description: File Transfer');
					header('Content-Disposition: attachment; filename="' . ($mask ? $mask : basename($file)) . '"');
					header('Content-Transfer-Encoding: binary');
					header('Expires: 0');
					header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
					header('Pragma: public');
					header('Content-Length: ' . filesize($file));

					readfile($file, 'rb');
					exit;
				} else {
					exit('Error: Could not find file ' . $file . '!');
				}
			} else {
				exit('Error: Headers already sent out!');
			}
		} else {
			$this->language->load('error/not_found');

			$this->document->setTitle($this->language->get('heading_title'));

			$this->data['heading_title'] = $this->language->get('heading_title');

			$this->data['text_not_found'] = $this->language->get('text_not_found');

			$this->data['breadcrumbs'] = array();

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => false
			);

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('error/not_found', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
			);

			$this->template = 'error/not_found.tpl';
			$this->children = array(
				'common/header',
				'common/footer'
			);

			$this->response->setOutput($this->render());
		}
	}

//	FILE upload
	public function upload() {
		$this->language->load('sale/order');
		$json = array();
		if ($this->request->server['REQUEST_METHOD'] == 'POST' and isset($this->request->get['id_uf'])) {
			if (!empty($this->request->files['file']['name'])) {
				$filename = html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8');
				if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 128)) {
					$json['error'] = $this->language->get('error_filename');
				}
				// Allowed file extension types
				$allowed = array();
				$filetypes = explode("\n", $this->config->get('config_file_extension_allowed'));
				foreach ($filetypes as $filetype) {
					$allowed[] = trim($filetype);
				}
				if (!in_array(substr(strrchr($filename, '.'), 1), $allowed)) {
					$json['error'] = $this->language->get('error_filetype');
				}
				$ex = array_search(substr(strrchr($filename, '.'), 1), $allowed);
				if($ex !== false){
					$ex = $allowed[$ex];
				}
				// Allowed file mime types
				$allowed = array();
				$filetypes = explode("\n", $this->config->get('config_file_mime_allowed'));
				foreach ($filetypes as $filetype) {
					$allowed[] = trim($filetype);
				}
				if (!in_array($this->request->files['file']['type'], $allowed)) {
					$json['error'] = $this->language->get('error_filetype');
				}
				// Check to see if any PHP files are trying to be uploaded
				$content = file_get_contents($this->request->files['file']['tmp_name']);
				if (preg_match('/\<\?php/i', $content)) {
					$json['error'] = $this->language->get('error_filetype');
				}
				if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
					$json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
				}
			} else {
				$json['error'] = $this->language->get('error_upload');
			}
			if (!isset($json['error'])) {
				if (is_uploaded_file($this->request->files['file']['tmp_name']) && file_exists($this->request->files['file']['tmp_name']) && $ex !== false) {
					$salt = md5(mt_rand());
					$file = $salt . '.' . $ex;
					$json['file'] = $file;
					move_uploaded_file($this->request->files['file']['tmp_name'], DIR_IMAGE . 'upload/' . $file);
					$this->load->model('tool/image');
					$json['resize_file'] = $this->model_tool_image->resize('upload/' . $file, 300, 300);
				}
				$json['success'] = $this->language->get('text_upload');
				$json['id_uf'] = (int)$this->request->get['id_uf'];
			}
		}

		$this->response->setOutput(json_encode($json));
	}

}
?>