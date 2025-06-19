<?php  
class ControllerModuleCarousel extends Controller {
	protected function index($setting) {
		static $module = 0;

		$this->load->model('design/banner');
		$this->load->model('tool/image');

		$this->document->addStyle('/view/javascript/swiper/css/swiper.min.css');
		$this->document->addStyle('/view/javascript/swiper/css/opencart.css');
		$this->document->addScript('/view/javascript/swiper/js/swiper.jquery.min.js');

		$this->data['limit'] = $setting['limit'];
		$this->data['scroll'] = $setting['scroll'];

		$this->data['banners'] = array();

		$results = $this->model_design_banner->getBanner($setting['banner_id']);

		foreach ($results as $result) {
			if (file_exists(DIR_IMAGE . $result['image'])) {
				$this->data['banners'][] = array(
					'title' => $result['title'],
					'html_desc' => html_entity_decode($result['html_desc'], ENT_QUOTES, 'UTF-8'),
					'link'  => $result['link'],
					'full_image' => '/image/' . $result['image'],
					'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
				);
			}
		}

		$this->data['module'] = $module++; 
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "banner WHERE banner_id = '" . (int)$setting['banner_id'] . "'");
		if($query->num_rows and !empty($query->row['name'])){
			$this->data['name'] = $query->row['name'];
		}else{
			$this->data['name'] = false;
		}
		if($query->num_rows and !empty($query->row['filename']) and file_exists(DIR_TEMPLATE . 'default/template/module/carousel/' . $query->row['filename'] . '.tpl')){
			$file = trim($query->row['filename']);
		}else{
			$file = 'carousel';
		}
		$this->template = 'default/template/module/carousel/' . $file . '.tpl';

		$this->render(); 
	}
}
?>