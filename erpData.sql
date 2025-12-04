-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 28, 2025 at 05:08 PM
-- Server version: 8.0.43-0ubuntu0.24.04.2
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `erpData`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` bigint NOT NULL,
  `emp_id` bigint NOT NULL,
  `date` date NOT NULL,
  `check_in` time DEFAULT NULL,
  `check_out` time DEFAULT NULL,
  `status` enum('PRESENT','ABSENT','LEAVE','HOLIDAY','HALF_DAY') DEFAULT 'PRESENT',
  `working_hours` decimal(5,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `attendance`
--
DELIMITER $$
CREATE TRIGGER `trg_attendance_status` 
BEFORE INSERT ON `attendance` 
FOR EACH ROW 
BEGIN
    IF NEW.check_in IS NULL THEN
        SET NEW.status = 'ABSENT';
    END IF;
END$$
DELIMITER ;


-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
(25, 'Can add ip address', 7, 'add_ipaddress'),
(26, 'Can change ip address', 7, 'change_ipaddress'),
(27, 'Can delete ip address', 7, 'delete_ipaddress'),
(28, 'Can view ip address', 7, 'view_ipaddress'),
(29, 'Can add blacklisted token', 8, 'add_blacklistedtoken'),
(30, 'Can change blacklisted token', 8, 'change_blacklistedtoken'),
(31, 'Can delete blacklisted token', 8, 'delete_blacklistedtoken'),
(32, 'Can view blacklisted token', 8, 'view_blacklistedtoken'),
(33, 'Can add outstanding token', 9, 'add_outstandingtoken'),
(34, 'Can change outstanding token', 9, 'change_outstandingtoken'),
(35, 'Can delete outstanding token', 9, 'delete_outstandingtoken'),
(36, 'Can view outstanding token', 9, 'view_outstandingtoken');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Human Resources', 'Handles recruitment, payroll, employee relations', 'Active', '2025-08-28 14:53:44', '2025-08-28 14:53:44'),
(2, 'Finance', 'Manages accounts, budgets, and payroll', 'Active', '2025-08-28 14:53:44', '2025-08-28 14:53:44'),
(3, 'IT', 'Maintains company systems and software', 'Active', '2025-08-28 14:53:44', '2025-08-28 14:53:44'),
(4, 'Sales', 'Handles sales and client relationships', 'Active', '2025-08-28 14:53:44', '2025-08-28 14:53:44'),
(9, 'SCM', 'Supply Chain Managment', 'Active', '2025-08-28 14:53:44', '2025-08-28 14:53:44');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `designation_id` int NOT NULL,
  `designation_name` varchar(100) NOT NULL,
  `department_id` int NOT NULL,
  `level` int DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`designation_id`, `designation_name`, `department_id`, `level`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'HR Manager', 1, 3, 'Leads HR team', 'Active', '2025-08-28 14:53:44', '2025-08-28 14:53:44'),
(2, 'HR Executive', 1, 1, 'Supports HR operations', 'Active', '2025-08-28 14:53:44', '2025-08-28 14:53:44'),
(3, 'Accountant', 2, 2, 'Handles accounts and finance', 'Active', '2025-08-28 14:53:44', '2025-08-28 14:53:44'),
(4, 'Finance Manager', 2, 3, 'Manages finance team', 'Active', '2025-08-28 14:53:44', '2025-08-28 14:53:44'),
(5, 'Software Engineer', 3, 2, 'Develops and maintains applications', 'Active', '2025-08-28 14:53:44', '2025-08-28 14:53:44'),
(6, 'IT Manager', 3, 3, 'Leads IT team', 'Active', '2025-08-28 14:53:44', '2025-08-28 14:53:44'),
(7, 'Sales Executive', 4, 1, 'Manages client sales', 'Active', '2025-08-28 14:53:44', '2025-08-28 14:53:44'),
(8, 'Sales Manager', 4, 3, 'Leads sales department', 'Active', '2025-08-28 14:53:44', '2025-08-28 14:53:44'),
(9, 'HR Manager', 1, 3, 'Leads HR team', 'Active', '2025-08-28 14:54:12', '2025-08-28 14:54:12'),
(10, 'HR Executive', 1, 1, 'Supports HR operations', 'Active', '2025-08-28 14:54:12', '2025-08-28 14:54:12'),
(11, 'Accountant', 2, 2, 'Handles accounts and finance', 'Active', '2025-08-28 14:54:12', '2025-08-28 14:54:12'),
(12, 'Finance Manager', 2, 3, 'Manages finance team', 'Active', '2025-08-28 14:54:12', '2025-08-28 14:54:12'),
(13, 'Software Engineer', 3, 2, 'Develops and maintains applications', 'Active', '2025-08-28 14:54:12', '2025-08-28 14:54:12'),
(14, 'IT Manager', 3, 3, 'Leads IT team', 'Active', '2025-08-28 14:54:12', '2025-08-28 14:54:12'),
(15, 'Sales Executive', 4, 1, 'Manages client sales', 'Active', '2025-08-28 14:54:12', '2025-08-28 14:54:12'),
(16, 'Sales Manager', 4, 3, 'Leads sales department', 'Active', '2025-08-28 14:54:12', '2025-08-28 14:54:12'),
(17, 'SCM Manager', 9, 3, 'SCM HR team', 'Active', '2025-08-28 14:53:44', '2025-08-28 15:01:21');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(8, 'token_blacklist', 'blacklistedtoken'),
(9, 'token_blacklist', 'outstandingtoken'),
(7, 'users', 'ipaddress');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-09-02 04:58:18.212441'),
(2, 'auth', '0001_initial', '2025-09-02 04:58:19.332404'),
(3, 'admin', '0001_initial', '2025-09-02 04:58:19.617214'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-09-02 04:58:19.643073'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-09-02 04:58:19.687054'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-09-02 04:58:19.920772'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-09-02 04:58:20.003790'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-09-02 04:58:20.040369'),
(9, 'auth', '0004_alter_user_username_opts', '2025-09-02 04:58:20.058996'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-09-02 04:58:20.147263'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-09-02 04:58:20.150930'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-09-02 04:58:20.165413'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-09-02 04:58:20.269233'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-09-02 04:58:20.354343'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-09-02 04:58:20.384457'),
(16, 'auth', '0011_update_proxy_permissions', '2025-09-02 04:58:20.404056'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-09-02 04:58:20.499009'),
(18, 'sessions', '0001_initial', '2025-09-02 04:58:20.549357'),
(19, 'token_blacklist', '0001_initial', '2025-11-24 16:48:05.497104'),
(20, 'token_blacklist', '0002_outstandingtoken_jti_hex', '2025-11-24 16:48:05.560655'),
(21, 'token_blacklist', '0003_auto_20171017_2007', '2025-11-24 16:48:05.582252'),
(22, 'token_blacklist', '0004_auto_20171017_2013', '2025-11-24 16:48:05.676748'),
(23, 'token_blacklist', '0005_remove_outstandingtoken_jti', '2025-11-24 16:48:05.740084'),
(24, 'token_blacklist', '0006_auto_20171017_2113', '2025-11-24 16:48:05.782078'),
(25, 'token_blacklist', '0007_auto_20171017_2214', '2025-11-24 16:48:06.069179'),
(26, 'token_blacklist', '0008_migrate_to_bigautofield', '2025-11-24 16:48:06.564494'),
(27, 'token_blacklist', '0010_fix_migrate_to_bigautofield', '2025-11-24 16:48:06.592457'),
(28, 'token_blacklist', '0011_linearizes_history', '2025-11-24 16:48:06.595621'),
(29, 'token_blacklist', '0012_alter_outstandingtoken_user', '2025-11-24 16:48:06.611436');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `manager_id` bigint DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city_id` bigint DEFAULT NULL,
  `state_id` bigint DEFAULT NULL,
  `country_id` bigint DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') DEFAULT 'ACTIVE',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint DEFAULT NULL,
  `profile_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `user_id`, `first_name`, `last_name`, `gender`, `dob`, `manager_id`, `department`, `designation`, `phone`, `hire_date`, `salary`, `address`, `city_id`, `state_id`, `country_id`, `status`, `created_at`, `created_by`, `profile_image`) VALUES
(1, 56232292023695600, 'Admin', 'Kumar', 'Male', '1995-04-15', 56232292023695600, '2', '2', '9876543210', '2022-06-01', 60000.00, '12 MG Road', 1, 1, 1, 'ACTIVE', '2025-09-09 06:40:42', 1, '/nithish.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `functionality`
--

CREATE TABLE `functionality` (
  `id` int NOT NULL,
  `name` char(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `menu_id` int NOT NULL,
  `routing_path` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `is_menu` enum('YES','NO','MASTER') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('Active','InActive') NOT NULL DEFAULT 'Active',
  `display_order` int NOT NULL,
  `added_by` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `added_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `functionality`
