-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2023 at 12:38 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crm_a2z_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(25, 'Can add city', 7, 'add_city'),
(26, 'Can change city', 7, 'change_city'),
(27, 'Can delete city', 7, 'delete_city'),
(28, 'Can view city', 7, 'view_city'),
(29, 'Can add district', 8, 'add_district'),
(30, 'Can change district', 8, 'change_district'),
(31, 'Can delete district', 8, 'delete_district'),
(32, 'Can view district', 8, 'view_district'),
(33, 'Can add lead category', 9, 'add_leadcategory'),
(34, 'Can change lead category', 9, 'change_leadcategory'),
(35, 'Can delete lead category', 9, 'delete_leadcategory'),
(36, 'Can view lead category', 9, 'view_leadcategory'),
(37, 'Can add state', 10, 'add_state'),
(38, 'Can change state', 10, 'change_state'),
(39, 'Can delete state', 10, 'delete_state'),
(40, 'Can view state', 10, 'view_state'),
(41, 'Can add leads', 11, 'add_leads'),
(42, 'Can change leads', 11, 'change_leads'),
(43, 'Can delete leads', 11, 'delete_leads'),
(44, 'Can view leads', 11, 'view_leads'),
(45, 'Can add status', 12, 'add_status'),
(46, 'Can change status', 12, 'change_status'),
(47, 'Can delete status', 12, 'delete_status'),
(48, 'Can view status', 12, 'view_status'),
(49, 'Can add lead source', 13, 'add_leadsource'),
(50, 'Can change lead source', 13, 'change_leadsource'),
(51, 'Can delete lead source', 13, 'delete_leadsource'),
(52, 'Can view lead source', 13, 'view_leadsource'),
(53, 'Can add extended user model', 14, 'add_extendedusermodel'),
(54, 'Can change extended user model', 14, 'change_extendedusermodel'),
(55, 'Can delete extended user model', 14, 'delete_extendedusermodel'),
(56, 'Can view extended user model', 14, 'view_extendedusermodel'),
(57, 'Can add lead status', 12, 'add_leadstatus'),
(58, 'Can change lead status', 12, 'change_leadstatus'),
(59, 'Can delete lead status', 12, 'delete_leadstatus'),
(60, 'Can view lead status', 12, 'view_leadstatus'),
(61, 'Can add status', 15, 'add_status'),
(62, 'Can change status', 15, 'change_status'),
(63, 'Can delete status', 15, 'delete_status'),
(64, 'Can view status', 15, 'view_status'),
(65, 'Can add lead type', 12, 'add_leadtype'),
(66, 'Can change lead type', 12, 'change_leadtype'),
(67, 'Can delete lead type', 12, 'delete_leadtype'),
(68, 'Can view lead type', 12, 'view_leadtype'),
(69, 'Can add lead status', 15, 'add_leadstatus'),
(70, 'Can change lead status', 15, 'change_leadstatus'),
(71, 'Can delete lead status', 15, 'delete_leadstatus'),
(72, 'Can view lead status', 15, 'view_leadstatus'),
(73, 'Can add client', 16, 'add_client'),
(74, 'Can change client', 16, 'change_client'),
(75, 'Can delete client', 16, 'delete_client'),
(76, 'Can view client', 16, 'view_client'),
(77, 'Can add project', 17, 'add_project'),
(78, 'Can change project', 17, 'change_project'),
(79, 'Can delete project', 17, 'delete_project'),
(80, 'Can view project', 17, 'view_project'),
(81, 'Can add client status', 18, 'add_clientstatus'),
(82, 'Can change client status', 18, 'change_clientstatus'),
(83, 'Can delete client status', 18, 'delete_clientstatus'),
(84, 'Can view client status', 18, 'view_clientstatus'),
(85, 'Can add project status', 19, 'add_projectstatus'),
(86, 'Can change project status', 19, 'change_projectstatus'),
(87, 'Can delete project status', 19, 'delete_projectstatus'),
(88, 'Can view project status', 19, 'view_projectstatus'),
(89, 'Can add invoice status', 20, 'add_invoicestatus'),
(90, 'Can change invoice status', 20, 'change_invoicestatus'),
(91, 'Can delete invoice status', 20, 'delete_invoicestatus'),
(92, 'Can view invoice status', 20, 'view_invoicestatus'),
(93, 'Can add invoice', 21, 'add_invoice'),
(94, 'Can change invoice', 21, 'change_invoice'),
(95, 'Can delete invoice', 21, 'delete_invoice'),
(96, 'Can view invoice', 21, 'view_invoice'),
(97, 'Can add billing', 22, 'add_billing'),
(98, 'Can change billing', 22, 'change_billing'),
(99, 'Can delete billing', 22, 'delete_billing'),
(100, 'Can view billing', 22, 'view_billing'),
(101, 'Can add project assignment', 23, 'add_projectassignment'),
(102, 'Can change project assignment', 23, 'change_projectassignment'),
(103, 'Can delete project assignment', 23, 'delete_projectassignment'),
(104, 'Can view project assignment', 23, 'view_projectassignment'),
(105, 'Can add category', 24, 'add_category'),
(106, 'Can change category', 24, 'change_category'),
(107, 'Can delete category', 24, 'delete_category'),
(108, 'Can view category', 24, 'view_category'),
(109, 'Can add marketing', 25, 'add_marketing'),
(110, 'Can change marketing', 25, 'change_marketing'),
(111, 'Can delete marketing', 25, 'delete_marketing'),
(112, 'Can view marketing', 25, 'view_marketing');

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
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$J3Eq5lptUVCKvsTXVv47Na$zMLnjOk1KGMa1VTBevuYY5maZ5uvpDAL3XkMTnBtBhY=', '2023-02-13 08:42:48.710018', 1, 'admin', '', '', 'admin123@gmail.com', 1, 1, '2022-12-09 08:57:03.086381'),
(3, 'pbkdf2_sha256$390000$imdJXlp8oM2U3SDdoDxaiN$8Hcef8anVNiEf02+wjHUS9nJUTOTo2uulTkXm39Sd+s=', '2023-02-13 06:27:02.879112', 0, 'haji123', '', '', 'haji@gmail.com', 0, 1, '2022-12-12 05:25:21.207141'),
(5, 'pbkdf2_sha256$390000$BppGyiCgN3Rv9BfSampGi3$4aOhaqyREvi4WmD8I3bE677nLKIRV9trBm1XQRjUc94=', '2023-01-28 06:11:05.809773', 0, 'mid123', '', '', 'fathi@gmail.com', 0, 1, '2022-12-12 05:27:54.000000'),
(10, 'pbkdf2_sha256$390000$aCNOCwv4hAE94O6qwL6rBt$ieq6Ej0a6JEoGea9gkd1vP2xT1jICeawmxhd9fpnzIM=', '2022-12-13 04:18:24.390596', 0, 'arya123', '', '', 'arya@123', 0, 1, '2022-12-13 04:18:24.154086'),
(11, 'pbkdf2_sha256$390000$h8buz4WvmfqNtu2EdCx9tH$GHtZMslx4NwvRcNMZyNN9xoQMOqcHcHleKeQqGOU0zI=', '2022-12-14 11:17:46.812906', 0, 'prajitha123', '', '', 'prajitha@gmail.com', 0, 1, '2022-12-14 11:15:29.000000'),
(12, 'pbkdf2_sha256$390000$ZL45pJLsyMHEhnHXgEOevw$xNPyRyWAOAvkocdLOxt52YhoWWWPVtv+CgZJ5i96uxc=', '2022-12-15 12:24:22.409997', 0, 'athulya123', '', '', 'athula@gmail.com', 0, 1, '2022-12-15 12:24:13.072008'),
(13, 'pbkdf2_sha256$390000$yWaLbZ3abFLIiZBFazlcwu$ZR38iVNAz9xfXkEmglg8oru8M5yYVmpBShYqesc3IPY=', '2023-02-13 08:46:58.281785', 0, 'sunil123', '', '', 'sunil123@gmail.com', 0, 1, '2022-12-27 10:03:31.463771'),
(14, 'pbkdf2_sha256$390000$VASkWUnrhrnCPsYB112jcB$kTTR5jHRymTQTOxxzeT/tT8TkG2hUeCzVLB60Do2iR0=', '2023-01-05 05:48:43.424309', 0, 'ajimon123', 'Ajimon', '', 'ajimonks6@gmail.com', 0, 1, '2022-12-27 10:08:43.000000'),
(15, 'pbkdf2_sha256$390000$3NHrzJOfotPIrF5eP6iMSz$fgYFXAYqmEdvwn3LH49VB+8yeotwXgOhIFuMbe18HEM=', '2023-02-13 08:43:22.191916', 0, 'ehas123', '', '', 'ehas@gmail.com', 0, 1, '2022-12-29 07:04:09.497101'),
(16, 'pbkdf2_sha256$390000$L7VdUmzI2kGrkEWzNu9djC$29eW01VCNc3r9MafAZzYJwUpNufqZgvDSHqzRt6d534=', '2023-02-13 08:43:11.264735', 0, 'midhun123', '', '', 'midhun123@gmail.com', 0, 1, '2022-12-29 10:48:40.696051'),
(17, 'pbkdf2_sha256$390000$MvLy95t07sP88mU9Kn7EMl$SvcMt9z/H7RKQTg6sP+I13mF52n/UT27rBGALgSfZpM=', '2023-01-05 11:38:54.011799', 0, 'nayzu123', '', '', 'nayzu@gmail.com', 0, 1, '2023-01-03 06:19:47.400289'),
(18, 'pbkdf2_sha256$390000$ZBmjnYg6YGJzlYswE17FFd$CoYn9im93iUNBAr+EVtIELNb4dpahmL1G1RkHsGn4IQ=', '2023-02-13 08:42:59.841495', 0, 'amal123', '', '', 'amal123@gmail.com', 0, 1, '2023-01-05 03:49:48.409838'),
(19, 'pbkdf2_sha256$390000$cp4cjjxsY3lxRE9RPCsFbf$TLo2wr/xgImXVObariYjgjciUKNhbE1aZ8h3D7FHQFw=', '2023-01-06 03:51:58.264794', 0, 'aryas123', '', '', 'aryas123@gmail.com', 0, 1, '2023-01-06 03:51:46.258908'),
(20, 'pbkdf2_sha256$390000$Xo68kvzvTkZ2qnVKNhSCKa$7JKsSjrzEMJNOH/XCJX5qgkVYkCqabJIgBiA4HZ/jMk=', '2023-01-10 09:52:20.701296', 0, 'dgd123', '', '', 'hajaraajialpha@gmail.com', 0, 1, '2023-01-10 09:51:23.264366'),
(21, 'pbkdf2_sha256$390000$A0Ii8TT4CjMFDjR1dDCj1Y$bUlCtbN8lC72+77SOqkcGvZqyhTkPILdIdPUM2ROc5E=', '2023-02-07 09:21:47.000000', 1, 'shefeek', '', '', 'shefeek@gmail.com', 1, 1, '2023-02-07 09:20:01.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `crm_app_billing`
--

CREATE TABLE `crm_app_billing` (
  `id` bigint(20) NOT NULL,
  `billing_key` varchar(25) DEFAULT NULL,
  `slug` varchar(250) DEFAULT NULL,
  `billing_public_key` varchar(25) DEFAULT NULL,
  `amount` int(10) UNSIGNED DEFAULT NULL CHECK (`amount` >= 0),
  `added_on` datetime(6) NOT NULL,
  `creation_date` datetime(6) NOT NULL,
  `direction` varchar(25) NOT NULL,
  `added_by_id` int(11) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `invoice_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `crm_app_client`
--

CREATE TABLE `crm_app_client` (
  `id` bigint(20) NOT NULL,
  `c_key` varchar(25) DEFAULT NULL,
  `contact_person_name` varchar(30) DEFAULT NULL,
  `contact_person_phone_no` varchar(12) DEFAULT NULL,
  `business_name` varchar(50) NOT NULL,
  `business_address` longtext NOT NULL,
  `owner_name` varchar(30) NOT NULL,
  `business_owner_contact_number` varchar(12) NOT NULL,
  `slug` varchar(250) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `client_status_id` bigint(20) DEFAULT NULL,
  `project_count` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crm_app_client`
--

INSERT INTO `crm_app_client` (`id`, `c_key`, `contact_person_name`, `contact_person_phone_no`, `business_name`, `business_address`, `owner_name`, `business_owner_contact_number`, `slug`, `count`, `client_status_id`, `project_count`) VALUES
(15, '2272', 'Haji', '7510967200', 'LULUKKAS SILKS AND SAREES', '6MFG+QFC, Pandalam, Kerala 689501', 'Ajimon K.S', '9847188723', '2272-15', NULL, 2, 2),
(16, 'a25a', 'Nayzu', '9747871528', 'IFTAR', 'near Post Office, Pandalam, Kerala 689501', 'Nayzam', '9747871528', 'a25a-16', NULL, 2, 2),
(17, '2259', 'Aslama', '7736610890', 'Lazeezo', ' 7MQ2+R44, Mulakuzha, Kerala 689504', 'Assif', '9446904722', '2259', NULL, 2, 1),
(18, '4168', 'Fathima', '7025054723', 'Lulu', 'Pandalam', 'Ajimon KS', '9847188723', '4168', NULL, 2, 1),
(19, '7fbc', 'Hasan', '8089865117', 'Bismi Textiles', '85R3+WGG, Parassala, Kerala 695502', 'Hussain', '8089865117', '7fbc', NULL, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `crm_app_clientstatus`
--

CREATE TABLE `crm_app_clientstatus` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crm_app_clientstatus`
--

INSERT INTO `crm_app_clientstatus` (`id`, `name`) VALUES
(1, 'Junk'),
(2, 'Deactivate'),
(3, 'Activeclient');

-- --------------------------------------------------------

--
-- Table structure for table `crm_app_district`
--

CREATE TABLE `crm_app_district` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crm_app_district`
--

INSERT INTO `crm_app_district` (`id`, `name`, `state_id`) VALUES
(1, 'Trivandrum', 1),
(2, 'Pathanamthitta', 1),
(3, 'Alappuzha', 1),
(4, 'Kollam', 1),
(5, 'Kollam', 1),
(6, 'Thirunelveli', 2),
(7, 'Thanjavur', 2),
(8, 'Kanyakumari', 2);

-- --------------------------------------------------------

--
-- Table structure for table `crm_app_extendedusermodel`
--

CREATE TABLE `crm_app_extendedusermodel` (
  `id` bigint(20) NOT NULL,
  `employe_name` varchar(25) NOT NULL,
  `address` longtext NOT NULL,
  `dob` date NOT NULL,
  `blood_group` varchar(5) DEFAULT NULL,
  `phn_number` varchar(15) NOT NULL,
  `is_telecallers` varchar(10) DEFAULT NULL,
  `is_staff` varchar(10) DEFAULT NULL,
  `is_superviser` varchar(10) DEFAULT NULL,
  `is_designer` varchar(10) DEFAULT NULL,
  `is_dealer` varchar(10) DEFAULT NULL,
  `is_technician` varchar(10) DEFAULT NULL,
  `is_factory_superviser` varchar(10) DEFAULT NULL,
  `user_photo` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `is_teamleader` varchar(10) DEFAULT NULL,
  `is_client` varchar(10) DEFAULT NULL,
  `is_teammember` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crm_app_extendedusermodel`
--

INSERT INTO `crm_app_extendedusermodel` (`id`, `employe_name`, `address`, `dob`, `blood_group`, `phn_number`, `is_telecallers`, `is_staff`, `is_superviser`, `is_designer`, `is_dealer`, `is_technician`, `is_factory_superviser`, `user_photo`, `user_id`, `is_teamleader`, `is_client`, `is_teammember`) VALUES
(1, 'midhun', 'Kakkakuzhiyil House Thonnallor Pandalam P.O Pathanamthitta', '2022-12-22', 'A+', '7510967200', 'on', NULL, NULL, NULL, NULL, NULL, NULL, 'pictures/Screenshot_4.png', 5, NULL, NULL, NULL),
(2, 'Hajara Aji', 'Kakkakuzhiyil House Thonnallor Pandalam P.O Pathanamthitta', '2022-12-15', 'A+', '7510967200', 'on', NULL, NULL, NULL, NULL, NULL, NULL, 'pictures/Screenshot_1.png', 3, NULL, NULL, NULL),
(5, 'Arya', 'Kakkakuzhiyil House Thonnallor Pandalam P.O Pathanamthitta', '2022-12-14', 'A+', '7510967200', 'on', NULL, NULL, NULL, NULL, NULL, NULL, 'pictures/Screenshot_3.png', 10, NULL, NULL, NULL),
(6, 'Prajitha', 'Kakkakuzhiyil House Thonnallor Pandalam P.O Pathanamthitta', '2022-12-09', 'B+', '7736610860', 'on', NULL, NULL, NULL, NULL, NULL, NULL, 'pictures/Screenshot_1_483Cuce.png', 11, NULL, NULL, NULL),
(7, 'Athulya', 'Kakkakuzhiyil House Thonnallor Pandalam P.O Pathanamthitta', '2022-12-16', 'B+', '8089865117', 'on', NULL, NULL, NULL, NULL, NULL, NULL, 'pictures/Screenshot_2_QJT5OBW.png', 12, NULL, NULL, NULL),
(8, 'Sunil', 'darul uloommm', '2022-12-09', 'A+', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pictures/Screenshot_1_kq5jVHo.png', 13, 'on', NULL, NULL),
(9, 'Ajimon K.S', 'Baithul Hasanath', '1990-01-15', 'A+', '9847188723', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pictures/Mammootty2022.jpg', 14, NULL, 'on', NULL),
(10, 'Ehas', 'Baithul Hasanath', '2022-12-17', 'B-', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pictures/91558651.webp', 15, NULL, NULL, 'on'),
(11, 'Midhun Babu', 'midhun house alappuzha', '2022-12-15', 'O+', '8085606570', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pictures/Premam.webp', 16, NULL, NULL, 'on'),
(12, 'Nayzam', 'Kakkakuzhiyil House Thonnallor Pandalam P.O Pathanamthitta', '2023-01-20', 'B+', '9747871528', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pictures/images3', 17, NULL, 'on', NULL),
(13, 'Amal', 'Baithul Hasanath', '2023-01-19', 'B+', '984250221', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'pictures/MTc0MzkwMTk5Njc2MDUzMTI2.webp', 18, NULL, NULL, 'on'),
(14, 'AryaS', 'Kakkakuzhiyil House Thonnallor Pandalam P.O Pathanamthitta', '2023-01-28', 'B+', '7510967200', 'on', NULL, NULL, NULL, NULL, NULL, NULL, 'pictures/180-13deb732-5c77-4e5a-9fd1-4278612c8e50.jpg', 19, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `crm_app_invoice`
--

CREATE TABLE `crm_app_invoice` (
  `id` bigint(20) NOT NULL,
  `invoice_key` varchar(25) DEFAULT NULL,
  `invoice_public_key` varchar(25) DEFAULT NULL,
  `amount` int(10) UNSIGNED DEFAULT NULL CHECK (`amount` >= 0),
  `pending_amount` int(10) UNSIGNED DEFAULT NULL CHECK (`pending_amount` >= 0),
  `added_on` datetime(6) NOT NULL,
  `creation_date` datetime(6) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `added_by_id` int(11) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `invoice_status_id` bigint(20) DEFAULT NULL,
  `slug` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `crm_app_invoicestatus`
--

CREATE TABLE `crm_app_invoicestatus` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crm_app_invoicestatus`
--

INSERT INTO `crm_app_invoicestatus` (`id`, `name`) VALUES
(2, '0'),
(3, '1'),
(4, '-1');

-- --------------------------------------------------------

--
-- Table structure for table `crm_app_leadcategory`
--

CREATE TABLE `crm_app_leadcategory` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crm_app_leadcategory`
--

INSERT INTO `crm_app_leadcategory` (`id`, `name`) VALUES
(1, 'SEO'),
(2, 'Social Media'),
(3, 'Web Design&Development');

-- --------------------------------------------------------

--
-- Table structure for table `crm_app_leads`
--

CREATE TABLE `crm_app_leads` (
  `id` bigint(20) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `place` varchar(50) DEFAULT NULL,
  `business_name` varchar(50) NOT NULL,
  `address` longtext NOT NULL,
  `contact_person` varchar(30) DEFAULT NULL,
  `contact_person_number` varchar(12) DEFAULT NULL,
  `contact_person_designation` varchar(50) DEFAULT NULL,
  `business_owner_name` varchar(30) NOT NULL,
  `business_owner_number` varchar(12) NOT NULL,
  `business_owner_email` varchar(254) DEFAULT NULL,
  `requirements` longtext DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `callbackdate` date DEFAULT NULL,
  `interest_rate` varchar(25) NOT NULL,
  `date_added_on` datetime(6) NOT NULL,
  `actual_date_added_on` datetime(6) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `district_id` bigint(20) DEFAULT NULL,
  `lead_type_id` bigint(20) DEFAULT NULL,
  `state_id` bigint(20) DEFAULT NULL,
  `lead_source_id` bigint(20) DEFAULT NULL,
  `contact_person_email` varchar(254) DEFAULT NULL,
  `lead_statuss_id` bigint(20) DEFAULT NULL,
  `slug` varchar(250) DEFAULT NULL,
  `key` varchar(25) DEFAULT NULL,
  `staff_name_id` int(11) DEFAULT NULL,
  `staff_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crm_app_leads`
--

INSERT INTO `crm_app_leads` (`id`, `title`, `place`, `business_name`, `address`, `contact_person`, `contact_person_number`, `contact_person_designation`, `business_owner_name`, `business_owner_number`, `business_owner_email`, `requirements`, `notes`, `callbackdate`, `interest_rate`, `date_added_on`, `actual_date_added_on`, `category_id`, `district_id`, `lead_type_id`, `state_id`, `lead_source_id`, `contact_person_email`, `lead_statuss_id`, `slug`, `key`, `staff_name_id`, `staff_id`) VALUES
(13, 'Digital Marketing', 'Pandalam', 'LEATHER CORNER', 'KAKKAKUZHIYIL PANDALAM', 'Anisha', '7985106321', 'Accountant', 'Asharaf', '7025054723', 'asharaf123@gmail.com', 'BLAHH BALH...', 'DDF', '2023-01-28', '5', '2023-01-05 10:58:01.000000', '2023-01-05 11:02:30.035768', 3, 2, 2, 1, 1, 'anisha123@gmail.com', 4, '8038483fb669a7c6d1d2', '8038483fb669a7c6d1d2', 1, NULL),
(17, 'SSV', 'tvm', 'Proudeon', 'vd', 'jgfhgj', '1234567890', 'hdghgj', 'ryurdyuj', '7025054723', 'haji@gmail.com', 'svsv', 'vv', '2023-02-23', '3', '2023-02-07 08:46:05.000000', '2023-02-07 08:46:40.495583', 1, 5, 2, 1, 1, 'anisha123@gmail.com', 7, 'effa70b07cc6e478c761-17', 'effa70b07cc6e478c761', 1, NULL),
(18, 'hh', 'Pandalam', 'Proudeon', 'gbhb', 'Sunil', '7736610860', 'Director', 'Veena', '7025054723', 'haji@gmail.com', 'erhr', 'bfd', '2023-02-10', '3', '2023-02-08 09:44:12.000000', '2023-02-08 09:44:46.571171', 2, 6, 3, 2, 1, 'sunil@gmail.com', 1, 'e5b80c303ba21da581a4', 'e5b80c303ba21da581a4', 1, NULL),
(19, 'bfbgbgb', 'gbgb', 'dbd', 'bbbber', 'fbdb', '1234567890', 'Director', 'Veena', '7510967200', 'haji@gmail.com', 'bb', 'ege', '2023-02-28', '1', '2023-02-08 09:44:46.000000', '2023-02-08 09:45:34.126963', 2, 3, 4, 1, 2, 'sunil@gmail.com', 1, '00cee8797a09ce185917', '00cee8797a09ce185917', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `crm_app_leadsource`
--

CREATE TABLE `crm_app_leadsource` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crm_app_leadsource`
--

INSERT INTO `crm_app_leadsource` (`id`, `name`) VALUES
(1, 'Facebook'),
(2, 'Youtube');

-- --------------------------------------------------------

--
-- Table structure for table `crm_app_leadstatus`
--

CREATE TABLE `crm_app_leadstatus` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crm_app_leadstatus`
--

INSERT INTO `crm_app_leadstatus` (`id`, `name`) VALUES
(1, 'Freshlead'),
(2, 'Openlead'),
(3, 'Runninglead'),
(4, 'ConvertToProject'),
(7, 'ClosedLead');

-- --------------------------------------------------------

--
-- Table structure for table `crm_app_leadtype`
--

CREATE TABLE `crm_app_leadtype` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crm_app_leadtype`
--

INSERT INTO `crm_app_leadtype` (`id`, `name`) VALUES
(2, 'Enquiry'),
(3, 'Test1'),
(4, 'Test2');

-- --------------------------------------------------------

--
-- Table structure for table `crm_app_project`
--

CREATE TABLE `crm_app_project` (
  `id` bigint(20) NOT NULL,
  `p_key` varchar(25) DEFAULT NULL,
  `slug` varchar(250) DEFAULT NULL,
  `project_title` varchar(30) DEFAULT NULL,
  `requirements` longtext DEFAULT NULL,
  `interest_rate` varchar(25) NOT NULL,
  `notes` longtext DEFAULT NULL,
  `date_added_on` datetime(6) NOT NULL,
  `actual_date_added_on` datetime(6) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `project_status_id` bigint(20) DEFAULT NULL,
  `lead_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crm_app_project`
--

INSERT INTO `crm_app_project` (`id`, `p_key`, `slug`, `project_title`, `requirements`, `interest_rate`, `notes`, `date_added_on`, `actual_date_added_on`, `category_id`, `client_id`, `project_status_id`, `lead_id`) VALUES
(65, '90ff', '90ff', 'website for textiles', 'dashboard, add to cart, cart, order details', '5', 'hgf', '2022-12-27 05:58:35.000000', '2023-02-03 05:08:08.934449', 3, 15, 1, NULL),
(66, 'e064', 'e064', 'Biling Software For hotel', 'food pice list, ..', '4', 'blahblah..', '2022-12-27 06:00:39.000000', '2023-01-10 06:24:16.833864', 3, 16, 1, NULL),
(67, '76c4', '76c4', 'Biling Software For Textiles', 'smthng...', '5', '....', '2022-12-27 06:01:15.000000', '2023-01-09 11:56:00.592295', 3, 15, 3, NULL),
(70, 'be68', 'be68', 'Biling Software For hotel', 'ghh', '2', 'hrth1111', '2022-12-27 09:50:45.000000', '2023-02-09 07:20:15.025030', 1, 17, 4, NULL),
(71, '0d93fa9a76c92a329181', '0d93fa9a76c92a329181-71', 'GHR', 'dff', '1', 'fff', '2022-12-28 12:15:06.000000', '2023-01-10 06:16:39.579538', 1, 16, 1, NULL),
(72, '2dc525c2c06d96c9656b', '2dc525c2c06d96c9656b', 'Biling Software For Bismi Text', 'blah...', '4', 'goo', '2022-12-31 04:06:49.000000', '2023-01-31 09:25:53.621195', 3, 19, 1, NULL),
(73, 'c8c512b09983079a8fb4', 'c8c512b09983079a8fb4-73', 'y4yu46', 'hgh', '3', 'hf', '2022-12-31 04:19:48.000000', '2023-02-03 05:15:42.297722', 2, 18, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `crm_app_projectassignment`
--

CREATE TABLE `crm_app_projectassignment` (
  `id` bigint(20) NOT NULL,
  `project_assignment_key` varchar(25) DEFAULT NULL,
  `added_on` date NOT NULL,
  `message` longtext DEFAULT NULL,
  `added_by_id` bigint(20) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `document` varchar(100) DEFAULT NULL,
  `project_assignment` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crm_app_projectassignment`
--

INSERT INTO `crm_app_projectassignment` (`id`, `project_assignment_key`, `added_on`, `message`, `added_by_id`, `client_id`, `project_id`, `document`, `project_assignment`) VALUES
(256, '1cad88263f08bf22d111', '2023-02-13', 'fhgh', 8, 19, 72, 'documents/Site_execution_Search_Report_3WIuG82_hV4yk7P.xls', 'Ehas'),
(257, 'a994265613dece40e952', '2023-02-13', 'hey zzzz', 8, 18, 73, 'documents/Open_Leads_Search_Report_1_Gxm02n1.xls', 'Amal'),
(260, '6af3a0b265423752959c', '2023-02-13', 'hlo guys', 8, 17, 70, 'documents/Site_execution_Search_Report_3WIuG82_DpUruD7.xls', 'Ehas');

-- --------------------------------------------------------

--
-- Table structure for table `crm_app_projectstatus`
--

CREATE TABLE `crm_app_projectstatus` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crm_app_projectstatus`
--

INSERT INTO `crm_app_projectstatus` (`id`, `name`) VALUES
(1, 'Freshproject'),
(2, 'Runningproject'),
(3, 'SuspendedProject'),
(4, 'ClosedProject');

-- --------------------------------------------------------

--
-- Table structure for table `crm_app_state`
--

CREATE TABLE `crm_app_state` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crm_app_state`
--

INSERT INTO `crm_app_state` (`id`, `name`) VALUES
(1, 'Kerala'),
(2, 'Tamilnadu');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-12-09 08:58:58.143048', '1', 'Kerala', 1, '[{\"added\": {}}]', 10, 1),
(2, '2022-12-09 08:59:05.630352', '2', 'Tamilnadu', 1, '[{\"added\": {}}]', 10, 1),
(3, '2022-12-09 08:59:17.911945', '1', 'Trivandrum', 1, '[{\"added\": {}}]', 8, 1),
(4, '2022-12-09 08:59:24.080803', '2', 'Pathanamthitta', 1, '[{\"added\": {}}]', 8, 1),
(5, '2022-12-09 08:59:33.480595', '3', 'Alappuzha', 1, '[{\"added\": {}}]', 8, 1),
(6, '2022-12-09 08:59:42.178771', '4', 'Kollam', 1, '[{\"added\": {}}]', 8, 1),
(7, '2022-12-09 08:59:42.203194', '5', 'Kollam', 1, '[{\"added\": {}}]', 8, 1),
(8, '2022-12-09 08:59:54.592734', '6', 'Thirunelveli', 1, '[{\"added\": {}}]', 8, 1),
(9, '2022-12-09 09:00:01.656029', '7', 'Thanjavur', 1, '[{\"added\": {}}]', 8, 1),
(10, '2022-12-09 09:00:10.160465', '8', 'Kanyakumari', 1, '[{\"added\": {}}]', 8, 1),
(11, '2022-12-09 09:01:10.182041', '2', 'Enquiry', 1, '[{\"added\": {}}]', 12, 1),
(12, '2022-12-09 09:01:24.758181', '3', 'Test1', 1, '[{\"added\": {}}]', 12, 1),
(13, '2022-12-09 09:01:32.045727', '4', 'Test2', 1, '[{\"added\": {}}]', 12, 1),
(14, '2022-12-09 09:04:23.926987', '1', 'SEO', 1, '[{\"added\": {}}]', 9, 1),
(15, '2022-12-09 09:04:35.815837', '2', 'Social Media', 1, '[{\"added\": {}}]', 9, 1),
(16, '2022-12-09 09:04:50.165691', '3', 'Web Design&Development', 1, '[{\"added\": {}}]', 9, 1),
(17, '2022-12-09 09:10:34.671663', '1', 'Facebook', 1, '[{\"added\": {}}]', 13, 1),
(18, '2022-12-09 09:10:42.591307', '2', 'Youtube', 1, '[{\"added\": {}}]', 13, 1),
(19, '2022-12-10 06:11:28.174187', '1', 'pandalam', 1, '[{\"added\": {}}]', 7, 1),
(20, '2022-12-10 06:11:37.509681', '2', 'adoor', 1, '[{\"added\": {}}]', 7, 1),
(21, '2022-12-10 06:11:54.079082', '3', 'venjaramood', 1, '[{\"added\": {}}]', 7, 1),
(22, '2022-12-10 06:12:42.894045', '4', 'Kazhakkoottam', 1, '[{\"added\": {}}]', 7, 1),
(23, '2022-12-12 09:29:46.255297', '3', 'EHAS', 3, '', 14, 1),
(24, '2022-12-12 09:29:53.627501', '2', 'Hajara Aji', 2, '[{\"changed\": {\"fields\": [\"User\"]}}]', 14, 1),
(25, '2022-12-12 09:29:57.560282', '1', 'midhun', 2, '[]', 14, 1),
(26, '2022-12-12 09:30:07.497603', '4', 'haj123', 3, '', 4, 1),
(27, '2022-12-12 09:30:16.299885', '7', 'admin123', 3, '', 4, 1),
(28, '2022-12-12 09:30:35.515987', '6', 'amal123', 3, '', 4, 1),
(29, '2022-12-13 06:04:38.420892', '1', 'Fresh Lead', 1, '[{\"added\": {}}]', 15, 1),
(30, '2022-12-13 06:04:51.236989', '2', 'Open Lead', 1, '[{\"added\": {}}]', 15, 1),
(31, '2022-12-13 06:05:20.348248', '4', 'kjk', 1, '[{\"added\": {}}]', 15, 1),
(32, '2022-12-13 06:05:28.894066', '4', 'kjk', 3, '', 15, 1),
(33, '2022-12-13 07:03:36.117034', '2', 'Open Lead', 2, '[]', 15, 1),
(34, '2022-12-13 07:05:57.471070', '2', 'openlead', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 15, 1),
(35, '2022-12-13 07:06:06.406885', '1', 'freshlead', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 15, 1),
(36, '2022-12-13 08:16:38.007286', '1', 'Freshlead', 1, '[{\"added\": {}}]', 15, 1),
(37, '2022-12-13 08:16:46.692316', '2', 'Openlead', 1, '[{\"added\": {}}]', 15, 1),
(38, '2022-12-14 09:07:13.388873', '3', 'Runninglead', 1, '[{\"added\": {}}]', 15, 1),
(39, '2022-12-14 10:05:40.688172', '16', 'hrtj5yk', 3, '', 11, 1),
(40, '2022-12-14 10:05:40.690449', '13', 'Haji', 3, '', 11, 1),
(41, '2022-12-14 10:05:40.692033', '12', 'web design', 3, '', 11, 1),
(42, '2022-12-14 10:05:40.694044', '10', 'Tesla', 3, '', 11, 1),
(43, '2022-12-14 10:05:40.697044', '8', 'website for business', 3, '', 11, 1),
(44, '2022-12-14 10:05:40.700045', '7', '5h5y', 3, '', 11, 1),
(45, '2022-12-14 10:05:40.701044', '6', 'uhjtj', 3, '', 11, 1),
(46, '2022-12-14 10:05:40.704225', '5', 'liului', 3, '', 11, 1),
(47, '2022-12-14 10:05:40.707056', '4', 'yiyui', 3, '', 11, 1),
(48, '2022-12-14 10:05:40.709628', '3', 'ghgh', 3, '', 11, 1),
(49, '2022-12-14 10:05:40.712643', '2', 'haj', 3, '', 11, 1),
(50, '2022-12-14 10:14:27.673580', '19', 'WEB SITE FOR BUSINESS', 2, '[{\"changed\": {\"fields\": [\"Callbackdate\"]}}]', 11, 1),
(51, '2022-12-14 11:16:20.161158', '11', 'prajitha123', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 4, 1),
(52, '2022-12-14 11:17:10.496320', '5', 'mid123', 2, '[]', 4, 1),
(53, '2022-12-14 11:17:20.847012', '11', 'prajitha123', 2, '[]', 4, 1),
(54, '2022-12-16 06:25:57.306958', '4', '4', 1, '[{\"added\": {}}]', 15, 1),
(55, '2022-12-16 06:27:03.330576', '5', '5', 1, '[{\"added\": {}}]', 15, 1),
(56, '2022-12-16 06:27:14.459290', '6', 'Client', 1, '[{\"added\": {}}]', 15, 1),
(57, '2022-12-17 11:27:03.158093', '8', 'htet', 2, '[{\"changed\": {\"fields\": [\"Client\"]}}]', 17, 1),
(58, '2022-12-17 11:27:13.045550', '7', 'vsfgf', 2, '[{\"changed\": {\"fields\": [\"Client\"]}}]', 17, 1),
(59, '2022-12-17 11:27:38.207076', '8', 'htet', 3, '', 17, 1),
(60, '2022-12-17 11:27:38.210157', '7', 'vsfgf', 3, '', 17, 1),
(61, '2022-12-17 11:27:38.212274', '6', 'fdsgfh', 3, '', 17, 1),
(62, '2022-12-17 11:27:38.214440', '5', 'eggb', 3, '', 17, 1),
(63, '2022-12-17 11:27:38.216291', '4', 'nhgnmghm', 3, '', 17, 1),
(64, '2022-12-17 11:27:38.218355', '3', 'yuj', 3, '', 17, 1),
(65, '2022-12-17 11:27:38.222325', '2', 'hjkkennmnbgnnnjm', 3, '', 17, 1),
(66, '2022-12-20 04:59:28.021530', '8', 'Midhun', 2, '[{\"changed\": {\"fields\": [\"Client status\"]}}]', 16, 1),
(67, '2022-12-20 05:02:28.769944', '1', 'Junk', 1, '[{\"added\": {}}]', 18, 1),
(68, '2022-12-20 05:02:35.967844', '2', 'Deactivate', 1, '[{\"added\": {}}]', 18, 1),
(69, '2022-12-20 05:03:38.341288', '3', 'Activeclient', 1, '[{\"added\": {}}]', 18, 1),
(70, '2022-12-20 05:24:56.828570', '3', 'Activeclient', 2, '[]', 18, 1),
(71, '2022-12-20 05:33:43.734190', '1', 'DGHD', 2, '[{\"changed\": {\"fields\": [\"Client status\"]}}]', 17, 1),
(72, '2022-12-20 05:33:55.512497', '13', 'dfdbb', 2, '[{\"changed\": {\"fields\": [\"Client status\"]}}]', 17, 1),
(73, '2022-12-20 05:44:12.781496', '8', 'Midhun', 2, '[{\"changed\": {\"fields\": [\"Client status\"]}}]', 16, 1),
(74, '2022-12-20 05:56:28.484015', '7', 'ki7', 2, '[{\"changed\": {\"fields\": [\"Client status\"]}}]', 16, 1),
(75, '2022-12-22 05:10:05.365421', '25', 'rfrg', 3, '', 17, 1),
(76, '2022-12-22 05:10:05.369325', '24', 'HYH', 3, '', 17, 1),
(77, '2022-12-22 05:10:05.372351', '23', 'gfjfhj', 3, '', 17, 1),
(78, '2022-12-22 05:10:05.374507', '22', 'hjkj', 3, '', 17, 1),
(79, '2022-12-22 05:10:05.376350', '21', 'hk', 3, '', 17, 1),
(80, '2022-12-22 05:10:05.379473', '20', 'yt', 3, '', 17, 1),
(81, '2022-12-22 05:10:05.381346', '19', 'ghdh', 3, '', 17, 1),
(82, '2022-12-22 05:10:05.383500', '18', 'wgerg', 3, '', 17, 1),
(83, '2022-12-22 05:10:05.386593', '17', 'fgfghfghf', 3, '', 17, 1),
(84, '2022-12-22 05:10:05.388604', '16', 'FGFH', 3, '', 17, 1),
(85, '2022-12-22 05:10:05.391606', '15', 'K', 3, '', 17, 1),
(86, '2022-12-22 05:10:05.393615', '14', 'frege', 3, '', 17, 1),
(87, '2022-12-22 05:10:05.395603', '13', 'dfdbb', 3, '', 17, 1),
(88, '2022-12-22 05:10:05.397683', '12', 'efr', 3, '', 17, 1),
(89, '2022-12-22 05:10:05.399608', '11', 'erwet', 3, '', 17, 1),
(90, '2022-12-22 05:10:05.401604', '9', 'gsdh', 3, '', 17, 1),
(91, '2022-12-22 09:00:35.164634', '36', 'gdh', 3, '', 17, 1),
(92, '2022-12-27 09:47:32.290749', '1', 'Freshproject', 1, '[{\"added\": {}}]', 19, 1),
(93, '2022-12-27 09:47:40.865555', '2', 'Openproject', 1, '[{\"added\": {}}]', 19, 1),
(94, '2022-12-27 09:47:54.913317', '3', 'runningproject', 1, '[{\"added\": {}}]', 19, 1),
(95, '2022-12-27 09:48:04.106849', '3', 'Runningproject', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 19, 1),
(96, '2022-12-27 10:02:34.958441', '9', 'sunil@123', 3, '', 4, 1),
(97, '2022-12-27 12:09:01.573417', '1', '0', 1, '[{\"added\": {}}]', 20, 1),
(98, '2022-12-27 12:09:13.324270', '1', '0', 3, '', 20, 1),
(99, '2022-12-27 12:09:19.916295', '2', '0', 1, '[{\"added\": {}}]', 20, 1),
(100, '2022-12-27 12:09:23.379583', '3', '1', 1, '[{\"added\": {}}]', 20, 1),
(101, '2022-12-27 12:09:27.491829', '4', '-1', 1, '[{\"added\": {}}]', 20, 1),
(102, '2022-12-28 04:16:43.211785', '14', 'ajimon123', 2, '[{\"changed\": {\"fields\": [\"First name\"]}}]', 4, 1),
(103, '2022-12-28 04:34:55.001690', '15', 'Haji', 2, '[{\"changed\": {\"fields\": [\"Owner name\"]}}]', 16, 1),
(104, '2022-12-29 06:38:15.135437', '4', 'ConvertToClient', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 15, 1),
(105, '2022-12-29 06:38:25.048816', '6', 'Client', 3, '', 15, 1),
(106, '2022-12-29 06:38:25.050975', '5', '5', 3, '', 15, 1),
(107, '2022-12-29 06:38:44.160558', '4', 'ConvertToProject', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 15, 1),
(108, '2022-12-29 06:44:11.871290', '4', 'ConvertToProject', 2, '[]', 15, 1),
(109, '2022-12-29 06:50:57.664824', '2', 'Runningproject', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 19, 1),
(110, '2022-12-29 06:51:13.319878', '3', 'SuspendedProject', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 19, 1),
(111, '2022-12-29 06:51:24.631479', '4', 'ClosedProject', 1, '[{\"added\": {}}]', 19, 1),
(112, '2022-12-30 08:47:40.877768', '2', 'ProjectAssignment object (2)', 3, '', 23, 1),
(113, '2022-12-31 04:31:05.200586', '21', 'ProjectAssignment object (21)', 3, '', 23, 1),
(114, '2022-12-31 04:31:05.203414', '20', 'ProjectAssignment object (20)', 3, '', 23, 1),
(115, '2022-12-31 04:31:05.205821', '19', 'ProjectAssignment object (19)', 3, '', 23, 1),
(116, '2022-12-31 04:31:05.207956', '18', 'ProjectAssignment object (18)', 3, '', 23, 1),
(117, '2022-12-31 04:31:05.209819', '17', 'ProjectAssignment object (17)', 3, '', 23, 1),
(118, '2022-12-31 04:31:05.212857', '16', 'ProjectAssignment object (16)', 3, '', 23, 1),
(119, '2022-12-31 04:31:05.214822', '15', 'ProjectAssignment object (15)', 3, '', 23, 1),
(120, '2022-12-31 04:31:05.216820', '14', 'ProjectAssignment object (14)', 3, '', 23, 1),
(121, '2022-12-31 04:31:05.219823', '13', 'ProjectAssignment object (13)', 3, '', 23, 1),
(122, '2022-12-31 04:31:05.221866', '12', 'ProjectAssignment object (12)', 3, '', 23, 1),
(123, '2022-12-31 04:31:05.224299', '11', 'ProjectAssignment object (11)', 3, '', 23, 1),
(124, '2022-12-31 04:31:05.227309', '10', 'ProjectAssignment object (10)', 3, '', 23, 1),
(125, '2022-12-31 04:31:05.230312', '9', 'ProjectAssignment object (9)', 3, '', 23, 1),
(126, '2022-12-31 04:31:05.234312', '8', 'ProjectAssignment object (8)', 3, '', 23, 1),
(127, '2022-12-31 04:31:05.236477', '7', 'ProjectAssignment object (7)', 3, '', 23, 1),
(128, '2022-12-31 04:31:05.239312', '6', 'ProjectAssignment object (6)', 3, '', 23, 1),
(129, '2022-12-31 04:31:05.241257', '5', 'ProjectAssignment object (5)', 3, '', 23, 1),
(130, '2022-12-31 04:31:05.242267', '4', 'ProjectAssignment object (4)', 3, '', 23, 1),
(131, '2022-12-31 04:31:05.245269', '3', 'ProjectAssignment object (3)', 3, '', 23, 1),
(132, '2022-12-31 04:31:05.247270', '1', 'ProjectAssignment object (1)', 3, '', 23, 1),
(133, '2023-01-03 04:55:38.882227', '26', 'Midhun Babu', 3, '', 23, 1),
(134, '2023-01-03 04:55:38.885153', '24', 'Midhun Babu-', 3, '', 23, 1),
(135, '2023-01-03 04:55:38.888160', '23', 'Ehas-', 3, '', 23, 1),
(136, '2023-01-03 04:55:38.890159', '22', 'Ehas-', 3, '', 23, 1),
(137, '2023-01-03 04:56:16.224943', '31', '[\'Midhun Babu\']', 3, '', 23, 1),
(138, '2023-01-03 04:56:16.226378', '30', '[\'Midhun Babu\']', 3, '', 23, 1),
(139, '2023-01-03 04:56:16.229393', '29', '[\'Midhun Babu\']', 3, '', 23, 1),
(140, '2023-01-03 04:56:16.231391', '27', '[\'Ehas\']', 3, '', 23, 1),
(141, '2023-01-03 05:04:15.681601', '37', '[\'Ehas\']', 3, '', 23, 1),
(142, '2023-01-03 05:04:15.684587', '36', '[\'Ehas\']', 3, '', 23, 1),
(143, '2023-01-03 05:04:15.688589', '35', '[\'Midhun Babu\']', 3, '', 23, 1),
(144, '2023-01-03 05:04:15.690592', '34', '[\'Ehas\']', 3, '', 23, 1),
(145, '2023-01-03 05:04:15.693389', '33', '[\'Midhun Babu\']', 3, '', 23, 1),
(146, '2023-01-03 05:04:15.695036', '32', '[\'Midhun Babu\']', 3, '', 23, 1),
(147, '2023-01-03 05:15:42.772857', '44', '[\'Midhun Babu\']', 3, '', 23, 1),
(148, '2023-01-03 05:15:42.776781', '43', '[\'Ehas\']', 3, '', 23, 1),
(149, '2023-01-03 05:15:42.779813', '42', '[\'Midhun Babu\']', 3, '', 23, 1),
(150, '2023-01-03 05:15:42.782162', '41', '[\'Midhun Babu\']', 3, '', 23, 1),
(151, '2023-01-03 05:15:42.784417', '40', '[\'Midhun Babu\']', 3, '', 23, 1),
(152, '2023-01-03 05:15:42.786417', '39', '[\'Midhun Babu\']', 3, '', 23, 1),
(153, '2023-01-03 05:15:42.788422', '38', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(154, '2023-01-03 05:26:53.261577', '51', '[]', 3, '', 23, 1),
(155, '2023-01-03 05:26:53.264582', '50', '[]', 3, '', 23, 1),
(156, '2023-01-03 05:26:53.266581', '49', '[\'Ehas\']', 3, '', 23, 1),
(157, '2023-01-03 05:26:53.268742', '48', '[]', 3, '', 23, 1),
(158, '2023-01-03 05:26:53.271147', '47', '[\'Midhun Babu\']', 3, '', 23, 1),
(159, '2023-01-03 05:26:53.274195', '46', '[\'Ehas\']', 3, '', 23, 1),
(160, '2023-01-03 05:26:53.276160', '45', '[\'Ehas\']', 3, '', 23, 1),
(161, '2023-01-03 05:26:53.278332', '28', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(162, '2023-01-03 05:58:53.532460', '58', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(163, '2023-01-03 05:58:53.534462', '57', '[\'Midhun Babu\']', 3, '', 23, 1),
(164, '2023-01-03 05:58:53.537457', '56', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(165, '2023-01-03 05:58:53.539497', '55', '[]', 3, '', 23, 1),
(166, '2023-01-03 05:58:53.541992', '54', '[]', 3, '', 23, 1),
(167, '2023-01-03 05:58:53.544899', '53', '[\'Ehas\']', 3, '', 23, 1),
(168, '2023-01-03 05:58:53.546899', '52', '[\'Midhun Babu\']', 3, '', 23, 1),
(169, '2023-01-03 06:22:28.096611', '9', 'Ajimon K.S', 2, '[{\"changed\": {\"fields\": [\"Is client\"]}}]', 14, 1),
(170, '2023-01-03 06:39:26.310670', '64', '[\'Midhun Babu\']', 3, '', 23, 1),
(171, '2023-01-03 06:39:26.313629', '62', '[\'Midhun Babu\']', 3, '', 23, 1),
(172, '2023-01-03 06:39:38.559782', '63', '[\'Midhun Babu\']', 3, '', 23, 1),
(173, '2023-01-03 06:45:05.389258', '66', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(174, '2023-01-03 06:45:05.392232', '61', '[\'Ehas\']', 3, '', 23, 1),
(175, '2023-01-03 06:45:11.712625', '65', '[\'Ehas\']', 3, '', 23, 1),
(176, '2023-01-03 06:48:44.933403', '60', '[\'Midhun Babu\']', 3, '', 23, 1),
(177, '2023-01-03 06:48:52.682520', '59', '[\'Ehas\']', 3, '', 23, 1),
(178, '2023-01-03 07:20:01.005338', '68', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(179, '2023-01-03 07:20:01.008342', '67', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(180, '2023-01-03 07:23:17.519997', '70', 'Ehas-Midhun Babu-', 3, '', 23, 1),
(181, '2023-01-03 08:36:35.494478', '76', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(182, '2023-01-03 08:36:35.497448', '75', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(183, '2023-01-03 08:36:35.498447', '74', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(184, '2023-01-03 08:36:35.500448', '73', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(185, '2023-01-03 08:36:35.502448', '72', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(186, '2023-01-03 08:36:35.504447', '71', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(187, '2023-01-03 09:14:19.512860', '78', 'Midhun Babu', 3, '', 23, 1),
(188, '2023-01-03 09:17:54.825353', '82', 'Midhun Babu', 3, '', 23, 1),
(189, '2023-01-03 09:17:54.829362', '81', 'Midhun Babu', 3, '', 23, 1),
(190, '2023-01-03 09:17:54.831348', '80', 'Midhun Babu', 3, '', 23, 1),
(191, '2023-01-03 09:17:54.833321', '79', 'Midhun Babu', 3, '', 23, 1),
(192, '2023-01-03 09:39:37.449904', '83', 'Midhun Babu', 3, '', 23, 1),
(193, '2023-01-03 09:39:37.452872', '77', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(194, '2023-01-03 09:50:08.252887', '88', 'Midhun Babu', 3, '', 23, 1),
(195, '2023-01-03 09:50:08.255885', '87', 'Ehas', 3, '', 23, 1),
(196, '2023-01-03 09:50:08.257885', '86', 'Midhun Babu', 3, '', 23, 1),
(197, '2023-01-03 09:50:08.259887', '85', 'Ehas', 3, '', 23, 1),
(198, '2023-01-03 09:50:08.262833', '84', 'Midhun Babu', 3, '', 23, 1),
(199, '2023-01-03 10:11:23.306096', '91', 'Midhun Babu', 3, '', 23, 1),
(200, '2023-01-03 10:11:23.310096', '90', 'Midhun Babu', 3, '', 23, 1),
(201, '2023-01-03 10:11:23.313252', '89', 'Ehas', 3, '', 23, 1),
(202, '2023-01-03 10:33:42.691410', '97', 'Midhun Babu', 3, '', 23, 1),
(203, '2023-01-03 10:33:42.693411', '96', 'Ehas', 3, '', 23, 1),
(204, '2023-01-03 10:33:42.696409', '95', 'Midhun Babu', 3, '', 23, 1),
(205, '2023-01-03 10:33:42.698415', '94', 'Ehas', 3, '', 23, 1),
(206, '2023-01-03 10:33:42.700908', '93', 'Midhun Babu', 3, '', 23, 1),
(207, '2023-01-03 10:33:42.702946', '92', 'Ehas', 3, '', 23, 1),
(208, '2023-01-03 10:37:43.688329', '99', 'Midhun Babu', 3, '', 23, 1),
(209, '2023-01-03 10:37:43.691445', '98', 'Ehas', 3, '', 23, 1),
(210, '2023-01-03 10:39:12.928911', '101', 'Midhun Babu', 3, '', 23, 1),
(211, '2023-01-03 10:39:12.931880', '100', 'Ehas', 3, '', 23, 1),
(212, '2023-01-03 10:44:34.801704', '105', 'Midhun Babu', 3, '', 23, 1),
(213, '2023-01-03 10:44:34.805703', '104', 'Ehas', 3, '', 23, 1),
(214, '2023-01-03 10:44:34.807703', '103', 'Midhun Babu', 3, '', 23, 1),
(215, '2023-01-03 10:44:34.809704', '102', 'Ehas', 3, '', 23, 1),
(216, '2023-01-03 10:44:34.812705', '25', 'Ehas-Midhun Babu', 3, '', 23, 1),
(217, '2023-01-03 10:51:00.121891', '109', 'Midhun Babu', 3, '', 23, 1),
(218, '2023-01-03 10:51:00.124859', '108', 'Ehas', 3, '', 23, 1),
(219, '2023-01-03 10:51:00.127860', '107', 'Midhun Babu', 3, '', 23, 1),
(220, '2023-01-03 10:51:00.130010', '106', 'Ehas', 3, '', 23, 1),
(221, '2023-01-03 11:09:20.550720', '117', 'Midhun Babu', 3, '', 23, 1),
(222, '2023-01-03 11:09:20.553719', '116', 'Ehas', 3, '', 23, 1),
(223, '2023-01-03 11:09:20.557722', '115', 'Midhun Babu', 3, '', 23, 1),
(224, '2023-01-03 11:09:20.561724', '114', 'Ehas', 3, '', 23, 1),
(225, '2023-01-03 11:09:20.564416', '113', 'Midhun Babu', 3, '', 23, 1),
(226, '2023-01-03 11:09:20.566418', '112', 'Ehas', 3, '', 23, 1),
(227, '2023-01-03 11:09:20.568415', '111', 'Midhun Babu', 3, '', 23, 1),
(228, '2023-01-03 11:09:20.569415', '110', 'Ehas', 3, '', 23, 1),
(229, '2023-01-03 11:09:20.574420', '117', 'Midhun Babu', 3, '', 23, 1),
(230, '2023-01-03 11:09:20.576414', '116', 'Ehas', 3, '', 23, 1),
(231, '2023-01-03 11:09:20.581414', '115', 'Midhun Babu', 3, '', 23, 1),
(232, '2023-01-03 11:09:20.583414', '114', 'Ehas', 3, '', 23, 1),
(233, '2023-01-03 11:09:20.586417', '113', 'Midhun Babu', 3, '', 23, 1),
(234, '2023-01-03 11:09:20.590442', '112', 'Ehas', 3, '', 23, 1),
(235, '2023-01-03 11:09:20.592418', '111', 'Midhun Babu', 3, '', 23, 1),
(236, '2023-01-03 11:09:20.595417', '110', 'Ehas', 3, '', 23, 1),
(237, '2023-01-04 05:41:30.356406', '121', 'Ehas', 2, '[{\"changed\": {\"fields\": [\"Message\"]}}]', 23, 1),
(238, '2023-01-04 09:18:49.672855', '123', 'Ehas', 3, '', 23, 1),
(239, '2023-01-05 04:44:27.540458', '146', 'Amal', 3, '', 23, 1),
(240, '2023-01-05 04:44:27.542561', '145', 'Midhun Babu', 3, '', 23, 1),
(241, '2023-01-05 04:44:27.544454', '144', 'Ehas', 3, '', 23, 1),
(242, '2023-01-05 04:44:27.547457', '143', 'Amal', 3, '', 23, 1),
(243, '2023-01-05 04:44:27.552458', '142', 'Midhun Babu', 3, '', 23, 1),
(244, '2023-01-05 04:44:27.554564', '141', 'Ehas', 3, '', 23, 1),
(245, '2023-01-05 04:44:27.557460', '140', 'Amal', 3, '', 23, 1),
(246, '2023-01-05 04:44:27.559562', '139', 'Midhun Babu', 3, '', 23, 1),
(247, '2023-01-05 04:44:27.561453', '138', 'Amal', 3, '', 23, 1),
(248, '2023-01-05 04:44:27.564510', '137', 'Midhun Babu', 3, '', 23, 1),
(249, '2023-01-05 04:44:27.566454', '136', 'Amal', 3, '', 23, 1),
(250, '2023-01-05 04:44:27.569455', '135', 'Midhun Babu', 3, '', 23, 1),
(251, '2023-01-05 04:44:27.571459', '134', 'Ehas', 3, '', 23, 1),
(252, '2023-01-05 04:44:27.573452', '133', 'Amal', 3, '', 23, 1),
(253, '2023-01-05 04:44:27.574483', '132', 'Midhun Babu', 3, '', 23, 1),
(254, '2023-01-05 04:44:27.576484', '131', 'Ehas', 3, '', 23, 1),
(255, '2023-01-05 04:44:27.578453', '130', 'Amal', 3, '', 23, 1),
(256, '2023-01-05 04:44:27.579453', '129', 'Midhun Babu', 3, '', 23, 1),
(257, '2023-01-05 04:44:27.581501', '128', 'Ehas', 3, '', 23, 1),
(258, '2023-01-05 04:44:27.583452', '127', 'Amal', 3, '', 23, 1),
(259, '2023-01-05 04:44:27.586263', '126', 'Midhun Babu', 3, '', 23, 1),
(260, '2023-01-05 04:44:27.588275', '125', 'Ehas', 3, '', 23, 1),
(261, '2023-01-05 04:44:27.589271', '124', 'Ehas', 3, '', 23, 1),
(262, '2023-01-05 04:44:27.591357', '122', 'Midhun Babu', 3, '', 23, 1),
(263, '2023-01-05 04:44:27.593274', '121', 'Ehas', 3, '', 23, 1),
(264, '2023-01-05 04:44:27.594311', '120', 'Midhun Babu', 3, '', 23, 1),
(265, '2023-01-05 04:44:27.595272', '119', 'Ehas', 3, '', 23, 1),
(266, '2023-01-05 04:44:27.596272', '118', 'Ehas', 3, '', 23, 1),
(267, '2023-01-05 07:02:13.781771', '4', 'ConvertToProject', 2, '[]', 15, 1),
(268, '2023-01-05 10:31:33.314693', '4', 'ConvertToProject', 2, '[]', 15, 1),
(269, '2023-01-07 05:51:57.882860', '154', 'Ehas', 3, '', 23, 1),
(270, '2023-01-07 05:51:57.884860', '153', 'Ehas', 3, '', 23, 1),
(271, '2023-01-07 05:51:57.886860', '152', 'Amal', 3, '', 23, 1),
(272, '2023-01-07 05:51:57.889022', '151', 'Midhun Babu', 3, '', 23, 1),
(273, '2023-01-07 05:51:57.890861', '150', 'Ehas', 3, '', 23, 1),
(274, '2023-01-07 05:51:57.893859', '149', 'Amal', 3, '', 23, 1),
(275, '2023-01-07 05:51:57.895126', '148', 'Midhun Babu', 3, '', 23, 1),
(276, '2023-01-07 05:51:57.896634', '147', 'Ehas', 3, '', 23, 1),
(277, '2023-01-07 06:21:15.909534', '156', 'Ehas', 2, '[{\"changed\": {\"fields\": [\"Document\"]}}]', 23, 1),
(278, '2023-01-07 09:05:54.736861', '167', 'Amal', 3, '', 23, 1),
(279, '2023-01-07 09:05:54.742039', '166', 'Amal', 3, '', 23, 1),
(280, '2023-01-07 09:05:54.744038', '165', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(281, '2023-01-07 09:05:54.746035', '164', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(282, '2023-01-07 09:05:54.748034', '163', 'Amal', 3, '', 23, 1),
(283, '2023-01-07 09:05:54.750065', '162', 'Amal', 3, '', 23, 1),
(284, '2023-01-07 09:05:54.752031', '160', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(285, '2023-01-07 09:05:54.754041', '159', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(286, '2023-01-07 09:05:54.756030', '158', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(287, '2023-01-07 09:05:54.759037', '157', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(288, '2023-01-07 09:05:54.760821', '156', '[\'Ehas\', \'Midhun Babu\']', 3, '', 23, 1),
(289, '2023-01-07 09:20:13.053575', '170', 'Midhun Babu', 3, '', 23, 1),
(290, '2023-01-07 09:20:13.055453', '169', 'Midhun Babu', 3, '', 23, 1),
(291, '2023-01-07 09:20:13.057469', '168', 'Midhun Babu', 3, '', 23, 1),
(292, '2023-01-07 09:22:36.257780', '171', 'Amal', 3, '', 23, 1),
(293, '2023-01-07 12:17:39.439878', '8', 'fahad', 3, '', 4, 1),
(294, '2023-01-09 10:56:22.965163', '184', 'Amal', 3, '', 23, 1),
(295, '2023-01-09 10:56:22.968163', '183', 'Midhun Babu', 3, '', 23, 1),
(296, '2023-01-09 10:56:22.970162', '182', 'Ehas', 3, '', 23, 1),
(297, '2023-01-09 10:56:22.972164', '181', 'Amal', 3, '', 23, 1),
(298, '2023-01-09 10:56:22.974162', '180', 'Ehas', 3, '', 23, 1),
(299, '2023-01-09 10:56:22.976190', '179', 'Midhun Babu', 3, '', 23, 1),
(300, '2023-01-09 10:56:22.978162', '178', 'Ehas', 3, '', 23, 1),
(301, '2023-01-09 10:56:22.980163', '176', 'Ehas', 3, '', 23, 1),
(302, '2023-01-09 10:56:22.983196', '175', 'Amal', 3, '', 23, 1),
(303, '2023-01-09 10:56:22.985163', '174', 'Amal', 3, '', 23, 1),
(304, '2023-01-09 10:56:22.986161', '173', 'Amal', 3, '', 23, 1),
(305, '2023-01-09 10:56:22.988161', '172', 'Midhun Babu', 3, '', 23, 1),
(306, '2023-01-09 10:56:22.991161', '161', 'Amal', 3, '', 23, 1),
(307, '2023-01-10 06:25:11.286668', '198', 'True', 3, '', 23, 1),
(308, '2023-01-10 06:25:11.290686', '197', 'True', 3, '', 23, 1),
(309, '2023-01-10 06:25:11.292715', '196', 'True', 3, '', 23, 1),
(310, '2023-01-10 06:25:11.294680', '195', 'True', 3, '', 23, 1),
(311, '2023-01-10 06:25:11.296688', '194', 'True', 3, '', 23, 1),
(312, '2023-01-10 06:25:11.300681', '193', 'False', 3, '', 23, 1),
(313, '2023-01-10 06:25:11.302922', '192', 'False', 3, '', 23, 1),
(314, '2023-01-10 06:25:11.305233', '191', 'True', 3, '', 23, 1),
(315, '2023-01-10 06:25:11.307247', '190', 'False', 3, '', 23, 1),
(316, '2023-01-10 06:25:11.310269', '189', 'True', 3, '', 23, 1),
(317, '2023-01-10 06:25:11.312233', '188', 'True', 3, '', 23, 1),
(318, '2023-01-10 06:25:11.314230', '187', 'False', 3, '', 23, 1),
(319, '2023-01-10 06:25:11.315232', '186', 'False', 3, '', 23, 1),
(320, '2023-01-10 06:25:11.317233', '185', 'False', 3, '', 23, 1),
(321, '2023-01-27 06:12:57.994669', '199', 'Midhun Babu', 2, '[{\"changed\": {\"fields\": [\"Project assignment\"]}}]', 23, 1),
(322, '2023-01-27 06:13:00.612724', '199', 'Midhun Babu', 2, '[]', 23, 1),
(323, '2023-01-27 06:19:00.286291', '199', 'Midhun Babu', 3, '', 23, 1),
(324, '2023-01-28 05:15:14.039357', '1', 'Web Design&Development', 1, '[{\"added\": {}}]', 24, 1),
(325, '2023-01-28 05:15:32.590498', '2', 'Social Media', 1, '[{\"added\": {}}]', 24, 1),
(326, '2023-01-28 05:17:15.431108', '3', 'SEO', 1, '[{\"added\": {}}]', 24, 1),
(327, '2023-02-02 06:10:39.215583', '209', 'Amal', 3, '', 23, 1),
(328, '2023-02-02 06:10:39.217590', '208', 'Amal', 3, '', 23, 1),
(329, '2023-02-02 06:10:39.220595', '207', 'Amal', 3, '', 23, 1),
(330, '2023-02-02 06:10:39.222589', '206', 'Amal', 3, '', 23, 1),
(331, '2023-02-02 06:10:39.224699', '205', 'Amal', 3, '', 23, 1),
(332, '2023-02-02 06:10:39.226811', '203', 'Amal', 3, '', 23, 1),
(333, '2023-02-02 06:10:39.229211', '202', 'Amal', 3, '', 23, 1),
(334, '2023-02-02 06:37:15.712696', '214', 'Ehas', 3, '', 23, 1),
(335, '2023-02-02 06:37:15.715709', '213', 'Midhun Babu', 3, '', 23, 1),
(336, '2023-02-02 06:37:15.718710', '204', 'Midhun Babu', 3, '', 23, 1),
(337, '2023-02-02 06:37:15.720743', '201', 'Amal', 3, '', 23, 1),
(338, '2023-02-02 12:01:38.511221', '215', 'Amal', 2, '[{\"changed\": {\"fields\": [\"Project assignment\"]}}]', 23, 1),
(339, '2023-02-03 04:35:14.306124', '215', 'Ehas, Midhun Babu, Amal', 2, '[{\"changed\": {\"fields\": [\"Project assignment\"]}}]', 23, 1),
(340, '2023-02-03 05:31:15.599665', '216', 'Amal', 3, '', 23, 1),
(341, '2023-02-03 05:31:15.602536', '215', 'Amal', 3, '', 23, 1),
(342, '2023-02-03 10:34:01.168307', '222', 'Amal', 3, '', 23, 1),
(343, '2023-02-03 10:34:01.170777', '221', 'Midhun Babu', 3, '', 23, 1),
(344, '2023-02-03 10:34:01.173775', '220', 'Amal', 3, '', 23, 1),
(345, '2023-02-03 10:34:01.175890', '219', 'Midhun Babu', 3, '', 23, 1),
(346, '2023-02-03 10:34:01.177779', '218', 'Ehas', 3, '', 23, 1),
(347, '2023-02-03 11:09:06.504227', '229', 'Amal', 3, '', 23, 1),
(348, '2023-02-03 11:09:06.506396', '228', 'Midhun Babu', 3, '', 23, 1),
(349, '2023-02-03 11:09:06.509484', '227', 'Amal', 3, '', 23, 1),
(350, '2023-02-03 11:09:06.511395', '226', 'Midhun Babu', 3, '', 23, 1),
(351, '2023-02-03 11:09:06.514459', '225', 'Ehas', 3, '', 23, 1),
(352, '2023-02-03 11:09:06.516397', '224', '<QuerySet [<ExtendedUserModel: Ehas>, <ExtendedUserModel: Midhun Babu>, <ExtendedUserModel: Amal>]>', 3, '', 23, 1),
(353, '2023-02-03 11:09:06.518397', '217', '<QuerySet [<ExtendedUserModel: Midhun Babu>, <ExtendedUserModel: Amal>]>', 3, '', 23, 1),
(354, '2023-02-03 12:04:22.613561', '236', 'Amal', 3, '', 23, 1),
(355, '2023-02-03 12:04:22.616727', '235', 'Midhun Babu', 3, '', 23, 1),
(356, '2023-02-03 12:04:22.618903', '234', 'Ehas', 3, '', 23, 1),
(357, '2023-02-03 12:04:22.620748', '233', '<QuerySet [<ExtendedUserModel: Ehas>, <ExtendedUserModel: Midhun Babu>]>', 3, '', 23, 1),
(358, '2023-02-03 12:04:22.623915', '232', 'Midhun Babu', 3, '', 23, 1),
(359, '2023-02-03 12:04:22.625748', '231', 'Ehas', 3, '', 23, 1),
(360, '2023-02-07 05:43:46.393288', '3', 'HN', 2, '[{\"changed\": {\"fields\": [\"Lead statuss\"]}}]', 11, 1),
(361, '2023-02-07 05:43:54.673032', '3', 'HN', 3, '', 11, 1),
(362, '2023-02-07 06:30:21.076297', '7', 'ClosedLeads', 1, '[{\"added\": {}}]', 15, 1),
(363, '2023-02-07 06:34:33.383789', '7', 'ClosedLead', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 15, 1),
(364, '2023-02-07 10:08:26.172740', '21', 'shefeek', 2, '[{\"changed\": {\"fields\": [\"Email address\"]}}]', 4, 1),
(365, '2023-02-09 08:43:09.807913', '241', 'Amal', 3, '', 23, 1),
(366, '2023-02-09 08:43:09.811919', '240', 'Midhun Babu', 3, '', 23, 1),
(367, '2023-02-09 08:43:09.813870', '239', 'Ehas', 3, '', 23, 1),
(368, '2023-02-09 08:43:09.816870', '238', 'Amal', 3, '', 23, 1),
(369, '2023-02-13 05:13:36.679504', '252', 'Midhun Babu', 3, '', 23, 1),
(370, '2023-02-13 05:13:36.684503', '251', 'Midhun Babu', 3, '', 23, 1),
(371, '2023-02-13 05:13:36.687510', '250', 'Midhun Babu', 3, '', 23, 1),
(372, '2023-02-13 05:13:36.689605', '249', 'Midhun Babu', 3, '', 23, 1),
(373, '2023-02-13 06:35:15.034648', '253', 'Midhun Babu', 3, '', 23, 1),
(374, '2023-02-13 06:43:37.717969', '259', 'Midhun Babu', 3, '', 23, 1),
(375, '2023-02-13 06:43:37.720000', '258', 'Midhun Babu', 3, '', 23, 1),
(376, '2023-02-13 06:43:37.721965', '255', 'Midhun Babu', 3, '', 23, 1),
(377, '2023-02-13 06:43:37.727731', '254', 'Midhun Babu', 3, '', 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(22, 'Crm_app', 'billing'),
(7, 'Crm_app', 'city'),
(16, 'Crm_app', 'client'),
(18, 'Crm_app', 'clientstatus'),
(8, 'Crm_app', 'district'),
(14, 'Crm_app', 'extendedusermodel'),
(21, 'Crm_app', 'invoice'),
(20, 'Crm_app', 'invoicestatus'),
(9, 'Crm_app', 'leadcategory'),
(11, 'Crm_app', 'leads'),
(13, 'Crm_app', 'leadsource'),
(15, 'Crm_app', 'leadstatus'),
(12, 'Crm_app', 'leadtype'),
(17, 'Crm_app', 'project'),
(23, 'Crm_app', 'projectassignment'),
(19, 'Crm_app', 'projectstatus'),
(10, 'Crm_app', 'state'),
(24, 'marketing', 'category'),
(25, 'marketing', 'marketing'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-12-09 06:28:19.506553'),
(2, 'auth', '0001_initial', '2022-12-09 06:28:19.853420'),
(3, 'admin', '0001_initial', '2022-12-09 06:28:19.948808'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-12-09 06:28:19.962541'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-12-09 06:28:19.970517'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-12-09 06:28:20.028352'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-12-09 06:28:20.078353'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-12-09 06:28:20.098361'),
(9, 'auth', '0004_alter_user_username_opts', '2022-12-09 06:28:20.107351'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-12-09 06:28:20.162353'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-12-09 06:28:20.166354'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-12-09 06:28:20.180352'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-12-09 06:28:20.197353'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-12-09 06:28:20.214354'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-12-09 06:28:20.231354'),
(16, 'auth', '0011_update_proxy_permissions', '2022-12-09 06:28:20.239354'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-12-09 06:28:20.259392'),
(18, 'sessions', '0001_initial', '2022-12-09 06:28:20.289353'),
(19, 'Crm_app', '0001_initial', '2022-12-09 06:43:20.869296'),
(20, 'Crm_app', '0002_leads_status_delete_city_district_state_and_more', '2022-12-09 08:52:22.107139'),
(21, 'Crm_app', '0003_leadsource', '2022-12-09 09:07:04.343543'),
(22, 'Crm_app', '0004_leads_lead_source', '2022-12-09 09:09:24.006044'),
(23, 'Crm_app', '0005_leads_contact_person_email', '2022-12-09 12:13:15.552182'),
(24, 'Crm_app', '0006_city', '2022-12-10 06:10:37.368751'),
(25, 'Crm_app', '0007_leads_city', '2022-12-10 06:10:37.418059'),
(26, 'Crm_app', '0008_remove_leads_city_delete_city', '2022-12-10 09:17:49.370497'),
(27, 'Crm_app', '0009_extendedusermodel', '2022-12-12 04:52:46.300504'),
(28, 'Crm_app', '0010_rename_status_leadstatus', '2022-12-13 06:02:12.745555'),
(29, 'Crm_app', '0011_status', '2022-12-13 06:03:34.460742'),
(30, 'Crm_app', '0012_leads_status', '2022-12-13 06:10:00.726699'),
(31, 'Crm_app', '0013_alter_leads_status', '2022-12-13 06:19:59.615685'),
(32, 'Crm_app', '0011_status_leads_status', '2022-12-13 08:12:57.027377'),
(33, 'Crm_app', '0012_alter_leads_status', '2022-12-13 08:37:11.602263'),
(34, 'Crm_app', '0014_rename_status_leads_statuss', '2022-12-13 08:41:00.069255'),
(35, 'Crm_app', '0015_alter_leads_statuss', '2022-12-13 08:46:02.381811'),
(36, 'Crm_app', '0016_leads_slug', '2022-12-13 11:46:34.642082'),
(37, 'Crm_app', '0017_leads_key', '2022-12-14 05:19:32.963630'),
(38, 'Crm_app', '0018_leads_staff_name', '2022-12-14 05:51:44.647560'),
(39, 'Crm_app', '0019_extendedusermodel_is_teamleader', '2022-12-14 06:07:20.724798'),
(40, 'Crm_app', '0020_alter_leads_staff_name', '2022-12-15 05:59:26.484941'),
(41, 'Crm_app', '0021_alter_leads_staff_name', '2022-12-15 05:59:26.601125'),
(42, 'Crm_app', '0022_rename_leadstatus_leadtype_and_more', '2022-12-15 07:15:50.062156'),
(43, 'Crm_app', '0023_rename_status_leadstatus_and_more', '2022-12-15 07:24:05.524187'),
(44, 'Crm_app', '0024_alter_leads_staff_name', '2022-12-15 09:53:18.394715'),
(45, 'Crm_app', '0025_alter_leads_staff_name', '2022-12-15 09:57:27.325798'),
(46, 'Crm_app', '0026_alter_leads_staff_name', '2022-12-15 10:09:35.089758'),
(47, 'Crm_app', '0027_alter_leads_staff_name', '2022-12-15 10:35:15.214918'),
(48, 'Crm_app', '0028_client', '2022-12-16 04:45:11.572641'),
(49, 'Crm_app', '0029_client_slug', '2022-12-16 06:04:44.361542'),
(50, 'Crm_app', '0030_project', '2022-12-16 06:34:27.142840'),
(51, 'Crm_app', '0031_alter_leads_id', '2022-12-17 05:09:44.177135'),
(52, 'Crm_app', '0032_alter_leads_id', '2022-12-17 05:16:42.813957'),
(53, 'Crm_app', '0031_project_client_id', '2022-12-17 06:14:52.240310'),
(54, 'Crm_app', '0032_remove_project_client_id', '2022-12-17 06:32:26.501072'),
(55, 'Crm_app', '0033_rename_client_key_project_client', '2022-12-17 07:12:44.267933'),
(56, 'Crm_app', '0034_client_client_status_client_count', '2022-12-17 07:28:33.096717'),
(57, 'Crm_app', '0031_rename_client_key_project_client_and_more', '2022-12-17 11:14:36.636518'),
(58, 'Crm_app', '0032_remove_project_lead_statuss_project_client_status', '2022-12-20 04:43:47.942189'),
(59, 'Crm_app', '0033_alter_project_client_status', '2022-12-20 04:54:25.154385'),
(60, 'Crm_app', '0034_alter_project_client_status', '2022-12-20 04:58:49.679838'),
(61, 'Crm_app', '0035_clientstatus_remove_client_client_status_and_more', '2022-12-20 05:02:01.615218'),
(62, 'Crm_app', '0036_client_client_statue_project_client_statue', '2022-12-20 05:05:39.698349'),
(63, 'Crm_app', '0037_rename_client_statue_project_client_status', '2022-12-20 05:11:08.331956'),
(64, 'Crm_app', '0038_alter_project_client_status', '2022-12-20 05:11:46.196723'),
(65, 'Crm_app', '0039_rename_client_statue_client_client_status', '2022-12-20 05:31:18.411746'),
(66, 'Crm_app', '0040_alter_client_client_status', '2022-12-20 06:03:24.004595'),
(67, 'Crm_app', '0041_alter_project_client_status', '2022-12-20 06:44:14.271836'),
(68, 'Crm_app', '0042_remove_project_client_status', '2022-12-22 04:09:44.460208'),
(69, 'Crm_app', '0043_alter_project_client', '2022-12-22 05:27:05.240457'),
(70, 'Crm_app', '0044_client_project_count', '2022-12-22 05:44:43.671143'),
(71, 'Crm_app', '0045_alter_project_client', '2022-12-22 06:39:03.241003'),
(72, 'Crm_app', '0046_alter_project_client', '2022-12-22 07:04:57.067964'),
(73, 'Crm_app', '0047_alter_client_project_count', '2022-12-27 04:56:06.419588'),
(74, 'Crm_app', '0048_projectstatus', '2022-12-27 09:46:35.748075'),
(75, 'Crm_app', '0049_project_project_status', '2022-12-27 09:49:51.258156'),
(76, 'Crm_app', '0050_extendedusermodel_is_client', '2022-12-27 09:53:28.551040'),
(77, 'Crm_app', '0051_invoicestatus_invoice', '2022-12-27 12:06:47.645755'),
(78, 'Crm_app', '0052_invoice_invoice_status', '2022-12-27 12:10:24.729412'),
(79, 'Crm_app', '0053_invoice_slug_alter_invoice_invoice_status_billing', '2022-12-27 12:30:22.535517'),
(80, 'Crm_app', '0054_alter_project_project_status', '2022-12-28 05:53:29.127260'),
(81, 'Crm_app', '0055_project_lead', '2022-12-29 06:41:46.032637'),
(82, 'Crm_app', '0056_extendedusermodel_is_teammember', '2022-12-29 06:58:12.921722'),
(83, 'Crm_app', '0057_projectassignment', '2022-12-29 09:12:17.643423'),
(84, 'Crm_app', '0058_remove_projectassignment_project_and_more', '2022-12-30 10:55:53.179795'),
(85, 'Crm_app', '0059_remove_projectassignment_project_and_more', '2022-12-30 11:00:48.546860'),
(86, 'Crm_app', '0060_rename_title_leads_project_title', '2022-12-31 10:44:01.694270'),
(87, 'Crm_app', '0061_rename_project_title_leads_title', '2022-12-31 10:54:42.690369'),
(88, 'Crm_app', '0062_projectassignment_document_and_more', '2023-01-04 05:57:00.773940'),
(89, 'Crm_app', '0063_leads_staff', '2023-01-05 12:24:35.960498'),
(90, 'Crm_app', '0064_alter_projectassignment_project', '2023-01-06 06:16:19.477081'),
(91, 'Crm_app', '0065_alter_projectassignment_options_and_more', '2023-01-06 09:27:00.591036'),
(92, 'Crm_app', '0066_alter_projectassignment_options', '2023-01-27 09:37:49.711322'),
(93, 'marketing', '0001_initial', '2023-01-28 05:06:24.413654'),
(94, 'marketing', '0002_alter_marketing_added_on', '2023-01-31 03:56:41.335494'),
(95, 'marketing', '0003_alter_marketing_status', '2023-01-31 05:09:20.442248'),
(96, 'marketing', '0004_alter_marketing_added_on', '2023-01-31 05:16:18.823382'),
(97, 'Crm_app', '0067_alter_projectassignment_project_assignment', '2023-02-02 09:31:52.434855'),
(98, 'Crm_app', '0068_alter_billing_added_on_alter_invoice_added_on_and_more', '2023-02-03 06:20:13.744247'),
(99, 'Crm_app', '0069_alter_projectassignment_added_on', '2023-02-03 06:51:03.846891'),
(100, 'Crm_app', '0070_alter_leads_title_alter_project_project_title_and_more', '2023-02-13 04:22:11.576951'),
(101, 'Crm_app', '0071_remove_projectassignment_project_assignment_and_more', '2023-02-13 04:53:27.504094');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0kenzwfenorkb1oceb9huk414k529s4i', '.eJxVjLsOwjAMAP8lM4pCg_NgZOcbKjs2pIASqWknxL_TSB1gvTvdW424Lnlcm8zjxOqsQB1-GWF6SumCH1juVadalnki3RO926avleV12du_QcaW-5aCoAgNYI0HcscYPYnjsJHgzcmHAPbG0YpEC55YTHKYMG6xhSGpzxfmQTfz:1p5P9p:1mfHLcGGWE79dkhznlVgy9FU7Ztxs3R_5I6lM9UZJP8', '2022-12-28 10:38:37.456672'),
('140u4baswx7vvpja78zhqwq9zpug8jhx', '.eJxVjDsOAiEUAO9CbQgf-Vnaewby4D1k1UCy7FbGuxuSLbSdmcybRdi3GvdBa1yQXZjU7PQLE-QntWnwAe3eee5tW5fEZ8IPO_itI72uR_s3qDDq_EqVAXwGWzzpQEFKl4nQFlGKN1lbl1TyVliHJpwL2gRBFIMqJEQn2OcLJcs42A:1pLHzg:ltHNwQL1-ceyo4nWkfR2iLLS7f7uuG55t1lyQLJOYAs', '2023-02-10 06:13:48.354704'),
('3mjyejdv82tjf6x89e00sr8vf0112a19', '.eJxVjDsOwjAQBe_iGlnY6w9Q0ucM1q53jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uLMurwuxHmh7QN8B3bbdJ5ass8kt4UvdOuh4nled3dv4OKvX5rKsWF4hARIgSORw8WQIQyCkD0fKaTExMJOXII7DEYZF8ACGy0pN4fAh44hg:1pAjmg:4AL6Ng51vtou7ZK-ri1dZNc6P6agAWJoJmF8uQAtADY', '2023-01-12 03:40:46.963872'),
('50k06tlp5sqwvs7jfc8xrqibavr2x95c', '.eJxVjDsOwjAQBe_iGlnY6w9Q0ucM1q53jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uLMurwuxHmh7QN8B3bbdJ5ass8kt4UvdOuh4nled3dv4OKvX5rKsWF4hARIgSORw8WQIQyCkD0fKaTExMJOXII7DEYZF8ACGy0pN4fAh44hg:1p5hky:--vNvN_FagXSJZw4VPEFGbjwrmv98Xm3G3EHOOLPUjo', '2022-12-29 06:30:12.301677'),
('5yr4i5fz5tjs06klwutimk6bdqf8u0zt', '.eJxdzEsOwiAUheG9MDYEqLwcOu8amgv3ItUKSWlHxr0rSSc6Pd_J_2J7o7XAk9iFtb3Mi1QDO7EJ9i1P3aYZvyT_xgDxQaUL3qHcKo-1bOsceL_wQxsfK9JyPb4_gQwt965UEcBFMMnR4MlLaSMRmiRScjoOxgYVnBHGovbnhCaAF0mj8gHRCvb-AEAuP-c:1pRUUE:5ykBi9rW0C-2A1j5XD3kDf_PvWDKP8NpLu9rVrS5ZiI', '2023-02-27 08:46:58.281785'),
('660yxa4zkqpbad56bwd9af2x0cldl2pi', '.eJxVjDsOwjAQBe_iGlnY6w9Q0ucM1q53jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uLMurwuxHmh7QN8B3bbdJ5ass8kt4UvdOuh4nled3dv4OKvX5rKsWF4hARIgSORw8WQIQyCkD0fKaTExMJOXII7DEYZF8ACGy0pN4fAh44hg:1pA2Nm:q_yKP2X76OzORLfJ15Hq046BRFAg7zuJLTMpd_aUxb8', '2023-01-10 05:20:10.104966'),
('6ignpery6ryel1tarebogqjk5aa6vfd8', '.eJxVjDsOwjAQBe_iGlnY6w9Q0ucM1q53jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uLMurwuxHmh7QN8B3bbdJ5ass8kt4UvdOuh4nled3dv4OKvX5rKsWF4hARIgSORw8WQIQyCkD0fKaTExMJOXII7DEYZF8ACGy0pN4fAh44hg:1pLFaZ:ogcsFwVq0ZDHaMhbyWWvUEqgfEfZMepZI7EdqaJSs5g', '2023-02-10 03:39:43.089775'),
('baludb0x1nab92ezv0j5q0llz739f3us', '.eJxVjDsOAiEUAO9CbQgf-Vnaewby4D1k1UCy7FbGuxuSLbSdmcybRdi3GvdBa1yQXZjU7PQLE-QntWnwAe3eee5tW5fEZ8IPO_itI72uR_s3qDDq_EqVAXwGWzzpQEFKl4nQFlGKN1lbl1TyVliHJpwL2gRBFIMqJEQn2OcLJcs42A:1pDeRT:xGMfwVJ-rMjpSdOmG0HHsienps2pAemUuz0F6Dn9MEI', '2023-01-20 04:34:55.861158'),
('bljmcdn8a792uyz1ny3mw8m6yxrqhufw', '.eJxVjDsOwjAQBe_iGlnY6w9Q0ucM1q53jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uLMurwuxHmh7QN8B3bbdJ5ass8kt4UvdOuh4nled3dv4OKvX5rKsWF4hARIgSORw8WQIQyCkD0fKaTExMJOXII7DEYZF8ACGy0pN4fAh44hg:1pA3a9:2F2BUiwRZwnTswX74sJSujFHJX7nNAQ1ECHTt30q0ZI', '2023-01-10 06:37:01.874378'),
('bqwof1tmc1bqb63wg74xor24h93sn51e', '.eJxVjDsOwjAQBe_iGlnY6w9Q0ucM1q53jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uLMurwuxHmh7QN8B3bbdJ5ass8kt4UvdOuh4nled3dv4OKvX5rKsWF4hARIgSORw8WQIQyCkD0fKaTExMJOXII7DEYZF8ACGy0pN4fAh44hg:1pCDpx:fcIeW4v8Pdgwqg7yt2XjT6ugAKW1Rs7hxrmD7yx58cE', '2023-01-16 05:58:17.555139'),
('ehdt64gwo8wxds3sjlsoi2vrpnk1qksg', '.eJxVjDsOwjAQBe_iGlnY6w9Q0ucM1q53jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uLMurwuxHmh7QN8B3bbdJ5ass8kt4UvdOuh4nled3dv4OKvX5rKsWF4hARIgSORw8WQIQyCkD0fKaTExMJOXII7DEYZF8ACGy0pN4fAh44hg:1pLhq9:h4o6-ua_XAsMVnmUT0nHr5gg5_Ns6rG2MyyMjRLqVAA', '2023-02-11 09:49:41.785729'),
('gsd5w3pws7zlnsagdc9fa6bcl98eycu6', '.eJxVjDsOAiEUAO9CbQgf-Vnaewby4D1k1UCy7FbGuxuSLbSdmcybRdi3GvdBa1yQXZjU7PQLE-QntWnwAe3eee5tW5fEZ8IPO_itI72uR_s3qDDq_EqVAXwGWzzpQEFKl4nQFlGKN1lbl1TyVliHJpwL2gRBFIMqJEQn2OcLJcs42A:1pFBVQ:9jgqXdt-OSkOG0-FpN7BPeRhpzvznJaaDad4fr3DgJo', '2023-01-24 10:05:20.538548'),
('hn9xz9dmhlpjfveqwutm318gg5k8jvtp', '.eJxVjDsOwjAQBe_iGlnY6w9Q0ucM1q53jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uLMurwuxHmh7QN8B3bbdJ5ass8kt4UvdOuh4nled3dv4OKvX5rKsWF4hARIgSORw8WQIQyCkD0fKaTExMJOXII7DEYZF8ACGy0pN4fAh44hg:1p61Xx:MxzXpHGqOx-Iu_m3kTL3O-Edc8sLr0q6VToi9jcTpUY', '2022-12-30 03:38:05.102372'),
('ko726j4xfzqqz4vff4ojlq0hzqg8spji', '.eJxVjDsOwjAQBe_iGlkkG9tASc8ZorfZNQ4QR8qnQtydWEqTdmbe-5p11iljUHMzkKHP5mRarEtqi2h72Xh1ZIzurbkIeSE_R9uNeZl6tiWxu53tYxT93Pf2cJAwp23NMTY-NgAokJdwdlQTqXIHJQpOrnxptAoMCeK9OPgK4iIRUx1qNr8_hAU-3Q:1pRPfb:q2k_YFG1H5-7QfwpAevwq-Chcuv3ulJEkJ8CMv9K37Q', '2023-02-27 03:38:23.822627'),
('le1wzoits66pxzsmt379qpraeo88b8co', 'e30:1p4bRp:VyNxTpvoir95lz4CbLqVjXR7UIglRMLwrodUMG4OiTg', '2022-12-26 05:33:53.418214'),
('lx8gfv23p90yn39avbi7y60ppceyh70n', '.eJxVjDsOAiEUAO9CbQgf-Vnaewby4D1k1UCy7FbGuxuSLbSdmcybRdi3GvdBa1yQXZjU7PQLE-QntWnwAe3eee5tW5fEZ8IPO_itI72uR_s3qDDq_EqVAXwGWzzpQEFKl4nQFlGKN1lbl1TyVliHJpwL2gRBFIMqJEQn2OcLJcs42A:1pCDsk:Mp_MJZNDLv1KeqtS-Vf-xiIbP4VkDiENijFEJIvF41U', '2023-01-16 06:01:10.073906'),
('oup4blybh67dlcqfiyyka1vxfotvzdlm', '.eJxVjDsOwjAQBe_iGlnY6w9Q0ucM1q53jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uLMurwuxHmh7QN8B3bbdJ5ass8kt4UvdOuh4nled3dv4OKvX5rKsWF4hARIgSORw8WQIQyCkD0fKaTExMJOXII7DEYZF8ACGy0pN4fAh44hg:1p5fG2:H1EPAxlhrJiipn_uiO9WGR5tgTTo88avJJFN7-kLxfA', '2022-12-29 03:50:06.338096'),
('pa5mt57xt43wfovmfv13u3iu8k7vt56o', '.eJxVjDsOAiEUAO9CbQgf-Vnaewby4D1k1UCy7FbGuxuSLbSdmcybRdi3GvdBa1yQXZjU7PQLE-QntWnwAe3eee5tW5fEZ8IPO_itI72uR_s3qDDq_EqVAXwGWzzpQEFKl4nQFlGKN1lbl1TyVliHJpwL2gRBFIMqJEQn2OcLJcs42A:1pNpzV:bwUl6P8uThiF9I4E2vC-jS5ATIoO2Tj5ozzUfT-Bd2g', '2023-02-17 06:56:09.198531'),
('qx8ezo19phwv2uupij846km9j3odh6m1', '.eJxVjDsOwjAQBe_iGlnY6w9Q0ucM1q53jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uLMurwuxHmh7QN8B3bbdJ5ass8kt4UvdOuh4nled3dv4OKvX5rKsWF4hARIgSORw8WQIQyCkD0fKaTExMJOXII7DEYZF8ACGy0pN4fAh44hg:1p5Pk6:3h06cSD9LOlHtJl9HArAwiEqUjnF1KI72lFkWphKdgM', '2022-12-28 11:16:06.486993'),
('uzk6bfw3jfauv1nzvfger8ybkbwf3s97', '.eJxVjDsOAiEUAO9CbQgf-Vnaewby4D1k1UCy7FbGuxuSLbSdmcybRdi3GvdBa1yQXZjU7PQLE-QntWnwAe3eee5tW5fEZ8IPO_itI72uR_s3qDDq_EqVAXwGWzzpQEFKl4nQFlGKN1lbl1TyVliHJpwL2gRBFIMqJEQn2OcLJcs42A:1pE6eC:CwzAU_SEj17tOqdQwmMmMtpStLcaJz0cIjHFRidUHuo', '2023-01-21 10:41:56.898154'),
('yjhy27vtj8n1f59r64kodjkbux9awihl', '.eJxVjDsOwjAQBe_iGlnY6w9Q0ucM1q53jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uLMurwuxHmh7QN8B3bbdJ5ass8kt4UvdOuh4nled3dv4OKvX5rKsWF4hARIgSORw8WQIQyCkD0fKaTExMJOXII7DEYZF8ACGy0pN4fAh44hg:1p653j:n2G6boskxUuUoVL2xgOTNmwD-wpdv9AzM_AKi_ENRzI', '2022-12-30 07:23:07.965512');

-- --------------------------------------------------------

--
-- Table structure for table `marketing_category`
--

CREATE TABLE `marketing_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marketing_category`
--

INSERT INTO `marketing_category` (`id`, `name`) VALUES
(1, 'Web Design&Development'),
(2, 'Social Media'),
(3, 'SEO');

-- --------------------------------------------------------

--
-- Table structure for table `marketing_marketing`
--

CREATE TABLE `marketing_marketing` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phoneno1` varchar(12) NOT NULL,
  `phoneno2` varchar(12) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `business_name` varchar(50) NOT NULL,
  `added_on` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `business_category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marketing_marketing`
--

INSERT INTO `marketing_marketing` (`id`, `name`, `phoneno1`, `phoneno2`, `email`, `business_name`, `added_on`, `status`, `business_category_id`) VALUES
(4, 'Mia Herbal  Beauty Saloon & Spa', '9196458 8815', NULL, 'sheejasr52@gmail.com', 'Beauty Parlour', '2023-01-28', 'Fresh', 2),
(5, 'Views Beauty Clinic', '919387466844', NULL, 'viewskollam@gmail.com', 'Beauty Parlour', '2023-01-28', 'Fresh', 2),
(7, 'Cinderella Beauty Parlour', '9194962 7535', NULL, NULL, 'Beauty Parlour', '2023-01-31', 'Fresh', 2),
(8, 'Square One Beauty Parlour', '9446051094', NULL, NULL, 'Beauty Parlour', '2023-01-31', 'Fresh', 2),
(9, 'The Glatt beauty parlour', '9895970069', NULL, NULL, 'Beauty Parlour', '2023-01-31', 'Fresh', 2),
(10, 'Mark N Cleo Cafe Salon & Makeovers', '8089568605', NULL, NULL, 'Beauty Parlour', '2023-01-31', 'Fresh', 1),
(11, 'Queens Beauty Parlour', '9447711605', NULL, NULL, 'Beauty Parlour', '2023-01-31', 'Fresh', 2),
(12, 'April 11 Beauty Concepts', '8129602602', NULL, NULL, 'Beauty Parlour', '2023-01-31', 'Fresh', 2),
(13, 'Pink Bridal Makeover Studio', '87141 44141', NULL, NULL, 'Beauty Parlour', '2023-01-31', 'Fresh', 2),
(15, 'Purple Lounge Spa & Beauty Clinic', '80781 0144', NULL, 'purpleloungebeautyclinic@gmail.com', 'Beauty Parlour', '2023-01-31', 'Fresh', 2),
(16, 'Club9 Studio', '9895570080', NULL, NULL, 'Beauty Parlour', '2023-01-31', 'Fresh', 2),
(17, 'Touch and Glow', '9846248245', NULL, NULL, 'Beauty Parlour', '2023-01-31', 'Fresh', 2),
(18, 'Mocs Men\'s Salon', '9961340007', NULL, NULL, 'Beauty Parlour', '2023-02-02', 'Fresh', 2),
(19, 'Soniya Beauty Parlour', '8281820407', NULL, NULL, 'Beauty Parlour', '2023-02-02', 'Fresh', 2),
(20, 'Saar Dreams', '8943441957', NULL, NULL, 'Beauty Parlour', '2023-02-02', 'Fresh', 2),
(21, 'Aloe Beauty Parlour', '90720 24060', NULL, NULL, 'Beauty Parlour', '2023-02-02', 'Fresh', 2),
(22, 'Aswathy Beauty parlour', '93870 94017', NULL, 'Vinithakuttu@gmail.com', 'Beauty Parlour', '2023-02-02', 'Fresh', 2),
(23, 'Belaire Health Club', '98954 80954', NULL, 'belairhealthclub@gmail.com', 'Beauty Parlour', '2023-02-02', 'Fresh', 2),
(24, 'Mummy & Me Beauty World', '9567406606', NULL, 'mummyandmebeautyworld@gmail.com', 'Beauty Parlour', '2023-02-02', 'Fresh', 2),
(25, 'Beaumonde', '9947492516', NULL, 'info@binzugopalan.com', 'Beauty Parlour', '2023-02-02', 'Fresh', 2),
(26, 'Star & Style .ladies & Gents Beauty Parlour', '96459 00931', NULL, 'krishna1313kovalam@gmail.com', 'Beauty Parlour', '2023-02-02', 'Fresh', 2),
(27, 'Abees beauty parlor', '9995119811', NULL, NULL, 'Beauty Parlour', '2023-02-02', 'Fresh', 2),
(28, 'Barberia Mens Beauty Parlour', '7947130713', '90488 28384', NULL, 'Beauty Parlour', '2023-02-02', 'Fresh', 2),
(29, 'Archana\'s Beauty Parlour', '90489 18994', NULL, NULL, 'Beauty Parlour', '2023-02-02', 'Fresh', 2),
(30, 'Sobha\'s Beauty Parlour', '94961 96353', NULL, NULL, 'Beauty Parlour', '2023-02-03', 'Fresh', 2),
(31, 'Orange beauty parlour', '9846188102', NULL, NULL, 'Beauty Parlour', '2023-02-03', 'Fresh', 2),
(32, 'Van Kris Makeup Artistry', '9656035695', '98950 86606', NULL, 'Beauty Parlour', '2023-02-03', 'Fresh', 2),
(33, 'Mist Beauty Parlour', '97458 74133', NULL, 'Jasmineshenoy2772@gmail.com', 'Beauty Parlour', '2023-02-06', 'Fresh', 2),
(34, 'Chinkaram Beauty Parlour', '96561 03430', NULL, NULL, 'Beauty Parlour', '2023-02-07', 'Fresh', 2),
(35, 'DMH Unisex Beauty Salon and Makeup Studio', '62820 36082', NULL, NULL, 'Beauty Parlour', '2023-02-07', 'Fresh', 2),
(36, 'blossom\'s beauty parlour , venganoor', '095673 6373', NULL, NULL, 'Beauty Parlour', '2023-02-07', 'Fresh', 2),
(37, 'Ammoos  Beauty Parlour', '99477 73909', NULL, NULL, 'Beauty Parlour', '2023-02-07', 'Fresh', 2),
(38, 'Nayan Beauty Parlour', '94467 94931', NULL, 'nayanbeautyparlourvrk@gmail.com', 'Beauty Parlour', '2023-02-08', 'Fresh', 2),
(39, 'Chamayam Herbal Beauty Parlor', '77367 73636', NULL, 'amaladbabu@gmail.com', 'Beauty Parlour', '2023-02-08', 'Fresh', 2),
(40, 'Taatoo temple', '87144 66423', NULL, 'tattootempletvm@gmail.com', 'Beauty Parlour', '2023-02-09', 'Fresh', 2),
(41, 'Lavanyam Beauty Parlour', '9895950746', NULL, NULL, 'Beauty Parlour', '2023-02-09', 'Fresh', 2),
(42, 'Mankulam Beauty Parlour', '94469 04409', '0472 287 533', 'mankulamladieschoice04@gmail.com', 'Beauty Parlour', '2023-02-09', 'Fresh', 2),
(43, 'Reji\'s Beauty Salon', '9895662656', NULL, NULL, 'Beauty Parlour', '2023-02-09', 'Fresh', 2),
(44, 'GLAM make-up Studio', '99465 40107', NULL, 'glamstudiomakeup6@gmail.com', 'Beauty Parlour', '2023-02-09', 'Fresh', 2),
(46, 'Honey beauty parlour', '97465 56959', NULL, NULL, 'Beauty Parlour', '2023-02-09', 'Fresh', 2),
(48, 'Enrich Gents Beauty Care', '89433 9491', NULL, NULL, 'Beauty Parlour', '2023-02-09', 'Fresh', 2),
(49, 'Glamour Beauty parlour Vazhuthacaud', '7907842013', NULL, NULL, 'Beauty Parlour', '2023-02-09', 'Fresh', 2),
(50, 'Malti\'s Ladies Beauty Parlour & Boutique', '8714073464', NULL, NULL, 'Beauty Parlour', '2023-02-09', 'Fresh', 2),
(51, 'Smile Beauty Parlour', '9895332874', '9995535352', 'smilebeautyparlourvb@gmail.com', 'Beauty Parlour', '2023-02-09', 'Fresh', 2),
(52, 'Mocs Family Salon', '7907774553', '7947413687', 'mocspothencode@gmail.com', 'Beauty Parlour', '2023-02-10', 'Fresh', 2),
(53, 'Dishyy Beauty World', '9995805564', NULL, 'ranjitaknair@gmail.com', 'Beauty Parlour', '2023-02-10', 'Fresh', 2),
(54, 'Dayana Beauty Parlour', '85905 28988', '94475 52062', NULL, 'Beauty Parlour', '2023-02-10', 'Fresh', 2),
(55, 'Thejas Beauty Parlour', '9387330340', '0471 3914100', NULL, 'Beauty Parlour', '2023-02-10', 'Fresh', 2),
(56, 'Meenus Beauty Parlour', '90486 00999', NULL, NULL, 'Beauty Parlour', '2023-02-10', 'Fresh', 2),
(57, 'Tulips Beauty Parlour', '91880 08100', '0471 401 834', 'tulipsbeautystudio@gmail.com', 'Beauty Parlour', '2023-02-10', 'Fresh', 2),
(58, 'Orchids Beautylounge', '80758 40729', NULL, NULL, 'Beauty Parlour', '2023-02-10', 'Fresh', 2),
(59, 'Lavender Beauty clinic & Hairstyling studio', '9633968329', NULL, NULL, 'Beauty Parlour', '2023-02-10', 'Fresh', 2),
(60, 'Thejus beautyclinic karamana', '94477 21340', NULL, NULL, 'Beauty Parlour', '2023-02-10', 'Fresh', 2),
(61, 'spa welness Beauty Parlour for ladies-', '9447711605', NULL, NULL, 'Beauty Parlour', '2023-02-10', 'Fresh', 2),
(62, 'Beauty Plaza Beauty Parlour', '7034814468', NULL, NULL, 'Beauty Parlour', '2023-02-10', 'Fresh', 2),
(63, 'Sparkles Beauty Salon & Spa', '94464 97344', NULL, 'sparklespjp@gmail.com', 'Beauty Parlour', '2023-02-10', 'Fresh', 2),
(64, 'Nakshatra Beauty Parlour', '90741 06238', NULL, 'maneesh1373@gmail.com', 'Beauty Parlour', '2023-02-10', 'Fresh', 2),
(65, 'Maria Herbal Beauty Clinic', '9633947505', NULL, NULL, 'Beauty Parlour', '2023-02-10', 'Fresh', 2);

--
-- Indexes for dumped tables
--

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
-- Indexes for table `crm_app_billing`
--
ALTER TABLE `crm_app_billing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Crm_app_billing_added_by_id_a0c1a603_fk_auth_user_id` (`added_by_id`),
  ADD KEY `Crm_app_billing_client_id_fc69446a_fk_Crm_app_client_id` (`client_id`),
  ADD KEY `Crm_app_billing_invoice_id_b0a5e734_fk_Crm_app_invoice_id` (`invoice_id`),
  ADD KEY `Crm_app_billing_project_id_d992ebd8_fk_Crm_app_project_id` (`project_id`),
  ADD KEY `Crm_app_billing_slug_7b598b54` (`slug`);

--
-- Indexes for table `crm_app_client`
--
ALTER TABLE `crm_app_client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Crm_app_client_slug_f8832314` (`slug`),
  ADD KEY `Crm_app_client_client_status_id_5c04cc4f_fk_Crm_app_c` (`client_status_id`);

--
-- Indexes for table `crm_app_clientstatus`
--
ALTER TABLE `crm_app_clientstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crm_app_district`
--
ALTER TABLE `crm_app_district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Crm_app_district_state_id_113c56e1_fk_Crm_app_state_id` (`state_id`);

--
-- Indexes for table `crm_app_extendedusermodel`
--
ALTER TABLE `crm_app_extendedusermodel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `crm_app_invoice`
--
ALTER TABLE `crm_app_invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Crm_app_invoice_added_by_id_741ec294_fk_auth_user_id` (`added_by_id`),
  ADD KEY `Crm_app_invoice_client_id_14025514_fk_Crm_app_client_id` (`client_id`),
  ADD KEY `Crm_app_invoice_project_id_249e8caf_fk_Crm_app_project_id` (`project_id`),
  ADD KEY `Crm_app_invoice_invoice_status_id_412e90d6_fk_Crm_app_i` (`invoice_status_id`),
  ADD KEY `Crm_app_invoice_slug_911d9992` (`slug`);

--
-- Indexes for table `crm_app_invoicestatus`
--
ALTER TABLE `crm_app_invoicestatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crm_app_leadcategory`
--
ALTER TABLE `crm_app_leadcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crm_app_leads`
--
ALTER TABLE `crm_app_leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Crm_app_leads_district_id_c4f9dcd7_fk_Crm_app_district_id` (`district_id`),
  ADD KEY `Crm_app_leads_state_id_d392675a_fk_Crm_app_state_id` (`state_id`),
  ADD KEY `Crm_app_leads_category_id_f289ea6a_fk_Crm_app_leadcategory_id` (`category_id`),
  ADD KEY `Crm_app_leads_lead_source_id_566046d8_fk_Crm_app_leadsource_id` (`lead_source_id`),
  ADD KEY `Crm_app_leads_slug_ae962805` (`slug`),
  ADD KEY `Crm_app_leads_lead_type_id_2355f623_fk_Crm_app_leadtype_id` (`lead_type_id`),
  ADD KEY `Crm_app_leads_lead_statuss_id_3015a907_fk_Crm_app_leadstatus_id` (`lead_statuss_id`),
  ADD KEY `Crm_app_leads_staff_name_id_b10048df` (`staff_name_id`),
  ADD KEY `Crm_app_leads_staff_id_b5a015e2_fk_Crm_app_extendedusermodel_id` (`staff_id`);

--
-- Indexes for table `crm_app_leadsource`
--
ALTER TABLE `crm_app_leadsource`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crm_app_leadstatus`
--
ALTER TABLE `crm_app_leadstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crm_app_leadtype`
--
ALTER TABLE `crm_app_leadtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crm_app_project`
--
ALTER TABLE `crm_app_project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Crm_app_project_category_id_7729c1ee_fk_Crm_app_leadcategory_id` (`category_id`),
  ADD KEY `Crm_app_project_slug_b288f2a7` (`slug`),
  ADD KEY `Crm_app_project_client_id_26faddb7_fk_Crm_app_client_id` (`client_id`),
  ADD KEY `Crm_app_project_project_status_id_8c48d8e1_fk_Crm_app_p` (`project_status_id`),
  ADD KEY `Crm_app_project_lead_id_0b01f759_fk_Crm_app_leads_id` (`lead_id`);

--
-- Indexes for table `crm_app_projectassignment`
--
ALTER TABLE `crm_app_projectassignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Crm_app_projectassig_added_by_id_a02f0611_fk_Crm_app_e` (`added_by_id`),
  ADD KEY `Crm_app_projectassig_client_id_e959c781_fk_Crm_app_c` (`client_id`),
  ADD KEY `Crm_app_projectassig_project_id_4cca4364_fk_Crm_app_p` (`project_id`);

--
-- Indexes for table `crm_app_projectstatus`
--
ALTER TABLE `crm_app_projectstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crm_app_state`
--
ALTER TABLE `crm_app_state`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `marketing_category`
--
ALTER TABLE `marketing_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_marketing`
--
ALTER TABLE `marketing_marketing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_marketing_business_category_id_ff3cd8c5_fk_marketing` (`business_category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_app_billing`
--
ALTER TABLE `crm_app_billing`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_app_client`
--
ALTER TABLE `crm_app_client`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `crm_app_clientstatus`
--
ALTER TABLE `crm_app_clientstatus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `crm_app_district`
--
ALTER TABLE `crm_app_district`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `crm_app_extendedusermodel`
--
ALTER TABLE `crm_app_extendedusermodel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `crm_app_invoice`
--
ALTER TABLE `crm_app_invoice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crm_app_invoicestatus`
--
ALTER TABLE `crm_app_invoicestatus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `crm_app_leadcategory`
--
ALTER TABLE `crm_app_leadcategory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `crm_app_leads`
--
ALTER TABLE `crm_app_leads`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `crm_app_leadsource`
--
ALTER TABLE `crm_app_leadsource`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `crm_app_leadstatus`
--
ALTER TABLE `crm_app_leadstatus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `crm_app_leadtype`
--
ALTER TABLE `crm_app_leadtype`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `crm_app_project`
--
ALTER TABLE `crm_app_project`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `crm_app_projectassignment`
--
ALTER TABLE `crm_app_projectassignment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT for table `crm_app_projectstatus`
--
ALTER TABLE `crm_app_projectstatus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `crm_app_state`
--
ALTER TABLE `crm_app_state`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=378;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `marketing_category`
--
ALTER TABLE `marketing_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `marketing_marketing`
--
ALTER TABLE `marketing_marketing`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- Constraints for dumped tables
--

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
-- Constraints for table `crm_app_billing`
--
ALTER TABLE `crm_app_billing`
  ADD CONSTRAINT `Crm_app_billing_added_by_id_a0c1a603_fk_auth_user_id` FOREIGN KEY (`added_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `Crm_app_billing_client_id_fc69446a_fk_Crm_app_client_id` FOREIGN KEY (`client_id`) REFERENCES `crm_app_client` (`id`),
  ADD CONSTRAINT `Crm_app_billing_invoice_id_b0a5e734_fk_Crm_app_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `crm_app_invoice` (`id`),
  ADD CONSTRAINT `Crm_app_billing_project_id_d992ebd8_fk_Crm_app_project_id` FOREIGN KEY (`project_id`) REFERENCES `crm_app_project` (`id`);

--
-- Constraints for table `crm_app_client`
--
ALTER TABLE `crm_app_client`
  ADD CONSTRAINT `Crm_app_client_client_status_id_5c04cc4f_fk_Crm_app_c` FOREIGN KEY (`client_status_id`) REFERENCES `crm_app_clientstatus` (`id`);

--
-- Constraints for table `crm_app_district`
--
ALTER TABLE `crm_app_district`
  ADD CONSTRAINT `Crm_app_district_state_id_113c56e1_fk_Crm_app_state_id` FOREIGN KEY (`state_id`) REFERENCES `crm_app_state` (`id`);

--
-- Constraints for table `crm_app_extendedusermodel`
--
ALTER TABLE `crm_app_extendedusermodel`
  ADD CONSTRAINT `Crm_app_extendedusermodel_user_id_d163278d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `crm_app_invoice`
--
ALTER TABLE `crm_app_invoice`
  ADD CONSTRAINT `Crm_app_invoice_added_by_id_741ec294_fk_auth_user_id` FOREIGN KEY (`added_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `Crm_app_invoice_client_id_14025514_fk_Crm_app_client_id` FOREIGN KEY (`client_id`) REFERENCES `crm_app_client` (`id`),
  ADD CONSTRAINT `Crm_app_invoice_invoice_status_id_412e90d6_fk_Crm_app_i` FOREIGN KEY (`invoice_status_id`) REFERENCES `crm_app_invoicestatus` (`id`),
  ADD CONSTRAINT `Crm_app_invoice_project_id_249e8caf_fk_Crm_app_project_id` FOREIGN KEY (`project_id`) REFERENCES `crm_app_project` (`id`);

--
-- Constraints for table `crm_app_leads`
--
ALTER TABLE `crm_app_leads`
  ADD CONSTRAINT `Crm_app_leads_category_id_f289ea6a_fk_Crm_app_leadcategory_id` FOREIGN KEY (`category_id`) REFERENCES `crm_app_leadcategory` (`id`),
  ADD CONSTRAINT `Crm_app_leads_district_id_c4f9dcd7_fk_Crm_app_district_id` FOREIGN KEY (`district_id`) REFERENCES `crm_app_district` (`id`),
  ADD CONSTRAINT `Crm_app_leads_lead_source_id_566046d8_fk_Crm_app_leadsource_id` FOREIGN KEY (`lead_source_id`) REFERENCES `crm_app_leadsource` (`id`),
  ADD CONSTRAINT `Crm_app_leads_lead_statuss_id_3015a907_fk_Crm_app_leadstatus_id` FOREIGN KEY (`lead_statuss_id`) REFERENCES `crm_app_leadstatus` (`id`),
  ADD CONSTRAINT `Crm_app_leads_lead_type_id_2355f623_fk_Crm_app_leadtype_id` FOREIGN KEY (`lead_type_id`) REFERENCES `crm_app_leadtype` (`id`),
  ADD CONSTRAINT `Crm_app_leads_staff_id_b5a015e2_fk_Crm_app_extendedusermodel_id` FOREIGN KEY (`staff_id`) REFERENCES `crm_app_extendedusermodel` (`id`),
  ADD CONSTRAINT `Crm_app_leads_state_id_d392675a_fk_Crm_app_state_id` FOREIGN KEY (`state_id`) REFERENCES `crm_app_state` (`id`);

--
-- Constraints for table `crm_app_project`
--
ALTER TABLE `crm_app_project`
  ADD CONSTRAINT `Crm_app_project_category_id_7729c1ee_fk_Crm_app_leadcategory_id` FOREIGN KEY (`category_id`) REFERENCES `crm_app_leadcategory` (`id`),
  ADD CONSTRAINT `Crm_app_project_client_id_26faddb7_fk_Crm_app_client_id` FOREIGN KEY (`client_id`) REFERENCES `crm_app_client` (`id`),
  ADD CONSTRAINT `Crm_app_project_lead_id_0b01f759_fk_Crm_app_leads_id` FOREIGN KEY (`lead_id`) REFERENCES `crm_app_leads` (`id`),
  ADD CONSTRAINT `Crm_app_project_project_status_id_8c48d8e1_fk_Crm_app_p` FOREIGN KEY (`project_status_id`) REFERENCES `crm_app_projectstatus` (`id`);

--
-- Constraints for table `crm_app_projectassignment`
--
ALTER TABLE `crm_app_projectassignment`
  ADD CONSTRAINT `Crm_app_projectassig_added_by_id_a02f0611_fk_Crm_app_e` FOREIGN KEY (`added_by_id`) REFERENCES `crm_app_extendedusermodel` (`id`),
  ADD CONSTRAINT `Crm_app_projectassig_client_id_e959c781_fk_Crm_app_c` FOREIGN KEY (`client_id`) REFERENCES `crm_app_client` (`id`),
  ADD CONSTRAINT `Crm_app_projectassig_project_id_4cca4364_fk_Crm_app_p` FOREIGN KEY (`project_id`) REFERENCES `crm_app_project` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `marketing_marketing`
--
ALTER TABLE `marketing_marketing`
  ADD CONSTRAINT `marketing_marketing_business_category_id_ff3cd8c5_fk_marketing` FOREIGN KEY (`business_category_id`) REFERENCES `marketing_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
