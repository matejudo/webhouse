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
			$query = "INSERT INTO `order` VALUES (NULL, '" . $this->session->getId() . "', NULL, NULL)";
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
		$query = "SELECT p.*, m.manufacturerName AS manufacturer, SUM(orderdetailDelta) AS amount "
			   . "FROM `orderdetail` d LEFT OUTER JOIN product p ON d.product_id = p.product_id, `order` o, manufacturer m "
			   . "WHERE d.order_id = o.order_id AND o.session_id = '" . $this->session->getId() . "' AND p.manufacturer_id = m.manufacturer_id "
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



	public function getCart()
	{
		return $this->fetchRow("session_id = '".$this->session->getId()."'");
	}


	public function set($product_id, $amount)
	{
		$delta = $amount - $this->calcAmount($product_id);
		if($delta != 0)
		{
			$query = "INSERT INTO orderdetail VALUES (NULL, '".$this->getCart()->order_id."', $product_id, $delta, NULL)";
			$this->getAdapter()->query($query);
		}
	}

	public function add($product_id, $amount)
	{
		$delta = $amount;
		if($delta != 0)
		{
			$query = "INSERT INTO orderdetail VALUES (NULL, '".$this->getCart()->order_id."', $product_id, $delta, NULL)";
			$this->getAdapter()->query($query);
		}
	}

}