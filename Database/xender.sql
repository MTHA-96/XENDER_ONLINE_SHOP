-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 24, 2023 at 08:39 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `advertisement`
--

DROP TABLE IF EXISTS `advertisement`;
CREATE TABLE IF NOT EXISTS `advertisement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_caption` varchar(100) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `adv_id` int NOT NULL,
  `second_caption` varchar(100) NOT NULL,
  `third_caption` varchar(100) NOT NULL,
  `fourth_caption` varchar(100) NOT NULL,
  `fifth_caption` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advertisement`
--

INSERT INTO `advertisement` (`id`, `first_caption`, `date`, `adv_id`, `second_caption`, `third_caption`, `fourth_caption`, `fifth_caption`, `image`) VALUES
(1, 'c', '2023-08-05 00:00:00.000000', 3, 'f', 'o', 'k', 's', 'static/images/billboards&others/update_1iIzxEs.png'),
(2, 'option', '2023-08-09 00:00:00.000000', 1, 'commtetn', 'objection', 'somtein', 'sdfafdd', 'static/images/billboards&others/1_wm_VVIvhfP.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_category`
--

DROP TABLE IF EXISTS `advertisement_category`;
CREATE TABLE IF NOT EXISTS `advertisement_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `advertisement_id` bigint NOT NULL,
  `categories_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `advertisement_category_advertisement_id_categor_378de110_uniq` (`advertisement_id`,`categories_id`),
  KEY `advertisement_category_advertisement_id_09dcd001` (`advertisement_id`),
  KEY `advertisement_category_categories_id_94cf9b5f` (`categories_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advertisement_category`
--

INSERT INTO `advertisement_category` (`id`, `advertisement_id`, `categories_id`) VALUES
(1, 1, 5),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `advertisement_sub_category`
--

DROP TABLE IF EXISTS `advertisement_sub_category`;
CREATE TABLE IF NOT EXISTS `advertisement_sub_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `advertisement_id` bigint NOT NULL,
  `subcategories_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `advertisement_sub_catego_advertisement_id_subcate_8900995c_uniq` (`advertisement_id`,`subcategories_id`),
  KEY `advertisement_sub_category_advertisement_id_a3d05f5e` (`advertisement_id`),
  KEY `advertisement_sub_category_subcategories_id_c081a0a2` (`subcategories_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advertisement_sub_category`
--

INSERT INTO `advertisement_sub_category` (`id`, `advertisement_id`, `subcategories_id`) VALUES
(1, 1, 3),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

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
(68, 'Can view temp image', 17, 'view_tempimage');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'men'),
(2, 'women'),
(3, 'kids'),
(4, 'billboards'),
(5, 'sliders'),
(6, 'partners'),
(7, 'payment_methods');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(256) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(256) NOT NULL,
  `city` varchar(30) NOT NULL,
  `payment_method` varchar(25) NOT NULL,
  `card_no` varchar(20) NOT NULL,
  `card_exp_date` datetime(6) DEFAULT NULL,
  `cvv_no` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `city`, `payment_method`, `card_no`, `card_exp_date`, `cvv_no`) VALUES
(4, 'KO  KO', 'koko@gmail.com', '+95983729', 'adfun dfdig ', 'yagon', 'cash_on_delivery', '2332323', '2023-07-26 00:00:00.000000', '4553434'),
(5, 'MIN THIHA', 'solomonthiha9080@gmail.com', '+9587873763', '', '', 'master', '00000-00000-000', '2023-07-18 00:00:00.000000', '344233'),
(6, 'MIN THIHA', 'solomonthiha9080@gmail.com', '+9587873763', '', '', 'master', '00000-00000-000', '2023-07-18 00:00:00.000000', '344233'),
(7, 'AUNG AUNG AUNG', 'aungaung@gmail.com', '+444555', 'AJFIDF ', 'BLAH', 'cash_on_delivery', '4455`', '2023-07-28 00:00:00.000000', '888');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

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
(17, 'adminpannel', 'tempimage');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

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
(19, 'adminpannel', '0001_initial', '2023-07-08 11:51:06.405388'),
(20, 'user', '0001_initial', '2023-07-08 11:51:36.529384'),
(21, 'adminpannel', '0002_customers', '2023-07-09 13:59:51.167731'),
(22, 'user', '0002_order', '2023-07-10 13:11:20.680960'),
(23, 'adminpannel', '0003_feedback', '2023-07-19 12:35:07.105399'),
(24, 'user', '0003_alter_product_date', '2023-08-19 07:28:09.566596'),
(25, 'adminpannel', '0004_advertisement', '2023-08-19 13:34:52.344649'),
(26, 'adminpannel', '0005_tempimage', '2023-08-24 07:51:25.401907'),
(27, 'adminpannel', '0006_alter_tempimage_options_alter_tempimage_table', '2023-08-24 08:00:41.739021');

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
('a8dbzxmosst14eq3arkayvixt4yvz409', 'eyJpbWFnZV9wYXRoIjoiQzpcXFVzZXJzXFxzb2xvbVxcQXBwRGF0YVxcTG9jYWxcXFRlbXBcXHRtcDEyZTgxMzNtIn0:1qZ5pl:vdYNreLUoxw6VGa2VTN14hmc0M7owNtm0GDAvFvDQFI', '2023-08-25 08:36:53.413042');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(256) NOT NULL,
  `comment` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `email`, `comment`) VALUES
