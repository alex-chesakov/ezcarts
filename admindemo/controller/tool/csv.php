<?php 
class ControllerToolCSV extends Controller { 
	private $error = array();
	private $csvfile = '';
	
	public function upload(){
		$this->language->load('sale/order');
		
		//	загружаем файл
		if (!empty($this->request->files['file']['name'])) {
			$filename = basename(html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8'));

			if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 128)) {
				$this->error['error_warning'] = $this->language->get('error_filename');
			}
			// Allowed file extension types
			$allowed = array('csv');
			if (!in_array(substr(strrchr($filename, '.'), 1), $allowed)) {
				$this->error['error_warning'] = $this->language->get('error_filetype');
			}
			// Allowed file mime types
			$allowed = array('text/csv');
			if (!in_array($this->request->files['file']['type'], $allowed)) {
				$this->error['error_warning'] = $this->language->get('error_filetype');
			}
			// Check to see if any PHP files are trying to be uploaded
			$content = file_get_contents($this->request->files['file']['tmp_name']);
			if (preg_match('/\<\?php/i', $content)) {
				$this->error['error_warning'] = $this->language->get('error_filetype');
			}

			if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
				$this->error['error_warning'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
			}
		}
		$this->data['fields_name'] = array();
		$this->data['fields'] = array();
		if (!isset($this->error['error_warning'])) {
			if (!empty($this->request->files['file']) and is_uploaded_file($this->request->files['file']['tmp_name']) and file_exists($this->request->files['file']['tmp_name'])) {
				move_uploaded_file($this->request->files['file']['tmp_name'], DIR_DOWNLOAD . $filename );
				$this->csvfile = DIR_DOWNLOAD . $filename;
				
				$path_csv = DIR_DOWNLOAD . $filename;
				if (($handle = fopen($path_csv, "r")) !== FALSE) {//	если открыли файл
					$row = 1;//	строка
					while (($data = fgetcsv($handle, 1000, ";")) !== FALSE) {//	разделитель обязателен
						$product = array();
						$num = count($data);
						if($num < 14){
							$this->error['error_warning'] = 'error require* fields!';
							break;
						}
						if($row==1){//	если строка первая, то выясняем названия полей
							for ($c=0; $c < $num; $c++) {
								$this->data['fields_name'][$c] = trim($data[$c]);
							}
						}else{//	если строка не первая, то пошли данные
							for ($c=0; $c < $num; $c++) {
								$this->data['fields'][$row][$c] = trim($data[$c]);
							}
						}
						$row++;
						if($row > 10){
							break;//	заканчиваем тестовый вывод
						}
					}
				}else{
					$this->error['error_warning'] = 'file error!';
				}
		
			}
		}
			
