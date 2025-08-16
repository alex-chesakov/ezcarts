<?php
class ControllerOrderConfirmation extends Controller {
	public function index() {
		
		$this->data['go_shop'] = $this->url->link('shop', '', 'SSL');
		
		if (!$this->customer->isLogged() or empty($this->session->data['order_id'])) {
			$this->session->data['redirect'] = $this->url->link('shop', '', 'SSL');
			$this->redirect($this->url->link('shop', '', 'SSL'));
		}
		$sql = "SELECT * FROM " . DB_PREFIX . "order WHERE order_id = '" . (int)$this->session->data['order_id'] . "'";
		$query_order = $this->db->query($sql);
		if(!$query_order->num_rows){
			$this->redirect($this->url->link('shop', '', 'SSL'));
		}
		$this->data['total'] = number_format($query_order->row['total'],2, '.', ',');
		$this->data['date_shipping'] = date("F d, Y",strtotime($query_order->row['date_shipping']));
		$time_shipping = array(
			'9-12'=>'9:00 AM - 12:00 PM',
			'12-15'=>'12:00 AM - 3:00 PM',
			'15-18'=>'3:00 AM - 6:00 PM'
		);
		$this->data['time_shipping'] = $time_shipping[$query_order->row['time_shipping']];
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cart WHERE customer_id = '" . (int)$this->customer->getId() . "' ");
		if($query->num_rows){
			$this->db->query("DELETE FROM " . DB_PREFIX . "cart WHERE cart_id = '" . (int)$query->row['cart_id'] . "'");
			$this->db->query("DELETE FROM " . DB_PREFIX . "cart_products WHERE cart_id = '" . (int)$query->row['cart_id'] . "'");
			
		}
		unset($this->session->data['order_id']);
		
		$this->template = 'default/template/order-confirmation.tpl';
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
}