<?php
/**
 * @package     Materialize Template
 * @author      Anton Semenov
 * @copyright   Copyright (c) 2017 - 2018, Materialize Template. https://github.com/trydalcoholic/opencart-materialize
 * @license     https://github.com/trydalcoholic/opencart-materialize/blob/master/LICENSE
 * @link        https://github.com/trydalcoholic/opencart-materialize
 */

class ModelExtensionMTMaterializeModuleMTMaterializeFilter extends Model {
	public function getCategoryStatus($category_id) {
		$query = $this->db->query("SELECT status, COUNT(DISTINCT p2c.product_id) AS total FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p2c.category_id = c.category_id) WHERE c.category_id = '" . (int)$category_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND c.status = '1' LIMIT 1");

		if ($query->row['status'] && $query->row['total']) {
			return true;
		} else {
			return false;
		}
	}

	public function getMinMaxPrice($data) {
		/* Sample sql query
SELECT
  MIN(IF(tp.tax_percent IS NOT NULL, IFNULL(ps.price, p.price) + (IFNULL(ps.price, p.price) * tp.tax_percent / 100) + IFNULL(ta.tax_amount, 0), IFNULL(ps.price, p.price)) * 0.78460002) AS min_price_eur,
  MAX(IF(tp.tax_percent IS NOT NULL, IFNULL(ps.price, p.price) + (IFNULL(ps.price, p.price) * tp.tax_percent / 100) + IFNULL(ta.tax_amount, 0), IFNULL(ps.price, p.price)) * 0.78460002) AS max_price_eur,
  MIN(IF(tp.tax_percent IS NOT NULL, IFNULL(ps.price, p.price) + (IFNULL(ps.price, p.price) * tp.tax_percent / 100) + IFNULL(ta.tax_amount, 0), IFNULL(ps.price, p.price)) * 1) AS min_price_usd,
  MAX(IF(tp.tax_percent IS NOT NULL, IFNULL(ps.price, p.price) + (IFNULL(ps.price, p.price) * tp.tax_percent / 100) + IFNULL(ta.tax_amount, 0), IFNULL(ps.price, p.price)) * 1) AS max_price_usd
FROM oc_product p
  LEFT JOIN oc_product_to_category p2c ON (p.product_id = p2c.product_id)
  LEFT JOIN oc_product_to_store p2s ON (p.product_id = p2s.product_id)
  LEFT JOIN (SELECT product_id, price FROM oc_product_special ps WHERE ps.customer_group_id = '1' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS ps ON (p.product_id = ps.product_id)
  LEFT JOIN (
    SELECT
      tr2.tax_class_id, tr1.rate AS tax_percent
    FROM oc_tax_rate tr1
      INNER JOIN oc_tax_rate_to_customer_group tr2cg ON (tr1.tax_rate_id = tr2cg.tax_rate_id)
      LEFT JOIN oc_tax_rule tr2 ON (tr1.tax_rate_id = tr2.tax_rate_id)
    WHERE tr1.type = 'P' AND tr2cg.customer_group_id = '1' ORDER BY tr2.priority
  ) AS tp ON (p.tax_class_id = tp.tax_class_id)
  LEFT JOIN (
    SELECT
      tr2.tax_class_id, tr1.rate AS tax_amount
    FROM oc_tax_rate tr1
      INNER JOIN oc_tax_rate_to_customer_group tr2cg ON (tr1.tax_rate_id = tr2cg.tax_rate_id)
      LEFT JOIN oc_tax_rule tr2 ON (tr1.tax_rate_id = tr2.tax_rate_id)
    WHERE tr1.type = 'F' AND tr2cg.customer_group_id = '1' ORDER BY tr2.priority
  ) AS ta ON (p.tax_class_id = ta.tax_class_id)
WHERE p2c.category_id = '20' AND p.date_available <= NOW() AND p.status = '1' AND p2s.store_id = '0'
		*/
		if (!empty($data['config_tax'])) {
			$sql = "SELECT MIN(IF(tp.tax_percent IS NOT NULL, IFNULL(ps.price, p.price) + (IFNULL(ps.price, p.price) * tp.tax_percent / 100) + IFNULL(ta.tax_amount, 0), IFNULL(ps.price, p.price)) * '" . (float)$data['currency_ratio'] . "') AS min_price, MAX(IF(tp.tax_percent IS NOT NULL, IFNULL(ps.price, p.price) + (IFNULL(ps.price, p.price) * tp.tax_percent / 100) + IFNULL(ta.tax_amount, 0), IFNULL(ps.price, p.price)) * '" . (float)$data['currency_ratio'] . "') AS max_price";
		} else {
			$sql = "SELECT MIN(IFNULL(ps.price, p.price) * '" . (float)$data['currency_ratio'] . "') AS min_price, MAX(IFNULL(ps.price, p.price) * '" . (float)$data['currency_ratio'] . "') AS max_price";
		}

		$sql .= " FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) LEFT JOIN (SELECT product_id, price FROM " . DB_PREFIX . "product_special ps WHERE ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS ps ON (p.product_id = ps.product_id)";

		if (!empty($data['config_tax'])) {
			$sql .= " LEFT JOIN (SELECT tr2.tax_class_id, tr1.rate AS tax_percent FROM " . DB_PREFIX . "tax_rate tr1 INNER JOIN " . DB_PREFIX . "tax_rate_to_customer_group tr2cg ON (tr1.tax_rate_id = tr2cg.tax_rate_id) LEFT JOIN " . DB_PREFIX . "tax_rule tr2 ON (tr1.tax_rate_id = tr2.tax_rate_id) WHERE tr1.type = 'P' AND tr2cg.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' ORDER BY tr2.priority) AS tp ON (p.tax_class_id = tp.tax_class_id) LEFT JOIN (SELECT tr2.tax_class_id, tr1.rate AS tax_amount FROM " . DB_PREFIX . "tax_rate tr1 INNER JOIN " . DB_PREFIX . "tax_rate_to_customer_group tr2cg ON (tr1.tax_rate_id = tr2cg.tax_rate_id) LEFT JOIN " . DB_PREFIX . "tax_rule tr2 ON (tr1.tax_rate_id = tr2.tax_rate_id) WHERE tr1.type = 'F' AND tr2cg.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' ORDER BY tr2.priority) AS ta ON (p.tax_class_id = ta.tax_class_id)";
		}

		$sql .= " WHERE p2c.category_id = '" . (int)$data['category_id'] . "' AND p.date_available <= NOW() AND p.status = '1' AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

		$query = $this->db->query($sql);

		return $query->row;
	}

	public function getSubCategories($data) {
		$sql = "SELECT c.category_id, cd.name";

		if ($data['image']) {
			$sql .= ", c.image";
		}

		$sql .= " FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE `parent_id` = '" . (int)$data['category_id'] . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)";

		$query = $this->db->query($sql);

		$sub_categories_data = $query->rows;

		return $sub_categories_data;
	}

