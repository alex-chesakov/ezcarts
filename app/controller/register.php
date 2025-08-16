<?php 
class ControllerRegister extends Controller {
	private $error = array();
/*
lastname

*/
	public function index() {
if ($this->customer->isLogged()) {$this->redirect($this->url->link('account', '', 'SSL'));}
$this->language->load('account/register');

$this->document->setTitle($this->language->get('heading_title'));
//		$this->document->addScript('view/javascript/jquery/colorbox/jquery.colorbox-min.js');
//		$this->document->addStyle('view/javascript/jquery/colorbox/colorbox.css');

		$this->load->model('account/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_account_customer->addCustomer($this->request->post);

			$this->customer->login($this->request->post['email'], $this->request->post['password']);

			unset($this->session->data['guest']);

			$this->redirect($this->url->link('profile'));
		}
$this->data['heading_title'] = $this->language->get('heading_title');
$this->data['name'] = $this->config->get('config_name');
$this->data['text_yes'] = $this->language->get('text_yes');
$this->data['text_no'] = $this->language->get('text_no');
$this->data['text_select'] = $this->language->get('text_select');
$this->data['text_none'] = $this->language->get('text_none');
$this->data['entry_firstname'] = $this->language->get('entry_firstname');
		$this->data['entry_email'] = $this->language->get('entry_email');
$this->data['entry_telephone'] = $this->language->get('entry_telephone');
$this->data['entry_password'] = $this->language->get('entry_password');

		$this->data['button_continue'] = $this->language->get('button_continue');

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

		if (isset($this->error['password'])) {
			$this->data['error_password'] = $this->error['password'];
		} else {
			$this->data['error_password'] = '';
		}

		$this->data['action'] = $this->url->link('register', '', 'SSL');

if (isset($this->request->post['firstname'])) {$this->data['firstname'] = $this->request->post['firstname'];} else {$this->data['firstname'] = '';}

		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} else {
			$this->data['email'] = '';
		}

if (isset($this->request->post['telephone'])) {$this->data['telephone'] = $this->request->post['telephone'];} else {$this->data['telephone'] = '';}

		if (isset($this->request->post['password'])) {
			$this->data['password'] = $this->request->post['password'];
		} else {
			$this->data['password'] = '';
		}

		if ($this->config->get('config_account_id')) {
			$this->load->model('catalog/information');

			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

			if ($information_info) {
				$this->data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information', 'information_id=' . $this->config->get('config_account_id'), 'SSL'), $information_info['title'], $information_info['title']);
			} else {
				$this->data['text_agree'] = '';
			}
		} else {$this->data['text_agree'] = '';}

		if (isset($this->request->post['agree'])) {
			$this->data['agree'] = $this->request->post['agree'];
		} else {
			$this->data['agree'] = false;
		}

		$this->template = 'default/template/register.tpl';
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'footer'
		);
$settings = array();
$settings['type_header'] = 0;
$settings['class_body'] = 'min-h-screen bg-gray-50 flex flex-col';
		
$this->data['header'] = $this->getChild('header',$settings);
$this->response->setOutput($this->render());	
	}

	protected function validate() {
		if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen($this->request->post['firstname']) > 32)) {
			$this->error['firstname'] = $this->language->get('error_firstname');
		}

		if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if ($this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
			$this->error['warning'] = $this->language->get('error_exists');}

		if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {$this->error['telephone'] = $this->language->get('error_telephone');}


		if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
			$this->error['password'] = $this->language->get('error_password');
		}

		if ($this->config->get('config_account_id')) {
			$this->load->model('catalog/information');

			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

			if ($information_info && !isset($this->request->post['agree'])) {
				$this->error['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
			}
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	
}
?>