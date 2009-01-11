<?php

class Category extends Zend_Db_Table
{
	protected $_name = "category";

	public function getTree($id = NULL)
	{
		if($id === NULL)
			$query = "SELECT * FROM category WHERE parent_id IS NULL";
		else
			$query = "SELECT * FROM category WHERE parent_id = $id";
		$result = $this->getAdapter()->fetchAll($query);

		$query = "SELECT category_id, COUNT(*) FROM product GROUP BY 1";
		$count = $this->getAdapter()->fetchPairs($query);
		//$count = $this->getAdapter()->fetchAll($query);

		foreach($result as $item)
		{
			$item->count = $count[$item->category_id];
			$item->children = $this->getTree($item->category_id);
		}
		return $result;
	}

	public function add($name, $parent = NULL)
	{
		if($parent === NULL) $parent = "NULL";
		$query = "INSERT INTO category(name, parent_id) VALUES ('$name', $parent)";
		return $this->getAdapter()->query($query);
	}

	public function delete($id)
	{
		$id = $this->getAdapter()->quote($id, "INT");
		return parent::delete("category_id = $id");

	}
}

