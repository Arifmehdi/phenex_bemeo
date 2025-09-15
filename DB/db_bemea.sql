-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 14, 2025 at 11:48 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_bemea`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `show_from` timestamp NULL DEFAULT NULL,
  `show_until` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`id`, `title`, `content`, `is_active`, `show_from`, `show_until`, `created_at`, `updated_at`) VALUES
(1, 'asif Tested Ads', '⭐ Boost Your Business with Our Exclusive Membership!\nJoin hundreds of entrepreneurs who are growing faster, smarter, and stronger with our trusted business network.\n\n✅ Professional support\n✅ Industry recognition\n✅ Access to exclusive tools & resources\n✅ Affordable annual plans\n\n🎯 Become a member today — it’s more than just a network, it’s your next big step!\n\n👉 [Join Now] or [Learn More]', 1, '2025-07-12 06:29:01', '2025-07-14 04:29:12', '2025-07-14 00:29:52', '2025-07-14 10:30:33'),
(2, 'Presedent Talk', '⭐ Boost Your Business with Our Exclusive Membership!\nJoin hundreds of entrepreneurs who are growing faster, smarter, and stronger with our trusted business network.\n\n✅ Professional support\n✅ Industry recognition\n✅ Access to exclusive tools & resources\n✅ Affordable annual plans\n\n🎯 Become a member today — it’s more than just a network, it’s your next big step!\n\n👉 [Join Now] or [Learn More]', 1, '2025-07-14 09:24:48', '2025-07-14 12:25:02', '2025-07-14 04:24:36', '2025-07-14 04:25:06');

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tab` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` longtext COLLATE utf8mb4_unicode_ci,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `breezy_sessions`
--

CREATE TABLE `breezy_sessions` (
  `id` bigint UNSIGNED NOT NULL,
  `authenticatable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authenticatable_id` bigint UNSIGNED NOT NULL,
  `panel_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `expires_at` timestamp NULL DEFAULT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bulk_sms_b_d_logs`
--

CREATE TABLE `bulk_sms_b_d_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `response` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bulk_sms_b_d_logs`
--

INSERT INTO `bulk_sms_b_d_logs` (`id`, `to`, `message`, `status`, `response`, `created_at`, `updated_at`) VALUES
(1, '01866370585', 'Your password reset code is: 988868. Use this code to reset your password.', '200', '{\"response_code\":1032,\"success_message\":\"\",\"error_message\":\"Your ip 103.193.73.18 not Whitelisted. Please whitelist ip from Phonebook\"}', '2025-06-13 23:53:09', '2025-06-13 23:53:09'),
(2, '01866370585', 'Bemea OTP is 888465', '200', '{\"response_code\":1032,\"success_message\":\"\",\"error_message\":\"Your ip 103.193.73.18 not Whitelisted. Please whitelist ip from Phonebook\"}', '2025-06-13 23:54:47', '2025-06-13 23:54:47'),
(3, '01866370585', 'Bemea OTP is 728554', '200', '{\"response_code\":1032,\"success_message\":\"\",\"error_message\":\"Your ip 103.193.73.18 not Whitelisted. Please whitelist ip from Phonebook\"}', '2025-06-13 23:58:26', '2025-06-13 23:58:26'),
(4, '01866370585', 'Bemea OTP is 697917', '200', '{\"response_code\":202,\"message_id\":48873689,\"success_message\":\"SMS Submitted Successfully 1\",\"error_message\":\"\"}', '2025-06-14 00:01:12', '2025-06-14 00:01:12'),
(5, '01866370585', 'Bemea OTP is 923832', '200', '{\"response_code\":202,\"message_id\":48874678,\"success_message\":\"SMS Submitted Successfully 1\",\"error_message\":\"\"}', '2025-06-14 00:13:58', '2025-06-14 00:13:58'),
(6, '01866370585', 'Bemea OTP is 994146', '200', '{\"response_code\":202,\"message_id\":48960835,\"success_message\":\"SMS Submitted Successfully 1\",\"error_message\":\"\"}', '2025-06-15 02:02:22', '2025-06-15 02:02:22'),
(7, '01711544994', 'tast msg bangladesh', '200', '{\"response_code\":202,\"message_id\":50588915,\"success_message\":\"SMS Submitted Successfully 1\",\"error_message\":\"\"}', '2025-07-05 01:29:29', '2025-07-05 01:29:29');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificate_requests`
--

CREATE TABLE `certificate_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `director_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nominated_director` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `certificate_fee` decimal(10,2) NOT NULL,
  `receipt_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `year` int NOT NULL,
  `verification_image_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `certificate_collect_date` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `expense_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `donor_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `donor_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BDT',
  `message` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `expense_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `join_deadline` datetime NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_free` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `title`, `description`, `join_deadline`, `image`, `created_at`, `updated_at`, `is_free`) VALUES
(15, 28, 'Bemea Grand Opening', 'This is Bemea grand opening. this time here we go about the disscus ourself and also her add some grettings our members', '2025-07-30 19:00:00', 'event-photo/01JZZ060NEESMPJZGTQA73WV3P.jpg', '2025-07-12 03:41:39', '2025-07-12 03:41:39', 0),
(16, 28, 'Tested Event', 'this is tested event for asif hossain', '2025-07-29 00:00:00', 'event-photo/01JZZ0Q9NDXY72ABDV9209CK6M.jpg', '2025-07-12 03:51:05', '2025-07-12 03:52:36', 0),
(17, 28, 'Tech giant Pro', 'lorem ipsum is a ammet of sheet and this is the main character of use here', '2025-08-05 17:29:31', NULL, '2025-07-12 05:30:14', '2025-07-12 05:30:14', 1),
(18, 28, 'Md asif Hossain', 'this is md asif hossain Event', '2025-08-07 00:00:00', NULL, '2025-07-12 05:32:15', '2025-07-12 05:43:57', 1),
(19, 28, 'Nishan Ahamed vaiya', NULL, '2025-07-17 00:00:00', NULL, '2025-07-12 05:38:07', '2025-07-12 05:38:23', 0);

-- --------------------------------------------------------

--
-- Table structure for table `event_joined_companies`
--

