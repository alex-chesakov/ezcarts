<?php 
class ControllerOrder extends Controller { 
	public function index() {
		
		
$this->template = 'default/template/order.tpl';
$this->children = array('common/column_left','common/column_right','common/content_top','common/content_bottom','common/footer'		);
$settings = array();
$settings['type_header'] = 2;
$settings['class_body'] = 'min-h-screen bg-gray-50 flex flex-col';
		
$this->data['header'] = $this->getChild('header',$settings);
$this->response->setOutput($this->render());
	}
	public function add(){
		$json = array();
		
		if($this->customer->isLogged() and !empty($this->request->post['product_id'])){
//	ищем корзину пользователя
			$query = $this->db->query("SELECT cart_id FROM " . DB_PREFIX . "cart WHERE customer_id = '" . (int)$this->customer->getId() . "'");
			if($query->num_rows){
				$cart_id = $query->row['cart_id'];//	указываем id
			}else{
				$this->db->query("INSERT INTO " . DB_PREFIX . "cart SET customer_id = '" . (int)$this->customer->getId() . "'");//	создаем корзину пользователя
				$cart_id = $this->db->getLastId();//	извлекаем id
			}
			
//	ищем товар по id и типу
			$sql = "SELECT * FROM " . DB_PREFIX . "cart_products WHERE cart_id = '" . (int)$cart_id . "' ";
			$sql.= "AND product_id = '" . (int)$this->request->post['product_id'] . "' ";
			if(!empty($this->request->post['type'])){
				//	фильтруем type
				if($this->request->post['type']=='case'){
					$this->request->post['type'] = 'case';
				}else{
					$this->request->post['type'] = 'unit';
				}
				$sql.= "AND type = '" . $this->db->escape($this->request->post['type']) . "'";
			}
			$query = $this->db->query($sql);
			
			//	если товар есть
			if($query->num_rows){
				$quantity = $query->row['quantity'];//	получаем количество в корзине
				if(!empty($this->request->post['quantity'])){//	если указано количество в запросе
					$quantity = $quantity + (int)$this->request->post['quantity'];
					$json['quantity'] = (int)$this->request->post['quantity'];
					
				}else{//	если нет то = +1
					$quantity++;
					$json['quantity'] = 1;
				}
//	обновляем данные товара в корзине по количетсву
				$sql = "UPDATE `" . DB_PREFIX . "cart_products` SET `quantity` = '" . (int)$quantity . "' WHERE cart_id = '" . (int)$cart_id . "' ";
				$sql.= "AND product_id = '" . (int)$this->request->post['product_id'] . "' ";
				if(!empty($this->request->post['type'])){
					//	фильтруем type
					if($this->request->post['type']=='case'){
						$this->request->post['type'] = 'case';
					}else{
						$this->request->post['type'] = 'unit';
					}
					$sql.= "AND type = '" . $this->db->escape($this->request->post['type']) . "'";
				}
				$this->db->query($sql);
				
			}else{
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
				if(!empty($this->request->post['quantity'])){
					$sql.= ", quantity = '" . (int)$this->request->post['quantity'] . "'";
					$json['quantity'] = (int)$this->request->post['quantity'];
				}else{
					$json['quantity'] = 1;
				}
				$this->db->query($sql);
			}
			//	получаем общее количество товаров
			$sql = "SELECT SUM(quantity) as tquantity FROM " . DB_PREFIX . "cart_products WHERE cart_id = '" . (int)$cart_id . "' ";
			$query = $this->db->query($sql);
			if($query->num_rows){
				$json['total_quantity'] = $query->row['tquantity'];
			}else{
				$json['total_quantity'] = 0;
			}
			
			$json['success'] = true;
		}
		
		$this->response->setOutput(json_encode($json));
	}
}
