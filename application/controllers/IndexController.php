<?php

class IndexController extends Zend_Controller_Action
{
	
	function init()
	{
		$this->view->baseUrl = $this->_request->getBaseUrl();	

	}
	
	
	function indexAction()
	{

	}
	
	function omgAction()
	{
		$this->renderScript("index/index.phtml");
		$countries = array();
		echo "<p>";
		echo "lool";
		echo "</p>";
	}
}