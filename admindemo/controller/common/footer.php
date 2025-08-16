<?php
class ControllerCommonFooter extends Controller {   
	protected function index() {
		$this->language->load('common/footer');

		$this->template = 'common/footer.tpl';

		$this->render();
	}
}
