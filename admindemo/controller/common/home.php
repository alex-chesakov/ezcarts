<?php   
class ControllerCommonHome extends Controller {   
	public function index() {
$this->language->load('common/home');

$user_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE user_id = '" . (int)$this->user->getId() . "' AND status = '1'");
if($user_query->num_rows and (int)$user_query->row['user_group_id'] > 1){
	$this->data['panel'] =1;
}else{
	$this->data['panel'] = 0;
}

$this->document->setTitle($this->language->get('heading_title'));

$this->data['heading_title'] = $this->language->get('heading_title');

$this->data['period'] = '';
$this->data['orders_location'] = array();
$query_product_location = $this->db->query("SELECT location FROM " . DB_PREFIX . "product GROUP BY location");//	получаем локации в товарах
if($query_product_location->num_rows){
	foreach($query_product_location->rows as $row){
		$this->data['orders_location'][$row['location']] = 0;
	}
}
$sql = "SELECT location, COUNT(product_id) AS q FROM " . DB_PREFIX . "order_product op ";
if(!empty($this->request->get['period']) and in_array($this->request->get['period'], array('day','week','month','year'))){
	$sql.= "LEFT JOIN " . DB_PREFIX . "order o ON (o.order_id = op.order_id) ";
	$sql.= "WHERE o.date_added >= NOW() - INTERVAL 1 " . $this->db->escape(utf8_strtoupper($this->request->get['period'])) . " AND o.date_added <= NOW() ";
	$this->data['period'] = $this->request->get['period'];
}else{
	if(!empty($this->data['panel'])){//	no admin
		$sql.= "LEFT JOIN " . DB_PREFIX . "order o ON (o.order_id = op.order_id) WHERE 1=1 ";
	}
}
if(!empty($this->data['panel'])){//	no admin
	$sql.= "AND o.user_id = '" . (int)$this->user->getId(). "' ";
}
$sql.= "GROUP BY op.location";
$query = $this->db->query($sql);//	получаем локации в товарах
if($query->num_rows){
	foreach($query->rows as $row){
		$this->data['orders_location'][$row['location']] = $row['q'];
	}
}
//	Order Processing Time
$this->data['period'] = '';
$this->data['p_orders1'] = 0;
$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "order o ";
if(!empty($this->request->get['period']) and in_array($this->request->get['period'], array('day','week','month','year'))){
	$sql.= "WHERE o.date_added >= NOW() - INTERVAL 1 " . $this->db->escape(utf8_strtoupper($this->request->get['period'])) . " AND o.date_added <= NOW() ";
	$this->data['period'] = $this->request->get['period'];
}else{
	$sql.= "WHERE 1=1 ";
}
if(!empty($this->data['panel'])){//	no admin
	$sql.= "AND o.user_id = '" . (int)$this->user->getId(). "' ";
}
$sql.= "AND o.order_status_id IN (0,1,2) ";
$query = $this->db->query($sql);//	получаем локации в товарах
if($query->num_rows){
	$this->data['p_orders1'] = $query->row['total'];
}
//	complete orders
$this->data['period2'] = '';
$this->data['p_orders2'] = 0;
$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "order o ";
if(!empty($this->request->get['period2']) and in_array($this->request->get['period2'], array('day','week','month','year'))){
	$sql.= "WHERE o.date_added >= NOW() - INTERVAL 1 " . $this->db->escape(utf8_strtoupper($this->request->get['period2'])) . " AND o.date_added <= NOW() ";
	$this->data['period2'] = $this->request->get['period2'];
}else{
	$sql.= "WHERE 1=1 ";
}
if(!empty($this->data['panel'])){//	no admin
	$sql.= "AND o.user_id = '" . (int)$this->user->getId(). "' ";
}
$sql.= "AND o.order_status_id NOT IN (0,1,2) ";
$query = $this->db->query($sql);//	получаем локации в товарах
if($query->num_rows){
	$this->data['p_orders2'] = $query->row['total'];
}

$this->data['text_overview'] = $this->language->get('text_overview');
		$this->data['text_total_sale'] = $this->language->get('text_total_sale');
		$this->data['text_day'] = $this->language->get('text_day');
		$this->data['text_week'] = $this->language->get('text_week');
		$this->data['text_month'] = $this->language->get('text_month');
		$this->data['text_year'] = $this->language->get('text_year');
		$this->data['text_no_results'] = $this->language->get('text_no_results');

		// Check image directory is writable
		$file = DIR_IMAGE . 'test';
		$handle = fopen($file, 'a+'); 
		fwrite($handle, '');
		fclose($handle); 		
		if (!file_exists($file)) {
			$this->data['error_image'] = sprintf($this->language->get('error_image'), DIR_IMAGE);
		} else {
			$this->data['error_image'] = '';
			unlink($file);
		}

		// Check image cache directory is writable
		$file = DIR_IMAGE . 'cache/test';
		$handle = fopen($file, 'a+'); 
		fwrite($handle, '');
		fclose($handle); 		
		if (!file_exists($file)) {
			$this->data['error_image_cache'] = sprintf($this->language->get('error_image_cache'), DIR_IMAGE . 'cache/');
		} else {
			$this->data['error_image_cache'] = '';
			unlink($file);
		}
		// Check cache directory is writable
		$file = DIR_CACHE . 'test';
		$handle = fopen($file, 'a+'); 
		fwrite($handle, '');
		fclose($handle); 		
		if (!file_exists($file)) {
			$this->data['error_cache'] = sprintf($this->language->get('error_image_cache'), DIR_CACHE);
		} else {
			$this->data['error_cache'] = '';
			unlink($file);
		}

		// Check logs directory is writable
		$file = DIR_LOGS . 'test';
		$handle = fopen($file, 'a+'); 
		fwrite($handle, '');
		fclose($handle); 		
		if (!file_exists($file)) {
			$this->data['error_logs'] = sprintf($this->language->get('error_logs'), DIR_LOGS);
		} else {
			$this->data['error_logs'] = '';
			unlink($file);
		}

		$this->data['token'] = $this->session->data['token'];

		$this->template = 'common/home.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	public function login() {
		$route = '';

		if (isset($this->request->get['route'])) {
			$part = explode('/', $this->request->get['route']);

			if (isset($part[0])) {
				$route .= $part[0];
			}

			if (isset($part[1])) {
				$route .= '/' . $part[1];
			}
		}

		$ignore = array(
			'common/login',
			'common/forgotten',
			'common/reset'
		);	

		if (!$this->user->isLogged() && !in_array($route, $ignore)) {
			return $this->forward('common/login');
		}

		if (isset($this->request->get['route'])) {
			$ignore = array(
				'common/login',
				'common/logout',
				'common/forgotten',
				'common/reset',
				'error/not_found',
				'error/permission'
			);

			$config_ignore = array();

			if ($this->config->get('config_token_ignore')) {
				$config_ignore = unserialize($this->config->get('config_token_ignore'));
			}

			$ignore = array_merge($ignore, $config_ignore);

			if (!in_array($route, $ignore) && (!isset($this->request->get['token']) || !isset($this->session->data['token']) || ($this->request->get['token'] != $this->session->data['token']))) {
				return $this->forward('common/login');
			}
		} else {
			if (!isset($this->request->get['token']) || !isset($this->session->data['token']) || ($this->request->get['token'] != $this->session->data['token'])) {
				return $this->forward('common/login');
			}
		}
	}

	public function permission() {
		if (isset($this->request->get['route'])) {
			$route = '';

			$part = explode('/', $this->request->get['route']);

			if (isset($part[0])) {
				$route .= $part[0];
			}

			if (isset($part[1])) {
				$route .= '/' . $part[1];
			}

			$ignore = array(
				'common/home',
				'common/login',
				'common/logout',
				'common/forgotten',
				'common/reset',
				'error/not_found',
				'error/permission'		
			);			

			if (!in_array($route, $ignore) && !$this->user->hasPermission('access', $route)) {
				return $this->forward('error/permission');
			}
		}
	}	
}
