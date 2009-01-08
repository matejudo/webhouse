<?php

class Admin_CategoryController extends Zend_Controller_Action
{

	protected $_flashMessenger = null;

	function init()
	{
		$this->view->baseUrl = $this->_request->getBaseUrl();
		$this->_flashMessenger = $this->_helper->getHelper('FlashMessenger');
	}

	function indexAction()
	{
		$this->view->messages = $this->_flashMessenger->getMessages();
		$category = new Category();
		$this->view->catTree = $category->getTree();
	}

	function addAction()
	{
		if($this->getRequest()->isPost())
		{
			$catname = $this->getRequest()->getParam("catname");
			$parentcat = $this->getRequest()->getParam("parentcat");

			if($catname == "" || $parentcat == "")
			{
				$this->_flashMessenger->addMessage("Greška: Nisu navedeni svi potrebni podaci.");
				$this->_redirect("/admin/category/");
			}

			$category = new Category();

			if($parentcat == -1)
			{
				// Dodajemo novu glavnu kategoriju
				$category->add($catname);
			}
			else
			{
				// Dodajemo novu podkategoriju
				$category->add($catname, $parentcat);
			}
			$this->_flashMessenger->addMessage("Kategorija $catname dodana.");
			$this->_redirect("/admin/category/");
		}
		$this->_flashMessenger->addMessage("Nepoznata greška.");
		$this->_redirect("/admin/category/");
	}

	function deleteAction()
	{
		if($this->getRequest()->isGet())
		{
			$id = $this->getRequest()->getParam("id", "-1");
			$category = new Category();
			if($category->delete($id))
			{
				$this->_flashMessenger->addMessage("Kategorija s id=$id uspješno izbrisana.");
			}
			else
			{
				$this->_flashMessenger->addMessage("Kategorija s id=$id ne postoji.");
			}
		}
		
		$this->_redirect("/admin/category/");
	}
}
