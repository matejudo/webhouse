<?php

class Product extends Zend_Db_Table
{
	protected $_name = "product";

	public function getByCategory($category_id)
	{
		$query = "SELECT b.*, COALESCE(a.price, 0) as price, m.manufacturerName as manufacturer FROM price a, product b LEFT OUTER JOIN manufacturer m ON b.manufacturer_id = m.manufacturer_id "
			   . "WHERE a.product_id = b.product_id AND a.priceTime = "
			   . "(SELECT MAX(priceTime) FROM price c WHERE c.product_id = a.product_id)"
			   . " AND b.category_id = $category_id";

		//$query = "SELECT p.*, m.manufacturerName AS manufacturer FROM product p LEFT OUTER JOIN manufacturer m ON p.manufacturer_id = m.manufacturer_id WHERE p.category_id = $category_id";
		return $this->getAdapter()->fetchAll($query);
		//$query = "SELECT * FROM price";
		//$prices
	}

	public function exists($product_id)
	{
		return $this->getAdapter()->query("SELECT COUNT(*) FROM product WHERE product_id = $product_id");
	}

	public function getPrice($product_id)
	{
		$query = "SELECT COALESCE( a.price, 0 ) AS price FROM price a, product b "
			   . "WHERE a.product_id = b.product_id AND a.priceTime = ( "
			   . "SELECT MAX( priceTime ) FROM price c WHERE c.product_id = a.product_id ) "
			   . "AND b.product_id = $product_id";
		return $this->getAdapter()->fetchOne($query);
	}

	public function getById($product_id)
	{
		$query = "SELECT p.*, m.manufacturerName AS manufacturer FROM product p LEFT OUTER JOIN manufacturer m ON p.manufacturer_id = m.manufacturer_id WHERE p.product_id = $product_id";
	}

	/**
	 * F-ja koja generira cijene za sve proizvode
	 */
	public function genprice()
	{
		$query = "SELECT product_id from product";
		$result = $this->getAdapter()->fetchAll($query);

		foreach($result as $item)
		{
			$price = rand(5000, 50000)/100;
			$string = "INSERT INTO price(product_id, price) VALUES ($item->product_id, $price)";

			$this->getAdapter()->query($string);
		}
	}
}
