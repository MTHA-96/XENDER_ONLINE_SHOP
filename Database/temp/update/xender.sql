-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 11, 2023 at 03:23 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xender`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

DROP TABLE IF EXISTS `adminlogin`;
CREATE TABLE IF NOT EXISTS `adminlogin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminlogin`
--

INSERT INTO `adminlogin` (`id`, `name`, `email`, `password`, `role`) VALUES
(1, 'Min Thiha', 'solomonthiha9080@gmail.com', 'minthiha', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `advertisement`
--

DROP TABLE IF EXISTS `advertisement`;
CREATE TABLE IF NOT EXISTS `advertisement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `first_caption` varchar(100) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `adv_id` int(11) NOT NULL,
  `second_caption` varchar(100) NOT NULL,
  `third_caption` varchar(100) NOT NULL,
  `fourth_caption` varchar(100) NOT NULL,
  `fifth_caption` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advertisement`
--

INSERT INTO `advertisement` (`id`, `first_caption`, `date`, `adv_id`, `second_caption`, `third_caption`, `fourth_caption`, `fifth_caption`, `image`, `product_id`) VALUES
(6, 'EMBROIDERED BLOUSE', '2023-11-14 00:00:00.000000', 3, 'NEW ARRIVALS IN THIS WEEK', '10% OFF', '', '', 'static/images/billboards&others/3_homeslider.jpg', 109),
(2, ' Women\'s UA Unstoppable Jacket', '2023-09-11 00:00:00.000000', 1, '20% OFF FOR NEWYEAR PROMOTION', 'Are you looking for a jacket in winter?', '', '', 'static/images/billboards&others/1_homeslider.jpg', 32),
(5, 'Men\'s UA Velocity', '2023-11-14 00:00:00.000000', 2, '45% OFF FOR NEW YEAR  SALE', '$40 ', '', '', 'static/images/billboards&others/2_homeslider.jpg', 14),
(22, 'Hazel Dress Pink\r\n', '2023-11-24 00:00:00.000000', 1, '5% OFF FOR NEWYEAR SALE', 'The best seller in this month', '', '', 'static/images/billboards&others/3_image.jpg', 103),
(23, 'Ultimate', '2023-11-20 00:00:00.000000', 1, 'Fashion', 'Up to ', '50% OFF', 'For end of year', 'static/images/billboards&others/menbilboard_copy.jpg', 97);

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_category`
--

