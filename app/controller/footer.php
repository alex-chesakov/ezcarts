<?php  
class ControllerFooter extends Controller {
	protected function index() {
		$this->language->load('common/footer');
$this->load->model('catalog/information');

$this->data['name'] = $this->config->get('config_name');

$this->data['go_profile'] = $this->url->link('profile', '', 'SSL');	
$this->data['go_mykitchen'] = $this->url->link('mykitchen', '', 'SSL');	
$this->data['go_orderhistory'] = $this->url->link('order-history', '', 'SSL');	
$this->data['go_shoppinglist'] = $this->url->link('shopping-list', '', 'SSL');	
$this->data['go_logout'] = $this->url->link('logout', '', 'SSL');	

$this->data['info5'] = $this->url->link('information','information_id=5');
$this->data['info3'] = $this->url->link('information','information_id=3');
$this->data['contact'] = $this->url->link('contact');

		$this->data['text_information'] = $this->language->get('text_information');
		$this->data['text_service'] = $this->language->get('text_service');
		$this->data['text_extra'] = $this->language->get('text_extra');
		$this->data['text_contact'] = $this->language->get('text_contact');
		$this->data['text_return'] = $this->language->get('text_return');
		$this->data['text_sitemap'] = $this->language->get('text_sitemap');
		$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$this->data['text_voucher'] = $this->language->get('text_voucher');
		$this->data['text_affiliate'] = $this->language->get('text_affiliate');
		$this->data['text_special'] = $this->language->get('text_special');
		$this->data['text_account'] = $this->language->get('text_account');
		$this->data['text_order'] = $this->language->get('text_order');
		$this->data['text_wishlist'] = $this->language->get('text_wishlist');
		$this->data['text_newsletter'] = $this->language->get('text_newsletter');

		

		


		
		$this->data['return'] = $this->url->link('account/return/insert', '', 'SSL');
		$this->data['sitemap'] = $this->url->link('information/sitemap');
		$this->data['manufacturer'] = $this->url->link('product/manufacturer');
		$this->data['voucher'] = $this->url->link('account/voucher', '', 'SSL');
		$this->data['affiliate'] = $this->url->link('affiliate/account', '', 'SSL');
		$this->data['special'] = $this->url->link('product/special');
		$this->data['account'] = $this->url->link('profile', '', 'SSL');
		$this->data['order'] = $this->url->link('account/order', '', 'SSL');
		$this->data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$this->data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');		


		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];	
			} else {
				$ip = ''; 
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];	
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];	
			} else {
				$referer = '';
			}

			$this->model_tool_online->whosonline($ip, $this->customer->getId(), $url, $referer);
		}

//	if not kitchen or reset location after change kitchen = reset approved
if($this->customer->isLogged() and empty($this->customer->getApprovedLocation())){
	$this->data['approved_location'] = $this->customer->getApprovedLocation();
	//	get kitchen id
	$sql = "SELECT mk.name AS name_e, mk.address AS address_s FROM " . DB_PREFIX . "customer c ";
	$sql.= "LEFT JOIN " . DB_PREFIX . "my_kitchen mk ON (mk.kitchen_id = c.kitchen_id) ";
	$sql.= "WHERE c.customer_id = '" . (int)$this->customer->getId() . "' AND c.kitchen_id = mk.kitchen_id";
	$query = $this->db->query($sql);
	if($query->num_rows){
		$this->data['address_s'] = $query->row['address_s'];
		$this->data['name_e'] = $query->row['name_e'];
	}
}
		
		$this->template = 'default/template/common/footer.tpl';
		$this->children = array(
			'module/cart'
		);
		
		$this->render();
	}
}
?>