	public function getProductOptions($data) {
		$option_data = array();

		$query = $this->db->query("SELECT o.option_id, od.name, o.type, o.sort_order FROM " . DB_PREFIX . "option o LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) LEFT JOIN " . DB_PREFIX . "product_option po ON (o.option_id = po.option_id) LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (po.product_id = p2c.product_id) WHERE p2c.category_id = '" . (int)$data['category_id'] . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "' AND (o.type = 'radio' OR o.type = 'checkbox' OR o.type = 'select') ORDER BY o.sort_order");

		foreach ($query->rows as $result) {
			$option_value_data = array();

			$sql = "SELECT ov.option_value_id, ovd.name, ov.sort_order";

			if ($data['image']) {
				$sql .= ", ov.image";
			}

			$sql .= " FROM " . DB_PREFIX . "option_value ov LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) LEFT JOIN " . DB_PREFIX . "product_option_value pov ON (ov.option_value_id = pov.option_value_id) WHERE ov.option_id = '" . (int)$result['option_id'] . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pov.quantity > '0' ORDER BY ov.sort_order";

			$option_value_data_query = $this->db->query($sql);

			foreach ($option_value_data_query->rows as $option_value) {
				$option_value_data[$option_value['name']] = array(
					'option_value_id'	=> (int)$option_value['option_value_id'],
					'name'				=> $option_value['name'],
					'image'				=> $data['image'] ? $option_value['image'] : false,
					'sort_order'		=> (int)$option_value['sort_order']
				);
			}

			$option_data[$result['name']] = array(
				'option_id'			=> (int)$result['option_id'],
				'name'				=> $result['name'],
				'type'				=> $result['type'],
				'sort_order'		=> (int)$result['sort_order'],
				'option_value_data'	=> $option_value_data
			);
		}

		return $option_data;
	}

