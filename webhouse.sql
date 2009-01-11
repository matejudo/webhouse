-- phpMyAdmin SQL Dump
-- version 2.11.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 11, 2009 at 11:38 AM
-- Server version: 5.0.67
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `webhouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int(11) NOT NULL auto_increment,
  `customer_id` int(11) NOT NULL,
  `addressStreet` varchar(250) collate utf8_unicode_ci NOT NULL,
  `zipCode` varchar(5) collate utf8_unicode_ci NOT NULL,
  `countryCode` varchar(2) collate utf8_unicode_ci NOT NULL,
  `addressDefault` tinyint(1) NOT NULL,
  PRIMARY KEY  (`address_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `address`
--


-- --------------------------------------------------------

--
-- Table structure for table `attribute`
--

CREATE TABLE IF NOT EXISTS `attribute` (
  `product_id` int(11) NOT NULL,
  `attributetype_id` int(11) NOT NULL,
  `attributeValue` varchar(50) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`product_id`,`attributetype_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attribute`
--


-- --------------------------------------------------------

--
-- Table structure for table `attributetype`
--

CREATE TABLE IF NOT EXISTS `attributetype` (
  `attributetype_id` int(11) NOT NULL auto_increment,
  `attributetypeName` varchar(50) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`attributetype_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `attributetype`
--


-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) default NULL,
  `categoryName` varchar(250) collate utf8_unicode_ci NOT NULL,
  `categoryOrdering` int(10) unsigned NOT NULL default '0',
  `categoryDescription` text collate utf8_unicode_ci NOT NULL,
  `categoryThumbnail` varchar(250) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1319 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `parent_id`, `categoryName`, `categoryOrdering`, `categoryDescription`, `categoryThumbnail`) VALUES
(1269, NULL, 'Kozmetika za njegu koze', 0, '', ''),
(1270, 1269, 'Kreme za lice', 0, '', ''),
(1271, 1269, 'Proizvodi za ciscenje lica', 0, '', ''),
(1272, 1271, 'Tonik za ciscenje lica', 0, '', ''),
(1273, 1271, 'Mlijeko za ciscenje lica', 0, '', ''),
(1274, 1271, 'Gel za ciscenje lica', 0, '', ''),
(1275, 1271, 'Ostali proizvodi za ciscenje lica', 0, '', ''),
(1276, 1269, 'Proizvodi za skidanje sminke', 0, '', ''),
(1277, 1269, 'Piling', 0, '', ''),
(1278, NULL, 'Kozmetika za njegu kose', 0, '', ''),
(1279, 1278, 'Sampon za kosu', 0, '', ''),
(1280, 1278, 'Regenerator', 0, '', ''),
(1281, 1278, 'Maska', 0, '', ''),
(1282, 1278, 'Gelovi', 0, '', ''),
(1283, 1278, 'Proizvodi za bojanje kose', 0, '', ''),
(1284, NULL, 'Kozmetika za njegu zubi', 0, '', ''),
(1285, 1284, 'Zubne paste', 0, '', ''),
(1286, 1284, 'Cetkice', 0, '', ''),
(1287, 1284, 'Zubni konac', 0, '', ''),
(1288, NULL, 'Kozmetika za depiliranje/brijanje', 0, '', ''),
(1289, 1288, 'Depilacijske kreme', 0, '', ''),
(1290, 1288, 'Vosak', 0, '', ''),
(1291, 1288, 'Pjena/Gel', 0, '', ''),
(1292, 1288, 'Britvice', 0, '', ''),
(1293, 1288, 'Sredstva nakon depiliranja/ brijanja', 0, '', ''),
(1294, 1288, 'Depilacijske trake za tijelo', 0, '', ''),
(1295, 1288, 'Depilacijske trake za bikini zonu', 0, '', ''),
(1296, NULL, 'Dekorativna kozmetika', 0, '', ''),
(1297, 1296, 'Make up za oci', 0, '', ''),
(1298, 1297, 'Maskara', 0, '', ''),
(1299, 1297, 'Sjenilo', 0, '', ''),
(1300, 1297, 'Olovka za oci', 0, '', ''),
(1301, 1296, 'Make up za usne', 0, '', ''),
(1302, 1301, 'Ruz', 0, '', ''),
(1303, 1301, 'Sjajilo', 0, '', ''),
(1304, 1296, 'Balzam za njegu usnica', 0, '', ''),
(1305, 1304, 'Olovka za usne', 0, '', ''),
(1306, 1296, 'Make up za obrve', 0, '', ''),
(1307, 1306, 'Pinceta', 0, '', ''),
(1308, 1306, 'Olovka za obrve', 0, '', ''),
(1309, 1306, 'Gel', 0, '', ''),
(1310, 1306, 'Prah', 0, '', ''),
(1311, 1296, 'Make up za lice', 0, '', ''),
(1312, 1311, 'Puder', 0, '', ''),
(1313, 1311, 'Rumenilo', 0, '', ''),
(1314, 1311, 'Podloga', 0, '', ''),
(1315, 1296, 'Setovi', 0, '', ''),
(1316, 1315, 'Cetke i kistovi za make-up', 0, '', ''),
(1317, 1315, 'Set za manikuru', 0, '', ''),
(1318, NULL, 'Parfemi', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `categoryview`
--

CREATE TABLE IF NOT EXISTS `categoryview` (
  `categoryview_id` int(11) NOT NULL auto_increment,
  `session_id` int(11) NOT NULL,
  `categoryviewTime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY  (`categoryview_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `categoryview`
--

INSERT INTO `categoryview` (`categoryview_id`, `session_id`, `categoryviewTime`, `category_id`) VALUES
(1, 805, '2009-01-11 11:20:26', 1281),
(2, 805, '2009-01-11 11:20:27', 1280),
(3, 805, '2009-01-11 11:20:28', 1279);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `zipCode` varchar(5) collate utf8_unicode_ci NOT NULL,
  `countryCode` varchar(2) collate utf8_unicode_ci NOT NULL,
  `cityName` varchar(50) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`zipCode`,`countryCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `city`
--


-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `countryCode` varchar(2) collate utf8_unicode_ci NOT NULL,
  `countryName` varchar(50) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`countryCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `country`
--


-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL auto_increment,
  `customerFirstname` varchar(50) collate utf8_unicode_ci NOT NULL,
  `customerLastname` varchar(50) collate utf8_unicode_ci NOT NULL,
  `customerTitle` enum('Mr','Mrs','Ms','Miss','Dr') collate utf8_unicode_ci default NULL,
  `customerPhone` varchar(20) collate utf8_unicode_ci default NULL,
  `customerMobile` varchar(20) collate utf8_unicode_ci default NULL,
  `customerFax` varchar(20) collate utf8_unicode_ci default NULL,
  `customerEmail` varchar(50) collate utf8_unicode_ci NOT NULL,
  `customerPassword` varchar(32) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `customer`
--


-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE IF NOT EXISTS `discount` (
  `discount_id` int(11) NOT NULL auto_increment,
  `discountTitle` varchar(250) collate utf8_unicode_ci NOT NULL,
  `discountDescription` text collate utf8_unicode_ci NOT NULL,
  `discountFactor` float NOT NULL,
  `discountBeginDate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `discountEndDate` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`discount_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `discount`
--


-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE IF NOT EXISTS `file` (
  `file_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `fileName` varchar(250) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `file`
--


-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE IF NOT EXISTS `manufacturer` (
  `manufacturer_id` int(11) NOT NULL auto_increment,
  `manufacturerName` varchar(50) collate utf8_unicode_ci NOT NULL,
  `manufacturerStreet` varchar(250) collate utf8_unicode_ci default NULL,
  `zipCode` varchar(5) collate utf8_unicode_ci default NULL,
  `countryCode` varchar(2) collate utf8_unicode_ci default NULL,
  `manufacturerContactPerson` varchar(50) collate utf8_unicode_ci default NULL,
  `manufacturerEmail` varchar(50) collate utf8_unicode_ci default NULL,
  `manufacturerPhone` varchar(50) collate utf8_unicode_ci default NULL,
  `manufacturerFax` varchar(50) collate utf8_unicode_ci default NULL,
  `manufacturerMobile` varchar(50) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=268 ;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturer_id`, `manufacturerName`, `manufacturerStreet`, `zipCode`, `countryCode`, `manufacturerContactPerson`, `manufacturerEmail`, `manufacturerPhone`, `manufacturerFax`, `manufacturerMobile`) VALUES
(250, 'Nivea', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(251, 'Afrodita', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(252, 'Bvlgari', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(253, 'Benetton', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(254, 'Calvin Klein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(255, 'Cartier', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(256, 'Christian Dior', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(257, 'Dolce & Gabbana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(258, 'Davidoff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(259, 'David Beckham', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(260, 'Diesel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(261, 'Chanel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(262, 'Christian Lacroix', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(263, 'Armani', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(264, 'Guess', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(265, 'Hilfiger', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(266, 'Jean Paul Gaultier', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(267, 'Moschino', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

CREATE TABLE IF NOT EXISTS `offer` (
  `offer_id` int(11) NOT NULL auto_increment,
  `offerName` varchar(250) collate utf8_unicode_ci NOT NULL,
  `offerDescription` text collate utf8_unicode_ci NOT NULL,
  `offerBeginDate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `offerEndDate` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`offer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `offer`
--


-- --------------------------------------------------------

--
-- Table structure for table `offerdetail`
--

CREATE TABLE IF NOT EXISTS `offerdetail` (
  `offerdetail_id` int(11) NOT NULL auto_increment,
  `offer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `offerdetailOrdering` int(11) NOT NULL,
  PRIMARY KEY  (`offerdetail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `offerdetail`
--


-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int(11) NOT NULL auto_increment,
  `session_id` int(11) NOT NULL,
  `orderShippingaddress_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  PRIMARY KEY  (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `order`
--


-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE IF NOT EXISTS `orderdetail` (
  `orderdetail_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `orderdetailDelta` int(11) NOT NULL,
  `orderdetailTime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`orderdetail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `orderdetail`
--


-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE IF NOT EXISTS `package` (
  `parentproduct_id` int(11) NOT NULL,
  `childproduct_id` int(11) NOT NULL,
  `packageAmount` int(11) NOT NULL,
  PRIMARY KEY  (`parentproduct_id`,`childproduct_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `package`
--


-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE IF NOT EXISTS `price` (
  `price_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `priceTime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`price_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `price`
--


-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL auto_increment,
  `category_id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `productName` varchar(250) collate utf8_unicode_ci NOT NULL,
  `productDescriptionShort` varchar(250) collate utf8_unicode_ci NOT NULL,
  `productDescriptionLong` text collate utf8_unicode_ci,
  `productDiscontinued` tinyint(1) NOT NULL default '0',
  `productQuantity` int(11) NOT NULL default '0',
  PRIMARY KEY  (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1427 ;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `manufacturer_id`, `productName`, `productDescriptionShort`, `productDescriptionLong`, `productDiscontinued`, `productQuantity`) VALUES
(1316, 1270, 250, 'Nourishing Day Care', '', NULL, 0, 0),
(1317, 1270, 250, 'Silk Comfort Day Care', '', NULL, 0, 0),
(1318, 1270, 250, 'Rich Regenerating Night Care', '', NULL, 0, 0),
(1319, 1270, 250, 'Sensitive Balance Day Care', '', NULL, 0, 0),
(1320, 1270, 250, 'Moisturising Day Care', '', NULL, 0, 0),
(1321, 1270, 250, 'Regenerating Night Care', '', NULL, 0, 0),
(1322, 1270, 250, 'Mattifying Day Care', '', NULL, 0, 0),
(1323, 1270, 250, 'Anti Wrinkle Q10Plus Light Day Care', '', NULL, 0, 0),
(1324, 1270, 250, 'Regenerating NightCream', '', NULL, 0, 0),
(1325, 1270, 250, 'DNAge Day Care', '', NULL, 0, 0),
(1326, 1270, 250, 'DNAge Night Care', '', NULL, 0, 0),
(1327, 1270, 250, 'Strengthening DayCream', '', NULL, 0, 0),
(1328, 1270, 250, 'Rehydrating Moisturiser', '', NULL, 0, 0),
(1329, 1272, 250, 'Refreshing Toner', '', NULL, 0, 0),
(1330, 1272, 250, 'Mattifying Toner', '', NULL, 0, 0),
(1331, 1272, 250, 'Soothing Toner', '', NULL, 0, 0),
(1332, 1273, 250, 'Indulging Cleansing Milk', '', NULL, 0, 0),
(1333, 1273, 250, 'Q10 Cleansing Milk', '', NULL, 0, 0),
(1334, 1273, 250, 'Re-Hydrating Cleansing Milk', '', NULL, 0, 0),
(1335, 1274, 250, 'Refreshing Wash Gel', '', NULL, 0, 0),
(1336, 1274, 250, 'Purifying Wash Gel', '', NULL, 0, 0),
(1337, 1275, 250, 'Gentle Cleansing Cream', '', NULL, 0, 0),
(1338, 1275, 250, 'Refreshing Cleansing Wipes', '', NULL, 0, 0),
(1339, 1275, 250, 'Gentle Facial Cleansing Wipes', '', NULL, 0, 0),
(1340, 1275, 250, 'Active Purifying Mask', '', NULL, 0, 0),
(1341, 1275, 250, 'Deep Cleaning Face Wash', '', NULL, 0, 0),
(1342, 1276, 250, 'Indulging Cleansing Milk', '', NULL, 0, 0),
(1343, 1276, 250, 'Gentle Cleansing Cream', '', NULL, 0, 0),
(1344, 1276, 250, 'Gentle Eye Make-Up Remover', '', NULL, 0, 0),
(1345, 1276, 250, 'Gentle WaterProof Eye Make-Up Remover', '', NULL, 0, 0),
(1346, 1277, 250, 'natural beauty Beautifying Daily Peeling', '', NULL, 0, 0),
(1347, 1279, 250, 'Strong Power Shampoo', '', NULL, 0, 0),
(1348, 1279, 250, 'Intensive Control Shampoo Anti-Dandruff', '', NULL, 0, 0),
(1349, 1279, 250, 'Diamond Gloss Shampoo', '', NULL, 0, 0),
(1350, 1279, 250, 'Beauty Care Shampoo', '', NULL, 0, 0),
(1351, 1279, 250, 'Brilliant Colour Shampoo', '', NULL, 0, 0),
(1352, 1279, 250, 'Balance Control Shampoo', '', NULL, 0, 0),
(1353, 1280, 250, 'Diamond Gloss Conditioner', '', NULL, 0, 0),
(1354, 1280, 250, 'Beauty Care Conditioner', '', NULL, 0, 0),
(1355, 1280, 250, 'Brilliant Colour Conditioner', '', NULL, 0, 0),
(1356, 1281, 250, 'Beauty Care Intensive Cream Mask', '', NULL, 0, 0),
(1357, 1281, 250, 'Brilliant Colour Intensive Cream Mask', '', NULL, 0, 0),
(1358, 1282, 250, 'Real Style Paste', '', NULL, 0, 0),
(1359, 1291, 250, 'Extra Moisture Shaving Gel', '', NULL, 0, 0),
(1360, 1291, 250, 'Cool Kick Shaving Gel', '', NULL, 0, 0),
(1361, 1291, 250, 'Extra Moisture Shaving Foam', '', NULL, 0, 0),
(1362, 1293, 250, 'Replenishing Post Shave Balm', '', NULL, 0, 0),
(1363, 1293, 250, 'Cool Cick Post Shave Balm', '', NULL, 0, 0),
(1364, 1293, 250, 'Sensitive Post Shave Balm', '', NULL, 0, 0),
(1365, 1293, 250, 'Sensitive Post Shave Losion', '', NULL, 0, 0),
(1366, 1298, 250, 'Volume NanoDefinition', '', NULL, 0, 0),
(1367, 1298, 250, 'Extreme Resist', '', NULL, 0, 0),
(1368, 1298, 250, 'Eyes Wide Open Volume', '', NULL, 0, 0),
(1369, 1299, 250, 'Creative Eyes Trio', '', NULL, 0, 0),
(1370, 1299, 250, 'Creative Eyes Duo', '', NULL, 0, 0),
(1371, 1299, 250, 'Creative Eyes Mono', '', NULL, 0, 0),
(1372, 1300, 250, 'Soft Liner', '', NULL, 0, 0),
(1373, 1300, 250, 'Eye Line & Design', '', NULL, 0, 0),
(1374, 1300, 250, 'Stay On Eye Pencil', '', NULL, 0, 0),
(1375, 1300, 250, 'Liquid Eye Liner', '', NULL, 0, 0),
(1376, 1302, 250, 'Colour Passion', '', NULL, 0, 0),
(1377, 1302, 250, 'Colour Passion Brilliance', '', NULL, 0, 0),
(1378, 1302, 250, 'Extrem Resist Lipstick', '', NULL, 0, 0),
(1379, 1303, 250, 'Volume Shine Wonder Full', '', NULL, 0, 0),
(1380, 1303, 250, 'Volume Shine Ultra Glossy', '', NULL, 0, 0),
(1381, 1305, 250, 'Stay On Lip Liner', '', NULL, 0, 0),
(1382, 1312, 250, 'Ideal Finish Powder', '', NULL, 0, 0),
(1383, 1312, 250, 'Stay Real Terra', '', NULL, 0, 0),
(1384, 1312, 250, 'Stay Real Powder', '', NULL, 0, 0),
(1385, 1313, 250, 'Stay Real Blush', '', NULL, 0, 0),
(1386, 1318, 252, 'Bvlgari', '', NULL, 0, 0),
(1387, 1318, 252, 'By Night Jette', '', NULL, 0, 0),
(1388, 1318, 253, 'Benneton Sport', '', NULL, 0, 0),
(1389, 1318, 254, 'Calypso Ambre', '', NULL, 0, 0),
(1390, 1318, 254, 'Calypso Chevrefuille', '', NULL, 0, 0),
(1391, 1318, 254, 'Calypso Marine', '', NULL, 0, 0),
(1392, 1318, 254, 'Can Can', '', NULL, 0, 0),
(1393, 1318, 254, 'Candies', '', NULL, 0, 0),
(1394, 1318, 255, 'Casmir', '', NULL, 0, 0),
(1395, 1318, 256, 'Addict', '', NULL, 0, 0),
(1396, 1318, 256, 'Dior Star', '', NULL, 0, 0),
(1397, 1318, 256, 'Dolce Vita', '', NULL, 0, 0),
(1398, 1318, 256, 'Dune', '', NULL, 0, 0),
(1399, 1318, 256, 'Hypnotic Poison', '', NULL, 0, 0),
(1400, 1318, 256, 'J Adore', '', NULL, 0, 0),
(1401, 1318, 256, 'Poison', '', NULL, 0, 0),
(1402, 1318, 257, 'By', '', NULL, 0, 0),
(1403, 1318, 257, 'Light Blue', '', NULL, 0, 0),
(1404, 1318, 257, 'Sicily', '', NULL, 0, 0),
(1405, 1318, 257, 'The One', '', NULL, 0, 0),
(1406, 1318, 258, 'Cool Water', '', NULL, 0, 0),
(1407, 1318, 258, 'Good Life', '', NULL, 0, 0),
(1408, 1318, 259, 'Intimately Beckham', '', NULL, 0, 0),
(1409, 1318, 260, 'Fuel For Life', '', NULL, 0, 0),
(1410, 1318, 260, 'Plus Plus', '', NULL, 0, 0),
(1411, 1318, 261, 'No.5', '', NULL, 0, 0),
(1412, 1318, 261, 'Coco', '', NULL, 0, 0),
(1413, 1318, 261, 'Egoiste', '', NULL, 0, 0),
(1414, 1318, 262, 'Bazar', '', NULL, 0, 0),
(1415, 1318, 263, 'Armani Code', '', NULL, 0, 0),
(1416, 1318, 263, 'Armani Code Femme', '', NULL, 0, 0),
(1417, 1318, 263, 'Diamonds', '', NULL, 0, 0),
(1418, 1318, 263, 'Emporio Armani', '', NULL, 0, 0),
(1419, 1318, 263, 'Acqua Di Gio', '', NULL, 0, 0),
(1420, 1318, 263, 'Mania Femme', '', NULL, 0, 0),
(1421, 1318, 264, 'Guess Gold', '', NULL, 0, 0),
(1422, 1318, 265, 'Dreaming', '', NULL, 0, 0),
(1423, 1318, 266, 'Fragile', '', NULL, 0, 0),
(1424, 1318, 266, 'Ma Dame', '', NULL, 0, 0),
(1425, 1318, 267, 'Moschino Friends', '', NULL, 0, 0),
(1426, 1318, 267, 'Funny!', '', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `productview`
--

CREATE TABLE IF NOT EXISTS `productview` (
  `productview_id` int(11) NOT NULL auto_increment,
  `session_id` int(11) NOT NULL,
  `productviewTime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY  (`productview_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `productview`
--


-- --------------------------------------------------------

--
-- Table structure for table `search`
--

CREATE TABLE IF NOT EXISTS `search` (
  `search_id` int(11) NOT NULL auto_increment,
  `session_id` int(11) NOT NULL,
  `searchQuery` varchar(250) collate utf8_unicode_ci NOT NULL,
  `searchResultCount` int(11) NOT NULL,
  `searchResultsPerPage` int(11) NOT NULL,
  PRIMARY KEY  (`search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `search`
--


-- --------------------------------------------------------

--
-- Table structure for table `searchdetail`
--

CREATE TABLE IF NOT EXISTS `searchdetail` (
  `searchdetail_id` int(11) NOT NULL auto_increment,
  `search_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `searchdetailTime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `searchdetailResultNumber` int(11) NOT NULL,
  `searchdetailClickCount` int(11) NOT NULL,
  PRIMARY KEY  (`searchdetail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `searchdetail`
--


-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `session_id` varchar(32) collate utf8_unicode_ci NOT NULL,
  `customer_id` int(11) default NULL,
  PRIMARY KEY  (`session_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`session_id`, `customer_id`) VALUES
('7d79abdc50100cb4e2e417e7f0e6cd59', NULL),
('805c408e9fc8cb4dd3f2da5b84fe0772', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;
