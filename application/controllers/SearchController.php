<?php

class SearchController extends Zend_Controller_Action 
{
    private $session = NULL;
    protected $session_vars = null;
    
	public function init()
	{
		$this->view->baseUrl = $this->_request->getBaseUrl();
		$response = $this->getResponse();
		$response->insert('sidebar', $this->view->render('product/sidebar.phtml'));
		$this->session = new SessionLog();
        $this->session_vars = new Zend_Session_Namespace('Default');
	}
	
	public function queryAction()
	{
		$query = $this->_request->getParam("query", "");
		$search = new Search();
        $search->query($query);
        $search->logSearch($query, $this->session_vars->resultcount);
        $this->_redirect("search/view/page/1");
	}

    public function viewAction()
    {
        $this->view->page = $page = $this->_getParam("page", 1);
        $results = $this->session_vars->results;
        $this->view->count = $this->session_vars->resultcount;

        $this->view->paginator = Zend_Paginator::factory($results);
        $this->view->paginator->setCurrentPageNumber($page);

        //var_dump($results);
        $this->view->results = array();
        for($i = ($page-1)*10; $i < ($page)*10; $i++)
        {
            if($i >= count($results)) break;
            array_push($this->view->results, $results[$i]);
        }
        if($page > 1) $this->view->prevpage = $page-1;
        else $this->view->prevpage = NULL;

        if($this->session_vars->resultcount > $page*10) $this->view->nextpage = $page+1;
        else $this->view->nextpage = NULL;
    }

    public function clickAction()
    {
        $search = new Search();
        $search->logClick($this->_getParam("id"), $this->_getParam("no"));
        $this->_redirect("product/view/id/" . ($this->_getParam("id")));
    }
}