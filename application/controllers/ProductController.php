<?php

class ProductController extends Zend_Controller_Action 
{
	private $session = NULL;

	public function init()
	{
		$this->view->baseUrl = $this->_request->getBaseUrl();
		$response = $this->getResponse();
		$response->insert('sidebar', $this->view->render('product/sidebar.phtml'));
		$this->session = new SessionLog();
	}
	
	public function indexAction()
	{
		$category = new Category();
		$this->view->categories = $category->getTree();
	}
	
	function categoryAction()
	{
		$category_id = $this->_request->getParam("id", NULL);
		if($category_id === NULL)
		{
			$this->_forward("index");
		}
		$category = new Category();
		$this->view->category = $category->getById($category_id);
				
		$this->session->logCategory($category_id);
		$product = new Product();
		$this->view->products = $product->getByCategory($category_id);
	}
}