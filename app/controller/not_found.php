<?php   
class ControllerNotFound extends Controller {
	public function index() {		
		$this->language->load('error/not_found');

		$this->document->settitle($this->language->get('heading_title'));

		if (isset($this->request->get['route'])) {
			$data = $this->request->get;

			unset($data['_route_']);

			$route = $data['route'];

			unset($data['route']);

			$url = '';

			if ($data) {
				$url = '&' . urldecode(http_build_query($data, '', '&'));
			}	

			if (isset($this->request->server['https']) && (($this->request->server['https'] == 'on') || ($this->request->server['https'] == '1'))) {
				$connection = 'ssl';
			} else {
				$connection = 'nonssl';
			}

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link($route, $url, $connection),
				'separator' => $this->language->get('text_separator')
			);
		}

$this->data['heading_title'] = $this->language->get('heading_title');
$this->data['text_error'] = $this->language->get('text_error');
$this->data['name'] = $this->config->get('config_name');
		$this->data['button_continue'] = $this->language->get('button_continue');

		$this->response->addheader($this->request->server['SERVER_PROTOCOL'] . '/1.1 404 not found');

		$this->data['continue'] = $this->url->link('home');


		$this->template = 'default/template/not_found.tpl';
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'footer'	
		);
		$settings = array();
		$settings['type_header'] = 1;
		$settings['class_body'] = 'min-h-screen bg-gray-50 flex flex-col';

		$this->data['header'] = $this->getChild('header',$settings);
		$this->response->setoutput($this->render());
	}
}
?>