--

INSERT INTO `functionality` (`id`, `name`, `menu_id`, `routing_path`, `is_menu`, `status`, `display_order`, `added_by`, `added_on`) VALUES
(2, 'Permission', 1, '/Permission', 'MASTER', 'Active', 2, 'admin', '2025-08-23 12:07:50'),
(3, 'Procurement / Purchasing', 2, '/Permission1', 'YES', 'Active', 1, 'admin', '2025-08-23 12:07:50'),
(4, 'nventory Management', 2, '/Permission2', 'YES', 'Active', 2, 'admin', '2025-08-23 12:07:50'),
(5, 'Order Management', 2, '/Permission3', 'YES', 'Active', 3, 'admin', '2025-08-23 12:07:50'),
(6, 'Logistics & Transportation', 2, '/Permission4', 'YES', 'Active', 1, 'admin', '2025-08-23 12:07:50'),
(7, 'Warehouse Management (WMS)', 2, '/Permission5', 'YES', 'Active', 2, 'admin', '2025-08-23 12:07:50'),
(8, 'Production & Manufacturing', 2, '/Permission6', 'YES', 'Active', 1, 'admin', '2025-08-23 12:07:50'),
(9, 'ip-address', 1, '/ipaddress', 'YES', 'Active', 1, 'admin', '2025-08-23 12:07:50'),
(10, 'Employee', 5, '/employee', 'YES', 'Active', 1, 'admin', '2025-09-06 12:07:50'),
(11, 'HrEmployee', 5, '/hr/emp', 'YES', 'Active', 1, 'admin', '2025-08-23 12:07:50');

