<?php  
class ControllerHome extends Controller {
	public function index() {
		if ($this->customer->isLogged()) {$this->redirect($this->url->link('shop', '', 'SSL'));}
		$this->document->setTitle($this->config->get('config_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));

		$this->data['heading_title'] = $this->config->get('config_title');
			
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/home.tpl')) {$this->template = $this->config->get('config_template') . '/template/home.tpl';} else {$this->template = 'default/template/home.tpl';}
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer'
		);
		$settings = array();
		if($this->customer->isLogged()){
			$settings['type_header'] = 2;//	особый header
			$settings['class_body'] = '';
		}else{
			$settings['type_header'] = 1;//	обычный короткий header
			$settings['class_body'] = 'min-h-screen bg-white';
		}
		$this->data['header'] = $this->getChild('header',$settings);
		
		$this->response->setOutput($this->render());
	}
}
?>