(1, 'MIN THIHA', 'solomonthiha9080@gmail.com', 'balch balhsdf bahsdf'),
(2, 'MIN THIHA', 'solomonthiha9080@gmail.com', 'THIS IS NONSENSE\r\n'),
(3, 'aung aung', 'ko@gmail.com', 'this is too late to calculate');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product` varchar(50) NOT NULL,
  `size` varchar(50) NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `product_id` int NOT NULL,
  `issue_date` datetime(6) DEFAULT NULL,
  `customer_data_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_customer_data_id_adbd2b37` (`customer_data_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `product`, `size`, `quantity`, `price`, `product_id`, `issue_date`, `customer_data_id`) VALUES
(2, 'Men\'s UA RUSH™ Energy Short Sleeve', 'l_size', 1, '45.00', 1, '2023-07-18 15:12:45.673516', 4),
(3, 'Men\'s UA Stretch Woven Pants', 'xl_size', 2, '140.00', 2, '2023-07-18 14:23:25.579720', 4),
(4, 'Men\'s UA RUSH™ Energy Short Sleeve', 'l_size', 1, '45.00', 1, '2023-07-19 11:25:31.037668', 5),
(5, 'Men\'s UA RUSH™ Energy Short Sleeve', 'l_size', 1, '45.00', 1, '2023-07-19 11:25:31.037668', 6),
(6, 'Men\'s UA Stretch Woven Pants', 'l_size', 2, '140.00', 2, '2023-07-19 11:32:14.948523', 7);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `discount` int NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `l_img` varchar(100) DEFAULT NULL,
  `r_img` varchar(100) DEFAULT NULL,
  `f_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `date`, `detail`, `remark`, `s_size`, `m_size`, `l_size`, `xl_size`, `xxl_size`, `old_price`, `new_price`, `discount`, `image`, `l_img`, `r_img`, `f_img`) VALUES
(1, 'Men\'s UA RUSH™ Energy Short Sleeve', '2023-08-18 00:00:00.000000', 'UA RUSH™ powers your toughest workouts, your biggest games, your most intense training. It gives you back energy, fits great, keeps you dry, and makes you feel like you can crush every PR.', '-', 1, 1, 1, 1, 1, '65.00', '45.00', 30, 'static/images/products/3_ua_pcikcfc.jpg', 'static/images/products/3_man_rSSXZXD_eqLnRsl.jpg', 'static/images/products/3_ua_pant_qhA04LM.jpg', 'static/images/products/1_man_wuuL4Fa_MTV0vTJ.jpg'),
(5, 'nono', '2023-08-13 00:00:00.000000', 'sdfdfadf', 'asdfff', 1, 1, 1, 1, 0, '5000.00', '250.00', 50, 'static/images/products/2_test.jpg', 'static/images/products/1_test.jpg', 'static/images/products/3_test.jpg', 'static/images/products/1_test_gH8q4v4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_catego`
--

DROP TABLE IF EXISTS `product_catego`;
CREATE TABLE IF NOT EXISTS `product_catego` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `categories_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_catego_product_id_categories_id_19772b69_uniq` (`product_id`,`categories_id`),
  KEY `product_catego_product_id_be27b368` (`product_id`),
  KEY `product_catego_categories_id_bf3a5648` (`categories_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_catego`
--

INSERT INTO `product_catego` (`id`, `product_id`, `categories_id`) VALUES
(1, 1, 1),
(5, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_subcatego`
--

DROP TABLE IF EXISTS `product_subcatego`;
CREATE TABLE IF NOT EXISTS `product_subcatego` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `product_id` bigint NOT NULL,
  `subcategories_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_subcatego_product_id_subcategories_id_d50fdb1d_uniq` (`product_id`,`subcategories_id`),
  KEY `product_subcatego_product_id_84b8ff54` (`product_id`),
  KEY `product_subcatego_subcategories_id_01cc2fd9` (`subcategories_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_subcatego`
--

INSERT INTO `product_subcatego` (`id`, `product_id`, `subcategories_id`) VALUES
(1, 1, 1),
(5, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
CREATE TABLE IF NOT EXISTS `sub_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`) VALUES
(1, 'shirts'),
(2, 'pants'),
(3, 'shoes');

-- --------------------------------------------------------

--
-- Table structure for table `tempimage`
--

DROP TABLE IF EXISTS `tempimage`;
CREATE TABLE IF NOT EXISTS `tempimage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `temp_image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tem_order`
--

DROP TABLE IF EXISTS `tem_order`;
CREATE TABLE IF NOT EXISTS `tem_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `size` varchar(50) NOT NULL,
  `quan` int NOT NULL,
  `price` decimal(9,2) NOT NULL,
  `product_id` int NOT NULL,
  `userordertime` datetime(6) DEFAULT NULL,
  `usersessionname` varchar(254) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

DROP TABLE IF EXISTS `userlogin`;
CREATE TABLE IF NOT EXISTS `userlogin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
(2, 'Min', 'Thiha', 'solomonthiha9080@gmail.com', 'minthiha', 'minthiha'),
(6, 'KYAW ', 'KYAW ', 'kyawkyaw@gmail.com', 'kyaw', 'kyaw');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
