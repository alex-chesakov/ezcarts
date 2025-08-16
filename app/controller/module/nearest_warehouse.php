<?php
class ControllerModuleNearestWarehouse extends Controller {
    public function getNearest() {
        $json = array();
        $input = json_decode(file_get_contents('php://input'), true);

        if (!isset($input['lat']) || !isset($input['lng'])) {
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode(['error' => 'No coordinates']));
            return;
        }

        $user_lat = (float)$input['lat'];
        $user_lng = (float)$input['lng'];

 
        $this->load->model('module/warehouse');
        $warehouses = $this->getWarehouses();

        $nearest = null;
        $min_distance = PHP_FLOAT_MAX;

        foreach ($warehouses as $wh) {
            $distance = $this->haversineGreatCircleDistance(
                $user_lat, $user_lng,
                $wh['latitude'], $wh['longitude']
            );

            if ($distance < $min_distance) {
                $min_distance = $distance;
                $nearest = $wh;
            }
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($nearest));
    }

    private function haversineGreatCircleDistance($lat1, $lon1, $lat2, $lon2, $earthRadius = 6371) {
        $latFrom = deg2rad($lat1);
        $lonFrom = deg2rad($lon1);
        $latTo = deg2rad($lat2);
        $lonTo = deg2rad($lon2);

        $latDelta = $latTo - $latFrom;
        $lonDelta = $lonTo - $lonFrom;

        $angle = 2 * asin(sqrt(
            pow(sin($latDelta / 2), 2) +
            cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)
        ));
        return $angle * $earthRadius;
    }
	
	public function getWarehouses() {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "warehouse");
        return $query->rows;
    }

}

