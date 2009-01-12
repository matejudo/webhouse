<?php

class CartController extends Zend_Controller_Action
{
	private $session = NULL;

	function init()
	{
		$this->view->baseUrl = $this->_request->getBaseUrl();
		$response = $this->getResponse();
		$response->insert('sidebar', $this->view->render('product/sidebar.phtml'));
		$this->session = new SessionLog();
	}

	function indexAction()
	{
		$cart = new Cart();
		$this->view->products = $cart->getProducts();
	}

	function setAction()
	{
		if($this->getRequest()->isGet())
		{
			$product_id = $this->_getParam("id", NULL);
			$amount = $this->_getParam("amount", NULL);
			if($product_id !== NULL && $amount !== NULL)
			{
				$cart = new Cart();
				$cart->set($product_id, $amount);
			}
		}
		elseif($this->getRequest()->isPost())
		{
			$params = $this->_getAllParams();
			$cart = new Cart();
			foreach($params["amount"] as $product_id => $amount)
			{
				
				if(is_numeric($amount) && $amount >= 0)
				{
					$cart->set($product_id, $amount);
				}
			}
		}
//		$this->renderScript("index/index.phtml");
		$this->_redirect("/cart");
	}

	function addAction()
	{
		$product_id = $this->_getParam("id", NULL);
		$amount = $this->_getParam("amount", 1);
		$product = new Product();
		if($product_id !== NULL && $amount !== NULL)
		{
			$cart = new Cart();
			$cart->add($product_id, $amount);
		}
		$this->_redirect("/cart");
	}
}