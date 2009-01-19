<?php

class Product extends Zend_Db_Table
{
	protected $_name = "product";
	protected $session = NULL;

	public function __construct()
	{
		$this->session =  new SessionLog();
		parent::__construct();
	}

	public function getByCategory($category_id)
	{
		$query = "SELECT p.*, m.manufacturerName as manufacturer FROM product p LEFT OUTER JOIN manufacturer m ON p.manufacturer_id = m.manufacturer_id "
			   . "WHERE p.category_id = $category_id";

		$products = $this->getAdapter()->fetchAll($query);
		$query = "";
        foreach($products as $product)
        {
            $product->price = $this->getPrice($product->product_id, true);
			$product->sex = $this->getSex($product->product_id);
        }
        return $products;
	}

	public function exists($product_id)
	{
		return $this->getAdapter()->query("SELECT COUNT(*) FROM product WHERE product_id = $product_id");
	}

	public function getSex($product_id)
	{
		$query = "SELECT attributeValue FROM `attribute` WHERE attributetype_id = 1943 AND product_id = $product_id";
		return $this->getAdapter()->fetchOne($query);
	}

	public function getPrice($product_id, $object = false)
	{
		$timestamp = $this->session->getTime(true);
        $query = "SELECT * FROM price WHERE product_id = $product_id AND priceTime < '$timestamp' ORDER BY priceTime DESC LIMIT 1";
		$price = $this->getAdapter()->fetchRow($query);
        if($price->discount_id !== NULL)
        {
            $query = "SELECT * FROM discount WHERE discount_id = $price->discount_id AND '$timestamp' > discountBeginDate AND  '$timestamp' < discountEndDate";
            $price->discount = $this->getAdapter()->fetchRow($query);
            $price->finalPrice = $price->price * $price->discount->discountFactor;
        }
        else
        {
            $price->finalPrice = $price->price;
        }
        if(!$object)
        {
            if(!is_numeric($price->discount->discountFactor) || $price->discount->discountFactor < 0 || $price->discount->discountFactor > 1)
            {
                $price->discount->discountFactor = 1;
            }
            return $price->price * $price->discount->discountFactor;
        }
        return $price;
	}

	public function getById($product_id)
	{
		$query = "SELECT p.*, m.manufacturerName AS manufacturer FROM product p "
			   . "LEFT OUTER JOIN manufacturer m ON p.manufacturer_id = "
			   . "m.manufacturer_id WHERE p.product_id = $product_id";
        $product = $this->getAdapter()->fetchRow($query);
        $product->price = $this->getPrice($product_id, true);
        $product->attributes = $this->getAttributes($product_id);
        return $product;
	}

    public function getAttributes($product_id)
    {
        $query = "SELECT t.attributeTypeName AS name, a.attributeValue AS value FROM attribute a, attributetype t WHERE a.attributetype_id = t.attributetype_id AND product_id = $product_id";
        return $this->getAdapter()->fetchAll($query);
    }

    public function isPackage($product_id)
    {
        $query = "SELECT COUNT(*) FROM package WHERE parentproduct_id = $product_id";
        return $this->getAdapter()->fetchOne($query);
    }

    public function getPackageProducts($parent_id)
    {
        $query = "SELECT pack.packageAmount AS amount, p.*, m.manufacturerName as manufacturer FROM package pack, product p LEFT OUTER JOIN manufacturer m ON p.manufacturer_id = m.manufacturer_id "
			   . "WHERE pack.parentproduct_id = $parent_id AND p.product_id = pack.childproduct_id";
        $products = $this->getAdapter()->fetchAll($query);

        foreach($products as $product)
        {
            $product->price = $this->getPrice($product->product_id, true);

        }
        return $products;
    }

    public function getPackageSumPrice($parent_id)
    {
        $products = $this->getPackageProducts($parent_id);
        $sum = 0;
        foreach($products as $product)
        {
            $sum += $product->price->finalPrice * $product->amount;
        }
        return $sum;
    }

	public function getTopProducts($number)
	{
		$query = "SELECT product_id, SUM(orderdetailDelta) FROM orderdetail GROUP BY product_id ORDER BY 2 DESC LIMIT 0, $number";
		$results = $this->getAdapter()->fetchAll($query);

		foreach($results as $result)
		{
			$result->product = $this->getById($result->product_id);
		}
		return $results;
	}

	/**
	 * F-ja koja generira cijene za sve proizvode
	 */
	public function genprice($start, $end, $all = true)
	{


		$session = new SessionLog();
		$prices = $this->getAdapter()->fetchAll("SELECT * FROM price GROUP BY product_id");
		foreach($prices as $price)
		{
			$factor = rand(76, 123)/100;
			$rand = rand($start, $end);
			$this->getAdapter()->query("INSERT INTO price VALUES(NULL, $price->product_id, NULL, $price->price * $factor, '2008-01-01 00:00:00')"); //this->getAdapter()->
			//
			
			//echo "update price set priceTime = '" . $session->timeP2M($rand) . "' WHERE price_id = " . $price->price_id . "<br>"; //this->getAdapter()->
		}


		// *********************************************************************************
//		$session = new SessionLog();
//		$prices = $this->getAdapter()->fetchAll("SELECT * FROM price");
//		foreach($prices as $price)
//		{
//			$rand = rand($start, $end);
//			$this->getAdapter()->query("update price set priceTime = '" . $session->timeP2M($rand) . "' WHERE price_id = " . $price->price_id); //this->getAdapter()->
//			//echo "update price set priceTime = '" . $session->timeP2M($rand) . "' WHERE price_id = " . $price->price_id . "<br>"; //this->getAdapter()->
//		}
		// *********************************************************************************
		/*
		$query = "SELECT product_id from product";
		$result = $this->getAdapter()->fetchAll($query);

		foreach($result as $item)
		{
			$price = rand(5000, 50000)/100;
			$string = "INSERT INTO price(product_id, price) VALUES ($item->product_id, $price)";

			$this->getAdapter()->query($string);
		}
		 * */

	}
}