CREATE TABLE `event_joined_companies` (
  `id` bigint UNSIGNED NOT NULL,
  `event_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expense_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_joined_companies`
--

INSERT INTO `event_joined_companies` (`id`, `event_id`, `user_id`, `amount`, `paid`, `created_at`, `updated_at`, `expense_id`) VALUES
(27, 19, 28, '4000.00', 1, '2025-07-12 22:55:54', '2025-07-12 23:58:00', 96),
(28, 18, 28, '0.00', 0, '2025-07-12 23:05:37', '2025-07-12 23:05:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_members`
--

CREATE TABLE `event_members` (
  `id` bigint UNSIGNED NOT NULL,
  `event_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `relation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_joined_company_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_members`
--

INSERT INTO `event_members` (`id`, `event_id`, `user_id`, `relation`, `amount`, `paid`, `approved`, `created_at`, `updated_at`, `name`, `age`, `image`, `event_joined_company_id`) VALUES
(138, 19, 28, 'Neighbor', '2000.00', 0, 1, '2025-07-12 22:55:54', '2025-07-12 22:55:54', 'Alfreda Harvey', 91, NULL, 27),
(139, 19, 28, 'Niece', '2000.00', 0, 1, '2025-07-12 22:55:54', '2025-07-12 22:55:54', 'Nicole Barr', 63, NULL, 27),
(140, 18, 28, 'Mother', '0.00', 0, 0, '2025-07-12 23:05:37', '2025-07-12 23:05:37', 'Sharon Guerra', 62, NULL, 28),
(141, 18, 28, 'Grandmother', '0.00', 0, 0, '2025-07-12 23:05:37', '2025-07-12 23:05:37', 'Imani Munoz', 9, NULL, 28);

-- --------------------------------------------------------

--
-- Table structure for table `event_member_tokens`
--

CREATE TABLE `event_member_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_member_id` bigint UNSIGNED NOT NULL,
  `event_id` bigint UNSIGNED NOT NULL,
  `done_at` timestamp NULL DEFAULT NULL,
  `is_done` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_member_tokens`
--

INSERT INTO `event_member_tokens` (`id`, `name`, `event_member_id`, `event_id`, `done_at`, `is_done`, `created_at`, `updated_at`) VALUES
(25, 'welcome', 139, 19, '2025-07-13 05:45:53', 1, '2025-07-12 23:44:48', '2025-07-12 23:46:09'),
(26, 'welcome', 138, 19, '2025-07-13 05:46:22', 1, '2025-07-12 23:44:48', '2025-07-12 23:46:25');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_category_id` bigint UNSIGNED DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` enum('income','expense') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `note` text COLLATE utf8mb4_unicode_ci,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `date`, `category`, `expense_category_id`, `amount`, `type`, `is_verified`, `note`, `images`, `created_at`, `updated_at`) VALUES
(92, '2025-07-02 23:45:23', 'membership', 1, '30000.00', 'income', 0, 'membership id 0100', NULL, '2025-07-02 23:45:23', '2025-07-02 23:45:23'),
(93, '2025-07-04 05:21:40', 'event', 1, '3000.00', 'income', 0, 'Event payment ( picnic 2026  ). membership id 0120', '[\"event\\/payment_photos\\/xJisTdIaxjfXDtf7ZWnL1mvud3IqhoLf36GFlOWS.jpg\"]', '2025-07-04 05:21:40', '2025-07-04 05:21:40'),
(94, '2025-07-04 05:32:45', 'event', 1, '2000.00', 'income', 1, 'Event payment (  ). membership id 0120', '[\"event\\/payment_photos\\/GPpgLfoy3XTxfNAn7OzrNz4ZZiXkll2ZquGFbzwW.jpg\"]', '2025-07-04 05:32:45', '2025-07-04 05:33:04'),
(95, '2025-07-07 03:33:50', 'membership', 1, '14000.00', 'income', 0, 'membership id 0142', NULL, '2025-07-07 03:33:50', '2025-07-07 03:33:50'),
(96, '2025-07-12 23:58:00', 'event', 2, '4000.00', 'income', 1, 'Event payment (Nishan Ahamed vaiya). membership id 0800395', '[\"event\\/payment_photos\\/alhbtohGWZ7HmDjo4wf55bdSD8SA9Dqwl9z8hHYJ.jpg\"]', '2025-07-12 23:58:00', '2025-07-12 23:59:21'),
(97, '2025-07-14 18:00:00', NULL, 1, '500.00', 'expense', 0, NULL, '[]', '2025-07-13 22:36:51', '2025-07-13 22:36:51'),
(98, '2025-07-14 01:12:39', 'membership', NULL, '25000.00', 'income', 0, 'membership id 0165', '[\"membership\\/payment_photos\\/iFS3G8U7ksW2fREGjaZX5C8p1dfa9E7rw0JFK6Tn.jpg\"]', '2025-07-14 01:12:39', '2025-07-14 01:12:39');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Current Bill', 1, '2025-07-13 05:58:57', '2025-07-13 05:58:57'),
(2, 'House Rent', 1, '2025-07-13 06:48:55', '2025-07-13 06:48:55');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fblog_categories`
--

CREATE TABLE `fblog_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fblog_category_fblog_post`
--

CREATE TABLE `fblog_category_fblog_post` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fblog_comments`
--

CREATE TABLE `fblog_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `approved_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fblog_news_letters`
--

CREATE TABLE `fblog_news_letters` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscribed` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fblog_posts`
--

CREATE TABLE `fblog_posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('published','scheduled','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `published_at` datetime DEFAULT NULL,
  `scheduled_for` datetime DEFAULT NULL,
  `cover_photo_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_alt_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fblog_post_fblog_tag`
--

CREATE TABLE `fblog_post_fblog_tag` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `tag_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fblog_seo_details`
--

CREATE TABLE `fblog_seo_details` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `fblog_settings`
--

CREATE TABLE `fblog_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(155) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_console_code` tinytext COLLATE utf8mb4_unicode_ci,
  `google_analytic_code` text COLLATE utf8mb4_unicode_ci,
  `google_adsense_code` tinytext COLLATE utf8mb4_unicode_ci,
  `quick_links` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `fblog_share_snippets`
--

CREATE TABLE `fblog_share_snippets` (
  `id` bigint UNSIGNED NOT NULL,
  `script_code` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fblog_tags`
--

CREATE TABLE `fblog_tags` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(155) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desired_position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cv_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_applications`
--

INSERT INTO `job_applications` (`id`, `name`, `email`, `phone`, `desired_position`, `cv_path`, `photo_path`, `is_active`, `message`, `location`, `created_at`, `updated_at`) VALUES
(1, 'Gary Meyers', 'gamod@mailinator.com', '+1 (969) 449-1167', 'Quasi quia deleniti', 'job_applications/cvs/AheiU9IGiuvfgHuFuOcOBlyUz0FOXHn6fVtWJ3Uy.pdf', 'job_applications/photos/9Njk3X2t4PjaZsT9x2Uv8NOhnp5OvoxBeFTidVHe.png', 1, 'Voluptas sint aut co', 'Dolores adipisci at', '2025-05-31 05:21:50', '2025-05-31 05:48:23'),
(2, 'Easin Khan Santo', 'contact.easinkhan@gmail.com', '01650249322', 'Anim unde dicta laudantium incididunt perspiciatis dolorum accusamus reiciendis do', 'job_applications/cvs/01JWK2JRJ4RNX8NE6693HQ88RC.pdf', 'job_applications/photos/01JWK2JRJ58993SKYV484B245T.png', 1, 'Anim unde dicta laudantium incididunt perspiciatis dolorum accusamus reiciendis do culpa consectetur fuga Sequi consequuntur possimus amet non Anim unde dicta laudantium incididunt perspiciatis dolorum accusamus reiciendis do culpa consectetur fuga Sequi ', NULL, '2025-05-31 05:45:35', '2025-05-31 05:48:13'),
(3, 'Rashad Gutierrez', 'cewysup@mailinator.com', '+1 (419) 937-4303', 'Laudantium elit au', 'job_applications/cvs/qGdQmkyJ6WJ9AxgAIUCRKUtsmTqgPZrUe9kTBElE.pdf', 'job_applications/photos/MSeEq58fQ7UCmkipVxo9wwP81kR0z0yrfuYFqRXZ.jpg', 1, 'Molestiae excepteur', 'Aut fuga Consequatu', '2025-05-31 05:55:30', '2025-05-31 05:56:04'),
(4, 'Md raja Khan', 'mdrajakhan1064@gmail.com', '01866370585', 'how to', 'job_applications/cvs/KJvJhHPLVux9c1TYJw4dmJwnP1b4spNX3pm9jHYU.pdf', 'job_applications/photos/0SFbL48GoOW2UcqL0qmHhRIqSZzHHdhdN5lYHXsJ.jpg', 0, 'test', 'public_html', '2025-06-14 06:00:19', '2025-06-14 06:00:19'),
(5, 'momen khan', 'embroiderybd@gmail.com', '01711544994', 'designer', 'job_applications/cvs/EWh7kcwmOhSbynMKQ00xWWHzVMWNUyEeTKJnawgq.docx', 'job_applications/photos/3oxEOHQIbayZCxcumoI1h04sAdhBLgJuwkzVqOC1.png', 1, 'hgdhgllks', 'uttara', '2025-06-22 22:32:53', '2025-06-22 22:33:48'),
(6, 'Asif', 'asif@gmail.com', '01758040074', 'Developer', 'job_applications/cvs/UoblWxuFvmu0go5v4k6ukRFuSgJtHkuwl2v7UlBQ.pdf', 'job_applications/photos/3Wz6phIrrtWIzZH9bcPqcNIZkyKWit9981bXHXsU.jpg', 1, 'dear sir. i wanna fuck this office', 'Modhubag road', '2025-07-13 02:59:43', '2025-07-13 03:13:00');

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE `memberships` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `membership_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_type` enum('Limited Company','Proprietorship','Foreign Joint Venture') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `director_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominated_director` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` enum('Male','Female') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `membership_fee` decimal(10,2) DEFAULT NULL,
  `due_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `machine_count` int DEFAULT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_head` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `needle_colors` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yearly_subscription` decimal(10,2) DEFAULT NULL,
  `discount` decimal(20,2) DEFAULT NULL,
  `advance_amount` decimal(20,2) DEFAULT NULL,
  `receipt_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_year` int DEFAULT NULL,
  `sister_concerns` text COLLATE utf8mb4_unicode_ci,
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `nomination_certificate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trade_license` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `factory_photos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `director_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `membership_expire_date` timestamp NULL DEFAULT NULL,
  `expense_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `existing_member` tinyint(1) NOT NULL DEFAULT '0'
) ;

--
-- Dumping data for table `memberships`
--

INSERT INTO `memberships` (`id`, `user_id`, `membership_id`, `company_name`, `company_type`, `director_name`, `nominated_director`, `address`, `telephone`, `phone`, `email`, `gender`, `membership_fee`, `due_amount`, `machine_count`, `brand`, `total_head`, `needle_colors`, `yearly_subscription`, `discount`, `advance_amount`, `receipt_no`, `payment_date`, `payment_year`, `sister_concerns`, `remarks`, `nomination_certificate`, `trade_license`, `factory_photos`, `director_photo`, `is_active`, `membership_expire_date`, `expense_id`, `created_at`, `updated_at`, `existing_member`) VALUES
(75, 28, '0800395', 'Asha Design Maker', 'Proprietorship', 'Md Sarif Uddin Khan Momen', NULL, 'jongua, belabo, narsingdi, dhaka', '01711544994', '01711544994', 'embroiderybd@gmail.com', 'Male', '5000.00', '4000.00', 2, 'selhq', '40', '9', '2000.00', NULL, NULL, NULL, '2025-06-19', 1, 'asha group', NULL, NULL, 'membership/documents/8wD2IdWpO6bWiWInx6hY7MliSymCSLHWZG7ZeuIM.png', '[]', 'membership/photos/jIeOwb7fDq5ZAljd2HpcwcrhGprDTmeempM4JTwE.png', 1, '2025-07-30 18:00:00', NULL, '2025-06-19 06:11:33', '2025-07-08 01:01:17', 1),
(78, 84, '1400690', 'A K Fashion', 'Proprietorship', 'Abdullah Al Kamrul Hasan', NULL, 'House-2/I/3, Golden Street Ring Raod, Shaymoli, Adabor, Dhaka-1207.', NULL, '01727719507', 'kamrulbdctg@yahoo.com', 'Male', '5000.00', '19800.00', 3, 'Tajima, Tajin, & Grate', '46', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/oWdWb6BzCsYU1iANVHIJLm3Pp28XgSQtCHPiJzf7.jpg', '[]', 'membership/photos/qCI8GKXJLORSj3tL7hlE1H49WNxFvCcXjDanav6S.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-22 05:01:51', '2025-07-07 01:52:07', 1),
(79, 83, '1700749', 'A Boutiques Fashion', 'Proprietorship', 'Md. Abdul Hannan (Jashim)', NULL, 'Building No-03, Shop No-116/117 Chadni Chalk Shopping Complex 4th Floor, Dhaka-1205.', NULL, '01751863881', 'sajboutiques@gmail.com', 'Male', '5000.00', '14000.00', 4, 'Zhanyi & Atowin', '66', '06 & 09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/PKXT2VzxLeMrhrapA1OOCfrbtCUUTgEmurzwaieL.jpg', '[]', 'membership/photos/8lk0TCD0zTFEYCl4I0OZz3YTCBsHo68hhPzMKfL7.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-22 05:05:31', '2025-07-07 01:50:20', 1),
(81, 88, '1400674', 'A R Embroidery and Design Ltd.', 'Limited Company', 'Md. Shafiullah Mian', NULL, 'Ahad Nagar, Baipail, Kaichabari Road Ganakbari, Ashulia, Savar, Dhaka-1349', NULL, '01611613151', 'arfashionsnembroidery@gmail.com', 'Male', '10000.00', '55000.00', 12, 'Barudan & Sunstar', '240', '09', '10000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/W1fPTyFlmgeTEkjz5m64aM7c6jZ26mpmyaMkopjF.jpg', '[]', 'membership/photos/01JZMCBQGWJVPHZP4VBXFE1HB2.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-23 04:29:51', '2025-07-08 00:42:51', 1),
(83, 90, '1400646', 'A.R Corporation', 'Proprietorship', 'Md. Abdul Awal (Azgor)', NULL, 'House-2/C/3, Golden Street, Ring Road Shaymoli, Adabor, Dhaka-1207', NULL, '01615400306', 'arcorporation306@gmail.com', 'Male', '5000.00', '18000.00', 4, 'Autowin, Tajin, Tajima & Jintel', '60', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/oCAFOdVJBRz8llUnmUUgygnVqCTGSwoy6I8x58RW.jpg', '[]', 'membership/photos/0raF90kJBlpCiryD4iWrRtSKLIYfQ6Zn1xZTpdPT.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-23 04:57:33', '2025-07-07 23:32:57', 1),
(84, 91, '1900799', 'A.S Embroidery and Fashion', 'Proprietorship', 'Abdus Sattar', NULL, 'Kumkumari (Near Charabag Madrasha) Ashulia, Savar, Dhaka.', NULL, '01995109131', 'asembroidery69@gmail.com', 'Male', '5000.00', '10000.00', 3, 'Toper', '45', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/6GIc5tJ4btjfsQdeIA3IHfn2tRY906H7H5BlZDCt.jpg', '[]', 'membership/photos/Du5ofLuFFYVfHp2U0Kqxd5wt7QvrYfYiKtq8NEUu.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-23 05:03:51', '2025-07-07 01:40:30', 1),
(85, 92, '1900801', 'Aarian Enterprise', 'Proprietorship', 'Alauddin Miah Mahin', NULL, 'House # ka/1, Road # 11, Nikunja-02, Khilkhet, Dhaka-1229', NULL, '01730900785', 'hightechparts1@gmail.com', 'Male', '5000.00', '10000.00', 3, 'Hightech & HTM', '48', '06 & 09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/5pTjHz8DGK5Cc8qltWlp0zA2nzC7OlMXxJvEmszB.jpg', '[]', 'membership/photos/01JZHY3W3YVTWF8CHP4GHR1XR0.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-23 05:18:26', '2025-07-07 01:55:24', 1),
(86, 93, '1800762', 'Abrar Fashion Ltd.', 'Limited Company', 'Md. AB. Alim Miah', NULL, '26/1, Mogorkhal National University Gazipur Sadar, Gazipur', NULL, '01973245755', 'alim@abrarfashionltd.com', 'Male', '10000.00', '0.00', 12, 'Tajima & rechpeach', '195', '06 & 09', '10000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/5jIfDqwLvhT32Qg9a2DsjKsKfMcxXkbGdBTTBcvk.jpg', '[]', 'membership/photos/oOFCGLIeV25KhrimsACKppuqAIsSSzewNjzmp1nI.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-23 05:26:56', '2025-07-07 01:36:06', 1),
(87, 94, '1800764', 'Afraa Fashion', 'Proprietorship', 'Md. Anowar Hossain', NULL, 'Hindu Bari Moor, board Bazar National University, Gazipur, Sadar, Gazipur', NULL, '01911061615', 'anowar_rmp@yahoo.com', 'Male', '5000.00', '12000.00', 4, 'TFI Portugal, Saffi', '120', '06 & 09', '2000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/Zg65hctz1BRUWwRoXr5tvSBIxPy6UM3VU3hmToWa.jpg', '[]', 'membership/photos/Lu8gvZlQqVIOa4U6cAzn3RFImKkr8Jdckv3tYEza.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-23 05:47:17', '2025-07-07 01:34:49', 1),
(88, 99, '1000507', 'AHP Printing Limited', 'Limited Company', 'Golam Hafiz Chowdhury', NULL, '1615/1, Shahid Siddique Road South Khailkur, National Uniersity, Gazipur.', NULL, '01819237324', 'ahpprinting@gmaili.com', 'Male', '10000.00', '6000.00', 4, 'Richpeace & Sanming', '92', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/cDRe6fgb8PkxHDNTuXt2qkJT21WsOvdcSABVtKFr.jpg', '[]', 'membership/photos/96SCquij3BNFmqJO2sGxRlvWYOSNAwynsqkWB5L7.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-25 02:56:05', '2025-07-07 01:32:55', 1),
(89, 100, '1200555', 'Al-Araf Embroidery', 'Proprietorship', 'Md. Ashraf Hossain', NULL, 'House:712/22/E, Baitul Aman Housing Society, Road:10, Adabor, Dhaka-1207', NULL, '01911444657', 'apparelalaraf@yahoo.com', 'Male', '5000.00', '14000.00', 4, 'Autowin', '59', '06 & 09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/GHJlUraRo8KezRJsCxQsvvjChGzIa8I9feC8ymAG.jpg', '[]', 'membership/photos/DF7qr3zQUnu051PFCN0Br2Q6ZBXbQBgSKPGL3CC4.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-25 03:02:06', '2025-07-07 23:31:43', 0),
(90, 101, '1400658', 'Al-Baraka Embroidery Fashion', 'Proprietorship', 'Md. Mohi Uddin', NULL, 'House-74, Road-11, Munsurabad Housing Society, Adabor, Dhaka-1207.', NULL, '01763672259', 'albaraka@yahoo.com', 'Male', '5000.00', '14000.00', 3, 'China', '60', '06 & 09', '2000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/XwA58CMvZUOgZfN94HanD3J1YXjFpyb9TKuNmOdq.jpg', '[]', 'membership/photos/lBtdsiwyGGiCtmc6iYy4ZHYDzEXjxI1K6RMbZOKH.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-25 03:22:37', '2025-07-07 01:18:19', 1),
(91, 102, '1200626', 'Alyea Embroidery', 'Proprietorship', 'Md. Abdul Alim', NULL, 'House-808, Iqbal Bhaban Nishad Nagar, Dhour, Turag Uttara, Dhaka-1230.', NULL, '01711943856', 'alim@alyeabd.com', 'Male', '5000.00', '40000.00', 9, 'Tajima, Tajin, & China', '500', '09', '5000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/ExNOmmwm2KdD3BcpaPKyo9jhSkCOH0Gr40yeTqH0.jpg', '[]', 'membership/photos/AwzSLopED21vq4UuS6X7dwub8dScvRFpx7yhtlau.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-25 03:34:53', '2025-07-07 01:16:47', 1),
(94, 118, '0800390', 'Alif Embroidery Village Ltd.', 'Limited Company', 'Al Haj Mohammad Akter Hossain', NULL, 'Bangabandhu Road, Tonga Bari, Ashulia, Savar, Dhaka.', NULL, '01711592333', 'rana@aliflammim-bd.com', 'Male', '10000.00', '0.00', 150, 'Tajima, Tang, Sunsatr & Jintel', '2250', '09 For Flat & 4 Color Sequine', '10000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/XLRr7uME4ENC8uIBhrWjYZFAnqnvAZxgdG3E7HC8.jpg', '[]', 'membership/photos/01JZDE4HH28PSCVM91R8M2QR9T.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-28 22:37:34', '2025-07-05 07:59:11', 1),
(95, 119, '0900468', 'Alif Fashion', 'Proprietorship', 'Mohammad Tunjilur Rahman', NULL, 'House-42, Road-05, Sector-10 Uttara, Dhaka-1230.', NULL, '01720068341', 'aliffashion.50@gmail.com', 'Male', '5000.00', '5000.00', 4, 'Sunstar & China', '65', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01JZ5E3Q1EKWMM64G7QG3RKMVV.png', '[]', 'membership/photos/01JZ5E3Q1GSGEZRYCM2YMP6JJ3.png', 1, '2023-06-29 18:00:00', NULL, '2025-06-28 22:42:55', '2025-07-02 05:24:49', 0),
(96, 120, '1400684', 'Alif Stitches Embroidery', 'Proprietorship', 'Md. Tohidul Islam Mazumder (Sujan)', NULL, 'Holding- 94, Ward-08, Road-07, Block-A, Area kakob (Khaya Ghat)07 No, Birulia Savar, Dhaka', NULL, '01916808626', 'alifstitchesemb@gmail.com', 'Male', '5000.00', '18000.00', 4, 'Tajima & Sunstar', '86', '06 & 09', '2000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01JZ5EMCFHYECGWKN01VA1BJVR.png', '[]', 'membership/photos/01JZ5EMCFKNXZDYYDT29K69YVA.png', 1, '2016-12-30 18:00:00', NULL, '2025-06-28 22:53:37', '2025-07-02 05:33:55', 0),
(97, 121, '0500225', 'Alma Fashion', 'Proprietorship', 'Sheik M.A Wahid', NULL, '726/20/C Baitul Aman Housing Society Road-10, Adabor, Dhaka-1207', NULL, '01715072072', 'almafashionbd@yahoo.com', 'Male', '5000.00', '0.00', 3, 'Jintel, MTI & Hiking', '60', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01JZ5GH786E1RZFD1QA3Q2M50H.png', '[]', 'membership/photos/01JZ5GH78835AGRX6VGMWKMV9B.png', 1, '2025-12-30 18:00:00', NULL, '2025-06-28 22:57:46', '2025-07-02 06:07:08', 0),
(98, 122, '1200567', 'Al-Madina Embroidery', 'Proprietorship', 'Md. Mahabubul Kabir (Liton)', NULL, 'House-18, Block-F, Johuri Mohallha Mosque Market(1st Floor) Mohammadpur, Dhaka-1207', NULL, '01550552329', 'liton@087gmail.com', 'Male', '5000.00', '23000.00', 4, 'Autowin', '60', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/EeHT7Hu4EckzbfC02Le7BCU5Wf4pz3vYyH1OG2fV.jpg', '[]', 'membership/photos/01JZHVRKGDDV2JJ8S1J4ZDA2P0.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-28 23:05:40', '2025-07-07 01:14:18', 1),
(99, 123, '1900790', 'Al-Salim Trading', 'Proprietorship', 'Md. Al-Salim', NULL, '1794 Modinabag, Donia, Kadhamtoli, Dhaka-1236.', NULL, '01819116881', 'alsalimtrading1982@gmail.com', 'Male', '5000.00', '0.00', 2, 'Ari', '30', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/c6hw19248mu5hCaPQ5dmM41jzrtVIsfVd8hulJWt.jpg', '[]', 'membership/photos/oZRxcnCBuimF1SrE5l2BV1NEygCYTAVcKY94osRf.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-28 23:17:11', '2025-07-02 04:38:14', 0),
(101, 134, '0500214', 'Ultra Embroidery Ltd.', 'Limited Company', 'Md. Sharif Hossain Khan', NULL, 'Plot-381-383, Block-B, Bashundhara Project, Gazirchat, Ashulia, Savar, Dhaka.', NULL, '01726787870', 'sharifhossain.ultra@gmail.com', 'Male', '10000.00', '0.00', 28, 'Barudan & Sunstar', '560', '09', '10000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/SuQxlpRidEBD6qZ2jln4sSMWs6i3cSuLufq1WzyJ.jpg', '[]', 'membership/photos/oy8AhZv836AVN2xBreJRTJkFcuvRykevOC11cN6y.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-02 23:31:21', '2025-07-05 07:54:28', 1),
(102, 135, '010036', 'Masud Corporation', 'Proprietorship', 'Md. Shamsul Islam Masud', NULL, 'Bangla Bazar, Narshinhapur, Ashulia, Savar, Dhaka.', NULL, '01711533132', 'masudfm2010@gmail.com', 'Male', '5000.00', '4000.00', 9, 'Tajima, Sunstar & Tajin', '180', '09', '5000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/eoSdrTwCjBAHa9ukislU2uLm3cnijPyTSSUvfClO.jpg', '[]', 'membership/photos/FFxz2wYvBWSh7YORC7Et63W2ZIcJUXL7gOwrAbpt.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-02 23:43:32', '2025-07-05 07:52:32', 1),
(103, 136, '0800454', 'Anam Clothing Ltd.', 'Limited Company', 'A.R.M Shahidul Haque Apu', NULL, '110 Khortoil. Sataish Road, Gazipur Tongi, Gazipur.', NULL, '01713032990', 'apu@acl.bdrmg.com', 'Male', '10000.00', '0.00', 27, 'Barudan Sunstar & Tang', '516', '09', '10000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/8kNb4iJtO2KAqLNfymjKLeLy2d4XckOCu9IQmjc5.jpg', '[]', 'membership/photos/fIACa84txHuKwnIwfCVz0J2qGbQkQ3Jq8FuqkO7W.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-02 23:56:41', '2025-07-05 07:32:00', 1),
(104, 137, '1200610', 'Monpura Embroidery', 'Proprietorship', 'Md. Anwar Hossain', NULL, '448, Satarkul Road, Uttar Badda, Badda, Dhaka-1212.', NULL, '01918444222', 'monpuraembroidery@gmail.com', 'Male', '10000.00', '0.00', 6, 'Ricoma, Platinum', '120', '06 & 09', '5000.00', NULL, NULL, NULL, '2026-12-31', 2, 'Monpura Group', NULL, NULL, 'membership/documents/ikJdXC8lIlocMNwDvJRexHQ6kKEhu22JNKKEV1vm.jpg', '[]', 'membership/photos/kG7aLjKIcJVeYnjO1GpjIwcv0UO4H0x5XeqzvT83.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-03 00:40:12', '2025-07-03 01:42:35', 1),
(105, 138, '1000481', 'Pritom Fashion Wears', 'Proprietorship', 'Md. Khijir Chowdhury', NULL, 'Yearpur, Zirabo, Ashulia, Dhaka.', NULL, '01912324010, 0171152', 'pritomtradecorp@gmail.com', 'Male', '5000.00', '0.00', 20, 'Tajima, Sunstar, Feiyue & Autoking', '320', '06 & 09', '10000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/JpJcuzqMy45joZRj03mcgbE00k04Ouq9Moz2aW6k.jpg', '[]', 'membership/photos/9iPdClwbVx3tWjnw8EElQDSaHBxXfGt21qCjAeQ7.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 01:10:05', '2025-07-03 01:29:01', 1),
(106, 139, '1500707', 'Needle Craft Embroidery', 'Proprietorship', 'Md. Muksedur Rahman Abir', NULL, '339/B, Tejgaon I/A, Dhaka.', NULL, '01751624818', 'nc_embroidery@yahoo.com', 'Male', '5000.00', '2000.00', 3, 'Sunstar', '60', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/W6jr3P6JFIPbSdBtWqiaD52iMkdCkaELswFyfhd2.jpg', '[]', 'membership/photos/YKwEC7oCu7tMcnkCD5sm7ThmuEacwj2Zwncnfb91.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 01:15:12', '2025-07-03 01:25:20', 1),
(107, 140, '0600252', 'M.S Fashion', 'Proprietorship', 'A.T.M. Mostaen Billah', NULL, '158 Elephant Road, Hatirpool Dhanmondi, Dhaka-1205.', NULL, '01919239204', 'atmbillah@yahoo.com', 'Male', '5000.00', '0.00', 2, 'ZSK & Shangming', '40', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/7UNeaznARh9QwBcOn8SDP3ZVwI73jb3xivA7MJNb.jpg', '[]', 'membership/photos/OIAN6TwGXhdEV7IBAN4WDETeHVFrFyJxCyaWGSVM.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 01:34:30', '2025-07-05 07:30:59', 1),
(108, 141, '1800766', 'M M Fashion', 'Proprietorship', 'Md. Monir Ahmed', NULL, 'Plot-43, Block-A, Jahangir Alam Lane Sunibir Housing, Adabor, Dhaka-1207.', NULL, '01711529229', 'mtibd2@gmail.com', 'Male', '5000.00', '0.00', 7, 'MTI', '104', '06 & 09', '5000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/ABFOEXYLJbj2ZQW9hv4lPrElzJa4HCkwyI3PDJRA.jpg', '[]', 'membership/photos/Lgs8VjDAhtCpdOetOwwG50ZfmXQYGKGcUy58SwRQ.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 01:41:03', '2025-07-03 01:44:59', 1),
(109, 142, '2200848', 'Vision Interlining Ltd.', 'Limited Company', 'Md. Ruhul Amin', NULL, 'Boroibari, Borabo, Sonargaon, Narayanganj & Extended- 213, Hatipara, Tarabo, Rupganj, Narayanganj.', NULL, '01713028146', 'visiontradeint@yahoo.com', 'Male', '10000.00', '0.00', 6, 'China', '140', '06 & 09', '5000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/tDLbvyHHWUhATSJiJlTjh1arlpiv0AAYszAiAdvO.jpg', '[]', 'membership/photos/Ga9493gLAcS0t79TiQG9Zw1tsaOPdicTEg6WjK6Z.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 01:50:20', '2025-07-05 07:28:58', 1),
(111, 143, '1000498', 'Rasel Colour Stitch Zone', 'Proprietorship', 'Md. Rasel Sheikh', NULL, 'House-14, Bolck-C, Woard-53, Sector-10, Ranavola Main Road, Turag, Uttara, Dhaka-1230.', NULL, '01711609612', 'r_embro@yahoo.com', 'Male', '5000.00', '0.00', 36, 'Tajima, Barudan & Sunstar', '720', '09', '10000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/t82juojG7PZl3QNTSqDIlqnYaul9SQFnMsjtGEkM.jpg', '[]', 'membership/photos/cY9CDiy7i8qLeluf7RzCK025hyIID6pdoHWSYAEz.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 02:13:21', '2025-07-05 07:23:04', 1),
(112, 144, '1200575', 'Bright Embroidery', 'Proprietorship', 'Md. Delowar Hossan Ansary', NULL, 'House-02, Road-10, Ibnasina Brothers Housing Society, Adabor, Dhaka-1207.', NULL, '01912780935', 'brightembroidery35@gmail.com', 'Male', '5000.00', '2000.00', 3, 'Autowin, TCL', '60', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/XcTuVD6afuk0yymvScJLfl0Rdob0lPvjgZn3M52T.jpg', '[]', 'membership/photos/8tNmWzC030syfuqu6dP6gMHZxrARxISc1hpPDyYk.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 02:40:23', '2025-07-05 07:19:56', 1),
(113, 145, '2400942', 'S.S Fashion', 'Proprietorship', 'Md. Ataul Goni', NULL, 'House-73/74/A, Road-10/A, Monsurabad Housing, Adabor-1207', NULL, '01715658488', 'ssfashion2012@yahoo.com', 'Male', '5000.00', '0.00', 4, 'Autowin', '80', '06 & 09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/f6OmXwngbrhhqZKFPXbt1jngushC2PoEbNQ7NeQj.jpg', '[]', 'membership/photos/jDEqGH9yiv4Kj9K2Gt9ylcz2wIbEh6OfDSzbPoJV.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 03:29:44', '2025-07-05 07:18:04', 1),
(114, 146, '2200850', 'Dhaka Needle Crafts', 'Proprietorship', 'Md. Abdulllah Al-Mamun', NULL, 'House-262/2 Road-1, Baitul Aman H/S, Adabor, Dhaka-1207.', NULL, '01713009206', 'mamamun73@gmail.com', 'Male', '5000.00', '0.00', 4, 'Norththonex', '85', '06 & 09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/bqToAk00HEMs0t4yUNkJs8M6Tx9LQn72I1jVt4dq.jpg', '[]', 'membership/photos/yyhrrtROt4hojoY7ML6ON2j0jdX6fAc3kzHYmcgL.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 03:34:40', '2025-07-05 07:16:54', 1),
(115, 147, '1900792', 'Razim Fashion', 'Proprietorship', 'Md. Sanjil Hossain', NULL, 'Holding-277/C, Block-C, Khilgaon, Dhaka.', NULL, '01788938390', 'razimemb@yahoo.com', 'Male', '5000.00', '0.00', 9, 'Tajima , Autowin & Shumxin', '160', '09', '5000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/GMI5IutASVGl7YE3t2zPjom2IuE6VeSyVkKndrhk.jpg', '[]', 'membership/photos/GM0IfdBNdn3ik2nVdQhGSvVYZngwo2mRNJ2t0YVO.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 03:40:40', '2025-07-05 07:14:54', 1),
(116, 148, '1400685', 'Sui Suta Embroidery', 'Proprietorship', 'Md. Sharif Ullah Bapu', NULL, 'House-74/ka/6, Section-11, Polash Nagar, Mirpur, Dhaka.', NULL, '01965300600', 'mdsharifullah.suisuta@gmail.com', 'Male', '5000.00', '0.00', 4, 'Texem', '80', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/9PkY01HmoLXrbNCHOJGmswHqH0OVNZFqKZvQCRzR.jpg', '[]', 'membership/photos/bOnOGQp6UbRMdyy9PD2fRoFnpFPsFU5NecF1H61b.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 03:44:50', '2025-07-05 07:13:46', 1),
(117, 149, '0700321', 'G U Embroidery', 'Proprietorship', 'Md. Main Uddin Khan', NULL, 'House-16, Block-B, Road-6, Dhalipara, Turag, Dhaka-1230.', NULL, '01330803744', 'mainuddinkhan46@yahoo.com', 'Male', '5000.00', '0.00', 6, 'RNP', '120', '09', '5000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/kORLVtHq260z8WIyMYJhwSgoip1UPn3mIhDAn4FG.jpg', '[]', 'membership/photos/mn6mCIO98PlaZxxYofwQtTua8Zq7LUVuDUQhDdav.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 03:48:46', '2025-07-05 07:11:10', 1),
(118, 150, '1800771', 'Hafsa T F I Embroidery', 'Proprietorship', 'Mohammad Nura Alam Sarker', NULL, 'Holding-2005, Uttar Kahn, Mazar Para, Uttar khan, Dhaka-1230.', NULL, '01714466049', 'hafsa_trd@yahoo.com', 'Male', '5000.00', '0.00', 9, 'China', '75', '09', '5000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/FHa8yidEG8yDJCjUdiPDolGhV5ky7bEXuWG3jTgf.jpg', '[]', 'membership/photos/4upNe9ui7qLojutPJafS6hb4DR6G0rseZKHV6c62.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 04:15:33', '2025-07-05 07:08:25', 1),
(119, 133, '1400661', 'Stitch & Color Technology', 'Proprietorship', 'Shahnawaz Chowdhury', NULL, 'Akran, Aithor, Birulia, Savar, Dhaka', NULL, '01919214333', 'nafgroup@dhaka.net', 'Male', '10000.00', '0.00', 18, 'Tajima', '270', '09', '10000.00', NULL, NULL, NULL, '2025-12-31', 2, 'Naf Group', NULL, NULL, 'membership/documents/W4OCm2Xo4MOGqSR4rrY3G1zT7Gxe6sAyoT1fdDdb.jpg', '[]', 'membership/photos/6MNuX6W6IkY5nLIQh4pnPJNuNAYtZvyOzjPeX2Ek.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 04:29:13', '2025-07-05 07:02:25', 1),
(121, 161, '0800413', 'Abir Fashion', 'Proprietorship', 'Md. Mustafizur Rahmab (Jahir)', NULL, 'House: 5/G, Road-13, Monsurabad Housing Soceity Shemoli Adabor Dhaka-1207', NULL, '01815440629', 'abirfashion128@gmail.com', 'Male', '5000.00', '5000.00', 9, 'MTI, Autowin & Autokings', '348', '09', '5000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/4weAQZPhUzrnkpLhfv7Fc6f9P68iFp5XNcp5ipL3.jpg', '[]', 'membership/photos/T6CVPw0pcCqPCWX6WTgGeTEK4euruYZNJARbvYkg.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-06 22:24:00', '2025-07-07 00:48:21', 1),
(122, 162, '0700291', 'Ahsan Embroidery Pvt. Ltd.', 'Limited Company', 'Ahsan Habib Chowdhury', NULL, 'House #14, Road no: 07, Sector-03, Uttara, Dhaka-1230.', '0700293', '01713007250', 'ahsanembd@gmail.com', 'Male', '10000.00', '0.00', 4, 'Barudan, Tajima & China', '135', '06 & 09', '2000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/qoKzEz363VD7LmjmsTvJ8QK6PxrfFTPGGyJ4fPHA.jpg', '[]', 'membership/photos/01JZHYFHEK8V6XSBYNGG0RSAJF.jpg', 1, '2025-07-30 18:00:00', NULL, '2025-07-06 22:33:05', '2025-07-07 02:01:46', 1),
(123, 163, '1400669', 'Ananda Embroidery', 'Proprietorship', 'Jakir Hossain Bablu', NULL, 'House-39/7/M/3, Baistaki, Haji Ali Hossain Road, Section-13, Kafrul Mirpur, Dhaka', NULL, '0182013777', 'anandaembroidery@yahoo.com', 'Male', '5000.00', '0.00', 4, 'Tajima & China', '100', '06 & 09', '2000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/39UFBPq92PaBuBL8vCCKOG89YcsI2mTyzXhU9xU5.jpg', '[]', 'membership/photos/iBbF5teQ4cbNvw7iKSKDQA7im0mSJcDPqI3kgBPH.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-06 22:39:52', '2025-07-07 00:43:35', 1),
(124, 164, '1600726', 'Annex Embroidery Limited', 'Limited Company', 'Muhammad Abul Kasem', NULL, '83/1, Lasker Para, Sataish Road Gazipura, Tongi, Gazipur.', NULL, '01973142488', 'annexembroiderylimited@yahoo.com', 'Male', '10000.00', '35000.00', 7, 'Tajima, Sunstar & Seeeing', '140', '09', '5000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/f6J0Fnc7nhJrmRTHuUXcsIrUGmcJrAcn0Ksf3Qd1.jpg', '[]', 'membership/photos/caCO0jgsvntKyXsgQQyWN5uS6y2WZnx92lP4K0Pk.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-06 22:43:58', '2025-07-07 01:01:57', 1),
(125, 166, '1800755', 'Anonto Embroidery', 'Proprietorship', 'Md. Abdullah Chowdhury', NULL, '107 Paper Mill Road, East Abdullapur, Uttara, Dhaka-1230.', NULL, '01819086874', 'saiful.anonto2019@gmail.com', 'Male', '5000.00', '0.00', 4, 'China', '76', '06 & 09', '2000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/LqzTEQi6rUln0IFaYZeq5mtlUFwkvxK3VwqEepRK.jpg', '[]', 'membership/photos/9rwmXjjqOE8MeIVIBNKUBeUTgyOtqjQwJ40TCqGV.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-06 23:06:10', '2025-07-07 00:41:20', 1),
(126, 167, '1800760', 'Antora Embroidery', 'Proprietorship', 'Md. Alamgir Howlader', NULL, 'Mastarpara Kalabagan, Near Idel School Uttar Khan, Uttara, Dhaka-1230.', NULL, '01991993801', 'antoraembroidery@yahoo.com', 'Male', '5000.00', '14000.00', 4, 'China&Tajima', '60', '06', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/fWvEjQd7MFfymM7wbyaxYgK7oFYdObj27b1Bcedu.jpg', '[]', 'membership/photos/qiQ5QgByREWiIg9O1POdeu4XC8GvZIOor3O2YIYz.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-06 23:09:37', '2025-07-07 00:27:36', 1),
(127, 168, '1700750', 'Anwar Fashion', 'Proprietorship', 'Didarul Anowar Forkan', NULL, '86/Ka, Road-4, P.C Culture Housing Society Shaymoli, Dhaka-1207.', NULL, '01711831788', 'anwarfashion18@gmail.com', 'Male', '5000.00', '14000.00', 4, 'Barudan & Sunstar', '80', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/82LqNQbKsz2cnRX4XS3uCQ208sfNxZtcOVE0Sc5t.jpg', '[]', 'membership/photos/CDxruThqtvzz2XcKJUhKPlkfqcmiExMN9SnKwHcm.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-06 23:20:50', '2025-07-07 00:21:21', 1),
(128, 169, '0100020', 'Apparel Plus Embroidery', 'Proprietorship', 'S.M. Zahedul Alam', NULL, 'R.R Dreams, House-5/1/B, (4th Floor), Mohanpur, Adabor, Shamoly, Dhaka.', NULL, '01913806882', 'apparelplusembroidery@gmai.com', 'Male', '5000.00', '0.00', 4, 'China', '80', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/p85VxfPJkULOUcXB9H6xh7gia4ohPTlzlur3jwEi.jpg', '[]', 'membership/photos/01JZHR9G31XFF7SAMPWCNHEK3E.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-06 23:26:46', '2025-07-07 00:13:37', 1),
(129, 170, '1000500', 'Arshad Embroidery Ltd.', 'Limited Company', 'Iqbal Khan Jamal', NULL, 'Plot-1323, Ascrayon Prokolpo Road, Surabari, Kashimpur, Gazipur.', NULL, '01819225229', 'arshadembo@gmail.com', 'Male', '10000.00', '0.00', 9, 'Tajima, Jintel, Yanhai, ZSK & Sinsim', '245', '09', '5000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/yk7ZG8cDghw9spAwq36XDYzII7BnQtb4Ij42MVub.jpg', '[]', 'membership/photos/V0qu7lP6SOSsOmtRluqhyWS00wip61oiM5mrBFSi.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-06 23:30:32', '2025-07-06 23:49:26', 1),
(131, 172, '0700325', 'Aunim Fashion', 'Proprietorship', 'Abdullah Al Mamun', NULL, '31/6, Joint Quater, Block-F, Johuri Mohallah, Shamoli, Dhaka-1207.', NULL, '01711565009', 'aunim.fashion@gmail.com', 'Male', '5000.00', '0.00', 3, 'Jintel', '55', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/q9zN3OB7ddknqweeTqhLQWinT2ubjHvLhBDbqAvI.png', '[]', 'membership/photos/ifAVKeOeMEqGionmXmh6IYgvLIPChY0ThocPoYM6.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 00:12:35', '2025-07-07 00:19:26', 1),
(132, 173, '1400686', 'Ayan Fashion', 'Proprietorship', 'Md. Asaduzzaman Sumon', NULL, 'House-39/9, West Baistaki, Haji Ali Hossain Road, Mirpur, Kafrul, Dhaka-1216', NULL, '01937649140', 'ayantextilebdi@gmail.com', 'Male', '5000.00', '0.00', 4, 'Jintel, Champion & General', '63', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/uIz6ZbMYkl6LEHIkMsuutaLXUlBV63Kzxy5mxB6V.jpg', '[]', 'membership/photos/FZuLPQ2SPvZda8JHOxx0Wu6VEiCXh2tG6JxRj5LI.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 00:37:15', '2025-07-07 00:59:57', 1),
(133, 174, '1200622', 'Baek Doo Korea (BD) Ltd.', 'Limited Company', 'Lee Choung Won', NULL, 'Village: Faruk Nagar, Post: Dhamsona, P,S: Ashulia, Savar, Dhaka-1349', '1200622', '01767695092', 'bdk.emb2013@gmail.com', 'Male', '10000.00', '0.00', 19, 'Barudan, Tajima, & Sunstar', '366', '09', '20000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/VQJUxK3VA68qTnAqO0hk289ydCoV2Phahu7vVI5V.jpg', '[]', 'membership/photos/KPEZtyfUJZ1Q28DZiDfSGIzGDYJRrgganuaYuOSr.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 00:43:06', '2025-07-07 00:49:55', 1),
(134, 175, '0800446', 'Basic Embroidery Ltd.', 'Limited Company', 'Md. Jamal Uddin', NULL, 'Rajabari, Gorai, Mirzapur, Tangail', NULL, '01714041373', 'basicembroidery@yahoo.com', 'Male', '10000.00', '0.00', 3, 'Barudan', '60', '9', '2000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/BzA6G8ZS87L4ebrztH7QKTeoK1cKujKhl2zzaOl1.jpg', '[]', 'membership/photos/Fjb3Gzt0VWVHcRq4Rax8Kcp00fFlR8m6SH69zSEP.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 00:49:23', '2025-07-07 00:57:21', 1),
(136, 178, '1100547', 'Combined Embroidery & Accessories', 'Proprietorship', 'Md. Abdur Rahim', NULL, 'House-99/A, Road-03, Shaymoli Housing 2nd Prokolpo, Adabor, Dhaka-1207.', NULL, '01819277360', 'combined.rahim84@gmail.com', 'Male', '5000.00', '0.00', 4, 'MTI & Barudan', '80', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01JZJ1VT2ZVC1TWHZH12R7R1ZW.jpg', '[]', 'membership/photos/01JZJ1VT31ET05VKQGZ1QDWTWC.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 01:32:03', '2025-07-07 03:00:54', 1),
(137, 179, '1900782', 'Combined Fashions Embroidery & Accessories', 'Proprietorship', 'Mohammad Ismail (Shobuj)', NULL, 'Mugra Kanda, Vakurta, Savar, Dhaka', '1900782', '01715054110', 'combinedfashions@gmail.com', 'Male', '5000.00', '0.00', 6, 'China', '120', '09', '5000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/Q65RHjPNT3y1d7IU8Wi5Dg2s6dLMoQbQ1VzdmxS9.jpg', '[]', 'membership/photos/qi6WuMuRXRDukPOZVSopZ2DdeHPwTr0WBn78i2pI.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 01:36:59', '2025-07-07 01:38:29', 1),
(138, 180, '1400641', 'Daffodil Embroidery', 'Proprietorship', 'Md. Mahamuder Rahman (Ripon)', NULL, 'House-726/40/1, Road-10, Baitul Aman Housing Society Adabor, Dhaka-1207.', NULL, '01715321227', 'daffodilemb_10@yahoo.com', 'Male', '5000.00', '0.00', 4, 'MTI, Autowin & Tajima', '63', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/2C6zc3WsfQb5zkagivnBbTXKtMjaKf61t3KbNY1G.jpg', '[]', 'membership/photos/gFmv54hpaYcP8NbckLMbCsWnvPlEUpqkS7vm6SYQ.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 01:43:51', '2025-07-07 01:48:39', 1),
(139, 181, '1700744', 'Dalas Stitch Colour Ltd.', 'Limited Company', 'Md. Elias Hossen', NULL, 'House-37, Block-B, Road-10, Charabagh, Ashulia, Savar, Dhaka.', '1700744', '01855808077', 'dalasemp@gmail.com', 'Male', '10000.00', '0.00', 9, 'China', '155', '09', '5000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01JZJ2G72JZ634SDJ3KFH0JJG2.jpf', '[]', 'membership/photos/AfW8erlrFxeWHeWf1TQSrFonnmDAp5x9yq8BJ4S5.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 02:37:29', '2025-07-07 03:12:03', 1),
(140, 182, '1900797', 'Design Creator', 'Proprietorship', 'Md. Khurshid Zaman', NULL, 'Plot # 32, Block # L, Road # S-1/A Eastern Housing, Mirpur, Dhaka.', '1900797', '01911505857', 'designcreatorkz@gmail.com', 'Male', '5000.00', '10000.00', 4, 'China', '60', '06 & 09', '2000.00', NULL, NULL, NULL, '2025-12-07', 1, NULL, NULL, NULL, 'membership/documents/44CRp6jdtNn4liMwwD6tHSyT9se1lT7G8d6lhSQL.jpg', '[]', 'membership/photos/jVix9Zenfohwp8zsaUvB1rebNkWWej6qJ888SShJ.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 02:41:48', '2025-07-07 03:13:42', 1),
(141, 183, '1800774', 'Dhaka Emb Ltd.', 'Limited Company', 'Kang Chang Youn', NULL, 'Vill: Subondi (Natun Nagar), Post: Dhamsona, Ashulia, Savar, Dhaka.', NULL, '01741944029', 'cykang@yupoong.co.kr', 'Male', '10000.00', '0.00', 14, 'Laser Machine & Barudan', 'MJGHY-160100 & 240', '9', '20000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/59p5Xmj4WN5fLq214e5mxzwn6uK2tK3DagwWpxJ3.jpg', '[]', 'membership/photos/w2iLAVkWQJ4Wg3OScXDawZO1mNO5inLCPp6Oxf55.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 02:50:31', '2025-07-07 03:06:01', 1),
(142, 184, '1100545', 'Dual Mart Embroidery Ltd.', 'Limited Company', 'Md. Gulzer Hossain', NULL, 'Norshinghopur,East Sabed Ali Sarkar Road,Baghbari, Kashimpur, Gazipur', '1100545', '01711692102', 'gulzer@worldvictorybd.com', 'Male', '10000.00', '0.00', 3, 'Feying, Jintel & Seeing', '45', '09', '2000.00', NULL, NULL, NULL, '2026-12-31', 1, NULL, NULL, NULL, 'membership/documents/JFHdqP7KMVS7nLtA3h0jz0dAnaoHK0FFkGV3tPnq.jpg', '[]', 'membership/photos/lFFlk48BDJPoFFAR86ZpBdajmuS42AVTA4vPg8IA.jpg', 1, '2026-12-30 18:00:00', 95, '2025-07-07 03:31:31', '2025-07-07 03:35:36', 1),
(143, 185, '0100051', 'Elite Fashion', 'Proprietorship', 'Md. Abdul Awal', NULL, 'Plot-1467, Gouripur, Bangabandhu Road Ashulia, Savar, Dhaka.', NULL, '01713038827', 'elitefashionbd@gmail.com', 'Male', '5000.00', '30000.00', 8, 'Tajima', '120', '09', '5000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/bxeH06KOpQoRs9LYpEFlXFhZ9o5RYklkVyVLWuuG.png', '[]', 'membership/photos/8tv6YCkkdKUpprQGKWst5JVGdk6XoLvJ8gQdADn7.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 04:06:19', '2025-07-07 23:29:16', 1),
(144, 186, '1900779', 'EPS Choice Embroidery', 'Proprietorship', 'Hosen Mohammad Rashid (Mamun)', NULL, 'Plot-298, Board Bazar (I.U.T Gate Opposite), P.O: NationalUniversity, Gazipur, Dhaka', NULL, '01815462915', 'epschoice2017@gmail.com', 'Male', '5000.00', '0.00', 4, 'Jidia', '105', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/2V2QMJFvYLYK3yiDYvREG4wCUgU0aEWpSsVfNPIq.jpg', '[]', 'membership/photos/h9aeBIrxPyxSzkEr4785AUA6TjrWvGh6xT9GvAqU.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 04:19:01', '2025-07-07 23:01:12', 1),
(145, 187, '1100549', 'Fawaz Fashion', 'Proprietorship', 'Ashadur Rahman (Rubel)', NULL, 'House # 712/19, Road # 10, Baitul Aman Housing Soceity, Adabor Dhaka-1207.', NULL, '01815439113', 'nishi_trade@yahoo.com', 'Male', '5000.00', '0.00', 9, 'MTI', '165', '09', '5000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/pYOn1uGLVXIQhNRA0ntsy2UaxzLUvdgtAZ7NZOZw.png', '[]', 'membership/photos/jFSrgt8nmQ98cHOn4QrVAl0RXeXoMgSi3A9XAYln.png', 1, '2025-07-30 18:00:00', NULL, '2025-07-07 04:34:52', '2025-07-07 23:27:35', 1),
(146, 188, '1700742', 'Fashion World', 'Proprietorship', 'Md. Kamal Uddin', NULL, 'House-885, Road-13, Baitul Aman Housing Society, Adabor Dhaka-1207.', NULL, '01759314488', 'kamaluddin88440@gmail.com', 'Male', '5000.00', '2000.00', 4, 'Tajima, Autowin, Tongli', '42', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/DLaKXAGSiruOMdhPao9JndWl4tL95zWq5JHgsYcd.jpg', '[]', 'membership/photos/jXYaloxxly2arYw4LYMnPcPsjAkAaJZoBivqn4Uz.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 04:42:29', '2025-07-07 23:26:52', 1),
(147, 190, '1900800', 'H.S.P Fashion', 'Proprietorship', 'Shohel Rana', NULL, 'Dag No.83, Faidabad, Transmitter Bir Muktijoddha, Kutub Uddin Road, Dakshin Khan, Uttara, Dhaka.', NULL, '01911492965', 'hspfashion93@gmail.com', 'Male', '5000.00', '0.00', 4, 'Seeing', '100', '06 & 09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/FuWu4gAh2un36rETwBK7z8asthuRgb6CWp6vjJN2.jpg', '[]', 'membership/photos/sksPgPnzZ0cdEXCvlsnZiFMAyGPfRV3WxWws9HC1.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 22:26:04', '2025-07-07 23:25:32', 1),
(148, 191, '1400642', 'Heritage Embroidery', 'Proprietorship', 'Md. Alauddin Al Mahmud', NULL, 'House-712/16, Road-10, Baitul Aman Housing, Adabor, Dhaka.', NULL, '01827830543', 'heritageemb@yahoo.com', 'Male', '5000.00', '0.00', 2, 'Jintel & Tajima Great', '30', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/WyPf2ZHaqBqs63Y38PgNx3oCjvEnGVPdXoucR3pu.jpg', '[]', 'membership/photos/EL86yoDuV6byuVRuDefq9T1abwBlwlg16oV1jYlV.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 22:30:16', '2025-07-07 23:24:02', 1),
(149, 192, '1200627', 'Howlader Embroidery Ltd.', 'Limited Company', 'Md. Biplob Hossain Howlader', NULL, '77/78/B, Bscic Industrial Area, Sashongaon, Fatullah, Narayanganj', NULL, '01711561180', 'howladeremb@gmail.com', 'Male', '10000.00', '0.00', 14, 'Tang', '280', '06 & 09', '10000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/uS1yWSK3y8eUocUI56ChgtjNjowv6OvWEFeMcGjP.jpg', '[]', 'membership/photos/Lc95eNGsv4RafxyEdsnnX8xqqEGWFcf8yw95ieEc.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 22:35:44', '2025-07-07 23:22:50', 1),
(150, 193, '1800776', 'Ideal Fashion', 'Proprietorship', 'Foysal Ahmed', NULL, 'House-09, North Adabor, Bazar Road, Adabor, Dhaka.', NULL, '01715948565', 'idealfashion_dhk@yahoo.com', 'Male', '5000.00', '2000.00', 4, 'MTI', '144', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/tXaXreARqAKgA2ksbHS1MBiO82W7Tm9PwSXTsz0U.jpg', '[]', 'membership/photos/jVT1bKu7GxvVoaHuAD3JrCBLEB5aT0xthmybn5xY.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 22:38:30', '2025-07-07 23:22:08', 1),
(151, 194, '1400691', 'Imperial Embroidery Ltd.', 'Limited Company', 'Md. Akter Hossain Shohel', NULL, 'House-882, Bimalia, Baliarpur, Hemayetpur, Savar, Dhaka', NULL, '01819291455', 'imperialemb@yahoo.com', 'Male', '10000.00', '0.00', 9, 'Tajima & Autowin', '210', '09', '5000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/IgfTthuiMGz5Uy5R9K3hAUJPBBMCNuKQ86hex7fy.png', '[]', 'membership/photos/I5TZExFyq0ORDARO05LDqoC9hQFgyALmJtYC1m2Z.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 22:42:13', '2025-07-07 23:20:49', 1),
(152, 195, '0700375', 'Indesore Embroidery Ltd.', 'Limited Company', 'Mohammed Rokunuzzaman', NULL, 'E-27-29, Eastern Housing Pallabi,2nd Phase, Mirpur,  Dhaka-1216.', NULL, '01730045179', 'kauser@indesore.com', 'Male', '10000.00', '0.00', 12, 'Tajima & Tang', '124', '9, 11 & 14', '10000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/KcXSMYbstN4BTJqPPd5ZOTc234Df4KZMUO5xgKw7.jpg', '[]', 'membership/photos/KZ2a6ovsr3UA8wvP2w4sy4prREsDow7hJvHUsSor.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 22:44:51', '2025-07-07 23:02:09', 1),
(153, 196, '1800778', 'Jangsu Multi Quilting (BD) Co. Ltd', 'Limited Company', 'Md. Sharif Hossain Khan', NULL, 'Khatian-406-327-106, JL-79, Baipail, Gazirchat, Ashulia, Savar, Dhaka.', NULL, '01726787870', 'sharifhossain.ultra@gmail.com', 'Male', '10000.00', '6000.00', 3, 'Wellon M/C(W-1.0) Ball Fiber M/C (W-1.0), Ball Fiber Stuffing M/C(W-1.5)', NULL, NULL, '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/sydF9SnipLkSwVhNlws2kARTtyJEjsPjy5p5sWVw.jpg', '[]', 'membership/photos/XO4DK1uRETe90xgXuHmCLQejqaQRb8vd6nI0ebg5.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-08 01:24:11', '2025-07-10 06:06:43', 1),
(154, 197, '0154', 'Janani Embroidery', 'Proprietorship', 'Md. Abdul Mannan', NULL, 'House-5/1,2/H, Borabo, Adabor, Shamoli, Dhaka-1207', '1400680', '01922751769', 'mamannan1769@gmail.com', 'Male', '5000.00', '0.00', 6, 'Autowin & Tajin', '86', '09', '5000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/Dj5lylC9dZ4zedSExMjfVM9Cds6oGm5nmHoyMQJw.jpg', NULL, 'membership/photos/FFZmoHXIHVdlQivJ8zKVaAbtPZ2366M0xsHSPvPV.jpg', 0, NULL, NULL, '2025-07-08 02:27:39', '2025-07-08 02:27:39', 0),
(155, 198, '1900786', 'Jui Embroidery', 'Proprietorship', 'A.K. Zaman', NULL, 'Holding-26, Road-05, Razabari Turag Dhaka-1230.', NULL, '01632746044', 'juizaman123@gmail.com', 'Male', '5000.00', '9000.00', 4, 'Royel Portugal', '80', '06 & 09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/4JF8Sfgf4QYpk4z2UgvhitAARtfUnZRRcc1e9qoi.jpg', '[]', 'membership/photos/6GWhE4Y924VyGU8bYjRiYjWyZImaZOP3bQsyi8qP.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-08 02:36:04', '2025-07-10 06:23:59', 1),
(156, 199, '0100091', 'Juniper Embroideries Ltd.', 'Limited Company', 'Md. Abidur Rahman', NULL, '67 Kandi Boilarpur, Union- Tetulzora, Hemayetpur, Savar, Dhaka.', NULL, '01819216007', 'juniper@babylon-bd.com', 'Male', '10000.00', '0.00', 11, 'Tajima, Barudan Maya & SPL', '205', '09', '20000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/Bu8BnhnHxaPIyGN2UEIaRr5yXUPQjYLxodO5kjvv.jpg', '[]', 'membership/photos/OlmCV9ZkDe4dz6mDqt5CbHKvgDwpzHn41DAmWOyd.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-08 02:50:02', '2025-07-10 06:04:17', 1),
(157, 200, '1700751', 'Kolpotoru International', 'Proprietorship', 'Md. Mahbub Al Mamun', NULL, 'House # 46, Road No:02, P C Culture Housing, Shekertak, Dhaka-1207.', NULL, '01713143070', 'kolpotoruinternational@gmail.com', 'Male', '5000.00', '0.00', 3, 'China', '30', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/vMWC71fNlFPQ4sc46vfWEQI5tQ1Q0wruFqmF43BS.jpg', '[]', 'membership/photos/tp87t7Gxt9Te2oPk25GZeIun02mkLcGXfR1toLLN.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-08 03:17:58', '2025-07-10 06:03:06', 1),
(158, 201, '0800430', 'Labels For Less Ltd', 'Limited Company', 'Mohammad H. Sattar', NULL, 'Village: South Shalna, P.O: Shalna Bazar, P.S: Gazipur Sadar, Dist: Gazipur-1703', NULL, '01711524235', 'daulat@utahgroup.net', 'Male', '10000.00', '0.00', 6, 'Tajima & Schiffli Switzerland', '40', '09', '5000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/tCw9wf1L6ZDDgab8Lp7xDPcwb5eXb48R5815GcnS.jpg', '[]', 'membership/photos/XNT3kbEdQJzpWyM4XQFtlerYkm6RQG5U6ZgBEZ1s.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-08 03:24:14', '2025-07-10 06:01:37', 1),
(159, 202, '1600713', 'Labonno Screen Print Ltd.', 'Limited Company', 'Khondoker Mizanur Rahman', NULL, 'Gorat, Zirabo, Ashulia, Savar, Dhaka & Norshinghopur, Zirabo, Ashulia, Savar, Dhaka', NULL, '01819272536', 'lucky@sldhaka.com', 'Male', '10000.00', '0.00', 5, 'Challanger', '100', 'Printing Machine', '5000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/Tgd1UkrnuYRzxVk13DGigXCfatpIXc9gb8L68E5k.png', '[]', 'membership/photos/PjNWq6zfcD8S3iICakI1j5pEwrwNMfrJbdYRqx1k.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-08 03:29:25', '2025-07-10 06:00:38', 1),
(160, 204, '0160', 'M.M. Khan Embroidery', 'Proprietorship', 'Md. Mostafa Khan', NULL, 'House-03, Road-02, Block-C, Dolipara, Turag, Uttara, Dhaka-1230.', '0800403', '01711287926', 'mmkhanex@gmail.com', 'Male', '5000.00', '0.00', 5, 'Younthing & RNP', '111', '09', '5000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/4anmrhzihv86dGFob9kPSHslScePvHbERgdpc99N.jpg', NULL, 'membership/photos/29t7wr0B7f1I6Rs0IHgGwVp9fpkBARAOE8xTgw3t.jpg', 0, NULL, NULL, '2025-07-08 05:49:44', '2025-07-08 05:49:44', 0),
(161, 207, '2501012', 'Ijaf Apparels', 'Proprietorship', 'Nur Mohammad', NULL, 'House-18, Road-02, Nayanichala, Nishadnagar, Turag, Dhaka-1711', NULL, '01715909343', 'nur976172@gmail.com', 'Male', '5000.00', '0.00', 6, 'GRNP', '120', '09', '5000.00', NULL, NULL, NULL, '2026-12-31', 2, NULL, NULL, NULL, 'membership/documents/Xl8j2CzFI3eUtSZrrsX4cQu7kWEX332jT2me0AMv.jpg', '[]', 'membership/photos/qPaTLMqJZUfEapRhEPSXFdgjKsDqHq1oH46Z3rbs.png', 1, '2026-12-30 18:00:00', NULL, '2025-07-09 03:41:38', '2025-07-09 03:59:09', 0),
(162, 176, '0162', 'Brook Thread & Accessories', 'Proprietorship', 'A.T.M. Zaglul Hossain', NULL, '100 Nobaber Bugh, Mirpur-1, Dhaka-1216', '0700346', '01715984411', 'zaglul_hossain@yahoo.com', 'Male', '5000.00', '0.00', 6, 'Zhanyi', '160', '04 & 09', '5000.00', NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/EYUgmuCYyEBO1apcXP5KoNZfSPGX2Db6Zv4bIdsX.png', NULL, 'membership/photos/G4PV51lwmFAIBkSRTCjdClKhmzBF5hqHaGYsSjgo.png', 0, NULL, NULL, '2025-07-10 03:33:10', '2025-07-10 03:33:10', 0),
(163, 213, '1700735', 'Maa Fashion', 'Proprietorship', 'Md. Ariful  Islam (Montu)', NULL, 'House: 1594, Mastarpara, Kolabagan, Uttarkhan, Uttara, Dhaka-1230.', NULL, '01913380277', 'maafashionmontu@gmail.com', 'Male', '5000.00', '2000.00', 4, 'Barudan & China', '70', '09', '2000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/MbPAGvfMXXwl42gTED4UdFXjFpF9KbPaxi3OENHw.jpg', '[]', 'membership/photos/EWMUuqjpVM73W9tXqokUQwGsIFNzTiivYXxBn4Is.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-10 04:24:20', '2025-07-10 05:58:40', 1),
(164, 212, '0800385', 'M.R.C Embroidery', 'Proprietorship', 'Saad Rahim Chowdhury', NULL, 'Plot-34, Uttar Rajabari, Dhour Main Road, Nishatnagar, Turag, Dhaka-1230.', NULL, '01713002900', 'saadchow@gmail.com', 'Male', '5000.00', '0.00', 7, 'Tajima Sunstar & China', '119', '9', '5000.00', NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/pyjW4wy1kTCQhi4q8s7NBaLvo4sjUb2P0D8DmeiH.jpg', '[]', 'membership/photos/ocqc4flhvYCimddQ7HouJqyfb0wnHe4jqU58ZVlY.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-10 05:34:44', '2025-07-10 05:56:34', 1),
(165, 215, '0165', 'Berry and Barton Traders', 'Proprietorship', 'Noel Lyons', 'Repellendus Exercit', 'Et consequatur quia', '70', '20', 'cijy@mailinator.com', 'Male', '5000.00', '15000.00', 777, 'Beatae dolor esse fu', 'Labore cupidatat et', 'Deserunt ut labore n', '10000.00', '5.00', '10000.00', '112255', '1991-07-01', 2, 'Est saepe adipisicin', 'Qui deleniti harum u', NULL, 'membership/documents/pGwG8l998pmxdNDxrRand5JNrdXPfXF4JdztpgwT.jpg', '[]', 'membership/photos/cIrKdC0qwFNeaRtBiIlFMwSCEPwIZtcO67BQXFEd.jpg', 1, NULL, 98, '2025-07-14 01:11:25', '2025-07-14 04:07:35', 0);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `is_visible`, `created_at`, `updated_at`) VALUES
(1, 'Header', 1, '2025-05-05 10:36:31', '2025-05-05 10:36:31'),
(2, 'Footer Menu One', 1, '2025-06-01 11:17:13', '2025-06-01 11:17:13'),
(3, 'Footer Menu Tow', 1, '2025-06-01 11:17:19', '2025-06-01 11:17:19');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `linkable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkable_id` bigint UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `order` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `parent_id`, `linkable_type`, `linkable_id`, `title`, `url`, `target`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, 'Home', '/', '_self', 1, '2025-05-05 10:36:48', '2025-06-05 13:02:08'),
(2, 1, NULL, NULL, NULL, 'About us', '#', '_self', 2, '2025-05-05 17:23:03', '2025-06-05 13:02:08'),
(3, 1, 2, NULL, NULL, 'Our history', '/our-history', '_self', 1, '2025-05-05 17:23:40', '2025-05-05 18:05:40'),
(4, 1, 2, NULL, NULL, 'Advisory Council Members', '/advisory-council-members', '_self', 2, '2025-05-05 17:24:43', '2025-05-07 17:51:04'),
(5, 1, 2, NULL, NULL, 'Executive Council Members', '/executive-council-members', '_self', 3, '2025-05-05 17:26:46', '2025-05-07 18:01:28'),
(6, 1, 2, NULL, NULL, 'Former Presidents', '/former-presidents', '_self', 4, '2025-05-05 17:27:30', '2025-06-03 01:40:53'),
(8, 1, 2, NULL, NULL, 'Contact us', '/contact-us', '_self', 6, '2025-05-05 17:30:54', '2025-05-07 18:00:49'),
(9, 1, NULL, NULL, NULL, 'Member Directory', '/members', '_self', 3, '2025-05-05 17:33:48', '2025-06-21 23:31:23'),
(11, 1, 14, NULL, NULL, 'Become A Member', '/membership/create', '_self', 1, '2025-05-05 17:39:13', '2025-05-07 18:06:55'),
(12, 1, 14, NULL, NULL, 'Membership Renew', '/renew-membership/create', '_self', 2, '2025-05-05 17:40:05', '2025-05-07 18:10:13'),
(13, 1, 14, NULL, NULL, 'Request For Certificate', '/certificate-requests', '_self', 3, '2025-05-05 17:40:40', '2025-05-07 18:09:45'),
(14, 1, NULL, NULL, NULL, 'Registration & Apply', '#', '_self', 4, '2025-05-05 17:43:42', '2025-06-05 13:02:08'),
(15, 1, NULL, NULL, NULL, 'Events', '/events', '_self', 5, '2025-05-05 17:46:14', '2025-06-05 13:02:08'),
(18, 1, NULL, NULL, NULL, 'Fundraising', '#', '_self', 6, '2025-05-05 17:51:53', '2025-06-05 13:02:08'),
(21, 1, 18, NULL, NULL, 'Become a Sponsor', '/sponsors/create', '_self', 1, '2025-05-05 17:54:27', '2025-06-05 13:02:20'),
(23, 1, 18, NULL, NULL, ' Sponsors List', '/sponsors', '_self', 2, '2025-05-05 18:28:10', '2025-06-05 13:02:20'),
(24, 1, NULL, NULL, NULL, 'Photo Gallery\'s ', '#', '_blank', 7, '2025-05-16 07:34:21', '2025-06-05 13:02:08'),
(26, 1, 24, NULL, NULL, 'Picnic 2025', '/picnic-2025', '_self', 1, '2025-05-17 22:46:56', '2025-06-15 03:45:39'),
(27, 2, NULL, NULL, NULL, 'Test Link', '#', '_self', 1, '2025-06-01 11:17:33', '2025-06-01 11:17:33'),
(28, 3, NULL, NULL, NULL, 'Test Link', '#', '_self', 1, '2025-06-01 11:18:08', '2025-06-01 11:18:08'),
(29, 1, 24, NULL, NULL, 'Picnic 2026', '/picnic-2026', '_self', 2, '2025-06-02 11:06:43', '2025-06-15 03:46:19'),
(30, 1, 18, NULL, NULL, 'Donate to Bemea', '/Donate%20To%20Bemea', '_self', 3, '2025-06-05 13:01:39', '2025-06-05 13:08:29'),
(31, 1, 18, NULL, NULL, 'Donner List', 'sdrher', '_self', 4, '2025-06-05 13:01:56', '2025-06-05 13:02:20');

-- --------------------------------------------------------

--
-- Table structure for table `menu_locations`
--

CREATE TABLE `menu_locations` (
  `id` bigint UNSIGNED NOT NULL,
  `menu_id` bigint UNSIGNED NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_locations`
--

INSERT INTO `menu_locations` (`id`, `menu_id`, `location`, `created_at`, `updated_at`) VALUES
(1, 1, 'header', '2025-05-05 10:39:26', '2025-05-05 10:39:26'),
(2, 2, 'footer_menu_one', '2025-06-01 11:18:16', '2025-06-01 11:18:16'),
(3, 3, 'footer_menu_two', '2025-06-01 11:18:16', '2025-06-01 11:18:16');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2022_12_14_083707_create_settings_table', 1),
(5, '2025_03_16_164003_create_permission_tables', 1),
(6, '2025_03_17_055453_create_breezy_sessions_table', 1),
(7, '2025_03_17_060239_create_pages_table', 1),
(8, '2025_03_17_060240_fix_slug_unique_constraint_on_pages_table', 1),
(9, '2025_03_17_060934_create_blog_tables', 1),
(10, '2025_03_18_064049_create_menus_table', 1),
(11, '2025_03_26_043544_create_app_settings_table', 1),
(12, '2025_04_06_134242_create_expenses_table', 1),
(13, '2025_04_06_134243_create_tag_tables', 1),
(14, '2025_04_07_120430_create_certificate_requests_table', 1),
(15, '2025_04_08_081630_create_memberships_table', 1),
(16, '2025_04_26_024627_create_events_table', 1),
(17, '2025_04_26_024701_create_event_members_table', 1),
(18, '2025_05_04_054309_create_sponsors_table', 1),
(19, '2025_05_04_142741_create_renew_memberships_table', 1),
(20, '2025_05_07_154612_create_app_settings', 2),
(21, '2025_05_14_073447_create_event_member_tokens_table', 3),
(22, '2025_05_14_093219_add_column_to_event_members_table', 4),
(23, '2025_05_14_160909_add_column_to_event_members_table', 4),
(24, '2025_05_17_084453_create_event_joined_companeys_table', 5),
(25, '2025_05_17_091819_add_column_to_event_joined_companeys_table', 5),
(26, '2025_05_17_091820_create_sms_logs_table', 5),
(27, '2025_05_19_045639_make_membership_fields_nullable', 6),
(28, '2025_05_31_053758_rename_event_joined_companeys_table', 7),
(29, '2025_05_31_061908_create_job_applications_table', 7),
(30, '2025_05_31_062633_add_photo_path_to_job_applications_table', 7),
(31, '2025_05_31_063317_add_is_active_to_job_applications_table', 7),
(32, '2025_06_01_183649_create_donations_table', 8),
(33, '2025_06_03_000000_add_deu_amount_to_memberships_and_renew_memberships', 9),
(34, '2025_06_03_approved_field_event_members', 10),
(35, '2025_06_03_153902_add_membership_id_to_memberships', 11),
(36, '2025_05_07_154613_create_app_settings', 12),
(37, '2025_06_03_154942_add_existing_member_to_memberships', 13),
(38, '2025_06_05_065747_add_renew_amount_and_payment_year_to_renew_memberships_table', 14),
(39, '2025_06_05_130703_create_notices_table', 15),
(40, '2025_06_15_063312_add_column_to_event_members_table', 16),
(41, '2025_07_12_112445_add_flags_to_events_table', 17),
(42, '2025_07_13_115110_create_expense_categories_table', 18),
(43, '2025_07_14_061701_create_advertisements_table', 19);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`id`, `title`, `description`, `image`, `is_active`, `start_date`, `end_date`, `user_id`, `created_at`, `updated_at`) VALUES
(6, '\';\';.\';', 'jk;;iuh;hb', 'notices/bF1z15QcMhQQBhZ2p65ECOHgmsk0N7WUR5tkOJZY.png', 0, NULL, NULL, 205, '2025-07-08 13:05:20', '2025-07-08 13:05:20');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `layout` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `blocks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `layout`, `blocks`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'About us', 'about ', 'default', '[{\"data\": {\"heading\": \"About Us\", \"header_image\": \"page-file/01JTFJN0SQY795AFX4KZ0RZQTD.jpg\"}, \"type\": \"page-header\"}, {\"data\": {\"size\": \"h1\", \"color\": \"#000000\", \"heading\": \"Our History\", \"alignment\": \"center\"}, \"type\": \"heading\"}, {\"data\": {\"description\": \"Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.\\n\\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\"}, \"type\": \"textarea\"}, {\"data\": {\"how_many\": \"1\"}, \"type\": \"br\"}, {\"data\": {\"size\": \"h2\", \"color\": \"#000000\", \"heading\": \"Advisory Council Members\", \"alignment\": \"center\"}, \"type\": \"heading\"}, {\"data\": {\"members\": [{\"brand\": \"Bigraja\", \"email\": \"mdrajakhan1064@gmail.com\", \"photo\": \"page-content-members/01JTG5H68VMXTD93AK9BMP7QR3.png\", \"mobile\": \"01645681877\", \"address\": \"SNB vata, Gonga proshad pur\\nRajbari\", \"colours\": \"SNB vata, Gonga proshad pur\\nRajbari\", \"machine\": \"100\", \"total_head\": \"500\", \"company_name\": \"Bigraja\", \"membership_no\": \"#0564\", \"proprietor_name\": \"Raja Khan\", \"proprietor_title\": \"Proprietor\"}, {\"brand\": \"Bigraja\", \"email\": \"mdrajakhan1064@gmail.com\", \"photo\": \"page-content-members/01JTG5H68VMXTD93AK9BMP7QR3.png\", \"mobile\": \"01645681877\", \"address\": \"SNB vata, Gonga proshad pur\\nRajbari\", \"colours\": \"SNB vata, Gonga proshad pur\\nRajbari\", \"machine\": \"100\", \"total_head\": \"500\", \"company_name\": \"Bigraja\", \"membership_no\": \"#0564\", \"proprietor_name\": \"Raja Khan\", \"proprietor_title\": \"Proprietor\"}, {\"brand\": \"Bigraja\", \"email\": \"mdrajakhan1064@gmail.com\", \"photo\": \"page-content-members/01JTG5H68VMXTD93AK9BMP7QR3.png\", \"mobile\": \"01645681877\", \"address\": \"SNB vata, Gonga proshad pur\\nRajbari\", \"colours\": \"SNB vata, Gonga proshad pur\\nRajbari\", \"machine\": \"100\", \"total_head\": \"500\", \"company_name\": \"Bigraja\", \"membership_no\": \"#0564\", \"proprietor_name\": \"Raja Khan\", \"proprietor_title\": \"Proprietor\"}, {\"brand\": \"Bigraja\", \"email\": \"mdrajakhan1064@gmail.com\", \"photo\": \"page-content-members/01JTG5H68VMXTD93AK9BMP7QR3.png\", \"mobile\": \"01645681877\", \"address\": \"SNB vata, Gonga proshad pur\\nRajbari\", \"colours\": \"SNB vata, Gonga proshad pur\\nRajbari\", \"machine\": \"100\", \"total_head\": \"500\", \"company_name\": \"Bigraja\", \"membership_no\": \"#0564\", \"proprietor_name\": \"Raja Khan\", \"proprietor_title\": \"Proprietor\"}]}, \"type\": \"member-card\"}, {\"data\": {\"size\": \"h2\", \"color\": \"#000000\", \"heading\": \"Executive Council Members\", \"alignment\": \"center\"}, \"type\": \"heading\"}]', NULL, '2025-05-05 10:38:05', '2025-05-07 20:11:11'),
(2, 'Our History', 'our-history', 'default', '[{\"data\": {\"heading\": \"Our History\", \"header_image\": \"page-file/01JVFT3JM2G7YQF8G9156M4EBB.jpg\"}, \"type\": \"page-header\"}, {\"data\": {\"how_many\": \"1\"}, \"type\": \"br\"}, {\"data\": {\"description\": \"Section 1.10.32 of \\\"de Finibus Bonorum et Malorum\\\", written by Cicero in 45 BC\\n\\\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\\\"\"}, \"type\": \"textarea\"}, {\"data\": {\"how_many\": \"1\"}, \"type\": \"br\"}, {\"data\": {\"content\": \"<h3>The standard Lorem Ipsum passage, used since the 1500s</h3><p>\\\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\\\"</p><h3>Section 1.10.32 of \\\"de Finibus Bonorum et Malorum\\\", written by Cicero in 45 BC</h3><p>\\\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\\\"</p><h3>1914 translation by H. Rackham</h3><p>\\\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\\\"</p><h3>Section 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\", written by Cicero in 45 BC</h3><p>\\\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\\\"</p><h3>1914 translation by H. Rackham</h3><p>\\\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\\\"</p><p><br></p>\"}, \"type\": \"rich-editor\"}]', NULL, '2025-05-05 17:58:21', '2025-05-17 23:04:04'),
(3, 'Advisory Council Members', 'advisory-council-members', 'default', '[{\"data\": {\"heading\": \".\", \"header_image\": \"page-file/01JTNG69MW57PKCRV26MYAHM77.jpg\"}, \"type\": \"page-header\"}, {\"data\": {\"how_many\": \"1\"}, \"type\": \"br\"}, {\"data\": {\"size\": \"h2\", \"color\": \"#ffffff\", \"heading\": \"Advisory Council Members\", \"alignment\": \"center\", \"background\": \"#13bd0a\"}, \"type\": \"heading\"}, {\"data\": {\"members\": [{\"photo\": \"page-content-members/01JVJ8XGTKKN22YQXA2BC8RTAQ.jpg\", \"proprietor_name\": \"Raja Khan\", \"proprietor_title\": \"Proprietor\"}, {\"photo\": \"page-content-members/01JVJ8XGTKKN22YQXA2BC8RTAQ.jpg\", \"proprietor_name\": \"Raja Khan\", \"proprietor_title\": \"Proprietor\"}, {\"photo\": \"page-content-members/01JVJ8XGTKKN22YQXA2BC8RTAQ.jpg\", \"proprietor_name\": \"Raja Khan\", \"proprietor_title\": \"Proprietor\"}, {\"photo\": \"page-content-members/01JVJ8XGTKKN22YQXA2BC8RTAQ.jpg\", \"proprietor_name\": \"Raja Khan\", \"proprietor_title\": \"Proprietor\"}]}, \"type\": \"board-of-members\"}]', NULL, '2025-05-07 17:50:32', '2025-05-18 22:05:12'),
(4, 'Executive Council Members', 'executive-council-members', 'default', '[{\"data\":{\"heading\":\"Executive Council Members\",\"header_image\":\"page-file\\/01JWKTH1N2XZGR56RC2WB1R3HP.png\"},\"type\":\"page-header\"},{\"type\":\"br\",\"data\":{\"how_many\":\"2\"}},{\"type\":\"heading\",\"data\":{\"heading\":\"Executive Council Members\",\"alignment\":\"center\",\"size\":\"h1\",\"color\":\"#ffffff\",\"background\":\"#e26124\"}},{\"type\":\"board-of-members\",\"data\":{\"members\":[{\"proprietor_name\":\"Raja Khan\",\"proprietor_title\":\"Proprietor\",\"photo\":\"page-content-members\\/01JWKM6BGNY6AYS306E929H2A5.png\"}]}},{\"type\":\"board-of-members\",\"data\":{\"members\":[{\"proprietor_name\":\"Easin Khan\",\"proprietor_title\":\"Proprietor\",\"photo\":\"page-content-members\\/01JWKM8033H9J8B6ZCJ562WTCH.png\"},{\"proprietor_name\":\"Rasel Ahmed\",\"proprietor_title\":\"Proprietor\",\"photo\":\"page-content-members\\/01JWKMEEPN53G7YV4DQXWD1ADZ.png\"},{\"proprietor_name\":\"Mehedi Hossen\",\"proprietor_title\":\"Proprietor\",\"photo\":\"page-content-members\\/01JWKMEEPR485PT5B0GWBXGZ54.png\"},{\"proprietor_name\":\"Maruf Molla\",\"proprietor_title\":\"Proprietor\",\"photo\":\"page-content-members\\/01JWKMEEPVCAF4P58A5KH110BM.png\"}]}}]', NULL, '2025-05-07 17:56:31', '2025-05-31 12:44:05'),
(5, 'Past BEMEA Members', 'Past BEMEA Members', 'default', '[{\"data\":{\"heading\":\"Past BEMEA Members\",\"header_image\":\"page-file\\/01JTNGPH54XDF5SN27XC2ATQYC.jpg\"},\"type\":\"page-header\"}]', 1, '2025-05-07 17:59:24', '2025-05-30 04:02:38'),
(6, 'Our  Executive Members', 'our-executive-members', 'default', '[{\"data\": {\"heading\": \"Our  Executive Members\", \"header_image\": \"page-file/01JTNGV93FZ66JS40P0YSARYVR.jpg\"}, \"type\": \"page-header\"}]', NULL, '2025-05-07 18:02:00', '2025-05-07 18:02:00'),
(7, 'Contact Us', 'contact-us', 'default', '[{\"data\":{\"heading\":\"Contact Us\",\"header_image\":\"page-file\\/01JWKRH9FJEFSTG3T22618SQ7Y.png\"},\"type\":\"page-header\"},{\"data\":{\"address\":\"7\\/7 A Sector -17 Block - H1, Uttara,Dhaka, Bangladesh\",\"email_1\":\"contact@bemeabd.com\",\"email_2\":\"bemea2000@gmail.com\",\"phone_1\":\"01720578171\",\"phone_2\":\"01970578171\",\"background_image\":\"contact-info-backgrounds\\/01JTNRN4248CQJHR4NZ6AETWDX.jpg\"},\"type\":\"contact-info\"},{\"data\":{\"title\":null,\"tagline\":\"Contact with us\",\"formAction\":\"theme-assets\\/inc\\/sendemail.php\",\"description\":null,\"socialLinks\":[{\"url\":null,\"platform\":\"twitter\"},{\"url\":null,\"platform\":\"facebook\"}]},\"type\":\"contact-one\"},{\"data\":{\"map_embed_url\":\"<div class=\\\"mapouter\\\" style=\\\"position:relative; text-align:right; width:500px; height:450px;\\\">\\n  <div class=\\\"gmap_canvas\\\" style=\\\"overflow:hidden; background:none!important; width:500px; height:450px;\\\">\\n    <iframe width=\\\"500px\\\" height=\\\"450px\\\" style=\\\"border:0;\\\" allowfullscreen=\\\"\\\" loading=\\\"lazy\\\" referrerpolicy=\\\"no-referrer-when-downgrade\\\" src=\\\"https:\\/\\/www.google.com\\/maps\\/embed\\/v1\\/place?q=https%3A%2F%2Fmaps.app.goo.gl%2FwM1kKHEHb2RkeV3X9&key=AIzaSyBFw0Qbyq9zTFTd-tUY6dZWTgaQzuU17R8\\\"><\\/iframe>\\n  <\\/div>\\n  <a href=\\\"https:\\/\\/norsumediagroup.com\\/embed-google-map-website-free\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" class=\\\"gme-generated-link\\\">Embed Map on Website for Free<\\/a>\\n  <style>\\n   .mapouter{position:relative;text-align:right;} .gmap_canvas{overflow:hidden;background:none!important;} .gmap_canvas iframe{width:100%;height:100%;} .mapouter a{display:block;font-size:0.85em;text-align:center;padding:5px 0;color:#6c757d;text-decoration:none;} .gme-generated-link{display:none!important;}\\n  <\\/style>\\n<\\/div>\",\"height\":null},\"type\":\"google-map\"}]', NULL, '2025-05-07 18:03:03', '2025-07-05 22:58:52'),
(8, 'Members', 'members', 'default', '[{\"data\":{\"heading\":\"Our Members\",\"header_image\":\"page-file\\/01JW398F5EK2K7CM66NKW8063F.png\"},\"type\":\"page-header\"},{\"data\":{\"how_many\":\"1\"},\"type\":\"br\"},{\"data\":{\"size\":\"h2\",\"color\":\"#000000\",\"heading\":\"Our Honorable Members\",\"alignment\":\"center\",\"background\":\"#ffffff\"},\"type\":\"heading\"},{\"data\":{\"section_tagline\":null,\"section_title\":null,\"display_limit\":\"162\",\"button_text_all_members\":null,\"button_link_all_members\":null},\"type\":\"membership-list\"}]', NULL, '2025-05-07 18:06:02', '2025-07-08 01:32:31'),
(9, 'Events', 'events', 'default', '[{\"data\":{\"heading\":\"Events\",\"header_image\":\"page-file\\/01JW39QXDAZK8CEN7FYYKE7D6Q.png\"},\"type\":\"page-header\"},{\"data\":[],\"type\":\"event-list\"}]', NULL, '2025-05-07 18:12:26', '2025-05-25 02:42:53'),
(10, 'Sponsors', 'sponsors', 'default', '[{\"data\":{\"heading\":\"Thank you for staying with us\",\"header_image\":\"page-file\\/01JW372W3JQRMD73D5G1K882VW.png\"},\"type\":\"page-header\"},{\"data\":[],\"type\":\"sponsor-carousel\"}]', NULL, '2025-05-07 18:15:08', '2025-05-26 09:44:40'),
(11, 'Home', '/', 'default', '[{\"data\":{\"items\":[{\"heading\":\"BANGLADESH EMBROIDERY MANUFACTURES & EXPORTER ASSOCIATION\",\"slug_line\":\"\\\"Where Style Meets Scale \\u2013 Multi-Head Embroidery for Modern Fashion\\\"\",\"button_link\":\"https:\\/\\/bemea.amarsite.top\\/register\",\"button_text\":\"NEW MEMBER REG\",\"slider_image\":\"page-file\\/01JXVVQ8E6QDZMJNCX5YMHB7H0.png\"},{\"slider_image\":\"page-file\\/01JXVVQ8E9VP0S57QCD18KMR9X.png\",\"heading\":\"BANGLADESH EMBROIDERY MANUFACTURES & EXPORTER ASSOCIATION\",\"slug_line\":null,\"button_text\":null,\"button_link\":\"#\"}]},\"type\":\"slider\"},{\"data\":{\"how_many\":\"1\"},\"type\":\"br\"},{\"data\":{\"size\":\"h1\",\"color\":\"#e6dada\",\"heading\":\"Board Of Directors \",\"alignment\":\"center\",\"background\":\"#d98c69\"},\"type\":\"heading\"},{\"data\":{\"size\":\"h5\",\"color\":\"#ffffff\",\"heading\":\"2024-2026\",\"alignment\":\"center\",\"background\":\"#e26124\"},\"type\":\"heading\"},{\"data\":{\"members\":[{\"photo\":\"page-content-members\\/01JXVPG16AD9HMHS4QT64SF0BK.png\",\"proprietor_name\":\"Shahnawz Chowdhury\",\"proprietor_title\":\"President\"}]},\"type\":\"board-of-members\"},{\"data\":{\"members\":[{\"photo\":\"page-content-members\\/01JY419XD2VVFNJQZJJ58SRVB3.png\",\"proprietor_name\":\"Md Sharif Hossain Khan \",\"proprietor_title\":\"First Sr.Vice President\"},{\"photo\":\"page-content-members\\/01JY8FDK5PPZA7QR0AAMRC0MEH.png\",\"proprietor_name\":\"Md Shamsul Islam \",\"proprietor_title\":\"First Sr.Vice President\"},{\"photo\":\"page-content-members\\/01JY8FDK5RZQY1A59Z0MA3TKC1.png\",\"proprietor_name\":\"A.R.M Shahidul Haque Apu\",\"proprietor_title\":\"Vice President\"},{\"photo\":\"page-content-members\\/01JY8FDK5SKCSXKQPF3SDPFARA.png\",\"proprietor_name\":\"Rasaul Karim Popy\",\"proprietor_title\":\"Vice President \"},{\"proprietor_name\":\"Md Sarif Uddin Khan Momen\",\"proprietor_title\":\"Vice President \",\"photo\":\"page-content-members\\/01JY8FDK5T2Y6KM0JW8BW6PN6V.png\"},{\"proprietor_name\":\"Md Anwar Hossain \",\"proprietor_title\":\"Vice President \",\"photo\":\"page-content-members\\/01JY8FKTR7B4Z97QFWKYZHPSVT.png\"},{\"proprietor_name\":\"Md. Khijir Chowdhury\",\"proprietor_title\":\"Secretary General\",\"photo\":\"page-content-members\\/01JYK0ZAXJXWFATN5GGX4VV9RZ.png\"},{\"proprietor_name\":\"Md. Muksedur Rahman Abir\",\"proprietor_title\":\"Joint Secretary General\",\"photo\":\"page-content-members\\/01JYK0ZAXKYJ9JAE27PJRMFY1N.png\"},{\"proprietor_name\":\"A.T.M. Mostaen Billah Mukim\",\"proprietor_title\":\"Finance Director\",\"photo\":\"page-content-members\\/01JYK0ZAXME502EEH07DAPDTXQ.png\"},{\"proprietor_name\":\"Md. Delowar Hossain Ansary\",\"proprietor_title\":\"Joint Finance Director\",\"photo\":\"page-content-members\\/01JXVVH6VT37YSNHFVVNQYEZ58.png\"},{\"proprietor_name\":\"Md. Ruhul Amin\",\"proprietor_title\":\"Director\",\"photo\":\"page-content-members\\/01JYK0ZAXP78M8CHVZ2QPNBF7X.png\"},{\"proprietor_name\":\"Md. Azizul Islam\",\"proprietor_title\":\"Director\",\"photo\":\"page-content-members\\/01JYP3PERMSFHR426BVY2KTCFY.png\"},{\"proprietor_name\":\"Md. Rasel Sheikh\",\"proprietor_title\":\"Director\",\"photo\":\"page-content-members\\/01JYK0ZAXRAM2PFZGG7VFPEZ96.png\"},{\"proprietor_name\":\"Mohammad Nura Alam Sarker\",\"proprietor_title\":\"Director\",\"photo\":\"page-content-members\\/01JYK0ZAXRAM2PFZGG7VFPEZ97.png\"},{\"proprietor_name\":\"Md. Ataul Goni\",\"proprietor_title\":\"Director\",\"photo\":\"page-content-members\\/01JYK0ZAXTMZ6G64TW21PSMR5V.png\"},{\"proprietor_name\":\"Md. Monir Ahmed Manik\",\"proprietor_title\":\"Director\",\"photo\":\"page-content-members\\/01JYK0ZAXVQPJSFQ80PRBZ66YH.png\"},{\"proprietor_name\":\"Md. Abdullah Al Mamun\",\"proprietor_title\":\"Director\",\"photo\":\"page-content-members\\/01JXVVH6VZ5DVT3DWQ95MTBQM5.png\"},{\"proprietor_name\":\"Md. Sanjil Hossain\",\"proprietor_title\":\"Director\",\"photo\":\"page-content-members\\/01JYNBKTBBBRTB8CT9F30ABJKD.png\"},{\"proprietor_name\":\"Md. Sharif Ullah Bapu\",\"proprietor_title\":\"Director\",\"photo\":\"page-content-members\\/01JYNBKTBDW945HGJBXCZN4DYJ.png\"},{\"proprietor_name\":\"Md. Main Uddin Khan\",\"proprietor_title\":\"Director\",\"photo\":\"page-content-members\\/01JYNBKTBE3RV06QAV1Y12SQQA.png\"}]},\"type\":\"board-of-members\"},{\"data\":{\"how_many\":\"1\"},\"type\":\"br\"},{\"data\":{\"background_image\":\"pageblock-video-one\\/01JWKGGY7D92YK4Y72305CPQ1W.jpeg\",\"video_area_list_items\":[],\"video_popup_url\":null,\"video_area_title\":\"\\u098f\\u09ae\\u09ac\\u09cd\\u09b0\\u09af\\u09bc\\u09a1\\u09be\\u09b0\\u09bf \\u09ab\\u09cd\\u09af\\u09be\\u0995\\u09cd\\u099f\\u09b0\\u09bf\\u09a4\\u09c7 \\u099a\\u09be\\u0995\\u09b0\\u09bf \\u0995\\u09b0\\u09c7 \\u09a6\\u09c7\\u09b6\\u09c7\\u09b0 \\u0985\\u09b0\\u09cd\\u09a5\\u09a8\\u09c0\\u09a4\\u09bf\\u09b0 \\u0989\\u09a8\\u09cd\\u09a8\\u09af\\u09bc\\u09a8\\u09c7 \\u0985\\u09ac\\u09a6\\u09be\\u09a8 \\u09b0\\u09be\\u0996\\u09c1\\u09a8\\u0964 \\n\\u0986\\u099c\\u0995\\u09c7\\u0987 \\u099a\\u09be\\u0995\\u09b0\\u09bf\\u09b0 \\u099c\\u09a8\\u09cd\\u09af \\u0986\\u09ac\\u09c7\\u09a6\\u09a8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\n\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\u098f\\u0987 \\u0986\\u09ac\\u09c7\\u09a6\\u09a8\\u099f\\u09bf \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b8\\u0995\\u09b2 \\u09ae\\u09c7\\u09ae\\u09cd\\u09ac\\u09be\\u09b0\\u09a6\\u09c7\\u09b0 \\u0995\\u09be\\u099b\\u09c7 \\u09aa\\u09cc\\u0981\\u099b\\u09c7 \\u09af\\u09be\\u09ac\\u09c7\\u0964\\n\\n\",\"form_section_title\":null,\"form_section_tagline\":null,\"form_section_description\":null,\"form_submit_button_text\":null},\"type\":\"video-one\"},{\"type\":\"testimonials-one\",\"data\":{\"background_image\":\"pageblock-testimonials\\/01JWKG3R7GRPJ2J6N5Z7YSBRYN.jpg\",\"gallery_images\":[],\"section_tagline\":null,\"section_title\":null,\"section_description\":null,\"button_text\":null,\"button_link\":\"https:\\/\\/bemea.bemeabd.com\\/all-notice\",\"cv_display_limit\":\"5\",\"notice_display_limit\":null}},{\"data\":{\"images\":[{\"image\":\"pageblock-gallery-one\\/01JYBVDABFSEY4BTC4G5HNC94S.png\",\"alt_text\":\"test \",\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JYBVH8DRJQBM2EG9C08G55BN.png\",\"alt_text\":\"test \",\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JYBVNTWPTGXG3WPJ1F4W67MH.png\",\"alt_text\":\"test\",\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JYBVNTWRAFCTZ8WRY3WD38MH.png\",\"alt_text\":\"test\",\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JWKEX17BP74XT6BNW9EQ0Z0W.jpg\",\"alt_text\":\"test\",\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JYBVNTWT8KNAAFCS534FPPFV.png\",\"alt_text\":\"test\",\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JWKEX17H92EX2ZN08AJ7NCA9.jpg\",\"alt_text\":\"test\",\"category_filter_tag\":\"ec meeting \"},{\"image\":\"pageblock-gallery-one\\/01JZFPTKE8X6WB1765QNG8MTGZ.jpg\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZFPTKECEC3HNJ6MSHXVFM92.jpg\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT0SCTNTQSEM4QD61EZT491.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B267TGN7BSR3PTZF2T6P.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B2693MWP7AR685MX4R6A.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26ADNSD960EDDM80PV0.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26BTGQ00P3P7DVVT7TF.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26BTGQ00P3P7DVVT7TG.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26C31XWYY91XDPFV21S.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26DTCF326NW3H917GRZ.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26E1PHH1HRXB8D7GV0P.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26F1AGDDR0TG4RXTXAB.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26G3BE8JBMR6PZK9Y3W.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26HC29492F3QF2H4G94.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26JTPVEAS4GE46HEGC3.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26JTPVEAS4GE46HEGC4.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26KS0VP1RSYKJCJQ3E6.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26NRCQ1ETXCQRDF5WX3.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26PPQB996TMF64MNWH7.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26PPQB996TMF64MNWH8.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26Q2FG4EWSYJBSNKA32.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26RP4FP6ZF135KZKFG5.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26SJN4YDB66PNAYW25B.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26TC1A2PV87GGEZSVWE.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26VRKSXPW0SZVRMZT12.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26WWZ21G0JV31FGGN28.png\",\"alt_text\":null,\"category_filter_tag\":null}],\"section_tagline\":null,\"section_title\":null},\"type\":\"gallery-one\"},{\"data\":{\"section_title\":null,\"display_limit\":null},\"type\":\"sponsor-carousel\"}]', NULL, '2025-05-07 20:11:20', '2025-07-10 06:00:38'),
(12, 'Picnic 2025', 'picnic-2025', 'default', '[{\"type\":\"page-header\",\"data\":{\"header_image\":\"page-file\\/01JWKJ8K2KWQRAA5B7YF1ACNYQ.jpg\",\"heading\":\"Picnic 2025\"}},{\"type\":\"photo-gallery\",\"data\":{\"gallery_title\":\"Picnic 2025\",\"images\":[{\"image_path\":\"photo-gallery-images\\/01JWRR5TSJFGE69R0VGG0NXREV.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSM6PFXFGY1JE4Y8YWQ.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSN0A1KKW9XC4JRK4DX.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSQ44MQKMM0W7AY9WGT.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSR2MNHKK2NY5MMNM6R.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSSN372ARQ1HTK0SDQE.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSTHNDNN5TTJD27H2NY.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSVJH4ESND7S7EFCCH2.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSW2RVZVG4444P1WJFY.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSX469F00J380F1AS71.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSYBE40Z6X9JK6F6C7D.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSZZPSHH19JT8RYZR4H.jpg\",\"caption\":null}]}}]', NULL, '2025-05-31 10:18:49', '2025-06-02 10:39:12'),
(13, 'Picnic 2026', 'picnic-2026', 'default', '[{\"type\":\"page-header\",\"data\":{\"header_image\":\"page-file\\/01JWRSPZMG3DTPEM4SKXWGX2EN.jpg\",\"heading\":\"Picnic 2026\"}},{\"type\":\"photo-gallery\",\"data\":{\"gallery_title\":\"Our Photo Gallery\",\"images\":[{\"image_path\":\"photo-gallery-images\\/01JWRSPZMHX9Q71BQVS3XD9FSN.png\",\"caption\":null}]}}]', NULL, '2025-06-02 11:06:03', '2025-06-02 11:06:03'),
(14, 'Picnic 2027', 'picnic-2027', 'default', '[]', NULL, '2025-06-02 11:13:27', '2025-06-02 11:14:58'),
(15, 'Former Presidents', 'former-presidents', 'default', '[{\"type\":\"page-header\",\"data\":{\"header_image\":\"page-file\\/01JWTB5R5RB786DMQ9AMM2XQRG.jpg\",\"heading\":\"Former Presidents\"}},{\"type\":\"former-presidents\",\"data\":{\"presidents\":[{\"name\":\"Raja Khan\",\"time_period\":\"April 2021 to April 2024\",\"image\":\"former-presidents\\/01JWTB5R5TXVTMN46FW9Z5NPNC.png\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the\"},{\"name\":\"Meherun Nesa\",\"time_period\":\"April 2021 to April 2024\",\"image\":\"former-presidents\\/01JWTC12NK4DNBJEQVZ7SPNTSW.jpg\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the\"},{\"name\":\"Easin Khan Santo\",\"time_period\":\"April 2021 to April 2024\",\"image\":\"former-presidents\\/01JWTC55J0ZFAGPSK2REMXJR38.jpg\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the\"},{\"name\":\"Rasel Ahmed\",\"time_period\":\"April 2021 to April 2024\",\"image\":\"former-presidents\\/01JWTC4ANKQ27TRPWD7916P2RH.jpg\",\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the\"}]}}]', NULL, '2025-06-03 01:30:27', '2025-06-03 01:56:40'),
(16, 'Donate To Bemea', 'Donate To Bemea', 'default', '[{\"type\":\"slider\",\"data\":{\"items\":[{\"slider_image\":\"page-file\\/01JX0R13BKF6GZCS5YW7ENNXBD.png\",\"heading\":\"Donate To Bemea\",\"slug_line\":\"Donate To Bemea\",\"button_text\":null,\"button_link\":\"#\"},{\"slider_image\":\"page-file\\/01JX0R1V322C9GTYPP4R3M6WG9.png\",\"heading\":\"Donate To Bemea\",\"slug_line\":\"Donate To Bemea\",\"button_text\":null,\"button_link\":\"#\"}]}}]', NULL, '2025-06-05 13:07:21', '2025-06-05 13:10:57'),
(17, 'all-notice', 'all-notice', 'default', '[{\"type\":\"page-header\",\"data\":{\"header_image\":\"page-file\\/01JXQ5S6G711E8T8NWPJ7MG0KA.jpg\",\"heading\":\"All Notice\"}},{\"type\":\"all-notice\",\"data\":{\"section_title\":\"All Notices\",\"per_page\":\"25\"}}]', NULL, '2025-06-14 06:14:11', '2025-06-14 22:14:37');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('embroiderybd@gmail.com', '$2y$12$D052u.muRod8kJdF3DLCUe6hn1dNb2c9LetedkA8.flUhcsY6lKhm', '2025-06-14 09:43:45');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `renew_memberships`
--

CREATE TABLE `renew_memberships` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `membership_id` bigint UNSIGNED NOT NULL,
  `machine_count` int NOT NULL,
  `yearly_subscription` decimal(10,2) NOT NULL,
  `deu_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `director_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `renew_expire_date` timestamp NULL DEFAULT NULL,
  `expense_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `renew_amount` int DEFAULT NULL,
  `payment_year` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `group`, `name`, `locked`, `payload`, `created_at`, `updated_at`) VALUES
(1, 'app', 'app_name', 0, '\"Bemea\"', '2025-05-07 19:56:03', '2025-07-03 03:37:19'),
(2, 'app', 'app_logo', 0, '\"assets\\/01JTNQEC10KV85RJB6Y4GCHPKF.png\"', '2025-05-07 19:56:03', '2025-07-03 03:37:19'),
(3, 'app', 'app_logo_dark', 0, '\"assets\\/01JTNQF9DY6DTX7FXSNQXHPQXG.png\"', '2025-05-07 19:56:03', '2025-07-03 03:37:19'),
(4, 'app', 'app_favicon', 0, '\"assets\\/01JTNQF9E5FE1D9WQDVW793E9D.png\"', '2025-05-07 19:56:03', '2025-07-03 03:37:19'),
(5, 'app', 'default_layout_address', 0, '\"BGMEA Complex,House-7\\/7 A(5th Floor,West Block,Unit-B) Sector -17 Block - H-1, Uttara,Dhaka-1230, Bangladesh\"', '2025-05-07 19:56:03', '2025-07-03 03:37:19'),
(6, 'app', 'default_layout_email', 0, '\"contact@bemeabd.com\"', '2025-05-07 19:56:03', '2025-07-03 03:37:19'),
(7, 'app', 'default_layout_phone', 0, '\"+8801720578171\"', '2025-05-07 19:56:03', '2025-07-03 03:37:19'),
(8, 'app', 'about_text', 0, '\"About Us\"', '2025-05-07 19:56:03', '2025-07-03 03:37:19'),
(9, 'app', 'about_paragraph', 0, '\"Hello, We are a team of developers who are passionate about creating high-quality software solutions.\"', '2025-05-07 19:56:03', '2025-07-03 03:37:19'),
(10, 'app', 'facebook_link', 0, '\"https:\\/\\/www.facebook.com\\/profile.php?id=61577904424418\"', '2025-05-07 19:56:03', '2025-07-03 03:37:19'),
(11, 'app', 'twitter_link', 0, 'null', '2025-05-07 19:56:03', '2025-07-03 03:37:19'),
(12, 'app', 'instagram_link', 0, '\"https:\\/\\/www.instagram.com\"', '2025-05-07 19:56:03', '2025-07-03 03:37:19'),
(13, 'app', 'youtube_link', 0, '\"https:\\/\\/www.youtube.com\"', '2025-05-07 19:56:03', '2025-07-03 03:37:19'),
(14, 'app', 'pinterest_link', 0, 'null', '2025-05-07 19:56:03', '2025-07-03 03:37:19'),
(15, 'app', 'copyright_text', 0, '\"\\u00a9 Copyright by Bemea\"', '2025-05-07 19:56:03', '2025-07-03 03:37:19'),
(48, 'app', 'limited_company_fee', 0, '10000', '2025-06-04 07:47:19', '2025-07-03 03:37:19'),
(49, 'app', 'proprietorship_fee', 0, '5000', '2025-06-04 07:47:19', '2025-07-03 03:37:19'),
(50, 'app', 'foreign_joint_venture_fee', 0, '20000', '2025-06-04 07:47:19', '2025-07-03 03:37:19'),
(51, 'app', 'machine_fee_1_to_4', 0, '2000', '2025-06-04 07:47:19', '2025-07-03 03:37:19'),
(52, 'app', 'machine_fee_5_to_9', 0, '5000', '2025-06-04 07:47:19', '2025-07-03 03:37:19'),
(53, 'app', 'machine_fee_10_plus', 0, '10000', '2025-06-04 07:47:19', '2025-07-03 03:37:19'),
(54, 'app', 'age_1_to_9', 0, '1000', '2025-06-04 07:47:19', '2025-07-03 03:37:19'),
(55, 'app', 'age_10_up', 0, '2000', '2025-06-04 07:47:19', '2025-07-03 03:37:19');

-- --------------------------------------------------------

--
-- Table structure for table `sponsors`
--

CREATE TABLE `sponsors` (
  `id` bigint UNSIGNED NOT NULL,
  `expense_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `company_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_address` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taggables`
--

CREATE TABLE `taggables` (
  `tag_id` bigint UNSIGNED NOT NULL,
  `taggable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taggable_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `slug` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_column` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number_verified_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `can_login` tinyint(1) NOT NULL DEFAULT '1',
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `profile_photo_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `mobile_number`, `mobile_number_verified_at`, `address`, `password`, `type`, `can_login`, `profile_picture`, `is_admin`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `profile_photo_path`) VALUES
(28, 'momen khan', 'dahaobd@gmail.com', NULL, '01711544994', NULL, NULL, '$2y$12$GDeROAmW7.MNmqIR./hcOeCiLRKxt0dLLUJaKThphvSjPg5ZZsCwi', 'user', 1, '01JX1KYTJK24QY5R96AE8H8EZ0.jpg', 1, 'LC2lvbuEW5eD1Iydn6QhguDPs27EucGgnQb5ZoTafTutwQDKyYHpHfaNSIeG', '2025-05-23 22:10:38', '2025-06-16 00:18:57', NULL, NULL),
(48, 'MR ISHAQ ', 'bemea2000@gmail.com', '2025-06-16 05:16:29', '01720578171', NULL, 'bgmea building , uttara, dhaka ', '$2y$12$GDeROAmW7.MNmqIR./hcOeCiLRKxt0dLLUJaKThphvSjPg5ZZsCwi', 'user', 1, NULL, 1, 'l1zOt6zwhPUntQYPp277J39zwtgaH0BYd4V8DKZRgHNbAEfwFln28OUSJJjc', '2025-06-15 23:14:16', '2025-06-17 00:14:00', NULL, NULL),
(80, 'Rasaul Karim Chowdhury (Popy)', 'popyrnp@gmail.com', NULL, '01819224240', NULL, NULL, '$2y$12$IC/RygLeOP4LQ6zOGvCqa.TdB5lajpXigqzLcPRYm42TUJwfYx8ou', 'user', 1, NULL, 0, NULL, '2025-06-21 23:24:42', '2025-06-21 23:24:42', NULL, NULL),
(83, 'Md. Abdul Hannan (Jashim)', 'sajboutiques@gmail.com', NULL, '01751863881', NULL, NULL, '$2y$12$w0xM77FMO9mdzBLWKGVZBeMteSPRjMq4IXEekZICR6Hj34OSZ29vi', 'user', 1, NULL, 0, NULL, '2025-06-22 04:35:45', '2025-06-22 04:35:45', NULL, NULL),
(84, 'Abdullah Al Kamrul Hasan', 'kamrulbdctg@yahoo.com', NULL, '01727719507', NULL, NULL, '$2y$12$zMc1zR.0BtD4bTBkKfJ0YeEEMo51prkuFWnIQTAephhzdA.MK5HcK', 'user', 1, NULL, 0, 'JnUmxQdy4q8aX7f1VvrZuAzqhe8CYmlisCPZU0t0V9L3JwfsWZQBvB6UMuXM', '2025-06-22 04:41:08', '2025-06-22 04:41:08', NULL, NULL),
(88, 'Md. Shafiullah Mian', 'arfashionsnembroidery@gmail.com', NULL, '01611613151', NULL, NULL, '$2y$12$JxU81x0N/3UKlV0OanPOEek1YzhUISayZxpgwjxMSovZKaSEPt9tu', 'user', 1, NULL, 0, NULL, '2025-06-23 04:25:46', '2025-06-23 04:25:46', NULL, NULL),
(89, 'Abdullah Al Noman', 'nafashion123@gmail.com', NULL, '01683387047', NULL, NULL, '$2y$12$hEyVq3aVlG.TcRr801AsFO8qeCaMDA.F8qS8DZ63DIRnkLri4aAGq', 'user', 1, NULL, 0, NULL, '2025-06-23 04:32:07', '2025-06-23 04:32:07', NULL, NULL),
(90, 'Md. Abdul Awal (Azgor)', 'arcorporation306@gmail.com', NULL, '01615400306', NULL, NULL, '$2y$12$nH./KJ/VBYTXOghpBROy4eITl2v3X2b7TyCBH9Ji/Ibga3QspdgSG', 'user', 1, NULL, 0, NULL, '2025-06-23 04:54:51', '2025-06-23 04:54:51', NULL, NULL),
(91, 'Abdus Sattar', 'asembroidery69@gmail.com', NULL, '01995109131', NULL, NULL, '$2y$12$gBnm0OWLLR8qTCW2UiJ5HuwPeDQF61SrLz4/U4rpfdfi3CEpE8Fwu', 'user', 1, NULL, 0, NULL, '2025-06-23 04:59:55', '2025-06-23 04:59:55', NULL, NULL),
(92, 'Alauddin Miah Mahin', 'hightechparts1@gmail.com', NULL, '01730900785', NULL, NULL, '$2y$12$6qHi3G2zU/IBmcoldrA73ufwGt.Bs0DGFGCRsppjkb5zkbtW9ri0K', 'user', 1, NULL, 0, NULL, '2025-06-23 05:06:37', '2025-06-23 05:06:37', NULL, NULL),
(93, 'Md. AB. Alim Miah', 'alim@abrarfashionltd.com', NULL, '01973245755', NULL, NULL, '$2y$12$vGfJVB9..VFVq6xPePotte6WZrie9B3QjHUaXL8JV1UUXIBvkzzNG', 'user', 1, NULL, 0, NULL, '2025-06-23 05:23:10', '2025-06-23 05:23:10', NULL, NULL),
(94, 'Md. Anowar Hossain', 'anowar_rmp@yahoo.com', NULL, '01911061615', NULL, NULL, '$2y$12$Inuf/c13tchkfKqjuxI.XeUDfrEidY5ZrDs3dmmQub2G/n6CKiWu2', 'user', 1, NULL, 0, NULL, '2025-06-23 05:44:14', '2025-06-23 05:44:14', NULL, NULL),
(99, 'Golam Hafifz Chodhury', 'ahpprinting@gmaili.com', NULL, '01819237324', NULL, NULL, '$2y$12$xuHSvGtaHOjiGknZq3a8Gu2Z7vLDlEUsQrua1rV1Pp0gM3hOqiIRC', 'user', 1, NULL, 0, NULL, '2025-06-25 02:52:54', '2025-06-25 02:52:54', NULL, NULL),
(100, 'Md. Ashraf Hossain', 'apparelalaraf@yahoo.com', NULL, '01911444657', NULL, NULL, '$2y$12$P9X0R8NoMUs0LXS1032ccOYCevp8yIWCZQpyhVxycHl0tbqHwmBym', 'user', 1, NULL, 0, NULL, '2025-06-25 02:57:51', '2025-06-25 02:57:51', NULL, NULL),
(101, 'Md. Mohi Uddin', 'albaraka@yahoo.com', NULL, '01763672259', NULL, NULL, '$2y$12$JdDk84CXUG0VsxZxLZNctOyektf16c.dTNPZ/1HmjoBuCfQT9N5bq', 'user', 1, NULL, 0, NULL, '2025-06-25 03:15:55', '2025-06-25 03:15:55', NULL, NULL),
(102, 'Md. Abdul Alim', 'alim@alyeabd.com', NULL, '01711943856', NULL, NULL, '$2y$12$yrPojvbtDgHKqMt7j3lFf.bkyMCZ/9YMxt/4J43vqNUZzgTnSOmOW', 'user', 1, NULL, 0, NULL, '2025-06-25 03:25:34', '2025-06-25 03:25:34', NULL, NULL),
(103, 'Ali Ansar Mollah', 'ali_ansar_mollah@yahoo.com', NULL, '01711561914', NULL, NULL, '$2y$12$S0nAh2S6g7GltkrQtJ9Roeo28c.CcTeYxwjgGH1JBL9Qwrcp/X402', 'user', 1, NULL, 0, NULL, '2025-06-25 03:40:00', '2025-06-25 03:40:00', NULL, NULL),
(118, 'Al Haj Mohammad Akter Hossain', 'rana@aliflammim-bd.com', NULL, '01711592333', NULL, NULL, '$2y$12$Q/1ybwehBMTPqdQsOgTtQulSBBHxE4vhmVSLSX5zbUdsVkiJXSJyi', 'user', 1, NULL, 0, NULL, '2025-06-28 22:31:41', '2025-06-28 22:31:41', NULL, NULL),
(119, 'Mohammad Tunjilur Rahman', 'aliffashion.50@gmail.com', NULL, '01720068341', NULL, NULL, '$2y$12$hMjRMAs2OhC5v0jQ0HEpHeDprScsSAKKR9xQSiols2MSK81gRska.', 'user', 1, NULL, 0, NULL, '2025-06-28 22:39:28', '2025-06-28 22:39:28', NULL, NULL),
(120, 'Md. Tohidul Islam Mazumder (Sujan)', 'alifstitchesemb@gmail.com', NULL, '01916808626', NULL, NULL, '$2y$12$slg5I8kKe5NMvh.FYUYJcOjS4eRBnL/94hxOrqzA2mal0QPy859Ye', 'user', 1, NULL, 0, NULL, '2025-06-28 22:45:50', '2025-06-28 22:45:50', NULL, NULL),
(121, 'Sheikh M.A. Wahid', 'almafashionbd@yahoo.com', NULL, '01715072072', NULL, NULL, '$2y$12$0vvlaM5/nMWjYKl4XSDRl.q1IAF3/pODkfy5f8uxevEIzx65oTdiy', 'user', 1, NULL, 0, NULL, '2025-06-28 22:55:14', '2025-06-28 22:55:14', NULL, NULL),
(122, 'Md. Mahabubul Kabir (Liton)', 'liton@087gmail.com', NULL, '01550552329', NULL, NULL, '$2y$12$frMufjpdXxfrAgAO6GxIMeVyUooVxpFdaZzL3LAK0xTa8DfKxJOZe', 'user', 1, NULL, 0, NULL, '2025-06-28 23:02:08', '2025-06-28 23:02:08', NULL, NULL),
(123, 'Md. Al-Salim', 'alsalimtrading1982@gmail.com', NULL, '01819116881', NULL, NULL, '$2y$12$5Y9LSWbG7DCKOida8eZ.We6XhVHZ5NtZVB6CsGnL64d.vtRXFmVFy', 'user', 1, NULL, 0, NULL, '2025-06-28 23:08:55', '2025-06-28 23:08:55', NULL, NULL),
(128, 'QBtJCSNINFYfQq', 'swellsgc@gmail.com', NULL, '9150114939', NULL, NULL, '$2y$12$I.BzC4cW7mkBY1su.M5HXOEowOqpQ6WQo9Iw.lMrzNqZ2doAjLTGq', 'user', 1, NULL, 0, NULL, '2025-06-29 21:13:19', '2025-06-29 21:13:19', NULL, NULL),
(132, 'Quin Mayo', 'cadugaqyka@mailinator.com', NULL, '558', NULL, NULL, '$2y$12$h6XI1L/ndjHCcAeksOLaFO67Nhj/lnEdfGRIg2Xk32ndvYMxxxwnG', 'user', 1, NULL, 0, NULL, '2025-07-02 21:25:29', '2025-07-02 21:25:29', NULL, NULL),
(133, 'Shahnawaz Chowdhury', 'nafgroup@dhaka.net', NULL, '01919214333', NULL, NULL, '$2y$12$S1QXSDRvDXNFJYb8oPiuYOPMuCDLHi.q0OnlSwf0oMx/k4EA1T1GC', 'user', 1, NULL, 0, NULL, '2025-07-02 22:48:15', '2025-07-02 22:48:15', NULL, NULL),
(134, 'Md. Sharif Hossain Khan', 'sharifhossain.ultra@gmail.com', NULL, '01726787870', NULL, NULL, '$2y$12$TfalRGEE6c8.U37QGlO.Fee4dJgLup3kA1VEsy6jxpvp4raMvdF6G', 'user', 1, NULL, 0, NULL, '2025-07-02 23:04:36', '2025-07-02 23:04:36', NULL, NULL),
(135, 'Md. Shamsul Islam Masud', 'masudfm2010@gmail.com', NULL, '01711533132', NULL, NULL, '$2y$12$M2I1OsqB7fUj1Jx7C.cg.eg7gAKoevNbvrjNTl1jplfP1QQZqXXPK', 'user', 1, NULL, 0, NULL, '2025-07-02 23:40:41', '2025-07-02 23:40:41', NULL, NULL),
(136, 'A.R.M Shahidul Haque Apu', 'apu@acl.bdrmg.com', NULL, '01713032990', NULL, NULL, '$2y$12$ycnSVpAL7s8dksYerSIXB.ES9uv.Tz7yflg6KU4Woy5n59SvAzMXi', 'user', 1, NULL, 0, NULL, '2025-07-02 23:48:47', '2025-07-02 23:48:47', NULL, NULL),
(137, 'Md. Anwar Hossain', 'monpuragroup@yahoo.com', NULL, '01918444222', NULL, NULL, '$2y$12$vcrHnhhpTskN5ygzYtQzheXEC7C3rjmFdC9mBO/RFtakgQF84VIQy', 'user', 1, NULL, 0, NULL, '2025-07-03 00:28:24', '2025-07-03 00:28:24', NULL, NULL),
(138, 'Md. Khijir Chowdhury', 'pritomtradecorp@gmail.com', NULL, '01912324010', NULL, NULL, '$2y$12$15zTjpXpEF7RDQLoRywe3uZHeB3D/JYkmW9rw1jm7ABKav6sdEM0a', 'user', 1, NULL, 0, NULL, '2025-07-03 01:06:16', '2025-07-03 01:06:16', NULL, NULL),
(139, 'Md. Muksedur Rahman Abir', 'nc_embroidery@yahoo.com', NULL, '01751624818', NULL, NULL, '$2y$12$VuTxRoxOaH.BEe0l3jx4VeZOEoYBAYOP8oqITHlmZgfoUIeSGUH7.', 'user', 1, NULL, 0, NULL, '2025-07-03 01:12:53', '2025-07-03 01:12:53', NULL, NULL),
(140, 'A.T.M. Mostaen Billah', 'atmbillah@yahoo.com', NULL, '01919239204', NULL, NULL, '$2y$12$3y2R/yhqN9WvVObzJKhn9elOfEgXexAwNgQk24VPYR.NbX5bzSqwW', 'user', 1, NULL, 0, NULL, '2025-07-03 01:31:24', '2025-07-03 01:31:24', NULL, NULL),
(141, 'Md. Monir Ahmed', 'mtibd2@gmail.com', NULL, '01711529229', NULL, NULL, '$2y$12$w1/jLGZo1izjSF09zi5aJOjJKkuiW46sRI4FfZc/v1Itpz1RJMr4O', 'user', 1, NULL, 0, NULL, '2025-07-03 01:38:19', '2025-07-03 01:38:19', NULL, NULL),
(142, 'Md. Ruhul Amin', 'visiontradeint@yahoo.com', NULL, '01713028146', NULL, NULL, '$2y$12$OjT5KtkqyU3R/YZq37TOSeW/3z1sG4VxSfELSLdLPTp7JvfJxqIpu', 'user', 1, NULL, 0, NULL, '2025-07-03 01:45:57', '2025-07-03 01:45:57', NULL, NULL),
(143, 'Md. Rasel Sheikh', 'r_embro@yahoo.com', NULL, '01711609612', NULL, NULL, '$2y$12$Vz4UvAS.NhCKgqHMDCgLDO12Mo8pr4us3hvqa8xbzVbtb9cEXvizK', 'user', 1, NULL, 0, NULL, '2025-07-03 02:09:46', '2025-07-03 02:09:46', NULL, NULL),
(144, 'Md. Delowar Hossan Ansary', 'brightembroidery35@gmail.com', NULL, '01912780935', NULL, NULL, '$2y$12$cuphZ1BhdnBznlKGiYGjc.d820Wn6oXYQ30b3U9Uq1MT1r5oJAUQ6', 'user', 1, NULL, 0, NULL, '2025-07-03 02:37:50', '2025-07-03 02:37:50', NULL, NULL),
(145, 'Md. Ataul Goni', 'ssfashion2012@yahoo.com', NULL, '01715658488', NULL, NULL, '$2y$12$IKTuAbjUZkXpQG7UiWyvPuiVKyJrTOYUmHEDS5XE5ik/0Sp6mBloK', 'user', 1, NULL, 0, NULL, '2025-07-03 03:26:54', '2025-07-03 03:26:54', NULL, NULL),
(146, 'Md. Abdulllah Al-Mamun', 'mamamun73@gmail.com', NULL, '01713009206', NULL, NULL, '$2y$12$MI0MpcNoB4zKhrjWBBVZ3uc.wodeFY1rWWRwifiKYEZrbf4XVoxZK', 'user', 1, NULL, 0, NULL, '2025-07-03 03:31:28', '2025-07-03 03:31:28', NULL, NULL),
(147, 'Md. Sanjil Hossain', 'razimemb@yahoo.com', NULL, '01788938390', NULL, NULL, '$2y$12$FNtjzHggWFihrsF18ONxw.aEb6.fgoqX.mqqgUeursD.pXguNJUtC', 'user', 1, NULL, 0, NULL, '2025-07-03 03:35:31', '2025-07-03 03:35:31', NULL, NULL),
(148, 'Md. Sharif Ullah Bapu', 'mdsharifullah.suisuta@gmail.com', NULL, '01965300600', NULL, NULL, '$2y$12$uKx734qHLMKMswX4ga7ea.wUMZixvqV6ptKPc7o2545bv.zJnc7ZK', 'user', 1, NULL, 0, NULL, '2025-07-03 03:42:40', '2025-07-03 03:42:40', NULL, NULL),
(149, 'Md. Main Uddin Khan', 'mainuddinkhan46@yahoo.com', NULL, '01330803744', NULL, NULL, '$2y$12$aBfCRXaUPliwmSfSaY7puO9D6H8CWMM1077dYh2Or0RYSGLV2.oUS', 'user', 1, NULL, 0, NULL, '2025-07-03 03:47:14', '2025-07-03 03:47:14', NULL, NULL),
(150, 'Md. Nura Alam Sarker', 'hafsa_trd@yahoo.com', NULL, '01680916966', NULL, NULL, '$2y$12$05Jjwl6YnMJwDwXE3m95WuZLhWkET89PRAJsu.UzzDllV3uYws9RK', 'user', 1, NULL, 0, NULL, '2025-07-03 04:12:55', '2025-07-03 04:12:55', NULL, NULL),
(151, 'Md Raja', 'mdrajakhan1064@gmail.com', NULL, '01645681877', NULL, NULL, '$2y$12$naLwzEFGDlof5PDEIbO50.J73ZfLtkj3fS0BHrjh2CO/VKcrefFk6', 'user', 1, NULL, 0, NULL, '2025-07-03 09:05:13', '2025-07-03 09:05:13', NULL, NULL),
(154, 'OewFtTRTorTvr', 'uyidalefos705@gmail.com', NULL, '7063270855', NULL, NULL, '$2y$12$nFmHwR7IWhFjwYf9VcQLr.O6/2.Weo.SOrgHB1aWT1bnGW.q0Ek.q', 'user', 1, NULL, 0, NULL, '2025-07-04 12:52:15', '2025-07-04 12:52:15', NULL, NULL),
(155, 'CloZiXEcaWIdGXV', 'zifilanak00@gmail.com', NULL, '2992572418', NULL, NULL, '$2y$12$CpHTIFI3Vo76cBa..LNF7e/2WxJlsD2iFc6nNYnvC62Hy8tYgEhBi', 'user', 1, NULL, 0, NULL, '2025-07-04 20:59:22', '2025-07-04 20:59:22', NULL, NULL),
(156, 'vKDYqtPaW', 'garyfunderburg925227@yahoo.com', NULL, '6673131167', NULL, NULL, '$2y$12$yWz8DkkhMyhNCD5yzuEvnucQOO3r4ZwEyiMtW67XmyQua/hWnRcfG', 'user', 1, NULL, 0, NULL, '2025-07-05 19:18:37', '2025-07-05 19:18:37', NULL, NULL),
(157, 'EmYZxcQS', 'denniskimbold@gmail.com', NULL, '3586157997', NULL, NULL, '$2y$12$gTnlxs0LBq9Af4uMViAnw.AH5p5ybmydZNugtS6YbnXY79unOP.n2', 'user', 1, NULL, 0, NULL, '2025-07-06 01:46:13', '2025-07-06 01:46:13', NULL, NULL),
(158, 'TEST', 'disharahman312@gmail.com', NULL, '017156348998', NULL, NULL, '$2y$12$PrkYMq0iZOyzkAZdPh5pN.ydVrQOGryzFS.Up8RGJRawjvdqzm0FS', 'user', 1, NULL, 0, NULL, '2025-07-06 01:50:37', '2025-07-06 01:50:37', NULL, NULL),
(159, 'wxfgINyLz', 'taylinsv3@gmail.com', NULL, '2967831869', NULL, NULL, '$2y$12$hwO4yDfZ4rdG6BUk1cPmkeETdc4G6Qo8bmGpIXrv6a8ICOoHJQ1WW', 'user', 1, NULL, 0, NULL, '2025-07-06 03:18:52', '2025-07-06 03:18:52', NULL, NULL),
(160, 'HUxNAnRVZCKs', 'dabbottjd34@gmail.com', NULL, '8743285025', NULL, NULL, '$2y$12$2YalFivbikN7UHncVPt/J.CMx4umdoMuaoN492FLQhTCAgFPaxCky', 'user', 1, NULL, 0, NULL, '2025-07-06 08:09:50', '2025-07-06 08:09:50', NULL, NULL),
(161, 'Md. Mustafizur Rahman (Jahir)', 'abirfashion128@gmail.com', NULL, '01815440629', NULL, NULL, '$2y$12$zWTSKRl/k8FiCPXgstcvZe366rZ3wgjArPh55KkepFYyvLCa4Dsge', 'user', 1, NULL, 0, NULL, '2025-07-06 22:21:07', '2025-07-06 22:21:07', NULL, NULL),
(162, 'Ahsan Habib   Chowdhury', 'ahsanembd@gmail.com', NULL, '01713007250', NULL, NULL, '$2y$12$wGQNUMhzTXPbaSk4eDZzH.TzllUOGuYOLoI2DOMXj.JUc1ahxRVqi', 'user', 1, NULL, 0, NULL, '2025-07-06 22:25:44', '2025-07-06 22:25:44', NULL, NULL),
(163, 'Jakir Hossain Bablu', 'anandaembroidery@yahoo.com', NULL, '0182013777', NULL, NULL, '$2y$12$ovlRbIfMhkNJxh7QOnEOSexEP3nr1./k2vZhB94IlmEQb4GQsoGMm', 'user', 1, NULL, 0, NULL, '2025-07-06 22:36:40', '2025-07-06 22:36:40', NULL, NULL),
(164, 'Muhammad Abul Kasem', 'annexembroiderylimited@yahoo.com', NULL, '01973142488', NULL, NULL, '$2y$12$ASlVdDDfAhjPMXx3lG1xi.IV18HOLp4GQ2Li.EJfbS4Qkh7EM9BCq', 'user', 1, NULL, 0, NULL, '2025-07-06 22:40:55', '2025-07-06 22:40:55', NULL, NULL),
(165, 'adminedan', 'wongedan123@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$gnK/SFqnol9bzpDPrKODWO8zqkKJMBcmWTtd7jHs6NaXCRYECgRb6', 'user', 1, NULL, 0, NULL, '2025-07-06 22:53:35', '2025-07-06 22:53:35', NULL, NULL),
(166, 'Md. Abdullah Chowdhury', 'saiful.anonto2019@gmail.com', NULL, '01819086874', NULL, NULL, '$2y$12$0UPCz3svd1CbtyP0dhiIgeY.QXKTfkrgiOfzaJkPUGmkvo3hkbG8S', 'user', 1, NULL, 0, NULL, '2025-07-06 23:03:38', '2025-07-06 23:03:38', NULL, NULL),
(167, 'Md. Alamgir Howlader', 'antoraembroidery@yahoo.com', NULL, '01991993801', NULL, NULL, '$2y$12$gDmPBf9xmdZFjOQ4nwZ76uR8j8cxB06WU/wbGVxkLkcYsc9fQuObu', 'user', 1, NULL, 0, NULL, '2025-07-06 23:07:09', '2025-07-06 23:07:09', NULL, NULL),
(168, 'Didarul Anowar Forkan', 'anwarfashion18@gmail.com', NULL, '01711831788', NULL, NULL, '$2y$12$dRo.MmO7KGHBds61njTOLuAf0nsGWCsrglD8voWhxKL86v.TXgu2a', 'user', 1, NULL, 0, NULL, '2025-07-06 23:17:54', '2025-07-06 23:17:54', NULL, NULL),
(169, 'S.M. Zahedul Alam', 'apparelplusembroidery@gmail.com', NULL, '01913806882', NULL, NULL, '$2y$12$OhtXgSpU74cQ/Rfmn6K3iu0dsfpqr4NL1YYLxC2lcLoo1uv9v9n9q', 'user', 1, NULL, 0, NULL, '2025-07-06 23:21:58', '2025-07-06 23:21:58', NULL, NULL),
(170, 'Iqbal Khan Jamal', 'arshadembo@gmail.com', NULL, '01819225229', NULL, NULL, '$2y$12$f64qUK3HAERXS0.ClOgftu.Zk1OimCAO9jaKjfvU7xZ5zaZnGTC6S', 'user', 1, NULL, 0, NULL, '2025-07-06 23:27:44', '2025-07-06 23:27:44', NULL, NULL),
(171, 'Anwer Ul Islam', 'askembroidery2015@gmail.com', NULL, '01687026588', NULL, NULL, '$2y$12$hkq4zNt1LgbzE597A9EhhOAr38kB72ppJxnGTkK6J2/PPkiZBmh6G', 'user', 1, NULL, 0, NULL, '2025-07-07 00:06:33', '2025-07-07 00:06:33', NULL, NULL),
(172, 'Abdullah Al Mamun', 'aunim.fashion@gmail.com', NULL, '01711565009', NULL, NULL, '$2y$12$tkL5n9ny8LwKmXEPukdE5O2lxzlLbWmDWJ6fyATkNyODE//gwZDcK', 'user', 1, NULL, 0, NULL, '2025-07-07 00:09:44', '2025-07-07 00:09:44', NULL, NULL),
(173, 'Md. Asaduzzam Sumon', 'ayantextilebdi@gmail.com', NULL, '01937649140', NULL, NULL, '$2y$12$WB42Vk/HDRDgZR9xvY1hTOAcKTazQLT5RV1Gnhz22WRzgPh.Ru/4G', 'user', 1, NULL, 0, NULL, '2025-07-07 00:20:34', '2025-07-07 00:20:34', NULL, NULL),
(174, 'Lee Choung Won', 'bdk.emb2013@gmail.com', NULL, '01767695092', NULL, NULL, '$2y$12$k9TmhjSBp8RHDrBmew.obeWPYb6TP7T3Tayyg93BbSQMqPyN9apXm', 'user', 1, NULL, 0, NULL, '2025-07-07 00:39:20', '2025-07-07 00:39:20', NULL, NULL),
(175, 'Md. Jamal Uddin', 'basicembroidery@gmail.com', NULL, '01714041373', NULL, NULL, '$2y$12$y8LXCdCMTsAqRSM53f86J.z5vgyEEhEv4v1xrrHXPNqF81BBxKDwC', 'user', 1, NULL, 0, NULL, '2025-07-07 00:47:19', '2025-07-07 00:47:19', NULL, NULL),
(176, 'A.T.M Zaglul Hossain', 'zaglul_hossain@yahoo.com', NULL, '01715984411', NULL, NULL, '$2y$12$Mg.AFJnooplPYCOSXD48Ae2Tp6jgpffB02AFtMO9G3lSO2xm86Aqy', 'user', 1, NULL, 0, NULL, '2025-07-07 01:01:04', '2025-07-10 03:22:26', NULL, NULL),
(177, 'SnnmCtuRcohezUR', 'harpheppua1980@gmail.com', NULL, '2153356090', NULL, NULL, '$2y$12$kMY7acsbNgSfwpOWInKw5eqsHw6O/hhp44YVewV.90WrZCcj2CSVa', 'user', 1, NULL, 0, NULL, '2025-07-07 01:15:19', '2025-07-07 01:15:19', NULL, NULL),
(178, 'Md. Abdur Rahim', 'combined.rahim84@gmail.com', NULL, '01819277360', NULL, NULL, '$2y$12$RCoZLEb2K2oHEUiUn0KKfe9jh.Auv0/FNwSYaEgiJae8/2tJvxNie', 'user', 1, NULL, 0, NULL, '2025-07-07 01:20:30', '2025-07-07 01:20:30', NULL, NULL),
(179, 'Mohammad Ismail', 'combinedfashions@gmail.com', NULL, '01715054110', NULL, NULL, '$2y$12$kg3A.QlkHDwUDEgtwBfVs.eg.BrqbwTUaBadsQ1P.SaE9ISqNxP3W', 'user', 1, NULL, 0, NULL, '2025-07-07 01:33:14', '2025-07-07 01:33:14', NULL, NULL),
(180, 'Md. Mahamuder Rahman ( Ripon)', 'daffodilemb_10@yahoo.com', NULL, '01715321227', NULL, NULL, '$2y$12$X.lyoUr8p0F.ETlfR9AhS.Idq5XRZtOezyOSICl9r4TotghvqokES', 'user', 1, NULL, 0, NULL, '2025-07-07 01:40:42', '2025-07-07 01:40:42', NULL, NULL),
(181, 'Md. Elias Hossen', 'dalasemp@gmail.com', NULL, '01855808077', NULL, NULL, '$2y$12$.qv7MhfcVR8sSqwDrZqP..Q9ZzgAXtbgyFyy55JbOlem9A4HaZX2a', 'user', 1, NULL, 0, NULL, '2025-07-07 02:33:48', '2025-07-07 02:33:48', NULL, NULL),
(182, 'Md. Khurshid Zaman', 'designcreatorkz@gmail.com', NULL, '01911505857', NULL, NULL, '$2y$12$GkaqWhfQZX.uHHpfBt45AeiBeqSv7RFf3y9n6wJBRY6nAUJdRuXQi', 'user', 1, NULL, 0, NULL, '2025-07-07 02:38:32', '2025-07-07 02:38:32', NULL, NULL),
(183, 'Kang Chang Youn', 'cykang@yupoong.co.kr', NULL, '01741944029', NULL, NULL, '$2y$12$DmeudThAVM5lsSMAA0vLnuOPwEc8esIWIjCpJSQd.iyxWmzdewGEq', 'user', 1, NULL, 0, NULL, '2025-07-07 02:47:17', '2025-07-07 02:47:17', NULL, NULL),
(184, 'Md. Gulzer Hossain', 'gulzer@worldvictorybd.com', NULL, '01711692102', NULL, NULL, '$2y$12$E3B4MZYNQYS.y0Y.cO/gXeACnROEC5VP2/l1udLpVav7qFwRCq1Gm', 'user', 1, NULL, 0, NULL, '2025-07-07 03:05:21', '2025-07-07 03:05:21', NULL, NULL),
(185, 'Md. Abdul Awal', 'elitefashionbd@gmail.com', NULL, '01713038827', NULL, NULL, '$2y$12$uVL3czwBrQYJR1vnmUiuZ.OrFzRoeU9ed2z7Bq98qRzyTiukkQz3m', 'user', 1, NULL, 0, NULL, '2025-07-07 03:36:33', '2025-07-07 03:36:33', NULL, NULL),
(186, 'Hosen Mohammad Rashid (Mamun)', 'epschoice2017@gmail.com', NULL, '01815462915', NULL, NULL, '$2y$12$gBzeIr8PA91RukaxMTGfHeMUDaIC/sJC79YmuRUQjGqDLWsi0cBIy', 'user', 1, NULL, 0, NULL, '2025-07-07 04:16:38', '2025-07-07 04:16:38', NULL, NULL),
(187, 'Ashadur Rahman (Rubel)', 'nishi_trade@yahoo.com', NULL, '01815439113', NULL, NULL, '$2y$12$.NGKfLZ9FOyXvzHq3RwrE.5W0pJWb03LpJWpNHg2mInLBqSESodNe', 'user', 1, NULL, 0, NULL, '2025-07-07 04:26:04', '2025-07-07 04:26:04', NULL, NULL),
(188, 'Md. Kamal Uddin', 'kamaluddin88440@gmail.com', NULL, '01759314488', NULL, NULL, '$2y$12$G.Av2BiqCsBAJP1YzESGU.VC3wJGi97lA10Op3B0a7xQOC02GjILq', 'user', 1, NULL, 0, NULL, '2025-07-07 04:37:51', '2025-07-07 04:37:51', NULL, NULL),
(189, 'eVXLHRWf', 'reinhansonik1982@gmail.com', NULL, '9331349647', NULL, NULL, '$2y$12$sguCTGYgtnGw6mT8l9mCfeGqxcdFrECXGGt.Zd0g2/WByDuret6.K', 'user', 1, NULL, 0, NULL, '2025-07-07 19:11:20', '2025-07-07 19:11:20', NULL, NULL),
(190, 'Shohel Rana', 'hspfashion93@gmail.com', NULL, '01911492965', NULL, NULL, '$2y$12$XOW6bMAvc49zCqZK9rqS8OtvpqWpy37sj4a.e5wPksdXJ.Fvy2A.q', 'user', 1, NULL, 0, NULL, '2025-07-07 22:22:37', '2025-07-07 22:22:37', NULL, NULL),
(191, 'Md. Alauddin Al Mahmud', 'heritageemb@yahoo.com', NULL, '01827830543', NULL, NULL, '$2y$12$gJjP.B21Twab8vNqrbSIcO9TvpG4.u0PqziWkEEwe2j/IfPtJ4uoy', 'user', 1, NULL, 0, NULL, '2025-07-07 22:27:55', '2025-07-07 22:27:55', NULL, NULL),
(192, 'Md. Biplob Hossain Howlader', 'howladeremb@gmail.com', NULL, '01711561180', NULL, NULL, '$2y$12$LIOCy94mOuxN8G8GYGogEOy17WTCVxbqWBmA9tk9B7oKCF5/8fYES', 'user', 1, NULL, 0, NULL, '2025-07-07 22:33:08', '2025-07-07 22:33:08', NULL, NULL),
(193, 'Foysal Ahmed', 'idealfashion_dhk@yahoo.com', NULL, '01715948565', NULL, NULL, '$2y$12$VRc3xB/hDFKPdUYN00yuDuecgJp9ZnWilUjxaP4hj2WFzJkSXT9IS', 'user', 1, NULL, 0, NULL, '2025-07-07 22:36:52', '2025-07-07 22:36:52', NULL, NULL),
(194, 'Md. Akter Hossain Shohel', 'imperialemb@yahoo.com', NULL, '01819291455', NULL, NULL, '$2y$12$q.59gRMLvqKTxo7n3yPunOv2lhvGAs9wQM8fRWROcJjPhj9rkDE/G', 'user', 1, NULL, 0, NULL, '2025-07-07 22:39:21', '2025-07-07 22:39:21', NULL, NULL),
(195, 'Mohammed Rokunuzzaman', 'kauser@indesore.com', NULL, '01730045179', NULL, NULL, '$2y$12$uTSeRO7ptuMQFeVNjlpEUuGN7Xd64BjmwglfhlMfLmYbcrZSY/O6e', 'user', 1, NULL, 0, NULL, '2025-07-07 22:42:58', '2025-07-07 22:42:58', NULL, NULL),
(196, 'Md. Sharif Hossain Khan', 'mailarif95@gmail.com', NULL, '01716832210', NULL, NULL, '$2y$12$NFqv/YTjXIneM.NFwcjRbuPA6vfJ1dO6IZDhZIhP.rSNYeZr0p.3S', 'user', 1, NULL, 0, NULL, '2025-07-08 01:17:50', '2025-07-08 01:17:50', NULL, NULL),
(197, 'Md. Abdul Mannan', 'mamannan1769@gmail.com', NULL, '01922751769', NULL, NULL, '$2y$12$HxBJMI/l1l3tV3zApcWpSODe8lFUzn0frIew4VsKTq39bWTX7.dSO', 'user', 1, NULL, 0, NULL, '2025-07-08 01:31:14', '2025-07-08 01:31:14', NULL, NULL),
(198, 'A.K. Zaman', 'juizaman123@gmail.com', NULL, '01632746044', NULL, NULL, '$2y$12$YsHxzPa9SFrfnYsNVA6hgeZslMofdaM8JLyTOk.RTPsyLrJ5aD8Xy', 'user', 1, NULL, 0, NULL, '2025-07-08 02:30:19', '2025-07-08 02:30:19', NULL, NULL),
(199, 'Md. Abidur Rahman', 'juniper@babylon-bd.com', NULL, '01819216007', NULL, NULL, '$2y$12$lpxmTz8Jpns9xGqCIsEakuZUz46QO4pC1IjYvON/JSUrJbP94ZJWO', 'user', 1, NULL, 0, NULL, '2025-07-08 02:46:36', '2025-07-08 02:46:36', NULL, NULL),
(200, 'Md. Mahbub Al Mamun', 'kolpotoruinternational@gmail.com', NULL, '01713143070', NULL, NULL, '$2y$12$8L4jVxdCBy50P/QY6AYkCumguT7PIwFvxV5OOjJDnqyDNLZ/sIq1i', 'user', 1, NULL, 0, NULL, '2025-07-08 03:15:28', '2025-07-08 03:15:28', NULL, NULL),
(201, 'Mohammad H. Sattar', 'daulat@utahgroup.net', NULL, '01711524235', NULL, NULL, '$2y$12$UZPVQFvX4RZbMZ6pFjqPjud94t/ADawNM2CuLkC39gJtIkTII41ka', 'user', 1, NULL, 0, NULL, '2025-07-08 03:21:01', '2025-07-08 03:21:01', NULL, NULL),
(202, 'Khondoker Mizanur Rahman', 'lucky@sldhaka.com', NULL, '01819272536', NULL, NULL, '$2y$12$GBfIBigqrHFCxYNvwYDK6e9VXMhk4XoFZFNAcMk81VldICVXN563u', 'user', 1, NULL, 0, NULL, '2025-07-08 03:25:02', '2025-07-08 03:25:02', NULL, NULL),
(203, 'cSkfUEYy', 'solomongarrikst@gmail.com', NULL, '7186036578', NULL, NULL, '$2y$12$7MTPZyQjVmhfXK5l798PGuYxCxdHQJc2vY70G7o2S/QPwRdidZtpK', 'user', 1, NULL, 0, NULL, '2025-07-08 03:26:31', '2025-07-08 03:26:31', NULL, NULL),
(204, 'Md. Mostafa Khan', 'mmkhanex@gmail.com', NULL, '01711287926', NULL, NULL, '$2y$12$kpUlq6.cqhFYNsXrOqDNqevmEsPMwZp16tl.RnMfTkCgqf6o8d.dK', 'user', 1, NULL, 0, NULL, '2025-07-08 03:38:27', '2025-07-08 03:38:27', NULL, NULL),
(205, 'zia', 'zia@gmail.com', NULL, '01645628593', NULL, NULL, '$2y$12$Gj/jEBtOJERim7Ed4o94zuhkJeDh1yNCpHvih7dTJs/cxNeMUtaJ.', 'user', 1, NULL, 0, NULL, '2025-07-08 13:03:54', '2025-07-08 13:03:54', NULL, NULL),
(206, 'wpNvxVKK', 'gui.whit9637@yahoo.com', NULL, '5444263302', NULL, NULL, '$2y$12$jU0/vQgZFoqJvcuVygW4f.k2RMjscl8t7nrf0c855m6RqwaMYU7fe', 'user', 1, NULL, 0, NULL, '2025-07-08 14:53:45', '2025-07-08 14:53:45', NULL, NULL),
(207, 'Nur Mohammad', 'nur976172@gmail.com', NULL, '01715909343', NULL, NULL, '$2y$12$ytngpdw2bcmDEQItQcT0yu839TMPXYlKgUt.tz60K2KejHXYtTXNm', 'user', 1, NULL, 0, NULL, '2025-07-09 03:28:22', '2025-07-09 03:28:22', NULL, NULL),
(208, 'gtsDpwzEcyT', 'edwardslusi21@gmail.com', NULL, '2091696877', NULL, NULL, '$2y$12$nNvM0qkBp7PZn2ZUThBGfuIk1LaqOaGZn6gVXl98O85hN9qcj4F5e', 'user', 1, NULL, 0, NULL, '2025-07-09 07:14:10', '2025-07-09 07:14:10', NULL, NULL),
(209, 'hFmMcUYXtq', 'sherloklbj16@gmail.com', NULL, '4691824734', NULL, NULL, '$2y$12$BXIYOR.b4rAmUAKEyk3LEe.hII94Pzxqe2METOsYaq8/XUMvZGGfW', 'user', 1, NULL, 0, NULL, '2025-07-09 15:53:06', '2025-07-09 15:53:06', NULL, NULL),
(210, 'GDCwCMKziGJNlmO', 'acesiwitap444@gmail.com', NULL, '4462013169', NULL, NULL, '$2y$12$Z8EJ8/typMFhX/A/zfSeN..zztadln8j00ZDZVvi21w32J/bL5tqO', 'user', 1, NULL, 0, NULL, '2025-07-09 23:05:40', '2025-07-09 23:05:40', NULL, NULL),
(211, 'LeonardLom', 'kevinrifini@onet.pl', NULL, '1471', NULL, NULL, '$2y$12$XruTsrMiE5.c8OgGOS4vX.t1ctb/tgTU2912ybl0SlKc8avDSMrZK', 'user', 1, NULL, 0, NULL, '2025-07-10 03:16:14', '2025-07-10 03:16:14', NULL, NULL),
(212, 'Saad Rahim Chowdhury', 'saadchow@gmail.com', NULL, '01713002900', NULL, NULL, '$2y$12$Im4nhC37CyXavBJMM035gOsaRd21whrtu9PHOsov.lTvofdjDZDwW', 'user', 1, NULL, 0, NULL, '2025-07-10 03:59:59', '2025-07-10 03:59:59', NULL, NULL),
(213, 'Md. Ariful  Islam (Montu)', 'maafashionmontu@gmail.com', NULL, '01913380277', NULL, NULL, '$2y$12$uALfjP.NE86bWh9MuiiHeelwg.CKTlyDFSMkcT1ziXJ9H14CC45G.', 'user', 1, NULL, 0, NULL, '2025-07-10 04:11:41', '2025-07-10 04:11:41', NULL, NULL),
(214, 'LavillSog', 'revers711@1ti.ru', NULL, '1420', NULL, NULL, '$2y$12$BSAixUwe/NOcsyPkntNlfeKFXoeEK6/B6JvCIdXCXsau1x2tXL7py', 'user', 1, NULL, 0, NULL, '2025-07-10 04:53:43', '2025-07-10 04:53:43', NULL, NULL),
(215, 'Asif', 'asif@gmail.com', NULL, '01758040074', NULL, NULL, '$2y$12$VnULqo23gvXGZcAEvifF7eyys2kDlqUsMCz.xtPDrdG4iJYKk8Lp6', 'user', 1, NULL, 0, NULL, '2025-07-14 01:10:12', '2025-07-14 01:10:12', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `breezy_sessions`
--
ALTER TABLE `breezy_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `breezy_sessions_authenticatable_type_authenticatable_id_index` (`authenticatable_type`,`authenticatable_id`);

--
-- Indexes for table `bulk_sms_b_d_logs`
--
ALTER TABLE `bulk_sms_b_d_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `certificate_requests`
--
ALTER TABLE `certificate_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `certificate_requests_expense_id_foreign` (`expense_id`),
  ADD KEY `certificate_requests_user_id_foreign` (`user_id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `donations_user_id_foreign` (`user_id`),
  ADD KEY `donations_expense_id_foreign` (`expense_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_user_id_foreign` (`user_id`);

--
-- Indexes for table `event_joined_companies`
--
ALTER TABLE `event_joined_companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_joined_companeys_event_id_foreign` (`event_id`),
  ADD KEY `event_joined_companeys_user_id_foreign` (`user_id`),
  ADD KEY `event_joined_companeys_expense_id_foreign` (`expense_id`);

--
-- Indexes for table `event_members`
--
ALTER TABLE `event_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_members_event_id_foreign` (`event_id`),
  ADD KEY `event_members_user_id_foreign` (`user_id`);

--
-- Indexes for table `event_member_tokens`
--
ALTER TABLE `event_member_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `1` (`event_member_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fblog_categories`
--
ALTER TABLE `fblog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fblog_categories_name_unique` (`name`),
  ADD UNIQUE KEY `fblog_categories_slug_unique` (`slug`);

--
-- Indexes for table `fblog_category_fblog_post`
--
ALTER TABLE `fblog_category_fblog_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fblog_category_fblog_post_post_id_foreign` (`post_id`),
  ADD KEY `fblog_category_fblog_post_category_id_foreign` (`category_id`);

--
-- Indexes for table `fblog_comments`
--
ALTER TABLE `fblog_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fblog_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `fblog_news_letters`
--
ALTER TABLE `fblog_news_letters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fblog_news_letters_email_unique` (`email`);

--
-- Indexes for table `fblog_posts`
--
ALTER TABLE `fblog_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fblog_posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `fblog_post_fblog_tag`
--
ALTER TABLE `fblog_post_fblog_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fblog_post_fblog_tag_post_id_foreign` (`post_id`),
  ADD KEY `fblog_post_fblog_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `fblog_seo_details`
--
ALTER TABLE `fblog_seo_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fblog_seo_details_post_id_foreign` (`post_id`);

--
-- Indexes for table `fblog_settings`
--
ALTER TABLE `fblog_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fblog_share_snippets`
--
ALTER TABLE `fblog_share_snippets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fblog_tags`
--
ALTER TABLE `fblog_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fblog_tags_name_unique` (`name`),
  ADD UNIQUE KEY `fblog_tags_slug_unique` (`slug`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `memberships`
--
ALTER TABLE `memberships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `memberships_user_id_foreign` (`user_id`),
  ADD KEY `memberships_expense_id_foreign` (`expense_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`),
  ADD KEY `menu_items_parent_id_foreign` (`parent_id`),
  ADD KEY `menu_items_linkable_type_linkable_id_index` (`linkable_type`,`linkable_id`);

--
-- Indexes for table `menu_locations`
--
ALTER TABLE `menu_locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu_locations_location_unique` (`location`),
  ADD KEY `menu_locations_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notices_user_id_foreign` (`user_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_parent_id_unique` (`slug`,`parent_id`),
  ADD KEY `pages_parent_id_foreign` (`parent_id`),
  ADD KEY `pages_title_index` (`title`),
  ADD KEY `pages_layout_index` (`layout`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `renew_memberships`
--
ALTER TABLE `renew_memberships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `renew_memberships_user_id_foreign` (`user_id`),
  ADD KEY `renew_memberships_membership_id_foreign` (`membership_id`),
  ADD KEY `renew_memberships_expense_id_foreign` (`expense_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_group_name_unique` (`group`,`name`);

--
-- Indexes for table `sponsors`
--
ALTER TABLE `sponsors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sponsors_expense_id_foreign` (`expense_id`),
  ADD KEY `sponsors_user_id_foreign` (`user_id`);

--
-- Indexes for table `taggables`
--
ALTER TABLE `taggables`
  ADD UNIQUE KEY `taggables_tag_id_taggable_id_taggable_type_unique` (`tag_id`,`taggable_id`,`taggable_type`),
  ADD KEY `taggables_taggable_type_taggable_id_index` (`taggable_type`,`taggable_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `breezy_sessions`
--
ALTER TABLE `breezy_sessions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bulk_sms_b_d_logs`
--
ALTER TABLE `bulk_sms_b_d_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `certificate_requests`
--
ALTER TABLE `certificate_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `event_joined_companies`
--
ALTER TABLE `event_joined_companies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `event_members`
--
ALTER TABLE `event_members`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `event_member_tokens`
--
ALTER TABLE `event_member_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fblog_categories`
--
ALTER TABLE `fblog_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fblog_category_fblog_post`
--
ALTER TABLE `fblog_category_fblog_post`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fblog_comments`
--
ALTER TABLE `fblog_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fblog_news_letters`
--
ALTER TABLE `fblog_news_letters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fblog_posts`
--
ALTER TABLE `fblog_posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fblog_post_fblog_tag`
--
ALTER TABLE `fblog_post_fblog_tag`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fblog_seo_details`
--
ALTER TABLE `fblog_seo_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fblog_settings`
--
ALTER TABLE `fblog_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fblog_share_snippets`
--
ALTER TABLE `fblog_share_snippets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fblog_tags`
--
ALTER TABLE `fblog_tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `memberships`
--
ALTER TABLE `memberships`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `menu_locations`
--
ALTER TABLE `menu_locations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `renew_memberships`
--
ALTER TABLE `renew_memberships`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sponsors`
--
ALTER TABLE `sponsors`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `certificate_requests`
--
ALTER TABLE `certificate_requests`
  ADD CONSTRAINT `certificate_requests_expense_id_foreign` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`id`),
  ADD CONSTRAINT `certificate_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `donations`
--
ALTER TABLE `donations`
  ADD CONSTRAINT `donations_expense_id_foreign` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `donations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_joined_companies`
--
ALTER TABLE `event_joined_companies`
  ADD CONSTRAINT `event_joined_companeys_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `event_joined_companeys_expense_id_foreign` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`id`),
  ADD CONSTRAINT `event_joined_companeys_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_members`
--
ALTER TABLE `event_members`
  ADD CONSTRAINT `event_members_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `event_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_member_tokens`
--
ALTER TABLE `event_member_tokens`
  ADD CONSTRAINT `1` FOREIGN KEY (`event_member_id`) REFERENCES `event_members` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fblog_category_fblog_post`
--
ALTER TABLE `fblog_category_fblog_post`
  ADD CONSTRAINT `fblog_category_fblog_post_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `fblog_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fblog_category_fblog_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `fblog_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fblog_comments`
--
ALTER TABLE `fblog_comments`
  ADD CONSTRAINT `fblog_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `fblog_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fblog_posts`
--
ALTER TABLE `fblog_posts`
  ADD CONSTRAINT `fblog_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fblog_post_fblog_tag`
--
ALTER TABLE `fblog_post_fblog_tag`
  ADD CONSTRAINT `fblog_post_fblog_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `fblog_posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fblog_post_fblog_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `fblog_tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fblog_seo_details`
--
ALTER TABLE `fblog_seo_details`
  ADD CONSTRAINT `fblog_seo_details_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `fblog_posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `memberships`
--
ALTER TABLE `memberships`
  ADD CONSTRAINT `memberships_expense_id_foreign` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `memberships_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menu_items` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `menu_locations`
--
ALTER TABLE `menu_locations`
  ADD CONSTRAINT `menu_locations_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notices`
--
ALTER TABLE `notices`
  ADD CONSTRAINT `notices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `renew_memberships`
--
ALTER TABLE `renew_memberships`
  ADD CONSTRAINT `renew_memberships_expense_id_foreign` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `renew_memberships_membership_id_foreign` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `renew_memberships_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sponsors`
--
ALTER TABLE `sponsors`
  ADD CONSTRAINT `sponsors_expense_id_foreign` FOREIGN KEY (`expense_id`) REFERENCES `expenses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sponsors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taggables`
--
ALTER TABLE `taggables`
  ADD CONSTRAINT `taggables_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
