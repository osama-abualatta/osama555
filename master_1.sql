-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table unified_ideas_sbp.access_code
CREATE TABLE IF NOT EXISTS `access_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accessable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accessable_id` bigint(20) unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_code_code_unique` (`code`),
  KEY `access_code_accessable_type_accessable_id_index` (`accessable_type`,`accessable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.access_code: ~1 rows (approximately)
/*!40000 ALTER TABLE `access_code` DISABLE KEYS */;
INSERT INTO `access_code` (`id`, `code`, `accessable_type`, `accessable_id`, `type`, `expires`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '94362', 'App\\Company', 1, 'ACTIVATION_CODE', '2020-05-07 22:11:12', '2020-04-30 22:11:12', '2020-04-30 22:11:59', '2020-04-30 22:11:59');
/*!40000 ALTER TABLE `access_code` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.accounts
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `last_payment` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `last_renew_date` date DEFAULT NULL,
  `sub_domain` date DEFAULT NULL,
  `db_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_connection` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 => active, 0 => inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_company_id_unique` (`company_id`),
  CONSTRAINT `accounts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.accounts: ~1 rows (approximately)
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`id`, `company_id`, `last_payment`, `expired_date`, `last_renew_date`, `sub_domain`, `db_name`, `db_user`, `db_password`, `db_connection`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, NULL, NULL, NULL, NULL, 'yoyoo', '057c76140aa0692f2fe132ce4da103ad', '02d9393ea9a87d45c73bb08fd9825d9f', 'unified_connection_unified_yoyoo', 1, '2020-04-30 22:12:49', '2020-04-30 22:12:53', NULL);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '0 => is not active , 1 => active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_username_unique` (`username`),
  UNIQUE KEY `admins_email_unique` (`email`),
  KEY `admins_user_id_foreign` (`user_id`),
  CONSTRAINT `admins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.admins: ~0 rows (approximately)
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.auths
CREATE TABLE IF NOT EXISTS `auths` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.auths: ~0 rows (approximately)
/*!40000 ALTER TABLE `auths` DISABLE KEYS */;
/*!40000 ALTER TABLE `auths` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.auth_logs
CREATE TABLE IF NOT EXISTS `auth_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `navigator` json NOT NULL,
  `logged_at` datetime NOT NULL,
  `type` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '1 => login, 2 => logout, 3 => refreshToken',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.auth_logs: ~1 rows (approximately)
/*!40000 ALTER TABLE `auth_logs` DISABLE KEYS */;
INSERT INTO `auth_logs` (`id`, `user_id`, `model`, `navigator`, `logged_at`, `type`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Core\\Auth\\Models\\SuperAdmin', '{"xr": [], "usb": [], "locks": [], "onLine": true, "vendor": "Google Inc.", "appName": "Netscape", "plugins": [[[]], [[]], [[], []]], "product": "Gecko", "storage": [], "keyboard": [], "language": "ar-AE", "platform": "Win32", "bluetooth": [], "clipboard": [], "languages": ["ar-AE", "ar", "en-US", "en"], "mimeTypes": [[], [], [], []], "userAgent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36", "vendorSub": null, "appVersion": "5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36", "connection": [], "doNotTrack": null, "productSub": "20030107", "appCodeName": "Mozilla", "credentials": [], "geolocation": [], "permissions": [], "deviceMemory": 8, "mediaDevices": [], "mediaSession": [], "presentation": [], "cookieEnabled": true, "serviceWorker": [], "maxTouchPoints": 0, "userActivation": [], "mediaCapabilities": [], "hardwareConcurrency": 8, "webkitTemporaryStorage": [], "webkitPersistentStorage": []}', '2020-05-13 05:21:46', '1', '2020-05-13 05:21:46', '2020-05-13 05:21:46');
/*!40000 ALTER TABLE `auth_logs` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.braintree
CREATE TABLE IF NOT EXISTS `braintree` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL COMMENT '0 => error , 1 => success',
  `nonce` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expirationMonth` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expirationYear` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cardType` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastFour` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastTwo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prepaid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `healthcare` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `durbinRegulated` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commercial` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payroll` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issuingBank` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `countryOfIssuance` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `productId` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.braintree: ~0 rows (approximately)
/*!40000 ALTER TABLE `braintree` DISABLE KEYS */;
/*!40000 ALTER TABLE `braintree` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.cashes
CREATE TABLE IF NOT EXISTS `cashes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `payment_type_id` bigint(20) unsigned NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `invoice_no` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_date` date NOT NULL,
  `invoice_doc` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cashes_payment_type_id_foreign` (`payment_type_id`),
  KEY `cashes_company_id_foreign` (`company_id`),
  CONSTRAINT `cashes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `cashes_payment_type_id_foreign` FOREIGN KEY (`payment_type_id`) REFERENCES `constants` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.cashes: ~0 rows (approximately)
/*!40000 ALTER TABLE `cashes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashes` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.cheques
CREATE TABLE IF NOT EXISTS `cheques` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `checks_no` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_bank` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `received_date` date NOT NULL,
  `payment_type_id` bigint(20) unsigned NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `doc_attach` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cheques_payment_type_id_foreign` (`payment_type_id`),
  KEY `cheques_status_id_foreign` (`status_id`),
  KEY `cheques_company_id_foreign` (`company_id`),
  CONSTRAINT `cheques_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `cheques_payment_type_id_foreign` FOREIGN KEY (`payment_type_id`) REFERENCES `constants` (`id`),
  CONSTRAINT `cheques_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `constants` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.cheques: ~0 rows (approximately)
/*!40000 ALTER TABLE `cheques` DISABLE KEYS */;
/*!40000 ALTER TABLE `cheques` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.cities
CREATE TABLE IF NOT EXISTS `cities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `country_id` bigint(20) unsigned NOT NULL,
  `name` json NOT NULL,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.cities: ~150 rows (approximately)
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` (`id`, `user_id`, `country_id`, `name`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 241, '{"ar": "Hardyhaven", "en": "Hardyhaven"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(2, 1, 243, '{"ar": "Idashire", "en": "Idashire"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(3, 1, 25, '{"ar": "South Lilianamouth", "en": "South Lilianamouth"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(4, 1, 186, '{"ar": "New Busterland", "en": "New Busterland"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(5, 1, 115, '{"ar": "South Hailieport", "en": "South Hailieport"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(6, 1, 50, '{"ar": "Hillville", "en": "Hillville"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(7, 1, 233, '{"ar": "New Christinaburgh", "en": "New Christinaburgh"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(8, 1, 191, '{"ar": "South Elena", "en": "South Elena"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(9, 1, 241, '{"ar": "Demariomouth", "en": "Demariomouth"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(10, 1, 194, '{"ar": "Powlowskifurt", "en": "Powlowskifurt"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(11, 1, 11, '{"ar": "East Daveberg", "en": "East Daveberg"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(12, 1, 24, '{"ar": "Goyettefurt", "en": "Goyettefurt"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(13, 1, 180, '{"ar": "Medhurstfurt", "en": "Medhurstfurt"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(14, 1, 59, '{"ar": "Port Jeromeville", "en": "Port Jeromeville"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(15, 1, 69, '{"ar": "Port Braden", "en": "Port Braden"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(16, 1, 100, '{"ar": "Alainaberg", "en": "Alainaberg"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(17, 1, 209, '{"ar": "Kyleeside", "en": "Kyleeside"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(18, 1, 152, '{"ar": "West Tabithachester", "en": "West Tabithachester"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(19, 1, 230, '{"ar": "North Kaleigh", "en": "North Kaleigh"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(20, 1, 19, '{"ar": "Port Henderson", "en": "Port Henderson"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(21, 1, 48, '{"ar": "Bernhardville", "en": "Bernhardville"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(22, 1, 131, '{"ar": "North Emiliefort", "en": "North Emiliefort"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(23, 1, 59, '{"ar": "Russelhaven", "en": "Russelhaven"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(24, 1, 236, '{"ar": "Nienowbury", "en": "Nienowbury"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(25, 1, 228, '{"ar": "West King", "en": "West King"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(26, 1, 204, '{"ar": "Port Haydenfurt", "en": "Port Haydenfurt"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(27, 1, 124, '{"ar": "Shanahanborough", "en": "Shanahanborough"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(28, 1, 51, '{"ar": "New Layne", "en": "New Layne"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(29, 1, 181, '{"ar": "Myronside", "en": "Myronside"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(30, 1, 165, '{"ar": "South Eldridgemouth", "en": "South Eldridgemouth"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(31, 1, 194, '{"ar": "West Britneyview", "en": "West Britneyview"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(32, 1, 183, '{"ar": "North Bennie", "en": "North Bennie"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(33, 1, 196, '{"ar": "Lake Priscilla", "en": "Lake Priscilla"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(34, 1, 221, '{"ar": "Altenwerthside", "en": "Altenwerthside"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(35, 1, 149, '{"ar": "Lehnerburgh", "en": "Lehnerburgh"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(36, 1, 238, '{"ar": "Harberfurt", "en": "Harberfurt"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(37, 1, 77, '{"ar": "East Sean", "en": "East Sean"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(38, 1, 192, '{"ar": "Huelsstad", "en": "Huelsstad"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(39, 1, 62, '{"ar": "Fredymouth", "en": "Fredymouth"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(40, 1, 217, '{"ar": "South Elodyfort", "en": "South Elodyfort"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(41, 1, 124, '{"ar": "Kennyland", "en": "Kennyland"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(42, 1, 74, '{"ar": "South Eloyview", "en": "South Eloyview"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(43, 1, 23, '{"ar": "Manleyport", "en": "Manleyport"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(44, 1, 157, '{"ar": "Lake Emmitt", "en": "Lake Emmitt"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(45, 1, 144, '{"ar": "East Rossieburgh", "en": "East Rossieburgh"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(46, 1, 15, '{"ar": "Port Paris", "en": "Port Paris"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(47, 1, 117, '{"ar": "Lake Caryfurt", "en": "Lake Caryfurt"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(48, 1, 111, '{"ar": "Jerdeville", "en": "Jerdeville"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(49, 1, 74, '{"ar": "Dalechester", "en": "Dalechester"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(50, 1, 167, '{"ar": "Colebury", "en": "Colebury"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(51, 1, 201, '{"ar": "Port Karleyfurt", "en": "Port Karleyfurt"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(52, 1, 121, '{"ar": "Fadelborough", "en": "Fadelborough"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(53, 1, 60, '{"ar": "East Benedict", "en": "East Benedict"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(54, 1, 32, '{"ar": "Amanitown", "en": "Amanitown"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(55, 1, 75, '{"ar": "Pedrobury", "en": "Pedrobury"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(56, 1, 233, '{"ar": "Port Lewisshire", "en": "Port Lewisshire"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(57, 1, 106, '{"ar": "Port Khalil", "en": "Port Khalil"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(58, 1, 148, '{"ar": "Kristychester", "en": "Kristychester"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(59, 1, 166, '{"ar": "Ziemannmouth", "en": "Ziemannmouth"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(60, 1, 105, '{"ar": "West Dangelomouth", "en": "West Dangelomouth"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(61, 1, 134, '{"ar": "East Cary", "en": "East Cary"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(62, 1, 71, '{"ar": "McGlynnburgh", "en": "McGlynnburgh"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(63, 1, 171, '{"ar": "O\'Konhaven", "en": "O\'Konhaven"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(64, 1, 181, '{"ar": "New Ben", "en": "New Ben"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(65, 1, 199, '{"ar": "Metafurt", "en": "Metafurt"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(66, 1, 98, '{"ar": "Gaylordtown", "en": "Gaylordtown"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(67, 1, 167, '{"ar": "Jacobsonport", "en": "Jacobsonport"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(68, 1, 68, '{"ar": "South Uriahmouth", "en": "South Uriahmouth"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(69, 1, 214, '{"ar": "North Claud", "en": "North Claud"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(70, 1, 226, '{"ar": "Port Branson", "en": "Port Branson"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(71, 1, 14, '{"ar": "North Mollyberg", "en": "North Mollyberg"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(72, 1, 87, '{"ar": "Hoegerfurt", "en": "Hoegerfurt"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(73, 1, 229, '{"ar": "Sadyestad", "en": "Sadyestad"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(74, 1, 7, '{"ar": "South Laceymouth", "en": "South Laceymouth"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(75, 1, 106, '{"ar": "Denesikton", "en": "Denesikton"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(76, 1, 34, '{"ar": "Theoside", "en": "Theoside"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(77, 1, 95, '{"ar": "Considineton", "en": "Considineton"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(78, 1, 96, '{"ar": "Effertzstad", "en": "Effertzstad"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(79, 1, 32, '{"ar": "Stromanborough", "en": "Stromanborough"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(80, 1, 214, '{"ar": "Trompport", "en": "Trompport"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(81, 1, 112, '{"ar": "Port Verdie", "en": "Port Verdie"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(82, 1, 3, '{"ar": "Konopelskiburgh", "en": "Konopelskiburgh"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(83, 1, 170, '{"ar": "New Josefinaport", "en": "New Josefinaport"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(84, 1, 60, '{"ar": "Kingville", "en": "Kingville"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(85, 1, 103, '{"ar": "New May", "en": "New May"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(86, 1, 41, '{"ar": "Port Namefurt", "en": "Port Namefurt"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(87, 1, 188, '{"ar": "East Theresa", "en": "East Theresa"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(88, 1, 22, '{"ar": "Gottliebstad", "en": "Gottliebstad"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(89, 1, 218, '{"ar": "Paytonfurt", "en": "Paytonfurt"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(90, 1, 125, '{"ar": "Port Hershel", "en": "Port Hershel"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(91, 1, 119, '{"ar": "Nicoleberg", "en": "Nicoleberg"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(92, 1, 38, '{"ar": "Raquelfort", "en": "Raquelfort"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(93, 1, 134, '{"ar": "Abbychester", "en": "Abbychester"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(94, 1, 49, '{"ar": "Buckridgeburgh", "en": "Buckridgeburgh"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(95, 1, 6, '{"ar": "South Dejah", "en": "South Dejah"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(96, 1, 22, '{"ar": "Joliestad", "en": "Joliestad"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(97, 1, 204, '{"ar": "South Barbaraborough", "en": "South Barbaraborough"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(98, 1, 98, '{"ar": "Boyleside", "en": "Boyleside"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(99, 1, 210, '{"ar": "Judahside", "en": "Judahside"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(100, 1, 80, '{"ar": "Andersonport", "en": "Andersonport"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(101, 1, 84, '{"ar": "Lake Revahaven", "en": "Lake Revahaven"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(102, 1, 105, '{"ar": "Lowellshire", "en": "Lowellshire"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(103, 1, 23, '{"ar": "West Tiaville", "en": "West Tiaville"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(104, 1, 179, '{"ar": "Adriannaview", "en": "Adriannaview"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(105, 1, 169, '{"ar": "Myriamton", "en": "Myriamton"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(106, 1, 231, '{"ar": "Lake Adrian", "en": "Lake Adrian"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(107, 1, 158, '{"ar": "Lake Kimview", "en": "Lake Kimview"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(108, 1, 116, '{"ar": "North Frederique", "en": "North Frederique"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(109, 1, 242, '{"ar": "Walshshire", "en": "Walshshire"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(110, 1, 141, '{"ar": "Hegmannfort", "en": "Hegmannfort"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(111, 1, 47, '{"ar": "Ethelbury", "en": "Ethelbury"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(112, 1, 17, '{"ar": "Port Janstad", "en": "Port Janstad"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(113, 1, 127, '{"ar": "Trishatown", "en": "Trishatown"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(114, 1, 229, '{"ar": "Hilpertberg", "en": "Hilpertberg"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(115, 1, 53, '{"ar": "North Felipe", "en": "North Felipe"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(116, 1, 96, '{"ar": "Vandervortbury", "en": "Vandervortbury"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(117, 1, 9, '{"ar": "Breanahaven", "en": "Breanahaven"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(118, 1, 193, '{"ar": "Noemiborough", "en": "Noemiborough"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(119, 1, 127, '{"ar": "Greenfelderton", "en": "Greenfelderton"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(120, 1, 140, '{"ar": "Buddymouth", "en": "Buddymouth"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(121, 1, 127, '{"ar": "Edwinaburgh", "en": "Edwinaburgh"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(122, 1, 58, '{"ar": "Lake Cameron", "en": "Lake Cameron"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(123, 1, 28, '{"ar": "Albertside", "en": "Albertside"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(124, 1, 26, '{"ar": "West Lucianoland", "en": "West Lucianoland"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(125, 1, 2, '{"ar": "New Alizaport", "en": "New Alizaport"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(126, 1, 195, '{"ar": "Lorineville", "en": "Lorineville"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(127, 1, 211, '{"ar": "West Asa", "en": "West Asa"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(128, 1, 181, '{"ar": "Crookshaven", "en": "Crookshaven"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(129, 1, 231, '{"ar": "North Marlonfort", "en": "North Marlonfort"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(130, 1, 226, '{"ar": "Gottliebstad", "en": "Gottliebstad"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(131, 1, 175, '{"ar": "West Tessie", "en": "West Tessie"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(132, 1, 186, '{"ar": "East Devonte", "en": "East Devonte"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(133, 1, 135, '{"ar": "Gislasonberg", "en": "Gislasonberg"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(134, 1, 30, '{"ar": "New Okey", "en": "New Okey"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(135, 1, 220, '{"ar": "North Hankbury", "en": "North Hankbury"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(136, 1, 14, '{"ar": "East Odessa", "en": "East Odessa"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(137, 1, 219, '{"ar": "Britneyshire", "en": "Britneyshire"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(138, 1, 3, '{"ar": "Hardymouth", "en": "Hardymouth"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(139, 1, 221, '{"ar": "Harrisborough", "en": "Harrisborough"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(140, 1, 58, '{"ar": "West Favianmouth", "en": "West Favianmouth"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(141, 1, 218, '{"ar": "West Jacklyn", "en": "West Jacklyn"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(142, 1, 236, '{"ar": "Lake Francesfort", "en": "Lake Francesfort"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(143, 1, 145, '{"ar": "Port Rodolfochester", "en": "Port Rodolfochester"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(144, 1, 153, '{"ar": "West Rafaelaborough", "en": "West Rafaelaborough"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(145, 1, 39, '{"ar": "Armstrongchester", "en": "Armstrongchester"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(146, 1, 78, '{"ar": "New Aida", "en": "New Aida"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(147, 1, 181, '{"ar": "O\'Reillyside", "en": "O\'Reillyside"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(148, 1, 25, '{"ar": "Hammestown", "en": "Hammestown"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(149, 1, 15, '{"ar": "Justiceton", "en": "Justiceton"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(150, 1, 132, '{"ar": "Michaleside", "en": "Michaleside"}', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.companies
CREATE TABLE IF NOT EXISTS `companies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date DEFAULT NULL,
  `branch_no` int(10) unsigned DEFAULT NULL,
  `size_id` int(10) unsigned DEFAULT NULL,
  `inventory_no` int(10) unsigned DEFAULT NULL,
  `employee_no` int(10) unsigned DEFAULT NULL,
  `tax_no` int(10) unsigned DEFAULT NULL,
  `contribution_type_id` int(10) unsigned DEFAULT NULL,
  `activity_type_id` int(10) unsigned NOT NULL,
  `product_type_id` int(10) unsigned NOT NULL,
  `business_record_no` int(10) unsigned DEFAULT NULL,
  `country_id` int(10) unsigned DEFAULT NULL,
  `city_id` int(10) unsigned DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `custom_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `activity_id` bigint(20) unsigned NOT NULL,
  `business_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brief_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `companies_activity_id_foreign` (`activity_id`),
  CONSTRAINT `companies_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `constants` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.companies: ~1 rows (approximately)
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` (`id`, `user_id`, `name`, `start_date`, `branch_no`, `size_id`, `inventory_no`, `employee_no`, `tax_no`, `contribution_type_id`, `activity_type_id`, `product_type_id`, `business_record_no`, `country_id`, `city_id`, `email`, `mobile`, `fax`, `address`, `latitude`, `longitude`, `logo`, `notes`, `custom_url`, `is_active`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `activity_id`, `business_name`, `brief_name`, `plan_id`) VALUES
	(1, NULL, '{"en":"yoyoo"}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 54, 56, NULL, NULL, NULL, NULL, '0598273142458008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'da18962f4669481dcd89b101345ffc5e', '2020-04-30 22:11:12', '2020-04-30 22:11:12', NULL, 60, 'yoyoo', 'yoyoo', 3);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.company_users
CREATE TABLE IF NOT EXISTS `company_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '0 => is not active , 1 => active',
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company_users_username_unique` (`username`),
  UNIQUE KEY `company_users_email_unique` (`email`),
  KEY `company_users_user_id_foreign` (`user_id`),
  CONSTRAINT `company_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.company_users: ~0 rows (approximately)
/*!40000 ALTER TABLE `company_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_users` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.constants
CREATE TABLE IF NOT EXISTS `constants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` json DEFAULT NULL,
  `value` json DEFAULT NULL,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.constants: ~51 rows (approximately)
/*!40000 ALTER TABLE `constants` DISABLE KEYS */;
INSERT INTO `constants` (`id`, `user_id`, `parent_id`, `key`, `name`, `value`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(25, 1, NULL, 'PLAN_LEVEL', '{"ar": "مستويات الخطة", "en": "Plan Levels"}', '[]', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(26, 1, 25, 'PLAN_LEVEL', '{"ar": "مبتدئ", "en": "Beginner"}', '[]', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(27, 1, 25, 'PLAN_LEVEL', '{"ar": "متوسط", "en": "Intermediate"}', '[]', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(28, 1, 25, 'PLAN_LEVEL', '{"ar": "متقدم", "en": "Advanced"}', '[]', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(29, 1, NULL, 'MODULE', '{"ar": "الأنظمة", "en": "Modules"}', '[]', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(30, 1, 29, 'MODULE', '{"ar": "المخازن", "en": "Inventory & Item"}', '{"path": "db_inventory_path"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(31, 1, 29, 'MODULE', '{"ar": "المبيعات", "en": "Sales"}', '{"path": "db_sales_path"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(32, 1, 29, 'MODULE', '{"ar": "المشتريات", "en": "Purchase"}', '{"path": "db_purchase_path"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(33, 1, 29, 'MODULE', '{"ar": "المستخدمين", "en": "Users"}', '{"path": "db_users_path"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(34, 1, 29, 'MODULE', '{"ar": "الإشتراكات", "en": "Subscription"}', '{"path": "db_subscription_path"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(35, 1, 29, 'MODULE', '{"ar": "الموظفين", "en": "Employee"}', '{"path": "db_employee_path"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(36, 1, 29, 'MODULE', '{"ar": "المشاريع", "en": "Projects"}', '{"path": "db_projects_path"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(37, 1, 29, 'MODULE', '{"ar": "التقارير", "en": "Reports"}', '{"path": "db_reports_path"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(38, 1, 29, 'MODULE', '{"ar": "الإحصائيات والتحليل", "en": "Statistics & Analysis"}', '{"path": "db_statistics_path"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(39, 1, 29, 'MODULE', '{"ar": "الزبائن", "en": "Customers"}', '{"path": "db_customers_path"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(40, 1, 29, 'MODULE', '{"ar": "الموردين", "en": "Suppliers"}', '{"path": "db_suppliers_path"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(41, 1, NULL, 'COMPANY_CONTRIBUTION_TYPE', '{"ar": "Contribution Type", "en": "Contribution Type"}', '[]', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(42, 1, 41, 'COMPANY_CONTRIBUTION_TYPE', '{"ar": "مساهمة محدودة", "en": "Contribution Limits"}', '[]', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(43, 1, 41, 'COMPANY_CONTRIBUTION_TYPE', '{"ar": "غير مساهمة", "en": "No Contribution"}', '[]', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(44, 1, NULL, 'COMPANY_SIZE', '{"ar": "حجم الشركة", "en": "Company Size"}', '[]', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(45, 1, 44, 'COMPANY_SIZE', '{"ar": "5-10", "en": "5-10"}', '[]', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(46, 1, 44, 'COMPANY_SIZE', '{"ar": "10-20", "en": "10-20"}', '[]', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(47, 1, 44, 'COMPANY_SIZE', '{"ar": "20-50", "en": "20-50"}', '[]', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(48, 1, 44, 'COMPANY_SIZE', '{"ar": ">50", "en": ">50"}', '[]', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(49, 1, NULL, 'INTERVAL_TYPE', '{"ar": "مدة الإشتراك", "en": "Interval Type"}', '{"months": 0}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(50, 1, 49, 'INTERVAL_TYPE', '{"ar": "شهر", "en": "Month"}', '{"months": 1}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(51, 1, 49, 'INTERVAL_TYPE', '{"ar": "3 أشهر", "en": "3 Months"}', '{"months": 3}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(52, 1, 49, 'INTERVAL_TYPE', '{"ar": "6 أشهر", "en": "6 Months"}', '{"months": 6}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(53, 1, 49, 'INTERVAL_TYPE', '{"ar": "سنة", "en": "1 Year"}', '{"months": 12}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(54, 1, NULL, 'ACTIVITY_TYPE', '{"ar": "منتجات", "en": "Product"}', '{"ar": "منتجات", "en": "Product"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(55, 1, NULL, 'ACTIVITY_TYPE', '{"ar": "خدمات", "en": "Service"}', '{"ar": "خدمات", "en": "Service"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(56, 1, 54, 'PRODUCT_TYPE', '{"ar": "حقيقي", "en": "Real"}', '{"ar": "حقيقي", "en": "Real"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(57, 1, 54, 'PRODUCT_TYPE', '{"ar": "حقيقي", "en": "Service"}', '{"ar": "حقيقي", "en": "Service"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(58, 1, 55, 'SERVICE_TYPE', '{"ar": "عبر الانترنت", "en": "Online"}', '{"ar": "على الواقع", "en": "Online"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(59, 1, 55, 'SERVICE_TYPE', '{"ar": "على الواقع", "en": "Offline"}', '{"ar": "على الواقع", "en": "Offline"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(60, 1, 54, 'ACTIVITY', '{"ar": "ملابس", "en": "Fashion"}', '{"ar": "ملابس", "en": "Fashion"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(61, 1, 54, 'ACTIVITY', '{"ar": "صيانة", "en": "Maintaining"}', '{"ar": "صيانة", "en": "Maintaining"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(62, 1, 54, 'ACTIVITY', '{"ar": "طبخ", "en": "Cooking"}', '{"ar": "طبخ", "en": "Cooking"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(63, 1, 55, 'ACTIVITY', '{"ar": "تشفير", "en": "Create hash"}', '{"ar": "تشفير", "en": "Create Md5"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(64, 1, 55, 'ACTIVITY', '{"ar": "ارسال صور", "en": "Send SMS"}', '{"ar": "تيلو", "en": "Twillow"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(79, 1, NULL, 'PAYMENT_PROCESS_TYPE', '{"ar": "نوع العملية", "en": "Process Type"}', '{"type": "PAYMENT_PROCESS_TYPE"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(80, 1, 79, 'PAYMENT_PROCESS_TYPE', '{"ar": "إنشاء حساب جديد", "en": "Create New Account"}', '{"type": "NEW_ACCOUNT", "component": "new-account"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(81, 1, 79, 'PAYMENT_PROCESS_TYPE', '{"ar": "تحويل", "en": "Conversion"}', '{"type": "CONVERSION", "component": "payment-conversion"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(82, 1, 79, 'PAYMENT_PROCESS_TYPE', '{"ar": "تجديد", "en": "Renewal"}', '{"type": "RENEWAL", "component": "payment-renewal"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(83, 1, 79, 'PAYMENT_PROCESS_TYPE', '{"ar": "ترقية", "en": "Upgrade"}', '{"type": "UPGRADE", "component": "payment-upgrade"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(84, 1, NULL, 'PAYMENT_METHOD', '{"ar": "طرق الدفع", "en": "Payment method"}', '{"ar": "طرق الدفع", "en": "Payment method"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(85, 1, 84, 'PAYMENT_METHOD', '{"ar": "كاش", "en": "Cash"}', '{"type": "CASH", "component": "cash-form"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(86, 1, 84, 'PAYMENT_METHOD', '{"ar": "بطاقات", "en": "Cards"}', '{"type": "CARD", "component": "card-form"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(87, 1, 84, 'PAYMENT_METHOD', '{"ar": "باي بال", "en": "Paypal"}', '{"type": "PAYPAL", "component": "paypal-form"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(88, 1, 84, 'PAYMENT_METHOD', '{"ar": "تحويل بنكي", "en": "Bank transfer"}', '{"type": "BANK_TRANSFER", "component": "bank-transfer-form"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(89, 1, 84, 'PAYMENT_METHOD', '{"ar": "شيكات", "en": "cheque"}', '{"type": "CHEQUE", "component": "cheque-form"}', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL);
/*!40000 ALTER TABLE `constants` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `currency_id` bigint(20) unsigned NOT NULL,
  `language_id` bigint(20) unsigned NOT NULL,
  `name` json NOT NULL,
  `nationality` json NOT NULL,
  `postal_code` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_prefix` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.countries: ~242 rows (approximately)
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` (`id`, `user_id`, `currency_id`, `language_id`, `name`, `nationality`, `postal_code`, `mobile_prefix`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 1, 2, '{"ar": "Afghanistan", "en": "Afghanistan"}', '{"ar": "Afghanistan", "en": "Afghanistan"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(2, 1, 1, 2, '{"ar": "Albania", "en": "Albania"}', '{"ar": "Albania", "en": "Albania"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(3, 1, 1, 2, '{"ar": "Algeria", "en": "Algeria"}', '{"ar": "Algeria", "en": "Algeria"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(4, 1, 1, 2, '{"ar": "American Samoa", "en": "American Samoa"}', '{"ar": "American Samoa", "en": "American Samoa"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(5, 1, 1, 2, '{"ar": "AndorrA", "en": "AndorrA"}', '{"ar": "AndorrA", "en": "AndorrA"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(6, 1, 1, 2, '{"ar": "Angola", "en": "Angola"}', '{"ar": "Angola", "en": "Angola"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(7, 1, 1, 2, '{"ar": "Anguilla", "en": "Anguilla"}', '{"ar": "Anguilla", "en": "Anguilla"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(8, 1, 1, 2, '{"ar": "Antarctica", "en": "Antarctica"}', '{"ar": "Antarctica", "en": "Antarctica"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(9, 1, 1, 2, '{"ar": "Antigua and Barbuda", "en": "Antigua and Barbuda"}', '{"ar": "Antigua and Barbuda", "en": "Antigua and Barbuda"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(10, 1, 1, 2, '{"ar": "Argentina", "en": "Argentina"}', '{"ar": "Argentina", "en": "Argentina"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(11, 1, 1, 2, '{"ar": "Armenia", "en": "Armenia"}', '{"ar": "Armenia", "en": "Armenia"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(12, 1, 1, 2, '{"ar": "Aruba", "en": "Aruba"}', '{"ar": "Aruba", "en": "Aruba"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(13, 1, 1, 2, '{"ar": "Australia", "en": "Australia"}', '{"ar": "Australia", "en": "Australia"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(14, 1, 1, 2, '{"ar": "Austria", "en": "Austria"}', '{"ar": "Austria", "en": "Austria"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(15, 1, 1, 2, '{"ar": "Azerbaijan", "en": "Azerbaijan"}', '{"ar": "Azerbaijan", "en": "Azerbaijan"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(16, 1, 1, 2, '{"ar": "Bahamas", "en": "Bahamas"}', '{"ar": "Bahamas", "en": "Bahamas"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(17, 1, 1, 2, '{"ar": "Bahrain", "en": "Bahrain"}', '{"ar": "Bahrain", "en": "Bahrain"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(18, 1, 1, 2, '{"ar": "Bangladesh", "en": "Bangladesh"}', '{"ar": "Bangladesh", "en": "Bangladesh"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(19, 1, 1, 2, '{"ar": "Barbados", "en": "Barbados"}', '{"ar": "Barbados", "en": "Barbados"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(20, 1, 1, 2, '{"ar": "Belarus", "en": "Belarus"}', '{"ar": "Belarus", "en": "Belarus"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(21, 1, 1, 2, '{"ar": "Belgium", "en": "Belgium"}', '{"ar": "Belgium", "en": "Belgium"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(22, 1, 1, 2, '{"ar": "Belize", "en": "Belize"}', '{"ar": "Belize", "en": "Belize"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(23, 1, 1, 2, '{"ar": "Benin", "en": "Benin"}', '{"ar": "Benin", "en": "Benin"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(24, 1, 1, 2, '{"ar": "Bermuda", "en": "Bermuda"}', '{"ar": "Bermuda", "en": "Bermuda"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(25, 1, 1, 2, '{"ar": "Bhutan", "en": "Bhutan"}', '{"ar": "Bhutan", "en": "Bhutan"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(26, 1, 1, 2, '{"ar": "Bolivia", "en": "Bolivia"}', '{"ar": "Bolivia", "en": "Bolivia"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(27, 1, 1, 2, '{"ar": "Bosnia and Herzegovina", "en": "Bosnia and Herzegovina"}', '{"ar": "Bosnia and Herzegovina", "en": "Bosnia and Herzegovina"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(28, 1, 1, 2, '{"ar": "Botswana", "en": "Botswana"}', '{"ar": "Botswana", "en": "Botswana"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(29, 1, 1, 2, '{"ar": "Bouvet Island", "en": "Bouvet Island"}', '{"ar": "Bouvet Island", "en": "Bouvet Island"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(30, 1, 1, 2, '{"ar": "Brazil", "en": "Brazil"}', '{"ar": "Brazil", "en": "Brazil"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(31, 1, 1, 2, '{"ar": "British Indian Ocean Territory", "en": "British Indian Ocean Territory"}', '{"ar": "British Indian Ocean Territory", "en": "British Indian Ocean Territory"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(32, 1, 1, 2, '{"ar": "Brunei Darussalam", "en": "Brunei Darussalam"}', '{"ar": "Brunei Darussalam", "en": "Brunei Darussalam"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(33, 1, 1, 2, '{"ar": "Bulgaria", "en": "Bulgaria"}', '{"ar": "Bulgaria", "en": "Bulgaria"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(34, 1, 1, 2, '{"ar": "Burkina Faso", "en": "Burkina Faso"}', '{"ar": "Burkina Faso", "en": "Burkina Faso"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(35, 1, 1, 2, '{"ar": "Burundi", "en": "Burundi"}', '{"ar": "Burundi", "en": "Burundi"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(36, 1, 1, 2, '{"ar": "Cambodia", "en": "Cambodia"}', '{"ar": "Cambodia", "en": "Cambodia"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(37, 1, 1, 2, '{"ar": "Cameroon", "en": "Cameroon"}', '{"ar": "Cameroon", "en": "Cameroon"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(38, 1, 1, 2, '{"ar": "Canada", "en": "Canada"}', '{"ar": "Canada", "en": "Canada"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(39, 1, 1, 2, '{"ar": "Cape Verde", "en": "Cape Verde"}', '{"ar": "Cape Verde", "en": "Cape Verde"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(40, 1, 1, 2, '{"ar": "Cayman Islands", "en": "Cayman Islands"}', '{"ar": "Cayman Islands", "en": "Cayman Islands"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(41, 1, 1, 2, '{"ar": "Central African Republic", "en": "Central African Republic"}', '{"ar": "Central African Republic", "en": "Central African Republic"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(42, 1, 1, 2, '{"ar": "Chad", "en": "Chad"}', '{"ar": "Chad", "en": "Chad"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(43, 1, 1, 2, '{"ar": "Chile", "en": "Chile"}', '{"ar": "Chile", "en": "Chile"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(44, 1, 1, 2, '{"ar": "China", "en": "China"}', '{"ar": "China", "en": "China"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(45, 1, 1, 2, '{"ar": "Christmas Island", "en": "Christmas Island"}', '{"ar": "Christmas Island", "en": "Christmas Island"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(46, 1, 1, 2, '{"ar": "Cocos (Keeling) Islands", "en": "Cocos (Keeling) Islands"}', '{"ar": "Cocos (Keeling) Islands", "en": "Cocos (Keeling) Islands"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(47, 1, 1, 2, '{"ar": "Colombia", "en": "Colombia"}', '{"ar": "Colombia", "en": "Colombia"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(48, 1, 1, 2, '{"ar": "Comoros", "en": "Comoros"}', '{"ar": "Comoros", "en": "Comoros"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(49, 1, 1, 2, '{"ar": "Congo", "en": "Congo"}', '{"ar": "Congo", "en": "Congo"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(50, 1, 1, 2, '{"ar": "Congo, The Democratic Republic of the", "en": "Congo, The Democratic Republic of the"}', '{"ar": "Congo, The Democratic Republic of the", "en": "Congo, The Democratic Republic of the"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(51, 1, 1, 2, '{"ar": "Cook Islands", "en": "Cook Islands"}', '{"ar": "Cook Islands", "en": "Cook Islands"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(52, 1, 1, 2, '{"ar": "Costa Rica", "en": "Costa Rica"}', '{"ar": "Costa Rica", "en": "Costa Rica"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(53, 1, 1, 2, '{"ar": "Cote D Ivoire", "en": "Cote D Ivoire"}', '{"ar": "Cote D Ivoire", "en": "Cote D Ivoire"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(54, 1, 1, 2, '{"ar": "Croatia", "en": "Croatia"}', '{"ar": "Croatia", "en": "Croatia"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(55, 1, 1, 2, '{"ar": "Cuba", "en": "Cuba"}', '{"ar": "Cuba", "en": "Cuba"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(56, 1, 1, 2, '{"ar": "Cyprus", "en": "Cyprus"}', '{"ar": "Cyprus", "en": "Cyprus"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(57, 1, 1, 2, '{"ar": "Czech Republic", "en": "Czech Republic"}', '{"ar": "Czech Republic", "en": "Czech Republic"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(58, 1, 1, 2, '{"ar": "Denmark", "en": "Denmark"}', '{"ar": "Denmark", "en": "Denmark"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(59, 1, 1, 2, '{"ar": "Djibouti", "en": "Djibouti"}', '{"ar": "Djibouti", "en": "Djibouti"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(60, 1, 1, 2, '{"ar": "Dominica", "en": "Dominica"}', '{"ar": "Dominica", "en": "Dominica"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(61, 1, 1, 2, '{"ar": "Dominican Republic", "en": "Dominican Republic"}', '{"ar": "Dominican Republic", "en": "Dominican Republic"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(62, 1, 1, 2, '{"ar": "Ecuador", "en": "Ecuador"}', '{"ar": "Ecuador", "en": "Ecuador"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(63, 1, 1, 2, '{"ar": "Egypt", "en": "Egypt"}', '{"ar": "Egypt", "en": "Egypt"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(64, 1, 1, 2, '{"ar": "El Salvador", "en": "El Salvador"}', '{"ar": "El Salvador", "en": "El Salvador"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(65, 1, 1, 2, '{"ar": "Equatorial Guinea", "en": "Equatorial Guinea"}', '{"ar": "Equatorial Guinea", "en": "Equatorial Guinea"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(66, 1, 1, 2, '{"ar": "Eritrea", "en": "Eritrea"}', '{"ar": "Eritrea", "en": "Eritrea"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(67, 1, 1, 2, '{"ar": "Estonia", "en": "Estonia"}', '{"ar": "Estonia", "en": "Estonia"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(68, 1, 1, 2, '{"ar": "Ethiopia", "en": "Ethiopia"}', '{"ar": "Ethiopia", "en": "Ethiopia"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(69, 1, 1, 2, '{"ar": "Falkland Islands (Malvinas)", "en": "Falkland Islands (Malvinas)"}', '{"ar": "Falkland Islands (Malvinas)", "en": "Falkland Islands (Malvinas)"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(70, 1, 1, 2, '{"ar": "Faroe Islands", "en": "Faroe Islands"}', '{"ar": "Faroe Islands", "en": "Faroe Islands"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(71, 1, 1, 2, '{"ar": "Fiji", "en": "Fiji"}', '{"ar": "Fiji", "en": "Fiji"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(72, 1, 1, 2, '{"ar": "Finland", "en": "Finland"}', '{"ar": "Finland", "en": "Finland"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(73, 1, 1, 2, '{"ar": "France", "en": "France"}', '{"ar": "France", "en": "France"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(74, 1, 1, 2, '{"ar": "French Guiana", "en": "French Guiana"}', '{"ar": "French Guiana", "en": "French Guiana"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(75, 1, 1, 2, '{"ar": "French Polynesia", "en": "French Polynesia"}', '{"ar": "French Polynesia", "en": "French Polynesia"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(76, 1, 1, 2, '{"ar": "French Southern Territories", "en": "French Southern Territories"}', '{"ar": "French Southern Territories", "en": "French Southern Territories"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(77, 1, 1, 2, '{"ar": "Gabon", "en": "Gabon"}', '{"ar": "Gabon", "en": "Gabon"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(78, 1, 1, 2, '{"ar": "Gambia", "en": "Gambia"}', '{"ar": "Gambia", "en": "Gambia"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(79, 1, 1, 2, '{"ar": "Georgia", "en": "Georgia"}', '{"ar": "Georgia", "en": "Georgia"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(80, 1, 1, 2, '{"ar": "Germany", "en": "Germany"}', '{"ar": "Germany", "en": "Germany"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(81, 1, 1, 2, '{"ar": "Ghana", "en": "Ghana"}', '{"ar": "Ghana", "en": "Ghana"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(82, 1, 1, 2, '{"ar": "Gibraltar", "en": "Gibraltar"}', '{"ar": "Gibraltar", "en": "Gibraltar"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(83, 1, 1, 2, '{"ar": "Greece", "en": "Greece"}', '{"ar": "Greece", "en": "Greece"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(84, 1, 1, 2, '{"ar": "Greenland", "en": "Greenland"}', '{"ar": "Greenland", "en": "Greenland"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(85, 1, 1, 2, '{"ar": "Grenada", "en": "Grenada"}', '{"ar": "Grenada", "en": "Grenada"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(86, 1, 1, 2, '{"ar": "Guadeloupe", "en": "Guadeloupe"}', '{"ar": "Guadeloupe", "en": "Guadeloupe"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(87, 1, 1, 2, '{"ar": "Guam", "en": "Guam"}', '{"ar": "Guam", "en": "Guam"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(88, 1, 1, 2, '{"ar": "Guatemala", "en": "Guatemala"}', '{"ar": "Guatemala", "en": "Guatemala"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(89, 1, 1, 2, '{"ar": "Guernsey", "en": "Guernsey"}', '{"ar": "Guernsey", "en": "Guernsey"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(90, 1, 1, 2, '{"ar": "Guinea", "en": "Guinea"}', '{"ar": "Guinea", "en": "Guinea"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(91, 1, 1, 2, '{"ar": "Guinea-Bissau", "en": "Guinea-Bissau"}', '{"ar": "Guinea-Bissau", "en": "Guinea-Bissau"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(92, 1, 1, 2, '{"ar": "Guyana", "en": "Guyana"}', '{"ar": "Guyana", "en": "Guyana"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(93, 1, 1, 2, '{"ar": "Haiti", "en": "Haiti"}', '{"ar": "Haiti", "en": "Haiti"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(94, 1, 1, 2, '{"ar": "Heard Island and Mcdonald Islands", "en": "Heard Island and Mcdonald Islands"}', '{"ar": "Heard Island and Mcdonald Islands", "en": "Heard Island and Mcdonald Islands"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(95, 1, 1, 2, '{"ar": "Holy See (Vatican City State)", "en": "Holy See (Vatican City State)"}', '{"ar": "Holy See (Vatican City State)", "en": "Holy See (Vatican City State)"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(96, 1, 1, 2, '{"ar": "Honduras", "en": "Honduras"}', '{"ar": "Honduras", "en": "Honduras"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(97, 1, 1, 2, '{"ar": "Hong Kong", "en": "Hong Kong"}', '{"ar": "Hong Kong", "en": "Hong Kong"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(98, 1, 1, 2, '{"ar": "Hungary", "en": "Hungary"}', '{"ar": "Hungary", "en": "Hungary"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(99, 1, 1, 2, '{"ar": "Iceland", "en": "Iceland"}', '{"ar": "Iceland", "en": "Iceland"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(100, 1, 1, 2, '{"ar": "India", "en": "India"}', '{"ar": "India", "en": "India"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(101, 1, 1, 2, '{"ar": "Indonesia", "en": "Indonesia"}', '{"ar": "Indonesia", "en": "Indonesia"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(102, 1, 1, 2, '{"ar": "Iran, Islamic Republic Of", "en": "Iran, Islamic Republic Of"}', '{"ar": "Iran, Islamic Republic Of", "en": "Iran, Islamic Republic Of"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(103, 1, 1, 2, '{"ar": "Iraq", "en": "Iraq"}', '{"ar": "Iraq", "en": "Iraq"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(104, 1, 1, 2, '{"ar": "Ireland", "en": "Ireland"}', '{"ar": "Ireland", "en": "Ireland"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(105, 1, 1, 2, '{"ar": "Isle of Man", "en": "Isle of Man"}', '{"ar": "Isle of Man", "en": "Isle of Man"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(106, 1, 1, 2, '{"ar": "Israel", "en": "Israel"}', '{"ar": "Israel", "en": "Israel"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(107, 1, 1, 2, '{"ar": "Italy", "en": "Italy"}', '{"ar": "Italy", "en": "Italy"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(108, 1, 1, 2, '{"ar": "Jamaica", "en": "Jamaica"}', '{"ar": "Jamaica", "en": "Jamaica"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(109, 1, 1, 2, '{"ar": "Japan", "en": "Japan"}', '{"ar": "Japan", "en": "Japan"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(110, 1, 1, 2, '{"ar": "Jersey", "en": "Jersey"}', '{"ar": "Jersey", "en": "Jersey"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(111, 1, 1, 2, '{"ar": "Jordan", "en": "Jordan"}', '{"ar": "Jordan", "en": "Jordan"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(112, 1, 1, 2, '{"ar": "Kazakhstan", "en": "Kazakhstan"}', '{"ar": "Kazakhstan", "en": "Kazakhstan"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(113, 1, 1, 2, '{"ar": "Kenya", "en": "Kenya"}', '{"ar": "Kenya", "en": "Kenya"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(114, 1, 1, 2, '{"ar": "Kiribati", "en": "Kiribati"}', '{"ar": "Kiribati", "en": "Kiribati"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(115, 1, 1, 2, '{"ar": "Korea, Democratic People S Republic of", "en": "Korea, Democratic People S Republic of"}', '{"ar": "Korea, Democratic People S Republic of", "en": "Korea, Democratic People S Republic of"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(116, 1, 1, 2, '{"ar": "Korea, Republic of", "en": "Korea, Republic of"}', '{"ar": "Korea, Republic of", "en": "Korea, Republic of"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(117, 1, 1, 2, '{"ar": "Kuwait", "en": "Kuwait"}', '{"ar": "Kuwait", "en": "Kuwait"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(118, 1, 1, 2, '{"ar": "Kyrgyzstan", "en": "Kyrgyzstan"}', '{"ar": "Kyrgyzstan", "en": "Kyrgyzstan"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(119, 1, 1, 2, '{"ar": "Lao People S Democratic Republic", "en": "Lao People S Democratic Republic"}', '{"ar": "Lao People S Democratic Republic", "en": "Lao People S Democratic Republic"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(120, 1, 1, 2, '{"ar": "Latvia", "en": "Latvia"}', '{"ar": "Latvia", "en": "Latvia"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(121, 1, 1, 2, '{"ar": "Lebanon", "en": "Lebanon"}', '{"ar": "Lebanon", "en": "Lebanon"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(122, 1, 1, 2, '{"ar": "Lesotho", "en": "Lesotho"}', '{"ar": "Lesotho", "en": "Lesotho"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(123, 1, 1, 2, '{"ar": "Liberia", "en": "Liberia"}', '{"ar": "Liberia", "en": "Liberia"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(124, 1, 1, 2, '{"ar": "Libyan Arab Jamahiriya", "en": "Libyan Arab Jamahiriya"}', '{"ar": "Libyan Arab Jamahiriya", "en": "Libyan Arab Jamahiriya"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(125, 1, 1, 2, '{"ar": "Liechtenstein", "en": "Liechtenstein"}', '{"ar": "Liechtenstein", "en": "Liechtenstein"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(126, 1, 1, 2, '{"ar": "Lithuania", "en": "Lithuania"}', '{"ar": "Lithuania", "en": "Lithuania"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(127, 1, 1, 2, '{"ar": "Luxembourg", "en": "Luxembourg"}', '{"ar": "Luxembourg", "en": "Luxembourg"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(128, 1, 1, 2, '{"ar": "Macao", "en": "Macao"}', '{"ar": "Macao", "en": "Macao"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(129, 1, 1, 2, '{"ar": "Macedonia, The Former Yugoslav Republic of", "en": "Macedonia, The Former Yugoslav Republic of"}', '{"ar": "Macedonia, The Former Yugoslav Republic of", "en": "Macedonia, The Former Yugoslav Republic of"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(130, 1, 1, 2, '{"ar": "Madagascar", "en": "Madagascar"}', '{"ar": "Madagascar", "en": "Madagascar"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(131, 1, 1, 2, '{"ar": "Malawi", "en": "Malawi"}', '{"ar": "Malawi", "en": "Malawi"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(132, 1, 1, 2, '{"ar": "Malaysia", "en": "Malaysia"}', '{"ar": "Malaysia", "en": "Malaysia"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(133, 1, 1, 2, '{"ar": "Maldives", "en": "Maldives"}', '{"ar": "Maldives", "en": "Maldives"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(134, 1, 1, 2, '{"ar": "Mali", "en": "Mali"}', '{"ar": "Mali", "en": "Mali"}', '000', '00970', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(135, 1, 1, 2, '{"ar": "Malta", "en": "Malta"}', '{"ar": "Malta", "en": "Malta"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(136, 1, 1, 2, '{"ar": "Marshall Islands", "en": "Marshall Islands"}', '{"ar": "Marshall Islands", "en": "Marshall Islands"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(137, 1, 1, 2, '{"ar": "Martinique", "en": "Martinique"}', '{"ar": "Martinique", "en": "Martinique"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(138, 1, 1, 2, '{"ar": "Mauritania", "en": "Mauritania"}', '{"ar": "Mauritania", "en": "Mauritania"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(139, 1, 1, 2, '{"ar": "Mauritius", "en": "Mauritius"}', '{"ar": "Mauritius", "en": "Mauritius"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(140, 1, 1, 2, '{"ar": "Mayotte", "en": "Mayotte"}', '{"ar": "Mayotte", "en": "Mayotte"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(141, 1, 1, 2, '{"ar": "Mexico", "en": "Mexico"}', '{"ar": "Mexico", "en": "Mexico"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(142, 1, 1, 2, '{"ar": "Micronesia, Federated States of", "en": "Micronesia, Federated States of"}', '{"ar": "Micronesia, Federated States of", "en": "Micronesia, Federated States of"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(143, 1, 1, 2, '{"ar": "Moldova, Republic of", "en": "Moldova, Republic of"}', '{"ar": "Moldova, Republic of", "en": "Moldova, Republic of"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(144, 1, 1, 2, '{"ar": "Monaco", "en": "Monaco"}', '{"ar": "Monaco", "en": "Monaco"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(145, 1, 1, 2, '{"ar": "Mongolia", "en": "Mongolia"}', '{"ar": "Mongolia", "en": "Mongolia"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(146, 1, 1, 2, '{"ar": "Montserrat", "en": "Montserrat"}', '{"ar": "Montserrat", "en": "Montserrat"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(147, 1, 1, 2, '{"ar": "Morocco", "en": "Morocco"}', '{"ar": "Morocco", "en": "Morocco"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(148, 1, 1, 2, '{"ar": "Mozambique", "en": "Mozambique"}', '{"ar": "Mozambique", "en": "Mozambique"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(149, 1, 1, 2, '{"ar": "Myanmar", "en": "Myanmar"}', '{"ar": "Myanmar", "en": "Myanmar"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(150, 1, 1, 2, '{"ar": "Namibia", "en": "Namibia"}', '{"ar": "Namibia", "en": "Namibia"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(151, 1, 1, 2, '{"ar": "Nauru", "en": "Nauru"}', '{"ar": "Nauru", "en": "Nauru"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(152, 1, 1, 2, '{"ar": "Nepal", "en": "Nepal"}', '{"ar": "Nepal", "en": "Nepal"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(153, 1, 1, 2, '{"ar": "Netherlands", "en": "Netherlands"}', '{"ar": "Netherlands", "en": "Netherlands"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(154, 1, 1, 2, '{"ar": "Netherlands Antilles", "en": "Netherlands Antilles"}', '{"ar": "Netherlands Antilles", "en": "Netherlands Antilles"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(155, 1, 1, 2, '{"ar": "New Caledonia", "en": "New Caledonia"}', '{"ar": "New Caledonia", "en": "New Caledonia"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(156, 1, 1, 2, '{"ar": "New Zealand", "en": "New Zealand"}', '{"ar": "New Zealand", "en": "New Zealand"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(157, 1, 1, 2, '{"ar": "Nicaragua", "en": "Nicaragua"}', '{"ar": "Nicaragua", "en": "Nicaragua"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(158, 1, 1, 2, '{"ar": "Niger", "en": "Niger"}', '{"ar": "Niger", "en": "Niger"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(159, 1, 1, 2, '{"ar": "Nigeria", "en": "Nigeria"}', '{"ar": "Nigeria", "en": "Nigeria"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(160, 1, 1, 2, '{"ar": "Niue", "en": "Niue"}', '{"ar": "Niue", "en": "Niue"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(161, 1, 1, 2, '{"ar": "Norfolk Island", "en": "Norfolk Island"}', '{"ar": "Norfolk Island", "en": "Norfolk Island"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(162, 1, 1, 2, '{"ar": "Northern Mariana Islands", "en": "Northern Mariana Islands"}', '{"ar": "Northern Mariana Islands", "en": "Northern Mariana Islands"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(163, 1, 1, 2, '{"ar": "Norway", "en": "Norway"}', '{"ar": "Norway", "en": "Norway"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(164, 1, 1, 2, '{"ar": "Oman", "en": "Oman"}', '{"ar": "Oman", "en": "Oman"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(165, 1, 1, 2, '{"ar": "Pakistan", "en": "Pakistan"}', '{"ar": "Pakistan", "en": "Pakistan"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(166, 1, 1, 2, '{"ar": "Palau", "en": "Palau"}', '{"ar": "Palau", "en": "Palau"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(167, 1, 1, 2, '{"ar": "Palestinian Territory, Occupied", "en": "Palestinian Territory, Occupied"}', '{"ar": "Palestinian Territory, Occupied", "en": "Palestinian Territory, Occupied"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(168, 1, 1, 2, '{"ar": "Panama", "en": "Panama"}', '{"ar": "Panama", "en": "Panama"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(169, 1, 1, 2, '{"ar": "Papua New Guinea", "en": "Papua New Guinea"}', '{"ar": "Papua New Guinea", "en": "Papua New Guinea"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(170, 1, 1, 2, '{"ar": "Paraguay", "en": "Paraguay"}', '{"ar": "Paraguay", "en": "Paraguay"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(171, 1, 1, 2, '{"ar": "Peru", "en": "Peru"}', '{"ar": "Peru", "en": "Peru"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(172, 1, 1, 2, '{"ar": "Philippines", "en": "Philippines"}', '{"ar": "Philippines", "en": "Philippines"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(173, 1, 1, 2, '{"ar": "Pitcairn", "en": "Pitcairn"}', '{"ar": "Pitcairn", "en": "Pitcairn"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(174, 1, 1, 2, '{"ar": "Poland", "en": "Poland"}', '{"ar": "Poland", "en": "Poland"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(175, 1, 1, 2, '{"ar": "Portugal", "en": "Portugal"}', '{"ar": "Portugal", "en": "Portugal"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(176, 1, 1, 2, '{"ar": "Puerto Rico", "en": "Puerto Rico"}', '{"ar": "Puerto Rico", "en": "Puerto Rico"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(177, 1, 1, 2, '{"ar": "Qatar", "en": "Qatar"}', '{"ar": "Qatar", "en": "Qatar"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(178, 1, 1, 2, '{"ar": "Reunion", "en": "Reunion"}', '{"ar": "Reunion", "en": "Reunion"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(179, 1, 1, 2, '{"ar": "Romania", "en": "Romania"}', '{"ar": "Romania", "en": "Romania"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(180, 1, 1, 2, '{"ar": "Russian Federation", "en": "Russian Federation"}', '{"ar": "Russian Federation", "en": "Russian Federation"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(181, 1, 1, 2, '{"ar": "RWANDA", "en": "RWANDA"}', '{"ar": "RWANDA", "en": "RWANDA"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(182, 1, 1, 2, '{"ar": "Saint Helena", "en": "Saint Helena"}', '{"ar": "Saint Helena", "en": "Saint Helena"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(183, 1, 1, 2, '{"ar": "Saint Kitts and Nevis", "en": "Saint Kitts and Nevis"}', '{"ar": "Saint Kitts and Nevis", "en": "Saint Kitts and Nevis"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(184, 1, 1, 2, '{"ar": "Saint Lucia", "en": "Saint Lucia"}', '{"ar": "Saint Lucia", "en": "Saint Lucia"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(185, 1, 1, 2, '{"ar": "Saint Pierre and Miquelon", "en": "Saint Pierre and Miquelon"}', '{"ar": "Saint Pierre and Miquelon", "en": "Saint Pierre and Miquelon"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(186, 1, 1, 2, '{"ar": "Saint Vincent and the Grenadines", "en": "Saint Vincent and the Grenadines"}', '{"ar": "Saint Vincent and the Grenadines", "en": "Saint Vincent and the Grenadines"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(187, 1, 1, 2, '{"ar": "Samoa", "en": "Samoa"}', '{"ar": "Samoa", "en": "Samoa"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(188, 1, 1, 2, '{"ar": "San Marino", "en": "San Marino"}', '{"ar": "San Marino", "en": "San Marino"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(189, 1, 1, 2, '{"ar": "Sao Tome and Principe", "en": "Sao Tome and Principe"}', '{"ar": "Sao Tome and Principe", "en": "Sao Tome and Principe"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(190, 1, 1, 2, '{"ar": "Saudi Arabia", "en": "Saudi Arabia"}', '{"ar": "Saudi Arabia", "en": "Saudi Arabia"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(191, 1, 1, 2, '{"ar": "Senegal", "en": "Senegal"}', '{"ar": "Senegal", "en": "Senegal"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(192, 1, 1, 2, '{"ar": "Serbia and Montenegro", "en": "Serbia and Montenegro"}', '{"ar": "Serbia and Montenegro", "en": "Serbia and Montenegro"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(193, 1, 1, 2, '{"ar": "Seychelles", "en": "Seychelles"}', '{"ar": "Seychelles", "en": "Seychelles"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(194, 1, 1, 2, '{"ar": "Sierra Leone", "en": "Sierra Leone"}', '{"ar": "Sierra Leone", "en": "Sierra Leone"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(195, 1, 1, 2, '{"ar": "Singapore", "en": "Singapore"}', '{"ar": "Singapore", "en": "Singapore"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(196, 1, 1, 2, '{"ar": "Slovakia", "en": "Slovakia"}', '{"ar": "Slovakia", "en": "Slovakia"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(197, 1, 1, 2, '{"ar": "Slovenia", "en": "Slovenia"}', '{"ar": "Slovenia", "en": "Slovenia"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(198, 1, 1, 2, '{"ar": "Solomon Islands", "en": "Solomon Islands"}', '{"ar": "Solomon Islands", "en": "Solomon Islands"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(199, 1, 1, 2, '{"ar": "Somalia", "en": "Somalia"}', '{"ar": "Somalia", "en": "Somalia"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(200, 1, 1, 2, '{"ar": "South Africa", "en": "South Africa"}', '{"ar": "South Africa", "en": "South Africa"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(201, 1, 1, 2, '{"ar": "South Georgia and the South Sandwich Islands", "en": "South Georgia and the South Sandwich Islands"}', '{"ar": "South Georgia and the South Sandwich Islands", "en": "South Georgia and the South Sandwich Islands"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(202, 1, 1, 2, '{"ar": "Spain", "en": "Spain"}', '{"ar": "Spain", "en": "Spain"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(203, 1, 1, 2, '{"ar": "Sri Lanka", "en": "Sri Lanka"}', '{"ar": "Sri Lanka", "en": "Sri Lanka"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(204, 1, 1, 2, '{"ar": "Sudan", "en": "Sudan"}', '{"ar": "Sudan", "en": "Sudan"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(205, 1, 1, 2, '{"ar": "Suriname", "en": "Suriname"}', '{"ar": "Suriname", "en": "Suriname"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(206, 1, 1, 2, '{"ar": "Svalbard and Jan Mayen", "en": "Svalbard and Jan Mayen"}', '{"ar": "Svalbard and Jan Mayen", "en": "Svalbard and Jan Mayen"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(207, 1, 1, 2, '{"ar": "Swaziland", "en": "Swaziland"}', '{"ar": "Swaziland", "en": "Swaziland"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(208, 1, 1, 2, '{"ar": "Sweden", "en": "Sweden"}', '{"ar": "Sweden", "en": "Sweden"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(209, 1, 1, 2, '{"ar": "Switzerland", "en": "Switzerland"}', '{"ar": "Switzerland", "en": "Switzerland"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(210, 1, 1, 2, '{"ar": "Syrian Arab Republic", "en": "Syrian Arab Republic"}', '{"ar": "Syrian Arab Republic", "en": "Syrian Arab Republic"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(211, 1, 1, 2, '{"ar": "Taiwan, Province of China", "en": "Taiwan, Province of China"}', '{"ar": "Taiwan, Province of China", "en": "Taiwan, Province of China"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(212, 1, 1, 2, '{"ar": "Tajikistan", "en": "Tajikistan"}', '{"ar": "Tajikistan", "en": "Tajikistan"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(213, 1, 1, 2, '{"ar": "Tanzania, United Republic of", "en": "Tanzania, United Republic of"}', '{"ar": "Tanzania, United Republic of", "en": "Tanzania, United Republic of"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(214, 1, 1, 2, '{"ar": "Thailand", "en": "Thailand"}', '{"ar": "Thailand", "en": "Thailand"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(215, 1, 1, 2, '{"ar": "Timor-Leste", "en": "Timor-Leste"}', '{"ar": "Timor-Leste", "en": "Timor-Leste"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(216, 1, 1, 2, '{"ar": "Togo", "en": "Togo"}', '{"ar": "Togo", "en": "Togo"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(217, 1, 1, 2, '{"ar": "Tokelau", "en": "Tokelau"}', '{"ar": "Tokelau", "en": "Tokelau"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(218, 1, 1, 2, '{"ar": "Tonga", "en": "Tonga"}', '{"ar": "Tonga", "en": "Tonga"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(219, 1, 1, 2, '{"ar": "Trinidad and Tobago", "en": "Trinidad and Tobago"}', '{"ar": "Trinidad and Tobago", "en": "Trinidad and Tobago"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(220, 1, 1, 2, '{"ar": "Tunisia", "en": "Tunisia"}', '{"ar": "Tunisia", "en": "Tunisia"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(221, 1, 1, 2, '{"ar": "Turkey", "en": "Turkey"}', '{"ar": "Turkey", "en": "Turkey"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(222, 1, 1, 2, '{"ar": "Turkmenistan", "en": "Turkmenistan"}', '{"ar": "Turkmenistan", "en": "Turkmenistan"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(223, 1, 1, 2, '{"ar": "Turks and Caicos Islands", "en": "Turks and Caicos Islands"}', '{"ar": "Turks and Caicos Islands", "en": "Turks and Caicos Islands"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(224, 1, 1, 2, '{"ar": "Tuvalu", "en": "Tuvalu"}', '{"ar": "Tuvalu", "en": "Tuvalu"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(225, 1, 1, 2, '{"ar": "Uganda", "en": "Uganda"}', '{"ar": "Uganda", "en": "Uganda"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(226, 1, 1, 2, '{"ar": "Ukraine", "en": "Ukraine"}', '{"ar": "Ukraine", "en": "Ukraine"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(227, 1, 1, 2, '{"ar": "United Arab Emirates", "en": "United Arab Emirates"}', '{"ar": "United Arab Emirates", "en": "United Arab Emirates"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(228, 1, 1, 2, '{"ar": "United Kingdom", "en": "United Kingdom"}', '{"ar": "United Kingdom", "en": "United Kingdom"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(229, 1, 1, 2, '{"ar": "United States", "en": "United States"}', '{"ar": "United States", "en": "United States"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(230, 1, 1, 2, '{"ar": "United States Minor Outlying Islands", "en": "United States Minor Outlying Islands"}', '{"ar": "United States Minor Outlying Islands", "en": "United States Minor Outlying Islands"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(231, 1, 1, 2, '{"ar": "Uruguay", "en": "Uruguay"}', '{"ar": "Uruguay", "en": "Uruguay"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(232, 1, 1, 2, '{"ar": "Uzbekistan", "en": "Uzbekistan"}', '{"ar": "Uzbekistan", "en": "Uzbekistan"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(233, 1, 1, 2, '{"ar": "Vanuatu", "en": "Vanuatu"}', '{"ar": "Vanuatu", "en": "Vanuatu"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(234, 1, 1, 2, '{"ar": "Venezuela", "en": "Venezuela"}', '{"ar": "Venezuela", "en": "Venezuela"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(235, 1, 1, 2, '{"ar": "Viet Nam", "en": "Viet Nam"}', '{"ar": "Viet Nam", "en": "Viet Nam"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(236, 1, 1, 2, '{"ar": "Virgin Islands, British", "en": "Virgin Islands, British"}', '{"ar": "Virgin Islands, British", "en": "Virgin Islands, British"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(237, 1, 1, 2, '{"ar": "Virgin Islands, U.S.", "en": "Virgin Islands, U.S."}', '{"ar": "Virgin Islands, U.S.", "en": "Virgin Islands, U.S."}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(238, 1, 1, 2, '{"ar": "Wallis and Futuna", "en": "Wallis and Futuna"}', '{"ar": "Wallis and Futuna", "en": "Wallis and Futuna"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(239, 1, 1, 2, '{"ar": "Western Sahara", "en": "Western Sahara"}', '{"ar": "Western Sahara", "en": "Western Sahara"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(240, 1, 1, 2, '{"ar": "Yemen", "en": "Yemen"}', '{"ar": "Yemen", "en": "Yemen"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(241, 1, 1, 2, '{"ar": "Zambia", "en": "Zambia"}', '{"ar": "Zambia", "en": "Zambia"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(242, 1, 1, 2, '{"ar": "Zimbabwe", "en": "Zimbabwe"}', '{"ar": "Zimbabwe", "en": "Zimbabwe"}', '000', '00970', 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.currencies
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` json NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.currencies: ~156 rows (approximately)
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` (`id`, `user_id`, `name`, `icon`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, '{"ar": "UAE dirham", "en": "UAE dirham"}', 'AED', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(2, 1, '{"ar": "Afghan afghani", "en": "Afghan afghani"}', 'AFN', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(3, 1, '{"ar": "Albanian lek", "en": "Albanian lek"}', 'ALL', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(4, 1, '{"ar": "Armenian dram", "en": "Armenian dram"}', 'AMD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(5, 1, '{"ar": "Netherlands Antillean gulden", "en": "Netherlands Antillean gulden"}', 'ANG', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(6, 1, '{"ar": "Angolan kwanza", "en": "Angolan kwanza"}', 'AOA', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(7, 1, '{"ar": "Argentine peso", "en": "Argentine peso"}', 'ARS', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(8, 1, '{"ar": "Australian dollar", "en": "Australian dollar"}', 'AUD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(9, 1, '{"ar": "Aruban florin", "en": "Aruban florin"}', 'AWG', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(10, 1, '{"ar": "Azerbaijani manat", "en": "Azerbaijani manat"}', 'AZN', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(11, 1, '{"ar": "Bosnia and Herzegovina konvertibilna marka", "en": "Bosnia and Herzegovina konvertibilna marka"}', 'BAM', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(12, 1, '{"ar": "Barbadian dollar", "en": "Barbadian dollar"}', 'BBD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(13, 1, '{"ar": "Bangladeshi taka", "en": "Bangladeshi taka"}', 'BDT', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(14, 1, '{"ar": "Bulgarian lev", "en": "Bulgarian lev"}', 'BGN', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(15, 1, '{"ar": "Bahraini dinar", "en": "Bahraini dinar"}', 'BHD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(16, 1, '{"ar": "Burundi franc", "en": "Burundi franc"}', 'BIF', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(17, 1, '{"ar": "Bermudian dollar", "en": "Bermudian dollar"}', 'BMD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(18, 1, '{"ar": "Brunei dollar", "en": "Brunei dollar"}', 'BND', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(19, 1, '{"ar": "Bolivian boliviano", "en": "Bolivian boliviano"}', 'BOB', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(20, 1, '{"ar": "Brazilian real", "en": "Brazilian real"}', 'BRL', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(21, 1, '{"ar": "Bahamian dollar", "en": "Bahamian dollar"}', 'BSD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(22, 1, '{"ar": "Bhutanese ngultrum", "en": "Bhutanese ngultrum"}', 'BTN', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(23, 1, '{"ar": "Botswana pula", "en": "Botswana pula"}', 'BWP', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(24, 1, '{"ar": "Belarusian ruble", "en": "Belarusian ruble"}', 'BYR', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(25, 1, '{"ar": "Belize dollar", "en": "Belize dollar"}', 'BZD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(26, 1, '{"ar": "Canadian dollar", "en": "Canadian dollar"}', 'CAD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(27, 1, '{"ar": "Congolese franc", "en": "Congolese franc"}', 'CDF', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(28, 1, '{"ar": "Swiss franc", "en": "Swiss franc"}', 'CHF', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(29, 1, '{"ar": "Chilean peso", "en": "Chilean peso"}', 'CLP', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(30, 1, '{"ar": "Chinese/Yuan renminbi", "en": "Chinese/Yuan renminbi"}', 'CNY', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(31, 1, '{"ar": "Colombian peso", "en": "Colombian peso"}', 'COP', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(32, 1, '{"ar": "Costa Rican colon", "en": "Costa Rican colon"}', 'CRC', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(33, 1, '{"ar": "Cuban peso", "en": "Cuban peso"}', 'CUC', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(34, 1, '{"ar": "Cape Verdean escudo", "en": "Cape Verdean escudo"}', 'CVE', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(35, 1, '{"ar": "Czech koruna", "en": "Czech koruna"}', 'CZK', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(36, 1, '{"ar": "Djiboutian franc", "en": "Djiboutian franc"}', 'DJF', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(37, 1, '{"ar": "Danish krone", "en": "Danish krone"}', 'DKK', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(38, 1, '{"ar": "Dominican peso", "en": "Dominican peso"}', 'DOP', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(39, 1, '{"ar": "Algerian dinar", "en": "Algerian dinar"}', 'DZD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(40, 1, '{"ar": "Estonian kroon", "en": "Estonian kroon"}', 'EEK', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(41, 1, '{"ar": "Egyptian pound", "en": "Egyptian pound"}', 'EGP', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(42, 1, '{"ar": "Eritrean nakfa", "en": "Eritrean nakfa"}', 'ERN', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(43, 1, '{"ar": "Ethiopian birr", "en": "Ethiopian birr"}', 'ETB', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(44, 1, '{"ar": "European Euro", "en": "European Euro"}', 'EUR', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(45, 1, '{"ar": "Fijian dollar", "en": "Fijian dollar"}', 'FJD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(46, 1, '{"ar": "Falkland Islands pound", "en": "Falkland Islands pound"}', 'FKP', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(47, 1, '{"ar": "British pound", "en": "British pound"}', 'GBP', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(48, 1, '{"ar": "Georgian lari", "en": "Georgian lari"}', 'GEL', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(49, 1, '{"ar": "Ghanaian cedi", "en": "Ghanaian cedi"}', 'GHS', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(50, 1, '{"ar": "Gibraltar pound", "en": "Gibraltar pound"}', 'GIP', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(51, 1, '{"ar": "Gambian dalasi", "en": "Gambian dalasi"}', 'GMD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(52, 1, '{"ar": "Guinean franc", "en": "Guinean franc"}', 'GNF', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(53, 1, '{"ar": "Central African CFA franc", "en": "Central African CFA franc"}', 'GQE', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(54, 1, '{"ar": "Guatemalan quetzal", "en": "Guatemalan quetzal"}', 'GTQ', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(55, 1, '{"ar": "Guyanese dollar", "en": "Guyanese dollar"}', 'GYD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(56, 1, '{"ar": "Hong Kong dollar", "en": "Hong Kong dollar"}', 'HKD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(57, 1, '{"ar": "Honduran lempira", "en": "Honduran lempira"}', 'HNL', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(58, 1, '{"ar": "Croatian kuna", "en": "Croatian kuna"}', 'HRK', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(59, 1, '{"ar": "Haitian gourde", "en": "Haitian gourde"}', 'HTG', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(60, 1, '{"ar": "Hungarian forint", "en": "Hungarian forint"}', 'HUF', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(61, 1, '{"ar": "Indonesian rupiah", "en": "Indonesian rupiah"}', 'IDR', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(62, 1, '{"ar": "Israeli new sheqel", "en": "Israeli new sheqel"}', 'ILS', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(63, 1, '{"ar": "Indian rupee", "en": "Indian rupee"}', 'INR', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(64, 1, '{"ar": "Iraqi dinar", "en": "Iraqi dinar"}', 'IQD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(65, 1, '{"ar": "Iranian rial", "en": "Iranian rial"}', 'IRR', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(66, 1, '{"ar": "Icelandic króna", "en": "Icelandic króna"}', 'ISK', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(67, 1, '{"ar": "Jamaican dollar", "en": "Jamaican dollar"}', 'JMD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(68, 1, '{"ar": "Jordanian dinar", "en": "Jordanian dinar"}', 'JOD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(69, 1, '{"ar": "Japanese yen", "en": "Japanese yen"}', 'JPY', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(70, 1, '{"ar": "Kenyan shilling", "en": "Kenyan shilling"}', 'KES', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(71, 1, '{"ar": "Kyrgyzstani som", "en": "Kyrgyzstani som"}', 'KGS', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(72, 1, '{"ar": "Cambodian riel", "en": "Cambodian riel"}', 'KHR', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(73, 1, '{"ar": "Comorian franc", "en": "Comorian franc"}', 'KMF', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(74, 1, '{"ar": "North Korean won", "en": "North Korean won"}', 'KPW', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(75, 1, '{"ar": "South Korean won", "en": "South Korean won"}', 'KRW', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(76, 1, '{"ar": "Kuwaiti dinar", "en": "Kuwaiti dinar"}', 'KWD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(77, 1, '{"ar": "Cayman Islands dollar", "en": "Cayman Islands dollar"}', 'KYD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(78, 1, '{"ar": "Kazakhstani tenge", "en": "Kazakhstani tenge"}', 'KZT', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(79, 1, '{"ar": "Lao kip", "en": "Lao kip"}', 'LAK', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(80, 1, '{"ar": "Lebanese lira", "en": "Lebanese lira"}', 'LBP', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(81, 1, '{"ar": "Sri Lankan rupee", "en": "Sri Lankan rupee"}', 'LKR', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(82, 1, '{"ar": "Liberian dollar", "en": "Liberian dollar"}', 'LRD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(83, 1, '{"ar": "Lesotho loti", "en": "Lesotho loti"}', 'LSL', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(84, 1, '{"ar": "Lithuanian litas", "en": "Lithuanian litas"}', 'LTL', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(85, 1, '{"ar": "Latvian lats", "en": "Latvian lats"}', 'LVL', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(86, 1, '{"ar": "Libyan dinar", "en": "Libyan dinar"}', 'LYD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(87, 1, '{"ar": "Moroccan dirham", "en": "Moroccan dirham"}', 'MAD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(88, 1, '{"ar": "Moldovan leu", "en": "Moldovan leu"}', 'MDL', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(89, 1, '{"ar": "Malagasy ariary", "en": "Malagasy ariary"}', 'MGA', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(90, 1, '{"ar": "Macedonian denar", "en": "Macedonian denar"}', 'MKD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(91, 1, '{"ar": "Myanma kyat", "en": "Myanma kyat"}', 'MMK', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(92, 1, '{"ar": "Mongolian tugrik", "en": "Mongolian tugrik"}', 'MNT', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(93, 1, '{"ar": "Macanese pataca", "en": "Macanese pataca"}', 'MOP', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(94, 1, '{"ar": "Mauritanian ouguiya", "en": "Mauritanian ouguiya"}', 'MRO', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(95, 1, '{"ar": "Mauritian rupee", "en": "Mauritian rupee"}', 'MUR', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(96, 1, '{"ar": "Maldivian rufiyaa", "en": "Maldivian rufiyaa"}', 'MVR', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(97, 1, '{"ar": "Malawian kwacha", "en": "Malawian kwacha"}', 'MWK', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(98, 1, '{"ar": "Mexican peso", "en": "Mexican peso"}', 'MXN', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(99, 1, '{"ar": "Malaysian ringgit", "en": "Malaysian ringgit"}', 'MYR', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(100, 1, '{"ar": "Mozambican metical", "en": "Mozambican metical"}', 'MZM', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(101, 1, '{"ar": "Namibian dollar", "en": "Namibian dollar"}', 'NAD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(102, 1, '{"ar": "Nigerian naira", "en": "Nigerian naira"}', 'NGN', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(103, 1, '{"ar": "Nicaraguan córdoba", "en": "Nicaraguan córdoba"}', 'NIO', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(104, 1, '{"ar": "Norwegian krone", "en": "Norwegian krone"}', 'NOK', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(105, 1, '{"ar": "Nepalese rupee", "en": "Nepalese rupee"}', 'NPR', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(106, 1, '{"ar": "New Zealand dollar", "en": "New Zealand dollar"}', 'NZD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(107, 1, '{"ar": "Omani rial", "en": "Omani rial"}', 'OMR', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(108, 1, '{"ar": "Panamanian balboa", "en": "Panamanian balboa"}', 'PAB', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(109, 1, '{"ar": "Peruvian nuevo sol", "en": "Peruvian nuevo sol"}', 'PEN', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(110, 1, '{"ar": "Papua New Guinean kina", "en": "Papua New Guinean kina"}', 'PGK', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(111, 1, '{"ar": "Philippine peso", "en": "Philippine peso"}', 'PHP', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(112, 1, '{"ar": "Pakistani rupee", "en": "Pakistani rupee"}', 'PKR', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(113, 1, '{"ar": "Polish zloty", "en": "Polish zloty"}', 'PLN', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(114, 1, '{"ar": "Paraguayan guarani", "en": "Paraguayan guarani"}', 'PYG', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(115, 1, '{"ar": "Qatari riyal", "en": "Qatari riyal"}', 'QAR', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(116, 1, '{"ar": "Romanian leu", "en": "Romanian leu"}', 'RON', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(117, 1, '{"ar": "Serbian dinar", "en": "Serbian dinar"}', 'RSD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(118, 1, '{"ar": "Russian ruble", "en": "Russian ruble"}', 'RUB', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(119, 1, '{"ar": "Saudi riyal", "en": "Saudi riyal"}', 'SAR', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(120, 1, '{"ar": "Solomon Islands dollar", "en": "Solomon Islands dollar"}', 'SBD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(121, 1, '{"ar": "Seychellois rupee", "en": "Seychellois rupee"}', 'SCR', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(122, 1, '{"ar": "Sudanese pound", "en": "Sudanese pound"}', 'SDG', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(123, 1, '{"ar": "Swedish krona", "en": "Swedish krona"}', 'SEK', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(124, 1, '{"ar": "Singapore dollar", "en": "Singapore dollar"}', 'SGD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(125, 1, '{"ar": "Saint Helena pound", "en": "Saint Helena pound"}', 'SHP', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(126, 1, '{"ar": "Sierra Leonean leone", "en": "Sierra Leonean leone"}', 'SLL', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(127, 1, '{"ar": "Somali shilling", "en": "Somali shilling"}', 'SOS', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(128, 1, '{"ar": "Surinamese dollar", "en": "Surinamese dollar"}', 'SRD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(129, 1, '{"ar": "Syrian pound", "en": "Syrian pound"}', 'SYP', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(130, 1, '{"ar": "Swazi lilangeni", "en": "Swazi lilangeni"}', 'SZL', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(131, 1, '{"ar": "Thai baht", "en": "Thai baht"}', 'THB', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(132, 1, '{"ar": "Tajikistani somoni", "en": "Tajikistani somoni"}', 'TJS', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(133, 1, '{"ar": "Turkmen manat", "en": "Turkmen manat"}', 'TMT', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(134, 1, '{"ar": "Tunisian dinar", "en": "Tunisian dinar"}', 'TND', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(135, 1, '{"ar": "Turkish new lira", "en": "Turkish new lira"}', 'TRY', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(136, 1, '{"ar": "Trinidad and Tobago dollar", "en": "Trinidad and Tobago dollar"}', 'TTD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(137, 1, '{"ar": "New Taiwan dollar", "en": "New Taiwan dollar"}', 'TWD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(138, 1, '{"ar": "Tanzanian shilling", "en": "Tanzanian shilling"}', 'TZS', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(139, 1, '{"ar": "Ukrainian hryvnia", "en": "Ukrainian hryvnia"}', 'UAH', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(140, 1, '{"ar": "Ugandan shilling", "en": "Ugandan shilling"}', 'UGX', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(141, 1, '{"ar": "United States dollar", "en": "United States dollar"}', 'USD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(142, 1, '{"ar": "Uruguayan peso", "en": "Uruguayan peso"}', 'UYU', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(143, 1, '{"ar": "Uzbekistani som", "en": "Uzbekistani som"}', 'UZS', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(144, 1, '{"ar": "Venezuelan bolivar", "en": "Venezuelan bolivar"}', 'VEB', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(145, 1, '{"ar": "Vietnamese dong", "en": "Vietnamese dong"}', 'VND', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(146, 1, '{"ar": "Vanuatu vatu", "en": "Vanuatu vatu"}', 'VUV', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(147, 1, '{"ar": "Samoan tala", "en": "Samoan tala"}', 'WST', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(148, 1, '{"ar": "Central African CFA franc", "en": "Central African CFA franc"}', 'XAF', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(149, 1, '{"ar": "East Caribbean dollar", "en": "East Caribbean dollar"}', 'XCD', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(150, 1, '{"ar": "Special Drawing Rights", "en": "Special Drawing Rights"}', 'XDR', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(151, 1, '{"ar": "West African CFA franc", "en": "West African CFA franc"}', 'XOF', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(152, 1, '{"ar": "CFP franc", "en": "CFP franc"}', 'XPF', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(153, 1, '{"ar": "Yemeni rial", "en": "Yemeni rial"}', 'YER', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(154, 1, '{"ar": "South African rand", "en": "South African rand"}', 'ZAR', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(155, 1, '{"ar": "Zambian kwacha", "en": "Zambian kwacha"}', 'ZMK', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL),
	(156, 1, '{"ar": "Zimbabwean dollar", "en": "Zimbabwean dollar"}', 'ZWR', 1, '2020-04-30 22:07:48', '2020-04-30 22:07:48', NULL);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.drivers
CREATE TABLE IF NOT EXISTS `drivers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `drivers_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.drivers: ~0 rows (approximately)
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.emails
CREATE TABLE IF NOT EXISTS `emails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_id` bigint(20) unsigned NOT NULL,
  `content` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emails_email_type_email_id_index` (`email_type`,`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.emails: ~0 rows (approximately)
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.files
CREATE TABLE IF NOT EXISTS `files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `display_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.files: ~0 rows (approximately)
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.images
CREATE TABLE IF NOT EXISTS `images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `image_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_id` bigint(20) unsigned NOT NULL,
  `display_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` double(8,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_image_type_image_id_index` (`image_type`,`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.images: ~0 rows (approximately)
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.inventory_items
CREATE TABLE IF NOT EXISTS `inventory_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock_management` tinyint(1) DEFAULT NULL,
  `returnable` tinyint(1) DEFAULT NULL,
  `taxable` tinyint(1) DEFAULT NULL,
  `salable` tinyint(1) DEFAULT NULL,
  `cost_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usage` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gl_account` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.inventory_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_items` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.languages
CREATE TABLE IF NOT EXISTS `languages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` json DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_rtl` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.languages: ~2 rows (approximately)
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` (`id`, `user_id`, `name`, `locale`, `icon`, `is_rtl`, `is_default`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, '{"ar": "العربية", "en": "Arabic"}', 'ar', '/assets/media/flags/008-saudi-arabia.svg', 1, 1, 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(2, 1, '{"ar": "الانجليزية", "en": "English"}', 'en', '/assets/media/flags/020-flag.svg', 0, 0, 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.migrations: ~41 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_02_26_202816_create_inventory_items_table', 1),
	(2, '2014_10_12_000000_create_users_table', 1),
	(3, '2014_10_12_100000_create_password_resets_table', 1),
	(4, '2019_08_19_000000_create_failed_jobs_table', 1),
	(5, '2019_10_26_220012_create_permission_tables', 1),
	(6, '2019_10_27_103948_create_super_admin_table', 1),
	(7, '2019_10_28_091239_create_constants_table', 1),
	(8, '2019_10_28_091247_create_currencies_table', 1),
	(9, '2019_10_28_091248_create_languages_table', 1),
	(10, '2019_10_28_091249_create_countries_table', 1),
	(11, '2019_10_28_091250_create_cities_table', 1),
	(12, '2019_10_28_091726_create_plans_table', 1),
	(13, '2019_10_28_094101_create_plan_modules_table', 1),
	(14, '2019_10_28_094517_create_plan_offers_table', 1),
	(15, '2019_10_28_095103_create_companies_table', 1),
	(16, '2019_10_28_095440_create_drvier_table', 1),
	(17, '2019_10_28_111248_create_admins_table', 1),
	(18, '2019_10_28_111450_create_company_users_table', 1),
	(19, '2019_10_28_112235_create_plan_upgrades_table', 1),
	(20, '2019_10_28_113529_create_trial_accounts_table', 1),
	(21, '2019_10_29_00000_create_auths_table', 1),
	(22, '2019_10_31_112235_create_plan_offer_price_logs_table', 1),
	(23, '2019_10_31_115546_create_login_logs_table', 1),
	(24, '2019_11_13_065527_update_companies_table_with_new', 1),
	(25, '2019_11_13_094329_create_sms_table', 1),
	(26, '2019_11_13_161217_create_access_code_table', 1),
	(27, '2019_11_14_180820_create_account_table', 1),
	(28, '2019_11_20_095424_create_images_table', 1),
	(29, '2019_11_26_103729_update_companies_table', 1),
	(30, '2019_11_26_104322_alter_accounts_table', 1),
	(31, '2019_12_01_145953_create_plan_interval_prices_table', 1),
	(32, '2019_12_02_213234_create_temp_accounts_table', 1),
	(33, '2019_12_02_214700_create_transactions_table', 1),
	(34, '2019_12_02_222004_create_braintree_table', 1),
	(35, '2019_12_03_091425_create_cashes_table', 1),
	(36, '2019_12_03_094833_create_cheques_table', 1),
	(37, '2019_12_04_110820_create_table_migrations_table', 1),
	(38, '2019_12_04_130836_create_module_migrations_table', 1),
	(39, '2019_12_08_072313_create_emails_table', 1),
	(40, '2019_12_08_125433_create_files_table', 1),
	(41, '2020_01_04_070623_create_jobs_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.model_has_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.model_has_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.module_migrations
CREATE TABLE IF NOT EXISTS `module_migrations` (
  `module_id` bigint(20) unsigned NOT NULL,
  `migration_id` bigint(20) unsigned NOT NULL,
  KEY `module_migrations_module_id_foreign` (`module_id`),
  KEY `module_migrations_migration_id_foreign` (`migration_id`),
  CONSTRAINT `module_migrations_migration_id_foreign` FOREIGN KEY (`migration_id`) REFERENCES `table_migrations` (`id`),
  CONSTRAINT `module_migrations_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `constants` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.module_migrations: ~0 rows (approximately)
/*!40000 ALTER TABLE `module_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_migrations` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.plans
CREATE TABLE IF NOT EXISTS `plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `currency_id` bigint(20) unsigned NOT NULL,
  `level_id` bigint(20) unsigned NOT NULL,
  `title` json NOT NULL,
  `branch_no` int(10) unsigned NOT NULL DEFAULT '0',
  `inventory_no` int(10) unsigned NOT NULL DEFAULT '0',
  `pos_no` int(10) unsigned NOT NULL DEFAULT '0',
  `emp_no` int(10) unsigned NOT NULL DEFAULT '0',
  `item_no` int(10) unsigned NOT NULL DEFAULT '0',
  `max_trail_no` int(10) unsigned NOT NULL DEFAULT '0',
  `interval_trail` int(10) unsigned NOT NULL DEFAULT '0',
  `is_trial` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.plans: ~3 rows (approximately)
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` (`id`, `user_id`, `currency_id`, `level_id`, `title`, `branch_no`, `inventory_no`, `pos_no`, `emp_no`, `item_no`, `max_trail_no`, `interval_trail`, `is_trial`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 148, 1, '{"ar": "خطة مجانية", "en": "Free plan"}', 2, 2, 2, 2, 2, 2, 11, 1, 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(2, 1, 6, 1, '{"ar": "خطة اساسية", "en": "Basic plan"}', 100, 100, 100, 100, 100, 100, 0, 0, 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(3, 1, 61, 1, '{"ar": "خطة متقدمة", "en": "Standard plan"}', 1000, 1000, 1000, 1000, 1000, 1000, 0, 0, 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL);
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.plan_interval_prices
CREATE TABLE IF NOT EXISTS `plan_interval_prices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `interval_id` bigint(20) unsigned NOT NULL,
  `plan_id` bigint(20) unsigned NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT '0.00',
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plan_interval_prices_interval_id_foreign` (`interval_id`),
  KEY `plan_interval_prices_plan_id_foreign` (`plan_id`),
  CONSTRAINT `plan_interval_prices_interval_id_foreign` FOREIGN KEY (`interval_id`) REFERENCES `constants` (`id`),
  CONSTRAINT `plan_interval_prices_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.plan_interval_prices: ~3 rows (approximately)
/*!40000 ALTER TABLE `plan_interval_prices` DISABLE KEYS */;
INSERT INTO `plan_interval_prices` (`id`, `interval_id`, `plan_id`, `price`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 52, 1, 5248.00, 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(2, 50, 2, 950.00, 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL),
	(3, 51, 3, 2039.00, 1, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL);
/*!40000 ALTER TABLE `plan_interval_prices` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.plan_modules
CREATE TABLE IF NOT EXISTS `plan_modules` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `plan_id` bigint(20) unsigned NOT NULL,
  `module_id` bigint(20) unsigned NOT NULL,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plan_modules_user_id_foreign` (`user_id`),
  KEY `plan_modules_plan_id_foreign` (`plan_id`),
  KEY `plan_modules_module_id_foreign` (`module_id`),
  CONSTRAINT `plan_modules_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `constants` (`id`),
  CONSTRAINT `plan_modules_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`),
  CONSTRAINT `plan_modules_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `super_admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.plan_modules: ~0 rows (approximately)
/*!40000 ALTER TABLE `plan_modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_modules` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.plan_offers
CREATE TABLE IF NOT EXISTS `plan_offers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `plan_id` bigint(20) unsigned NOT NULL,
  `title` json NOT NULL,
  `starts_at` date DEFAULT NULL,
  `ends_at` date DEFAULT NULL,
  `discount_percentage_per_year` double NOT NULL,
  `discount_percentage_per_month` double NOT NULL,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plan_offers_user_id_foreign` (`user_id`),
  KEY `plan_offers_plan_id_foreign` (`plan_id`),
  CONSTRAINT `plan_offers_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`),
  CONSTRAINT `plan_offers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `super_admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.plan_offers: ~0 rows (approximately)
/*!40000 ALTER TABLE `plan_offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_offers` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.plan_offer_price_logs
CREATE TABLE IF NOT EXISTS `plan_offer_price_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `currency_id` bigint(20) unsigned NOT NULL,
  `owner_id` int(10) unsigned NOT NULL,
  `model_type` enum('offer','plan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `starts_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plan_offer_price_logs_user_id_foreign` (`user_id`),
  KEY `plan_offer_price_logs_currency_id_foreign` (`currency_id`),
  CONSTRAINT `plan_offer_price_logs_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `plan_offer_price_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `super_admins` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.plan_offer_price_logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `plan_offer_price_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_offer_price_logs` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.plan_upgrades
CREATE TABLE IF NOT EXISTS `plan_upgrades` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `plan_id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `offer_id` int(10) unsigned NOT NULL,
  `is_upgraded` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.plan_upgrades: ~0 rows (approximately)
/*!40000 ALTER TABLE `plan_upgrades` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_upgrades` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.role_has_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.sms
CREATE TABLE IF NOT EXISTS `sms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.sms: ~0 rows (approximately)
/*!40000 ALTER TABLE `sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.super_admins
CREATE TABLE IF NOT EXISTS `super_admins` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '0 => is not active , 1 => active',
  `mobile` int(11) NOT NULL,
  `city_id` bigint(20) unsigned NOT NULL,
  `nationality_id` bigint(20) unsigned NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `super_admins_username_unique` (`username`),
  UNIQUE KEY `super_admins_email_unique` (`email`),
  KEY `super_admins_user_id_foreign` (`user_id`),
  CONSTRAINT `super_admins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `super_admins` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.super_admins: ~1 rows (approximately)
/*!40000 ALTER TABLE `super_admins` DISABLE KEYS */;
INSERT INTO `super_admins` (`id`, `username`, `email`, `password`, `is_active`, `mobile`, `city_id`, `nationality_id`, `address`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `user_id`) VALUES
	(1, 'Super Admin', 'unified.admin@gmail.com', '$2y$10$wtqdI7gUbnbbhM.lCowebOy8VRrkLV8yDwCaV6QF9PM9smNqv1YIC', 1, 12345, 1, 1, 'US', NULL, '2020-04-30 22:07:49', '2020-04-30 22:07:49', NULL, NULL);
/*!40000 ALTER TABLE `super_admins` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.table_migrations
CREATE TABLE IF NOT EXISTS `table_migrations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordered_at` timestamp NULL DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'company',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.table_migrations: ~0 rows (approximately)
/*!40000 ALTER TABLE `table_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_migrations` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.temp_accounts
CREATE TABLE IF NOT EXISTS `temp_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) unsigned NOT NULL,
  `last_payment` date DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_date` date DEFAULT NULL,
  `last_renew_date` date DEFAULT NULL,
  `sub_domain` date DEFAULT NULL,
  `db_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_user` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `db_connection` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 => active, 0 => inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `temp_accounts_company_id_unique` (`company_id`),
  UNIQUE KEY `temp_accounts_email_unique` (`email`),
  CONSTRAINT `temp_accounts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.temp_accounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `temp_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_accounts` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transactionable_id` bigint(20) unsigned NOT NULL,
  `transactionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `company_id` bigint(20) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '0 => error , 1 => success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.transactions: ~0 rows (approximately)
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.trial_accounts
CREATE TABLE IF NOT EXISTS `trial_accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `no_renew` int(10) unsigned NOT NULL,
  `is_transferred` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.trial_accounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `trial_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `trial_accounts` ENABLE KEYS */;

-- Dumping structure for table unified_ideas_sbp.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table unified_ideas_sbp.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
