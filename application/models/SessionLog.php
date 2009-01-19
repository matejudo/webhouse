<?php
class SessionLog extends Zend_Db_Table
{
	protected $_name = 'session';	
	protected $session_id = null;
    protected $session_vars = NULL;
	
	public function __construct()
	{
		$this->session_id = Zend_Session::getId();
		parent::__construct();
		$this->createSession();
        $this->session_vars = new Zend_Session_Namespace('Default');
	}
	
	public function exists()
	{
		if($this->fetchRow("session_id = '$this->session_id'") == NULL)
			return false;
		return true;
	}

    public function login($customer_id, $time)
    {
        if($time === NULL)
            $time = time();
        $this->session_vars->timediff = time() - $time;
        $query = "UPDATE session SET customer_id = $customer_id WHERE session_id = '" . $this->getId()  . "'";
        $this->getAdapter()->query($query);
        $this->recalcTimes();
    }

    public function logout()
    {
        Zend_Session::destroy(true, true);
    }

    public function reset()
    {
        $customer_id = $this->getAdapter()->fetchOne("SELECT customer_id FROM session WHERE session_id = '" . $this->session_id . "'");
        Zend_Session::destroy(true, true);
        $this->createSession($customer_id);
    }

	public function getId()
	{
		return Zend_Session::getId();
	}

    public function timeM2P($mysqldate)
    {
        return strtotime( $mysqldate );
    }

    public function timeP2M($phpdate)
    {
        return date( 'Y-m-d H:i:s', $phpdate );
    }

    public function getTime($mysqlFormat = false)
    {
        $timediff = ($this->session_vars->timediff !== NULL) ?  $this->session_vars->timediff : 0;
        if($mysqlFormat)
        {
            return $this->timeP2M(time() - $timediff);
        }
        else
        {
            return time() - $timediff;
        }
    }

    public function recalcTimes()
    {
        $timediff = ($this->session_vars->timediff !== NULL) ?  $this->session_vars->timediff : 0;
        $query = "UPDATE categoryview SET categoryviewTime = FROM_UNIXTIME(UNIX_TIMESTAMP(categoryviewTime)-($timediff)) WHERE session_id = '$this->session_id';";
        $this->getAdapter()->query($query);
        $query = "UPDATE productview  SET productviewTime = FROM_UNIXTIME(UNIX_TIMESTAMP(productviewTime)-($timediff)) WHERE session_id = '$this->session_id';";
        $this->getAdapter()->query($query);
        $query = "UPDATE search SET searchTime = FROM_UNIXTIME(UNIX_TIMESTAMP(searchTime)-($timediff)) WHERE session_id = '$this->session_id';";
        $this->getAdapter()->query($query);
        $query = "UPDATE searchdetail SET searchdetailTime = FROM_UNIXTIME(UNIX_TIMESTAMP(searchdetailTime)-($timediff)) WHERE search_id IN (SELECT search_id FROM search WHERE session_id = '$this->session_id')";
        $this->getAdapter()->query($query);
        $query = "SELECT order_id FROM `order` WHERE session_id = '$this->session_id';";
        $order_id = $this->getAdapter()->fetchOne($query);
        $query = "UPDATE orderdetail SET orderdetailTime = FROM_UNIXTIME(UNIX_TIMESTAMP(orderdetailTime)-($timediff)) WHERE order_id = $order_id;";
        $this->getAdapter()->query($query);
    }

	
	/**
	 * Creates a new session in the database for the current session id 
	 *
	 * @param integer $customer_id - adds the customer id if the user is logged in
	 * @return true if the session has been created, false otherwise
	 */
	protected function createSession($customer_id = NULL)
	{
		if(!$this->exists())
		{
			$this->insert(array("session_id" => $this->session_id, "customer_id" => $customer_id));
		}
	}

	public function logCategory($category_id)
	{
		$data = array(
			"session_id" => $this->session_id,
			"category_id" => $category_id,
            "categoryviewTime" => $this->timeP2M($this->getTime())
		);
		$this->getAdapter()->insert("categoryview", $data);
	}

	public function logProduct($product_id)
	{
		$data = array(
			"session_id" => $this->session_id,
			"product_id" => $product_id,
            "productviewTime" => $this->timeP2M($this->getTime())
		);
		$this->getAdapter()->insert("productview", $data);
	}
}