	public function getCategoryFilters($category_id) {
		$implode = array();

		$query = $this->db->query("SELECT filter_id FROM " . DB_PREFIX . "category_filter WHERE category_id = '" . (int)$category_id . "'");

		foreach ($query->rows as $result) {
			$implode[] = (int)$result['filter_id'];
		}

		$filter_group_data = array();

		if ($implode) {
			$filter_group_query = $this->db->query("SELECT DISTINCT f.filter_group_id, fgd.name, fg.sort_order FROM " . DB_PREFIX . "filter f LEFT JOIN " . DB_PREFIX . "filter_group fg ON (f.filter_group_id = fg.filter_group_id) LEFT JOIN " . DB_PREFIX . "filter_group_description fgd ON (fg.filter_group_id = fgd.filter_group_id) WHERE f.filter_id IN (" . implode(',', $implode) . ") AND fgd.language_id = '" . (int)$this->config->get('config_language_id') . "' GROUP BY f.filter_group_id ORDER BY fg.sort_order, LCASE(fgd.name)");

			foreach ($filter_group_query->rows as $filter_group) {
				$filter_data = array();

				$filter_query = $this->db->query("SELECT DISTINCT f.filter_id, fd.name FROM " . DB_PREFIX . "filter f LEFT JOIN " . DB_PREFIX . "filter_description fd ON (f.filter_id = fd.filter_id) WHERE f.filter_id IN (" . implode(',', $implode) . ") AND f.filter_group_id = '" . (int)$filter_group['filter_group_id'] . "' AND fd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY f.sort_order, LCASE(fd.name)");

				foreach ($filter_query->rows as $filter) {
					$filter_data[] = array(
						'filter_id'	=> $filter['filter_id'],
						'name'		=> $filter['name']
					);
				}

				if ($filter_data) {
					$filter_group_data[] = array(
						'filter_group_id'	=> $filter_group['filter_group_id'],
						'name'				=> $filter_group['name'],
						'filter'			=> $filter_data
					);
				}
			}
		}

		return $filter_group_data;
	}

	public function getAttributes($category_id) {
		$query = $this->db->query("SELECT pa.attribute_id, ad.name as name, pa.text as text FROM " . DB_PREFIX . "product_attribute pa LEFT JOIN " . DB_PREFIX . "attribute_description ad ON (pa.attribute_id = ad.attribute_id) LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (pa.product_id = p2c.product_id) WHERE p2c.category_id = '" . (int)$category_id . "' AND pa.language_id = '" . (int)$this->config->get('config_language_id') . "' AND ad.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY pa.attribute_id, LCASE(name)");

		$attributes_data = $query->rows;

		return $attributes_data;
	}

	public function getManufacturers($data) {
		$manufacturer_data = array();

		$query = $this->db->query("SELECT p.manufacturer_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) WHERE p2c.category_id = '" . (int)$data['category_id'] . "'");

		foreach ($query->rows as $result) {
			$manufacturer_data[] = (int)$result['manufacturer_id'];
		}

		if ($manufacturer_data) {
			$sql = "SELECT m.manufacturer_id, m.name";

			if ($data['image']) {
				$sql .= ", m.image";
			}

			$sql .= " FROM " . DB_PREFIX . "manufacturer m LEFT JOIN " . DB_PREFIX . "manufacturer_to_store m2s ON (m.manufacturer_id = m2s.manufacturer_id) WHERE m.manufacturer_id IN (" . implode(',', $manufacturer_data) . ") AND m2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ORDER BY m.sort_order ASC LIMIT " . (int)count($manufacturer_data);

			$manufacturers_query = $this->db->query($sql);

			$manufacturers = $manufacturers_query->rows;
		} else {
			$manufacturers = false;
		}

		return $manufacturers;
	}

	public function getStockStatuses() {
		$query = $this->db->query("SELECT stock_status_id, name FROM " . DB_PREFIX . "stock_status WHERE language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY name");

		$stock_status_data = $query->rows;

		return $stock_status_data;
	}

