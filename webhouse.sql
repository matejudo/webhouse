-- phpMyAdmin SQL Dump
-- version 2.11.3
-- http://www.phpmyadmin.net
--
-- Računalo: localhost
-- Vrijeme generiranja: Sij 08, 2009 u 02:54 PM
-- Verzija poslužitelja: 5.0.51
-- PHP verzija: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Baza podataka: `webhouse`
--

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL auto_increment,
  `customer_id` int(11) NOT NULL,
  `street` varchar(250) collate utf8_unicode_ci NOT NULL,
  `zipCode` varchar(5) collate utf8_unicode_ci NOT NULL,
  `countryCode` varchar(2) collate utf8_unicode_ci NOT NULL,
  `defaultAddress` tinyint(1) NOT NULL,
  PRIMARY KEY  (`address_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Izbacivanje podataka za tablicu `address`
--


-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `attribute`
--

DROP TABLE IF EXISTS `attribute`;
CREATE TABLE `attribute` (
  `product_id` int(11) NOT NULL,
  `attributetype_id` int(11) NOT NULL,
  `value` varchar(50) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`product_id`,`attributetype_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Izbacivanje podataka za tablicu `attribute`
--


-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `attributetype`
--

DROP TABLE IF EXISTS `attributetype`;
CREATE TABLE `attributetype` (
  `attributetype_id` int(11) NOT NULL auto_increment,
  `attributetypeName` varchar(50) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`attributetype_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Izbacivanje podataka za tablicu `attributetype`
--

INSERT INTO `attributetype` (`attributetype_id`, `attributetypeName`) VALUES
(1, 'Gender'),
(2, 'Top Note'),
(3, 'Heart Note'),
(4, 'Base Note');

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) default NULL,
  `name` varchar(250) collate utf8_unicode_ci NOT NULL,
  `ordering` int(10) unsigned NOT NULL default '0',
  `description` text collate utf8_unicode_ci NOT NULL,
  `thumbnail` varchar(250) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Izbacivanje podataka za tablicu `category`
--

INSERT INTO `category` (`category_id`, `parent_id`, `name`, `ordering`, `description`, `thumbnail`) VALUES
(14, 13, 'Za djecu', 0, '', ''),
(12, NULL, 'Parfemi', 0, '', ''),
(13, NULL, 'Šamponi', 0, '', '');

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `categoryview`
--

DROP TABLE IF EXISTS `categoryview`;
CREATE TABLE `categoryview` (
  `categoryview_id` int(11) NOT NULL auto_increment,
  `session_id` int(11) NOT NULL,
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY  (`categoryview_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Izbacivanje podataka za tablicu `categoryview`
--


-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `zipCode` varchar(5) collate utf8_unicode_ci NOT NULL,
  `countryCode` varchar(2) collate utf8_unicode_ci NOT NULL,
  `cityName` varchar(50) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`zipCode`,`countryCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Izbacivanje podataka za tablicu `city`
--


-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `countryCode` varchar(2) collate utf8_unicode_ci NOT NULL,
  `name` varchar(50) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`countryCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Izbacivanje podataka za tablicu `country`
--


-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL auto_increment,
  `firstname` varchar(50) collate utf8_unicode_ci NOT NULL,
  `lastname` varchar(50) collate utf8_unicode_ci NOT NULL,
  `title` enum('Mr','Mrs','Ms','Miss','Dr') collate utf8_unicode_ci default NULL,
  `phone` varchar(20) collate utf8_unicode_ci default NULL,
  `mobile` varchar(20) collate utf8_unicode_ci default NULL,
  `fax` varchar(20) collate utf8_unicode_ci default NULL,
  `email` varchar(50) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Izbacivanje podataka za tablicu `customer`
--

INSERT INTO `customer` (`customer_id`, `firstname`, `lastname`, `title`, `phone`, `mobile`, `fax`, `email`) VALUES
(1, 'Ivica', 'Ivić', 'Mr', NULL, NULL, NULL, 'ivica@gmail.com'),
(2, 'Marica', 'Marić', 'Mrs', NULL, NULL, NULL, 'marica@gmail.com');

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `discount`
--

DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount` (
  `discount_id` int(11) NOT NULL auto_increment,
  `title` varchar(250) collate utf8_unicode_ci NOT NULL,
  `description` text collate utf8_unicode_ci NOT NULL,
  `factor` float NOT NULL,
  `beginDate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `endDate` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`discount_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Izbacivanje podataka za tablicu `discount`
--


-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `file`
--

DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `file_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `fileName` varchar(250) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Izbacivanje podataka za tablicu `file`
--


-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE `manufacturer` (
  `manufacturer_id` int(11) NOT NULL auto_increment,
  `name` varchar(50) collate utf8_unicode_ci NOT NULL,
  `street` varchar(250) collate utf8_unicode_ci default NULL,
  `zipCode` varchar(5) collate utf8_unicode_ci default NULL,
  `countryCode` varchar(2) collate utf8_unicode_ci default NULL,
  `contactPerson` varchar(50) collate utf8_unicode_ci default NULL,
  `email` varchar(50) collate utf8_unicode_ci default NULL,
  `phone` varchar(50) collate utf8_unicode_ci default NULL,
  `fax` varchar(50) collate utf8_unicode_ci default NULL,
  `mobile` varchar(50) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=26 ;

--
-- Izbacivanje podataka za tablicu `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturer_id`, `name`, `street`, `zipCode`, `countryCode`, `contactPerson`, `email`, `phone`, `fax`, `mobile`) VALUES
(1, 'Yves Saint Laurent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Calvin Klein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Giorgio Armani', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Dolce Gabbana', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Boss', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Bvlgari', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Carolina Herrera', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Cerruti', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Davidoff', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Diesel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'DKNY', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'Elizabeth Taylor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'Emporio Armani', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Guess', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'Karl Lagerfeld', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'Police', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'Prada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'Ralph Lauren', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'Tommy Hilfiger', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'Versace', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'Calvin Klein', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'Dior', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'Estee Lauder', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'Yves Saint Laurent', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'Givenchy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `offer`
--

DROP TABLE IF EXISTS `offer`;
CREATE TABLE `offer` (
  `offer_id` int(11) NOT NULL auto_increment,
  `name` varchar(250) collate utf8_unicode_ci NOT NULL,
  `description` text collate utf8_unicode_ci NOT NULL,
  `beginDate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `endDate` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`offer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Izbacivanje podataka za tablicu `offer`
--


-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `offerdetail`
--

DROP TABLE IF EXISTS `offerdetail`;
CREATE TABLE `offerdetail` (
  `offerdetail_id` int(11) NOT NULL auto_increment,
  `offer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY  (`offerdetail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Izbacivanje podataka za tablicu `offerdetail`
--


-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL auto_increment,
  `session_id` int(11) NOT NULL,
  `shippingaddress_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `transaction` int(11) NOT NULL,
  PRIMARY KEY  (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Izbacivanje podataka za tablicu `order`
--


-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `orderdetail_id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `delta` int(11) NOT NULL,
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`orderdetail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Izbacivanje podataka za tablicu `orderdetail`
--


-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `package`
--

DROP TABLE IF EXISTS `package`;
CREATE TABLE `package` (
  `parentproduct_id` int(11) NOT NULL,
  `childproduct_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY  (`parentproduct_id`,`childproduct_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Izbacivanje podataka za tablicu `package`
--


-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `price`
--

DROP TABLE IF EXISTS `price`;
CREATE TABLE `price` (
  `price_id` int(11) NOT NULL auto_increment,
  `product_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `beginDate` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`price_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Izbacivanje podataka za tablicu `price`
--


-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL auto_increment,
  `category_id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(250) collate utf8_unicode_ci NOT NULL,
  `descriptionShort` varchar(250) collate utf8_unicode_ci NOT NULL,
  `descriptionLong` text collate utf8_unicode_ci,
  `discontinued` tinyint(1) NOT NULL default '0',
  `quantity` int(11) NOT NULL default '0',
  PRIMARY KEY  (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Izbacivanje podataka za tablicu `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `manufacturer_id`, `name`, `descriptionShort`, `descriptionLong`, `discontinued`, `quantity`) VALUES
(1, 1, 1, 'Opium', 'A controversial fragrance at the time of launch. Opium was almost withdrawn because of the name. A warm oriental fragrance it captured the mood of the time.', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `productview`
--

DROP TABLE IF EXISTS `productview`;
CREATE TABLE `productview` (
  `productview_id` int(11) NOT NULL auto_increment,
  `session_id` int(11) NOT NULL,
  `productviewTime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY  (`productview_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Izbacivanje podataka za tablicu `productview`
--


-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `search`
--

DROP TABLE IF EXISTS `search`;
CREATE TABLE `search` (
  `search_id` int(11) NOT NULL auto_increment,
  `session_id` int(11) NOT NULL,
  `query` varchar(250) collate utf8_unicode_ci NOT NULL,
  `resultCount` int(11) NOT NULL,
  `resultsPerPage` int(11) NOT NULL,
  PRIMARY KEY  (`search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Izbacivanje podataka za tablicu `search`
--


-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `searchdetail`
--

DROP TABLE IF EXISTS `searchdetail`;
CREATE TABLE `searchdetail` (
  `searchdetail_id` int(11) NOT NULL auto_increment,
  `search_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `resultNumber` int(11) NOT NULL,
  `clickCount` int(11) NOT NULL,
  PRIMARY KEY  (`searchdetail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Izbacivanje podataka za tablicu `searchdetail`
--


-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `session_id` varchar(32) collate utf8_unicode_ci NOT NULL,
  `customer_id` int(11) default NULL,
  PRIMARY KEY  (`session_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Izbacivanje podataka za tablicu `session`
--

INSERT INTO `session` (`session_id`, `customer_id`) VALUES
('082eecc4d04ed6c241a2735f8e14641e', NULL),
('950894dbfdb7e03a8a88c1613ca93ba5', NULL),
('b969feac04e5a64f6907fc65aeeec4df', NULL),
('d3aa497a6007aeceed7e4c3c0dcc6dd4', NULL),
('d98840f06c765bb376889612639632b6', NULL),
('dd797bec0e602045d95bb7722086ea7b', NULL),
('9fe5fed90eb0f0e1e1e5ffec14267add', 1),
('ad7ca82a0ca108a75159907eaaa465eb', 2);

-- --------------------------------------------------------

--
-- Tablična struktura za tablicu `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL auto_increment,
  `username` varchar(20) collate utf8_unicode_ci NOT NULL,
  `firstname` varchar(50) collate utf8_unicode_ci NOT NULL,
  `lastname` varchar(50) collate utf8_unicode_ci default NULL,
  `email` varchar(50) collate utf8_unicode_ci NOT NULL,
  `password` varchar(32) collate utf8_unicode_ci NOT NULL,
  `userlevel` tinyint(4) NOT NULL default '0',
  `lastvisited` timestamp NULL default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Izbacivanje podataka za tablicu `user`
--

INSERT INTO `user` (`user_id`, `username`, `firstname`, `lastname`, `email`, `password`, `userlevel`, `lastvisited`) VALUES
(1, 'matej', 'Matej', 'Udovičić', 'matej.udo@gmail.com', '3adbb507cd221a3a438f858057b3017a', 9, '2008-12-04 01:43:43');

--
-- Ograničenja za izbačene tablice
--

--
-- Ograničenja za tablicu `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;
