<?php   
class ControllerHeader extends Controller {
	protected function index($settings = array()) {
		$this->data['class_body'] = '';

		if(!empty($this->customer->getLocation())){	//	utf8_strtolower($this->customer->getLocation())
			$location = trim($this->customer->getLocation());
			$this->session->data['location'] = $location;
		}elseif(!empty($this->session->data['location'])){
			$location = trim($this->session->data['location']);
		}else{
			$location = false;
		}
		
		$this->data['title'] = $this->document->getTitle();
		
		$this->data['total_cart'] = 0;

$this->document->addStyle('/view/javascript/swiper/css/swiper.min.css');
$this->document->addStyle('/view/javascript/swiper/css/customcart.css');
$this->document->addScript('/view/javascript/swiper/js/swiper.jquery.min.js');
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

if(!empty($settings) and !empty($settings['class_body'])){
	$this->data['class_body'] = $settings['class_body'];
}
if(!empty($settings) and !empty($settings['type_header'])){
	$this->data['type_header'] = (int)$settings['type_header'];
}else{
	$this->data['type_header'] = 0;
}
$this->data['name'] = $this->config->get('config_name');
$this->data['login'] = $this->url->link('login', '', 'SSL');
if (isset($this->session->data['error']) && !empty($this->session->data['error'])) {$this->data['error'] = $this->session->data['error'];unset($this->session->data['error']);} else {$this->data['error'] = '';}
$this->data['base'] = $server;
$this->data['description'] = $this->document->getDescription();
$this->data['keywords'] = $this->document->getKeywords();
$this->data['links'] = $this->document->getLinks();	 
$this->data['styles'] = $this->document->getStyles();
$this->data['scripts'] = $this->document->getScripts();
$this->data['lang'] = $this->language->get('code');
$this->data['direction'] = $this->language->get('direction');
$this->data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
if ($this->config->get('config_icon') && file_exists(DIR_IMAGE . $this->config->get('config_icon'))) {$this->data['icon'] = $server . 'image/' . $this->config->get('config_icon');} else {$this->data['icon'] = '';}
if ($this->config->get('config_logo') && file_exists(DIR_IMAGE . $this->config->get('config_logo'))) {$this->data['logo'] = $server . 'image/' . $this->config->get('config_logo');} else {$this->data['logo'] = '';}		

		$this->language->load('common/header');

$this->data['button_back'] = $this->language->get('button_back');
$this->data['text_signin'] = $this->language->get('text_signin');

		$this->data['text_home'] = $this->language->get('text_home');
		$this->data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		$this->data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$this->data['text_search'] = $this->language->get('text_search');

		$this->data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));
		$this->data['text_account'] = $this->language->get('text_account');
		$this->data['text_checkout'] = $this->language->get('text_checkout');

		$this->data['home'] = $this->url->link('home');
		$this->data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$this->data['shopping_cart'] = $this->url->link('checkout/cart');
		$this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');

		$this->data['logged'] = $this->customer->isLogged();//	если загеран
		$this->data['profile'] = $this->url->link('profile', '', 'SSL');//	линк до профиля


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

			$sql = "SELECT SUM(cp.quantity) as tquantity FROM " . DB_PREFIX . "cart_products cp ";
			$sql.= "LEFT JOIN " . DB_PREFIX . "cart c ON (c.cart_id = cp.cart_id) ";
			$sql.= "WHERE c.customer_id = '" . (int)$this->customer->getId() . "' ";
			if(!empty($location)){
				$sql.= "AND cp.location LIKE '" . $this->db->escape($location) . "' ";
			}
			$query = $this->db->query($sql);
			if($query->num_rows){
				$this->data['total_cart'] = $query->row['tquantity'];
			}else{
				$this->data['total_cart'] = 0;
			}
		}
		$this->data['link_kitchen'] = $this->url->link('mykitchen');
		// Daniel's robot detector
		$status = true;

		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", trim($this->config->get('config_robots')));
			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;
					break;
				}
			}
		}

		// A dirty hack to try to set a cookie for the multi-store feature
		$this->load->model('setting/store');

		$this->data['stores'] = array();

		if ($this->config->get('config_shared') && $status) {
			$this->data['stores'][] = $server . 'catalog/view/javascript/crossdomain.php?session_id=' . $this->session->getId();

			$stores = $this->model_setting_store->getStores();

			foreach ($stores as $store) {
				$this->data['stores'][] = $store['url'] . 'catalog/view/javascript/crossdomain.php?session_id=' . $this->session->getId();
			}
		}

		// Search		
		if (isset($this->request->get['search'])) {
			$this->data['search'] = $this->request->get['search'];
		} else {
			$this->data['search'] = '';
		}

		$this->children = array('module/setlocation',
			'module/cart'
		);
		$this->template = 'default/template/header.tpl';
		$this->render();
	} 	
}
?>