DROP TABLE IF EXISTS `advertisement_category`;
CREATE TABLE IF NOT EXISTS `advertisement_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `advertisement_id` bigint(20) NOT NULL,
  `categories_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `advertisement_category_advertisement_id_categor_378de110_uniq` (`advertisement_id`,`categories_id`),
  KEY `advertisement_category_advertisement_id_09dcd001` (`advertisement_id`),
  KEY `advertisement_category_categories_id_94cf9b5f` (`categories_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advertisement_category`
--

INSERT INTO `advertisement_category` (`id`, `advertisement_id`, `categories_id`) VALUES
(6, 6, 5),
(2, 2, 5),
(5, 5, 5),
(22, 22, 5),
(23, 23, 6);

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_sub_category`
--

DROP TABLE IF EXISTS `advertisement_sub_category`;
CREATE TABLE IF NOT EXISTS `advertisement_sub_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `advertisement_id` bigint(20) NOT NULL,
  `subcategories_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `advertisement_sub_catego_advertisement_id_subcate_8900995c_uniq` (`advertisement_id`,`subcategories_id`),
  KEY `advertisement_sub_category_advertisement_id_a3d05f5e` (`advertisement_id`),
  KEY `advertisement_sub_category_subcategories_id_c081a0a2` (`subcategories_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advertisement_sub_category`
--

INSERT INTO `advertisement_sub_category` (`id`, `advertisement_id`, `subcategories_id`) VALUES
(6, 6, 5),
(2, 2, 5),
(5, 5, 5),
(20, 22, 22),
(21, 23, 6);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add userlogin', 7, 'add_userlogin'),
(26, 'Can change userlogin', 7, 'change_userlogin'),
(27, 'Can delete userlogin', 7, 'delete_userlogin'),
(28, 'Can view userlogin', 7, 'view_userlogin'),
(29, 'Can add product', 8, 'add_product'),
(30, 'Can change product', 8, 'change_product'),
(31, 'Can delete product', 8, 'delete_product'),
(32, 'Can view product', 8, 'view_product'),
(33, 'Can add temp order', 9, 'add_temporder'),
(34, 'Can change temp order', 9, 'change_temporder'),
(35, 'Can delete temp order', 9, 'delete_temporder'),
(36, 'Can view temp order', 9, 'view_temporder'),
(37, 'Can add adminlogin', 10, 'add_adminlogin'),
(38, 'Can change adminlogin', 10, 'change_adminlogin'),
(39, 'Can delete adminlogin', 10, 'delete_adminlogin'),
(40, 'Can view adminlogin', 10, 'view_adminlogin'),
(41, 'Can add categories', 11, 'add_categories'),
(42, 'Can change categories', 11, 'change_categories'),
(43, 'Can delete categories', 11, 'delete_categories'),
(44, 'Can view categories', 11, 'view_categories'),
(45, 'Can add subcategories', 12, 'add_subcategories'),
(46, 'Can change subcategories', 12, 'change_subcategories'),
(47, 'Can delete subcategories', 12, 'delete_subcategories'),
(48, 'Can view subcategories', 12, 'view_subcategories'),
(49, 'Can add customers', 13, 'add_customers'),
(50, 'Can change customers', 13, 'change_customers'),
(51, 'Can delete customers', 13, 'delete_customers'),
(52, 'Can view customers', 13, 'view_customers'),
(53, 'Can add order', 14, 'add_order'),
(54, 'Can change order', 14, 'change_order'),
(55, 'Can delete order', 14, 'delete_order'),
(56, 'Can view order', 14, 'view_order'),
(57, 'Can add feedback', 15, 'add_feedback'),
(58, 'Can change feedback', 15, 'change_feedback'),
(59, 'Can delete feedback', 15, 'delete_feedback'),
(60, 'Can view feedback', 15, 'view_feedback'),
(61, 'Can add advertisement', 16, 'add_advertisement'),
(62, 'Can change advertisement', 16, 'change_advertisement'),
(63, 'Can delete advertisement', 16, 'delete_advertisement'),
(64, 'Can view advertisement', 16, 'view_advertisement'),
(65, 'Can add temp image', 17, 'add_tempimage'),
(66, 'Can change temp image', 17, 'change_tempimage'),
(67, 'Can delete temp image', 17, 'delete_tempimage'),
(68, 'Can view temp image', 17, 'view_tempimage'),
(69, 'Can add customer history', 18, 'add_customerhistory'),
(70, 'Can change customer history', 18, 'change_customerhistory'),
(71, 'Can delete customer history', 18, 'delete_customerhistory'),
(72, 'Can view customer history', 18, 'view_customerhistory'),
(73, 'Can add order history', 19, 'add_orderhistory'),
(74, 'Can change order history', 19, 'change_orderhistory'),
(75, 'Can delete order history', 19, 'delete_orderhistory'),
(76, 'Can view order history', 19, 'view_orderhistory'),
(77, 'Can add monthly income', 20, 'add_monthlyincome'),
(78, 'Can change monthly income', 20, 'change_monthlyincome'),
(79, 'Can delete monthly income', 20, 'delete_monthlyincome'),
(80, 'Can view monthly income', 20, 'view_monthlyincome');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(6, 'billboards'),
(5, 'sliders'),
(4, 'kids'),
(3, 'women'),
(2, 'men'),
(1, 'home'),
(7, 'partners'),
(8, 'payment_methods');

-- --------------------------------------------------------

--
-- Table structure for table `customerhistory`
--

DROP TABLE IF EXISTS `customerhistory`;
CREATE TABLE IF NOT EXISTS `customerhistory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(256) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(256) NOT NULL,
  `city` varchar(30) NOT NULL,
  `payment_method` varchar(25) NOT NULL,
  `card_no` varchar(20) NOT NULL,
  `card_exp_date` datetime(6) DEFAULT NULL,
  `cvv_no` varchar(20) NOT NULL,
  `issue_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customerhistory`
--

INSERT INTO `customerhistory` (`id`, `name`, `email`, `phone`, `address`, `city`, `payment_method`, `card_no`, `card_exp_date`, `cvv_no`, `issue_date`) VALUES
(31, 'aung ko', 'aungkoko@gmail.com', '+957766773', 'North okkalapa', 'yangon', 'visa', '998877', '2024-02-01 00:00:00.000000', '77666663', '2023-12-04 13:24:06.686169'),
(28, 'Min Thiha', 'solomonthiha9080@gmail.com', '+44554483', 'no 19', 'warshinton', 'visa', '44553444', '2025-03-05 00:00:00.000000', '443334344', '2023-12-02 14:49:34.114896'),
(29, 'Min  Thiha', 'solomonthiha9080@gmail.com', '+9538883728', 'yangon,', 'myanmar', 'master', '34345545', '2023-12-27 00:00:00.000000', '555555', '2023-12-04 12:33:41.505716'),
(30, 'Min Thiha Aung', 'thiha@gmail.com', '+95388842', '49 ward ', 'Mandalay', 'cash_on_delivery', '', '2023-12-29 00:00:00.000000', '6666', '2023-12-04 12:38:37.228125'),
(67, 'aung ko ko', 'aungkoko@gmail.com', '+444453234', 'tamwe', 'yangon', 'cash_on_delivery', '443434', '2023-12-11 00:00:00.000000', '344344', '2023-12-11 14:30:07.950187'),
(68, 'aung aung', 'aungkoko@gmail.com', '+9533444', 'mandalay', 'yangon', 'visa', '44333', '2023-12-11 00:00:00.000000', '3442333', '2023-12-11 14:09:06.046835');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(256) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(256) NOT NULL,
  `city` varchar(30) NOT NULL,
  `payment_method` varchar(25) NOT NULL,
  `card_no` varchar(20) NOT NULL,
  `card_exp_date` datetime(6) DEFAULT NULL,
  `cvv_no` varchar(20) NOT NULL,
  `order_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'user', 'userlogin'),
(8, 'user', 'product'),
(9, 'user', 'temporder'),
(10, 'adminpannel', 'adminlogin'),
(11, 'adminpannel', 'categories'),
(12, 'adminpannel', 'subcategories'),
(13, 'adminpannel', 'customers'),
(14, 'user', 'order'),
(15, 'adminpannel', 'feedback'),
(16, 'adminpannel', 'advertisement'),
(17, 'adminpannel', 'tempimage'),
(18, 'adminpannel', 'customerhistory'),
(19, 'user', 'orderhistory'),
(20, 'adminpannel', 'monthlyincome');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-07-08 11:49:40.912482'),
(2, 'auth', '0001_initial', '2023-07-08 11:49:44.004612'),
(3, 'admin', '0001_initial', '2023-07-08 11:49:44.743795'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-07-08 11:49:44.790667'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-07-08 11:49:44.821925'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-07-08 11:49:45.091608'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-07-08 11:49:45.245416'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-07-08 11:49:45.345717'),
(9, 'auth', '0004_alter_user_username_opts', '2023-07-08 11:49:45.361364'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-07-08 11:49:45.477243'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-07-08 11:49:45.477243'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-07-08 11:49:45.508485'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-07-08 11:49:45.646557'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-07-08 11:49:45.809318'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-07-08 11:49:45.931772'),
(16, 'auth', '0011_update_proxy_permissions', '2023-07-08 11:49:45.978691'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-07-08 11:49:46.094627'),
(18, 'sessions', '0001_initial', '2023-07-08 11:49:46.348700'),
(28, 'adminpannel', '0001_initial', '2023-09-05 12:04:46.051182'),
(29, 'adminpannel', '0002_customers', '2023-09-05 12:04:46.161526'),
(30, 'adminpannel', '0003_feedback', '2023-09-05 12:04:46.261257'),
(31, 'adminpannel', '0004_advertisement', '2023-09-05 12:04:47.406553'),
(32, 'adminpannel', '0005_tempimage', '2023-09-05 12:04:47.461590'),
(33, 'adminpannel', '0006_alter_tempimage_options_alter_tempimage_table', '2023-09-05 12:04:47.481702'),
(34, 'adminpannel', '0007_customers_order_date', '2023-09-05 12:04:47.631467'),
(35, 'adminpannel', '0008_feedback_date', '2023-09-05 12:04:47.751177'),
(36, 'adminpannel', '0009_customerhistory', '2023-09-05 12:04:47.881533'),
(37, 'user', '0001_initial', '2023-09-05 12:09:13.741909'),
(38, 'user', '0002_order', '2023-09-05 12:09:13.941613'),
(39, 'user', '0003_alter_product_date', '2023-09-05 12:09:14.081853'),
(40, 'user', '0004_orderhistory', '2023-09-05 12:09:14.411955'),
(41, 'adminpannel', '0010_advertisement_product_id', '2023-11-03 13:20:51.466858'),
(42, 'adminpannel', '0011_auto_20231206_2117', '2023-12-06 14:47:38.557950');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1fbbuxzpy1rtwvxl2dve1f865e94v8qy', 'eyJ1c2VybmFtZSI6InNvbG9tb250aGloYTkwODBAZ21haWwuY29tIn0:1qIqgY:EhsnxtPAUn7J9UODCa2d8Zez7q-kzFAqSImoawU0PA0', '2023-07-11 13:12:14.621884'),
('uh86ibcvhr1pyyjfk6znsca8700i4xux', 'eyJ1c2VybmFtZSI6ImF1bmdrb2tvQGdtYWlsLmNvbSJ9:1qI7VA:ekR3p7YAR0xVfU__OYgcX3Y9xCiyAR8Tf-ezByaJrRw', '2023-07-09 12:57:28.484800'),
('c55mx06vjw9m0x325hpfl3rff96eqfxp', 'eyJ1c2VybmFtZSI6InNvbG9tb250aGloYTkwODBAZ21haWwuY29tIn0:1qJEto:2925uKgR0VqJqR__gRibSRzeXEAGwwGJafkG2XTHIJY', '2023-07-12 15:03:33.041627'),
('7e33vu4feq8q8a9zd9rfdhky1mqwjs29', 'eyJ1c2VybmFtZSI6InNvbG9tb250aGloYTkwODBAZ21haWwuY29tIn0:1qJExk:BblsqGz2soR4K3aRvJNx9cRGWdFD7aoqXBN_g6wxpBE', '2023-07-12 15:07:36.235973'),
('12fqhxrfib4bdyl9gkb3sj96z8hpy6ry', 'eyJ1c2VybmFtZSI6InNvbG9tb250aGloYTkwODBAZ21haWwuY29tIn0:1qJamY:FgaUpHGkZV1kknAYOVjbp-Spsf3Y5irXtp4ZHMmMNSo', '2023-07-13 14:25:30.114033'),
('le37jstpwg8g0g9lulji2oi89o2k79ov', 'eyJ1c2VybmFtZSI6InNvbG9tb250aGloYTkwODBAZ21haWwuY29tIn0:1qJvmv:8LpOB_rpzvDjFOrmLjqE1dsaIbPRQMIBHjRyuG1x-2I', '2023-07-14 12:51:17.314258'),
('messuun4t8aysrh8sk6ljj8q344kzoc7', 'eyJ1c2VybmFtZSI6InNvbG9tb250aGloYTkwODBAZ21haWwuY29tIn0:1qKJ7M:ueEuPQ6EF5DPGzfGEi93uRJYBusrTshdzorFQxPv0W4', '2023-07-15 13:45:56.050676'),
('a8bb1d4q7w0zfihhsobs6c06acmclhhk', 'eyJ1c2VybmFtZSI6InNvbG9tb250aGloYTkwODBAZ21haWwuY29tIn0:1qKx1w:kwAOgGHK675bUwRJA22rGDgpl2l03F2_07kxU53E-kw', '2023-07-17 08:23:00.046669'),
('hh4r4uzrnzbksaux6hupjyvc1cn10e96', 'eyJ1c2VybmFtZSI6InNvbG9tb250aGloYTkwODBAZ21haWwuY29tIn0:1qL11c:1DgYRyg0rY8KaO4sxlrMwmRvKx4Ezgl_nb4AVFpBeck', '2023-07-17 12:38:56.122517'),
('h65x1oct8y0t8fa4zmzw7j2jdatctc63', 'eyJ1c2VybmFtZSI6InNvbG9tb250aGloYTkwODBAZ21haWwuY29tIn0:1qLkiO:jdmYfwKvG16AOPZ0I4DVTI_sSgiJquKI-y2vcXzm7bM', '2023-07-19 13:26:08.800292'),
('1l30dhlr6dp8lekpmly7ifeyl321fd0b', '.eJwlykELgkAQxfHvMmcpokjyFnXsaLcHy7ANprju4I5Qid-9tU4P3u8_06QPNnFt4EaommngkJd2ziTZptOGCvJxMBnM2VtX-7XbTmW11H7yV54O5VL8xSnbM2eXCrgnGROQYh8DcFa9sjFwi557oJaggAW16eXdcdzT8gVQ3DMJ:1qZ3a9:vDXODtS8y7TqIEUKlfhlHRssC1-K1DpRa-z99Ypg4RY', '2023-08-25 06:12:37.819727'),
('a8dbzxmosst14eq3arkayvixt4yvz409', 'eyJpbWFnZV9wYXRoIjoiQzpcXFVzZXJzXFxzb2xvbVxcQXBwRGF0YVxcTG9jYWxcXFRlbXBcXHRtcDEyZTgxMzNtIn0:1qZ5pl:vdYNreLUoxw6VGa2VTN14hmc0M7owNtm0GDAvFvDQFI', '2023-08-25 08:36:53.413042'),
('il1n91gtok3e66av9you38og2ohbsrnj', 'eyJpbWFnZV9wYXRoIjoiQzpcXFVzZXJzXFxVU0VSXFxBcHBEYXRhXFxMb2NhbFxcVGVtcFxcdG1wbmViNjA1dm4ifQ:1qZWp2:oGHkY95HfzLmeOHvlzdOinuf9zM5nkOX6W-KIACMDWU', '2023-08-26 13:25:56.847863'),
('xv4qnshg3ovhf2nokyqqb5mpvtoeqc4b', 'eyJ1c2VybmFtZSI6InNvbG9tb250aGloYTkwODBAZ21haWwuY29tIn0:1qdWG6:0-Gkb-D1zCti7bYMQQcLE02-VYSpOSMR5ynr3n0cEcY', '2023-09-06 13:38:22.613365'),
('5f3ipai9oyb3e4br7cbhxb9y2zjxd27w', 'eyJ1c2VybmFtZSI6InNvbG9tb250aGloYTkwODBAZ21haWwuY29tIn0:1qdssl:ZpjXEs2BdPAYE_5CXkuslFSUJnxPZLWQm_ZxL8CAkxI', '2023-09-07 13:47:47.400810'),
('y1dc6yr5hysb9liwc736k5dhbhcbrdij', 'eyJ1c2VybmFtZSI6ImF1bmdrb2tvQGdtYWlsLmNvbSJ9:1qeEyI:FCUlgWOcbnB2_x7yVVY1ECjKmGrVXDylX7nUGGcPgTQ', '2023-09-08 13:22:58.221693'),
('p0kwogf0fibgl98sdx4bgudcxn0aswcx', 'eyJ1c2VybmFtZSI6ImF1bmdrb2tvQGdtYWlsLmNvbSJ9:1qfga8:h3tRE-MILPzGjPnNR2y-lAylP8MJujf-wL3Y4UZuw90', '2023-09-12 13:04:00.938440'),
('56ub3t6q6pfo6947yy0ri2gs9wj5pw1n', 'eyJ1c2VybmFtZSI6ImF1bmdrb2tvQGdtYWlsLmNvbSJ9:1qgQRO:nbUeqvYplFRD_FfCNgJyh8wR_YzvtTsSSRo7ICUq-QI', '2023-09-14 14:02:02.625920'),
('mbupxm8uwnva6r6ilnw685bw47jlj5wc', 'eyJ1c2VybmFtZSI6ImFkbWluIn0:1qicOz:Y0X4tEXLZYMMLK6_RlqjseE7cqiczQcIFlMgBRBYQZY', '2023-09-20 15:12:37.169245'),
('5v361gpr5g1ppin3remfnt0dkl7h2e8n', 'eyJ1c2VybmFtZSI6ImFkbWluIn0:1qiwDM:7YuZVI7wohDB_3Zfy4_h_f5jx-PBrbJTgGXBrn2-gI4', '2023-09-21 12:21:56.472369'),
('pzgieyzavxbrojwdmx3j25d6v2nhkx3s', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1qiwYW:bP9SV-55Fzy3F7M0Gw-g1pTFKboIB7LZMsp8OFdG_po', '2023-09-21 12:43:48.504484'),
('qy0pbm8jik7dnq48ci3ys84ncrwfdeuu', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1qiy0N:lwrk_n4rIsZ24ubKxswORkYc4Xbgts3agxoBT6UEgvg', '2023-09-21 14:16:39.542063'),
('kurvrst2ib36sldlv08ad0gf85k2y99c', 'eyJ1c2VybmFtZSI6ImF1bmdrb2tvQGdtYWlsLmNvbSJ9:1qiwnl:aP8od6ZP2AJ8xeiblOcbV2of8AebtVoZ3kP-ULWoS0Y', '2023-09-21 12:59:33.665718'),
('2r4aenej3aknhn05ivhyslbaslpa7leo', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1qiy7P:ukGRkv8MFwP3HKNGscCPOYUfEqSVXjmhrCL68wgT1OI', '2023-09-21 14:23:55.642863'),
('lfd6kspellgtkbz6d0u0c09bu63nk9cn', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1qjK1m:r6B0Zo-13PICOB9A91EvXJK-UkMtPn9sERvbBVN3Ak4', '2023-09-22 13:47:34.794485'),
('14z6424fzuyvsfg8jahq631njufc4mtt', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1qlq3q:R04rxUAN4x3IEza8-PjYdIae3fruBcfhVBziUzjPfmE', '2023-09-29 12:24:06.259668'),
('y3x2erlx8tsu5xe583eh0sxnpbhhgaho', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1qmrJk:6ZMNx1H-Mb8F7dkEtWmpuLc1Eh-31beGtXFpf9btgPI', '2023-10-02 07:56:44.972239'),
('olnfl6q89p1krjbm9v0a68mdm5x96m4x', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1qnKnA:Scy_vVqQevK4yiHsg-T7a8PFgXGJoYW3KfcFEzHTB10', '2023-10-03 15:25:04.402026'),
('ui3uv25uscuctvryysecda9p5xm74pzu', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1qomok:BRTtbevtQyFaT5xOf_NI3_fNBjQTMnQWKwQxxqIpLw4', '2023-10-07 15:32:42.023457'),
('xqbuzfclsbubf15n6u31phlnw7sw5mrx', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1qoxN0:_0o-fRQiOyrYcmBOV2Cjctgq3YgV2jfusKwhia7DHmk', '2023-10-08 02:48:46.341442'),
('k44y6zt91w46pte1t1xl8dl8zh0ke9um', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1qpKuy:vUJYFRnXDixVWq24aeupRwq2t_UrWxyixPE1Adobh00', '2023-10-09 03:57:24.033500'),
('fxv77ke1vclyi8ve812k9b90cgjujaff', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1qqZ3O:nTvyA67A6Q3H30oMdorp-flIOpbVVvL-B8uUk-AcGko', '2023-10-12 13:15:10.108301'),
('wqrhsffx0m9hwsfn3dpvsi41e5izk8py', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1qqvaK:67M7G-jIbIZr-AKw9maWp3G449zIuT2nA8CEs8sxDn8', '2023-10-13 13:18:40.269875'),
('0r6fheevd4f9c1ax5i9cfno6quwc34i2', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1qrT3K:t_h6R36CAaLAYxJ0oE9N54m8Z6OFX8E1DUpCAdrqqsY', '2023-10-15 01:02:50.910516'),
('fxci21rld06901qoro2r9s24db03eqgy', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1qsMB5:5oylcAdikLt2mJ0vHRTlyqp8ML6f42unuDcJnW_FFmI', '2023-10-17 11:54:31.904619'),
('b75m9ps7atmdm3ogtfng4yqd7lcz7pzz', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1quD75:livMkeZoXjYIs3ySUH584BQeISEcaefwubxgIal0yUE', '2023-10-22 14:38:03.663497'),
('zt94lejhn1uusyowe3pii1p43vf252bg', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1qwYnw:TkTXOlcRa9HW4-RA7-1xIwRMNdSsQtNdSsw487ezCAw', '2023-10-29 02:12:00.942177'),
('2oyfk0m8g5ykuurmj2m9cbhidku4q5ub', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1qyXhX:mydh-k6rvVOuJa3grnOtf-X6V7KW8gqm27ghtU9GvBc', '2023-11-03 13:25:35.381614'),
('p6xfmvazzguh3h5ox30w1wedns2xeonc', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1qyZES:0TB0wcz2XEU76ijfrPncYFPcAEe5y_01ScrNbetD7IE', '2023-11-03 15:03:40.514488'),
('i03g9qbh9a17nzt2mjq22m3a64h1aku1', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1qzRTp:4GA22orIQV_wppQWy1m2ROXkVBy1koZUmBnskV_WOnA', '2023-11-06 00:59:09.590375'),
('byaym2u8fm5uqprvvioq53pqq1l23g1w', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1qzY5S:XvdJOJt_ds2JrZYPxiSsmCwKULhVUSxPBg6TYScfVuc', '2023-11-06 08:02:26.763258'),
('83ljmruz1gh1ed5mjw9gny7azimbcogb', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1r0LVT:L1AfbLiG4e8Yk6JlWsweaa1jYh2xNl-k4eWdTSe16gU', '2023-11-08 12:48:35.862550'),
('67hvxb2ninqjwapug943gsyev3lzekgf', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1r2X4h:naPcEuamvADPqIAV9YERRZs59nmZT9B4ytqvf9yv5M4', '2023-11-14 13:33:59.604481'),
('kt9vui9dgq1gwixu67rqv2ef0lgwam1s', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1r3GBN:96uCsC-sVSmXoCnF_jKsIFj3hVjZa4493MCaxJB5mEI', '2023-11-16 13:43:54.001015'),
('zq84yue53q6qt2cuwe1qyviwrtl4mt8h', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1r3bzp:LEghVlUummYdEByf9FVxAI6G07YHLo3X4iKHf8TLLbk', '2023-11-17 13:01:25.165455'),
('ectnh3bqopuxcnc0mjq2g550rdsdeiwj', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1r4hQC:2noKK7M2iDU0Ro6BbgkSFQZYp6N3NJ_TfRRSmMV_Tv8', '2023-11-20 13:01:09.019169'),
('y484zud7oorapdlmfgaqr9td1kvhvdg9', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1r542z:YnRzkcIX6-DDhX9hzPaw18S358eqZdfByUFhvniX2KA', '2023-11-21 13:10:41.306737'),
('xfurg30xttblva3ft6gpc4g76apxmvz1', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1r5QRw:4PT3FYzifDHJTnVYYnWkz05yMfp-BbSK0P3uAz4rIQM', '2023-11-22 13:05:56.650461'),
('8oen8xmucpku3gx5rpvs30fzk0h9dz4i', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1r5mRl:43Gx_JPDOossP8sF-fO8VL7Cu5kxhSvP844K-uXV6EU', '2023-11-23 12:35:13.276058'),
('oluulx7l2ro5bu4pgrxvqspi8131fujw', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1r68SM:hyN1BWR2qcOGpZTNRILlRuss3dNPvld0813wnpyneOY', '2023-11-24 12:05:18.692199'),
('5bcq7gqykl23er5iq3q1ba46xap9d8si', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1r78jd:os5LuBA-7DcB0E7G7qocoIJt9l3KaUox1yHRwiYuTmI', '2023-11-27 06:35:17.843797'),
('enz8uzz5kclfhp0c9dskvnx1dh20p95v', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1r7cEU:lU0ii7CukQoNBb1vcmmN1Kk3psvSEsvXgZYi0DKevsI', '2023-11-28 14:05:06.568207'),
('vxwouo9e9gpb374cwh25dny9efbxilm2', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1r8JBC:3yOl28GpFeRTIQr6Aq_DOoiabLHnP6SAf3IBKYzrSj0', '2023-11-30 11:56:34.520156'),
('3pdfxbni3cqtp5lq6omlnkcxbdusgue2', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1r9FEk:IaAQZ0VTu-P4_pg-jLMkjnhlHOgUB1FraLWLB3kjghk', '2023-12-03 01:56:06.016699'),
('lj58rn6c3e5dc4rn6jlpwx9z7r8fdpxq', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1r9GzB:OYy9wzUuyWBDHKBeeYcm5GHK6Imvda4A2d6GPI2KDpQ', '2023-12-03 03:48:09.575631'),
('1l9f7igh8ohzfvaan2qs2z828qmppfx0', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1r9JrJ:wLIeirqh3NOeahdGdj_zPKT8N3ray4exN8IjdVlPULo', '2023-12-03 06:52:13.402926'),
('7sxivgskad7pw4tkdyb8zh8alya3lmm2', 'eyJhZG1pbiI6Ik1pbiBUaGloYSIsInVzZXJuYW1lIjoic29sb21vbnRoaWhhOTA4MEBnbWFpbC5jb20ifQ:1r9R2p:KhePQ_ogzmTLwcCHbHF8cPW5CR_NhEkMrgeYCjcUMFI', '2023-12-03 14:32:35.108446'),
('ozl0uenq6pqeu9qvnsgz0my1eat64zav', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1r9cQR:WHZxM3d0eaL0f1_kHEPj7_rj_XmMNxYK91z35UoJ6Qs', '2023-12-04 02:41:43.123293'),
('69wg46o86hbnyjbuw5v69ng2beeo8egx', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1r9fXx:F0LhsT0BZed-QWLEWnqODw3BSx2bSqVW-kYQ_hftRvg', '2023-12-04 06:01:41.755228'),
('0rd8i0xq5h7jamqs5ouw2zaoed8cdqtu', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1r9lXK:L0Q5HbLaz9Pz9f1cO-H3JswrAdSw2lpOCjVYCRFYLsQ', '2023-12-04 12:25:26.507592'),
('mq0cgi2doeld6g4oxm3tono0x0z2yf7m', 'eyJ1c2VybmFtZSI6ImF1bmdrb2tvQGdtYWlsLmNvbSJ9:1rA8tw:Gd5ClEsNYg53ZnoRD9x4CLLdybvahUE2QqJBj8KZ6DA', '2023-12-05 13:22:20.944046'),
('rzyggdxktlff59v85lru0vpvwzi0tqcj', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1rAAfZ:YosC8ZNJtiec0zncgjkxIbbEIQaQuOJ0dCUPwA9wwiw', '2023-12-05 15:15:37.552006'),
('05vf8r1j35yx23cxc8935s9d8w3b6tal', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1rAW2H:YukCluQoUzVzT2heDZXQJ_11nsgo6AUYPGE2-NEQpJs', '2023-12-06 14:04:29.790024'),
('rffnhjyxfrwqp8l8dunqi2rgej7fcj0u', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1rAs8S:U2-XSqfxBIqoY4PqXMOhb-t5NNpOlbpmQLY3M8z0Uoo', '2023-12-07 13:40:20.116696'),
('24r7xz2556crn8pmsg2r9ban2u5qs1mh', 'eyJhZG1pbiI6Ik1pbiBUaGloYSJ9:1rBD9i:pI5m6ANJqHIrILroZjApLJHstDcJJ5kQjWvxY0KmmPs', '2023-12-08 12:07:02.448019'),
('gfrtasurjaxlnvg5092ah5z92hwzexff', 'eyJ1c2VybmFtZSI6InNvbG9tb250aGloYTkwODBAZ21haWwuY29tIn0:1rC9sp:QpwUKWGVXPKouSIfCEGtg1wgtqyqiGw1CTwrqe8Vyd0', '2023-12-11 02:49:31.295691'),
('rmuxtzxm4td6pfmjpyerquso6hxhu01w', 'eyJhZG1pbiI6Ik1pbiBUaGloYSIsInVzZXJuYW1lIjoic29sb21vbnRoaWhhOTA4MEBnbWFpbC5jb20ifQ:1rCEcX:NklAJ6nK5hg-YsTb2rTcaakNOMDRFnZHnDpfjMvSb3Y', '2023-12-11 07:53:01.926899'),
('8ioxyf5swsofxpaeddqpvnktbccxdi0c', 'eyJhZG1pbiI6Ik1pbiBUaGloYSIsInVzZXJuYW1lIjoiYXVuZ2tva29AZ21haWwuY29tIn0:1rCfzq:GE6l6WAg2iEbBEiYacWp3xEpBEkyNsfibWmXBAnN5JQ', '2023-12-12 13:06:54.125994');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(256) NOT NULL,
  `comment` varchar(256) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `monthlyincome`
--

DROP TABLE IF EXISTS `monthlyincome`;
CREATE TABLE IF NOT EXISTS `monthlyincome` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `month` varchar(20) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `monthlyincome`
--

INSERT INTO `monthlyincome` (`id`, `month`, `price`, `quantity`) VALUES
(1, 'Jan', '0.00', '0'),
(2, 'Feb', '0.00', '0'),
(3, 'Mar', '0.00', '0'),
(4, 'Apr', '0.00', '0'),
(5, 'May', '0.00', '0'),
(6, 'Jun', '0.00', '0'),
(7, 'Jul', '0.00', '0'),
(8, 'Aug', '0.00', '0'),
(9, 'Sep', '0.00', '0'),
(10, 'Oct', '0.00', '0'),
(11, 'Nov', '0.00', '0'),
(12, 'Dec', '91.00', '5');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product` varchar(50) NOT NULL,
  `size` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `product_id` int(11) NOT NULL,
  `issue_date` datetime(6) DEFAULT NULL,
  `customer_data_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_customer_data_id_adbd2b37` (`customer_data_id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orderhistory`
--

DROP TABLE IF EXISTS `orderhistory`;
CREATE TABLE IF NOT EXISTS `orderhistory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product` varchar(50) NOT NULL,
  `size` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `product_id` int(11) NOT NULL,
  `issue_date` datetime(6) DEFAULT NULL,
  `customer_data_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderhistory_customer_data_id_99f3aeb6` (`customer_data_id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderhistory`
--

INSERT INTO `orderhistory` (`id`, `product`, `size`, `quantity`, `price`, `product_id`, `issue_date`, `customer_data_id`) VALUES
(56, ' UA Collegiate Crop Short Sleeve', 'm-size', 1, '39.00', 35, '2023-12-11 14:08:28.705432', 68),
(54, ' Xtra Life™ Mid Trunks', 'm-size', 2, '44.00', 72, '2023-12-11 14:29:22.340685', 67),
(55, 'Monday Check Coat', 's_size', 2, '8.00', 45, '2023-12-11 14:29:09.798877', 67),
(37, 'A-line Skirt', 's_size', 1, '31.00', 107, '2023-12-02 14:47:06.338871', 28),
(38, 'A-line Skirt', 'm-size', 1, '31.00', 107, '2023-12-02 14:47:09.983869', 28),
(39, 'Hazel Dress Pink', 's_size', 1, '93.00', 103, '2023-12-02 14:46:40.304741', 28),
(40, 'EMBROIDERED BLOUSE', 'm-size', 2, '86.00', 109, '2023-12-04 12:32:40.631896', 29),
(41, 'Printed Jersey Top', 'm-size', 1, '17.00', 44, '2023-12-04 12:37:39.064133', 30),
(42, 'Men\'s Curry Mesh Shorts', 'l_size', 2, '116.00', 100, '2023-12-04 13:22:36.347561', 31),
(43, 'Women\'s leather lug sole loafer', 'l_size', 2, '1610.00', 86, '2023-12-04 13:22:54.796742', 31);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `detail` longtext NOT NULL,
  `remark` longtext NOT NULL,
  `s_size` tinyint(1) NOT NULL,
  `m_size` tinyint(1) NOT NULL,
  `l_size` tinyint(1) NOT NULL,
  `xl_size` tinyint(1) NOT NULL,
  `xxl_size` tinyint(1) NOT NULL,
  `old_price` decimal(9,2) NOT NULL,
  `new_price` decimal(9,2) NOT NULL,
  `discount` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `l_img` varchar(100) DEFAULT NULL,
  `r_img` varchar(100) DEFAULT NULL,
  `f_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `date`, `detail`, `remark`, `s_size`, `m_size`, `l_size`, `xl_size`, `xxl_size`, `old_price`, `new_price`, `discount`, `image`, `l_img`, `r_img`, `f_img`) VALUES
(97, 'Clean Raglan Hand Warmer Knit', '2023-11-04 00:00:00.000000', 'Fabric/Material', 'Care Info\r\nDry Clean, Hand Wash', 1, 1, 1, 1, 0, '45.00', '36.00', 20, 'static/images/products/3_image_3eTcCRQ.jpg', 'static/images/products/2_image_dwmJaC0.jpg', 'static/images/products/1_image_XfF0M0b.jpg', 'static/images/products/4_image_97T7O3l.jpg'),
(98, 'OZWEEGO Shoes', '2023-11-05 00:00:00.000000', 'Score on iconic styles with seven days of savings, starting with Ultraboost and fleece for up to 50% off through November 8—as well as more deals throughout the week', '  Snug fit\r\n    Includes elastic and standard laces\r\n    Leather upper\r\n    OrthoLite® sockliner\r\n    EVA midsole with Adiprene and Adiprene+ drop-ins\r\n\r\n    Adifit length-measuring insole', 1, 1, 1, 1, 0, '70.00', '42.00', 40, 'static/images/products/1_image_EdzPVZG.jpg', 'static/images/products/2_image_mKHkyqF.jpg', 'static/images/products/3_image_dWarlOA.jpg', 'static/images/products/4_image_Sy48cnR.jpg'),
(104, 'Unisex Curry 11 \'Domaine\' Basketball Shoes', '2023-11-13 00:00:00.000000', 'What\'s it do?\r\nStephen Curry makes you believe you can do anything. And the Curry 11 is specifically designed with ultimate bounce, grip, and stability to allow everyone to do their thing.', '\r\n    UA Warp upper technology provides enhanced comfort & control throughout dynamic basketball movements\r\n    Lightweight, comfortable UA IntelliKnit is breathable & gives you stretch & support where you need it\r\n    External 3D-molded TPU heel counter for enhanced fit & support\r\n    Molded sockliner for long-lasting, step-in comfort\r\n    Dual-density UA Flow cushioning for premium comfort that is super light, bouncy & provides insane grip\r\n    Forefoot Pebax® plate allows for additional flex & agility with lateral support\r\n    Internal midfoot shank adds stability to every move\r\n    Durable UA Flow outsole provides better court feel so you can cut & stop/start faster than ever before\r\n\r\n ', 1, 1, 1, 1, 0, '166.00', '116.00', 30, 'static/images/products/1_image_Mr8q3Qj.jpg', 'static/images/products/2_image_cOQk5Qi.jpg', 'static/images/products/3_image_ugcAJeQ.jpg', 'static/images/products/4_image_9FnHVsa.jpg'),
(96, 'EMBROIDERED SWEATSHIRT', '2023-11-04 00:00:00.000000', 'Full cut short sleeve sweatshirt with round neck. Front embroidery and back contrast prints', 'COMPOSITION & CARE\r\nCOMPOSITION\r\nOUTER SHELL\r\n100% cotton\r\nCARE\r\nCaring for your clothes is caring for the environment.\r\nWash your garments only when needed, as sometimes freshening them up is sufficient. Wash cycles slowly wear down fabrics. By reducing the amount of washing, we lengthen the life our garments and reduce water and energy consumption in their care. \r\n', 1, 1, 1, 1, 1, '0.00', '46.00', 0, 'static/images/products/1_image_cLm7HTN.jpg', 'static/images/products/2_iimage.jpg', 'static/images/products/3_image_GNuyDmF.jpg', 'static/images/products/4_image_o12nlDD.jpg'),
(103, 'Hazel Dress Pink', '2023-11-07 00:00:00.000000', '', '', 1, 1, 1, 1, 0, '89.00', '93.00', 5, 'static/images/products/1_image_dHG5pUU.jpg', 'static/images/products/2_image_DsbIxUu.jpg', 'static/images/products/3_image_9Petx2w.jpg', 'static/images/products/4_image_e1jlRe6.jpg'),
(102, 'DOUBLE SIDED COAT WITH HOOD', '2023-10-31 00:00:00.000000', 'Coat with a combined hood and long sleeves. Features button fastening at the front, front pockets with trim detail and faux shearling lining.', 'MPOSITION, CARE & ORIGIN\r\nCOMPOSITION\r\nOUTER SHELL\r\n100% polyester\r\nLINING\r\n100% polyester\r\nWhich contains at least:\r\nOUTER SHELL\r\n100% RCS certified recycled polyester\r\nCERTIFIED MATERIALS\r\nRCS CERTIFIED RECYCLED POLYESTER\r\nNowadays, recycled polyester is mainly made from PET plastic waste. This is a type of plastic that is widely used in a variety of items, such as plastic bottles. Using recycled materials helps limit the production of virgin polyester fibre. It is certified to the Recycled Content Standard (RCS), which verifies the recycled content and tracks it from source to final product.', 1, 1, 1, 1, 0, '61.00', '48.00', 20, 'static/images/products/1_image_X0p0Noo.jpg', 'static/images/products/2_image_IVT62VM.jpg', 'static/images/products/3_image_xQAMuDG.jpg', 'static/images/products/4_image_i9aRsaJ.jpg'),
(101, 'Oversized Zip-through Hoodie', '2023-11-05 00:00:00.000000', 'Size\r\n\r\n    Regular length\r\n\r\nFIT\r\n\r\n    Oversized\r\n\r\nStyle\r\n\r\n    Hooded jacket\r\n', '\r\nComposition\r\n\r\n    shell Cotton 62%, Polyester 38%\r\n    hoodlining Cotton 60%, Polyester 40%\r\n\r\nDry Clean Instruction\r\n\r\n    Can be dry cleaned\r\n\r\nDescription\r\n\r\n    GREY\r\n    Light grey\r\n    Solid colour\r\n\r\nConcept\r\n', 1, 1, 1, 1, 0, '28.00', '22.00', 19, 'static/images/products/4_image_W7aqAlH.jpg', 'static/images/products/3_image_QFqvd6m.jpg', 'static/images/products/2_image_pHjqFqa.jpg', 'static/images/products/1_image_aS6o96V.jpg'),
(12, 'Men\'s UA Tech™ Vent Jacquard Short Sleeve', '2023-10-06 00:00:00.000000', 'The ultimate T for your hottest training days—it\'s loose, light, and has vented mesh panels throughout for maximum breath ability. Plus, 4-way stretch fabric means you never have to slow down.', 'Soft UA Tech™ fabric with all-over jacquard for ultimate breathability\r\n    Material wicks sweat & dries really fast\r\n    Anti-odor technology prevents the growth of odor-causing microbes\r\n    Underarm gusset provides enhanced mobility, ventilation & chafe-free performance\r\n    Dropped, shaped hem for enhanced coverage', 1, 1, 1, 1, 0, '400.00', '280.00', 30, 'static/images/products/1_img.jpg', 'static/images/products/2_img.jpg', 'static/images/products/4_img.webp', 'static/images/products/5_img.webp'),
(13, 'Long Sleeved Stretch Jersey Sport T-shirt', '2023-10-06 00:00:00.000000', '\r\nStay dry while you train in this Lacoste T-shirt. Stretchy and fitted, with eyelets for optimal ventilation. The innovative design lets you move your way.\r\n', 'Stretch jersey\r\n    Slim, fitted cut\r\n    Quick drying\r\n    Tested by professional athletes\r\nSilicone crocodile on chest\r\n    Main fabric: Polyester (92%), Elastane (8%) / Collar: Polyester (100%) / Underarm yoke: Polyester (88%), Elastane (12%)', 1, 1, 1, 1, 0, '350.00', '280.00', 20, 'static/images/products/1_img_ODFQe6A.jpg', 'static/images/products/2_img_cjMx10c.jpg', 'static/images/products/3_img.jpg', 'static/images/products/4_img.jpg'),
(14, 'Men\'s UA Velocity 2.0 ¼ Zip', '2023-10-06 00:00:00.000000', '\r\nEveryone makes graphic Ts...but Under Armour makes them better. The fabric we use is light, soft, and quick-drying.', '    Super-soft, cotton-blend fabric provides all-day comfort\r\n    Ribbed collar', 1, 1, 1, 1, 0, '45.00', '40.00', 10, 'static/images/products/2_img_yhU3kps.jpg', 'static/images/products/1_img_6gdOJQJ.jpg', 'static/images/products/4_img_HsItdin.jpg', 'static/images/products/5_img.jpg'),
(32, ' UA Unstoppable Jacket', '2023-10-06 00:00:00.000000', 'If you\'re looking for a jacket you can actually train in on cold, wet days—you found it. Super-light and stretchy, rain rolls right off, and it keeps you warm but not hot.', '  Stretch-woven fabric is tough but lightweight\r\n    4-way stretch material moves better in every direction\r\n    Secure, zip hand pockets\r\n    Secure, zip hand Bungee drawcord adjust on bottom hem for a secure, custom fit', 1, 1, 1, 1, 0, '110.00', '88.00', 20, 'static/images/products/2_img_BrzX3gP.jpg', 'static/images/products/1_img_XZNzEf1.jpg', 'static/images/products/4_img_WM4Chmo.jpg', 'static/images/products/5_img_n57RJu4.jpg'),
(33, 'Double Collar China Oversized Linen Shirt', '2023-10-04 00:00:00.000000', 'In a world of loud prints, neon, and over-the-top styles, STYLEMAN keeps it classic. With a wide variety of tailored men’s clothing — like slacks and collared shirts — STYLEMAN’s aesthetic is about looking fresh and effortless without compromising individuality. Pair their pieces with bolder clothing for a mix-and-match effect or wear them alone for a timeless look.', 'Linen 40%, Cotton 60%', 1, 1, 1, 1, 0, '69.00', '86.00', 20, 'static/images/products/1_img_vc0BR9p.jpg', 'static/images/products/2_img_1WDeXTo.jpg', 'static/images/products/3_img_jBm64n0.jpg', 'static/images/products/4_img_EDBS7jp.jpg'),
(34, ' Regular Fit Teddy-lined Overshirt', '2023-10-06 00:00:00.000000', 'Lightly padded, regular-fit overshirt in soft cotton twill. Collar, buttons at front, and a yoke at back. Chest pockets with flap and concealed snap fastener, long sleeves with a sleeve placket and button at cuffs, and a straight-cut hem.', ' Teddy fleece lining.', 1, 1, 1, 1, 0, '64.00', '51.00', 20, 'static/images/products/1_img_xSoQVp2.jpg', 'static/images/products/2_imb.jpg', 'static/images/products/3_img_xqCrgCa.jpg', 'static/images/products/4_img_Iixkkui.jpg'),
(35, ' UA Collegiate Crop Short Sleeve', '2023-10-05 00:00:00.000000', 'Everyone makes graphic Ts...but Under Armour makes them better. The fabric we use is light, soft, and quick-drying.', 'DNA\r\n    Specs\r\n    Fit & Care\r\n\r\n    Super-soft, cotton-blend fabric provides all-day comfort\r\n    Ribbed collar\r\n    Cropped body length\r\n', 1, 1, 1, 0, 0, '0.00', '39.00', 0, 'static/images/products/1_imgweb.jpg', 'static/images/products/2_imgweb.jpg', 'static/images/products/6_img.jpg', 'static/images/products/7_imb.jpg'),
(36, 'Oversized Fit Cotton T-shirt', '2023-10-11 00:00:00.000000', 'Oversized T-shirt in thick cotton jersey. Ribbed crew neck, dropped shoulders, and a straight-cut hem.', 'ength:\r\n    Short\r\nSleeve Length:\r\n    Short sleeve\r\nFit:\r\n    Oversized\r\nNeckline:\r\n    Round Neck\r\nDescription:\r\n    Light beige, Solid-color\r\nImported:\r\n    Yes\r\n\r\nCotton\r\n    Cotton is a soft and versatile natural fiber harvested from the cotton plant.', 1, 1, 1, 1, 0, '20.00', '16.00', 20, 'static/images/products/1_img_VrSaJwI.jpg', 'static/images/products/2_img_RqR3Z4A.jpg', 'static/images/products/3_img_88RynEL.jpg', 'static/images/products/4_img_ioQddXU.jpg'),
(37, 'Sweater', '2023-10-11 00:00:00.000000', 'Soft, knit sweater. Round neckline, long sleeves, and straight hem. Ribbing at neckline, cuffs, and hem.', 'Length:\r\n    Regular length\r\nSleeve Length:\r\n    Long sleeve \r\nFit:\r\n    Regular fit\r\nNeckline:\r\n    Round Neck\r\nDescription:\r\n    Gray melange, Solid-color\r\nImported:\r\n    Yes\r\nConcept:\r\n    EVERYDAY FASHION\r\n\r\n\r\n\r\n    Polyester 54%, Acrylic 41%, Wool 5%', 1, 1, 1, 1, 0, '33.00', '26.00', 10, 'static/images/products/5_img_f6Wpe1M.jpg', 'static/images/products/6_img_cuvHFrM.jpg', 'static/images/products/7_img_kNSUCmV.jpg', 'static/images/products/8_img_er9Snys.jpg'),
(38, 'Hoodie With Loose ', '2023-10-11 00:00:00.000000', 'Hoodie With Loose Fit & Reinforced Stitching And Slits', '', 1, 1, 1, 1, 0, '48.00', '40.00', 10, 'static/images/products/1_img.jpeg', 'static/images/products/5_img_eBzTaKT.jpg', 'static/images/products/7_img.jpg', 'static/images/products/6_img_BFejrwR.jpg'),
(39, 'Tennessee Vintage Print Sweatshirt', '2023-10-11 00:00:00.000000', '', '', 1, 1, 1, 1, 0, '67.00', '57.00', 15, 'static/images/products/1_img_2kwYQJG.jpeg', 'static/images/products/8_img.jpg', 'static/images/products/7_img_0beCDLV.jpg', 'static/images/products/6_img_wzlcuPJ.jpg'),
(41, 'Round neck T-shirt ', '2023-10-12 00:00:00.000000', 'Round neck T-shirt with short sleeves', '6-7  years old only (47, 24 inches)', 1, 1, 1, 1, 1, '0.00', '23.00', 0, 'static/images/products/1_image.jpg', 'static/images/products/2_image.jpg', 'static/images/products/3_image.jpg', 'static/images/products/4_image.jpg'),
(42, 'FLORAL PRINT SOFT TOUCH SHIRT', '2023-10-12 00:00:00.000000', 'T-shirt with round neck and long sleeves. Ruffly trim. Special soft quality fabric.', '2-3 years  old only (38,6 INCHES)', 1, 1, 1, 1, 0, '18.00', '14.00', 20, 'static/images/products/1_img_8RxRWGn.jpg', 'static/images/products/2_img_D5dhYd0.jpg', 'static/images/products/3_img_DdAZ5Y6.jpg', 'static/images/products/4_img_KgALxww.jpg'),
(43, 'Long-sleeved T-shirt', '2023-10-14 00:00:00.000000', 'oose-fit T-shirt in soft cotton jersey with a ribbed trim around the neckline, an open chest pocket, dropped shoulders and long sleeves.', 'FIT\r\n\r\n    Loose fit\r\n\r\nStyle\r\n\r\n    Round neck\r\n\r\nDescription\r\n\r\n    BEIGE\r\n    Dark beige/Striped\r\n    Striped ', 1, 1, 1, 1, 0, '13.00', '11.00', 10, 'static/images/products/1_img_Er0zdS7.jpg', 'static/images/products/2_img_z7jisHZ.jpg', 'static/images/products/3_img_ftu1zLI.jpg', 'static/images/products/4_img_7oE9sqy.jpg'),
(44, 'Printed Jersey Top', '2023-10-13 00:00:00.000000', 'DISNEY100 X H&M Disney100 x H&M. Top in soft, printed cotton jersey with a round neckline and long sleeves. Ribbing around the neckline and cuffs.', 'FIT\r\n\r\n    Loose fit\r\n\r\nStyle\r\n\r\n    Round neck\r\n\r\nDry Clean Instruction\r\n\r\n    No dry clean\r\n\r\nDescription\r\n\r\n    White\r\n    Natural white/Disney\r\n    Minnie Mouse, Donald Duck, Pluto.\r\n', 1, 1, 1, 1, 0, '22.00', '17.00', 20, 'static/images/products/1_img_8SsTJtd.jpg', 'static/images/products/2_img_lNNe84h.jpg', 'static/images/products/3_img_9ufTxCX.jpg', 'static/images/products/4_img_FMfWLvD.jpg'),
(45, 'Monday Check Coat', '2023-10-14 00:00:00.000000', 'Coat for kid ', 'Made in korea .', 1, 1, 1, 1, 0, '5.00', '4.00', 5, 'static/images/products/2_img_w0H8cWf.jpg', 'static/images/products/5_img_PzZ8YeF.jpg', 'static/images/products/8_img_qWmysNx.jpg', 'static/images/products/9_img.jpg'),
(46, 'Relaxed Fit Cotton Cargo Joggers', '2023-10-14 00:00:00.000000', 'oggers in cotton twill. Drawstring and covered elastic at waistband. Regular side pockets and b and leg pockets, all with flap and snap fasteners. Covered elastic and a hook-loop tab at hems.', '\r\nSize:\r\n    The model is 182cm/6\'0\" and wears a size M\r\nSize:\r\n    Inner leg: Length: 75.7 cm (Size L)\r\nLength:\r\n    Long\r\nWaist Rise:\r\n    Regular waist\r\nFit:\r\n    Relaxed fit\r\nStyle:\r\n    Cargo, Joggers\r\nDescription:\r\n    Cream, Solid-color\r\nImported:\r\n    Yes', 1, 1, 1, 1, 0, '50.00', '40.00', 20, 'static/images/products/1_img.webp', 'static/images/products/3_img.webp', 'static/images/products/5_img_aWoFRAX.webp', 'static/images/products/7_img.webp'),
(47, 'Regular Fit Sweatpants', '2023-10-14 00:00:00.000000', 'Regular-fit sweatpants in cotton-blend fabric. Drawstring and covered elastic at waistband, side-seam pockets, and ribbed hems. Soft, brushed inside.', 'ize:\r\n    The model is 188cm/6\'2\" and wears a size L\r\nLength:\r\n    Long\r\nWaist Rise:\r\n    Regular waist\r\nFit:\r\n    Regular fit\r\nStyle:\r\n    Joggers, Sweatpants\r\nDescription:\r\n    Black/gray melange, Solid-color\r\nImported:\r\n    Yes\r\nConcept:\r\n    BASICS', 1, 1, 1, 1, 0, '40.00', '32.00', 20, 'static/images/products/1_img_prjoeMD.jpg', 'static/images/products/2_img.webp', 'static/images/products/3_img_euqLro5.webp', 'static/images/products/4_img_TaoF100.webp'),
(48, 'Men\'s UA Tech™ Mesh Shorts', '2023-10-14 00:00:00.000000', 'UA Tech™ is our original go-to training gear: loose, light, and it keeps you cool. It\'s everything you need.\r\n', ' All-over mesh fabric is soft & extremely breathable for all-purpose wear\r\n    Material wicks sweat & dries really fast\r\n    Encased elastic waistband with external drawcord\r\n    Open hand pockets\r\n\r\n    Style #: 1328705\r\n    Inseam: 9\"\r\n    No liner\r\n    100% Polyester\r\n    Imported', 1, 1, 1, 1, 0, '30.00', '21.00', 30, 'static/images/products/1_img_GvP3S3f.webp', 'static/images/products/2_img_6BaQgKG.webp', 'static/images/products/3_img_g54BhwB.webp', 'static/images/products/4_img_CWDmdQK.webp'),
(49, 'Men\'s UA HIIT Woven', '2023-10-14 00:00:00.000000', 'Light, stretchy, and sweat-wicking, these shorts move with you. Push through every burpee, mountain climber, and squat without any pinching or bunching.\r\n', 'Light, durable & super-comfortable stretch-woven fabric\r\n    Material wicks sweat & dries really fast\r\n    4-way stretch material moves better in every direction\r\n    Encased elastic waistband with internal drawcord\r\n    Open hand pockets\r\n    Shaped hem for added mobility & comfort\r\n\r\n    Style #: 1382108\r\n    Inseam: 6\"\r\n    No liner\r\n    Pockets: Yes\r\n    88% Polye', 1, 1, 1, 1, 0, '40.00', '28.00', 30, 'static/images/products/1_img_xpGLVdq.webp', 'static/images/products/2_img_VCWpjDq.webp', 'static/images/products/3_img_KFwwVGQ.webp', 'static/images/products/4_img_EOBX7VG.webp'),
(50, 'WIDE FIT JOGGER JEANS', '2023-10-14 00:00:00.000000', 'Wide fit mid-rise jeans made of unwashed denim. This gives the garment a rigid appearance when first worn, which will fade over time with use.', 'Adjustable elasticated waistband with drawstring. Side pockets and rear patch pocket detail. Fastens at the front with buttons.', 1, 1, 1, 1, 0, '88.00', '61.00', 30, 'static/images/products/1_img_QNtYM6L.jpg', 'static/images/products/2_img_WQ9ZvEn.jpg', 'static/images/products/3_img_YpNRqll.jpg', 'static/images/products/4_img_vQfqcaW.jpg'),
(51, 'SLIM FIT JEANS', '2023-10-14 00:00:00.000000', 'Slim fit jeans. Five pockets. Faded effect. Front zip fly and button fastening.', '', 1, 1, 1, 1, 0, '47.00', '37.00', 20, 'static/images/products/1_img_dAU9HuY.jpg', 'static/images/products/2_img_jAT4QuM.jpg', 'static/images/products/3_img_NI7w1cp.jpg', 'static/images/products/4_img_mQgn9UF.jpg'),
(52, ' High Waist Joggers', '2023-10-14 00:00:00.000000', 'Sweatpant joggers in soft fabric. High waist, drawstring waistband with smocked elastic, and side pockets. Gently tapered legs with smocked elastic at hems.', 'Size:\r\n    The model is 175cm/5\'9\" and wears a size S\r\nSize:\r\n    Inner leg: Length: 72.8 cm (Size M)\r\nLength:\r\n    Long\r\nWaist Rise:\r\n    High waist\r\nFit:\r\n    Loose fit\r\nStyle:\r\n    Joggers\r\nDescription:\r\n    Light pink, Solid-color\r\nImported:\r\n    Yes\r\nConcept:\r\n    BASICS, DIVIDED', 1, 1, 1, 1, 0, '0.00', '25.00', 0, 'static/images/products/1_img_QueG4iL.jpg', 'static/images/products/6_img.webp', 'static/images/products/4_img_Tz8Djo3.webp', 'static/images/products/5_img_biyIGUo.webp'),
(53, 'Women\'s UA Rival Fleece Joggers', '2023-10-14 00:00:00.000000', 'This gear keeps you warmed up and ready for pretty much everything you do—it\'s light, comfy, and super-soft on the inside.', 'Ultra-soft cotton-blend fleece with brushed inside for extra warmth\r\n    Encased elastic waistband with external drawcord\r\n    Open hand pockets\r\n\r\n    Style #: 1379438\r\n    Inseam: 27.625\"\r\n    Pockets: Yes\r\n    80% Cotton/20% Polyester\r\n    Imported', 1, 1, 1, 1, 0, '55.00', '44.00', 20, 'static/images/products/1_image_c1ScGPY.jpg', 'static/images/products/2_image_iGUN3xh.jpg', 'static/images/products/3_image_e5fZ2GM.jpg', 'static/images/products/4_image_HxQxl49.jpg'),
(54, 'Women\'s UA Fly-By 2.0 Shorts', '2023-10-14 00:00:00.000000', 'When it comes to these shorts, we thought of everything: strategic mesh, a key pocket, and reflective hits. So, all you\'ll be thinking about is going faster, longer.', 'Lightweight woven fabric delivers superior comfort & durability\r\n    Material wicks sweat & dries really fast\r\n    Super-breathable mesh panels dump excess heat\r\n    Built-in brief for enhanced coverage\r\n    Ultra-comfortable, soft knit waistband with internal drawcord\r\n    Crossover, shaped hem for a streamlined look\r\n\r\n    Style #: 1350196\r\n    Reflective logo\r\n    Inseam: 3.5\"\r\n    100% Polyester\r\n    Imported', 1, 1, 1, 1, 0, '25.00', '18.00', 30, 'static/images/products/1_image_kMtFJJO.jpg', 'static/images/products/2_image_G307xcg.jpg', 'static/images/products/3_image_4DBLCuH.jpg', 'static/images/products/4_image_htBNYwO.jpg'),
(55, 'PANTS WITH A HIGH WAIST', '2023-10-14 00:00:00.000000', 'Pants with a high waist and pronounced seams at front and back. Front welt pockets. Front zip, metal hook, and interior button closure.', '', 1, 1, 1, 1, 0, '0.00', '46.00', 0, 'static/images/products/1_img_ZEZvAXH.jpg', 'static/images/products/2_img_86RiHrZ.jpg', 'static/images/products/3_img_U2mPzLj.jpg', 'static/images/products/4_img_TjexYt8.jpg'),
(56, 'Denim Shorts', '2023-10-13 00:00:00.000000', '5-pocket shorts in non-stretch cotton denim. Regular waist, zip fly with button, and back pockets with decorative seams.', 'Size:\r\n    The model is 176cm/5\'9\" and wears a size 4\r\nSize:\r\n    Inner leg: Length: 7.0 cm (Size 6), Waist: Circumference: 82.5 cm (Size 6), Hip: Circumference: 101.0 cm (Size 6)\r\nLength:\r\n    Short\r\nWaist Rise:\r\n    Regular waist\r\nFit:\r\n    Regular fit\r\nDescription:\r\n    Denim blue, Solid-color\r\nImported:\r\n    Yes\r\nConcept:\r\n    DIVIDED', 1, 1, 1, 1, 0, '0.00', '29.00', 0, 'static/images/products/1_img_3sGgKGG.jpg', 'static/images/products/3_img_fnCLa8f.webp', 'static/images/products/5_img_RX7AFm8.webp', 'static/images/products/4_img_zAnzjZF.webp'),
(57, 'Parachute Pants', '2023-10-15 00:00:00.000000', 'Loose-fit pants in woven fabric. Covered elastic at waistband, mock fly, diagonal side pockets, and back pockets with flap. Pleats at knees for added volume and adjustable, elasticized drawstring at hems with cord stopper.', 'Length:\r\n    Long\r\nWaist Rise:\r\n    Regular waist\r\nFit:\r\n    Loose fit\r\nStyle:\r\n    Parachute\r\nDescription:\r\n    Light beige, Solid-', 1, 1, 1, 1, 0, '28.00', '24.00', 10, 'static/images/products/1_image_lhTwB4m.jpg', 'static/images/products/2_image_9SZke9d.jpg', 'static/images/products/3_image_fXuu6A8.jpg', 'static/images/products/4_image_Qo4S2iy.jpg'),
(58, 'Extra-soft Joggers', '2023-10-15 00:00:00.000000', 'Sweatpant joggers in a cotton blend with soft, brushed inside. Waistband with covered elastic and drawstring. Side pockets and ribbed hems.', 'ength:\r\n    Long\r\nWaist Rise:\r\n    Regular waist\r\nStyle:\r\n    Joggers\r\nDescription:\r\n    Black, Solid-color\r\nImported:\r\n    Yes\r\nConcept:\r\n    BASICS', 1, 1, 1, 1, 0, '15.00', '13.00', 10, 'static/images/products/1_image_4mVSLei.jpg', 'static/images/products/2_image_x5FijpC.jpg', 'static/images/products/4_image_CnWnyWB.jpg', ''),
(59, 'PLUSH GARMENT DYED SHORTS', '2023-10-16 00:00:00.000000', 'Plush shorts with elastic waistband and adjustable front drawstring. Front pockets and back patch pockets.\r\n', '', 1, 1, 1, 1, 0, '23.00', '20.00', 10, 'static/images/products/1_image_FJim4AH.jpg', 'static/images/products/3_image_eKMZ4Rl.jpg', 'static/images/products/2_image_cDlJgf4.jpg', 'static/images/products/4_image_6FFJpdr.jpg'),
(60, 'Wide-leg Pants', '2023-10-16 00:00:00.000000', 'Skinny-fit pants in denim-look jersey decorated with rhinestones. Covered elastic at waistband, mock fly, and wide legs. Mock front pockets and open back pockets.', 'Length:\r\n    Long\r\nWaist Rise:\r\n    High waist\r\nFit:\r\n    Skinny fit\r\nStyle:\r\n    Wide-cut\r\nDescription:\r\n    Dark denim blue/silver-colored', 1, 1, 1, 1, 0, '28.00', '34.00', 15, 'static/images/products/1_image_qBzKDl8.jpg', 'static/images/products/2_image_JAvxXNi.jpg', 'static/images/products/3_image_YQ4gmrW.jpg', 'static/images/products/4_image_vkAm8B9.jpg'),
(61, 'BASIC CHINO SHORTS', '2023-10-16 00:00:00.000000', 'Chino shorts with adjustable interior waistband and front button closure. Five pockets. Back label appliqué.', '', 1, 1, 1, 1, 0, '26.00', '22.00', 15, 'static/images/products/2_image_PcBUdEn.jpg', 'static/images/products/3_image_0ZBoIa1.jpg', 'static/images/products/4_images.jpg', 'static/images/products/5_images.jpg'),
(62, '7-pack Boxer Shorts', '2023-10-10 00:00:00.000000', ' Dark blue/Light grey marl', '', 1, 1, 1, 1, 0, '25.00', '23.00', 10, 'static/images/products/1_image_qL0jGlx.jpg', 'static/images/products/2_image_Srzuoav.jpg', '', ''),
(63, '5-pack Cotton Vest Tops', '2023-10-11 00:00:00.000000', 'White/Light blue\r\n\r\n\r\nSize\r\n\r\n    Regular length\r\n\r\nStyle\r\n\r\n    Round neck\r\n\r\nDry Clean Instruction\r\n\r\n    Can be dry cleaned\r\n\r\nDescription\r\n\r\n    Blue\r\n    White/Light blue\r\n    Solid colour\r\n\r\nNICE TO KNOW\r\n\r\n    Conscious choice', '', 1, 1, 1, 1, 0, '27.00', '22.00', 20, 'static/images/products/1_image_zr3O0T7.jpg', '', '', 'static/images/products/2_image_mgIC5kI.jpg'),
(64, '5-pack Boxer Shorts', '2023-10-20 00:00:00.000000', '    Black/Batman', '', 1, 1, 1, 1, 0, '27.00', '22.00', 10, 'static/images/products/1_image_Iu56goK.jpg', '', 'static/images/products/2_image_kBhf03d.jpg', ''),
(65, '5-pack Boxer Shorts for baby girls', '2023-10-21 00:00:00.000000', '    Pink/Unicon', '', 1, 1, 1, 1, 0, '27.00', '22.00', 20, 'static/images/products/1_image_AcCoTiT.jpg', '', 'static/images/products/2_image_3Iyv3gv.jpg', ''),
(66, '3-PACK OF OPENWORK ', '2023-10-21 00:00:00.000000', '3-PACK OF OPENWORK BODYSUITS', 'Pack of three bodysuits with a straight neckline and snap-button fastening at the bottom.\r\n', 1, 1, 1, 1, 0, '22.00', '19.00', 10, 'static/images/products/1_image_4QT5yHi.jpg', 'static/images/products/3_image_sboMG0n.jpg', 'static/images/products/2_image_WRivfDf.jpg', 'static/images/products/4_image_zvS1GC6.jpg'),
(67, '5-pack Xtra Life™ Short Trunks', '2023-10-20 00:00:00.000000', '\r\nSize\r\n\r\n    Short\r\n\r\nStyle\r\n\r\n    Trunks\r\n\r\nCare instructions\r\n\r\n    Machine wash at 60°\r\n\r\nDry Clean Instruction\r\n\r\n    No dry clean', 'Description\r\n    Blue\r\n    Mustard yellow/Palm Trees\r\n    Palm trees, pineapples\r\n    Patterned', 1, 1, 1, 1, 0, '30.00', '24.00', 20, 'static/images/products/1_img_Uy4CPN1.jpg', 'static/images/products/2_img_PetjA5q.jpg', 'static/images/products/3_img_zPvaDh2.jpg', ''),
(68, 'Men’s Lacoste Crocodile Print Trunk 3-Pack', '2023-10-21 00:00:00.000000', 'Description\r\nProduct Ref. 5H2082-00\r\n\r\nMen’s Lacoste Crocodile Print Trunk Three-Pack\r\n\r\n    Contrast crocodile on waistbands:\r\n    Stretch cotton jersey:', '', 1, 1, 1, 1, 0, '71.00', '49.00', 30, 'static/images/products/1_image_oJwT5H5.jpg', 'static/images/products/2_image_P5ZzGUH.jpg', 'static/images/products/3_image_NrGiwPn.jpg', 'static/images/products/4_image_bpu5A0u.jpg'),
(69, 'Men\'s UA Tech', '2023-10-22 00:00:00.000000', 'We took our sweat-wicking, keeps-you-cool technology and turned it into the best underwear in the game. It feels cool, stays put, and provides a zero-distraction fit that\'s snug, but not tight.', 'Insanely soft, breathable fabric & articulated mesh fly panel & gusset\r\n    No side or back seams for ultimate comfort\r\n    4-way stretch material moves better in every direction\r\n    Material wicks sweat & dries really fast\r\n    Performance waistband with metallic wordmark', 1, 1, 1, 1, 0, '35.00', '10.00', 30, 'static/images/products/1_image_rfjp4kW.jpg', 'static/images/products/2_image_RTQKS8p.jpg', 'static/images/products/3_image_8K2nkjO.jpg', 'static/images/products/4_image_q0vSKz1.jpg'),
(70, 'Men’s Ultra-Soft Cotton Boxer 3-Pack', '2023-10-22 00:00:00.000000', 'Navy Blue / Bordeaux / Navy Blue - REI', 'Men’s Lacoste Ultra-Soft Cotton Boxer 3-Pack\r\n\r\n    Elasticised waistband with contrasting jacquard crocodile\r\n    Comfortable, supportive cut in all circumstances\r\n    Underwear cannot be returned, exchanged or reimbursed', 1, 1, 1, 1, 0, '82.00', '24.00', 30, 'static/images/products/1_image_Ex3qm42.jpg', 'static/images/products/2_image_6HgPFZj.jpg', 'static/images/products/3_image_2bh3kgn.jpg', 'static/images/products/4_image_MI1HRQS.jpg'),
(71, 'Men\'s Charged Cotton', '2023-10-25 00:00:00.000000', 'Mother nature made cotton, we made it better. These men\'s quickdry boxer shorts are built with Charged Cotton®. They have the soft feel of natural cotton, but they dry much faster and stretch way more.', 'Lightweight, Charged Cotton® fabric has the comfort of cotton, but dries much faster\r\n    No side or back seams for ultimate comfort\r\n    4-way stretch material moves better in every direction\r\n    Material wicks sweat & dries really fast\r\n    Performance waistband with matte wordmark', 1, 1, 1, 1, 0, '40.00', '30.00', 25, 'static/images/products/1_image_O6iquwC.jpg', 'static/images/products/2_image_z6OHUkJ.jpg', 'static/images/products/3_image_RunAaEI.jpg', 'static/images/products/4_image_p0d27QJ.jpg'),
(72, ' Xtra Life™ Mid Trunks', '2023-10-10 00:00:00.000000', 'Trunks in stretch jersey with flatlock seams for added comfort. Elasticated waist, a lined front and slightly longer legs. Made using Lycra® Xtra Life™ technology for high comfort and long-lasting shape. ', 'Size\r\n\r\n    Regular length\r\n\r\nStyle\r\n\r\n    Trunks\r\n\r\nDry Clean Instruction\r\n\r\n    No dry clean\r\n', 1, 1, 1, 1, 0, '0.00', '22.00', 0, 'static/images/products/1_img_2HmiqFI.jpg', 'static/images/products/2_img_wEcT2hS.jpg', 'static/images/products/3_img_zwtPqdZ.jpg', ''),
(73, 'Adicane Slides', '2023-10-24 00:00:00.000000', 'Score up to 20% off. Use promo code OCTOBER at checkout.\r\nShop Eligible Products', 'Shop Eligible Products', 1, 1, 1, 1, 0, '50.00', '40.00', 20, 'static/images/products/1_image_yk5BZdv.jpg', 'static/images/products/2_image_aRyGmsu.jpg', 'static/images/products/3_image_6fq8xGM.jpg', 'static/images/products/4_image_ajSui6U.jpg'),
(74, 'Comfort Flip-Flops', '2023-10-30 00:00:00.000000', 'Score up to % off. Use promo code OCTOBER at checkout.', '', 1, 1, 1, 1, 0, '0.00', '32.00', 0, 'static/images/products/1_image_FbJkJx0.jpg', 'static/images/products/2_image_m7geMgl.jpg', 'static/images/products/3_image_y5LSbRl.jpg', 'static/images/products/4_image_ZiWvvi4.jpg'),
(75, 'Campus 00s Shoes', '2023-10-31 00:00:00.000000', 'This product is excluded from all promotional discounts and offers.', '', 1, 1, 1, 1, 0, '106.00', '74.00', 30, 'static/images/products/1_image_OaIAB4V.jpg', 'static/images/products/2_image_PWtg5do.jpg', 'static/images/products/3_image_oe8bSD0.jpg', 'static/images/products/4_image_n1G9Poe.jpg'),
(76, 'Sabrina 1 \"Grounded\" Basketball Shoes', '2023-10-31 00:00:00.000000', 'Sabrina Ionescu\'s game is unique, hard to define and built with an undeniable craft. Her signature shoe helps you unlock your versatility with a snappy forefoot Zoom Air unit and cloud-like React foam to help keep you energized.', 'We used insights from next-gen athletes of all genders around the world to bring grippy, best-in-class traction, reliable midfoot support and stability to the court—which every hooper needs. Built for crafty players like Sabrina, but made for anyone who\'s ready to put in the work to take their game to the next level.', 1, 1, 1, 1, 0, '130.00', '91.00', 30, 'static/images/products/1_image_5uOc3p5.jpg', 'static/images/products/2_image_JfwHXmV.jpg', 'static/images/products/3_image_fkUTm6B.jpg', 'static/images/products/4_image_lc46N8C.jpg'),
(105, ' Men\'s UA Essential Fleece Paint Crew', '2023-11-13 00:00:00.000000', '\r\nWarm-ups aren\'t just about being comfy before the big game—though this fleece is easily some of the most comfortable you\'ve ever felt—it\'s about being in the right headspace, getting focused, and keeping your body ready.\r\n', ' Ultra-soft, mid-weight cotton-blend fleece with brushed interior for extra warmth\r\n    Ribbed collar, cuffs & bottom hem\r\n\r\n    Loose: Fuller cut for complete comfort.\r\n    Machine wash cold with like colors\r\n    Do not bleach\r\n    Tumble dry low\r\n    Do not use softeners\r\n    Do not iron\r\n    Do not dry clean', 1, 1, 1, 1, 0, '0.00', '60.00', 0, 'static/images/products/1_image_jmSdkDF.jpg', 'static/images/products/2_image_AhqDXCD.jpg', 'static/images/products/3_image_qz6jw1e.jpg', 'static/images/products/4_image_XMmLnDx.jpg'),
(78, 'Sabrina 1 \"Grounded\"', '2023-10-31 00:00:00.000000', 'Sabrina Ionescu\'s game is unique, hard to define and built with an undeniable craft. Her signature shoe helps you unlock your versatility with a snappy forefoot Zoom Air unit and cloud-like React foam to help keep you energized. We used insights from next-gen athletes of all genders around the world to bring grippy, best-in-class traction, reliable midfoot support and stability to the court—which every hooper needs. Built for crafty players like Sabrina, but made for anyone who\'s ready to put in the work to take their game to the next level.', '', 1, 1, 1, 1, 0, '130.00', '91.00', 30, 'static/images/products/1_image_hWoGEnc.jpg', 'static/images/products/2_image_B9WNZXu.jpg', 'static/images/products/3_image_3AENWyh.jpg', 'static/images/products/4_image_bBhiwzw.jpg'),
(79, 'Basketball Shoes', '2023-10-31 00:00:00.000000', 'You bring the speed. We\'ll bring the stability. The Luka 2 is built to support your skills, with an emphasis on step-backs, side-steps and quick-stop action. A stacked midsole features firm, flexible cushioning for added responsiveness as you shift back and forth on the court. Up top, the full-foot wrapped cage design helps you stay contained whether you\'re faking out a defender or driving down the lane. With all that tech in a lightweight package, we\'ve got efficiency covered. The rest is up to you.', 'hen you’re shifting side to side, you need support that\'s firm—but not rigid. A wedge of cushioning in the midsole butts up against the medial sidewall so you can bank like a champ, and a thick, molded insole helps you stay grounded.\r\n\r\nLast-Step Efficiency\r\n\r\nThe other aspect of side-to-side movement? Lateral support. To help your quick stops feel secure, we added a strong, flexible plate that runs up the lateral sidewall, complimented by a firm foam carrier and Formula 23 foam in the midsole.\r\n\r\n360 Degrees of Support\r\n\r\nA sturdy cage wraps around the entire upper for 360-degree connected support that help your feet stay securely contained, no matter which way you step', 1, 1, 1, 1, 0, '130.00', '97.00', 30, 'static/images/products/1_image_iBx54xC.jpg', 'static/images/products/2_image_V7zhNlr.jpg', 'static/images/products/3_image_5aGdXsj.jpg', 'static/images/products/4_image_166wRcy.jpg'),
(80, 'V-neck Sleeveless Top', '2023-11-14 00:00:00.000000', 'Fabric/Material\r\nCotton 96%, Spandex 4%', '', 1, 1, 1, 1, 0, '36.00', '31.00', 15, 'static/images/products/1_image_0WhIcbA.jpg', 'static/images/products/2_image_80T3xGW.jpg', 'static/images/products/3_image_Ytkn5CB.jpg', 'static/images/products/4_image_GMlqOlv.jpg'),
(81, 'Women\'s UA Pure Stretch Thong 3-Pack Underwear', '2023-11-01 00:00:00.000000', 'Good underwear goes unnoticed. Super-soft laser-cut edges offer a smooth, virtually invisible fit under everything from a pair of run shorts to our most body-hugging compression leggings.\r\n', ' Super-soft stretch fabric delivers excellent all-day comfort for any activity\r\n    Laser cut edges offer a hem-free construction for a smoother, more flattering silhouette\r\n    4-way stretch material moves better in every direction\r\n    Exposed back ensures a seamless look even under UA Compression\r\n    Soft cotton gusset\r\n    Tagless construction\r\n    3 pairs', 1, 1, 1, 1, 0, '25.00', '21.00', 15, 'static/images/products/1_image_VozX85Q.jpg', 'static/images/products/2_image_YWRjxHC.jpg', 'static/images/products/3_image_1zsjdjF.jpg', 'static/images/products/4_image_De5AjUI.jpg'),
(86, 'Women\'s leather lug sole loafer', '2023-11-01 00:00:00.000000', 'A lug sole Horsebit loafer with blue rosebud print lining on the insole. A mainstay in Gucci history since the \'50s, the classic Horsebit loafer bridges the past to the present. A homage to the House\'s heritage rooted in the equestrian world, the emblematic shape is reworked in a contemporary shape on a rubber lug sole.', '  Black shiny leather\r\n    Women\'s\r\n    Gold embroidered bee on the back\r\n    Horsebit detail\r\n    Rubber lug sole\r\n    Low-heel\r\n    1\" height\r\n    Made in Italy\r\n    Blue rosebud print lining', 1, 1, 1, 1, 0, '1150.00', '805.00', 30, 'static/images/products/1_image_qISL0K0.jpg', 'static/images/products/2_image_k6MJkMo.jpg', 'static/images/products/3_image_eA4uuaX.jpg', 'static/images/products/4_image_QNluEwa.jpg'),
(83, 'Women\'s UA Pure Stretch', '2023-11-01 00:00:00.000000', 'Good underwear goes unnoticed. Super-soft laser-cut edges offer a smooth, virtually invisible fit under everything from a pair of run shorts to our most body-hugging compression leggings.', 'Super-soft stretch fabric delivers excellent all-day comfort for any activity\r\n    Laser cut edges offer a hem-free construction for a smoother, more flattering silhouette\r\n    4-way stretch material moves better in every direction\r\n    Fuller back for the perfect amount of coverage\r\n    Soft cotton gusset\r\n    Tagless construction', 1, 1, 1, 1, 0, '25.00', '21.00', 15, 'static/images/products/1_image_gf2x49f.jpg', 'static/images/products/2_image_qEKx9MD.jpg', 'static/images/products/3_image_CDfNEH7.jpg', 'static/images/products/4_image_CpzHSgz.jpg'),
(84, 'JUSTONE Hall Cap Tencel Round Sleeveless Tee Shirt', '2023-11-01 00:00:00.000000', 'Fabric/Material\r\nN/A\r\n', '', 1, 1, 1, 1, 0, '24.00', '18.00', 25, 'static/images/products/1_image_fa0O6hl.jpg', 'static/images/products/2_image_00LTSrw.jpg', 'static/images/products/3_image_L2gURuw.jpg', 'static/images/products/4_image_B9ebF8K.jpg'),
(85, 'CURTAIN STRING BIKINI BOTTOMS', '2023-11-01 00:00:00.000000', 'We work with monitoring programmes to ensure compliance with our social, environmental and health and safety standards for our products. To assess compliance, we have developed a programme of audits and continuous improvement plans.', 'OUTER SHELL\r\n85% polyamide\r\n15% elastane\r\nLINING\r\n92% polyamide\r\n8% elastane\r\nCARE\r\nCaring for your clothes is caring for the environment.\r\nLower temperature washes and delicate spin cycles are gentler on garments and help to protect the colour, shape and structure of the fabric. Furthermore, they reduce the amount of energy used in care processes. ', 1, 1, 1, 1, 0, '27.00', '22.00', 15, 'static/images/products/1_image_65CzSgy.jpg', 'static/images/products/2_image_BEdYJ57.jpg', 'static/images/products/3_image_mQm74Sn.jpg', 'static/images/products/4_image_HD1ufhw.jpg'),
(87, 'Women\'s thong sandal with Horsebit', '2023-11-01 00:00:00.000000', '\r\nOne of the House\'s most emblematic codes, the Horsebit appears each season, revitalized through contemporary silhouettes and materials. This sandal brings together the equestrian hardware with both contemporary details, such as the metallic silver leather and unique silhouette', 'Metallic silver leather\r\n    Women\'s\r\n    Palladium-toned hardware\r\n    Horsebit\r\n    Interlocking G detail on heel\r\n    Leather sole\r\n    Mid-heel\r\n    Made in Italy', 1, 1, 1, 1, 0, '0.00', '890.00', 0, 'static/images/products/1_image_7ZmtrKp.jpg', 'static/images/products/2_image_lblpzWU.jpg', 'static/images/products/3_image_UjHX4s7.jpg', 'static/images/products/4_image_d9A9kwA.jpg'),
(88, 'Jordan Sophia Women\'s Slides', '2023-11-01 00:00:00.000000', '\r\nPlush comfort is a must for your wardrobe—and footwear is no exception. These luxe slides have pillowy, criss-cross straps lined with fabric that feels soft against your skin. Air cushioning and a slight platform give you that \'walking on clouds\' feel with every step.', '\r\nBenefits\r\n\r\n    Nike Air technology absorbs impact for cushioning with every step.\r\n    Padded, criss-cross strap with lined underside feels soft and comfortable.\r\n    Foam in the midsole with Air-Sole unit in heel cushions every step.\r\n    Durable rubber tread gives you excellent traction.\r\n\r\n\r\nProduct Details\r\n\r\n    Perforations beneath your heel\r\n \r\n  ', 1, 1, 1, 1, 0, '0.00', '85.00', 0, 'static/images/products/1_image_Q18O95N.jpg', 'static/images/products/2_image_lAH50S5.jpg', 'static/images/products/3_image_wZSab2C.jpg', 'static/images/products/4_image_WolmyVJ.jpg'),
(89, 'Nizza Platform Shoes', '2023-11-01 00:00:00.000000', 'Lace closure\r\n    Textile upper\r\n    EVA sockliner\r\n    Vulcanized rubber platform outsole', '', 1, 1, 1, 1, 0, '75.00', '60.00', 20, 'static/images/products/1_image_W6U8uCj.jpg', 'static/images/products/2_image_VCcpn29.jpg', 'static/images/products/3_image_FQFVHVW.jpg', 'static/images/products/4_image_Ow6VbQ6.jpg'),
(90, 'Women\'s • Essentials Cloudfoam Pure Shoes', '2023-11-01 00:00:00.000000', 'Score up to 65% off. Use promo code OCTOBER at checkout.\r\n\r\n    Regular fit\r\n    Lace closure\r\n    Textile upper\r\n    Cloudfoam midsole\r\n    Textile lining', ' Rubber outsole\r\n    Upper contains a minimum of 50% recycled content', 1, 1, 1, 1, 0, '75.00', '60.00', 20, 'static/images/products/1_image_3eELvFu.jpg', 'static/images/products/2_image_sUSk1JA.jpg', 'static/images/products/3_image_5k00iR4.jpg', 'static/images/products/4_image_gdJTM04.jpg'),
(91, 'Nike Dunk Low SE Big Kids\' Shoes', '2023-11-02 00:00:00.000000', '\r\nCelebrate your endless potential and the power of play in this special edition Nike Dunk. With durable leather and traction, we designed these with future all-stars in mind. Pull them on, lace \'em up and show the world how you choose to have fun.', '', 1, 1, 1, 1, 0, '0.00', '95.00', 0, 'static/images/products/1_image_6w7LySP.jpg', 'static/images/products/2_image_b3OLpt1.jpg', 'static/images/products/3_image_J4Z0kmY.jpg', 'static/images/products/4_image_zEsnhp9.jpg'),
(92, 'Jordan 11 Retro Baby/Toddler Shoes', '2023-11-02 00:00:00.000000', 'Get in Line. Get the goods.\r\n\r\nCreate or sign in to your free Nike Member account for a chance to buy this product the moment it\'s released.', 'No need to journey into the jungle for their next pair of kicks. Free your child\'s wild side with a lively animal print. Hear them roar! Get yourself a matching pair with the Women\'s Air Jordan 11 Retro.', 1, 1, 1, 1, 0, '85.00', '63.00', 25, 'static/images/products/1_image_z1fpXfV.jpg', 'static/images/products/2_image_fMI5EBV.jpg', 'static/images/products/3_image_AHXhcgQ.jpg', 'static/images/products/4_image_7MJdt8U.jpg'),
(93, 'Children\'s ballerina flat', '2023-11-02 00:00:00.000000', '\r\n\r\nThis ballerina flat is introduced in pink check wool. The silhouette features the signature Horsebit hardware and is complete with a velcro closure.', '   Pink check wool\r\n    Leather trim\r\n    Palladium-toned hardware\r\n    Horsebit\r\n    Leather sole\r\n    Adjustable velcro hook-and-loop strap closure\r\n    Made in Italy', 1, 1, 1, 1, 0, '650.00', '455.00', 30, 'static/images/products/1_image_uNl3qFG.jpg', 'static/images/products/2_image_MF1lVSp.jpg', 'static/images/products/3_images.jpg', 'static/images/products/4_image_gyW4sdF.jpg'),
(94, 'Children\'s leather platform sneaker', '2023-11-02 00:00:00.000000', 'This white leather sneaker presents the emblematic Double G in a geometric version, while a pink leather detail of the Interlocking G logo decorates the back of the shoe, completing the design with a logo feel.', '    White leather and pink Double G geometric cotton jacquard\r\n    Pink leather detail at the back with Interlocking G logo\r\n    Rubber sole\r\n    Gucci logo embossed at heel\r\n    Lace-up closure', 1, 1, 1, 1, 0, '550.00', '385.00', 30, 'static/images/products/1_image_8ecKBqJ.jpg', 'static/images/products/2_image_uXbaOAF.jpg', 'static/images/products/3_image_14w6X9a.jpg', 'static/images/products/4_image_n9Wi1jE.jpg'),
(95, 'Racer TR23 Shoes Kids', '2023-11-02 00:00:00.000000', '\r\n    Regular fit\r\n    Elastic lace closure with hook-and-loop strap\r\n    Mesh upper\r\n    Cloudfoam midsole\r\n    Textile lining', ' Upper contains a minimum of 50% recycled content\r\n    Imported', 1, 1, 1, 1, 0, '45.00', '40.00', 10, 'static/images/products/1_image_TFUrifk.jpg', 'static/images/products/2_image_qC9VktF.jpg', 'static/images/products/3_image_jRSH2NY.jpg', 'static/images/products/4_image_KG3faxF.jpg'),
(99, 'Jersey Mini Skirt', '2023-11-05 00:00:00.000000', 'Short, fitted skirt in soft jersey. High waist with concealed elastication and a small slit at the front of the hem.', 'Size\r\n\r\n    High waist\r\n\r\nFIT\r\n\r\n    Fitted \r\n\r\nStyle\r\n\r\n    Slit\r\n\r\nDry Clean Instruction\r\n\r\n    No dry clean', 1, 1, 1, 1, 0, '617.00', '308.00', 50, 'static/images/products/1_image_IwKXLMD.jpg', 'static/images/products/2_image_0n7FIHi.jpg', 'static/images/products/3_image_et3Ev5N.jpg', 'static/images/products/4_image_Le5q0F2.jpg'),
(100, 'Men\'s Curry Mesh Shorts', '2023-11-05 00:00:00.000000', '\"Everything I put my name on has to be good—it has to help you play and it has to support our mission to change the game for good.\" – Stephen ', '  All-over mesh fabric is soft & extremely breathable\r\n    Material wicks sweat & dries really fast\r\n    Stretchy ribbed waistband with internal drawcord\r\n    Secure, zip hand pockets\r\n    Side notched hem for added mobility', 1, 1, 1, 1, 0, '84.00', '58.00', 30, 'static/images/products/1_image_syEkZnV.jpg', 'static/images/products/2_image_13t9avb.jpg', 'static/images/products/3_image_sNE200q.jpg', 'static/images/products/4_image_ZpkWMlC.jpg'),
(106, 'Gazelle Low Trainers', '2023-11-13 00:00:00.000000', 'Lace up a pair of adidas Gazelles and feel the nostalgia rolling in. Bringing back the 1991 form, this reissue offers a soft upper that gives you comfort all day. Contrasting details pop against the sleek silhouette, and a rubber outsole keeps things true to the original.', '\r\nRegular fit\r\n\r\n    Lace closure\r\n    Synthetic upper\r\n    Synthetic lining\r\n\r\n    Rubber outsole', 1, 1, 1, 1, 0, '1106.00', '95.00', 10, 'static/images/products/1_image_DAzzTvY.jpg', 'static/images/products/2_image_WjBC06i.jpg', 'static/images/products/3_image_LEXZo5s.jpg', 'static/images/products/4_image_4pPnu7q.jpg'),
(107, 'A-line Skirt', '2023-11-13 00:00:00.000000', 'Size\r\n\r\n    Short\r\n\r\nFIT\r\n\r\n    Slim fit\r\n\r\nStyle\r\n\r\n    A-line\r\n\r\nComposition\r\n\r\n    shell Polyester 100.0%\r\n    lining Polyester 100.0%\r\n\r\nDry Clean Instruction\r\n\r\n    No dry clean\r\n', 'Description\r\n\r\n    Black\r\n    Black\r\n    Solid colour\r\n\r\nConcept\r\n\r\n    MODERN CLASSIC', 1, 1, 1, 1, 0, '39.00', '31.00', 20, 'static/images/products/1_image_G62w43a.jpg', 'static/images/products/2_image_hH7h7LA.jpg', 'static/images/products/3_image_kTba2vl.jpg', 'static/images/products/4_image_sPzoAdI.jpg'),
(108, 'WOOL BLEND PARKA WITH HOOD', '2023-11-13 00:00:00.000000', 'Hooded parka with long sleeves. Front toggle fastening. Patch pockets on the front. Made of 43% wool.', 'COMPOSITION, CARE & ORIGIN\r\nCOMPOSITION\r\nWe work with monitoring programmes to ensure compliance with our social, environmental and health and safety standards for our products. To assess compliance, we have developed a programme of audits and continuous improvement plans.\r\nOUTER SHELL\r\n57% viscose\r\n43% wool\r\nLINING\r\nMAIN FABRIC\r\n100% cotton\r\nSLEEVES\r\n100% polyester\r\nCARE\r\nCaring for your clothes is caring for the environment.\r\nTo keep your jackets and coats clean, you only need to freshen them up and go over them with a cloth or a clothes brush. This process is more gentle on fabrics and also reduces water and energy consumption when washing. \r\n\r\nClothing Care Guide\r\n\r\n    [car]7Machine wash at max. 30ºC/86ºF with short spin cycle\r\n    [car]14Do not use bleach\r\n    [car]18Iron at a maximum of 110ºC/230ºF\r\n    [car]28Do not dry clean\r\n    [car]35Do not tumble dry\r\n    [car]61Wash inside out\r\n    [car]69Use a laundry bag\r\n', 1, 1, 1, 1, 0, '50.00', '40.00', 20, 'static/images/products/1_image_8IIl7n2.jpg', 'static/images/products/2_image_gfrXBwL.jpg', 'static/images/products/3_image_xqPHPTj.jpg', ''),
(109, 'EMBROIDERED BLOUSE', '2023-11-13 00:00:00.000000', 'Short sleeve blouse with a V-neckline at the front and back. Featuring matching embroidery and a drawstring at the back.\r\n', 'We work with monitoring programmes to ensure compliance with our social, environmental and health and safety standards for our products. To assess compliance, we have developed a programme of audits and continuous improvement plans.aring for your clothes is caring for the environment.\r\nLower temperature washes and delicate spin cycles are gentler on garments and help to protect the colour, shape and structure of the fabric. Furthermore, they reduce the amount of energy used in care processes. ', 1, 1, 1, 1, 0, '48.00', '43.00', 10, 'static/images/products/1_image_5rFcd0g.jpg', 'static/images/products/2_image_bhpzVcq.jpg', 'static/images/products/3_image_FxSNBRe.jpg', 'static/images/products/4_image_jXoUZBv.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_catego`
--

DROP TABLE IF EXISTS `product_catego`;
CREATE TABLE IF NOT EXISTS `product_catego` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `categories_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_catego_product_id_categories_id_19772b69_uniq` (`product_id`,`categories_id`),
  KEY `product_catego_product_id_be27b368` (`product_id`),
  KEY `product_catego_categories_id_bf3a5648` (`categories_id`)
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_catego`
--

INSERT INTO `product_catego` (`id`, `product_id`, `categories_id`) VALUES
(1, 1, 1),
(97, 98, 1),
(96, 97, 1),
(106, 107, 1),
(105, 106, 1),
(95, 96, 1),
(104, 105, 1),
(103, 104, 1),
(102, 103, 1),
(101, 102, 1),
(100, 101, 1),
(12, 12, 2),
(13, 13, 2),
(14, 14, 2),
(31, 32, 3),
(32, 33, 2),
(33, 34, 2),
(34, 35, 3),
(35, 36, 2),
(36, 37, 3),
(37, 38, 3),
(38, 39, 3),
(40, 41, 4),
(41, 42, 4),
(42, 43, 4),
(43, 44, 4),
(44, 45, 4),
(45, 46, 2),
(46, 47, 2),
(47, 48, 2),
(48, 49, 2),
(49, 50, 2),
(50, 51, 2),
(51, 52, 3),
(52, 53, 3),
(53, 54, 3),
(54, 55, 3),
(55, 56, 3),
(56, 57, 4),
(57, 58, 4),
(58, 59, 4),
(59, 60, 4),
(60, 61, 4),
(61, 62, 4),
(62, 63, 4),
(63, 64, 4),
(64, 65, 4),
(65, 66, 4),
(66, 67, 2),
(67, 68, 2),
(68, 69, 2),
(69, 70, 2),
(70, 71, 2),
(71, 72, 2),
(72, 73, 2),
(73, 74, 2),
(74, 75, 2),
(75, 76, 2),
(107, 108, 1),
(77, 78, 2),
(78, 79, 2),
(79, 80, 3),
(80, 81, 3),
(85, 86, 3),
(82, 83, 3),
(83, 84, 3),
(84, 85, 3),
(86, 87, 3),
(87, 88, 3),
(88, 89, 3),
(89, 90, 3),
(90, 91, 4),
(91, 92, 4),
(92, 93, 4),
(93, 94, 4),
(94, 95, 4),
(98, 99, 1),
(99, 100, 1),
(108, 109, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_subcatego`
--

DROP TABLE IF EXISTS `product_subcatego`;
CREATE TABLE IF NOT EXISTS `product_subcatego` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL,
  `subcategories_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_subcatego_product_id_subcategories_id_d50fdb1d_uniq` (`product_id`,`subcategories_id`),
  KEY `product_subcatego_product_id_84b8ff54` (`product_id`),
  KEY `product_subcatego_subcategories_id_01cc2fd9` (`subcategories_id`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_subcatego`
--

INSERT INTO `product_subcatego` (`id`, `product_id`, `subcategories_id`) VALUES
(2, 1, 1),
(103, 98, 1),
(102, 97, 1),
(114, 107, 3),
(113, 106, 3),
(101, 96, 1),
(112, 105, 3),
(111, 104, 3),
(110, 103, 2),
(109, 102, 2),
(108, 101, 2),
(13, 12, 7),
(14, 13, 7),
(15, 14, 7),
(31, 34, 7),
(29, 32, 11),
(30, 33, 7),
(36, 35, 11),
(37, 36, 7),
(38, 37, 11),
(39, 38, 11),
(40, 39, 11),
(42, 41, 17),
(43, 42, 17),
(46, 43, 17),
(47, 44, 17),
(48, 45, 17),
(49, 46, 8),
(50, 47, 8),
(51, 48, 8),
(52, 49, 8),
(53, 50, 8),
(54, 51, 8),
(55, 52, 12),
(56, 53, 12),
(57, 54, 12),
(58, 55, 12),
(59, 56, 12),
(60, 57, 18),
(61, 58, 18),
(62, 59, 18),
(63, 60, 18),
(64, 61, 18),
(65, 62, 19),
(66, 63, 19),
(67, 64, 19),
(68, 65, 19),
(69, 66, 19),
(71, 67, 9),
(72, 68, 9),
(73, 69, 9),
(75, 70, 9),
(76, 71, 9),
(77, 72, 9),
(78, 73, 10),
(79, 74, 10),
(80, 75, 10),
(81, 76, 10),
(115, 108, 3),
(83, 78, 10),
(84, 79, 10),
(85, 80, 13),
(86, 81, 13),
(91, 86, 14),
(88, 83, 13),
(89, 84, 13),
(90, 85, 13),
(92, 87, 14),
(93, 88, 14),
(94, 89, 14),
(95, 90, 14),
(96, 91, 20),
(97, 92, 20),
(98, 93, 20),
(99, 94, 20),
(100, 95, 20),
(104, 99, 1),
(107, 100, 2),
(116, 109, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
CREATE TABLE IF NOT EXISTS `sub_categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`) VALUES
(1, 'don\'t_want_to_miss'),
(2, 'best sellers'),
(3, 'new arrivals'),
(4, 'high-interest'),
(5, 'home_sliders'),
(6, 'men_billboards'),
(7, 'men_shirts'),
(8, 'men_pants'),
(9, 'men_underwares'),
(10, 'men_shoes'),
(11, 'women_shirts'),
(12, 'women_pants'),
(13, 'women_underwares'),
(14, 'women_shoes'),
(15, 'women_skirts'),
(16, 'women_billboards'),
(17, 'kids_shirts'),
(18, 'kids_pants'),
(19, 'kids_pats'),
(20, 'kids_shoes'),
(21, 'kids_others'),
(22, 'kids_sliders');

-- --------------------------------------------------------

--
-- Table structure for table `tempimage`
--

DROP TABLE IF EXISTS `tempimage`;
CREATE TABLE IF NOT EXISTS `tempimage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `temp_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tem_order`
--

DROP TABLE IF EXISTS `tem_order`;
CREATE TABLE IF NOT EXISTS `tem_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `size` varchar(50) NOT NULL,
  `quan` int(11) NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `product_id` int(11) NOT NULL,
  `userordertime` datetime(6) DEFAULT NULL,
  `usersessionname` varchar(254) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

DROP TABLE IF EXISTS `userlogin`;
CREATE TABLE IF NOT EXISTS `userlogin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstname` longtext NOT NULL,
  `lastname` longtext NOT NULL,
  `email` varchar(254) NOT NULL,
  `first_password` varchar(50) NOT NULL,
  `second_password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`id`, `firstname`, `lastname`, `email`, `first_password`, `second_password`) VALUES
(5, 'AUNG ', 'KO KO', 'aungkoko@gmail.com', 'aung', 'aung'),
(6, 'Min', 'Thiha', 'solomonthiha9080@gmail.com', 'minthiha', 'minthiha');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
