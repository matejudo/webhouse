<?php
class SessionLog extends Zend_Db_Table
{
	protected $_name = 'session';	
	protected $session_id = null;
	
	public function __construct()
	{
		$this->session_id = Zend_Session::getId();
		parent::__construct();
		$this->createSession();
	}
	
	public function exists()
	{
		if($this->fetchRow("session_id = '$this->session_id'") == NULL)
			return false;
		return true;
	}

	public function getId()
	{
		return Zend_Session::getId();
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
	
	public function logAction($class, $action, $target = NULL, $info = null) 
	{
		if(!$this->exists($this->session_id))
			$this->createSession();			
		$data = array(
			"session_id" => $this->session_id,
			"class" => $class,
			"action" => $action,
			"target" => $target,
			"info" => $info
		);
		$this->getAdapter()->insert("action", $data);
	}

	public function logCategory($category_id)
	{
		$data = array(
			"session_id" => $this->session_id,
			"category_id" => $category_id
		);
		$this->getAdapter()->insert("categoryview", $data);
	}
	
	public function getActions()
	{
		return $this->getAdapter()->fetchAll("SELECT * FROM action WHERE session_id = '$this->session_id'");
	}
}