-- --------------------------------------------------------

--
-- Table structure for table `jwks`
--

CREATE TABLE `jwks` (
  `id` varchar(100) NOT NULL,
  `public_key` longtext NOT NULL,
  `private_key` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `login_logs`
--

CREATE TABLE `login_logs` (
  `id` int NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `os` varchar(255) DEFAULT NULL,
  `login_time` datetime NOT NULL,
  `status` enum('Active','Inactive','Blocked') DEFAULT 'Active',
  `country` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `login_logs`
--

INSERT INTO `login_logs` (`id`, `user_id`, `ip_address`, `browser`, `os`, `login_time`, `status`, `country`) VALUES
(1, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-09-11 17:47:58', 'Active', 'India'),
(2, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-09-11 23:28:50', 'Active', 'India'),
(3, 175739854569756, '127.0.0.1', 'Google Chrome', 'Linux', '2025-09-11 23:30:04', 'Active', 'India'),
(4, 175739854569756, '127.0.0.1', 'Google Chrome', 'Linux', '2025-09-11 23:39:50', 'Active', 'India'),
(5, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-09-11 23:41:05', 'Active', 'India'),
(6, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-09-14 15:30:24', 'Active', 'India'),
(7, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-09-15 11:52:06', 'Active', 'India'),
(8, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-09-15 12:54:27', 'Active', 'India'),
(9, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-09-15 14:39:32', 'Active', 'India'),
(10, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-09-15 16:57:42', 'Active', 'India'),
(11, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-09-19 15:18:14', 'Active', 'India'),
(12, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-09-19 15:48:17', 'Active', 'India'),
(13, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-09-19 16:48:49', 'Active', 'India'),
(14, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-09-19 17:50:00', 'Active', 'India'),
(15, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-09-24 12:06:46', 'Active', 'India'),
(16, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-09-24 12:33:46', 'Active', 'India'),
(17, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-09-24 14:48:37', 'Active', 'India'),
(18, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-09-24 15:58:06', 'Active', 'India'),
(19, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-09-24 17:26:49', 'Active', 'India'),
(20, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-10-21 22:50:10', 'Active', 'India'),
(21, 175740462978523, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-18 13:20:14', 'Active', 'India'),
(22, 175740462978523, '127.0.0.1', 'Google Chrome', 'Linux', '2025-11-18 13:20:32', 'Active', 'India'),
(23, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-18 13:21:39', 'Active', 'India'),
(24, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-11-18 13:21:53', 'Active', 'India'),
(25, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-11-21 15:46:40', 'Active', 'India'),
(26, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-11-21 16:22:35', 'Active', 'India'),
(27, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-11-21 16:48:46', 'Active', 'India'),
(28, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 15:21:45', 'Active', 'India'),
(29, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 17:11:11', 'Active', 'India'),
(30, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 17:27:05', 'Active', 'India'),
(31, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 17:32:08', 'Active', 'India'),
(32, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 17:34:13', 'Active', 'India'),
(33, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 22:22:06', 'Active', 'India'),
(34, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 22:23:06', 'Active', 'India'),
(35, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 22:32:18', 'Active', 'India'),
(36, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 22:32:39', 'Active', 'India'),
(37, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 22:33:37', 'Active', 'India'),
(38, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 22:34:05', 'Active', 'India'),
(39, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 22:39:00', 'Active', 'India'),
(40, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 22:40:54', 'Active', 'India'),
(41, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 22:41:38', 'Active', 'India'),
(42, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 22:49:58', 'Active', 'India'),
(43, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 22:50:10', 'Active', 'India'),
(44, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 22:51:42', 'Active', 'India'),
(45, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 23:12:36', 'Active', 'India'),
(46, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 23:16:57', 'Active', 'India'),
(47, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 23:18:01', 'Active', 'India'),
(48, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 23:20:55', 'Active', 'India'),
(49, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 23:30:49', 'Active', 'India'),
(50, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 23:35:25', 'Active', 'India'),
(51, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 23:37:31', 'Active', 'India'),
(52, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 23:42:46', 'Active', 'India'),
(53, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 23:44:53', 'Active', 'India'),
(54, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 23:46:21', 'Active', 'India'),
(55, 56232292023695600, '127.0.0.1', 'Unknown Browser', 'Unknown OS', '2025-11-24 23:51:18', 'Active', 'India'),
(56, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-11-25 00:01:09', 'Active', 'India'),
(57, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-11-25 00:09:42', 'Active', 'India'),
(58, 56232292023695600, '127.0.0.1', 'Google Chrome', 'Linux', '2025-11-25 00:10:32', 'Active', 'India');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `menu_id` int NOT NULL,
  `menu_name` varchar(100) NOT NULL,
  `display_order` int DEFAULT '0',
  `status` enum('active','inactive') DEFAULT 'active',
  `display` enum('Y','N') DEFAULT 'Y',
  `parent_id` int DEFAULT NULL,
  `menu_icon` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`menu_id`, `menu_name`, `display_order`, `status`, `display`, `parent_id`, `menu_icon`) VALUES
(1, 'Admin', 1, 'active', 'Y', NULL, 'Box'),
(2, 'SCM', 2, 'active', 'Y', NULL, 'Globe'),
(3, 'Reports', 3, 'active', 'Y', NULL, 'BarChart'),
(4, 'Users', 1, 'active', 'Y', NULL, 'Plus'),
(5, 'Hr', 2, 'active', 'Y', NULL, 'UserCheck'),
(6, 'Sales Report', 1, 'active', 'Y', NULL, 'DollarSign'),
(7, 'Inventory Report', 2, 'active', 'Y', NULL, 'Box');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int NOT NULL,
  `user_id` char(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `functionality_id` int NOT NULL,
  `permission_view` enum('NO','YES') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `permission_create` enum('NO','YES') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `permission_update` enum('NO','YES') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `permission_delete` enum('NO','YES') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `permission_report` enum('NO','YES') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `permission_admin` enum('NO','YES') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('Active','InActive') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `added_on` datetime NOT NULL,
  `added_by` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `user_id`, `functionality_id`, `permission_view`, `permission_create`, `permission_update`, `permission_delete`, `permission_report`, `permission_admin`, `status`, `added_on`, `added_by`) VALUES
(1, '56232292023695600', 1, 'YES', 'NO', 'NO', 'NO', 'NO', 'YES', 'Active', '2025-09-19 16:48:26', '171464700312440400'),
(2, '56232292023695600', 2, 'YES', 'YES', 'YES', 'YES', 'NO', 'NO', 'Active', '2025-10-21 22:52:28', '171464700312440400'),
(3, '969932292023695600', 1, 'YES', 'NO', 'NO', 'NO', 'NO', 'NO', 'Active', '2025-08-26 14:47:55', '56232292023695600'),
(4, '969932292023695600', 2, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'Active', '2025-08-26 14:47:55', '56232292023695600'),
(5, '969932292023695600', 3, 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'Active', '2025-08-26 14:48:47', '56232292023695600'),
(6, '969932292023695600', 4, 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'Active', '2025-08-26 14:48:47', '56232292023695600'),
(7, '1756204520509660', 1, 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'Active', '2025-08-26 16:07:39', '56232292023695600'),
(8, '1756204520509660', 2, 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'Active', '2025-08-26 16:07:39', '56232292023695600'),
(9, '56232292023695600', 6, 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'Active', '2025-08-26 21:52:04', '56232292023695600'),
(10, '56232292023695600', 4, 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'Active', '2025-08-26 21:52:04', '56232292023695600'),
(11, '56232292023695600', 5, 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'Active', '2025-08-26 21:52:04', '56232292023695600'),
(12, '56232292023695600', 3, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'Active', '2025-08-26 22:17:29', '56232292023695600'),
(13, '56232292023695600', 8, 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'Active', '2025-08-26 21:52:04', '56232292023695600'),
(14, '56232292023695600', 7, 'YES', 'YES', 'YES', 'YES', 'NO', 'NO', 'Active', '2025-08-26 21:52:04', '56232292023695600'),
(15, '56232292023695600', 9, 'YES', 'NO', 'NO', 'NO', 'NO', 'YES', 'Active', '2025-10-21 22:52:28', '56232292023695600'),
(16, '56232292023695600', 10, 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'Active', '2025-09-24 16:05:03', '56232292023695600'),
(17, '175718127645557', 10, 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'Active', '2025-09-06 23:26:31', '56232292023695600'),
(18, '175748975468495', 10, 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'Active', '2025-09-10 13:08:30', '56232292023695600'),
(19, '175740462978523', 1, 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'Active', '2025-09-19 16:02:45', '56232292023695600'),
(20, '175740462978523', 9, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'Active', '2025-09-19 16:02:45', '56232292023695600'),
(21, '175740462978523', 2, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'Active', '2025-09-19 16:02:45', '56232292023695600'),
(22, '175740462978523', 6, 'YES', 'YES', 'YES', 'YES', 'NO', 'NO', 'Active', '2025-09-19 16:03:28', '56232292023695600'),
(23, '175740462978523', 4, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'Active', '2025-09-19 16:03:28', '56232292023695600'),
(24, '175740462978523', 5, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'Active', '2025-09-19 16:03:28', '56232292023695600'),
(25, '175740462978523', 3, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'Active', '2025-09-19 16:03:28', '56232292023695600'),
(26, '175740462978523', 8, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'Active', '2025-09-19 16:03:28', '56232292023695600'),
(27, '175740462978523', 7, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'Active', '2025-09-19 16:03:28', '56232292023695600'),
(28, '175739854569756', 6, 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'Active', '2025-09-19 16:06:21', '56232292023695600'),
(29, '175739854569756', 4, 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'Active', '2025-09-19 16:06:21', '56232292023695600'),
(30, '175739854569756', 5, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'Active', '2025-09-19 16:06:21', '56232292023695600'),
(31, '175739854569756', 3, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'Active', '2025-09-19 16:06:21', '56232292023695600'),
(32, '175739854569756', 8, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'Active', '2025-09-19 16:06:21', '56232292023695600'),
(33, '175739854569756', 7, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'Active', '2025-09-19 16:06:21', '56232292023695600'),
(34, '175739854569756', 1, 'NO', 'YES', 'YES', 'NO', 'NO', 'NO', 'Active', '2025-09-19 16:09:55', '56232292023695600'),
(35, '175739854569756', 9, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'Active', '2025-09-19 16:09:55', '56232292023695600'),
(36, '175739854569756', 2, 'NO', 'NO', 'NO', 'NO', 'NO', 'NO', 'Active', '2025-09-19 16:09:55', '56232292023695600'),
(37, '56232292023695600', 11, 'YES', 'YES', 'YES', 'YES', 'NO', 'YES', 'Active', '2025-09-24 16:05:03', '56232292023695600');

-- --------------------------------------------------------

--
-- Table structure for table `revoked_tokens`
--

CREATE TABLE `revoked_tokens` (
  `id` char(36) NOT NULL,
  `jwt_id` varchar(255) NOT NULL,
  `user_id` bigint NOT NULL,
  `revoked_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `roles_id` int NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`roles_id`, `role_name`, `description`, `status`, `created_at`) VALUES
(1, 'Admin', 'System administrator with full access', 'active', '2025-08-23 16:59:55'),
(2, 'Manager', 'Manager with limited access', 'active', '2025-08-23 16:59:55'),
(3, 'Employee', 'Standard employee role', 'active', '2025-08-23 16:59:55');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int NOT NULL,
  `user_id` bigint NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` bigint NOT NULL,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` bigint NOT NULL,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` int DEFAULT NULL,
  `jti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role_id` int DEFAULT NULL,
  `status` enum('Active','In-Active') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password_hash`, `role_id`, `status`, `created_at`, `created_by`) VALUES
(175739854569756, 'Nithish K', 'nithish131413@gmail.com', '$2b$12$0avt/lSzPdKfEaqLmuGwb.YlBCOmJEN/sLmV/K5zNmBSUhowPX9Hy', 3, 'Active', '2025-09-09 06:15:46', 56232292023695600),
(175740462978523, 'Nikhil', 'admins@example.com', '$2b$12$0avt/lSzPdKfEaqLmuGwb.YlBCOmJEN/sLmV/K5zNmBSUhowPX9Hy', 3, 'Active', '2025-09-09 07:57:10', 56232292023695600),
(175740489509561, 'amana', 'amana@gmail.com', '$2b$12$ao25lR/SMolRlSaDhZXkvucKpu273NIkSHr0KM3E4c/7.CjMkKzg6', 2, 'Active', '2025-09-09 08:01:35', 56232292023695600),
(175742060687233, 'shade', 'adminhh@knsgroup.in', '$2b$12$OK8rJRvaFCnTW1.IcKJCw.9Ew3nTdqYWqGktrjHQErbabMDy8n2H2', 2, 'In-Active', '2025-09-09 12:23:28', 56232292023695600),
(175744046571882, 'nethra', 'nethra@gmail.com', '$2b$12$V7/s1vFdS5M4DpOK/LpWp.BTHsZCArwIPHJclLpkt6AN5INyVKlZK', 1, 'Active', '2025-09-09 17:54:26', 56232292023695600),
(175744048633381, 'devvv', 'dev@gmail.com', '$2b$12$S5yHuJQDJj.fDSQ3OWYF..B9W6ZasgLA3TK0bsr.vHGlxngG5ZJqa', 2, 'Active', '2025-09-09 17:54:47', 56232292023695600),
(175744050486438, 'filetr', 'filter@gmail.com', '$2b$12$E8Z.Q6m8ktZasV0uh9CKQeabPQwb4kuCeZFpWHKmsCAKx58HGCvo6', 1, 'Active', '2025-09-09 17:55:05', 56232292023695600),
(175744052574243, 'tbb', 'nth@gmail.com', '$2b$12$FRId7OUPwy3taRB01Ry76O7XyOlyj75eIRb0QBpX7wWlyZjR9gEO6', 2, 'Active', '2025-09-09 17:55:26', 56232292023695600),
(175744054254674, 'Nithish', 'nnnn@gmail.com', '$2b$12$sc6.EOq4SIfCHZzAfmsYaOh9RhoAladP9BBcGpP.yf6.mAGutpfPC', 2, 'Active', '2025-09-09 17:55:43', 56232292023695600),
(175744055802126, '5002', 'dnnn@gmail.com', '$2b$12$M6krhuLtt8vVzMif6ZfwN.7eYHzpq5Ms3nK2pCpKHJh.W.PFvAYqG', 2, 'Active', '2025-09-09 17:55:59', 56232292023695600),
(175744058178296, 'Nithish', '44444@gmail.com', '$2b$12$OEpIzrpMHh73ACQcDCVlcuUrrhMfGnMydrWYe73jiNC9fUSGIFgve', 3, 'Active', '2025-09-09 17:56:22', 56232292023695600),
(175744060633326, 'ffff', 'nithishusessss1@gmail.com', '$2b$12$crHvdANJvMv58szlbsztTO2yroNkdVk3tVaAh2cPQJQgqdMv4zxI6', 1, 'Active', '2025-09-09 17:56:47', 56232292023695600),
(175744064871278, 'furtyy', 'nithishuse44rrrr1@gmail.com', '$2b$12$MZsbehB8VpKHcHQOKgbNvuqDaZM502xbk5JGe/fOo6.6vXcJYY8eW', 2, 'Active', '2025-09-09 17:57:29', 56232292023695600),
(175748975468495, 'shushul Kumar', 'shushul@gmail.com', '$2b$12$OWHucbFgbvbuD//DDqpUE.nFWysCZ.tzlZxqXpIY5VtNv4KnqsF3u', 3, 'Active', '2025-09-10 07:35:55', 56232292023695600),
(175748995334359, 'ravi Anna', 'raviAnna@gmail.com', '$2b$12$92z3sLIul7PdbmuLGOIe6egg0j2DEx49qd3zVnE.edczAU.asaZdO', 3, 'Active', '2025-09-10 07:39:14', 175748975468495),
(175791862755865, 'nichal purnik', 'nichalpurnik12@gmail.com', '$2b$12$sEnVn3kQ3pmcBqe8Hu/hN.EWblvoPhJLZMKtsp5zD26YU6kz6rdru', 3, 'Active', '2025-09-15 06:43:48', 56232292023695600),
(175828344124167, 'shushel', 'shushel@example.com', '$2b$12$uu2B0E45bSiLQTo.Mwc99uFnhcjzRYUWZDP7Sc3nugzj6puDzdZOm', 3, 'Active', '2025-09-19 12:04:01', 56232292023695600),
(176106729009841, 'ram', 'ram@gmail.com', '$2b$12$tFDM5Yqde7gNga0hJXEOv.hApPl3UChVlIbuKSIJoSRobIInBjUPG', 1, 'Active', '2025-10-21 17:21:31', 56232292023695600),
(56232292023695600, 'Admin', 'Admin@gmail.com', '$2b$12$0avt/lSzPdKfEaqLmuGwb.YlBCOmJEN/sLmV/K5zNmBSUhowPX9Hy', 1, 'Active', '2025-09-09 05:53:45', 56232292023695600);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--

-- Indexes for table `auth_group_permissions`
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
