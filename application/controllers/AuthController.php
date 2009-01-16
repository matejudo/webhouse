<?php

class AuthController extends Zend_Controller_Action
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
        $customer = new Customer();
        $this->view->customers = $customer->getAllCustomers();
    }

    function loginAction()
    {
        $customer_id = $this->_getParam("customer_id", NULL);
        $year = $this->_getParam("year", NULL);
        $month = $this->_getParam("month", NULL);
        $day = $this->_getParam("day", NULL);
        $hour = $this->_getParam("hour", NULL);
        $minutes = date("i");
        $seconds = date("s");
        $time = strtotime( $year . "-" . $month . "-" . $day . " " . $hour . ":" . $minutes . ":" . $seconds );
        //var_dump($time);
        $this->session->login($customer_id, $time);
        //$this->renderScript("index/index.phtml");
        $this->_redirect("/product/category");
    }

    function logoutAction()
    {
        $this->session->logout();
        $this->_redirect("/product/category");
    }
}