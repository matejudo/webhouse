<?php
class Customer extends Zend_Db_Table
{
	protected $_name = 'customer';
	protected $session = null;

	public function __construct()
	{
		$this->session = new SessionLog();
		parent::__construct();
	}

    public function isLoggedIn()
    {
        $query = "SELECT customer_id FROM `session` WHERE session_id = '" . $this->session->getId() . "'";
        if($this->getAdapter()->fetchOne($query) === NULL)
            return false;
        else
           return true;
    }

    public function getId()
    {
        $query = "SELECT customer_id FROM `session` WHERE session_id = '" . $this->session->getId() . "'";
        return $this->getAdapter()->fetchOne($query);
    }

    public function getCustomer()
    {
        if(!$this->isLoggedIn()) return NULL;
        return $this->fetchRow("customer_id = " . $this->getId());
    }

    public function getAllCustomers()
    {
        $query = "SELECT c.*, COALESCE(SUM(o.orderFinished),0) AS orderCount FROM ((customer c LEFT OUTER JOIN session s ON c.customer_id = s.customer_id) LEFT OUTER JOIN `order` o ON o.session_id = s.session_id) GROUP BY c.customer_id";
        return $this->getAdapter()->fetchAll($query);
    }

    public function getAddresses()
    {
        $query = "SELECT a.*, c.countryName, city.cityName FROM address a, country c, city WHERE a.countryCode = c.countryCode AND a.countryCode = city.countryCode AND a.zipCode = city.zipCode AND customer_id = " . $this->getId();
        return $this->getAdapter()->fetchAll($query);
    }
    
}