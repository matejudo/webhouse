<?php

class Admin_IndexController extends Zend_Controller_Action 
{
	function init()
	{
		$this->view->baseUrl = $this->_request->getBaseUrl(); 
	}
	
	function indexAction()
	{
		
	}
}