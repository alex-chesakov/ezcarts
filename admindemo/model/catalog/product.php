<?php
class ModelCatalogProduct extends Model {
	public function addProduct($data) {
		$sql = "INSERT INTO " . DB_PREFIX . "product SET ";
		if(!empty($data['product_category'])){
			$sql.= "category_id = '" . (int)$data['product_category'] . "', ";
		}
		$sql.= "item = '" . $this->db->escape($data['item']) . "', ";
		$sql.= "upc = '" . $this->db->escape($data['upc']) . "', ";
		$sql.= "name = '" . $this->db->escape($data['name']) . "', ";
		$sql.= "description = '" . $this->db->escape($data['description']) . "', ";
		$sql.= "units = '" . $this->db->escape($data['units']) . "', ";
		$sql.= "bin = '" . $this->db->escape($data['bin']) . "', ";
		$sql.= "unit_weight = '" . $this->db->escape($data['unit_weight']) . "', ";
		$sql.= "location = '" . $this->db->escape($data['location']) . "', ";
		$sql.= "case_weight = '" . $this->db->escape($data['case_weight']) . "', ";
		$sql.= "unit_price = '" . (float)$data['unit_price'] . "', ";
		if (isset($data['image'])) {
			$sql.= "image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "', ";
		}
		$sql.= "case_price = '" . (float)$data['case_price'] . "', ";
		$sql.= "rating = '" . (int)$data['rating'] . "', ";
		$sql.= "votes = '" . (int)$data['votes'] . "', ";
		$sql.= "status = '" . (int)$data['status'] . "', ";
		$sql.= "merchants = '" . $this->db->escape($data['merchants']) . "', ";
		$sql.= "date_added = NOW()";
		$this->db->query($sql);

		$product_id = $this->db->getLastId();

		if (isset($data['product_image'])) {
			foreach ($data['product_image'] as $product_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$product_id . "', image = '" . $this->db->escape(html_entity_decode($product_image['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int)$product_image['sort_order'] . "'");
			}
		}
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$product_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		$this->cache->delete('product');
	}

	public function editProduct($product_id, $data) {
		$sql = "UPDATE " . DB_PREFIX . "product SET ";
		if(!empty($data['product_category'])){
			$sql.= "category_id = '" . (int)$data['product_category'] . "', ";
		}
		$sql.= "item = '" . $this->db->escape($data['item']) . "', ";
		$sql.= "upc = '" . $this->db->escape($data['upc']) . "', ";
		$sql.= "name = '" . $this->db->escape($data['name']) . "', ";
		$sql.= "description = '" . $this->db->escape($data['description']) . "', ";
		$sql.= "units = '" . $this->db->escape($data['units']) . "', ";
		$sql.= "bin = '" . $this->db->escape($data['bin']) . "', ";
		$sql.= "unit_weight = '" . $this->db->escape($data['unit_weight']) . "', ";
		$sql.= "location = '" . $this->db->escape($data['location']) . "', ";
		$sql.= "case_weight = '" . $this->db->escape($data['case_weight']) . "', ";
		$sql.= "unit_price = '" . (float)$data['unit_price'] . "', ";
		if (isset($data['image'])) {
			$sql.= "image = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "', ";
		}
		$sql.= "case_price = '" . (float)$data['case_price'] . "', ";
		$sql.= "rating = '" . (int)$data['rating'] . "', ";
		$sql.= "votes = '" . (int)$data['votes'] . "', ";
		$sql.= "status = '" . (int)$data['status'] . "', ";
		$sql.= "merchants = '" . $this->db->escape($data['merchants']) . "' ";
		$sql.= "WHERE product_id = '" . (int)$product_id . "'";
		$this->db->query($sql);

		$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$product_id . "'");
		if (isset($data['product_image'])) {
			foreach ($data['product_image'] as $product_image) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$product_id . "', image = '" . $this->db->escape(html_entity_decode($product_image['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int)$product_image['sort_order'] . "'");
			}
		}
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$product_id. "'");
		if ($data['keyword']) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$product_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
		}
		$this->cache->delete('product');
	}

	public function copyProduct($product_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$product_id . "'");

		if ($query->num_rows) {
			$data = array();

			$data = $query->row;
			$data['upc'] = $data['upc'] . ' (copy)';
			$data['upc'] = '';
			$data['bin'] = '';
			$data['keyword'] = '';
			$data['status'] = '0';

			$data = array_merge($data, array('product_image' => $this->getProductImages($product_id)));		
			$this->addProduct($data);
		}
	}

	public function deleteProduct($product_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "review WHERE product_id = '" . (int)$product_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$product_id. "'");
		$this->cache->delete('product');
	}

	public function getProduct($product_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$product_id . "') AS keyword FROM " . DB_PREFIX . "product p WHERE p.product_id = '" . (int)$product_id . "'");
		return $query->row;
	}

	public function getProducts($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "product p ";

		$sql .= " WHERE 1=1"; 

		if (!empty($data['filter_name'])) { $sql .= " AND p.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";}
		
		if (!empty($data['filter_location'])) { $sql .= " AND p.location LIKE '" . $this->db->escape($data['filter_location']) . "'";}

		if (!empty($data['filter_price'])) {
			$sql .= " AND p.unit_price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
			$sql .= " AND p.case_price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
		}

		if (isset($data['filter_quantity']) && !is_null($data['filter_quantity'])) { $sql .= " AND p.units = '" . $this->db->escape($data['filter_quantity']) . "'";}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
		}

		$sql .= " GROUP BY p.product_id";

		$sort_data = array(
			'p.name',
			'p.unit_price',
			'p.case_price',
			'p.status',
		);	

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY p.name";	
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}				

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}	
		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getProductsByCategoryId($category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p WHERE p.category_id = '" . (int)$category_id . "' ORDER BY p.name ASC");
		return $query->rows;
	} 

	public function getProductImages($product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$product_id . "'");
		return $query->rows;
	}

	public function getTotalProducts($data = array()) {
		$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p ";
		$sql .= " WHERE 1=1 ";

		if (!empty($data['filter_name'])) {
			$sql .= " AND p.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}
		
		if (!empty($data['filter_location'])) { $sql .= " AND p.location LIKE '" . $this->db->escape($data['filter_location']) . "'";}

		if (!empty($data['filter_price'])) {
			$sql .= " AND (p.unit_price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
			$sql .= " AND p.case_price LIKE '" . $this->db->escape($data['filter_price']) . "%')";
		}

		if (isset($data['filter_quantity']) && !is_null($data['filter_quantity'])) {
			$sql .= " AND p.units = '" . $this->db->escape($data['filter_quantity']) . "'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}	

}
?>
