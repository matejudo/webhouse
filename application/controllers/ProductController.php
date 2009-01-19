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

	}
	
	function categoryAction()
	{
		$category_id = $this->_request->getParam("id", NULL);
		$category = new Category();
		$this->view->category = $category->getById($category_id);
       	if($this->view->category === NULL)
		{
			$this->_forward("offer");
            return;
		}
        else
        {
            $this->session->logCategory($category_id);
            $product = new Product();
            $this->view->products = $product->getByCategory($category_id);
        }
	}

    function offerAction()
    {
        $offers = new Offer();
        $this->view->offers = $offers->getOffers();
		$products = new Product();
		$this->view->topprod = $products->getTopProducts(5);
		$customer = new Customer();
		
//		echo $this->session->timeM2P("2008-09-15 00:00:00");
//		echo " - ";
//		echo $this->session->timeM2P("2009-01-17 08:00:00");
//		$products = new Product();
		//$products->genprice($this->session->timeM2P("2008-09-15 00:00:00"), $this->session->timeM2P("2009-01-17 08:00:00"));
    }

    function viewAction()
    {
        $product_id = $this->_request->getParam("id", NULL);
        $product = new Product();
        $this->session->logProduct($product_id);
        $this->view->product = $product->getById($product_id);
        if($product->isPackage($product_id))
        {            
            $this->view->product->package = $product->getPackageProducts($product_id);
            $this->view->product->sumprice = $product->getPackageSumPrice($product_id);
            $this->view->product->save = $product->getPackageSumPrice($product_id) - $this->view->product->price->finalPrice;
        }
    }
}