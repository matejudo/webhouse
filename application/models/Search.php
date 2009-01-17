<?php
class Search extends Zend_Db_Table
{
	protected $_name = "product";
    protected $session = null;
    protected $session_vars = null;

	public function __construct()
	{
		$this->session =  new SessionLog();
		parent::__construct();
        $this->session_vars = new Zend_Session_Namespace('Default');
	}

	public function query($query)
	{
        //$query = "SELECT p.*, m.manufacturerName as manufacturer FROM product p, manufacturer m WHERE (MATCH(p.productName, p.productDescriptionShort, p.productDescriptionLong) AGAINST ('$query') OR MATCH(m.manufacturerName) AGAINST ('$query'))  AND p.manufacturer_id = m.manufacturer_id";
        $query = "SELECT p.*, m.manufacturerName as manufacturer FROM product p LEFT OUTER JOIN manufacturer m ON p.manufacturer_id = m.manufacturer_id WHERE (MATCH(p.productName, p.productDescriptionShort, p.productDescriptionLong) AGAINST ('$query') OR MATCH(m.manufacturerName) AGAINST ('$query'))";
        $products = $this->getAdapter()->fetchAll($query);
        $this->session_vars->results = $products;
        $this->session_vars->resultcount = count($products);
        return $products;
	}

    public function logSearch($query, $count)
    {
        $query = "INSERT INTO search VALUES (NULL, '".$this->session->getId()."', '$query', $count, 10, '". $this->session->getTime(true) ."')";
        var_dump($query);
        $this->getAdapter()->query($query);
        $this->session_vars->search_id = $this->getAdapter()->lastInsertId();
    }

    public function logClick($product_id, $result_no)
    {
        $query = "INSERT INTO searchdetail VALUES (NULL, ".$this->session_vars->search_id.", $product_id, '". $this->session->getTime(true) ."', $result_no, 1)";
        $this->getAdapter()->query($query);
    }
	
}