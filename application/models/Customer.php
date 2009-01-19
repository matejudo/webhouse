<?php
class Customer extends Zend_Db_Table
{
	protected $_name = 'customer';
	protected $session = null;

	public function __construct()
	{
		$this->session = new SessionLog();
		parent::__construct();
	}

    public function isLoggedIn()
    {
        $query = "SELECT customer_id FROM `session` WHERE session_id = '" . $this->session->getId() . "'";
        if($this->getAdapter()->fetchOne($query) === NULL)
            return false;
        else
           return true;
    }

    public function getId()
    {
        $query = "SELECT customer_id FROM `session` WHERE session_id = '" . $this->session->getId() . "'";
        return $this->getAdapter()->fetchOne($query);
    }

    public function getCustomer()
    {
        if(!$this->isLoggedIn()) return NULL;
        return $this->fetchRow("customer_id = " . $this->getId());
    }

    public function getAllCustomers()
    {
        $query = "SELECT c.*, COALESCE(SUM(o.orderFinished),0) AS orderCount FROM ((customer c LEFT OUTER JOIN session s ON c.customer_id = s.customer_id) LEFT OUTER JOIN `order` o ON o.session_id = s.session_id) GROUP BY c.customer_id";
        $results = $this->getAdapter()->fetchAll($query);
		foreach($results as $result)
		{
			$result->countryCode = $this->getCountry($result->customer_id);
		}
		return $results;
    }

	public function getCountry($customer_id)
	{
		$query = "SELECT countryCode FROM address WHERE customer_id = $customer_id LIMIT 1";
		return $this->getAdapter()->fetchOne($query);
	}

    public function getAddresses()
    {
        $query = "SELECT a.*, c.countryName, city.cityName FROM address a, country c, city WHERE a.countryCode = c.countryCode AND a.countryCode = city.countryCode AND a.zipCode = city.zipCode AND customer_id = " . $this->getId();
        return $this->getAdapter()->fetchAll($query);
    }

	public function genAddresses($add = false)
	{
		$countries = array("HR", "IT", "CH");
		$cities["HR"] = array(10000,10410,21000,31000,20000,51000,42000);
		$cities["IT"] = array(10100,20100,00121,20500,40700);
		$cities["CH"] = array(8000,6000,3000,1000,4000,6370,6900);
		$streets["HR"] = array("Zagrebačka", "Splitska", "Ulica Bana Jelacica", "Maksimirska", "Riječka", "Trg Hrv. velikana", "Varšavska", "Bečka", "Rimska", "Ženevska", "Ulica Jacka Bauera", "Ulica Gospodara Prstenova", "Bukovačka");
		$streets["CH"] = array("Bahnhofstrasse", "Hauptstrasse", "Zürcherstrasse", "Bernerstrasse", "Unterstrasse", "Oberstrasse", "Am Hof", "Genferstrasse", "Pilatusstrasse", "Hertensteinstrasse", "Wirzboden", "Schmidgasse", "Führerstrasse");
		$streets["IT"] = array("Via Zazzera", "Via Baciadonne", "Vicolo sdrucciolo", "Chiasso delle Zingare", "Viccolo dell Amore", "Via del Bacio", "Via Buia", "Vicolo uomo selvatico", "Via Venti Settembre", "Via Ventiquattro Maggio", "Via Ventisette Aprile");

		if($add == false)
		{
			for($i=0; $i<80; $i++)
			{
				$country = $countries[rand(0, count($countries)-1)];
				$city = $cities[$country][rand(0, count($cities[$country])-1)];
				$street = $streets[$country][rand(0, count($streets[$country])-1)] . " " . rand(1, 200);
				$query = "INSERT INTO address VALUES (NULL, $i, '$street', $city, '$country', 1)";
				$this->getAdapter()->query($query);
				echo $query."<br>";
			}
			die();
		}
		else
		{
			$addresses = $this->getAdapter()->fetchAll("SELECT * FROM address");
			foreach($addresses as $address)
			{
				if(rand(0,100) > 50)
				{
					$country = $address->countryCode;
					$city = $cities[$country][rand(0, count($cities[$country])-1)];
					$street = $streets[$country][rand(0, count($streets[$country])-1)] . " " . rand(1, 200);
					$query = "INSERT INTO address VALUES (NULL, $address->customer_id, '$street', $city, '$country', 0)";
					$this->getAdapter()->query($query);
					echo $query."<br>";
				}
			}
		}
	}
    
}