	public function getProducts($data = array()) {
		$sql = "SELECT p.product_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) LEFT JOIN (SELECT product_id, price FROM " . DB_PREFIX . "product_special ps WHERE ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) GROUP BY ps.product_id ORDER BY ps.priority ASC, ps.price ASC";

		if (!empty($data['product_special_filter'])) {
			$sql .= " ) AS ps ON (p.product_id = ps.product_id)";
		} else {
			$sql .= " LIMIT 1) AS ps ON (p.product_id = ps.product_id)";
		}

		if (!empty($data['default_filter'])) {
			$sql .= " LEFT JOIN " . DB_PREFIX . "product_filter pf ON (p.product_id = pf.product_id)";
		}

		if (!empty($data['attribute_filter'])) {
			$sql .= " LEFT JOIN " . DB_PREFIX . "product_attribute pa ON (p.product_id = pa.product_id)";
		}

		if (!empty($data['option_filter'])) {
			$sql .= " LEFT JOIN " . DB_PREFIX . "product_option_value pov ON (p.product_id = pov.product_id)";
		}

		if (!empty($data['rating_filter'])) {
			$sql .= " LEFT JOIN (SELECT product_id, AVG(rating) AS rating FROM " . DB_PREFIX . "review WHERE status = '1' GROUP BY product_id) AS r1 ON (p.product_id = r1.product_id)";
		}

		if (!empty($data['review_filter'])) {
			$sql .= " LEFT JOIN " . DB_PREFIX . "review r2 ON (p.product_id = r2.product_id)";
		}

		if (!empty($data['config_tax'])) {
			$sql .= " LEFT JOIN (SELECT tr2.tax_class_id, tr1.rate AS tax_percent FROM " . DB_PREFIX . "tax_rate tr1 INNER JOIN " . DB_PREFIX . "tax_rate_to_customer_group tr2cg ON (tr1.tax_rate_id = tr2cg.tax_rate_id) LEFT JOIN " . DB_PREFIX . "tax_rule tr2 ON (tr1.tax_rate_id = tr2.tax_rate_id) WHERE tr1.type = 'P' AND tr2cg.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' ORDER BY tr2.priority) AS tp ON (p.tax_class_id = tp.tax_class_id) LEFT JOIN (SELECT tr2.tax_class_id, tr1.rate AS tax_amount FROM " . DB_PREFIX . "tax_rate tr1 INNER JOIN " . DB_PREFIX . "tax_rate_to_customer_group tr2cg ON (tr1.tax_rate_id = tr2cg.tax_rate_id) LEFT JOIN " . DB_PREFIX . "tax_rule tr2 ON (tr1.tax_rate_id = tr2.tax_rate_id) WHERE tr1.type = 'F' AND tr2cg.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' ORDER BY tr2.priority) AS ta ON (p.tax_class_id = ta.tax_class_id)";
		}

		$sql .= " WHERE p.date_available <= NOW() AND p.status = '1' AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

		if (!empty($data['sub_category_filter'])) {
			$sql .= " AND p2c.category_id IN ('" . $data['sub_category_filter'] . "')";
		} else {
			$sql .= " AND p2c.category_id = '" . (int)$data['category_id'] . "'";
		}

		if (!empty($data['default_filter'])) {
			$sql .= " AND pf.filter_id IN ('" . $data['default_filter'] . "')";
		}

		if (!empty($data['attribute_filter'])) {
			$sql .= " AND pa.attribute_id IN ('" . $data['attribute_filter'] . "')";
		}

		if (!empty($data['option_filter'])) {
			$sql .= " AND pov.option_value_id IN ('" . $data['option_filter'] . "')";
		}

		if (!empty($data['manufacturer_filter'])) {
			$sql .= " AND p.manufacturer_id IN ('" . $data['manufacturer_filter'] . "')";
		}

		if (!empty($data['rating_filter'])) {
			$implode = array();

			$sql .= " AND (";

			foreach ($data['rating_filter'] as $rating) {
				$implode[] = "ROUND(r1.rating) = '" . (int)$rating . "'";
			}

			if ($implode) {
				$sql .= " " . implode(" OR ", $implode) . "";
			}

			$sql .= ")";
		}

		if (!empty($data['review_filter'])) {
			$sql .= " AND r2.status = '1'";
		}

		if (!empty($data['stock_status_filter'])) {
			$sql .= " AND ((p.quantity > '0' AND '7' IN('" . $data['stock_status_filter'] . "')) OR (p.quantity <= '0' AND p.stock_status_id IN('" . $data['stock_status_filter'] . "')))";
		}

		if (!empty($data['product_special_filter'])) {
			$sql .= " AND ps.product_id = p.product_id";
		}

		if (isset($data['min_price']) && !empty($data['max_price'])) {
			if (!empty($data['config_tax'])) {
				$sql .= " AND ((IF(tp.tax_percent IS NOT NULL, IFNULL(ps.price, p.price) + (IFNULL(ps.price, p.price) * tp.tax_percent / 100) + IFNULL(ta.tax_amount, 0), IFNULL(ps.price, p.price)) * '" . (float)$data['currency_ratio'] . "') BETWEEN '" . (float)$data['min_price'] . "' AND '" . (float)$data['max_price'] . "')";
			} else {
				$sql .= " AND ((IFNULL(ps.price, p.price) * '" . (float)$data['currency_ratio'] . "') BETWEEN '" . (float)$data['min_price'] . "' AND '" . (float)$data['max_price'] . "')";
			}
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

		$implode_products = array();

		foreach ($query->rows as $result) {
			$implode_products[(int)$result['product_id']] = (int)$result['product_id'];
		}

		$count_implode_products = (int)count($implode_products);

		$implode_products_implode = implode("','", $implode_products);

		if ($implode_products) {
			/* todo-materialize Get "stock status" depending on the settings of the "labels" in the admin panel. Otherwise "(SELECT ss.name FROM " . DB_PREFIX . "stock_status ss WHERE ss.stock_status_id = p.stock_status_id AND ss.language_id = '" . (int)$this->config->get('config_language_id') . "') AS stock_status," should not be used in the sql query */
			$sql = "SELECT p.product_id, p.quantity, p.stock_status_id, p.image, p.price, p.tax_class_id, p.subtract, p.minimum, pd.name, pd.description, (SELECT ss.name FROM " . DB_PREFIX . "stock_status ss WHERE ss.stock_status_id = p.stock_status_id AND ss.language_id = '" . (int)$this->config->get('config_language_id') . "') AS stock_status, (SELECT price FROM " . DB_PREFIX . "product_special ps WHERE ps.product_id = p.product_id AND ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) ORDER BY ps.priority ASC, ps.price ASC LIMIT 1) AS special, (SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating, (SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r2 WHERE r2.product_id = p.product_id AND r2.status = '1' GROUP BY r2.product_id) AS reviews FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id IN ('" . $implode_products_implode . "')";

			$sql .= " GROUP BY p.product_id";

			$sort_data = array(
				'pd.name',
				'p.model',
				'p.quantity',
				'p.price',
				'rating',
				'p.sort_order',
				'p.date_added'
			);

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
					$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
				} elseif ($data['sort'] == 'p.price') {
					$sql .= " ORDER BY IFNULL(special, p.price)";
				} else {
					$sql .= " ORDER BY " . $data['sort'];
				}
			} else {
				$sql .= " ORDER BY p.sort_order";
			}

			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC, LCASE(pd.name) DESC";
			} else {
				$sql .= " ASC, LCASE(pd.name) ASC";
			}