		$this->index();
	}
	public function parse(){
		
		$this->data['report'] = array();
		$this->data['report']['update'] = array();
		$this->data['report']['insert'] = array();
		$fields_name = array();//	названия полей = ключи для данных

		if(!empty($this->request->post['csvfile']) and file_exists($this->request->post['csvfile'])){
			$path_csv = $this->request->post['csvfile'];
			$row = 1;//	строка
			if (($handle = fopen($path_csv, "r")) !== FALSE) {//	если открыли файл
				while (($data = fgetcsv($handle, 1000, ";")) !== FALSE) {//	разделитель обязателен
					$product = array();
					$num = count($data);
					if($num < 14){
						$this->data['error'] = 'error require* fields!';
						break;
					}
					if($row==1){//	если строка первая, то выясняем названия полей
						for ($c=0; $c < $num; $c++) {
							$fields_name[$c] = trim($data[$c]);
						}
					}else{//	если строка не первая, то пошли данные
						for ($c=0; $c < $num; $c++) {
			//	КАТЕГОРИЯ
							if($fields_name[$c] == 'category_name'){//	надо найти название категории
								$product['category_id'] = 0;
								if(!empty($data[$c])){
			//	здесь делать вставку вложенности категорий
									$query = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "category WHERE name LIKE '" . $this->db->escape(trim($data[$c])) . "'");
									if($query->num_rows){
										$product['category_id'] = (int)$query->row['category_id'];
									}else{
										//	делаем вставку категории
										$this->db->query("INSERT INTO " . DB_PREFIX . "category SET name = '" . $this->db->escape(trim($data[$c])) . "', status = '1', date_added = NOW()");
										$product['category_id'] = $this->db->getLastId();
									}
								}
							}
//	КАРТИНКИ
							if($fields_name[$c] == 'image'){
								$product['image'] = '';//	стартовые данные о картинке
								//	надо разобрать url
								$parse_url = parse_url($data[$c]);
								if(!empty($parse_url['host']) and !empty($parse_url['path'])){//	если у нас есть host
									//	проверим наличие картинки на удаленном сайта
									$headers_file = get_headers(trim($data[$c]));//	надо получить заголовки
									if(!empty($headers_file[0]) and stripos($headers_file[0],"200 OK")){//	если ссылка отвечает заголовком 200, то копируем
										$get_name_file = basename($data[$c]);
										file_put_contents(DIR_IMAGE . 'data/shop1/' . $get_name_file, file_get_contents(trim($data[$c])));//	копируем картинку
										$product['image'] = 'data/shop1/' . $get_name_file;//	указываем путь
									}
								}else{
									if (file_exists(DIR_IMAGE . 'data/' . trim($data[$c]))) {//	если файл уже есть на сервере = указан на файл на сервере
										$product['image'] = 'data/' . trim($data[$c]);
									}
								}
							}
							$product[$fields_name[$c]] = $data[$c];//	пишем данные во временный массив, так как нам нужны полные данные, и не было критична их последовательность
						}

//	обязателен BIN и name => переделка в upc+location
						if(!empty($product['upc']) and !empty($product['location']) and !empty($product['name'])){
							//	ищем товар по BIN
							$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product WHERE upc LIKE '" . $this->db->escape(trim($product['upc'])) . "' AND location LIKE '" . $this->db->escape(trim($product['location'])) . "'");
							if($query->num_rows){
								$product_id = $query->row['product_id'];
								$sql = "UPDATE " . DB_PREFIX . "product SET ";
							}else{
								$product_id = 0;
								$sql = "INSERT INTO " . DB_PREFIX . "product SET ";
							}
							
							if(!empty($product['category_id'])){
								$sql.= "category_id = '" . $this->db->escape($product['category_id']) . "', ";
							}else{
								$sql.= "category_id = '0', ";
							}
							if(!empty($product['item'])){
								$sql.= "item = '" . $this->db->escape($product['item']) . "', ";
							}
							if(!empty($product['upc'])){
								$sql.= "upc = '" . $this->db->escape(trim($product['upc'])) . "', ";
							}
							$sql.= "name = '" . $this->db->escape($product['name']) . "', ";
							if(!empty($product['description'])){
								$sql.= "description = '" . $this->db->escape($product['description']) . "', ";
							}
							if(!empty($product['units'])){
								$sql.= "units = '" . (int)$product['units'] . "', ";
							}
							$sql.= "bin = '" . $this->db->escape($product['bin']) . "', ";
							if(!empty($product['unit_weight'])){
								$sql.= "unit_weight = '" . $this->db->escape($product['unit_weight']) . "', ";
							}else{
								$sql.= "unit_weight = '0', ";
							}
							if(!empty($product['location'])){
								$sql.= "location = '" . $this->db->escape(trim($product['location'])) . "', ";
							}else{
								$sql.= "location = '', ";
							}
							if(!empty($product['case_weight'])){
								$sql.= "case_weight = '" . $this->db->escape($product['case_weight']) . "', ";
							}else{
								$sql.= "case_weight = '0', ";
							}
							if(!empty($product['unit_price'])){
								$price = preg_replace('/[^0-9,.]+/', '', $product['unit_price']);
								$sql.= "unit_price = '" . (float)$price . "', ";
							}else{
								$sql.= "unit_price = '0', ";
							}
							if(!empty($product['image'])){
								$sql.= "image = '" . $this->db->escape(html_entity_decode($product['image'], ENT_QUOTES, 'UTF-8')) . "', ";
							}else{
								$sql.= "image = '', ";
							}
							if(!empty($product['case_price'])){
								$price = preg_replace('/[^0-9,.]+/', '', $product['case_price']);
								$sql.= "case_price = '" . (float)$price . "', ";
							}else{
								$sql.= "case_price = '0', ";
							}
							if(!empty($product['rating'])){
								$sql.= "rating = '" . (int)$product['rating'] . "', ";
							}else{
								$sql.= "rating = '0', ";
							}
							if(!empty($product['votes'])){
								$sql.= "votes = '" . (int)$product['votes'] . "', ";
							}else{
								$sql.= "votes = '0', ";
							}
							if(!empty($product['status'])){
								$sql.= "status = '" . (int)$product['status'] . "', ";
							}else{
								$sql.= "status = '0', ";
							}
							if(!empty($product['merchants'])){
								$sql.= "merchants = '" . $this->db->escape($product['merchants']) . "', ";
							}else{
								$sql.= "merchants = '', ";
							}
							if(!empty($product['other'])){
								$sql.= "other = '" . $this->db->escape($product['other']) . "', ";
							}else{
								$sql.= "other = '', ";
							}
							if(!empty($product_id)){
								$sql.= "date_added = date_added WHERE product_id = '" . (int)$product_id . "'";
								$this->db->query($sql);
								$this->data['report']['update'][] = 'update: product_id=' . (int)$product_id;
							}else{
								$sql.= "date_added = NOW()";
								$this->db->query($sql);
								$product_id = $this->db->getLastId();
								$this->data['report']['insert'][] = 'insert: ' . $product['name'];
							}
						}else{
							
						}
					}
					$row++;
				}
				fclose($handle);
				if(!empty($this->data['report']) and !empty($this->data['report']['insert'])){
					$count_insert = count($this->data['report']['insert']);
				}else{
					$count_insert = 0;
				}
				if(!empty($this->data['report']) and !empty($this->data['report']['update'])){
					$count_update = count($this->data['report']['update']);
				}else{
					$count_update = 0;
				}
				$this->data['success'] = 'Success: insert=' . $count_insert . ', update=' . $count_update;
//var_dump($this->data['report']['insert']);
				unlink($path_csv);
			}
		}
		$this->index();
	}
	public function index() {
		$this->data['csvfile'] = '';
		
		if (isset($this->session->data['error'])) {
			$this->data['error_warning'] = $this->session->data['error'];
			unset($this->session->data['error']);
		} elseif (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} elseif(empty($this->error['error_warning'])){
			$this->data['error_warning'] = '';
		}
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} elseif(empty($this->data['success'])){
			$this->data['success'] = '';
		}
		$this->data['heading_title'] = 'CSV';
		
		$this->data['parse'] = $this->url->link('tool/csv/upload', 'token=' . $this->session->data['token'], 'SSL');

		if(!empty($this->csvfile)){
			$this->data['csvfile'] = $this->csvfile;
			$this->data['parse'] = $this->url->link('tool/csv/parse', 'token=' . $this->session->data['token'], 'SSL');
		}

		$this->template = 'tool/csv.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		$this->response->setOutput($this->render());
	}
}