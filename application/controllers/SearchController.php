<?php

class SearchController extends Zend_Controller_Action 
{	
	public function init()
	{
		$this->view->baseUrl = $this->_request->getBaseUrl();
	}
	
	public function indexAction()
	{
		$query = $this->_request->getParam("query", "");
		$search = new Search();
		$this->view->results = $search->query($query);
	}
}