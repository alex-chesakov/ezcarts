<?php 
class ControllerShoppingList extends Controller { 
	public function index() {
		
		
$this->template = 'default/template/shopping-list.tpl';
$this->children = array('common/column_left','common/column_right','common/content_top','common/content_bottom','common/footer'		);
$settings = array();
$settings['type_header'] = 2;
$settings['class_body'] = 'min-h-screen bg-gray-50 flex flex-col';
		
$this->data['header'] = $this->getChild('header',$settings);
$this->response->setOutput($this->render());
	}
}