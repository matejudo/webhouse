<?php
class Cart extends Zend_Db_Table
{
	protected $_name = "order";
	protected $session = null;

	public function __construct()
	{
		$this->session = new SessionLog();
		parent::__construct();
		$this->createCart();
	}
	
	public function createCart()
	{
		if(!$this->exists())
		{
			$query = "INSERT INTO `order` VALUES (NULL, '" . $this->session->getId() . "', NULL, NULL, 0)";
			$this->getAdapter()->query($query);
		}
	}

	public function exists()
	{
		if($this->fetchRow("session_id = '" . $this->session->getId() . "'") == NULL)
			return false;
		return true;
	}

	public function getProducts()
	{
//		$query = "SELECT p.*, m.manufacturerName AS manufacturer, SUM(orderdetailDelta) AS amount "
//			   . "FROM `orderdetail` d LEFT OUTER JOIN product p ON d.product_id = p.product_id, `order` o, manufacturer m "
//			   . "WHERE d.order_id = o.order_id AND o.session_id = '" . $this->session->getId() . "' AND p.manufacturer_id = m.manufacturer_id "
//			   . "GROUP BY p.product_id";
        $query = "SELECT p.*, m.manufacturerName AS manufacturer, SUM(orderdetailDelta) AS amount "
               . "FROM `order` o, (`orderdetail` d LEFT OUTER JOIN product p ON d.product_id = p.product_id) "
                . "LEFT OUTER JOIN manufacturer m ON p.manufacturer_id = m.manufacturer_id "
                . "WHERE d.order_id = o.order_id AND o.session_id = '" . $this->session->getId() . "' "
                . "GROUP BY p.product_id";
		$results = $this->getAdapter()->fetchAll($query);
		$product = new Product();
		foreach($results as $item)
		{
			$item->price = $product->getPrice($item->product_id);
			$item->total = $item->price * $item->amount;
		}
		return $results;
	}

	/**
	 * Funkcija koja racuna broj artikala u košarici za trazeni product_id
	 *
	 * @param int $product_id
	 */
	public function calcAmount($product_id = NULL)
	{
		if($product_id !== NULL)
		{
			$query = "SELECT COALESCE(SUM(d.orderdetailDelta),0) AS amount FROM `order` o LEFT OUTER JOIN orderdetail d ON o.order_id = d.order_id "
				   . "WHERE o.session_id = '" . $this->session->getId() . "' AND d.product_id = $product_id";
		}
		else
		{
			$query = "SELECT COALESCE(SUM(d.orderdetailDelta),0) AS amount FROM `order` o LEFT OUTER JOIN orderdetail d ON o.order_id = d.order_id "
				   . "WHERE o.session_id = '" . $this->session->getId() . "'";
		}
		return $this->getAdapter()->fetchOne($query);
	}

    public function getTotal()
    {
        $products = $this->getProducts();
        $total = 0;
        foreach($products as $product)
        {
            $total += $product->total;
        }
        return  number_format($total, 2, ",", ".");
    }



	public function getCart()
	{
		return $this->fetchRow("session_id = '".$this->session->getId()."'");
	}


	public function set($product_id, $amount)
	{
		$delta = $amount - $this->calcAmount($product_id);
		if($delta != 0)
		{
            $query = "INSERT INTO orderdetail VALUES (NULL, '".$this->getCart()->order_id."', $product_id, $delta, '".$this->session->getTime(true)."')";
			$this->getAdapter()->query($query);
		}
	}

	public function add($product_id, $amount)
	{
		$delta = $amount;
		if($delta != 0)
		{
			$query = "INSERT INTO orderdetail VALUES (NULL, '".$this->getCart()->order_id."', $product_id, $delta, '".$this->session->getTime(true)."')";
			$this->getAdapter()->query($query);
		}
	}

    public function setAddress($address_id)
    {
        $query = "UPDATE `order` SET orderShippingaddress_id = $address_id WHERE session_id = '" . $this->session->getId() . "'";
        $this->getAdapter()->query($query);
    }

    public function finishUp()
    {
        $query = "UPDATE `order` SET orderFinished = 1 WHERE session_id = '" . $this->session->getId() . "'";
        $this->getAdapter()->query($query);
    }

}