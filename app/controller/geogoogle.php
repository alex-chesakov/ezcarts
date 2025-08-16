<?php 
class Controllergeogoogle extends Controller {

	public function index() {
		$json = array();
		$json['debug'] = array();

		$real_distance = array(
			'distance' => 10000000000000,
			'location' => ''
		);
		$origin_addresses = '';
		$destination_addresses = '';
		
		if(!empty($this->request->post['lat']) and !empty($this->request->post['lng'])){

			$url = sprintf("https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyBIq1K4QubCQQJIJiQbQXBAi38Ga08--rs&latlng=%s,%s", $this->request->post['lat'], $this->request->post['lng']);
			$content = file_get_contents($url);
			$metadata = json_decode($content, true);
			if(count($metadata['results']) > 0) {
				// for format example look at url
				// https://maps.googleapis.com/maps/api/geocode/json?latlng=40.714224,-73.961452
				$result = $metadata['results'][0];
				
				if(!empty($result['formatted_address'])){
					$to = $result['formatted_address'];
					
					$json['youre_address'] = $to;
					

					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "locations ");
					if($query->num_rows){
						foreach($query->rows as $row){//	перебираем все локации
							if(!empty($row['location_address'])){
								$from = trim($row['location_address']);
							}else{
								$from = trim($row['location_name']);
							}
							$from = urlencode($from);
							$to = urlencode($to);
							$data = file_get_contents("https://maps.googleapis.com/maps/api/distancematrix/json?key=AIzaSyBIq1K4QubCQQJIJiQbQXBAi38Ga08--rs&origins=$from&destinations=$to&language=ru-RU&sensor=false");

							$data = json_decode($data);
//	расстояние
							if(empty($data->rows[0]->elements[0]->distance)){
								$distance = false;
							}else{
								$distance = $data->rows[0]->elements[0]->distance->value;
							}
//	продолжительность
							if(empty($data->rows[0]->elements[0]->duration)){
								$duration = false;
							}else{
								$duration = $data->rows[0]->elements[0]->duration->value;
							}
							
							if($real_distance['distance'] > $distance and !empty($distance)){
								$real_distance['distance'] = $distance;
								$real_distance['location'] = trim($row['location_name']);
								$origin_addresses = $data->origin_addresses[0];
								$destination_addresses = $data->destination_addresses[0];
							}
//	$json['debug'][] = array('data'=>$data, 'distance'=>$distance , 'duration'=>$duration , 'from'=>$from , 'location_name' => $row['location_name'] );
						}
					}
				
					if(!empty($real_distance) and !empty($real_distance['distance']) and $real_distance['distance'] !== 10000000000000){
						$json['distance'] = $real_distance['distance'];
					}
					if(!empty($real_distance) and isset($real_distance['location']) and !empty($real_distance['distance']) and $real_distance['distance'] !== 10000000000000){
						$json['location'] = $real_distance['location'];
						if($this->customer->isLogged() and empty($this->customer->getApprovedLocation())){
							$this->db->query("UPDATE " . DB_PREFIX . "customer SET location = '" . $this->db->escape(trim($real_distance['location'])) . "', approved_location = '1' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
							
							$this->session->data['location'] = trim($real_distance['location']);
							
							$this->db->query("UPDATE " . DB_PREFIX . "customer SET location = '" . $this->db->escape(trim($real_distance['location'])) . "' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
						}
					}

					if(!empty($origin_addresses)){
						$json['origin_addresses'] = $origin_addresses;
					}
					if(!empty($destination_addresses)){
						$json['destination_addresses'] = $destination_addresses;
					}

				}
			}else {
// no results returned
			}
		}
		if($this->customer->isLogged()){
			$this->db->query("UPDATE " . DB_PREFIX . "customer SET approved_location = '1' WHERE customer_id = '" . (int)$this->customer->getId() . "'");
		}
		$this->response->setOutput(json_encode($json));
	}
	
}