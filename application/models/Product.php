<?php

class Product extends Zend_Db_Table
{
	protected $_name = "product";

	public function getByCategory($category_id)
	{
		$query = "SELECT p.*, m.manufacturerName AS manufacturer FROM product p LEFT OUTER JOIN manufacturer m ON p.manufacturer_id = m.manufacturer_id WHERE p.category_id = $category_id";
		return $this->getAdapter()->fetchAll($query);
	}
}
