<?php
class Search extends Zend_Db_Table
{
	
	public function query($query)
	{
		return $this->getAdapter()->fetchAll("SELECT *, MATCH (name, description_short, description_long) AGAINST ('$query') AS score FROM product WHERE MATCH (name, description_short, description_long) AGAINST ('$query')");
	}
	
}