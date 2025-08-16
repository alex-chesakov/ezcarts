<?php    
class ControllerToolAnalytics extends Controller { 
	private $error = array();

	public function index() {
//	sales
		$query = $this->db->query("SELECT SUM(total) AS sumtotal FROM `" . DB_PREFIX . "order` WHERE order_status_id > 0 AND order_status_id <> 5");
		$this->data['sales_sumtotal'] = number_format((float)$query->row['sumtotal'],2);
		
		$query2 = $this->db->query("SELECT SUM(total) AS sumtotal FROM `" . DB_PREFIX . "order` WHERE order_status_id > 0 AND order_status_id <> 5 AND date_added >= DATE_FORMAT(NOW(), '%Y-%m-01')");
		$this->data['sales_sumtotal_mount'] = (float)$query2->row['sumtotal'];
		
		$this->data['sales_proc_mount'] = (float)$query2->row['sumtotal'] / (((float)$query->row['sumtotal']) / 100);
//	orders
		$query = $this->db->query("SELECT SUM(total) AS sumtotal FROM `" . DB_PREFIX . "order`");
		$this->data['orders_sumtotal'] = number_format((float)$query->row['sumtotal'],2);
		
		$query2 = $this->db->query("SELECT SUM(total) AS sumtotal FROM `" . DB_PREFIX . "order` WHERE date_added >= DATE_FORMAT(NOW(), '%Y-%m-01')");
		$this->data['orders_sumtotal_mount'] = (float)$query2->row['sumtotal'];
		
		$this->data['orders_proc_mount'] = (float)$query2->row['sumtotal'] / (((float)$query->row['sumtotal']) / 100);
//	AVG
		$query = $this->db->query("SELECT AVG(total) AS avgtotal FROM `" . DB_PREFIX . "order`");
		$this->data['avg_total'] = number_format((float)$query->row['avgtotal'],2);

		$query2 = $this->db->query("SELECT AVG(total) AS avgtotal FROM `" . DB_PREFIX . "order` WHERE date_added >= DATE_FORMAT(NOW(), '%Y-%m-01')");
		$this->data['avg_total_mount'] = (float)$query2->row['avgtotal'];
		if(!empty($query->row['avgtotal'])){
			$this->data['avg_proc_mount'] = (float)$query2->row['avgtotal'] / (((float)$query->row['avgtotal']) / 100);
		}else{
			$this->data['avg_proc_mount'] = 0;
		}
//	Conversion
		
		
		$this->template = 'tool/analytics.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}
	
}