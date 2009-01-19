<?php
class Offer extends Zend_Db_Table
{
    protected $_name = "order";
    protected $session = null;

	public function __construct()
	{
		$this->session = new SessionLog();
		parent::__construct();
	}

    public function getOffers()
    {
        $query = "SELECT o.* FROM offer o "
		. "WHERE '". $this->session->getTime(true) ."' BETWEEN o.offerBeginDate AND o.offerEndDate";
        $offers = $this->getAdapter()->fetchAll($query);
        $products = new Product();
        foreach($offers as $offer)
        {
            $query = "SELECT p.*, d.*, m.manufacturerName AS manufacturer FROM offerdetail d LEFT OUTER JOIN product p ON d.product_id = p.product_id LEFT OUTER JOIN manufacturer m ON p.manufacturer_id = m.manufacturer_id WHERE d.offer_id = " . $offer->offer_id;
            $offer->products = $this->getAdapter()->fetchAll($query);
            foreach($offer->products as $product)
            {
                $product->price = $products->getPrice($product->product_id, true);
            }
        }
        return $offers;
    }
}
