-- phpMyAdmin SQL Dump
-- version 2.11.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 13, 2008 at 04:00 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `webhouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `action`
--

CREATE TABLE `action` (
  `action_id` int(11) NOT NULL auto_increment,
  `session_id` varchar(32) collate utf8_unicode_ci NOT NULL,
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `class` enum('product','category','auth','order','basket','search') collate utf8_unicode_ci NOT NULL,
  `action` varchar(50) collate utf8_unicode_ci NOT NULL,
  `target` varchar(250) collate utf8_unicode_ci default NULL,
  `info` varchar(250) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`action_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=152 ;

--
-- Dumping data for table `action`
--

INSERT INTO `action` (`action_id`, `session_id`, `time`, `class`, `action`, `target`, `info`) VALUES
(19, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:21:06', 'product', 'view', '5', NULL),
(20, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:21:33', 'product', 'view', '123', NULL),
(21, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:21:37', 'product', 'view', '143', NULL),
(22, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:27:27', 'product', 'view', '143', NULL),
(23, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:27:50', 'product', 'view', '143', NULL),
(24, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:27:57', 'product', 'view', '143', NULL),
(25, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:28:09', 'product', 'view', '143', NULL),
(26, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:31:36', 'product', 'view', '143', NULL),
(27, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:31:44', 'product', 'view', '143', NULL),
(28, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:32:15', 'product', 'view', '143', NULL),
(29, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:37:00', 'product', 'view', '143', NULL),
(30, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:37:53', 'product', 'view', '143', NULL),
(31, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:39:31', 'product', 'view', '143', NULL),
(32, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:39:34', 'product', 'view', '471', NULL),
(33, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:57:33', 'product', 'view', '471', NULL),
(34, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:57:38', 'product', 'view', '608', NULL),
(35, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:57:39', 'product', 'view', '435', NULL),
(36, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:57:41', 'product', 'view', '198', NULL),
(37, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:57:43', 'product', 'view', '520', NULL),
(38, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:57:44', 'product', 'view', '675', NULL),
(39, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:58:05', 'product', 'view', '675', NULL),
(40, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:58:23', 'product', 'view', '675', NULL),
(41, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:58:24', 'product', 'view', '675', NULL),
(42, 'd98840f06c765bb376889612639632b6', '2008-12-09 00:58:42', 'product', 'view', '675', NULL),
(43, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 00:58:58', 'product', 'view', '675', NULL),
(44, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:16', 'product', 'view', '675', NULL),
(45, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:18', 'product', 'view', '232', NULL),
(46, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:20', 'product', 'view', '253', NULL),
(47, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:21', 'product', 'view', '640', NULL),
(48, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:22', 'product', 'view', '459', NULL),
(49, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:23', 'product', 'view', '456', NULL),
(50, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:24', 'product', 'view', '874', NULL),
(51, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:26', 'product', 'view', '314', NULL),
(52, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:27', 'product', 'view', '119', NULL),
(53, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:28', 'product', 'view', '302', NULL),
(54, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:30', 'product', 'view', '389', NULL),
(55, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:31', 'product', 'view', '475', NULL),
(56, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:32', 'product', 'view', '902', NULL),
(57, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:46', 'product', 'view', '946', NULL),
(58, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:48', 'product', 'view', '192', NULL),
(59, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:49', 'product', 'view', '643', NULL),
(60, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:50', 'product', 'view', '555', NULL),
(61, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:52', 'product', 'view', '879', NULL),
(62, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:52', 'product', 'view', '605', NULL),
(63, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:53', 'product', 'view', '409', NULL),
(64, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:53', 'product', 'view', '965', NULL),
(65, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:55', 'product', 'view', '794', NULL),
(66, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:56', 'product', 'view', '873', NULL),
(67, '9fe5fed90eb0f0e1e1e5ffec14267add', '2008-12-09 01:01:57', 'product', 'view', '988', NULL),
(68, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:02:36', 'product', 'view', '988', NULL),
(69, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:02:42', 'product', 'view', '750', NULL),
(70, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:02:44', 'product', 'view', '590', NULL),
(71, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:02:45', 'product', 'view', '269', NULL),
(72, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:02:46', 'product', 'view', '177', NULL),
(73, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:02:47', 'product', 'view', '659', NULL),
(74, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:02:48', 'product', 'view', '762', NULL),
(75, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:02:49', 'product', 'view', '379', NULL),
(76, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:02:50', 'product', 'view', '165', NULL),
(77, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:02:51', 'product', 'view', '739', NULL),
(78, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:02:52', 'product', 'view', '213', NULL),
(79, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:02:53', 'product', 'view', '680', NULL),
(80, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:02:54', 'product', 'view', '491', NULL),
(81, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:02:55', 'product', 'view', '772', NULL),
(82, 'dd797bec0e602045d95bb7722086ea7b', '2008-12-09 01:05:04', 'product', 'view', '772', NULL),
(83, 'dd797bec0e602045d95bb7722086ea7b', '2008-12-09 01:05:06', 'product', 'view', '367', NULL),
(84, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:05:09', 'product', 'view', '145', NULL),
(85, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:05:12', 'product', 'view', '179', NULL),
(86, 'dd797bec0e602045d95bb7722086ea7b', '2008-12-09 01:05:16', 'product', 'view', '842', NULL),
(87, 'dd797bec0e602045d95bb7722086ea7b', '2008-12-09 01:05:18', 'product', 'view', '111', NULL),
(88, 'dd797bec0e602045d95bb7722086ea7b', '2008-12-09 01:05:19', 'product', 'view', '501', NULL),
(89, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:05:21', 'product', 'view', '474', NULL),
(90, 'dd797bec0e602045d95bb7722086ea7b', '2008-12-09 01:05:23', 'product', 'view', '559', NULL),
(91, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:05:24', 'product', 'view', '662', NULL),
(92, 'dd797bec0e602045d95bb7722086ea7b', '2008-12-09 01:05:32', 'product', 'view', '191', NULL),
(93, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:05:34', 'product', 'view', '638', NULL),
(94, 'dd797bec0e602045d95bb7722086ea7b', '2008-12-09 01:05:36', 'product', 'view', '413', NULL),
(95, 'dd797bec0e602045d95bb7722086ea7b', '2008-12-09 01:05:37', 'product', 'view', '661', NULL),
(96, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:05:39', 'product', 'view', '279', NULL),
(97, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:05:40', 'product', 'view', '579', NULL),
(98, 'd3aa497a6007aeceed7e4c3c0dcc6dd4', '2008-12-09 01:08:27', 'product', 'view', NULL, NULL),
(99, 'ad7ca82a0ca108a75159907eaaa465eb', '2008-12-09 01:08:53', 'product', 'view', NULL, NULL),
(100, 'ad7ca82a0ca108a75159907eaaa465eb', '2008-12-09 01:08:57', 'product', 'view', '834', NULL),
(101, 'ad7ca82a0ca108a75159907eaaa465eb', '2008-12-09 01:08:59', 'product', 'view', '578', NULL),
(102, 'ad7ca82a0ca108a75159907eaaa465eb', '2008-12-09 01:09:00', 'product', 'view', '338', NULL),
(103, 'ad7ca82a0ca108a75159907eaaa465eb', '2008-12-09 01:09:01', 'product', 'view', '653', NULL),
(104, 'ad7ca82a0ca108a75159907eaaa465eb', '2008-12-09 01:09:02', 'product', 'view', '230', NULL),
(105, 'ad7ca82a0ca108a75159907eaaa465eb', '2008-12-09 01:09:03', 'product', 'view', '633', NULL),
(106, 'ad7ca82a0ca108a75159907eaaa465eb', '2008-12-09 01:09:04', 'product', 'view', '890', NULL),
(107, 'ad7ca82a0ca108a75159907eaaa465eb', '2008-12-09 01:09:05', 'product', 'view', '502', NULL),
(108, 'ad7ca82a0ca108a75159907eaaa465eb', '2008-12-09 01:09:05', 'product', 'view', '963', NULL),
(109, 'ad7ca82a0ca108a75159907eaaa465eb', '2008-12-09 01:09:07', 'product', 'view', '563', NULL),
(110, 'ad7ca82a0ca108a75159907eaaa465eb', '2008-12-09 01:09:08', 'product', 'view', '184', NULL),
(111, 'ad7ca82a0ca108a75159907eaaa465eb', '2008-12-09 01:09:08', 'product', 'view', '825', NULL),
(112, 'ad7ca82a0ca108a75159907eaaa465eb', '2008-12-09 01:09:09', 'product', 'view', '657', NULL),
(113, 'ad7ca82a0ca108a75159907eaaa465eb', '2008-12-09 01:09:10', 'product', 'view', '240', NULL),
(114, 'ad7ca82a0ca108a75159907eaaa465eb', '2008-12-09 01:09:11', 'product', 'view', '114', NULL),
(115, 'ad7ca82a0ca108a75159907eaaa465eb', '2008-12-09 01:09:12', 'product', 'view', '206', NULL),
(116, 'ad7ca82a0ca108a75159907eaaa465eb', '2008-12-09 01:09:13', 'product', 'view', '961', NULL),
(117, 'ad7ca82a0ca108a75159907eaaa465eb', '2008-12-09 01:09:14', 'product', 'view', '640', NULL),
(118, 'dd797bec0e602045d95bb7722086ea7b', '2008-12-09 01:09:17', 'product', 'view', '661', NULL),
(119, 'dd797bec0e602045d95bb7722086ea7b', '2008-12-09 01:09:19', 'product', 'view', '569', NULL),
(120, 'dd797bec0e602045d95bb7722086ea7b', '2008-12-09 01:09:20', 'product', 'view', '244', NULL),
(121, 'dd797bec0e602045d95bb7722086ea7b', '2008-12-09 01:09:21', 'product', 'view', '935', NULL),
(122, 'dd797bec0e602045d95bb7722086ea7b', '2008-12-09 01:09:22', 'product', 'view', '712', NULL),
(123, 'dd797bec0e602045d95bb7722086ea7b', '2008-12-09 01:09:23', 'product', 'view', '262', NULL),
(124, 'dd797bec0e602045d95bb7722086ea7b', '2008-12-09 01:09:23', 'product', 'view', '375', NULL),
(125, 'dd797bec0e602045d95bb7722086ea7b', '2008-12-09 01:09:24', 'product', 'view', '800', NULL),
(126, 'dd797bec0e602045d95bb7722086ea7b', '2008-12-09 01:09:25', 'product', 'view', '509', NULL),
(127, 'dd797bec0e602045d95bb7722086ea7b', '2008-12-09 01:09:26', 'product', 'view', '967', NULL),
(128, 'dd797bec0e602045d95bb7722086ea7b', '2008-12-09 01:09:26', 'product', 'view', '477', NULL),
(129, '082eecc4d04ed6c241a2735f8e14641e', '2008-12-09 01:17:49', 'product', 'view', '640', NULL),
(130, 'b969feac04e5a64f6907fc65aeeec4df', '2008-12-09 10:18:37', 'product', 'view', '640', NULL),
(131, 'b969feac04e5a64f6907fc65aeeec4df', '2008-12-09 10:24:11', 'product', 'view', '143', NULL),
(132, 'b969feac04e5a64f6907fc65aeeec4df', '2008-12-09 10:24:14', 'product', 'view', '143', NULL),
(133, 'b969feac04e5a64f6907fc65aeeec4df', '2008-12-09 10:24:33', 'product', 'view', '236', NULL),
(134, 'b969feac04e5a64f6907fc65aeeec4df', '2008-12-09 11:20:22', 'product', 'view', '236', NULL),
(135, 'b969feac04e5a64f6907fc65aeeec4df', '2008-12-09 11:20:23', 'product', 'view', '255', NULL),
(136, 'b969feac04e5a64f6907fc65aeeec4df', '2008-12-09 11:20:24', 'product', 'view', '713', NULL),
(137, 'b969feac04e5a64f6907fc65aeeec4df', '2008-12-09 11:20:26', 'product', 'view', '978', NULL),
(138, 'b969feac04e5a64f6907fc65aeeec4df', '2008-12-09 11:44:29', 'product', 'view', '640', NULL),
(139, 'b969feac04e5a64f6907fc65aeeec4df', '2008-12-09 11:44:36', 'product', 'view', '420', NULL),
(140, 'b969feac04e5a64f6907fc65aeeec4df', '2008-12-09 11:44:37', 'product', 'view', '116', NULL),
(141, 'b969feac04e5a64f6907fc65aeeec4df', '2008-12-09 11:44:38', 'product', 'view', '967', NULL),
(142, 'b969feac04e5a64f6907fc65aeeec4df', '2008-12-09 11:44:40', 'product', 'view', '873', NULL),
(143, 'b969feac04e5a64f6907fc65aeeec4df', '2008-12-09 11:44:41', 'product', 'view', '112', NULL),
(144, 'b969feac04e5a64f6907fc65aeeec4df', '2008-12-09 11:44:42', 'product', 'view', '341', NULL),
(145, 'b969feac04e5a64f6907fc65aeeec4df', '2008-12-09 11:44:43', 'product', 'view', '664', NULL),
(146, 'b969feac04e5a64f6907fc65aeeec4df', '2008-12-09 11:44:44', 'product', 'view', '467', NULL),
(147, 'b969feac04e5a64f6907fc65aeeec4df', '2008-12-09 11:52:39', 'product', 'view', '247', NULL),
(148, 'b969feac04e5a64f6907fc65aeeec4df', '2008-12-09 11:53:07', 'product', 'view', '708', NULL),
(149, '950894dbfdb7e03a8a88c1613ca93ba5', '2008-12-09 15:33:30', 'product', 'view', '708', NULL),
(150, '950894dbfdb7e03a8a88c1613ca93ba5', '2008-12-09 23:03:09', 'product', 'view', '899', NULL),
(151, '950894dbfdb7e03a8a88c1613ca93ba5', '2008-12-09 23:03:11', 'product', 'view', '581', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

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
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `firstname`, `lastname`, `title`, `phone`, `mobile`, `fax`, `email`) VALUES
(1, 'Ivica', 'Ivić', 'Mr', NULL, NULL, NULL, 'ivica@gmail.com'),
(2, 'Marica', 'Marić', 'Mrs', NULL, NULL, NULL, 'marica@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `session_id` varchar(32) collate utf8_unicode_ci NOT NULL,
  `customer_id` int(11) default NULL,
  PRIMARY KEY  (`session_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `session`
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
-- Table structure for table `user`
--

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
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `firstname`, `lastname`, `email`, `password`, `userlevel`, `lastvisited`) VALUES
(1, 'matej', 'Matej', 'Udovičić', 'matej.udo@gmail.com', '3adbb507cd221a3a438f858057b3017a', 9, '2008-12-04 01:43:43');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `action`
--
ALTER TABLE `action`
  ADD CONSTRAINT `action_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `session` (`session_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;