			$sql .= " LIMIT " . (int)$count_implode_products;

			$query = $this->db->query($sql);

			return $query->rows;
		} else {
			return false;
		}
	}

	public function getTotalProducts($data = array()) {
		$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) LEFT JOIN (SELECT product_id, price FROM " . DB_PREFIX . "product_special ps WHERE ps.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())) GROUP BY ps.product_id ORDER BY ps.priority ASC, ps.price ASC";

		if (!empty($data['product_special_filter'])) {
			$sql .= " ) AS ps ON (p.product_id = ps.product_id)";
		} else {
			$sql .= " LIMIT 1) AS ps ON (p.product_id = ps.product_id)";
		}

		if (!empty($data['default_filter'])) {
			$sql .= " LEFT JOIN " . DB_PREFIX . "product_filter pf ON (p.product_id = pf.product_id)";
		}

		if (!empty($data['attribute_filter'])) {
			$sql .= " LEFT JOIN " . DB_PREFIX . "product_attribute pa ON (p.product_id = pa.product_id)";
		}

		if (!empty($data['option_filter'])) {
			$sql .= " LEFT JOIN " . DB_PREFIX . "product_option_value pov ON (p.product_id = pov.product_id)";
		}

		if (!empty($data['rating_filter'])) {
			$sql .= " LEFT JOIN (SELECT product_id, AVG(rating) AS rating FROM " . DB_PREFIX . "review WHERE status = '1' GROUP BY product_id) AS r1 ON (p.product_id = r1.product_id)";
		}

		if (!empty($data['review_filter'])) {
			$sql .= " LEFT JOIN " . DB_PREFIX . "review r2 ON (p.product_id = r2.product_id)";
		}

		if (!empty($data['config_tax'])) {
			$sql .= " LEFT JOIN (SELECT tr2.tax_class_id, tr1.rate AS tax_percent FROM " . DB_PREFIX . "tax_rate tr1 INNER JOIN " . DB_PREFIX . "tax_rate_to_customer_group tr2cg ON (tr1.tax_rate_id = tr2cg.tax_rate_id) LEFT JOIN " . DB_PREFIX . "tax_rule tr2 ON (tr1.tax_rate_id = tr2.tax_rate_id) WHERE tr1.type = 'P' AND tr2cg.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' ORDER BY tr2.priority) AS tp ON (p.tax_class_id = tp.tax_class_id) LEFT JOIN (SELECT tr2.tax_class_id, tr1.rate AS tax_amount FROM " . DB_PREFIX . "tax_rate tr1 INNER JOIN " . DB_PREFIX . "tax_rate_to_customer_group tr2cg ON (tr1.tax_rate_id = tr2cg.tax_rate_id) LEFT JOIN " . DB_PREFIX . "tax_rule tr2 ON (tr1.tax_rate_id = tr2.tax_rate_id) WHERE tr1.type = 'F' AND tr2cg.customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "' ORDER BY tr2.priority) AS ta ON (p.tax_class_id = ta.tax_class_id)";
		}

		$sql .= " WHERE p.date_available <= NOW() AND p.status = '1' AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'";

		if (!empty($data['sub_category_filter'])) {
			$sql .= " AND p2c.category_id IN ('" . $data['sub_category_filter'] . "')";
		} else {
			$sql .= " AND p2c.category_id = '" . (int)$data['category_id'] . "'";
		}

		if (!empty($data['default_filter'])) {
			$sql .= " AND pf.filter_id IN ('" . $data['default_filter'] . "')";
		}

		if (!empty($data['attribute_filter'])) {
			$sql .= " AND pa.attribute_id IN ('" . $data['attribute_filter'] . "')";
		}

		if (!empty($data['option_filter'])) {
			$sql .= " AND pov.option_value_id IN ('" . $data['option_filter'] . "')";
		}

		if (!empty($data['manufacturer_filter'])) {
			$sql .= " AND p.manufacturer_id IN ('" . $data['manufacturer_filter'] . "')";
		}

		if (!empty($data['rating_filter'])) {
			$implode = array();

			$sql .= " AND (";

			foreach ($data['rating_filter'] as $rating) {
				$implode[] = "ROUND(r1.rating) = '" . (int)$rating . "'";
			}

			if ($implode) {
				$sql .= " " . implode(" OR ", $implode) . "";
			}

			$sql .= ")";
		}

		if (!empty($data['review_filter'])) {
			$sql .= " AND r2.status = '1'";
		}

		if (!empty($data['stock_status_filter'])) {
			$sql .= " AND ((p.quantity > '0' AND '7' IN('" . $data['stock_status_filter'] . "')) OR (p.quantity <= '0' AND p.stock_status_id IN('" . $data['stock_status_filter'] . "')))";
		}

		if (!empty($data['product_special_filter'])) {
			$sql .= " AND ps.product_id = p.product_id";
		}

		if (isset($data['min_price']) && !empty($data['max_price'])) {
			if (!empty($data['config_tax'])) {
				$sql .= " AND ((IF(tp.tax_percent IS NOT NULL, IFNULL(ps.price, p.price) + (IFNULL(ps.price, p.price) * tp.tax_percent / 100) + IFNULL(ta.tax_amount, 0), IFNULL(ps.price, p.price)) * '" . (float)$data['currency_ratio'] . "') BETWEEN '" . (float)$data['min_price'] . "' AND '" . (float)$data['max_price'] . "')";
			} else {
				$sql .= " AND ((IFNULL(ps.price, p.price) * '" . (float)$data['currency_ratio'] . "') BETWEEN '" . (float)$data['min_price'] . "' AND '" . (float)$data['max_price'] . "')";
			}
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

		return $query->row['total'];
	}
}