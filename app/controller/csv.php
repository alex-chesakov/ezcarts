<?php 

class ControllerCSV extends Controller {
//	https://myeasycarts.com/index.php?route=csv&csvfile=price.csv&csvtoken=0LSldlWT
	public function index() {
		$json = array();
		if(!empty($this->request->get['csvtoken']) and $this->request->get['csvtoken']=='0LSldlWT'){
		
			$json = $this->parse();
		}else{
			$json['error'] = 'not authorized';
		}
		$this->response->setOutput(json_encode($json));
	}
	protected function parse(){
		$start_time = microtime( true );
		
		$json = array();
		
		$json['report'] = array();
		$json['report']['update'] = array();
		$json['report']['insert'] = array();
		$fields_name = array();//	названия полей = ключи для данных

		if(!empty($this->request->get['csvfile']) and file_exists(DIR_DOWNLOAD . $this->request->get['csvfile'])){
			$path_csv = DIR_DOWNLOAD . $this->request->get['csvfile'];
			$row = 1;//	строка
			if (($handle = fopen($path_csv, "r")) !== FALSE) {//	если открыли файл
//	$this->log->write('open ' . $path_csv);
				while (($data = fgetcsv($handle, 1000, ";")) !== FALSE) {//	разделитель обязателен
//	$this->log->write('start row');
					$product = array();
					$num = count($data);
					if($num < 14){
						$json['error'] = 'error require* fields!';
						break;
					}
					if($row==1){//	если строка первая, то выясняем названия полей
						for ($c=0; $c < $num; $c++) {
							$fields_name[$c] = trim($data[$c]);
//	$this->log->write('find column: ' . trim($data[$c]));
						}
					}else{//	если строка не первая, то пошли данные
						for ($c=0; $c < $num; $c++) {
			//	КАТЕГОРИЯ
							if($fields_name[$c] == 'category_name'){//	надо найти название категории
								$product['category_id'] = 0;
								if(!empty($data[$c])){
//	$this->log->write('category: ' . trim($data[$c]));
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
//	$this->log->write('start image: ' . trim($data[$c]));
								$product['image'] = '';//	стартовые данные о картинке
								//	надо разобрать url
								$parse_url = parse_url($data[$c]);
								if(!empty($parse_url['host']) and !empty($parse_url['path'])){//	если у нас есть host
//	$this->log->write('find image http');
									//	проверим наличие картинки на удаленном сайта
									$headers_file = get_headers(trim($data[$c]));//	надо получить заголовки
									if(!empty($headers_file[0]) and stripos($headers_file[0],"200 OK")){//	если ссылка отвечает заголовком 200, то копируем
										$get_name_file = basename($data[$c]);
										file_put_contents(DIR_IMAGE . 'data/shop1/' . $get_name_file, file_get_contents(trim($data[$c])));//	копируем картинку
										$product['image'] = 'data/shop1/' . $get_name_file;//	указываем путь
									}
								}else{
									if (file_exists(DIR_IMAGE . 'data/' . trim($data[$c]))) {//	если файл уже есть на сервере = указан на файл на сервере
//	$this->log->write('image exist');
										$product['image'] = 'data/' . trim($data[$c]);
									}else{
//	$this->log->write('image not exist');
									}
								}
							}
//	$this->log->write('field: ' . $fields_name[$c] . '=' . $data[$c]);
							$product[$fields_name[$c]] = $data[$c];//	пишем данные во временный массив, так как нам нужны полные данные, и не было критична их последовательность
						}

//	обязателен BIN и name => переделка в upc+location
						if(!empty($product['upc']) and !empty($product['location']) and !empty($product['name'])){
							//	ищем товар по BIN
							$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product WHERE upc LIKE '" . $this->db->escape(trim($product['upc'])) . "' AND location LIKE '" . $this->db->escape(trim($product['location'])) . "'");
							if($query->num_rows){
								$product_id = $query->row['product_id'];
								$sql = "UPDATE " . DB_PREFIX . "product SET ";
//	$this->log->write('find product: ' . $product_id);
							}else{
								$product_id = 0;
								$sql = "INSERT INTO " . DB_PREFIX . "product SET ";
//	$this->log->write('new product');
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
								$json['report']['update'][] = 'update: product_id=' . (int)$product_id;
//	$diff = sprintf( '%.6f sec.', microtime( true ) - $start_time );
//	$this->log->write( "product_id: " . $product_id . ", time_exec: $diff" );
							}else{
								$sql.= "date_added = NOW()";
								$this->db->query($sql);
								$product_id = $this->db->getLastId();
								$json['report']['insert'][] = 'insert: ' . $product['name'];
//	$diff = sprintf( '%.6f sec.', microtime( true ) - $start_time );
//	$this->log->write( "product_id: " . $product_id . ", time_exec: $diff" );
							}
						}else{
							
						}
					}
					$row++;
				}
				fclose($handle);
				if(!empty($json['report']) and !empty($json['report']['insert'])){
					$count_insert = count($json['report']['insert']);
				}else{
					$count_insert = 0;
				}
				if(!empty($json['report']) and !empty($json['report']['update'])){
					$count_update = count($json['report']['update']);
				}else{
					$count_update = 0;
				}
				$json['success'] = 'Success: insert=' . $count_insert . ', update=' . $count_update;
//var_dump($json['report']['insert']);
				unlink($path_csv);

			}
		}
unset( $json['report'] );
$diff = sprintf( '%.6f sec.', microtime( true ) - $start_time );
$this->log->write("time_exec: $diff");
$json['time_exec'] = "time_exec: $diff"; // Время выполнения: 0.000014 sec.
		return $json;
	}
}