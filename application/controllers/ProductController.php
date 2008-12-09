<?php

class ProductController extends Zend_Controller_Action 
{
	
	public function init()
	{
		$this->view->baseUrl = $this->_request->getBaseUrl();
	}
	
	public function indexAction()
	{
		
	}
	
	public function viewAction()
	{
		$log = new SessionLog();
		$log->logAction("product", "view", $this->_request->getParam("id"));
		
		
		$this->view->actions = $log->getActions();
	}
}