-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2019 at 09:56 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `member`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_details`
--

CREATE TABLE `account_details` (
  `account_details_id` int(11) NOT NULL,
  `total_amount` varchar(200) NOT NULL,
  `amount_paid` varchar(200) NOT NULL,
  `remaining_balance` varchar(200) NOT NULL,
  `account_status` int(11) NOT NULL,
  `client_user_id` int(11) NOT NULL,
  `service_type` int(11) NOT NULL,
  `job_description` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_details`
--

INSERT INTO `account_details` (`account_details_id`, `total_amount`, `amount_paid`, `remaining_balance`, `account_status`, `client_user_id`, `service_type`, `job_description`) VALUES
(1, '4555', '', '', 1, 7, 1, ''),
(2, '0', '0', '0', 1, 8, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `account_invoice`
--

CREATE TABLE `account_invoice` (
  `account_invoice_id` int(11) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `amount_charged` varchar(50) NOT NULL,
  `date_recorded` datetime(6) NOT NULL,
  `client_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_status`
--

CREATE TABLE `account_status` (
  `account_status_id` int(11) NOT NULL,
  `account_status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_status`
--

INSERT INTO `account_status` (`account_status_id`, `account_status_name`) VALUES
(1, 'Disabled'),
(2, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(25, 'Can add account details', 7, 'add_accountdetails'),
(26, 'Can change account details', 7, 'change_accountdetails'),
(27, 'Can delete account details', 7, 'delete_accountdetails'),
(28, 'Can view account details', 7, 'view_accountdetails'),
(29, 'Can add account invoice', 8, 'add_accountinvoice'),
(30, 'Can change account invoice', 8, 'change_accountinvoice'),
(31, 'Can delete account invoice', 8, 'delete_accountinvoice'),
(32, 'Can view account invoice', 8, 'view_accountinvoice'),
(33, 'Can add account status', 9, 'add_accountstatus'),
(34, 'Can change account status', 9, 'change_accountstatus'),
(35, 'Can delete account status', 9, 'delete_accountstatus'),
(36, 'Can view account status', 9, 'view_accountstatus'),
(37, 'Can add client registration form', 10, 'add_clientregistrationform'),
(38, 'Can change client registration form', 10, 'change_clientregistrationform'),
(39, 'Can delete client registration form', 10, 'delete_clientregistrationform'),
(40, 'Can view client registration form', 10, 'view_clientregistrationform'),
(41, 'Can add payment history', 11, 'add_paymenthistory'),
(42, 'Can change payment history', 11, 'change_paymenthistory'),
(43, 'Can delete payment history', 11, 'delete_paymenthistory'),
(44, 'Can view payment history', 11, 'view_paymenthistory'),
(45, 'Can add payment mode', 12, 'add_paymentmode'),
(46, 'Can change payment mode', 12, 'change_paymentmode'),
(47, 'Can delete payment mode', 12, 'delete_paymentmode'),
(48, 'Can view payment mode', 12, 'view_paymentmode'),
(49, 'Can add service details', 13, 'add_servicedetails'),
(50, 'Can change service details', 13, 'change_servicedetails'),
(51, 'Can delete service details', 13, 'delete_servicedetails'),
(52, 'Can view service details', 13, 'view_servicedetails'),
(53, 'Can add services', 14, 'add_services'),
(54, 'Can change services', 14, 'change_services'),
(55, 'Can delete services', 14, 'delete_services'),
(56, 'Can view services', 14, 'view_services');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$120000$UJYUfDKEtfWJ$/LV1MDBxTAB0f2e7wiHfcDVrpeB0jBBWqOQNmvft7ic=', '2019-04-23 12:29:16.563663', 0, 'peter', '', '', 'peterdonk17@gmail.com', 0, 1, '2019-04-22 10:07:22.209767'),
(2, 'pbkdf2_sha256$120000$GkAogD8TPr0n$PSfUEQdSxcG/CpMoZBp4LiEclfncD0zIL1eGh/PAk0c=', NULL, 0, 'king', '', '', 'king@gmail.com', 0, 1, '2019-04-22 10:21:12.059735'),
(3, 'pbkdf2_sha256$120000$vfocLiNk8GVT$8CgtYSnhHE6tjIbwJMATnLoVrxLcv6LHuxetnDnmQdI=', NULL, 0, 'western', '', '', 'west@y.com', 0, 1, '2019-04-22 10:25:35.391842'),
(4, 'pbkdf2_sha256$120000$nNvBNegZD6Gj$egEImiOs7NksoVGKQIKzdKDz3KghUirr8ScKHvKh3Bs=', NULL, 0, 'santa', '', '', 'kofi@gmail.com', 0, 1, '2019-04-22 10:36:10.817101'),
(5, 'pbkdf2_sha256$120000$JS9xMf4wYswI$oGFwxhgN0UzoUpJlrImbTn7/GQZHv1XRfDY4vbftRrU=', NULL, 0, 'johnny', '', '', 'j@kj.com', 0, 1, '2019-04-22 10:40:54.819449'),
(6, 'pbkdf2_sha256$120000$uPd83TEfeBJA$A2ycRoHH0KZzodWKv9DGreC1hzSIsSd9wiEWtbSgy7I=', NULL, 0, 'k', '', '', 'rttr@d.com', 0, 1, '2019-04-22 10:45:35.991075'),
(7, 'pbkdf2_sha256$120000$hwzi8gFuptJS$LnMcrGGJU/XvQc8dSSL/9Fqj0IIS0M0tW4PikEK4/ZE=', '2019-04-22 11:38:48.836115', 0, 'kack', '', '', 'j@l.com', 0, 1, '2019-04-22 11:22:25.402947'),
(8, 'pbkdf2_sha256$120000$uH9cQ9sY0AQe$KNgtR/jqEK0k/3sGsLcOT9+/kZKFVtmyImDt7yICyMg=', '2019-04-23 12:31:17.685736', 0, 'boy', '', '', 'boy@salinko.com', 0, 1, '2019-04-22 13:34:11.947955');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `clientregistrationform`
--

CREATE TABLE `clientregistrationform` (
  `id` int(11) NOT NULL,
  `client_name` varchar(50) NOT NULL,
  `client_telephone` varchar(15) NOT NULL,
  `client_contact_person` varchar(50) DEFAULT NULL,
  `client_contact_telephone` varchar(15) DEFAULT NULL,
  `client_digital_address` varchar(20) DEFAULT NULL,
  `time_created` datetime(6) NOT NULL,
  `client_service` int(11) NOT NULL,
  `client_status` int(11) NOT NULL,
  `client_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clientregistrationform`
--

INSERT INTO `clientregistrationform` (`id`, `client_name`, `client_telephone`, `client_contact_person`, `client_contact_telephone`, `client_digital_address`, `time_created`, `client_service`, `client_status`, `client_user_id`) VALUES
(1, 'Peter Dok', '0247732082', NULL, NULL, 'AS-123', '2019-04-22 10:07:22.607328', 1, 1, 1),
(2, 'King Promise', '5555555555', NULL, NULL, 'AS223', '2019-04-22 10:21:12.780828', 1, 1, 2),
(3, 'Western', '1212121222', NULL, NULL, 'AS223', '2019-04-22 10:25:35.839200', 1, 1, 3),
(4, 'Santa Liousa', '0552513405', NULL, NULL, 'GT-4005', '2019-04-22 10:36:11.529899', 1, 1, 4),
(5, 'J', '4444444444', NULL, NULL, 'qwq', '2019-04-22 10:40:55.320189', 2, 1, 5),
(6, 'fgfg', '4545454545', NULL, NULL, 'ghghghg', '2019-04-22 10:45:36.529514', 1, 1, 6),
(7, 'Jack', '123456789', NULL, NULL, 'ASD', '2019-04-22 11:22:26.056186', 1, 1, 7),
(8, 'Salinkos', '0273495835', NULL, NULL, 'GN-225', '2019-04-22 13:34:12.563038', 1, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'client', 'accountdetails'),
(8, 'client', 'accountinvoice'),
(9, 'client', 'accountstatus'),
(10, 'client', 'clientregistrationform'),
(11, 'client', 'paymenthistory'),
(12, 'client', 'paymentmode'),
(13, 'client', 'servicedetails'),
(14, 'client', 'services'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-04-22 10:02:38.136274'),
(2, 'auth', '0001_initial', '2019-04-22 10:02:44.152887'),
(3, 'admin', '0001_initial', '2019-04-22 10:02:45.541792'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-04-22 10:02:45.661731'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-04-22 10:02:45.700263'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-04-22 10:02:46.362744'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-04-22 10:02:47.111824'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-04-22 10:02:48.026909'),
(9, 'auth', '0004_alter_user_username_opts', '2019-04-22 10:02:48.084414'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-04-22 10:02:48.295150'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-04-22 10:02:48.327224'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-04-22 10:02:48.364223'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-04-22 10:02:49.086808'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-04-22 10:02:49.486154'),
(15, 'client', '0001_initial', '2019-04-22 10:02:59.158972'),
(16, 'sessions', '0001_initial', '2019-04-22 10:02:59.401905');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('clp4wx6upa0vmffolsd9jyn7vyud64x8', 'NzcwYWEwMGZkYWJkOTU4YWU1MWEyZTM5MDcxOGU2NzJiNGQzN2M0Nzp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZGFkZWUyZTJjMjBkMzZhYTljZDQwYzVhYTQwNjllOTk3MjBlNzNkIn0=', '2019-05-07 12:31:17.721784');

-- --------------------------------------------------------

--
-- Table structure for table `payment_history`
--

CREATE TABLE `payment_history` (
  `payment_history_id` int(11) NOT NULL,
  `amount_paid` varchar(50) NOT NULL,
  `received_by` varchar(100) NOT NULL,
  `payment_date` datetime(6) NOT NULL,
  `client_user_id` int(11) NOT NULL,
  `payment_mode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_history`
--

INSERT INTO `payment_history` (`payment_history_id`, `amount_paid`, `received_by`, `payment_date`, `client_user_id`, `payment_mode`) VALUES
(1, '500', 'john', '2019-04-22 00:00:00.000000', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment_mode`
--

CREATE TABLE `payment_mode` (
  `payment_mode_id` int(11) NOT NULL,
  `mode_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_mode`
--

INSERT INTO `payment_mode` (`payment_mode_id`, `mode_name`) VALUES
(1, 'Cash'),
(2, 'Mobile Money'),
(3, 'Cheque');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `services_id` int(11) NOT NULL,
  `services_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`services_id`, `services_name`) VALUES
(1, 'Web Design'),
(2, 'Networking'),
(3, 'Consultation');

-- --------------------------------------------------------

--
-- Table structure for table `service_details`
--

CREATE TABLE `service_details` (
  `service_details_id` int(11) NOT NULL,
  `service_progress` int(11) NOT NULL,
  `client_user_id` int(11) NOT NULL,
  `service_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_details`
--

INSERT INTO `service_details` (`service_details_id`, `service_progress`, `client_user_id`, `service_type`) VALUES
(1, 0, 1, 1),
(2, 0, 3, 1),
(3, 0, 7, 1),
(4, 40, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(100) NOT NULL,
  `client_user_id` int(11) NOT NULL,
  `problem_ticket_id` varchar(25) NOT NULL,
  `problem_title` mediumtext NOT NULL,
  `problem_description` mediumtext NOT NULL,
  `problem_status` int(11) NOT NULL,
  `date_opened` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_closed` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`ticket_id`, `client_user_id`, `problem_ticket_id`, `problem_title`, `problem_description`, `problem_status`, `date_opened`, `date_closed`) VALUES
(1, 8, 'M-u1T7jZ', 'sdsdsd', 'bvbvbvbv', 1, '2019-04-25 07:01:17', '2019-05-25'),
(2, 8, 'M-BB4d16', 'fgfgfg', 'bvbvbvb', 2, '2019-04-25 07:01:17', NULL),
(3, 8, 'M-huu03B', 'dfdfdfd', 'sdsdsdsdsd', 2, '2019-04-25 07:01:17', NULL),
(4, 8, 'M-OtoNVZ', 'dfdfdf', 'xcxcxcx', 2, '2019-04-25 07:01:17', NULL),
(5, 8, 'M-4OC1ra', 'dfgfgfgfgfgf', 'xcxcxcx', 2, '2019-04-25 07:01:17', NULL),
(6, 8, 'M-rmBipC', 'erere', 'cvcvcvcvc', 2, '2019-04-25 06:04:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_response`
--

CREATE TABLE `ticket_response` (
  `ticket_response_id` int(11) NOT NULL,
  `client_user_id` int(11) NOT NULL,
  `ticket_id` varchar(25) NOT NULL,
  `message` mediumtext NOT NULL,
  `sent_from` int(25) NOT NULL DEFAULT '1',
  `date_sent` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket_response`
--

INSERT INTO `ticket_response` (`ticket_response_id`, `client_user_id`, `ticket_id`, `message`, `sent_from`, `date_sent`) VALUES
(1, 8, 'M-u1T7jZ', 'Thisisssssdsdsdsdsdsdsdsdsdsdsdfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff', 1, '2019-04-25 08:40:23'),
(2, 8, 'M-u1T7jZ', 'popopopopopopopopopopopopopopopopopopopopopopopopopo', 1, '2019-04-25 08:40:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_details`
--
ALTER TABLE `account_details`
  ADD PRIMARY KEY (`account_details_id`),
  ADD KEY `account_details_account_status_1a98969c_fk_account_s` (`account_status`),
  ADD KEY `account_details_client_user_id_854198b9_fk_auth_user_id` (`client_user_id`),
  ADD KEY `account_details_service_type_1f49ab08_fk_services_services_id` (`service_type`);

--
-- Indexes for table `account_invoice`
--
ALTER TABLE `account_invoice`
  ADD PRIMARY KEY (`account_invoice_id`),
  ADD KEY `account_invoice_client_user_id_3eb2e0e1_fk_auth_user_id` (`client_user_id`);

--
-- Indexes for table `account_status`
--
ALTER TABLE `account_status`
  ADD PRIMARY KEY (`account_status_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `clientregistrationform`
--
ALTER TABLE `clientregistrationform`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientregistrationfo_client_service_f2a31619_fk_services_` (`client_service`),
  ADD KEY `clientregistrationfo_client_status_6ccd3a6f_fk_account_s` (`client_status`),
  ADD KEY `clientregistrationform_client_user_id_a2855b58_fk_auth_user_id` (`client_user_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `payment_history`
--
ALTER TABLE `payment_history`
  ADD PRIMARY KEY (`payment_history_id`),
  ADD KEY `payment_history_client_user_id_a722a568_fk_auth_user_id` (`client_user_id`),
  ADD KEY `payment_history_payment_mode_b2aca088_fk_payment_m` (`payment_mode`);

--
-- Indexes for table `payment_mode`
--
ALTER TABLE `payment_mode`
  ADD PRIMARY KEY (`payment_mode_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`services_id`);

--
-- Indexes for table `service_details`
--
ALTER TABLE `service_details`
  ADD PRIMARY KEY (`service_details_id`),
  ADD KEY `service_details_client_user_id_9316f573_fk_auth_user_id` (`client_user_id`),
  ADD KEY `service_details_service_type_b69b1b4d_fk_services_services_id` (`service_type`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `client_user_id` (`client_user_id`),
  ADD KEY `problem_status` (`problem_status`);

--
-- Indexes for table `ticket_response`
--
ALTER TABLE `ticket_response`
  ADD PRIMARY KEY (`ticket_response_id`),
  ADD KEY `client_user_id` (`client_user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_details`
--
ALTER TABLE `account_details`
  MODIFY `account_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `account_invoice`
--
ALTER TABLE `account_invoice`
  MODIFY `account_invoice_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `account_status`
--
ALTER TABLE `account_status`
  MODIFY `account_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `clientregistrationform`
--
ALTER TABLE `clientregistrationform`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `payment_history`
--
ALTER TABLE `payment_history`
  MODIFY `payment_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `payment_mode`
--
ALTER TABLE `payment_mode`
  MODIFY `payment_mode_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `services_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `service_details`
--
ALTER TABLE `service_details`
  MODIFY `service_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ticket_response`
--
ALTER TABLE `ticket_response`
  MODIFY `ticket_response_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_details`
--
ALTER TABLE `account_details`
  ADD CONSTRAINT `account_details_account_status_1a98969c_fk_account_s` FOREIGN KEY (`account_status`) REFERENCES `account_status` (`account_status_id`),
  ADD CONSTRAINT `account_details_client_user_id_854198b9_fk_auth_user_id` FOREIGN KEY (`client_user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `account_details_service_type_1f49ab08_fk_services_services_id` FOREIGN KEY (`service_type`) REFERENCES `services` (`services_id`);

--
-- Constraints for table `account_invoice`
--
ALTER TABLE `account_invoice`
  ADD CONSTRAINT `account_invoice_client_user_id_3eb2e0e1_fk_auth_user_id` FOREIGN KEY (`client_user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `clientregistrationform`
--
ALTER TABLE `clientregistrationform`
  ADD CONSTRAINT `clientregistrationfo_client_service_f2a31619_fk_services_` FOREIGN KEY (`client_service`) REFERENCES `services` (`services_id`),
  ADD CONSTRAINT `clientregistrationfo_client_status_6ccd3a6f_fk_account_s` FOREIGN KEY (`client_status`) REFERENCES `account_status` (`account_status_id`),
  ADD CONSTRAINT `clientregistrationform_client_user_id_a2855b58_fk_auth_user_id` FOREIGN KEY (`client_user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `payment_history`
--
ALTER TABLE `payment_history`
  ADD CONSTRAINT `payment_history_client_user_id_a722a568_fk_auth_user_id` FOREIGN KEY (`client_user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `payment_history_payment_mode_b2aca088_fk_payment_m` FOREIGN KEY (`payment_mode`) REFERENCES `payment_mode` (`payment_mode_id`);

--
-- Constraints for table `service_details`
--
ALTER TABLE `service_details`
  ADD CONSTRAINT `service_details_client_user_id_9316f573_fk_auth_user_id` FOREIGN KEY (`client_user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `service_details_service_type_b69b1b4d_fk_services_services_id` FOREIGN KEY (`service_type`) REFERENCES `services` (`services_id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`client_user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`problem_status`) REFERENCES `account_status` (`account_status_id`);

--
-- Constraints for table `ticket_response`
--
ALTER TABLE `ticket_response`
  ADD CONSTRAINT `ticket_response_ibfk_1` FOREIGN KEY (`client_user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
