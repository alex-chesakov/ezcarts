<?php 
class ControllerLogout extends Controller {
	public function index() {
		if ($this->customer->isLogged()) {
			$this->customer->logout();

			unset($this->session->data['kitchen_id']);
			unset($this->session->data['location']);
			
			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['order_id']);
			unset($this->session->data['language']);
			

			$this->redirect($this->url->link('logout', '', 'SSL'));
		}

		$this->language->load('account/logout');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->data['breadcrumbs'] = array();

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_message'] = $this->language->get('text_message');

		$this->data['button_continue'] = $this->language->get('button_continue');

		$this->data['continue'] = $this->url->link('home');


		$this->template = 'default/template/success.tpl';
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
		$this->response->setOutput($this->render());	
	}
}
?>