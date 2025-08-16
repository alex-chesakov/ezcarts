<?php
class Cart {
	private $config;
	private $db;
	private $data = array();
	private $data_recurring = array();

	public function __construct($registry) {
		$this->config = $registry->get('config');
		$this->customer = $registry->get('customer');
		$this->session = $registry->get('session');
		$this->db = $registry->get('db');
		$this->tax = $registry->get('tax');
		$this->weight = $registry->get('weight');

		if (!isset($this->session->data['cart']) || !is_array($this->session->data['cart'])) {
			$this->session->data['cart'] = array();
		}
	}
//	товары
	public function getProducts() {

		if (!$this->data and $this->customer->isLogged()) {
			$sql = "SELECT *, p.name AS name, p.bin AS bin, cp.type AS type, p.case_price AS case_price, p.unit_price AS unit_price, cp.quantity AS quantity, cp.type AS type, p.image AS image FROM " . DB_PREFIX . "cart_products cp ";
			$sql.= "LEFT JOIN " . DB_PREFIX . "cart c ON (c.cart_id = cp.cart_id) ";
			$sql.= "LEFT JOIN " . DB_PREFIX . "product p ON (p.product_id = cp.product_id) ";
			$sql.= "WHERE c.customer_id = '" . (int)$this->customer->getId() . "' ";
			$query = $this->db->query($sql);

			if($query->num_rows){
				foreach ($query->rows as $product) {

					if($product['type']=='case'){
						$price = number_format(((float)$product['case_price']),2);
					}else{
						$price = number_format(((float)$product['unit_price']),2);
					}

					$this->data[($product['cart_id'] . '-' . $product['product_id'] . '-' . $product['type'])] = array(
						'key' => $product['cart_id'],
						'product_id' => $product['product_id'],
						'name' => $product['name'],
						'bin' => $product['bin'],
						'image' => $product['image'],
						'quantity' => $product['quantity'],
						'type' => $product['type'],
						'case_price' => number_format(($product['case_price']),2),
						'unit_price' => number_format(($product['unit_price']),2),
						'price' => $price,
						'total' => ($price) * (int)$product['quantity'],
					);

				}
			}
		}
		return $this->data;
	}
//	сумма товаров	
	public function getSubTotal() {
		$total = 0;
		foreach($this->getProducts() as $product) {

			$total += $product['total'];
		};

		return $total;
	}

	public function add($product_id, $qty = 1, $option, $profile_id = '') {
		$key = (int)$product_id . ':';

		if ($option) {
			$key .= base64_encode(serialize($option)) . ':';
		}  else {
			$key .= ':';
		}

		if ($profile_id) {
			$key .= (int)$profile_id;
		}

		if ((int)$qty && ((int)$qty > 0)) {
			if (!isset($this->session->data['cart'][$key])) {
				$this->session->data['cart'][$key] = (int)$qty;
			} else {
				$this->session->data['cart'][$key] += (int)$qty;
			}
		}

		$this->data = array();
	}

	public function update($key, $qty) {
		if ((int)$qty && ((int)$qty > 0)) {
			$this->session->data['cart'][$key] = (int)$qty;
		} else {
			$this->remove($key);
		}

		$this->data = array();
	}

	public function remove($key) {
		if (isset($this->session->data['cart'][$key])) {
			unset($this->session->data['cart'][$key]);
		}

		$this->data = array();
	}

	public function clear() {
		$this->session->data['cart'] = array();
		$this->data = array();
	}

	public function getWeight() {
		$weight = 0;

		foreach ($this->getProducts() as $product) {
			if ($product['shipping']) {
				$weight += $this->weight->convert($product['weight'], $product['weight_class_id'], $this->config->get('config_weight_class_id'));
			}
		}

		return $weight;
	}

	public function getTotal() {
		$total = 0;

		foreach ($this->getProducts() as $product) {
			$total += $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'];
		}

		return $total;
	}

	public function countProducts() {
		$product_total = 0;

		$products = $this->getProducts();

		foreach ($products as $product) {
			$product_total += $product['quantity'];
		}		

		return $product_total;
	}

	public function hasProducts() {
		return count($this->session->data['cart']);
	}	
}
?>