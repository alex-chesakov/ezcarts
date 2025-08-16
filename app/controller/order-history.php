<?php 
class ControllerOrderHistory extends Controller { 
	public function index() {
		
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('login', '', 'SSL');
			$this->redirect($this->url->link('login', '', 'SSL'));
		}
		$this->data['go_shop'] = $this->url->link('login', '', 'SSL');
		
		$this->data['orders'] = array();
		
		$sql = "SELECT * FROM " . DB_PREFIX . "order WHERE customer_id = '" . (int)$this->customer->getId() . "'";
		if(isset($this->request->get['order_status_id']) and (int)$this->request->get['order_status_id'] >= 0){
			$sql.= " AND order_status_id = '" . (int)$this->request->get['order_status_id'] . "'";
		}
		$sql.= " ORDER BY order_id DESC";
		$query_order = $this->db->query($sql);
		if($query_order->num_rows){
			$time_shipping = array(
				'9-12'=>'9:00 AM - 12:00 PM',
				'12-15'=>'12:00 AM - 3:00 PM',
				'15-18'=>'3:00 AM - 6:00 PM'
			);
			foreach($query_order->rows as $row){

				$query_kitchen = $this->db->query("SELECT * FROM " . DB_PREFIX . "my_kitchen WHERE kitchen_id = '" . (int)$row['kitchen_checkout'] . "' AND customer_id = '" . (int)$this->customer->getId() . "'");
				if($query_kitchen->num_rows){
					$kitchen_checkout = $query_kitchen->row['name'] . (!empty($query_kitchen->row['address'])?', ' . $query_kitchen->row['address'] : '');
				}else{
					$kitchen_checkout = '';
				}
				$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$row['order_id'] . "'";
				$query_products = $this->db->query($sql);
				$sql = "SELECT name FROM " . DB_PREFIX . "order_status WHERE order_status_id = '" . (int)$row['order_status_id'] . "'";
				$query_status = $this->db->query($sql);
				
				$this->data['orders'][$row['order_id']] = array(
					'date_shipping' => date("F d, Y",strtotime($row['date_shipping'])),
					'time_shipping' => empty($time_shipping[$row['time_shipping']])?($row['time_shipping']):($time_shipping[$row['time_shipping']]),
					'kitchen_checkout' => $kitchen_checkout,
					'status' => $query_status->row['name'],
					'order_status_id' => (int)$row['order_status_id'],
					'count_products' => $query_products->row['total'],
					'href' => $this->url->link("order", "ord=" . $row['order_id']) 
				);
			}
		}
		$this->data['order_status'] = array();
		$sql = "SELECT * FROM " . DB_PREFIX . "order_status";
		$query_status = $this->db->query($sql);
		if($query_status->num_rows){
			foreach($query_status->rows as $rows){
				$this->data['order_status'][$rows['order_status_id']] = array(
					'order_status_id' => $rows['order_status_id'],
					'name' => $rows['name']
				);
			}
		}
		
		$this->data['order_status_id_selected'] = '';
		if(isset($this->request->post['order_status_id'])){
			$this->data['order_status_id_selected'] = $this->request->post['order_status_id'];
		}
		
		$this->template = 'default/template/order-history.tpl';
		$this->children = array('common/column_left','common/column_right','common/content_top','common/content_bottom','footer'		);
		$settings = array();
		$settings['type_header'] = 2;
		$settings['class_body'] = 'min-h-screen bg-gray-50 flex flex-col';
				
		$this->data['header'] = $this->getChild('header',$settings);
		$this->response->setOutput($this->render());
	}
}