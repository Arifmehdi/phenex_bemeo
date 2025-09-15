-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 26, 2025 at 11:27 AM
-- Server version: 11.4.4-MariaDB
-- PHP Version: 8.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bemeabdc_bemea`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `link` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `show_from` timestamp NULL DEFAULT NULL,
  `show_until` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`id`, `title`, `content`, `is_active`, `link`, `image`, `show_from`, `show_until`, `created_at`, `updated_at`) VALUES
(2, 'BEMEA OFFICE GRAND OPENING CEREMONY ', NULL, 1, 'https://bemeabd.com/', 'advertisements/01K0E0E5AXVCMHXBEAKC8DAR5S.jpg', '2025-07-16 18:52:59', '2025-07-19 18:53:02', '2025-07-17 06:03:04', '2025-07-18 05:34:43'),
(3, 'BEMEA OFFICE GRAND OPENING CEREMONY ', NULL, 0, 'https://bemeabd.com/members', 'advertisements/01K0BPZ4688804PH5JFFK56A6K.jpg', NULL, '2025-07-19 08:10:43', '2025-07-17 08:10:44', '2025-07-17 11:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` char(36) NOT NULL,
  `tab` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `default` longtext DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `breezy_sessions`
--

CREATE TABLE `breezy_sessions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `authenticatable_type` varchar(255) NOT NULL,
  `authenticatable_id` bigint(20) UNSIGNED NOT NULL,
  `panel_id` varchar(255) DEFAULT NULL,
  `guard` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bulk_sms_b_d_logs`
--

CREATE TABLE `bulk_sms_b_d_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `to` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `response` text DEFAULT NULL,
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
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificate_requests`
--

CREATE TABLE `certificate_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_type` varchar(50) NOT NULL,
  `director_name` varchar(255) NOT NULL,
  `nominated_director` varchar(255) DEFAULT NULL,
  `address` text NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `certificate_fee` decimal(10,2) NOT NULL,
  `receipt_no` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `year` int(11) NOT NULL,
  `verification_image_path` varchar(255) NOT NULL,
  `certificate_collect_date` timestamp NULL DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `expense_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `donor_name` varchar(255) DEFAULT NULL,
  `donor_email` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(255) NOT NULL DEFAULT 'BDT',
  `message` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `payment_method` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `is_anonymous` tinyint(1) NOT NULL DEFAULT 0,
  `expense_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `join_deadline` datetime NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_free` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `title`, `description`, `join_deadline`, `image`, `is_free`, `created_at`, `updated_at`) VALUES
(16, 28, 'picnic 2026', 'upcoming picnic ', '2025-07-30 13:06:05', 'event-photo/01K0GR3F03E0SEFSXNQ6BSW5BV.heic', 0, '2025-07-19 07:06:47', '2025-07-19 07:06:47');

-- --------------------------------------------------------

--
-- Table structure for table `event_joined_companies`
--

CREATE TABLE `event_joined_companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expense_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_joined_companies`
--

INSERT INTO `event_joined_companies` (`id`, `event_id`, `user_id`, `amount`, `paid`, `created_at`, `updated_at`, `expense_id`) VALUES
(28, 16, 28, 5000.00, 0, '2025-07-19 07:08:38', '2025-07-19 07:08:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_members`
--

CREATE TABLE `event_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `relation` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `event_joined_company_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `event_members`
--

INSERT INTO `event_members` (`id`, `event_id`, `user_id`, `relation`, `amount`, `paid`, `approved`, `created_at`, `updated_at`, `name`, `age`, `image`, `event_joined_company_id`) VALUES
(139, 16, 28, 'Son', 2000.00, 0, 0, '2025-07-19 07:08:39', '2025-07-19 07:08:39', 'khan', 15, 'event_member_photos/tbWQRd20dzgfvSsZhdFJ5p3xlQ03GtgznJV6SNaM.png', 28),
(140, 16, 28, 'Son', 1000.00, 0, 0, '2025-07-19 07:08:39', '2025-07-19 07:08:39', 'khan 2', 8, 'event_member_photos/7p3OXX5B1Lrrv3dWFhBNs0YvEdmknfdbWCGE88Is.png', 28),
(141, 16, 28, 'Daughter', 2000.00, 0, 0, '2025-07-19 07:08:39', '2025-07-19 07:08:39', 'khan 3', 25, 'event_member_photos/n826cnChbkXgwBEVsO4fzkRyBQrtnvG1sKUfM4zo.jpg', 28);

-- --------------------------------------------------------

--
-- Table structure for table `event_member_tokens`
--

CREATE TABLE `event_member_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `event_member_id` bigint(20) UNSIGNED NOT NULL,
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `done_at` timestamp NULL DEFAULT NULL,
  `is_done` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `category` varchar(255) DEFAULT NULL,
  `expense_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` enum('income','expense') NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `note` text DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `date`, `category`, `expense_category_id`, `amount`, `type`, `is_verified`, `note`, `images`, `created_at`, `updated_at`) VALUES
(92, '2025-07-02 23:45:23', 'membership', NULL, 30000.00, 'income', 0, 'membership id 0100', NULL, '2025-07-02 23:45:23', '2025-07-02 23:45:23'),
(95, '2025-07-07 03:33:50', 'membership', NULL, 14000.00, 'income', 0, 'membership id 0142', NULL, '2025-07-07 03:33:50', '2025-07-07 03:33:50'),
(96, '2025-07-14 00:02:10', 'membership', NULL, 30000.00, 'income', 0, 'membership id 0169', '[\"membership\\/payment_photos\\/OxckvTjeFC7DAmol3fOjEcMOODL4ZOXnVzCIfsLg.jpg\"]', '2025-07-14 00:02:10', '2025-07-14 00:02:40'),
(97, '2025-07-15 06:09:13', 'membership', NULL, 20000.00, 'income', 0, 'membership id 0258', NULL, '2025-07-15 06:09:13', '2025-07-15 06:09:13'),
(98, '2025-07-15 22:59:11', 'membership', NULL, 9000.00, 'income', 0, 'membership id 0267', NULL, '2025-07-15 22:59:11', '2025-07-15 22:59:11'),
(99, '2025-07-21 11:51:20', 'membership', NULL, 0.00, 'income', 0, 'membership id 2200856', NULL, '2025-07-21 11:51:20', '2025-07-21 11:51:20');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'bill', 1, '2025-07-16 15:33:06', '2025-07-16 15:33:06'),
(2, 'Conveyance', 1, '2025-07-17 07:50:02', '2025-07-17 07:50:02');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fblog_categories`
--

CREATE TABLE `fblog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(155) NOT NULL,
  `slug` varchar(155) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fblog_category_fblog_post`
--

CREATE TABLE `fblog_category_fblog_post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fblog_comments`
--

CREATE TABLE `fblog_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `approved_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fblog_news_letters`
--

CREATE TABLE `fblog_news_letters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL,
  `subscribed` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fblog_posts`
--

CREATE TABLE `fblog_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `body` longtext NOT NULL,
  `status` enum('published','scheduled','pending') NOT NULL DEFAULT 'pending',
  `published_at` datetime DEFAULT NULL,
  `scheduled_for` datetime DEFAULT NULL,
  `cover_photo_path` varchar(255) NOT NULL,
  `photo_alt_text` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fblog_post_fblog_tag`
--

CREATE TABLE `fblog_post_fblog_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fblog_seo_details`
--

CREATE TABLE `fblog_seo_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `keywords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`keywords`)),
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fblog_settings`
--

CREATE TABLE `fblog_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(155) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `organization_name` varchar(255) DEFAULT NULL,
  `google_console_code` tinytext DEFAULT NULL,
  `google_analytic_code` text DEFAULT NULL,
  `google_adsense_code` tinytext DEFAULT NULL,
  `quick_links` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`quick_links`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fblog_share_snippets`
--

CREATE TABLE `fblog_share_snippets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `script_code` longtext NOT NULL,
  `html_code` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fblog_tags`
--

CREATE TABLE `fblog_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `slug` varchar(155) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `desired_position` varchar(255) NOT NULL,
  `cv_path` varchar(255) NOT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `message` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_applications`
--

INSERT INTO `job_applications` (`id`, `name`, `email`, `phone`, `desired_position`, `cv_path`, `photo_path`, `is_active`, `message`, `location`, `created_at`, `updated_at`) VALUES
(6, 'khan', 'embroiderybd@gmail.com', '01711544994', 'designer', 'job_applications/cvs/lKcOEAwMnz0OXeYNmRFQ6B72jbgl7MUsgABt1xRd.docx', 'job_applications/photos/AOFXMoHIv6YokqXFOrcfYcmqMJz6MPEG30E6rMtX.jpg', 1, 'test', 'dhaka', '2025-07-19 06:47:23', '2025-07-19 06:47:53');

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE `memberships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `membership_id` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_type` enum('Limited Company','Proprietorship','Foreign Joint Venture') DEFAULT NULL,
  `director_name` varchar(255) DEFAULT NULL,
  `nominated_director` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `membership_fee` decimal(10,2) DEFAULT NULL,
  `due_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `machine_count` int(11) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `total_head` varchar(255) DEFAULT NULL,
  `needle_colors` varchar(255) DEFAULT NULL,
  `yearly_subscription` decimal(10,2) DEFAULT NULL,
  `discount` decimal(20,2) DEFAULT NULL,
  `advance_amount` decimal(20,2) DEFAULT NULL,
  `receipt_no` varchar(255) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_year` int(11) DEFAULT NULL,
  `sister_concerns` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `nomination_certificate` varchar(255) DEFAULT NULL,
  `trade_license` varchar(255) DEFAULT NULL,
  `factory_photos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`factory_photos`)),
  `director_photo` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `membership_expire_date` timestamp NULL DEFAULT NULL,
  `expense_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `existing_member` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `memberships`
--

INSERT INTO `memberships` (`id`, `user_id`, `membership_id`, `company_name`, `company_type`, `director_name`, `nominated_director`, `address`, `telephone`, `phone`, `email`, `gender`, `membership_fee`, `due_amount`, `machine_count`, `brand`, `total_head`, `needle_colors`, `yearly_subscription`, `discount`, `advance_amount`, `receipt_no`, `payment_date`, `payment_year`, `sister_concerns`, `remarks`, `nomination_certificate`, `trade_license`, `factory_photos`, `director_photo`, `is_active`, `membership_expire_date`, `expense_id`, `created_at`, `updated_at`, `existing_member`) VALUES
(75, 28, '0800395', 'Asha Design Maker', 'Proprietorship', 'Md Sarif Uddin Khan Momen', NULL, 'jongua, belabo, narsingdi, dhaka', '01711544994', '01711544994', 'embroiderybd@gmail.com', 'Male', 5000.00, 4000.00, 2, 'selhq', '40', '9', 2000.00, NULL, NULL, NULL, '2025-06-19', 1, 'asha group', NULL, NULL, 'membership/documents/01K0GQ63SQWK8F8SRJ4SEX6SFN.jpg', '[]', 'membership/photos/01K0GQ63SSYSGVZE1RFYX28N2Y.jpg', 1, '2025-07-30 18:00:00', NULL, '2025-06-19 06:11:33', '2025-07-19 06:50:45', 1),
(78, 84, '1400690', 'A K Fashion', 'Proprietorship', 'Abdullah Al Kamrul Hasan', NULL, 'House-2/I/3, Golden Street Ring Raod, Shaymoli, Adabor, Dhaka-1207.', NULL, '01727719507', 'kamrulbdctg@yahoo.com', 'Male', 5000.00, 19800.00, 3, 'Tajima, Tajin, & Grate', '46', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/oWdWb6BzCsYU1iANVHIJLm3Pp28XgSQtCHPiJzf7.jpg', '[]', 'membership/photos/qCI8GKXJLORSj3tL7hlE1H49WNxFvCcXjDanav6S.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-22 05:01:51', '2025-07-07 01:52:07', 1),
(79, 83, '1700749', 'A Boutiques Fashion', 'Proprietorship', 'Md. Abdul Hannan (Jashim)', NULL, 'Building No-03, Shop No-116/117 Chadni Chalk Shopping Complex 4th Floor, Dhaka-1205.', NULL, '01751863881', 'sajboutiques@gmail.com', 'Male', 5000.00, 14000.00, 4, 'Zhanyi & Atowin', '66', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/PKXT2VzxLeMrhrapA1OOCfrbtCUUTgEmurzwaieL.jpg', '[]', 'membership/photos/8lk0TCD0zTFEYCl4I0OZz3YTCBsHo68hhPzMKfL7.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-22 05:05:31', '2025-07-07 01:50:20', 1),
(81, 88, '1400674', 'A R Embroidery and Design Ltd.', 'Limited Company', 'Md. Shafiullah Mian', NULL, 'Ahad Nagar, Baipail, Kaichabari Road Ganakbari, Ashulia, Savar, Dhaka-1349', NULL, '01611613151', 'arfashionsnembroidery@gmail.com', 'Male', 10000.00, 55000.00, 12, 'Barudan & Sunstar', '240', '09', 10000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/W1fPTyFlmgeTEkjz5m64aM7c6jZ26mpmyaMkopjF.jpg', '[]', 'membership/photos/01JZMCBQGWJVPHZP4VBXFE1HB2.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-23 04:29:51', '2025-07-08 00:42:51', 1),
(83, 90, '1400646', 'A.R Corporation', 'Proprietorship', 'Md. Abdul Awal (Azgor)', NULL, 'House-2/C/3, Golden Street, Ring Road Shaymoli, Adabor, Dhaka-1207', NULL, '01615400306', 'arcorporation306@gmail.com', 'Male', 5000.00, 18000.00, 4, 'Autowin, Tajin, Tajima & Jintel', '60', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/oCAFOdVJBRz8llUnmUUgygnVqCTGSwoy6I8x58RW.jpg', '[]', 'membership/photos/0raF90kJBlpCiryD4iWrRtSKLIYfQ6Zn1xZTpdPT.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-23 04:57:33', '2025-07-07 23:32:57', 1),
(84, 91, '1900799', 'A.S Embroidery and Fashion', 'Proprietorship', 'Abdus Sattar', NULL, 'Kumkumari (Near Charabag Madrasha) Ashulia, Savar, Dhaka.', NULL, '01995109131', 'asembroidery69@gmail.com', 'Male', 5000.00, 10000.00, 3, 'Toper', '45', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/6GIc5tJ4btjfsQdeIA3IHfn2tRY906H7H5BlZDCt.jpg', '[]', 'membership/photos/Du5ofLuFFYVfHp2U0Kqxd5wt7QvrYfYiKtq8NEUu.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-23 05:03:51', '2025-07-07 01:40:30', 1),
(85, 92, '1900801', 'Aarian Enterprise', 'Proprietorship', 'Alauddin Miah Mahin', NULL, 'House # ka/1, Road # 11, Nikunja-02, Khilkhet, Dhaka-1229', NULL, '01730900785', 'hightechparts1@gmail.com', 'Male', 5000.00, 10000.00, 3, 'Hightech & HTM', '48', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/5pTjHz8DGK5Cc8qltWlp0zA2nzC7OlMXxJvEmszB.jpg', '[]', 'membership/photos/01JZHY3W3YVTWF8CHP4GHR1XR0.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-23 05:18:26', '2025-07-07 01:55:24', 1),
(86, 93, '1800762', 'Abrar Fashion Ltd.', 'Limited Company', 'Md. AB. Alim Miah', NULL, '26/1, Mogorkhal National University Gazipur Sadar, Gazipur', NULL, '01973245755', 'alim@abrarfashionltd.com', 'Male', 10000.00, 0.00, 12, 'Tajima & rechpeach', '195', '06 & 09', 10000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/5jIfDqwLvhT32Qg9a2DsjKsKfMcxXkbGdBTTBcvk.jpg', '[]', 'membership/photos/oOFCGLIeV25KhrimsACKppuqAIsSSzewNjzmp1nI.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-23 05:26:56', '2025-07-07 01:36:06', 1),
(87, 94, '1800764', 'Afraa Fashion', 'Proprietorship', 'Md. Anowar Hossain', NULL, 'Hindu Bari Moor, board Bazar National University, Gazipur, Sadar, Gazipur', NULL, '01911061615', 'anowar_rmp@yahoo.com', 'Male', 5000.00, 12000.00, 4, 'TFI Portugal, Saffi', '120', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/Zg65hctz1BRUWwRoXr5tvSBIxPy6UM3VU3hmToWa.jpg', '[]', 'membership/photos/Lu8gvZlQqVIOa4U6cAzn3RFImKkr8Jdckv3tYEza.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-23 05:47:17', '2025-07-07 01:34:49', 1),
(88, 99, '1000507', 'AHP Printing Limited', 'Limited Company', 'Golam Hafiz Chowdhury', NULL, '1615/1, Shahid Siddique Road South Khailkur, National Uniersity, Gazipur.', NULL, '01819237324', 'ahpprinting@gmaili.com', 'Male', 10000.00, 6000.00, 4, 'Richpeace & Sanming', '92', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/cDRe6fgb8PkxHDNTuXt2qkJT21WsOvdcSABVtKFr.jpg', '[]', 'membership/photos/96SCquij3BNFmqJO2sGxRlvWYOSNAwynsqkWB5L7.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-25 02:56:05', '2025-07-07 01:32:55', 1),
(89, 100, '1200555', 'Al-Araf Embroidery', 'Proprietorship', 'Md. Ashraf Hossain', NULL, 'House:712/22/E, Baitul Aman Housing Society, Road:10, Adabor, Dhaka-1207', NULL, '01911444657', 'apparelalaraf@yahoo.com', 'Male', 5000.00, 14000.00, 4, 'Autowin', '59', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/GHJlUraRo8KezRJsCxQsvvjChGzIa8I9feC8ymAG.jpg', '[]', 'membership/photos/DF7qr3zQUnu051PFCN0Br2Q6ZBXbQBgSKPGL3CC4.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-25 03:02:06', '2025-07-07 23:31:43', 0),
(90, 101, '1400658', 'Al-Baraka Embroidery Fashion', 'Proprietorship', 'Md. Mohi Uddin', NULL, 'House-74, Road-11, Munsurabad Housing Society, Adabor, Dhaka-1207.', NULL, '01763672259', 'albaraka@yahoo.com', 'Male', 5000.00, 14000.00, 3, 'China', '60', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/XwA58CMvZUOgZfN94HanD3J1YXjFpyb9TKuNmOdq.jpg', '[]', 'membership/photos/lBtdsiwyGGiCtmc6iYy4ZHYDzEXjxI1K6RMbZOKH.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-25 03:22:37', '2025-07-07 01:18:19', 1),
(91, 102, '1200626', 'Alyea Embroidery', 'Proprietorship', 'Md. Abdul Alim', NULL, 'House-808, Iqbal Bhaban Nishad Nagar, Dhour, Turag Uttara, Dhaka-1230.', NULL, '01711943856', 'alim@alyeabd.com', 'Male', 5000.00, 40000.00, 9, 'Tajima, Tajin, & China', '500', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/ExNOmmwm2KdD3BcpaPKyo9jhSkCOH0Gr40yeTqH0.jpg', '[]', 'membership/photos/AwzSLopED21vq4UuS6X7dwub8dScvRFpx7yhtlau.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-25 03:34:53', '2025-07-07 01:16:47', 1),
(94, 118, '0800390', 'Alif Embroidery Village Ltd.', 'Limited Company', 'Al Haj Mohammad Akter Hossain', NULL, 'Bangabandhu Road, Tonga Bari, Ashulia, Savar, Dhaka.', NULL, '01711592333', 'rana@aliflammim-bd.com', 'Male', 10000.00, 0.00, 150, 'Tajima, Tang, Sunsatr & Jintel', '2250', '09 For Flat & 4 Color Sequine', 10000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/XLRr7uME4ENC8uIBhrWjYZFAnqnvAZxgdG3E7HC8.jpg', '[]', 'membership/photos/01JZDE4HH28PSCVM91R8M2QR9T.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-28 22:37:34', '2025-07-15 06:53:46', 1),
(95, 119, '0900468', 'Alif Fashion', 'Proprietorship', 'Mohammad Tunjilur Rahman', NULL, 'House-42, Road-05, Sector-10 Uttara, Dhaka-1230.', NULL, '01720068341', 'aliffashion.50@gmail.com', 'Male', 5000.00, 5000.00, 4, 'Sunstar & China', '65', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01JZ5E3Q1EKWMM64G7QG3RKMVV.png', '[]', 'membership/photos/01JZ5E3Q1GSGEZRYCM2YMP6JJ3.png', 1, '2023-06-29 18:00:00', NULL, '2025-06-28 22:42:55', '2025-07-02 05:24:49', 0),
(96, 120, '1400684', 'Alif Stitches Embroidery', 'Proprietorship', 'Md. Tohidul Islam Mazumder (Sujan)', NULL, 'Holding- 94, Ward-08, Road-07, Block-A, Area kakob (Khaya Ghat)07 No, Birulia Savar, Dhaka', NULL, '01916808626', 'alifstitchesemb@gmail.com', 'Male', 5000.00, 18000.00, 4, 'Tajima & Sunstar', '86', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01JZ5EMCFHYECGWKN01VA1BJVR.png', '[]', 'membership/photos/01JZ5EMCFKNXZDYYDT29K69YVA.png', 1, '2016-12-30 18:00:00', NULL, '2025-06-28 22:53:37', '2025-07-02 05:33:55', 0),
(97, 121, '0500225', 'Alma Fashion', 'Proprietorship', 'Sheik M.A Wahid', NULL, '726/20/C Baitul Aman Housing Society Road-10, Adabor, Dhaka-1207', NULL, '01715072072', 'almafashionbd@yahoo.com', 'Male', 5000.00, 0.00, 3, 'Jintel, MTI & Hiking', '60', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01JZ5GH786E1RZFD1QA3Q2M50H.png', '[]', 'membership/photos/01JZ5GH78835AGRX6VGMWKMV9B.png', 1, '2025-12-30 18:00:00', NULL, '2025-06-28 22:57:46', '2025-07-02 06:07:08', 0),
(98, 122, '1200567', 'Al-Madina Embroidery', 'Proprietorship', 'Md. Mahabubul Kabir (Liton)', NULL, 'House-18, Block-F, Johuri Mohallha Mosque Market(1st Floor) Mohammadpur, Dhaka-1207', NULL, '01550552329', 'liton@087gmail.com', 'Male', 5000.00, 23000.00, 4, 'Autowin', '60', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/EeHT7Hu4EckzbfC02Le7BCU5Wf4pz3vYyH1OG2fV.jpg', '[]', 'membership/photos/01JZHVRKGDDV2JJ8S1J4ZDA2P0.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-28 23:05:40', '2025-07-07 01:14:18', 1),
(99, 123, '1900790', 'Al-Salim Trading', 'Proprietorship', 'Md. Al-Salim', NULL, '1794 Modinabag, Donia, Kadhamtoli, Dhaka-1236.', NULL, '01819116881', 'alsalimtrading1982@gmail.com', 'Male', 5000.00, 0.00, 2, 'Ari', '30', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/c6hw19248mu5hCaPQ5dmM41jzrtVIsfVd8hulJWt.jpg', '[]', 'membership/photos/oZRxcnCBuimF1SrE5l2BV1NEygCYTAVcKY94osRf.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-06-28 23:17:11', '2025-07-02 04:38:14', 0),
(101, 134, '0500214', 'Ultra Embroidery Ltd.', 'Limited Company', 'Md. Sharif Hossain Khan', NULL, 'Plot-381-383, Block-B, Bashundhara Project, Gazirchat, Ashulia, Savar, Dhaka.', NULL, '01726787870', 'sharifhossain.ultra@gmail.com', 'Male', 10000.00, 0.00, 28, 'Barudan & Sunstar', '560', '09', 10000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/SuQxlpRidEBD6qZ2jln4sSMWs6i3cSuLufq1WzyJ.jpg', '[]', 'membership/photos/oy8AhZv836AVN2xBreJRTJkFcuvRykevOC11cN6y.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-02 23:31:21', '2025-07-05 07:54:28', 1),
(102, 135, '010036', 'Masud Corporation', 'Proprietorship', 'Md. Shamsul Islam Masud', NULL, 'Bangla Bazar, Narshinhapur, Ashulia, Savar, Dhaka.', NULL, '01711533132', 'masudfm2010@gmail.com', 'Male', 5000.00, 4000.00, 9, 'Tajima, Sunstar & Tajin', '180', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/eoSdrTwCjBAHa9ukislU2uLm3cnijPyTSSUvfClO.jpg', '[]', 'membership/photos/FFxz2wYvBWSh7YORC7Et63W2ZIcJUXL7gOwrAbpt.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-02 23:43:32', '2025-07-05 07:52:32', 1),
(103, 136, '0800454', 'Anam Clothing Ltd.', 'Limited Company', 'A.R.M Shahidul Haque Apu', NULL, '110 Khortoil. Sataish Road, Gazipur Tongi, Gazipur.', NULL, '01713032990', 'apu@acl.bdrmg.com', 'Male', 10000.00, 0.00, 27, 'Barudan Sunstar & Tang', '516', '09', 10000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/8kNb4iJtO2KAqLNfymjKLeLy2d4XckOCu9IQmjc5.jpg', '[]', 'membership/photos/fIACa84txHuKwnIwfCVz0J2qGbQkQ3Jq8FuqkO7W.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-02 23:56:41', '2025-07-05 07:32:00', 1),
(104, 137, '1200610', 'Monpura Embroidery', 'Proprietorship', 'Md. Anwar Hossain', NULL, '448, Satarkul Road, Uttar Badda, Badda, Dhaka-1212.', NULL, '01918444222', 'monpuraembroidery@gmail.com', 'Male', 10000.00, 0.00, 6, 'Ricoma, Platinum', '120', '06 & 09', 5000.00, NULL, NULL, NULL, '2026-12-31', 2, 'Monpura Group', NULL, NULL, 'membership/documents/ikJdXC8lIlocMNwDvJRexHQ6kKEhu22JNKKEV1vm.jpg', '[]', 'membership/photos/kG7aLjKIcJVeYnjO1GpjIwcv0UO4H0x5XeqzvT83.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-03 00:40:12', '2025-07-03 01:42:35', 1),
(105, 138, '1000481', 'Pritom Fashion Wears', 'Proprietorship', 'Md. Khijir Chowdhury', NULL, 'Yearpur, Zirabo, Ashulia, Dhaka.', NULL, '01912324010, 0171152', 'pritomtradecorp@gmail.com', 'Male', 5000.00, 0.00, 20, 'Tajima, Sunstar, Feiyue & Autoking', '320', '06 & 09', 10000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/JpJcuzqMy45joZRj03mcgbE00k04Ouq9Moz2aW6k.jpg', '[]', 'membership/photos/9iPdClwbVx3tWjnw8EElQDSaHBxXfGt21qCjAeQ7.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 01:10:05', '2025-07-03 01:29:01', 1),
(106, 139, '1500707', 'Needle Craft Embroidery', 'Proprietorship', 'Md. Muksedur Rahman Abir', NULL, '339/B, Tejgaon I/A, Dhaka.', NULL, '01751624818', 'nc_embroidery@yahoo.com', 'Male', 5000.00, 2000.00, 3, 'Sunstar', '60', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/W6jr3P6JFIPbSdBtWqiaD52iMkdCkaELswFyfhd2.jpg', '[]', 'membership/photos/YKwEC7oCu7tMcnkCD5sm7ThmuEacwj2Zwncnfb91.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 01:15:12', '2025-07-03 01:25:20', 1),
(107, 140, '0600252', 'M.S Fashion', 'Proprietorship', 'A.T.M. Mostaen Billah', NULL, '158 Elephant Road, Hatirpool Dhanmondi, Dhaka-1205.', NULL, '01919239204', 'atmbillah@yahoo.com', 'Male', 5000.00, 0.00, 2, 'ZSK & Shangming', '40', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/7UNeaznARh9QwBcOn8SDP3ZVwI73jb3xivA7MJNb.jpg', '[]', 'membership/photos/OIAN6TwGXhdEV7IBAN4WDETeHVFrFyJxCyaWGSVM.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 01:34:30', '2025-07-05 07:30:59', 1),
(108, 141, '1800766', 'M M Fashion', 'Proprietorship', 'Md. Monir Ahmed', NULL, 'Plot-43, Block-A, Jahangir Alam Lane Sunibir Housing, Adabor, Dhaka-1207.', NULL, '01711529229', 'mtibd2@gmail.com', 'Male', 5000.00, 0.00, 7, 'MTI', '104', '06 & 09', 5000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/ABFOEXYLJbj2ZQW9hv4lPrElzJa4HCkwyI3PDJRA.jpg', '[]', 'membership/photos/Lgs8VjDAhtCpdOetOwwG50ZfmXQYGKGcUy58SwRQ.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 01:41:03', '2025-07-03 01:44:59', 1),
(109, 142, '2200848', 'Vision Interlining Ltd.', 'Limited Company', 'Md. Ruhul Amin', NULL, 'Boroibari, Borabo, Sonargaon, Narayanganj & Extended- 213, Hatipara, Tarabo, Rupganj, Narayanganj.', NULL, '01713028146', 'visiontradeint@yahoo.com', 'Male', 10000.00, 0.00, 6, 'China', '140', '06 & 09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/tDLbvyHHWUhATSJiJlTjh1arlpiv0AAYszAiAdvO.jpg', '[]', 'membership/photos/Ga9493gLAcS0t79TiQG9Zw1tsaOPdicTEg6WjK6Z.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 01:50:20', '2025-07-05 07:28:58', 1),
(111, 143, '1000498', 'Rasel Colour Stitch Zone', 'Proprietorship', 'Md. Rasel Sheikh', NULL, 'House-14, Bolck-C, Woard-53, Sector-10, Ranavola Main Road, Turag, Uttara, Dhaka-1230.', NULL, '01711609612', 'r_embro@yahoo.com', 'Male', 5000.00, 0.00, 36, 'Tajima, Barudan & Sunstar', '720', '09', 10000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/t82juojG7PZl3QNTSqDIlqnYaul9SQFnMsjtGEkM.jpg', '[]', 'membership/photos/cY9CDiy7i8qLeluf7RzCK025hyIID6pdoHWSYAEz.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 02:13:21', '2025-07-05 07:23:04', 1),
(112, 144, '1200575', 'Bright Embroidery', 'Proprietorship', 'Md. Delowar Hossan Ansary', NULL, 'House-02, Road-10, Ibnasina Brothers Housing Society, Adabor, Dhaka-1207.', NULL, '01912780935', 'brightembroidery35@gmail.com', 'Male', 5000.00, 2000.00, 3, 'Autowin, TCL', '60', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/XcTuVD6afuk0yymvScJLfl0Rdob0lPvjgZn3M52T.jpg', '[]', 'membership/photos/8tNmWzC030syfuqu6dP6gMHZxrARxISc1hpPDyYk.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 02:40:23', '2025-07-05 07:19:56', 1),
(113, 145, '2400942', 'S.S Fashion', 'Proprietorship', 'Md. Ataul Goni', NULL, 'House-73/74/A, Road-10/A, Monsurabad Housing, Adabor-1207', NULL, '01715658488', 'ssfashion2012@yahoo.com', 'Male', 5000.00, 0.00, 4, 'Autowin', '80', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/f6OmXwngbrhhqZKFPXbt1jngushC2PoEbNQ7NeQj.jpg', '[]', 'membership/photos/jDEqGH9yiv4Kj9K2Gt9ylcz2wIbEh6OfDSzbPoJV.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 03:29:44', '2025-07-05 07:18:04', 1),
(114, 146, '2200850', 'Dhaka Needle Crafts', 'Proprietorship', 'Md. Abdulllah Al-Mamun', NULL, 'House-262/2 Road-1, Baitul Aman H/S, Adabor, Dhaka-1207.', NULL, '01713009206', 'mamamun73@gmail.com', 'Male', 5000.00, 0.00, 4, 'Norththonex', '85', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/bqToAk00HEMs0t4yUNkJs8M6Tx9LQn72I1jVt4dq.jpg', '[]', 'membership/photos/yyhrrtROt4hojoY7ML6ON2j0jdX6fAc3kzHYmcgL.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 03:34:40', '2025-07-05 07:16:54', 1),
(115, 147, '1900792', 'Razim Fashion', 'Proprietorship', 'Md. Sanjil Hossain', NULL, 'Holding-277/C, Block-C, Khilgaon, Dhaka.', NULL, '01788938390', 'razimemb@yahoo.com', 'Male', 5000.00, 0.00, 9, 'Tajima , Autowin & Shumxin', '160', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/GMI5IutASVGl7YE3t2zPjom2IuE6VeSyVkKndrhk.jpg', '[]', 'membership/photos/GM0IfdBNdn3ik2nVdQhGSvVYZngwo2mRNJ2t0YVO.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 03:40:40', '2025-07-05 07:14:54', 1),
(116, 148, '1400685', 'Sui Suta Embroidery', 'Proprietorship', 'Md. Sharif Ullah Bapu', NULL, 'House-74/ka/6, Section-11, Polash Nagar, Mirpur, Dhaka.', NULL, '01965300600', 'mdsharifullah.suisuta@gmail.com', 'Male', 5000.00, 0.00, 4, 'Texem', '80', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/9PkY01HmoLXrbNCHOJGmswHqH0OVNZFqKZvQCRzR.jpg', '[]', 'membership/photos/bOnOGQp6UbRMdyy9PD2fRoFnpFPsFU5NecF1H61b.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 03:44:50', '2025-07-05 07:13:46', 1),
(117, 149, '0700321', 'G U Embroidery', 'Proprietorship', 'Md. Main Uddin Khan', NULL, 'House-16, Block-B, Road-6, Dhalipara, Turag, Dhaka-1230.', NULL, '01330803744', 'mainuddinkhan46@yahoo.com', 'Male', 5000.00, 0.00, 6, 'RNP', '120', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/kORLVtHq260z8WIyMYJhwSgoip1UPn3mIhDAn4FG.jpg', '[]', 'membership/photos/mn6mCIO98PlaZxxYofwQtTua8Zq7LUVuDUQhDdav.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 03:48:46', '2025-07-05 07:11:10', 1),
(118, 150, '1800771', 'Hafsa T F I Embroidery', 'Proprietorship', 'Mohammad Nura Alam Sarker', NULL, 'Holding-2005, Uttar Kahn, Mazar Para, Uttar khan, Dhaka-1230.', NULL, '01714466049', 'hafsa_trd@yahoo.com', 'Male', 5000.00, 0.00, 9, 'China', '75', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/FHa8yidEG8yDJCjUdiPDolGhV5ky7bEXuWG3jTgf.jpg', '[]', 'membership/photos/4upNe9ui7qLojutPJafS6hb4DR6G0rseZKHV6c62.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 04:15:33', '2025-07-05 07:08:25', 1),
(119, 133, '1400661', 'Stitch & Color Technology', 'Proprietorship', 'Shahnawaz Chowdhury', NULL, 'Akran, Aithor, Birulia, Savar, Dhaka', NULL, '01919214333', 'nafgroup@dhaka.net', 'Male', 10000.00, 0.00, 18, 'Tajima', '270', '09', 10000.00, NULL, NULL, NULL, '2025-12-31', 2, 'Naf Group', NULL, NULL, 'membership/documents/W4OCm2Xo4MOGqSR4rrY3G1zT7Gxe6sAyoT1fdDdb.jpg', '[]', 'membership/photos/6MNuX6W6IkY5nLIQh4pnPJNuNAYtZvyOzjPeX2Ek.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-03 04:29:13', '2025-07-05 07:02:25', 1),
(121, 161, '0800413', 'Abir Fashion', 'Proprietorship', 'Md. Mustafizur Rahmab (Jahir)', NULL, 'House: 5/G, Road-13, Monsurabad Housing Soceity Shemoli Adabor Dhaka-1207', NULL, '01815440629', 'abirfashion128@gmail.com', 'Male', 5000.00, 5000.00, 9, 'MTI, Autowin & Autokings', '348', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/4weAQZPhUzrnkpLhfv7Fc6f9P68iFp5XNcp5ipL3.jpg', '[]', 'membership/photos/T6CVPw0pcCqPCWX6WTgGeTEK4euruYZNJARbvYkg.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-06 22:24:00', '2025-07-07 00:48:21', 1),
(122, 162, '0700291', 'Ahsan Embroidery Pvt. Ltd.', 'Limited Company', 'Ahsan Habib Chowdhury', NULL, 'House #14, Road no: 07, Sector-03, Uttara, Dhaka-1230.', '0700293', '01713007250', 'ahsanembd@gmail.com', 'Male', 10000.00, 0.00, 4, 'Barudan, Tajima & China', '135', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/qoKzEz363VD7LmjmsTvJ8QK6PxrfFTPGGyJ4fPHA.jpg', '[]', 'membership/photos/01JZHYFHEK8V6XSBYNGG0RSAJF.jpg', 1, '2025-07-30 18:00:00', NULL, '2025-07-06 22:33:05', '2025-07-07 02:01:46', 1),
(123, 163, '1400669', 'Ananda Embroidery', 'Proprietorship', 'Jakir Hossain Bablu', NULL, 'House-39/7/M/3, Baistaki, Haji Ali Hossain Road, Section-13, Kafrul Mirpur, Dhaka', NULL, '0182013777', 'anandaembroidery@yahoo.com', 'Male', 5000.00, 0.00, 4, 'Tajima & China', '100', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/39UFBPq92PaBuBL8vCCKOG89YcsI2mTyzXhU9xU5.jpg', '[]', 'membership/photos/iBbF5teQ4cbNvw7iKSKDQA7im0mSJcDPqI3kgBPH.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-06 22:39:52', '2025-07-07 00:43:35', 1),
(124, 164, '1600726', 'Annex Embroidery Limited', 'Limited Company', 'Muhammad Abul Kasem', NULL, '83/1, Lasker Para, Sataish Road Gazipura, Tongi, Gazipur.', NULL, '01973142488', 'annexembroiderylimited@yahoo.com', 'Male', 10000.00, 35000.00, 7, 'Tajima, Sunstar & Seeeing', '140', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/f6J0Fnc7nhJrmRTHuUXcsIrUGmcJrAcn0Ksf3Qd1.jpg', '[]', 'membership/photos/caCO0jgsvntKyXsgQQyWN5uS6y2WZnx92lP4K0Pk.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-06 22:43:58', '2025-07-07 01:01:57', 1),
(125, 166, '1800755', 'Anonto Embroidery', 'Proprietorship', 'Md. Abdullah Chowdhury', NULL, '107 Paper Mill Road, East Abdullapur, Uttara, Dhaka-1230.', NULL, '01819086874', 'saiful.anonto2019@gmail.com', 'Male', 5000.00, 0.00, 4, 'China', '76', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/LqzTEQi6rUln0IFaYZeq5mtlUFwkvxK3VwqEepRK.jpg', '[]', 'membership/photos/9rwmXjjqOE8MeIVIBNKUBeUTgyOtqjQwJ40TCqGV.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-06 23:06:10', '2025-07-07 00:41:20', 1),
(126, 167, '1800760', 'Antora Embroidery', 'Proprietorship', 'Md. Alamgir Howlader', NULL, 'Mastarpara Kalabagan, Near Idel School Uttar Khan, Uttara, Dhaka-1230.', NULL, '01991993801', 'antoraembroidery@yahoo.com', 'Male', 5000.00, 14000.00, 4, 'China&Tajima', '60', '06', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/fWvEjQd7MFfymM7wbyaxYgK7oFYdObj27b1Bcedu.jpg', '[]', 'membership/photos/qiQ5QgByREWiIg9O1POdeu4XC8GvZIOor3O2YIYz.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-06 23:09:37', '2025-07-07 00:27:36', 1),
(127, 168, '1700750', 'Anwar Fashion', 'Proprietorship', 'Didarul Anowar Forkan', NULL, '86/Ka, Road-4, P.C Culture Housing Society Shaymoli, Dhaka-1207.', NULL, '01711831788', 'anwarfashion18@gmail.com', 'Male', 5000.00, 14000.00, 4, 'Barudan & Sunstar', '80', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/82LqNQbKsz2cnRX4XS3uCQ208sfNxZtcOVE0Sc5t.jpg', '[]', 'membership/photos/CDxruThqtvzz2XcKJUhKPlkfqcmiExMN9SnKwHcm.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-06 23:20:50', '2025-07-07 00:21:21', 1),
(128, 169, '0100020', 'Apparel Plus Embroidery', 'Proprietorship', 'S.M. Zahedul Alam', NULL, 'R.R Dreams, House-5/1/B, (4th Floor), Mohanpur, Adabor, Shamoly, Dhaka.', NULL, '01913806882', 'apparelplusembroidery@gmai.com', 'Male', 5000.00, 0.00, 4, 'China', '80', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/p85VxfPJkULOUcXB9H6xh7gia4ohPTlzlur3jwEi.jpg', '[]', 'membership/photos/01JZHR9G31XFF7SAMPWCNHEK3E.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-06 23:26:46', '2025-07-07 00:13:37', 1),
(129, 170, '1000500', 'Arshad Embroidery Ltd.', 'Limited Company', 'Iqbal Khan Jamal', NULL, 'Plot-1323, Ascrayon Prokolpo Road, Surabari, Kashimpur, Gazipur.', NULL, '01819225229', 'arshadembo@gmail.com', 'Male', 10000.00, 0.00, 9, 'Tajima, Jintel, Yanhai, ZSK & Sinsim', '245', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/yk7ZG8cDghw9spAwq36XDYzII7BnQtb4Ij42MVub.jpg', '[]', 'membership/photos/V0qu7lP6SOSsOmtRluqhyWS00wip61oiM5mrBFSi.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-06 23:30:32', '2025-07-06 23:49:26', 1),
(131, 172, '0700325', 'Aunim Fashion', 'Proprietorship', 'Abdullah Al Mamun', NULL, '31/6, Joint Quater, Block-F, Johuri Mohallah, Shamoli, Dhaka-1207.', NULL, '01711565009', 'aunim.fashion@gmail.com', 'Male', 5000.00, 0.00, 3, 'Jintel', '55', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/q9zN3OB7ddknqweeTqhLQWinT2ubjHvLhBDbqAvI.png', '[]', 'membership/photos/ifAVKeOeMEqGionmXmh6IYgvLIPChY0ThocPoYM6.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 00:12:35', '2025-07-07 00:19:26', 1),
(132, 173, '1400686', 'Ayan Fashion', 'Proprietorship', 'Md. Asaduzzaman Sumon', NULL, 'House-39/9, West Baistaki, Haji Ali Hossain Road, Mirpur, Kafrul, Dhaka-1216', NULL, '01937649140', 'ayantextilebdi@gmail.com', 'Male', 5000.00, 0.00, 4, 'Jintel, Champion & General', '63', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/uIz6ZbMYkl6LEHIkMsuutaLXUlBV63Kzxy5mxB6V.jpg', '[]', 'membership/photos/FZuLPQ2SPvZda8JHOxx0Wu6VEiCXh2tG6JxRj5LI.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 00:37:15', '2025-07-07 00:59:57', 1),
(133, 174, '1200622', 'Baek Doo Korea (BD) Ltd.', 'Limited Company', 'Lee Choung Won', NULL, 'Village: Faruk Nagar, Post: Dhamsona, P,S: Ashulia, Savar, Dhaka-1349', '1200622', '01767695092', 'bdk.emb2013@gmail.com', 'Male', 10000.00, 0.00, 19, 'Barudan, Tajima, & Sunstar', '366', '09', 20000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/VQJUxK3VA68qTnAqO0hk289ydCoV2Phahu7vVI5V.jpg', '[]', 'membership/photos/KPEZtyfUJZ1Q28DZiDfSGIzGDYJRrgganuaYuOSr.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 00:43:06', '2025-07-07 00:49:55', 1),
(134, 175, '0800446', 'Basic Embroidery Ltd.', 'Limited Company', 'Md. Jamal Uddin', NULL, 'Rajabari, Gorai, Mirzapur, Tangail', NULL, '01714041373', 'basicembroidery@yahoo.com', 'Male', 10000.00, 0.00, 3, 'Barudan', '60', '9', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/BzA6G8ZS87L4ebrztH7QKTeoK1cKujKhl2zzaOl1.jpg', '[]', 'membership/photos/Fjb3Gzt0VWVHcRq4Rax8Kcp00fFlR8m6SH69zSEP.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 00:49:23', '2025-07-07 00:57:21', 1),
(136, 178, '1100547', 'Combined Embroidery & Accessories', 'Proprietorship', 'Md. Abdur Rahim', NULL, 'House-99/A, Road-03, Shaymoli Housing 2nd Prokolpo, Adabor, Dhaka-1207.', NULL, '01819277360', 'combined.rahim84@gmail.com', 'Male', 5000.00, 0.00, 4, 'MTI & Barudan', '80', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01JZJ1VT2ZVC1TWHZH12R7R1ZW.jpg', '[]', 'membership/photos/01JZJ1VT31ET05VKQGZ1QDWTWC.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 01:32:03', '2025-07-07 03:00:54', 1),
(137, 179, '1900782', 'Combined Fashions Embroidery & Accessories', 'Proprietorship', 'Mohammad Ismail (Shobuj)', NULL, 'Mugra Kanda, Vakurta, Savar, Dhaka', '1900782', '01715054110', 'combinedfashions@gmail.com', 'Male', 5000.00, 0.00, 6, 'China', '120', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/Q65RHjPNT3y1d7IU8Wi5Dg2s6dLMoQbQ1VzdmxS9.jpg', '[]', 'membership/photos/qi6WuMuRXRDukPOZVSopZ2DdeHPwTr0WBn78i2pI.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 01:36:59', '2025-07-07 01:38:29', 1),
(138, 180, '1400641', 'Daffodil Embroidery', 'Proprietorship', 'Md. Mahamuder Rahman (Ripon)', NULL, 'House-726/40/1, Road-10, Baitul Aman Housing Society Adabor, Dhaka-1207.', NULL, '01715321227', 'daffodilemb_10@yahoo.com', 'Male', 5000.00, 0.00, 4, 'MTI, Autowin & Tajima', '63', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/2C6zc3WsfQb5zkagivnBbTXKtMjaKf61t3KbNY1G.jpg', '[]', 'membership/photos/gFmv54hpaYcP8NbckLMbCsWnvPlEUpqkS7vm6SYQ.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 01:43:51', '2025-07-07 01:48:39', 1),
(139, 181, '1700744', 'Dalas Stitch Colour Ltd.', 'Limited Company', 'Md. Elias Hossen', NULL, 'House-37, Block-B, Road-10, Charabagh, Ashulia, Savar, Dhaka.', '1700744', '01855808077', 'dalasemp@gmail.com', 'Male', 10000.00, 0.00, 9, 'China', '155', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01JZJ2G72JZ634SDJ3KFH0JJG2.jpf', '[]', 'membership/photos/AfW8erlrFxeWHeWf1TQSrFonnmDAp5x9yq8BJ4S5.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 02:37:29', '2025-07-07 03:12:03', 1),
(140, 182, '1900797', 'Design Creator', 'Proprietorship', 'Md. Khurshid Zaman', NULL, 'Plot # 32, Block # L, Road # S-1/A Eastern Housing, Mirpur, Dhaka.', '1900797', '01911505857', 'designcreatorkz@gmail.com', 'Male', 5000.00, 10000.00, 4, 'China', '60', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-07', 1, NULL, NULL, NULL, 'membership/documents/44CRp6jdtNn4liMwwD6tHSyT9se1lT7G8d6lhSQL.jpg', '[]', 'membership/photos/jVix9Zenfohwp8zsaUvB1rebNkWWej6qJ888SShJ.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 02:41:48', '2025-07-07 03:13:42', 1),
(141, 183, '1800774', 'Dhaka Emb Ltd.', 'Limited Company', 'Kang Chang Youn', NULL, 'Vill: Subondi (Natun Nagar), Post: Dhamsona, Ashulia, Savar, Dhaka.', NULL, '01741944029', 'cykang@yupoong.co.kr', 'Male', 10000.00, 0.00, 14, 'Laser Machine & Barudan', 'MJGHY-160100 & 240', '9', 20000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/59p5Xmj4WN5fLq214e5mxzwn6uK2tK3DagwWpxJ3.jpg', '[]', 'membership/photos/w2iLAVkWQJ4Wg3OScXDawZO1mNO5inLCPp6Oxf55.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 02:50:31', '2025-07-07 03:06:01', 1),
(142, 184, '1100545', 'Dual Mart Embroidery Ltd.', 'Limited Company', 'Md. Gulzer Hossain', NULL, 'Norshinghopur,East Sabed Ali Sarkar Road,Baghbari, Kashimpur, Gazipur', '1100545', '01711692102', 'gulzer@worldvictorybd.com', 'Male', 10000.00, 0.00, 3, 'Feying, Jintel & Seeing', '45', '09', 2000.00, NULL, NULL, NULL, '2026-12-31', 1, NULL, NULL, NULL, 'membership/documents/JFHdqP7KMVS7nLtA3h0jz0dAnaoHK0FFkGV3tPnq.jpg', '[]', 'membership/photos/lFFlk48BDJPoFFAR86ZpBdajmuS42AVTA4vPg8IA.jpg', 1, '2026-12-30 18:00:00', 95, '2025-07-07 03:31:31', '2025-07-07 03:35:36', 1),
(143, 185, '0100051', 'Elite Fashion', 'Proprietorship', 'Md. Abdul Awal', NULL, 'Plot-1467, Gouripur, Bangabandhu Road Ashulia, Savar, Dhaka.', NULL, '01713038827', 'elitefashionbd@gmail.com', 'Male', 5000.00, 30000.00, 8, 'Tajima', '120', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/bxeH06KOpQoRs9LYpEFlXFhZ9o5RYklkVyVLWuuG.png', '[]', 'membership/photos/8tv6YCkkdKUpprQGKWst5JVGdk6XoLvJ8gQdADn7.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 04:06:19', '2025-07-07 23:29:16', 1),
(144, 186, '1900779', 'EPS Choice Embroidery', 'Proprietorship', 'Hosen Mohammad Rashid (Mamun)', NULL, 'Plot-298, Board Bazar (I.U.T Gate Opposite), P.O: NationalUniversity, Gazipur, Dhaka', NULL, '01815462915', 'epschoice2017@gmail.com', 'Male', 5000.00, 0.00, 4, 'Jidia', '105', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/2V2QMJFvYLYK3yiDYvREG4wCUgU0aEWpSsVfNPIq.jpg', '[]', 'membership/photos/h9aeBIrxPyxSzkEr4785AUA6TjrWvGh6xT9GvAqU.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 04:19:01', '2025-07-07 23:01:12', 1),
(145, 187, '1100549', 'Fawaz Fashion', 'Proprietorship', 'Ashadur Rahman (Rubel)', NULL, 'House # 712/19, Road # 10, Baitul Aman Housing Soceity, Adabor Dhaka-1207.', NULL, '01815439113', 'nishi_trade@yahoo.com', 'Male', 5000.00, 0.00, 9, 'MTI', '165', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/pYOn1uGLVXIQhNRA0ntsy2UaxzLUvdgtAZ7NZOZw.png', '[]', 'membership/photos/jFSrgt8nmQ98cHOn4QrVAl0RXeXoMgSi3A9XAYln.png', 1, '2025-07-30 18:00:00', NULL, '2025-07-07 04:34:52', '2025-07-07 23:27:35', 1),
(146, 188, '1700742', 'Fashion World', 'Proprietorship', 'Md. Kamal Uddin', NULL, 'House-885, Road-13, Baitul Aman Housing Society, Adabor Dhaka-1207.', NULL, '01759314488', 'kamaluddin88440@gmail.com', 'Male', 5000.00, 2000.00, 4, 'Tajima, Autowin, Tongli', '42', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/DLaKXAGSiruOMdhPao9JndWl4tL95zWq5JHgsYcd.jpg', '[]', 'membership/photos/jXYaloxxly2arYw4LYMnPcPsjAkAaJZoBivqn4Uz.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 04:42:29', '2025-07-07 23:26:52', 1),
(147, 190, '1900800', 'H.S.P Fashion', 'Proprietorship', 'Shohel Rana', NULL, 'Dag No.83, Faidabad, Transmitter Bir Muktijoddha, Kutub Uddin Road, Dakshin Khan, Uttara, Dhaka.', NULL, '01911492965', 'hspfashion93@gmail.com', 'Male', 5000.00, 0.00, 4, 'Seeing', '100', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/FuWu4gAh2un36rETwBK7z8asthuRgb6CWp6vjJN2.jpg', '[]', 'membership/photos/sksPgPnzZ0cdEXCvlsnZiFMAyGPfRV3WxWws9HC1.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 22:26:04', '2025-07-07 23:25:32', 1),
(148, 191, '1400642', 'Heritage Embroidery', 'Proprietorship', 'Md. Alauddin Al Mahmud', NULL, 'House-712/16, Road-10, Baitul Aman Housing, Adabor, Dhaka.', NULL, '01827830543', 'heritageemb@yahoo.com', 'Male', 5000.00, 0.00, 2, 'Jintel & Tajima Great', '30', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/WyPf2ZHaqBqs63Y38PgNx3oCjvEnGVPdXoucR3pu.jpg', '[]', 'membership/photos/EL86yoDuV6byuVRuDefq9T1abwBlwlg16oV1jYlV.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 22:30:16', '2025-07-07 23:24:02', 1),
(149, 192, '1200627', 'Howlader Embroidery Ltd.', 'Limited Company', 'Md. Biplob Hossain Howlader', NULL, '77/78/B, Bscic Industrial Area, Sashongaon, Fatullah, Narayanganj', NULL, '01711561180', 'howladeremb@gmail.com', 'Male', 10000.00, 0.00, 14, 'Tang', '280', '06 & 09', 10000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/uS1yWSK3y8eUocUI56ChgtjNjowv6OvWEFeMcGjP.jpg', '[]', 'membership/photos/Lc95eNGsv4RafxyEdsnnX8xqqEGWFcf8yw95ieEc.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 22:35:44', '2025-07-07 23:22:50', 1),
(150, 193, '1800776', 'Ideal Fashion', 'Proprietorship', 'Foysal Ahmed', NULL, 'House-09, North Adabor, Bazar Road, Adabor, Dhaka.', NULL, '01715948565', 'idealfashion_dhk@yahoo.com', 'Male', 5000.00, 2000.00, 4, 'MTI', '144', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/tXaXreARqAKgA2ksbHS1MBiO82W7Tm9PwSXTsz0U.jpg', '[]', 'membership/photos/jVT1bKu7GxvVoaHuAD3JrCBLEB5aT0xthmybn5xY.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 22:38:30', '2025-07-07 23:22:08', 1),
(151, 194, '1400691', 'Imperial Embroidery Ltd.', 'Limited Company', 'Md. Akter Hossain Shohel', NULL, 'House-882, Bimalia, Baliarpur, Hemayetpur, Savar, Dhaka', NULL, '01819291455', 'imperialemb@yahoo.com', 'Male', 10000.00, 0.00, 9, 'Tajima & Autowin', '210', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/IgfTthuiMGz5Uy5R9K3hAUJPBBMCNuKQ86hex7fy.png', '[]', 'membership/photos/I5TZExFyq0ORDARO05LDqoC9hQFgyALmJtYC1m2Z.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 22:42:13', '2025-07-07 23:20:49', 1),
(152, 195, '0700375', 'Indesore Embroidery Ltd.', 'Limited Company', 'Mohammed Rokunuzzaman', NULL, 'E-27-29, Eastern Housing Pallabi,2nd Phase, Mirpur,  Dhaka-1216.', NULL, '01730045179', 'kauser@indesore.com', 'Male', 10000.00, 0.00, 12, 'Tajima & Tang', '124', '9, 11 & 14', 10000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/KcXSMYbstN4BTJqPPd5ZOTc234Df4KZMUO5xgKw7.jpg', '[]', 'membership/photos/KZ2a6ovsr3UA8wvP2w4sy4prREsDow7hJvHUsSor.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-07 22:44:51', '2025-07-07 23:02:09', 1),
(153, 196, '1800778', 'Jangsu Multi Quilting (BD) Co. Ltd', 'Limited Company', 'Md. Sharif Hossain Khan', NULL, 'Khatian-406-327-106, JL-79, Baipail, Gazirchat, Ashulia, Savar, Dhaka.', NULL, '01726787870', 'sharifhossain.ultra@gmail.com', 'Male', 10000.00, 6000.00, 3, 'Wellon M/C(W-1.0) Ball Fiber M/C (W-1.0), Ball Fiber Stuffing M/C(W-1.5)', NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/sydF9SnipLkSwVhNlws2kARTtyJEjsPjy5p5sWVw.jpg', '[]', 'membership/photos/XO4DK1uRETe90xgXuHmCLQejqaQRb8vd6nI0ebg5.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-08 01:24:11', '2025-07-10 06:06:43', 1),
(154, 197, '1400680', 'Janani Embroidery', 'Proprietorship', 'Md. Abdul Mannan', NULL, 'House-5/1,2/H, Borabo, Adabor, Shamoli, Dhaka-1207', NULL, '01922751769', 'mamannan1769@gmail.com', 'Male', 5000.00, 2000.00, 4, 'Autowin & Tajin', '86', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/Dj5lylC9dZ4zedSExMjfVM9Cds6oGm5nmHoyMQJw.jpg', '[]', 'membership/photos/FFZmoHXIHVdlQivJ8zKVaAbtPZ2366M0xsHSPvPV.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-08 02:27:39', '2025-07-14 00:47:03', 1),
(155, 198, '1900786', 'Jui Embroidery', 'Proprietorship', 'A.K. Zaman', NULL, 'Holding-26, Road-05, Razabari Turag Dhaka-1230.', NULL, '01632746044', 'juizaman123@gmail.com', 'Male', 5000.00, 9000.00, 4, 'Royel Portugal', '80', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/4JF8Sfgf4QYpk4z2UgvhitAARtfUnZRRcc1e9qoi.jpg', '[]', 'membership/photos/6GWhE4Y924VyGU8bYjRiYjWyZImaZOP3bQsyi8qP.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-08 02:36:04', '2025-07-10 06:23:59', 1),
(156, 199, '0100091', 'Juniper Embroideries Ltd.', 'Limited Company', 'Md. Abidur Rahman', NULL, '67 Kandi Boilarpur, Union- Tetulzora, Hemayetpur, Savar, Dhaka.', NULL, '01819216007', 'juniper@babylon-bd.com', 'Male', 10000.00, 0.00, 11, 'Tajima, Barudan Maya & SPL', '205', '09', 20000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/Bu8BnhnHxaPIyGN2UEIaRr5yXUPQjYLxodO5kjvv.jpg', '[]', 'membership/photos/OlmCV9ZkDe4dz6mDqt5CbHKvgDwpzHn41DAmWOyd.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-08 02:50:02', '2025-07-10 06:04:17', 1),
(157, 200, '1700751', 'Kolpotoru International', 'Proprietorship', 'Md. Mahbub Al Mamun', NULL, 'House # 46, Road No:02, P C Culture Housing, Shekertak, Dhaka-1207.', NULL, '01713143070', 'kolpotoruinternational@gmail.com', 'Male', 5000.00, 0.00, 3, 'China', '30', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/vMWC71fNlFPQ4sc46vfWEQI5tQ1Q0wruFqmF43BS.jpg', '[]', 'membership/photos/tp87t7Gxt9Te2oPk25GZeIun02mkLcGXfR1toLLN.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-08 03:17:58', '2025-07-10 06:03:06', 1),
(158, 201, '0800430', 'Labels For Less Ltd', 'Limited Company', 'Mohammad H. Sattar', NULL, 'Village: South Shalna, P.O: Shalna Bazar, P.S: Gazipur Sadar, Dist: Gazipur-1703', NULL, '01711524235', 'daulat@utahgroup.net', 'Male', 10000.00, 0.00, 6, 'Tajima & Schiffli Switzerland', '40', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/tCw9wf1L6ZDDgab8Lp7xDPcwb5eXb48R5815GcnS.jpg', '[]', 'membership/photos/XNT3kbEdQJzpWyM4XQFtlerYkm6RQG5U6ZgBEZ1s.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-08 03:24:14', '2025-07-10 06:01:37', 1),
(159, 202, '1600713', 'Labonno Screen Print Ltd.', 'Limited Company', 'Khondoker Mizanur Rahman', NULL, 'Gorat, Zirabo, Ashulia, Savar, Dhaka & Norshinghopur, Zirabo, Ashulia, Savar, Dhaka', NULL, '01819272536', 'lucky@sldhaka.com', 'Male', 10000.00, 0.00, 5, 'Challanger', '100', 'Printing Machine', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/Tgd1UkrnuYRzxVk13DGigXCfatpIXc9gb8L68E5k.png', '[]', 'membership/photos/PjNWq6zfcD8S3iICakI1j5pEwrwNMfrJbdYRqx1k.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-08 03:29:25', '2025-07-10 06:00:38', 1),
(160, 204, '0800403', 'M.M. Khan Embroidery', 'Proprietorship', 'Md. Mostafa Khan', NULL, 'House-03, Road-02, Block-C, Dolipara, Turag, Uttara, Dhaka-1230.', NULL, '01711287926', 'mmkhanex@gmail.com', 'Male', 5000.00, 14000.00, 4, 'Younthing & RNP', '111', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/4anmrhzihv86dGFob9kPSHslScePvHbERgdpc99N.jpg', '[]', 'membership/photos/29t7wr0B7f1I6Rs0IHgGwVp9fpkBARAOE8xTgw3t.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-08 05:49:44', '2025-07-14 00:37:09', 1),
(161, 207, '2501012', 'Ijaf Apparels', 'Proprietorship', 'Nur Mohammad', NULL, 'House-18, Road-02, Nayanichala, Nishadnagar, Turag, Dhaka-1711', NULL, '01715909343', 'nur976172@gmail.com', 'Male', 5000.00, 0.00, 6, 'GRNP', '120', '09', 5000.00, NULL, NULL, NULL, '2026-12-31', 2, NULL, NULL, NULL, 'membership/documents/Xl8j2CzFI3eUtSZrrsX4cQu7kWEX332jT2me0AMv.jpg', '[]', 'membership/photos/qPaTLMqJZUfEapRhEPSXFdgjKsDqHq1oH46Z3rbs.png', 1, '2026-12-30 18:00:00', NULL, '2025-07-09 03:41:38', '2025-07-09 03:59:09', 0),
(162, 176, '0700346', 'Brook Thread & Accessories', 'Proprietorship', 'A.T.M. Zaglul Hossain', NULL, '100 Nobaber Bugh, Mirpur-1, Dhaka-1216', NULL, '01715984411', 'zaglul_hossain@yahoo.com', 'Male', 5000.00, 26000.00, 4, 'Zhanyi', '160', '04 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/EYUgmuCYyEBO1apcXP5KoNZfSPGX2Db6Zv4bIdsX.png', '[]', 'membership/photos/G4PV51lwmFAIBkSRTCjdClKhmzBF5hqHaGYsSjgo.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-10 03:33:10', '2025-07-14 00:45:23', 1),
(163, 213, '1700735', 'Maa Fashion', 'Proprietorship', 'Md. Ariful  Islam (Montu)', NULL, 'House: 1594, Mastarpara, Kolabagan, Uttarkhan, Uttara, Dhaka-1230.', NULL, '01913380277', 'maafashionmontu@gmail.com', 'Male', 5000.00, 2000.00, 4, 'Barudan & China', '70', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/MbPAGvfMXXwl42gTED4UdFXjFpF9KbPaxi3OENHw.jpg', '[]', 'membership/photos/EWMUuqjpVM73W9tXqokUQwGsIFNzTiivYXxBn4Is.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-10 04:24:20', '2025-07-10 05:58:40', 1),
(164, 212, '0800385', 'M.R.C Embroidery', 'Proprietorship', 'Saad Rahim Chowdhury', NULL, 'Plot-34, Uttar Rajabari, Dhour Main Road, Nishatnagar, Turag, Dhaka-1230.', NULL, '01713002900', 'saadchow@gmail.com', 'Male', 5000.00, 0.00, 7, 'Tajima Sunstar & China', '119', '9', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/pyjW4wy1kTCQhi4q8s7NBaLvo4sjUb2P0D8DmeiH.jpg', '[]', 'membership/photos/ocqc4flhvYCimddQ7HouJqyfb0wnHe4jqU58ZVlY.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-10 05:34:44', '2025-07-10 05:56:34', 1),
(165, 228, '0900487', 'M.S Enterprise', 'Proprietorship', 'Mosharof Hossain', NULL, '01/137/1, Purbo Jamgora Bot Tola, Ashulia, Savar, Dhaka.', NULL, '01711561905', 'msenterprise1@hotmail.com', 'Male', 5000.00, 125000.00, 9, 'Sunstar & China', '161', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/AsH7Ij0qVCPaYO8nuBC8XmuG3TzSsCPecTWEYM5U.jpg', '[]', 'membership/photos/l2uyfgZ0USWfMJf43tpfS13vclM26dJdxBXQKlvi.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-13 22:22:55', '2025-07-14 00:43:38', 1),
(166, 229, '1400670', 'M/S A.R. Fashion', 'Proprietorship', 'M.A.W. Azim Bhuyah', NULL, 'House-76, North Adabor Bazar Mohammadpur, Adabor, Dhaka-1207.', NULL, '01915034103', 'azimenterprisepable@gmail.com', 'Male', 5000.00, 22000.00, 3, 'Tajima Grate', '45', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/3pjZadq5VYtuyDvjmy4gqlSPfoD0ZQKUqHsOUIbc.jpg', '[]', 'membership/photos/SQVU8Q00IpnNmHg7RIaMdDv1PycUMVDUOIQGksri.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-13 22:30:39', '2025-07-14 00:41:57', 1),
(167, 230, '1100531', 'Maa Embroidery & Print', 'Proprietorship', 'Md. Jamir Hossain (Gibon)', NULL, 'House-01, Road-02, Block-E, Woard-06, Bamnartake, Turag, Dhaka.', NULL, '01716494204', 'maaemep@gmail.com', 'Male', 5000.00, 17000.00, 3, 'Jintel & RNP', '50', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/6QeC0shGr5A3jJyDacu8n0VI2GHYpqYyeK42bIJk.png', '[]', 'membership/photos/FUto6w6m9zLuW71YTM3jCCFRuHXzJkIMXVlciU90.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-13 22:46:09', '2025-07-14 00:40:43', 1),
(170, 235, '1600715', 'Masa Fashion', 'Proprietorship', 'Alhaj Amdadul Kabir (Faysal)', NULL, 'House-712/22/B/2, Road-10, Baitul Aman Housing Society, Dhaka-1207.', NULL, '01811951504', 'md.faysal549@gmail.com', 'Male', 5000.00, 2000.00, 3, 'Tajima & Sangming', '44', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/Ghj7u6KXZkdRe8htbFijX0zoKlQNdLPHnMwreSet.png', '[]', 'membership/photos/qUVL4lMAkfT8kFRIMPY3E4mKdG5sjSbrtDpq6gWP.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-13 23:24:00', '2025-07-14 00:38:26', 1),
(171, 237, '1500694', 'Meem Enterprise', 'Proprietorship', 'Shohel Rana', NULL, 'Dag No.83, Faidabad, Transmitter Bir Muktijoddha, Kutub Uddin Road, Dakshin Khan, Uttara, Dhaka.', NULL, '01711168144', 'shohelranabd1982@gmail.com', 'Male', 5000.00, 0.00, 4, 'Seeing', '100', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/g1iyHyyGGp5Ija3admhEO4PKgKkolUgw9kZWc0Wo.jpg', '[]', 'membership/photos/c5bq37eGRYdmlPf7adiL3Q27Eq4d5SqtA7WBLYQW.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 00:52:39', '2025-07-14 01:36:58', 1),
(172, 239, '0172', 'Mile Stone Embroidery', 'Proprietorship', 'Md. Awlad Hossain', NULL, 'House#712/22/A/1, Road#10, Baitul Aman Hosing Socity, Adabor,Dhaka-1207', '1200568', '01712532639', 'awlad.hossain40@yahoo.com', 'Male', 5000.00, 0.00, 4, 'Autowin', '64', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/3BlDLVKNQay7ZOjMeGPEVm3dxlqq5EgS7OmUvGly.jpg', NULL, 'membership/photos/6yu23FxwIL7VwXhWE1AsoU7KxEQWRpTpZQA6RwMc.jpg', 0, NULL, NULL, '2025-07-14 01:01:28', '2025-07-14 01:01:28', 0),
(173, 240, '1000535', 'Miraj Fashion', 'Proprietorship', 'Md. Mirajul Islam (Miraj)', NULL, 'House-5/1/H/2, Barabo, Mohonpur, Adabor, Dhaka', NULL, '01714277061', 'mirajfashion87@gmail.com', 'Male', 5000.00, 0.00, 9, 'Autowin Tajima Grate, Tajimacen & MTI', '150', '06 & 09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/oYXK6fztEkHM9BVeCZAYalAIz4O4n7n1oOiMOdqE.jpg', '[]', 'membership/photos/efrQJoaHF0qyF5f5XSeOXxhF95jPGeZENbrvdDXD.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 01:06:33', '2025-07-14 02:49:17', 0),
(174, 241, '1400649', 'N.R Fashion', 'Proprietorship', 'Kowser Hossain Riaz', NULL, 'House-2/G, Ring Road, Shaymoli, Adabor, Dhaka.', NULL, '01713301555', 'nrf2001@yahoo.com', 'Male', 5000.00, 22000.00, 3, 'NTI & Jintel', '50', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/ccI9p3yWygxAJUe4XtFLhbwqBKzPvthj1vxJII6f.jpg', '[]', 'membership/photos/025VxJmLe2LDBCqwGjjd0Cpczm8gP3BM6CjUHYCY.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 01:09:57', '2025-07-14 02:48:07', 1),
(176, 243, '1700738', 'Nakshi Stitch Field', 'Proprietorship', 'Mohammad Shachhu Miah', NULL, 'House -16, Sector -08, Sikder Bari Sapporo Dental college, Abdullahpur, Uttara, Dhaka.', NULL, '01624284838', 'shachhu.nakshi@yahoo.com', 'Male', 5000.00, 2000.00, 4, 'China', '90', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/fv1NMRGKTYfWmXVQBVAgUvywITOXff2RvyzQiOOJ.png', '[]', 'membership/photos/KznIcbePRVkPfgk5yoq8Ej7Rb1mlGbVj9kbMLYPm.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 01:23:19', '2025-07-14 01:43:14', 1),
(177, 244, '1800770', 'Namira Apparels', 'Proprietorship', 'Md. Jashim Uddin Swapon', NULL, 'House-43, Zahangir Alam Lane, Sunibir Housing, Adabor, Dhaka', NULL, '01972355375', 'namiraapparels@gmail.com', 'Male', 5000.00, 0.00, 9, 'MTI', '105', '09', 5000.00, NULL, NULL, NULL, '2026-12-31', 1, NULL, NULL, NULL, 'membership/documents/CblYKznaG7Fi0vhKN2Ec2hD7id95JlCH2u9kzsfM.jpg', '[]', 'membership/photos/01K03XYYGNMS4RV3YPH8QZ49HR.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-14 01:35:49', '2025-07-14 01:39:03', 1);
INSERT INTO `memberships` (`id`, `user_id`, `membership_id`, `company_name`, `company_type`, `director_name`, `nominated_director`, `address`, `telephone`, `phone`, `email`, `gender`, `membership_fee`, `due_amount`, `machine_count`, `brand`, `total_head`, `needle_colors`, `yearly_subscription`, `discount`, `advance_amount`, `receipt_no`, `payment_date`, `payment_year`, `sister_concerns`, `remarks`, `nomination_certificate`, `trade_license`, `factory_photos`, `director_photo`, `is_active`, `membership_expire_date`, `expense_id`, `created_at`, `updated_at`, `existing_member`) VALUES
(178, 245, '1200557', 'Nandan Fashion.', 'Proprietorship', 'Md. Abul Kalam Azad.', NULL, 'House#05, Road#10,Ibnesina Brothers H/S,Adabor,Dhaka.', NULL, '01720542968', 'azad_3235@yahoo.com', 'Male', 5000.00, 0.00, 4, 'MTI, Autowin, Brother & Sunflower', '94', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/LqPgDOixmgdk4hrWqEYuvYGMPHfOqBKKN1mPqqsk.jpg', '[]', 'membership/photos/9QmuZt6qmO6hFq4BbmYySHnhaAU1o6Dn3Y61eODN.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 01:40:56', '2025-07-14 01:48:06', 1),
(179, 246, '1200603', 'Nash Vill Fashion', 'Proprietorship', 'Md. Belayet Hosen Bhuiyan', NULL, 'Ward No: 34, Ashraf Market, Shorifpur, Malakerbari, Gazipur-1704', NULL, '01818957155', 'balayet_hosen@yahoo.com', 'Male', 5000.00, 0.00, 4, 'China & Champion', '62', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/KSPEwORwNPNVnTypj1oTKZa6oJ2iAotuFPbb5EHo.jpg', '[]', 'membership/photos/N2kYi6oh98wq6ykAUO9YO1anc2aEpAPzxN0LFNRx.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 01:44:56', '2025-07-14 01:46:16', 1),
(180, 247, '1900796', 'Nassa Embroidery Limited', 'Limited Company', 'Md. Nazrul Islam Mazumder', NULL, 'Goshbag, Zirabo, Ashulia, Savar, Dhaka.', NULL, '01713094455', 'emb@nassagroup.org', 'Male', 10000.00, 50000.00, 8, 'Barudan & Tajima', '160', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/dt97SHWXALkzz4YmBzoIOjKK9atoG18Ff8wGsXMh.jpg', '[]', 'membership/photos/Jk7Z1dSamj7TDC5co2Fi7NMvLEXzxpBdpRRxxldZ.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 01:50:05', '2025-07-14 02:41:16', 1),
(181, 248, '1600724', 'NBM International', 'Proprietorship', 'Bellal Hossain Khan', NULL, 'House-76, Road-11, Block-D, Munsurabad Housing Society, Adabor, Dhaka-1207.', NULL, '01711507118', 'nbmkhan@gmail.com', 'Male', 5000.00, 12000.00, 3, 'Zhanyi', '45', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/P2qwSq7b9pnDxYLINNnOtSzwAROod0MTH4krl6tI.jpg', '[]', 'membership/photos/j6G2HcoV8FMVQcHteCSppOGS02mzE9qxxiUjzjnj.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 01:54:43', '2025-07-14 02:45:53', 1),
(182, 249, '1200615', 'Needle Art Embroidery Ltd.', 'Limited Company', 'A.F.M Sarwar Mahboob', NULL, 'Tushuka Group, Konabari Neelnagar, Gazipur.', NULL, '01713090009', 'niaz.needleart@gmail.com', 'Male', 10000.00, 50000.00, 10, 'Barudan & Jintel', '200', '09', 10000.00, NULL, NULL, NULL, '2025-12-31', 1, 'Tushuka Group', NULL, NULL, 'membership/documents/VnDo3t8C9Ejwhnm6rlwkimsWoplK9UP7NdsofQ8S.jpg', '[]', 'membership/photos/YvfSt26hhLQuBduMl0eR3PXjgemlg2BLdsjvhAZz.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 01:58:35', '2025-07-14 02:44:36', 1),
(183, 250, '2000804', 'Needle Craft Embroidery', 'Proprietorship', 'Md. Jakir  Hossain Sajal', NULL, 'House # Ka-147, Aburtek,Khilkhet (Near Mohammadia Garments), Dhaka-1229.', NULL, '01819463192', 'needlecraft04@gmail.com', 'Male', 5000.00, 0.00, 4, 'Sunstar & Portugal', '100', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/rXO8LR8oaf2Rkj1KwSYPdqWFf8Em6OMLrFWRlUIO.png', '[]', 'membership/photos/HuEMlaImF4Y0bPH9fye9j3U5LUCCmO7DB1s6iHkX.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 02:08:13', '2025-07-14 02:43:23', 1),
(184, 251, '0700358', 'Nilu Fashion', 'Proprietorship', 'Md. Mizanur Rahman Patwary', NULL, '11/C, Avenue-05, Lane-15/1, House-07, MIrpur,  Dhaka-1216.', NULL, '01715124176', 'nilu_mizan@yahoo.com', 'Male', 5000.00, 6000.00, 4, 'Jintel, Zhanyi & Feiying', '100', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/R1mwjsQ9JxCLmR3GvgBVFBP186okGjglvdk0Tegi.jpg', '[]', 'membership/photos/MNhAkZOLiyCDEx0b0JiZ93zwphRir7bZc4mFHmp0.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 02:14:10', '2025-07-14 02:42:19', 1),
(185, 252, '0600259', 'Nipun Embroidery', 'Proprietorship', 'Md. Shofiqul Alam', NULL, 'Paper Mill Road, Abdullahpur, Dhaka-1230.', NULL, '01819199880', 'nipunep@gmail.com', 'Male', 5000.00, 0.00, 4, 'Lejia Xtreme', '119', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/yMKxYDfe3tJEis68g7swWltHTlQjGJ6FVo2EHIJ1.jpg', '[]', 'membership/photos/zTb7pgTAaiVo5SExVQTljIUwSTJDBFq0CkBLVbrF.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 02:17:07', '2025-07-14 02:39:45', 1),
(186, 253, '0700374', 'P.Q.S Printing & Embroidery Ltd.', 'Limited Company', 'Wahid Ahmed', NULL, 'Kunia K.B. Bazar, (Boro Bari) Gazipur Sadar, Gazipur.', NULL, '01711560633', 'wahid.ahmed@parkscenebd.com', 'Male', 10000.00, 0.00, 11, 'Tongly & China', '206', '09', 10000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/TTRBUL1je4GEPoG4qf0QP3xXaHr7W0GJUYRB8xmI.jpg', '[]', 'membership/photos/01K041B9M7CRSCMKEC8A792FGX.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 02:22:29', '2025-07-14 02:38:13', 1),
(187, 254, '1900788', 'P.R Embroidery', 'Proprietorship', 'Nerup Kumar Saha', NULL, 'Wirless Gate, T & T Road, Jaydebpur, Gazipur.', NULL, '01972158960', 'pr.embroidery2010@gmail.com', 'Male', 5000.00, 15000.00, 9, 'Tajima & Champion', '175', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/cTjRuoSChicRy2yLM2wHfXAWIUiSB52HrDSvhr18.jpg', '[]', 'membership/photos/WoTm3qyJUhtmofz2ppIkm9nVKKXwXZlZShy7mFSy.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 03:19:29', '2025-07-16 06:15:27', 1),
(188, 255, '1700739', 'Peacock Garments & Print.', 'Proprietorship', 'Md. Kamruzzaman (Milon)', NULL, '227/1, Block-A, Woard-04, Madrasha Road Vangnahati, Sreepur, Pourashava, Gazipur.', NULL, '01713004734', 'info@peacockdesign.net', 'Male', 5000.00, 0.00, 27, 'Sunstar, Jintel & China', '420', '09', 10000.00, NULL, 10000.00, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BNXHHXFP10BQQYG1QNF0F4.jpg', '[]', 'membership/photos/01K0BNXHHY4RE5A12KYK3QWP7D.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-14 03:26:38', '2025-07-17 07:52:23', 1),
(189, 256, '0189', 'Pentex Embroidery', 'Proprietorship', 'Mizanur Rahman', NULL, 'House-55/G/1, Road-03, Khilkhet Tanpara, Nikunja-02, Dhaka-1229.', '0300201', '01711542475', 'prashank1995@yahoo.com', 'Male', 5000.00, 0.00, 4, 'Sunstar & Jintel', '75', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/Sk80MZqKMWS25YEV0rX5nmGXKOUu0bncXyW55D0m.jpg', NULL, 'membership/photos/gMV9rDziIbNigYxFlEo17XNHDQmQnqFj4lGbaElA.jpg', 0, NULL, NULL, '2025-07-14 03:32:17', '2025-07-14 03:32:17', 0),
(190, 234, '1000518', 'Maowa Fashion', 'Proprietorship', 'M. Bodruzzaman (Pintu)', NULL, 'House No # 16/1, Road No. # 01, Block # C , Razabari, Turag, Dhaka.', NULL, '01713077753', 'maowafashion@gmail.com', 'Male', 5000.00, 12000.00, 4, 'Barudan, Tajima, Hiking & Jintel', '95', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BP9ZF1YEYYE4SGHEH0A2RJ.jpg', '[]', 'membership/photos/01K0BP9ZF2AA06Y20KB1Q7C89X.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 03:35:51', '2025-07-17 07:59:11', 1),
(191, 257, '1500696', 'Perfect Wrold Ltd.', 'Limited Company', 'Shoeb Ahmed', NULL, 'Joybangla Road, Dakhin Khaikur National University, Gazipur Sadar, gazipur.', NULL, '01794341902', 'perfect.shoeb@gmail.com', 'Male', 10000.00, 14000.00, 3, 'Tongli', '60', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BS32BMNDXQH34PC526VVTZ.jpg', '[]', 'membership/photos/01K0BS32BPJZQQJC013MWFWWB8.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 03:40:03', '2025-07-17 08:47:50', 0),
(192, 258, '1700748', 'Quais Garments (Pvt.) Ltd.', 'Limited Company', 'Md. Emam Hossain', NULL, 'Gaizipura Bus Stand, Gazipura (Ershad Nagar), Tongi Gazipur.', NULL, '01711463486', 'emam@quaisgarments.com', 'Male', 10000.00, 15000.00, 8, 'Barudan', '146', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01K0BRYPMGWK5R2EFZYKJRYYR5.jpg', '[]', 'membership/photos/01K0BRYPMJJCD7SDZR18VYFJ9N.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 03:45:55', '2025-07-17 08:45:44', 1),
(193, 259, '1200608', 'R.K Fashion', 'Proprietorship', 'Md. Ramzan Ali', NULL, 'Noyanagar Main Road, Nishad Nagar Romzan Market, Turag, Dhaka-1230.', NULL, '01914605421', 'rkfashion@gmail.com', 'Male', 5000.00, 18000.00, 4, 'China, Monpura & Portugal', '95', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BRQWX93KC0KEP4HSJHSB2J.jpg', '[]', 'membership/photos/01K0BRQWXBZSN3NTQQ2NNYP7GJ.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 04:04:47', '2025-07-17 08:41:44', 0),
(194, 260, '1000542', 'R.S Design & Fashion', 'Proprietorship', 'Md. Liton Sikder', NULL, '38/Ka, Khilkhet Tanpara,  Dhaka-1229.', NULL, '01720098140', 'rsdesign.fashion@yahoo.com', 'Male', 5000.00, 0.00, 4, 'Jintel, Feiying & Original', '4', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BRMM5X5SM9EK59CA1F5VQQ.jpg', '[]', 'membership/photos/01K0BRMM5Z9W2MKBRAD2BZ8QH7.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 04:10:38', '2025-07-17 08:39:57', 1),
(195, 236, '1200586', 'Maxim Tex', 'Proprietorship', 'Md. M. N Kabir', NULL, 'Plot # 48, Block # D, Road # 10, Monsurabad Housing, Adabor, Dhaka-1207.', NULL, '01818101264', 'maximsourcing24/7@gmail.com', 'Male', 5000.00, 0.00, 4, 'Embroidery Hub', '89', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01K0BRHFRKH62HN5VPGG7VMWNH.jpg', '[]', 'membership/photos/01K0BRHFRNM7EAX1THP7E5QC98.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 04:17:21', '2025-07-17 08:38:14', 1),
(196, 261, '1500704', 'R.K Embroidery', 'Proprietorship', 'A.K.M Kamruzzaman', NULL, '1033, Shewrapara, Mirpur, Dhaka-1216.', NULL, '01819283750', 'rk.embro@yahoo.com', 'Male', 5000.00, 20000.00, 4, 'Barudan & China', '65', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01K0BR1M2QWJDRMKZ7CF4Q6TYZ.jpg', '[]', 'membership/photos/01K0BR1M2RKYC3CZ04PFVGN18P.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 04:22:51', '2025-07-17 08:30:00', 0),
(197, 262, '1900793', 'R.K. Fashions', 'Proprietorship', 'Md. Razaul Kabir', NULL, 'Plot-326, Ashutia Dhour, Nishad Nagar, Turag, Dhaka-1230.', NULL, '01847056098', 'rkfashions.bd25@gmail.com', 'Male', 5000.00, 0.00, 4, 'China & Jintel', '105', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BQYC0J003B2ZRYMB64ZZTD.jpg', '[]', 'membership/photos/01K0BQYC0KSKWKG843KGW4Q8R4.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 04:28:22', '2025-07-17 08:27:48', 1),
(198, 263, '1200590', 'R.S Embroidery Zone', 'Proprietorship', 'Md. Fakhrul Islam', NULL, 'House-1/1, Monsurabad Housing Road-09, Block-D, Adabor, Dhaka', NULL, '01612584294', 'fakhrulislam27@yahoo.com', 'Male', 5000.00, 0.00, 2, 'Autowin', '30', '09', 2000.00, NULL, 5000.00, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BQSDHA907P88DJ5HXTS8S5.jpg', '[]', 'membership/photos/01K0BQSDHCXPJDWM8JC89YV9DP.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 04:33:35', '2025-07-17 08:25:05', 1),
(199, 264, '0800401', 'Rafiu Embroidery ', 'Proprietorship', 'Md. Kamal Hossen Sarker', NULL, 'Plot # 4,-4/1, Ibnesina Housing Road # 10, Adabor, Dhaka-1207.', NULL, '01630463600', 'kamal_sarker@hotmail.com', 'Male', 10000.00, 0.00, 4, 'Autowin', '59', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BQMB5KN8FD64XZQRAAJ5F7.png', '[]', 'membership/photos/01K0BQMB5NY14RKEZG0AN3C8F6.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 04:55:02', '2025-07-17 08:22:19', 1),
(200, 265, '1100534', 'Raiment Apparels', 'Proprietorship', 'Syed Saiful Islam Shihab', NULL, 'House-350 (Holding-688/2), Block-C, Khilgaon, Chowdhury Para, Dhaka-1219.', NULL, '01819292260', 'shihab@raimentapparels.com', 'Male', 5000.00, 6000.00, 4, 'Autowin & Moonstar', '60', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BQFNTDDKGK2M1JYXWG0RTC.jpg', '[]', 'membership/photos/01K0BQFNTFE4V34QJWX6TK43E5.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 05:01:44', '2025-07-17 08:19:46', 1),
(201, 266, '1200621', 'Raisa Accessories', 'Proprietorship', 'Resaul Karim Chowdhury Popy', NULL, 'Salina Tower, Holan Road, Islambagh, Dhakkin Khan, Uttara, Dhaka-1230.', NULL, '01819224240', 'rnppopy@yahoo.com', 'Male', 5000.00, 0.00, 8, 'RNP', '120', '06 & 09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BQCVDGGZ9AM55XCG1V3N0Z.jpg', '[]', 'membership/photos/01K0BQCVDJWFPYC2R9J9ZPMZ0E.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 05:17:22', '2025-07-17 08:18:14', 1),
(202, 267, '1800772', 'Rams Fashion & Accessories', 'Proprietorship', 'Md. Fakhrul Alam', NULL, '371, Monierbagh ( Ground & First Floor) Uttar Badda, Badda, Dhaka-1212.', NULL, '01713047708', 'm.f.ashimul@gmail.com', 'Male', 5000.00, 0.00, 6, 'Tajima', '120', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BQ9TKSSFPSEJTYY3977ZFD.jpg', '[]', 'membership/photos/01K0H4BR86KTPASM1GF1H034YN.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 05:24:23', '2025-07-19 10:41:12', 1),
(203, 268, '0800450', 'Rams Fashion & Embroidery', 'Proprietorship', 'Rafiqul Alam Helal', NULL, 'Gohail bari, Shimulia, Zirani Bazar (BKSP) Ashulia, Savar, Dhaka.', NULL, '01713047708', 'ralam@ramsfashion.com', 'Male', 5000.00, 0.00, 22, 'Tajima & Japan Nova', '440', '09', 10000.00, NULL, 16000.00, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BQ445WYKPCH2CH410KHJKS.jpg', '[]', 'membership/photos/01K0H45ZRVRN3C6QP7G0D6CCEE.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 05:30:15', '2025-07-19 10:39:31', 1),
(204, 269, '1200582', 'Regain Design & Fashion', 'Proprietorship', 'Narayan Karmaker', NULL, 'Kha/2/C, Raod-12, Khilkhet Tanpara, Nikunja-02, Dhaka-1229.', NULL, '01731694277', 'regaindf@yahoo.com', 'Male', 5000.00, 16000.00, 4, 'Jintel, BLL & Orginal Portugal', '140', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BPZXZD0YS8S9F7FTK69F6Y.jpg', '[]', 'membership/photos/01K0BPZXZFNTM141PCA2NE80QV.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 05:34:35', '2025-07-17 08:11:10', 1),
(205, 270, '0600277', 'R-Hossan Fashion & Embroidery', 'Limited Company', 'Md. Amir Hossain Salim', NULL, 'House-1/1, Road-9, Monsurabad Housing, Adabor, Dhaka.', NULL, '01715111887', 'hossainfashion@yahoo.com', 'Male', 10000.00, 0.00, 4, 'MTI & Jintel', '65', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BPVFMRRP43E2EY5GZ3299S.jpg', '[]', 'membership/photos/01K0BPVFMTVRW1Z7BS8WQD5YKQ.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 05:37:27', '2025-07-17 08:08:44', 1),
(206, 272, '1200612', 'Right On Design & Fashion', 'Proprietorship', 'Bulbul Kumar Roy', NULL, 'House-Ka, 2/C, Road: 12(west side) Khilkhet Tanpara, Nikunja-02, Dhaka', NULL, '01715542704', 'rodfemb@yahoo.com', 'Male', 5000.00, 0.00, 4, 'Jintel, Wintel & Feiying', '165', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BPHTGCH4HFR058ZZT2RYN1.jpg', '[]', 'membership/photos/01K0BPHTGFS3BJQWQRBWMEXX9P.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 05:46:31', '2025-07-17 08:03:28', 1),
(207, 273, '2000805', 'Royal BD Fashion', 'Proprietorship', 'Md. Ahtasur Rahman (Shanto)', NULL, '46, Abdullahpur, Sector-08, Uttara, Dhaka-1230. (Promir Building)', NULL, '01916858825', 'royalbdfashion@gmail.com', 'Male', 5000.00, 0.00, 4, 'Hefeng, Gama, TFI Portugal', '188', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01K0BP0WA5V25R3N7JK50DTEV9.jpg', '[]', 'membership/photos/01K0BP0WA7ZG6D2Q2A946TGVRT.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 05:52:34', '2025-07-17 07:54:31', 1),
(208, 274, '1600731', 'Royel Embroidery', 'Proprietorship', 'Md. Ibrahim Khalil', NULL, '48/1, Hossain Market Dattapara, Tongi, Gazipur-1712', NULL, '01719755190', 'royelembroidery@gmail.com', 'Male', 5000.00, 16000.00, 14, 'Royel Portugal', '255', '09', 10000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01K0BNS52Q884560Q1GY2EM357.jpg', '[]', 'membership/photos/01K0BNS52S4V79YG1AM5E148FB.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 05:58:01', '2025-07-17 07:50:00', 1),
(209, 275, '1400693', 'S & A Stitches', 'Proprietorship', 'S.M. Alauddin Ahmed', NULL, 'House-219, A/C Uttar Khan, Mastarpara, Uttara, Dhaka-1230.', NULL, '01973215225', 'smalauddinahamed@yahoo.com', 'Male', 5000.00, 0.00, 4, 'China', '80', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BNM3VAFVTBXBVQKBDW6PB7.jpg', '[]', 'membership/photos/01K0BNM3VC3KRJDCZQJZTGWTQX.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 06:02:03', '2025-07-17 07:47:24', 1),
(210, 276, '0100169', 'S & D Embroidery', 'Proprietorship', 'Ahsan Habib Dulal', NULL, 'Dewan Monjil, Road-4, House-6/B, Shapla Housing,  Union Tatulzora, Zarpul, Savar, Dhaka.', NULL, '01713002867', 'sndd67@gmail.com', 'Male', 5000.00, 22000.00, 16, 'Tajima, Sunstar & Jintel', '285', '09', 10000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BNFHM82Y8HCW3JYCXNR1CZ.jpg', '[]', 'membership/photos/01K0BNFHM981VXMKWD94PPQ239.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 06:06:37', '2025-07-17 07:44:45', 1),
(211, 277, '1900781', 'S A Embroidery', 'Proprietorship', 'Md. Akhter Hossain', NULL, '223/1, Choydana, National University Gazipur Sadar, Gazipur.', NULL, '01911402114', 'akbar.snpd@gmail.com', 'Male', 5000.00, 25000.00, 8, 'Tajima & Jintel', '135', '06 & 09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BNCS7MPVRKVWAF0DD7R21C.jpg', '[]', 'membership/photos/01K0BNCS7NE16MC9FAZP3G72HH.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 06:10:14', '2025-07-17 07:43:14', 1),
(212, 278, '1500706', 'S.M International', 'Proprietorship', 'Md. Abu Sayed Khan', NULL, 'House-75, Road-13, Sector-10, (5th Floor) Uttara, Dhaka-1230.', NULL, '01740957875', 'sm_inter2010@yahoo.com', 'Male', 5000.00, 6000.00, 2, 'China', '15', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BN96R2YBS7K4BNVN74WCGC.jpg', '[]', 'membership/photos/01K0BN96R3P8K8ENTPKTZ43NMV.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 06:14:38', '2025-07-17 07:41:17', 1),
(213, 279, '1000510', 'S.A Corporation', 'Proprietorship', 'Md. Shafiqul Islam', NULL, 'House-14, Road-04, Nabi Nagar prokolpo Mohammadia Housing, Mohammadpur, Dhaka-1207.', NULL, '01713075620', 'sabizbd@yahoo.com', 'Male', 5000.00, 2000.00, 4, 'Tajima & China', '75', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/UeROSVKjByoiNxrwoK1Nupav9DoKp9fc99gIfpAv.jpg', '[]', 'membership/photos/8XtG33hd3Qkpx33ilIRt7ZqLjkBJD3WDwHyAAjIy.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 06:18:57', '2025-07-16 06:40:38', 1),
(214, 280, '1700736', 'Sadia Fashion', 'Proprietorship', 'Asi Uddin Sarker Khokon', NULL, 'House-19.Sector -08, Abdullahpur, Uttara, Dhaka-1230.', NULL, '01511710208', 'sadiafashion134@gmail.com', 'Male', 5000.00, 2000.00, 4, 'China', '135', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/HSQweVm4lARxV9RUPJBGisQ4IDoTvUtbSKA6m0so.png', '[]', 'membership/photos/07ZvyIKrlzZkL8jS1nD6zzzOiBKAZpCAI1Tof0q6.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 06:22:46', '2025-07-16 06:39:26', 0),
(215, 281, '1100540', 'Safia Fashion', 'Proprietorship', 'Md. Kawsar Alam (Kazol)', NULL, 'House-712/22/A/1, Road-10, Baitul Aman Housing Adabor, Dhaka-1207.', NULL, '01714219524', 'safiafashiondesign@yahoo.com', 'Male', 5000.00, 22000.00, 4, 'MTI & Autowin', '185', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/rsh21ApC2AkaK3BwwmAQ8hyPrOlTtrfeQuX2N6Ye.jpg', '[]', 'membership/photos/FKNfgW1m2UQLTgtYml9NJ2e3hkNqK2hni2oX1a6J.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 06:30:37', '2025-07-16 06:38:07', 1),
(216, 282, '1200633', 'Samantha Embroidery & Print', 'Proprietorship', 'Md. Shamim', NULL, '42/2-A, Meradia, Nayapara, Khilgaon, Dhaka-1219.', NULL, '01716892027', 'samanthaembroidery@yahoo.com', 'Male', 5000.00, 9000.00, 4, 'China', '90', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/QT5cAOp8Qfw8UONdMCbGwrpP6zSUAp879YyHMVAP.jpg', '[]', 'membership/photos/OfQb1kNnPtGkYvApoVfrzvzUzHcgPIyAVHZiHs1a.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 06:34:35', '2025-07-16 06:36:45', 1),
(217, 283, '0100008', 'Sams Fashion', 'Proprietorship', 'Alhaj Abdul Aziz Dewan', NULL, 'House-53/17, Road-10, Block-Kha, P.C Culture Housing Society, Shekertak, Mohammadpur, Dhaka-1207.', NULL, '01715019555', 'samsembr@gmail.com', 'Male', 5000.00, 71500.00, 7, 'Barudan & Sunstar', '140', '09 & 15', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/HekUoeOSEN8fr0NkOYmCKnlQR6tDPXqk6SAEsSU0.jpg', '[]', 'membership/photos/bAhi7AgVoJbzaylkq9zMcl9fBS22Fnl74tepDBBt.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 06:40:20', '2025-07-16 06:34:44', 1),
(219, 285, '1200581', 'Sayem Fashion', 'Proprietorship', 'Kamruzzaman Sikder Babul', NULL, 'House-Kha-39, Road-05, Khilkhet Tanpara, Nikunja-02, Dhaka-1229.', NULL, '01726705265', 'albi_sayememb@yahoo.com', 'Male', 5000.00, 20000.00, 4, 'Jintel, Zhanyi & Portugal', '130', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/BgK47buYDmOvzYenDoCdEDty02mfd7ZzwEk5Fc8E.jpg', '[]', 'membership/photos/J7Ya4EHSUP8G5iAhBTRhD07EJhhLAXTV9OFWrB06.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 06:51:19', '2025-07-16 06:33:07', 1),
(220, 286, '1600722', 'Selima Embroidery Ltd.', 'Proprietorship', 'Mustaeem Billah Chowdhury', NULL, '23/8, Niribili Housing Society Nayarhat (Kurgaon), Ashulia, Savar, Dhaka.', NULL, '01717828450', 'info@regreenbangla.com', 'Male', 5000.00, 35000.00, 7, 'Tajima & Barudan', '142', '06, 07 & 09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/oQaQ82TcPn5MkI4kGai3LVOlUlQRTtQGlKyzvyec.png', '[]', 'membership/photos/nwDOtnPSMzO77Cl05nL4IrhmWJQnyYRo1OoxhmsK.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 06:55:48', '2025-07-16 06:26:35', 1),
(221, 287, '1200611', 'Shadeshi Uddag Embroidery', 'Proprietorship', 'Mr. Ahmadul Hasan', NULL, 'House-19, Block-F, Baitut Tayba Mosque Market,  Johuri Mohallah, Mohammadpur, Dhaka-1207.', NULL, '01711034936', 'shadeshiduddog96@gmail.com', 'Male', 5000.00, 9000.00, 5, 'Sunstar, MTI & China', '76', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/TJ88hakivgwE0luvwU6H1ESIaF8EUhSW14yCqygq.jpg', '[]', 'membership/photos/nUvEpNwdq9T3rubo1DgX7CYQQdmn8vgXtz1HY7Co.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 07:00:02', '2025-07-16 06:25:17', 1),
(222, 288, '1200570', 'Shawon Fashion', 'Proprietorship', 'Md. Rafiqul Islam Mridha', NULL, 'House-17/1-B, Babor Road, Mohammadpur, Dhaka-1207.', NULL, '01718715345', 'shawon_fashion@yahoo.com', 'Male', 5000.00, 21000.00, 4, 'china', '64', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/T2SaMYSemz9uFihMF7xvtYbpDPddIISlvSTWbPy5.jpg', '[]', 'membership/photos/zyrrrt3DMYs3XpOLgVucScRqzLWvrZbmXsxaDxF1.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 07:03:33', '2025-07-16 06:22:03', 1),
(223, 289, '1700752', 'Shotata Aree Fashion', 'Proprietorship', 'Md. Abdur Rob', NULL, 'House-185, College Road Ashkona Dakshin Khan, Uttara Dhaka-1230.', NULL, '01720068690', 'shotataareefashion@gmail.com', 'Male', 5000.00, 14000.00, 4, 'China', '60', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/V2pbODTspEHYlePGQek5AQyH8WLIgLrNo8iJJsua.jpg', '[]', 'membership/photos/NkCjaQlmUFyqoR4mFNBj0uDlbF7N8e3l9efOndSJ.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 07:06:56', '2025-07-16 06:20:59', 1),
(224, 290, '1800756', 'Sikder Embroidery', 'Limited Company', 'Md. Mizanur Rahman', NULL, 'House-32, Peer Bari, Aichi Medical College Road, Sector-08, Uttara Dhaka-1230.', NULL, '01731156248', 'sikderemb1@gmail.com', 'Male', 10000.00, 14000.00, 4, 'China', '60', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/ty4seEzNJ6Lvhw3HaZZSaVJe7kUGBUOSd8Paeahu.png', '[]', 'membership/photos/wlpeCqwtIuGFjyv8gCcidZKzvkY5560InDvnutt6.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 07:13:34', '2025-07-16 06:19:38', 1),
(225, 291, '1800768', 'Maxtrims Int.', 'Proprietorship', 'Md. Abul Kalam Azad', NULL, 'Dag No-64, JL-140, Village-Jinsira Post-Biruliak, P.S-Savar, Dhaka.', NULL, '01713081208', 'azad@maxlfeets.com', 'Male', 5000.00, 8000.00, 4, 'China', '75', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/Xe6LeIe0YoPSqAaqN4rkx4uOLbYwvEQ9i2lrn1RA.jpg', '[]', 'membership/photos/6xwW3tTqw234BULSoPxcU2DOIRZqOGFFYWMuyvsC.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 07:17:50', '2025-07-16 06:17:26', 1),
(226, 292, '0100135', 'N. Chowdhury Fashion Incorporation', 'Proprietorship', 'Nooruddin Chowdhury Manik', NULL, 'A/54, Lalkuthy, 3rd Colony Mazar Road, Mirpur-1, Dhaka-1216.', NULL, '01819253276', 'manikc30@yahoo.com', 'Male', 5000.00, 28000.00, 2, 'Sunstar', '40', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/SxWrx26gdwEvK45Js3m4xNkq45jq3GpUNXNtXAkV.jpg', '[]', 'membership/photos/48gYiQto7CCEQG5QW4lRzH5hgsDCO3O1SVN5f6Cf.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 07:22:58', '2025-07-15 06:52:13', 1),
(227, 293, '1800759', 'Sikder Embroidery-02', 'Proprietorship', 'Md. Rafiqul Islam (Shamim)', NULL, 'Peer bari Road,  Sector-08, Abdullahpur, Uttara, Dhaka-1230.', NULL, '01923707749', 'sikderemb02@gmail.com', 'Male', 5000.00, 2000.00, 4, 'China', '105', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/tdFJBo4ZKcD9xOUjIGTTvenjSnxv6j7LT2uA1aZk.jpg', '[]', 'membership/photos/JkEP9zruQ1ab2rcMQ2KB7wNRd48TrOB3zjeik0GZ.jpg', 1, '2025-07-30 18:00:00', NULL, '2025-07-14 07:27:39', '2025-07-15 06:50:45', 1),
(228, 295, '1000536', 'Silk Road Embroidery & Fashion', 'Proprietorship', 'Md. Shahidul Islam', NULL, 'Bijoy Road, Mogorkhal, Board Bazar National University, Gazipur.', NULL, '01716907437', 'srembroidery@gmail.com', 'Male', 5000.00, 7000.00, 3, 'Bofan', '50', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/g26LiDIgqDwZ9raIZzGMzMsNsB0UYtNI4Fr7o336.jpg', '[]', 'membership/photos/hmscroNNldi3kASQfMqKYqceMGenvk4fa1utfgXF.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 23:24:12', '2025-07-15 06:49:32', 1),
(229, 296, '1900791', 'Silk Road Gears Limited', 'Limited Company', 'Nafees Muntasir Khan', NULL, 'Plot-26, Block-B, Shahid Sundar Ali Road Mahimpur Mill Gate, Tongi, Gazipur.', NULL, '01817140709', 'nafees@gearsgroup.com.bd', 'Male', 10000.00, 25000.00, 8, 'Tajima & Rispech', '160', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/xy2evAyLDu1uTwkTbGL8WVOd471iJzE23PRAef73.jpg', '[]', 'membership/photos/ApUoVeaiIpHVbmDVKwnZZoyB68ene8uNhQ7Uoao9.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 23:29:51', '2025-07-15 06:48:16', 1),
(230, 297, '0900469', 'Sonar Bangla Embroidery', 'Proprietorship', 'A.K.M. Al Mamun', NULL, '121/1, South Madertak Bashaboo. Dhaka-1214.', NULL, '01711892363', 'sonarbanglaemb@yahoo.com', 'Male', 5000.00, 31500.00, 4, 'Orginal', '64', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/gXv0Q85MtKSQtmNNssdjBmvByWtKN4YtcPG6y7Jp.jpg', '[]', 'membership/photos/4MXBgP5Hr6itjxwxR4PoSjE8wE4WTpKkHjUec0Uf.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 23:35:34', '2025-07-15 06:46:59', 0),
(231, 299, '1000501', 'Stitch Magazine Co., Ltd.', 'Limited Company', 'Chi Bin Kim', NULL, 'Unique, Gazirchat, Dag No-224, Mouza  Baipail Post-Alia Madrasha, Ashulia, Road, Savar, Dhaka.', NULL, '01711549746', 'smembroiderybd@gmail.com', 'Male', 10000.00, 0.00, 27, 'Tajima & Sunstar', '502', '06 & 09', 10000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/RF5u7iniRy44gQzaYYZ65hs719ZUSgT6iwfMnstd.png', '[]', 'membership/photos/j4o6tccXmN9UxEvUuU1qrGIVUihtRWJIcU2nu30j.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-14 23:44:54', '2025-07-15 00:04:07', 1),
(232, 298, '2501013', 'Perfect Art Enterprise', 'Proprietorship', 'Mehedi Hasan', NULL, 'House-82/04, Rajabari, Turag, Dhaka-1230', NULL, '01721005335', 'mehedi89hassan@gmail.com', 'Male', 5000.00, 0.00, 9, 'Bismillah', '151', '9', 5000.00, NULL, NULL, NULL, '2026-12-31', 2, NULL, NULL, NULL, 'membership/documents/5qh83nQniiTdz19a4EXBK6nuiTLqcGmcVkwdPoVi.jpg', '[]', 'membership/photos/UmeY8QfufQFnUM7EYuwJCfRmotcrGKEZPRrGAwZE.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-15 00:00:34', '2025-07-15 00:01:56', 0),
(234, 301, '1800777', 'Sundas Accessories & Printing', 'Proprietorship', 'Mrs. Anoara Akhan (Liza)', NULL, 'House-16, Dolipara, Road-06, Block-B, Badaldi, Turag, Dhaka-1230.', NULL, '01715008621', 'sundasaccessories2005@gmail.com', 'Female', 5000.00, 0.00, 6, 'China', '90', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/LnMKIpEZjTwPp0DFx83SlWdYs2wZVxFrQGztFUCQ.jpg', '[]', 'membership/photos/3BeAope9JPzEJnobVpb8qza1HplhCjMrknv9Jkuu.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 00:10:21', '2025-07-15 02:31:43', 1),
(235, 302, '0900462', 'Sunyan Fashion Ltd.', 'Limited Company', 'Syed Enamul Hoque', NULL, 'House-42, (1st Floor), Raod-I/A DOHS, Banani, Dhaka.', NULL, '01713020577', 'info@sunyanbd.net', 'Male', 10000.00, 0.00, 4, 'Laser', '60', '3008', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/xOtxeizgI1qoLuEWHDMtSY5AoMmVoy36yIqgRwGt.jpg', '[]', 'membership/photos/7Qo4vyVuvZ0pypBvfKNqICvr3hGSzxeZ1Ae4ovoR.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 00:22:28', '2025-07-15 01:34:22', 1),
(236, 303, '0236', 'Swiss Schiffli Fashion (BD) Ltd.', 'Limited Company', 'Md. Nurul Islam', NULL, 'House: 142(1st Floor), Road: 04, New DOHS Mohakhali, Dhaka', '0900478', '01711567878', 'info@ssfbdl.com', 'Male', 10000.00, 0.00, 7, 'Lasser AG', '100', '6768', 5000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/Zenl5iwmXcjEZySau0Bz4o5rENrrzbHVSfPgW2WT.jpg', NULL, 'membership/photos/mo68YDxaR2WiOScwlbBEZaT9Nr82RKw3cIAoL72B.jpg', 0, NULL, NULL, '2025-07-15 00:32:11', '2025-07-15 00:32:11', 0),
(237, 304, '0900485', 'Taj Apparels', 'Proprietorship', 'Mukhlesur Rahman', NULL, 'Enayet Nagar, Fatullah, Narayanganj,.', NULL, '01712229268', 'nrgroup@global-bd.net', 'Male', 5000.00, 12000.00, 3, 'Tajima', '60', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/gLOhW4TXFFnm65xtmmPNNkoSfoCRVCJUM7uCnFJR.jpg', '[]', 'membership/photos/01K06YR3KJ8NE7HHAJTMW25QRR.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 00:40:49', '2025-07-15 05:50:30', 1),
(238, 305, '1100538', 'Taj Design', 'Proprietorship', 'Minhaj Mukul', NULL, 'House-712/22/B-1, Road-10, Baitul Aman Housing Society Adabor Dhaka-1207.', NULL, '01715400939', 'minhajmukul@yahoo.com', 'Male', 5000.00, 0.00, 9, 'MTI & Champion', '157', '06 & 09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/MOKJfMhsH32YjYy9hYGmOVS9gZexEd6Z9PyQpeHc.jpg', '[]', 'membership/photos/WdFS9W4a21pmmddQ6QtnC3pRDU4cFUi4bGsvGQPu.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 00:48:16', '2025-07-15 05:39:36', 1),
(239, 306, '1400637', 'Shafin Fashion', 'Proprietorship', 'Md. Masud Rana', NULL, 'House: 726/51, Road-10,  Baitul Aman Housing Society Adabor, Dhaka-1207.', NULL, '01790508888', 'safinfashion2010@gmail.com', 'Male', 5000.00, 0.00, 3, NULL, '45', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/jJJfUBelNiWgZYfljQPzqBV5JTZ1UGqArsXDWnPx.jpg', '[]', 'membership/photos/qULQyVTBcUgvPR8D69mZ5nnvETOJxTi5WzP0qa39.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 00:56:40', '2025-07-15 05:37:39', 1),
(240, 307, '1900780', 'Target Corporation', 'Proprietorship', 'Md. Shohel Siddiq', NULL, 'House-39/71/3, Baistaki, Section-13, Mirpur, Dhaka.', NULL, '01798303040', 'shohelmo@gmail.com', 'Male', 5000.00, 0.00, 4, 'Super Ray', '60', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/bVVaNMQbxhs6BauVGngWvU0LVJklUABClrjo1z3A.jpg', '[]', 'membership/photos/krESjYbyxPJi5GyaaVNWN6ZSJUtWiHmeXJ54uloX.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 01:05:48', '2025-07-15 01:30:21', 1),
(241, 308, '0200173', 'Teelok Printing & Embroidery', 'Proprietorship', 'Nurul Islam', NULL, 'Razbari (Momin Nagar) Gorai Mirzapur, Tangail.', NULL, '01711801271', 'habib.inctl@gmail.com', 'Male', 5000.00, 30000.00, 6, 'Barudan & Sunstar', '80', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/VA8AxjTSPbpuwRCBpWGnS8eeUGFtgqOJQDoN9zhQ.jpg', '[]', 'membership/photos/kj9nmfL4BFc2I7YxuXSJWQXoFRlHB0CXwaURnQZQ.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 01:19:15', '2025-07-15 02:34:12', 1),
(242, 309, '1200566', 'Tensy Fashion', 'Proprietorship', 'Shahnawaz Mahmood', NULL, 'House-64, Road-7, Rofique Housing shekertek, Adabor, Dhaka.', NULL, '01711978485', 'tensy@yahoo.com', 'Male', 5000.00, 21000.00, 4, 'Sunstar', '72', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/wpQKFdqVQ3qJdzYangOPr3okpr9u4SMQbyH985Vj.jpg', '[]', 'membership/photos/pSrNOdt05DuLGbUTLAjh0dJ6jc9IVrFushazOYge.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 01:25:32', '2025-07-15 05:32:09', 0),
(243, 310, '1800753', 'Tex Embroidery Design', 'Proprietorship', 'Md. Milon Shikder', NULL, '39/11/C/1, Baistaki, Haji Ali Hossain Road, Mirpur-13, Dhaka-1216.', NULL, '01726076288', 'millonshikder095@gmail.com', 'Male', 5000.00, 0.00, 4, 'Texim', '60', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/BNVWEWxxFSsQeUVVgnMe5oth03Tgj8fnq7Ntuh6j.jpg', '[]', 'membership/photos/OhR6OrmjTO1zGObFuFUAvPIroKO40nFoHTuEZSPf.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 01:30:25', '2025-07-15 01:44:43', 1),
(244, 311, '0100032', 'The Linkers Intl (Pvt.) Ltd.', 'Limited Company', 'Syed Mahfooz Ali', NULL, '34/1, Borthon Bari, Mirpur-1, Dhaka-1216.', NULL, '01711544675', 'linkers1993@yahoo.com', 'Male', 10000.00, 12000.00, 4, 'Barudan', '80', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/fHCzpdPY3oS6rE6NkKAGh3H2AItQwTJElj49bm0d.jpg', '[]', 'membership/photos/01K06KB0G0BZV0NEJ4EQ7QG9BN.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 01:39:06', '2025-07-15 02:31:07', 1),
(245, 312, '1200558', 'Tisha Fashion', 'Proprietorship', 'Md. Liton Bhuiyan', NULL, 'House-54, Darussalam, Mirpur Road, Dhaka-1216.', NULL, '01711715216', 'tishafashiondk@gmail.com', 'Male', 5000.00, 23000.00, 4, 'Autowin, RNP & Tajima', '64', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/YhsAKowxbY0R4DWgs0Efj8o2qshdpl3BtgxrefSe.jpg', '[]', 'membership/photos/01K071TT3W8N0VWQYAAXA36NK2.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 01:46:31', '2025-07-15 06:44:25', 1),
(246, 313, '1000517', 'Top-Speed Embroidery Ltd.', 'Proprietorship', 'Md. Selim Reza', NULL, 'BSCIC Industrial Area, Plot-B-10, Shasongaon, Fatullah, Narayangonj.', NULL, '01819221520', 'topspeedbd@gmail.com', 'Male', 5000.00, 2000.00, 4, 'Lejia', '80', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/Xw71rLDUC9hnpMoOklSsQXg1vUPBQgLa3pQYRwvT.jpg', '[]', 'membership/photos/01K06NFP7M8AYWMVTWK5GYQM63.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 01:52:12', '2025-07-15 03:08:37', 1),
(247, 314, '1600733', 'Trust Accessories', 'Proprietorship', 'Md. Golam Zabbar Sonnet', NULL, '299/1, Kalemeswar, Post-National University Gazipur. Gazipur Sadar.', NULL, '01819259860', 'sonnet3s@yahoo.com', 'Male', 5000.00, 8000.00, 2, 'Barudan', '30', '06', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/6p7IdAxMn3VPc6s6LFc15Ijv8ANMJJ35h6F1rMjT.jpg', '[]', 'membership/photos/NgImjv3xeoFHH8OZ5YCIAJXOljfqbrzjMbeNg4Lw.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 01:56:53', '2025-07-15 02:38:12', 1),
(248, 315, '1400666', 'Unique Fashion', 'Proprietorship', 'Md. Faruk', NULL, '41, Main Road, Mehedibag Housing  Society Adabor, Dhaka-1207.', NULL, '01685336731', 'qniquefashion1972@gmail.com', 'Male', 5000.00, 20000.00, 2, 'Zhanyi', '36', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/CfzFeLuurwbWATWJxViSoBFk2mc94ST4xB1il6IX.png', '[]', 'membership/photos/NUuDTMnn7eny6WqqJkdya30m4CVdmMuavAVy9Lxw.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 02:03:54', '2025-07-15 02:36:43', 1),
(249, 316, '1400648', 'Vintage Embroidery', 'Proprietorship', 'Md. Ishaqu-Ur-Rahman', NULL, 'House-726/21/2, Road-10, Baitul Aman Housing, Adabor, Dhaka.', NULL, '01612300123', 'ishaq003@gmail.com', 'Male', 5000.00, 0.00, 4, 'Chijia', '102', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/43UFOlJsDNv9gzeNTqxPJ7OodnbC2PshY05h7vuF.jpg', '[]', 'membership/photos/INF43Bgyo5EpscQbtI2FsbHx1Vyq8rkzfywkCq5E.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 03:02:28', '2025-07-15 03:09:57', 1),
(250, 317, '1200629', 'Well Embroidery & Punching', 'Proprietorship', 'Syed Shariful Islam Ponir', NULL, 'House-83/84, Molovertek (2nd Gate) Khilgaon, Dhaka-1219.', NULL, '01819401894', 'wellembo@gmail.com', 'Male', 5000.00, 0.00, 4, 'China', '60', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/2OhZGiGy845U3efbRXFELiBetXwLh0rYNKeboewU.png', '[]', 'membership/photos/FABuAFUFWplYAv5g6td0ekjgj5xu7axuGDNGoVCm.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 03:18:16', '2025-07-15 05:30:47', 1),
(251, 318, '1900795', 'Yes-Tex Limited', 'Limited Company', 'Md. Nazrul Islam', NULL, '274, Naya Nagar, Puran Kalia Road, Nishad Nagar, Turag, Dhaka-1230.', NULL, '01711529182', 'yestexltd@gmail.com', 'Male', 10000.00, 15000.00, 9, 'Tajima Barudan & China', '160', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/BI8HvoF6A16EQKbQB9okwWEEnhP5q4Tdi7YUEp7f.jpg', '[]', 'membership/photos/PuBEInQGLBwcDJLRPWCEld5P8MOiHndRNjtXIln3.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 03:30:43', '2025-07-15 05:28:52', 1),
(252, 319, '0800409', 'Zara Schiffli Embroidery', 'Proprietorship', 'Zashim Uddin Khan', NULL, 'House-22, Road-14, Sector-04, Uttara, Dhaka-1230.', NULL, '01713460607', 'zara@zaragroupbd.com', 'Male', 5000.00, 35000.00, 7, 'Laser Switzerland', NULL, '300', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BZYC1JJA3JTY57DQ1PZRC2.jpg', '[]', 'membership/photos/01K0BZYC1MPZ1X5RHTJ05ENX36.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 03:38:48', '2025-07-17 10:47:36', 1),
(253, 320, '1100544', 'World Victory Enterprise', 'Proprietorship', 'Md. Gulzer Hossain', NULL, 'Norshinghopur,East Sabed Ali Sarkar Road,Baghbari, Kashimpur, Gazipur', '1100544', '01796633040', 'shibber@worldvictorybd.com', 'Male', 5000.00, 0.00, 4, 'Feying, Jintel & Seeing', '80', '09', 2000.00, NULL, NULL, NULL, '2026-12-31', 1, NULL, NULL, NULL, 'membership/documents/BMOCpecrHy5Vq9FOrvV07xoDkpGfMRXIpo7n4dxu.jpg', '[]', 'membership/photos/q6VGxiS5lBXoFneAelEOMsnL6ofZbpn3ge18yLFg.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-15 03:43:35', '2025-07-15 05:27:12', 1),
(254, 321, '1800773', 'Asia Trading International', 'Proprietorship', 'kaisar Ahmed', NULL, '2No, Chittaranjan Avenue Sadar Ghat, Dhaka-1100.', NULL, '01715416657', 'asiaiticn2wd@hotmail.com', 'Male', 5000.00, 0.00, 0, NULL, NULL, NULL, 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/BLpCHTKARA81juYdMMbTqoPzoKH2woNEleGk2Txw.jpg', '[]', 'membership/photos/SY1w54vdj1yjpIPsva7UrcdvQzM1N3biqF2LSJSY.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 05:27:23', '2025-07-15 05:29:50', 1),
(255, 323, '1900784', 'Assurance Techno Solution', 'Proprietorship', 'Md. Monir Chowdhury', NULL, 'House-13, Road-01, Sector-11, Uttara, Dhaka-1230.', NULL, '01712539522', 'monirswf11@gmail.com', 'Male', 5000.00, 4000.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0P3A05VENGWFAZSRSZ9E7EE.jpg', '[]', 'membership/photos/01K0P3A05XVF91ZJ7GKH41WWDZ.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 05:37:32', '2025-07-21 08:58:47', 1),
(256, 324, '1700745', 'BKC Trading International', 'Proprietorship', 'Md. Khokon', NULL, 'Dakkhin Panishail, Mirdhabari, Kashimpur, Gazipur.', NULL, '01761159564', 'bkctradingbd@gmail.com', 'Male', 5000.00, 0.00, 8, 'Moonstar', '160', '06 & 09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, 'membership/documents/01K06ZZSTMTRP7BGBJKQYV37MV.jpg', 'membership/documents/01K06ZZSTPR4K3AG7M5Z354JEZ.jpg', '[\"membership\\/factory_photos\\/01K06ZZSTRZ17HAW02Z26SCM50.jpg\"]', 'membership/photos/Keopb9jkG0DIrDF1kk8fRxeBloejqcZKfdSVDfB4.png', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 05:49:31', '2025-07-15 06:12:11', 1),
(257, 325, '1900802', 'Lasser Service Bangladesh', 'Proprietorship', 'Mohammad Mizanur Rahman', NULL, '23 Johurabad, Mirpur-01, Dhaka-1216.', NULL, '01712111902', 'shahaali007@yahoo.com', 'Male', 5000.00, 2000.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/u7wOAI0Wk0I0zlqX9251UL9WxhU4Da2tSrWdwKrR.jpg', '[]', 'membership/photos/1ry60hGmPicIEI0qJAK1XvBw4EJH7q2x5yaQDLAC.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 06:03:57', '2025-07-15 06:39:50', 1),
(258, 322, '0258', 'S.Four Brothers', 'Limited Company', 'Md Sobuj Rana', 'MD Sobuj Rana', 'Ambagicha College Rd, Keraniganj', '01881807215', '01881807215', 'sobujrana874@gmail.com', 'Male', 10000.00, 0.00, 5, 'SEL', '100', '9', 5000.00, NULL, NULL, NULL, '2025-07-15', 9, 'Companies', NULL, NULL, 'membership/documents/vDFTXBxNtGDiQURkFv5WQz7Yk7fQwpLyFvhELq0k.jpg', '[]', 'membership/photos/01K071KR64GACCJSVHDNGR9S1C.png', 0, NULL, 97, '2025-07-15 06:07:25', '2025-07-15 06:40:33', 0),
(259, 326, '1000524', 'Muffttall Enterprise Ltd.', 'Limited Company', 'M.S.I. Chowdhury', NULL, 'Amtoli I/A, Thana-Boubal, Dist-Habiganj', NULL, '01720017300', 'mufrad2003@yahoo.com', 'Male', 10000.00, 8000.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/uhMTsNSFoHyEjds5wE1ncPlW622aug4YuzDyB4Zi.jpg', '[]', 'membership/photos/W3f6hjzOrhwzOOz7GPWQiHLfTHeODnNoNq0p2Tg7.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 06:09:42', '2025-07-16 02:35:30', 1),
(260, 327, '2000806', 'Royal BD Sequin & Fashion Accessories', 'Proprietorship', 'Md. Ahtasur Rahman  (Shanto)', NULL, '177, Abdullahpur, Sector-8 (East Side of Bus Stand), Uttara, Dhaka-1230.', NULL, '01712536460', 'royalbdsequin@gmail.com', 'Male', 5000.00, 0.00, 4, 'China', '80', '9', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/mvTOVYj4PHXmNXOMeYWfvKJtS5C2siZa7Mu8LSSI.jpg', '[]', 'membership/photos/hUGgPdrL5SI2lXN4qxNWbBc6q7wYrNEzb37dqLU5.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 06:16:03', '2025-07-15 06:38:27', 1),
(261, 328, '1600712', 'Saafi Trading', 'Proprietorship', 'Md. Sarwar Khaiyam Khan (Shaon)', NULL, 'House-14, Road-13, Sector-10, Uttara,(Near Kamarpara Bus Stand), Dhaka-1230.', NULL, '01714071290', 'info@saafibd.com', 'Male', 5000.00, 10000.00, 0, NULL, NULL, NULL, 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/pxXTx4DTVa4NBnAd55hL4MeAauWKs6DPjJcW8mga.jpg', '[]', 'membership/photos/9Ou0TYfQaA6jF2qKGrzVEZKinPlYK0x0IZrqQx7q.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 06:22:31', '2025-07-15 06:37:08', 1),
(262, 329, '1900794', 'Siam Traders', 'Proprietorship', 'Md. Alauddin', NULL, 'House-968, Road-15, Baitul Aman Society Adabor, Dhaka.1207.', NULL, '01680465738', 'siam13traders@gmail.com', 'Male', 5000.00, 0.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/2acLqJD3cJ7i7161TisgQmD3sfjriVLX9m5f1dzr.jpg', '[]', 'membership/photos/z2xwloL5NJywNYoETuXIK7JfuJc1ZHRCT7b52huk.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 06:26:11', '2025-07-15 06:35:57', 1),
(263, 330, '1200573', 'Vision  Trade International', 'Proprietorship', 'Md. Ruhul Amin', NULL, 'House-24/12-A, 1st Floor, Block-B, Khiljee Road, Shaymoli Mohammadpur, Dhaka-1207.', NULL, '01774759300', 'visiontradeint@gmail.com', 'Male', 5000.00, 4000.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/fGJgj5qHDuls8hyUuAdrD0TwOO8Fra8wZm7uwC6m.jpg', '[]', 'membership/photos/huYDtDqltIZkhfipNhjSnCmRGO9wyOP7seX4pMK8.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-15 06:30:13', '2025-07-15 06:34:26', 1),
(264, 334, '2501007', 'Esha Sewing Centre', 'Proprietorship', 'Md. Ripon Sheikh', NULL, 'J/2, Eastern Housing Main Road Pallabi, Mirpur Dhaka-1216', NULL, '01911917565', 'ripon.tajima@gmail.com', 'Male', 5000.00, 0.00, 4, 'Tajima', '71', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/SREspZmdllXREg4tYcbVJJwpCTzKFyJgQ4cUyQ8r.png', '[]', 'membership/photos/dsCTA8HWVszYzRSMfwFRHFabweYvx0ZqTVmMyZHG.png', 1, '2026-12-30 18:00:00', NULL, '2025-07-15 22:28:07', '2025-07-16 02:36:33', 1),
(265, 335, '2501011', 'A D Embroidery & Fashion', 'Proprietorship', 'Delowar Hossain', NULL, '712/14, Road-10, Baitul Aman Housing Adabor Dhaka-1207.', NULL, '01985241396', 'rejaulrp300@gmail.com', 'Male', 5000.00, 0.00, 4, 'Star Plus', '84', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01K0BN1P8MK613PXZ3SG66RBA3.jpg', '[]', 'membership/photos/01K0BN1P8N2S603RT8GJPT823E.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-15 22:45:23', '2025-07-17 07:37:11', 1),
(266, 336, '2501008', 'China King BD', 'Proprietorship', 'Ruhul Amin Mia', NULL, 'Dag-133, House-33, Road-1, Ranavola, Nishadnagar, Turag Dhaka-1230', NULL, '01712239625', 'sbrtrade2019@gmail.com', 'Male', 5000.00, 0.00, 3, 'China King BD', '70', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01K0BMYP8ARMZWYTAP3WX5937B.jpg', '[]', 'membership/photos/01K0BMYP8BTJFJH641N61YJTKG.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-15 22:50:47', '2025-07-17 07:35:32', 1),
(267, 337, '2501009', 'Unity Fashion', 'Proprietorship', 'Md. Abdur Rahim Bhyain', NULL, '448/B, Khilgaon, Taltola, Khilgoan, Dhaka-1219.', NULL, '01713370622', 'arahim21@gmail.com', 'Male', 5000.00, 0.00, 4, 'Jentel Cm & Sinsim', '60', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01K0BMTDB2MPTQPKG3CP7HGM0F.jpg', '[]', 'membership/photos/01K0BMTDB4MZV3C455HB7MSZEB.jpg', 1, '2026-12-30 18:00:00', 98, '2025-07-15 22:57:44', '2025-07-17 07:34:19', 1),
(268, 338, '2501003', 'Riad Computer Embroidery', 'Proprietorship', 'Md. Rezaul Karim', NULL, 'House: 535/C, Khilgaon, Dhaka-1219.', NULL, '01750180340', 'riadembroidery@gmail.com', 'Male', 5000.00, 0.00, 3, 'Jintel & Moonstar', '45', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01K0BMRJ27ANAEJVR6KMM14RJ2.jpg', '[]', 'membership/photos/01K0BMRJ28H52ZR064P3GZKQEE.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-15 23:54:48', '2025-07-17 07:32:11', 1),
(269, 339, '2501002', 'R Shah Sourcing', 'Proprietorship', 'S.M Refaeatul Islam', NULL, 'Plot : 712/22/A, Road-10, Adabor, Dhaka-1207', NULL, '01713045576', 'rshasorcing@yahoo.com', 'Male', 5000.00, 0.00, 4, 'Sapphire', '64', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01K0BMPRMH9636S1J40Z6MFHQY.jpg', '[]', 'membership/photos/01K0BMPRMKM9S21C14AZ0NDEMC.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-15 23:58:23', '2025-07-17 07:31:13', 1),
(270, 340, '2501004', 'Taihan Embroidery', 'Proprietorship', 'Ritu Akter', NULL, 'House-32,Dhour Main Road, Turag Dhaka-1230', NULL, '01968544878', 'rezasalimzzz1000@gmail.com', 'Male', 5000.00, 0.00, 2, 'China', '40', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01K0BMKQCKMP482TA56QG6MNRM.jpg', '[]', 'membership/photos/01K0BMKQCM1EJXMVN3FS8S399V.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-16 00:01:03', '2025-07-17 07:29:33', 1),
(271, 341, '2500999', 'Phi Tex BD', 'Proprietorship', 'Md. Monirul Islam', NULL, 'House: 22, Road: 05,Rajabari, Nishad Nagar, Turag, Dhaka-1230', NULL, '01771940119', 'iqra.phitexbd@gmail.com', 'Male', 5000.00, 0.00, 2, 'China', '40', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01K0BMHSAB45PKZXX53VSPNC9B.jpg', '[]', 'membership/photos/01K0BMHSADX9E4Q9RM0B77ZS5J.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-16 00:23:52', '2025-07-17 07:28:30', 1);
INSERT INTO `memberships` (`id`, `user_id`, `membership_id`, `company_name`, `company_type`, `director_name`, `nominated_director`, `address`, `telephone`, `phone`, `email`, `gender`, `membership_fee`, `due_amount`, `machine_count`, `brand`, `total_head`, `needle_colors`, `yearly_subscription`, `discount`, `advance_amount`, `receipt_no`, `payment_date`, `payment_year`, `sister_concerns`, `remarks`, `nomination_certificate`, `trade_license`, `factory_photos`, `director_photo`, `is_active`, `membership_expire_date`, `expense_id`, `created_at`, `updated_at`, `existing_member`) VALUES
(272, 342, '2501000', 'R N Fashion', 'Proprietorship', 'Md. Mazidul Islam', NULL, 'House: 16/2, Plot: 295, Ring Road, Holly Lane, Shaymoli Adabor, Dhaka-1207', NULL, '01723032708', 'r.nfashion52@gmail.com', 'Male', 5000.00, 0.00, 4, 'China', '100', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01K0BMFW624HJ40X6XR3Z57YJZ.jpg', '[]', 'membership/photos/01K0BMFW65HQ0ADWZV234T0GAZ.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-16 00:28:00', '2025-07-17 07:27:27', 1),
(273, 343, '2501001', 'Color Touch Boutiques', 'Proprietorship', 'Md. Ali Akbar', NULL, 'House: 1034/B, Road: 17/B, Baitul Aman Housngi Soceity Adabor Dhaka-1207', NULL, '01717178753', 'aliakber01717@gmail.com', 'Male', 5000.00, 0.00, 2, 'China', '37', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01K0BMDVAQ26WQRPFCY84SVDTT.jpg', '[]', 'membership/photos/01K0BMDVATYC7WXK5ZK0F1TP2S.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-16 00:31:52', '2025-07-17 07:26:21', 1),
(274, 344, '2500997', 'Azad Fashion', 'Proprietorship', 'Nazrul Islam', NULL, 'House: 23, Road: 06, North Adabor, Adabor, Dhaka-1207.', NULL, '01839336190', 'ni400624@gmail.com', 'Male', 5000.00, 0.00, 3, 'China', '60', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01K0BMBRGZ0GCHD5DFB2EYYX8J.jpg', '[]', 'membership/photos/01K0BMBRH0VVX6DT6DM5MVA17X.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-16 00:35:47', '2025-07-17 07:25:12', 1),
(275, 345, '2500996', 'Mukta Enterprise', 'Proprietorship', 'Md. Mazammel Hossain Monir', NULL, '73/24, Azgor Ali Lane Shahid Nagar Gandaria, Dhaka-1204.', NULL, '01912104015', 'almahfujtraders@gmail.com', 'Male', 5000.00, 0.00, 0, NULL, NULL, NULL, 5000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01K0BM9P0DZB8SDJVP67KQ5VMJ.jpg', '[]', 'membership/photos/01K0BM9P0ETQNZTPJA0872Z10W.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-16 00:41:43', '2025-07-17 07:24:04', 1),
(276, 346, '2500995', 'Nuha Trading', 'Proprietorship', 'Kazi Aminul Islam', NULL, 'House: 2/3, Chittaranjan Avenue Dhaka-1100', NULL, '01677555420', 'aminulepw@gmail.com', 'Male', 5000.00, 0.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/01K0BM7KE9VNJQDQZQFRE7FMPA.jpg', '[]', 'membership/photos/01K0BM7KECZEQ30ZGWN1KXFN02.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-16 00:45:44', '2025-07-17 07:22:56', 1),
(277, 347, '2500992', 'A.K.T. Stitch & Design', 'Proprietorship', 'Md. Khairul Islam', NULL, 'House: 5/1-H/2, Borabo Mohonpur Ring Road, Adabor Dhaka-1207', NULL, '01715364341', 'aktstitchanddesign@gmail.com', 'Male', 5000.00, 0.00, 4, 'Star Plus & TCL', '114', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BM5EEGKV6VRZSS46TRN7CM.jpg', '[]', 'membership/photos/01K0BM5EEH579CK38XXHGJTD1X.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-16 00:56:00', '2025-07-17 07:21:45', 1),
(278, 348, '2500991', 'JK Fashion', 'Proprietorship', 'Parvez Alam', NULL, 'House: 1020/7, Road: 17/A, Baitul Aman Housing Society Adabor Dhaka-1207.', NULL, '01789672147', 'mdsamirkhan2464@gmail.com', 'Male', 5000.00, 0.00, 3, 'Monn Star, TCL & Daymond', '127', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/nhD6ckPSX8vQhFFnAuLXbD4MfSZiru6UAfgCyxKz.jpg', '[]', 'membership/photos/KqTrFLj4eVWjd5PebuyIAouVtfKmYKjuJh4zJkWV.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-16 01:00:56', '2025-07-16 02:41:17', 0),
(279, 350, '2500989', 'R A Fashion', 'Proprietorship', 'Md. Abdur Rahim', NULL, 'House: 17, Road: 17/B, Baitul Aman Housing Dhaka-1207.', NULL, '01712014468', 'rafashion329@gmail.com', 'Male', 5000.00, 0.00, 4, 'Monn Star, STL & Daymond', '126', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/lNMtKUTJqDnTYIaVuQBY8QOZZKHAm5QguVIpJfSa.jpg', '[]', 'membership/photos/eb24GZaG15nIuhzaWtDTT6cRRN5jwX7jAY1Z3zmd.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-16 01:31:26', '2025-07-16 02:39:46', 0),
(280, 352, '2500988', 'Mim Embroidery', 'Proprietorship', 'Md. Abdur Rahman', NULL, 'Dag No: 643, Bamnartek, Nishadnagar, Turag Dhaka-1230.', NULL, '01914932926', 'abdurrohim32926@gmail.com', 'Male', 5000.00, 0.00, 4, 'Promax', '84', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/xtKXSfszlHCKTS9vBzxPA2MvElWsyC43MfvZBoXv.jpg', '[]', 'membership/photos/Paf6pdgx6CzYTrv4G0ieQgPIY9FlbqDMA6KH6sMN.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-16 02:53:09', '2025-07-16 07:09:40', 1),
(281, 353, '2500987', 'HD Fashion', 'Proprietorship', 'Md. Ebrahim Ahmed', NULL, 'House: 20/A, Road: 04, Monsurabad Housing Adabor, Dhaka-1207.', NULL, '01724262543', 'hdfashion288@gmail.com', 'Male', 5000.00, 0.00, 4, 'TCL & Autoking', '85', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/AIm9QaRYkfqtSZu68JaOQkAT4vja4Vmy9ZJPKBEK.jpg', '[]', 'membership/photos/0rjkOiLlfEZJCa8BEDfWFrvFBGhX913Hk1MkJSkD.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 03:00:34', '2025-07-16 07:09:02', 1),
(282, 354, '2500986', 'Excellent Embroidery', 'Proprietorship', 'Md. Magharul Islam', NULL, 'House: 363/B, Khilgaon, Taltola Market, Dhaka-1219.', NULL, '01914049842', 'jewel7644@gmail.com', 'Male', 5000.00, 0.00, 2, 'Seeing', '40', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/whVZ1wglsOCJhoGy6K1fqJ1mAO3F2XR3hdV3Yg32.jpg', '[]', 'membership/photos/NhkOkvhHXwIvbcMMlZtnYlaPGTkgfi1bfVBg0ZaN.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-16 03:12:45', '2025-07-16 07:06:55', 1),
(283, 355, '2500984', 'Shuha Machinery Accerssories.', 'Proprietorship', 'Sha Md. Shorab Hossain', NULL, 'Mollik Tower, 1st Floor, 3/3 Chittarnjan Avenue, Sadarghat, Dhaka-1100.', NULL, '01712125571', 'shorab_1980@yahoo.com', 'Male', 5000.00, 0.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0BKFTQYMYBYRZ7YBZX31GWS.jpg', '[]', 'membership/photos/01K0BKFTR0NMYA8JKYJ0KXVZKQ.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-16 03:23:33', '2025-07-17 07:09:57', 1),
(284, 356, '2400983', 'M.A Fashion Embroidery', 'Proprietorship', 'Md. Mohiuddin', NULL, 'Baipail, Bashundhara, Uttar Gazirchat, Ashulia Savar Dhaka-1341', NULL, '01795241642', 'fashion.mohin@gmail.com', 'Male', 5000.00, 0.00, 4, 'Tajima & Jhuki', '64', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/nvkluy9er6ImxsFqsXaRzxg4Ol3lOyLr7tgyllhQ.jpg', '[]', 'membership/photos/m1KE8BfypCAEz0QFxS1XVMrkO8lF4HsGG8Uaf4tx.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 03:31:24', '2025-07-16 07:07:40', 1),
(285, 357, '2400982', 'RNR Enterprise', 'Proprietorship', 'Hassan Mohammad Tarek', NULL, 'Plot-60, Sonargawon Janapath Road, Sector-09, Uttara Dhaka-1230.', NULL, '01844074989', 'qdcconcern@gmail.com', 'Male', 5000.00, 0.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/Zxbvpi93u2bGjrkBeUJBPYhxImh19BQmuPMvRVh8.jpg', '[]', 'membership/photos/O0KzwLSvX19G5W73PZdqrlbswtUcYGddqpinKGVC.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 03:42:02', '2025-07-16 07:05:46', 1),
(286, 358, '2400981', 'R-Tex International', 'Proprietorship', 'Md. Rasel Uddin Jhon', NULL, 'House-1035/1, Road-17/B Baitul Aman H/S Adabor, Dhaka-1230.', NULL, '01726391768', 'rtexinternational9@gmail.com', 'Male', 5000.00, 0.00, 0, NULL, NULL, NULL, 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/Ep9g4OHkmfwludNEwS8MIKhtM0XZ4QSnNgosJDGl.jpg', '[]', 'membership/photos/aKDnTFzwkxOeiP4gP5z5pPhhiZiYTs5ZHXgLrAGg.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 03:52:24', '2025-07-16 07:04:44', 1),
(287, 359, '2400980', 'M/S SH Emb', 'Proprietorship', 'Md. Mahadi Hassan', NULL, 'Shampur (Near Robi Tower) Hemayetpur, Saver, Dhaka-1340', NULL, '01624214896', 'ms.shemb@gmail.com', 'Male', 5000.00, 0.00, 7, 'TFI Portugal & Joki', '105', '06', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/8tVGmFqxhaFcAULe9Tb2RpNMfWTByzLZtQmmqDwJ.jpg', '[]', 'membership/photos/noDv5LG4StJ6tF8VjpgBzGnljIxOS5hWY5MRZeJS.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 03:56:01', '2025-07-16 07:03:21', 1),
(288, 360, '2400979', 'Nusaiba Embroidery', 'Proprietorship', 'Md. Parvez Sikder', NULL, 'Dag No-1636, Road-02, Bamnartek Kamarpara, Nishadnagar, Turag, Dhaka-1230.', NULL, '01911023054', 'nusaiba.emb@gmail.com', 'Male', 5000.00, 0.00, 8, 'Stl, Monstar & Tcl', '120', '06 & 09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/0ANBTfFrsajO83stOfGDIL71lllrcHZy9Fdo3IwO.jpg', '[]', 'membership/photos/o78dP6jYJayzJrEunLI1hw16Snrr77ga4FsRsEUo.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 04:00:55', '2025-07-16 07:01:13', 1),
(289, 361, '2400978', 'Hafsa International', 'Proprietorship', 'Md. Shofeul Alam', NULL, 'Kha-225, Flat-A/2, (3rd Floor) Merul Badda, Dhaka-1212', NULL, '01723274841', 'goldenbanglaagrocare@gmail.com', 'Male', 5000.00, 0.00, 0, NULL, NULL, NULL, 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/gqGpBSymiirZsEwER777yU7w0obGSC5E0AWWsimw.jpg', '[]', 'membership/photos/2Wd1Bkb4RGKCVjOePvoizAKnN82XKnvfPRVIEeuP.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 04:11:11', '2025-07-16 07:00:22', 1),
(290, 362, '2400977', 'NBM Embroidery', 'Proprietorship', 'Abdus Salam', NULL, 'Plot-76, Road-11, Block-D, Monsurabad Housing Soceity, Adabor, Dhaka-1207.', NULL, '01677575745', 'msnbmembroidery@gmail.com', 'Male', 5000.00, 0.00, 4, 'China', '80', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/KD3Vpl5BteXtAVSBxIKHTz1gsD0K0QwGsNQBlzoQ.jpg', '[]', 'membership/photos/kVAVaPnOc7PgBt5irYyduYmbj64vZlyfhf0q2CvO.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 04:15:15', '2025-07-16 06:58:47', 1),
(291, 363, '2400975', 'R.M Embroidery & Accessories', 'Proprietorship', 'Masud Alam Rana', NULL, 'Dag No: 3507-3509, House: 03, Road:03, Bamnarteck, Nishadnagar, Turag, Dhaka-1230', NULL, '01849737389', 'masudalnur@gmail.com', 'Male', 5000.00, 0.00, 4, 'China & Daimond', '76', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/IuJgOprzqqOZrSR7TrKhlXEymQhhks9JDwEIhOQX.jpg', '[]', 'membership/photos/yJlFk0lBjf3iMHsbdUwpyFaahxuTk0Zn7cyOgcrk.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 04:26:07', '2025-07-16 06:58:06', 1),
(292, 364, '2400973', 'Lax Brindabon', 'Proprietorship', 'Romit Kumar Roy', NULL, 'Kha-146/5, Jamtala, Tanpara, Khilkhet, Dhaka-1207.', NULL, '01886655322', 'laxworld2020@gmail.com', 'Male', 5000.00, 0.00, 9, 'BLL & China', '200', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/xSIXOhbBPdkOi6JLDD6hIQOxMGgPv0jkIMZbuUHc.jpg', '[]', 'membership/photos/r2yZD789bAMTwecNc2ejrbJlSJ4wRkvfTrwYMgch.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 04:33:56', '2025-07-16 06:56:25', 1),
(293, 365, '2400972', 'S.T Fashion House', 'Proprietorship', 'Md. Farid Sarker', NULL, 'House: 712/19/65-A, Road-10, Baitul Aman H/S, Adabor-1207.', NULL, '01780373619', 'stfashionhouse@gmail.com', 'Male', 5000.00, 0.00, 2, 'China.', '40', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/XxbJKIdPHvTdHVCJi2RMnVjUjQ0JuJGEZmhHiKMM.jpg', '[]', 'membership/photos/N30vEZgt8vf32ncxwxVTwfzDVY2EHvec9MzSqinA.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 04:44:01', '2025-07-16 06:55:24', 1),
(294, 366, '2400971', 'Moon Fabrics', 'Proprietorship', 'Md. Mohor Miah', NULL, 'Vill: Gokul Nagar, P.O: Narayangonj, Upazala: Raipura, Dist: Narshingdi', NULL, '1819342079', 'moonfabricsbd@gmail.com', 'Male', 5000.00, 0.00, 6, 'Shiflli', NULL, '6000', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/ipRzogpeRE1GNbzvOlKnr1voWPNvbzRdsmizbsj0.jpg', '[]', 'membership/photos/P14MOorl52mCOb2meJvXAX7wMdpe41xCG00pGkrG.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 04:51:36', '2025-07-16 06:54:45', 1),
(295, 367, '2400970', 'Runtex Fashion', 'Proprietorship', 'Anwar Hossain (Mohon)', NULL, '584, Flat-A/1, Road-03, Jalal Uddin Avenue Dakshin Khan Uttara Dhaka-1230.', NULL, '01735598907', 'info@runexpressbd.com', 'Male', 5000.00, 0.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/jrUlrMcBHwaS7G3FWs6785GcGw11DskyfUHGgwF6.jpg', '[]', 'membership/photos/9w5Cij4VQRWLD3ZrxR1XaN8RJcRCNepyBhCRSJ43.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 04:57:52', '2025-07-16 06:52:56', 1),
(296, 368, '2400965', 'Rong Tuli Fashon', 'Proprietorship', 'Md. Masud Rana', NULL, 'Hosue-712/22-B, Road-10, Baitul Aman Housing Society Adabor Dhaka-1207.', NULL, '01617638844', 'masuddesigncenter@gmail.com', 'Male', 5000.00, 0.00, 2, 'China', '32', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/UxQ2CPlGopiV6jq4jN6gkjQDgHkZuwtsXVHphjHe.jpg', '[]', 'membership/photos/SdMHEN82RroNjHuiBbpT9b3Vt8QYY5YvL9W2cyl3.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 05:10:37', '2025-07-16 06:52:08', 1),
(297, 369, '2400962', 'Ricoma Industries', 'Proprietorship', 'Md. Anwar Hossain', NULL, '448, Satarku Road, Uttar Badda, Dhaka-1212.', NULL, '01918444222', 'ricomabd@gmail.com', 'Male', 5000.00, 0.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 1, 'Monpura Group', NULL, NULL, 'membership/documents/SpUtfXTkepzUIjHlciAQDgKG34irssnyjlotALqy.jpg', '[]', 'membership/photos/A7xvXv6xjoaftTv8A9vX89AjzAXDWvIasVv9F4QZ.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 05:15:11', '2025-07-16 06:50:15', 1),
(298, 370, '2400963', 'A.S.B Fashion', 'Proprietorship', 'Md. Asadul Islam', NULL, '712/22-B, Road-10, Baitul Aman H/S Adabor, Dhaka-1207.', NULL, '01729796838', 'assarviccenter@gmail.com', 'Male', 5000.00, 0.00, 2, 'China', '32', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/ZCYWmvBZS3wNU2gbJULp9cUchQqHEmhJDZUHUpBZ.jpg', '[]', 'membership/photos/plXBYyQB8vWZtIHLKjRSAAbcG4k3c5aTgg3WBcQQ.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 05:21:14', '2025-07-16 06:49:30', 1),
(299, 371, '2400961', 'Embroidery Hub', 'Proprietorship', 'Md Anawarul Kabir', NULL, 'House # 72/73/74, Road # 16, Sunibir Housing Adabor  Dhaka-1207.', NULL, '01625446688', 'rasel.01625446688@gmail.com', 'Male', 5000.00, 0.00, 2, 'China', '40', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/zvCHY1dR9v486HnANist0EbNeUnWh7LJBuys4NNL.jpg', '[]', 'membership/photos/t7cSOocFU3Fnrq18WtBRwi0xyCioMUJPyLHIj5FJ.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 05:26:32', '2025-07-16 06:48:48', 0),
(300, 372, '2400960', 'A Plus Fashion', 'Proprietorship', 'Md. Ifte Khayer  Bhuiya', NULL, 'House # 240, Road # 17/B, Baitul Aman Housing Adabor Dhaka-1207.', NULL, '01636190075', 'firstqualityfashion@gmail.com', 'Male', 5000.00, 0.00, 2, 'TST', '40', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/9tPxGTc5J40T4T4DwULDJiAU02eYZOGtibmIE3v6.jpg', '[]', 'membership/photos/SqQ4grgxDgJclRnUybxf7TmSa3XOagsckSJsPysX.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 05:31:08', '2025-07-16 06:47:54', 1),
(301, 373, '2400959', 'J M S Design', 'Proprietorship', 'Mozammal Haqu', NULL, '39/11-C, Baishtaki, Mirpur-13, Dhaka-1216.', NULL, '01751676574', 'mozammelhaque3226@gmail.com', 'Male', 5000.00, 0.00, 2, 'China', '32', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/uiYnysLgl8YN8nOAAMuV4PPeLFqCsdzhOvuqewOp.jpg', '[]', 'membership/photos/dinT2VLSq8KEMCC7nj9XedURhCgDVtAYkJH5y1Hf.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 05:36:03', '2025-07-16 06:47:15', 1),
(302, 374, '2400954', 'O T O Fashion Design', 'Proprietorship', 'Md. Hasan', NULL, '39/12/H, Baishtaki, Mirpur-13, Dhaka-1216', NULL, '01872649090', 'otofashiondesign@gmail.com', 'Male', 5000.00, 0.00, 2, 'China', '32', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/Zd3QVpFcDEWv6w9hdxj1JPiLBLVFCQBg60wGsNrS.jpg', '[]', 'membership/photos/wYByhGEE1UcDM2n1werchQVPsLUBm3CKNMHaTEz8.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 05:40:43', '2025-07-16 06:46:38', 1),
(303, 375, '2400953', 'Natex Thread & Trims', 'Proprietorship', 'Nahidur Rahman Nabil', NULL, '70, Shing Bari, Boro Dewra, Tongi Gazipur', '2400953', '01677417710', 'nabil@natex-bd.com', 'Male', 5000.00, 2000.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/FjueHubnAyKxExWAp5kXmnrjMvfGmDvbWjYdndbA.jpg', '[]', 'membership/photos/ubXIMmjmEBAHOrexqUwDsuRsJJ8q58z2M2IE0i7H.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 05:56:06', '2025-07-16 06:45:56', 1),
(304, 376, '2400955', 'Apala Accessories & Embroidery', 'Proprietorship', 'Sayduzzaman', NULL, '585/1, Shewrapara, Mirpur,  Dhaka-1216', NULL, '01834879051', 'sayduzzamanrony09@gmail.com', 'Male', 5000.00, 0.00, 3, 'China', '48', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/H7mOKOBJLKt4qPuBxzlLUHN8Ivo2cZZvHvJsMTFV.jpg', '[]', 'membership/photos/ogqJ2FwbgdLqFDR4KaYhCnFLokvmVv70N1kcIy13.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 05:59:41', '2025-07-16 06:44:46', 1),
(305, 377, '2400952', 'Noha Fashion', 'Proprietorship', 'Md. Nazrul Islam', NULL, '726/48 , Road-10, Baitul Aman Housing Society Adabor, Dhaka-1207', NULL, '01911115911', 'nislam2085@gmail.com', 'Male', 5000.00, 0.00, 3, 'China', '47', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/qWnHkn5kU2VLhXQhXBXTWIgJVWkGOLr1L91cTPyx.jpg', '[]', 'membership/photos/tBxePZPKlBepsQsbJUYoEX2ujmVPrFPQj5mHUvHz.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 06:05:58', '2025-07-16 06:09:33', 1),
(306, 378, '2400951', 'N R N Embroidery', 'Proprietorship', 'Md. Abu Nosor (Sarker)', NULL, '726/40-1, Road-10, Baitul Aman Housing Society Adabor, Dhaka-1207.', NULL, '01631642945', 'nrnfashion2024@gmail.com', 'Male', 5000.00, 0.00, 2, 'China', '32', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/YIc2FSgelxEp5iaAl7F2jD1F7BABVsbhphXwh1ig.jpg', '[]', 'membership/photos/Phh64ew1hwqKnCD5CX2A1hx4qotrCKp9jh5tqQTK.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 06:12:11', '2025-07-16 06:44:04', 1),
(307, 379, '2501006', 'Ashura Impex', 'Proprietorship', 'Bellal Hossan Sumon', NULL, '300, Poschim Nayagoan, (2nd Road), Kamrangirchar, Dhaka-1211.', NULL, '01816942848', 'ashuraimpex@gmail.com', 'Male', 5000.00, 0.00, 3, 'China', '60', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/5Y5KbkzBbPRhtRoPSXQ22MfARTprUgmybMG2eD3I.jpg', '[]', 'membership/photos/9gAsbHrseIFbAIzWWGwT2AvK0fVnnXPVy1PDntka.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-16 06:39:00', '2025-07-16 06:43:22', 1),
(308, 380, '2501005', 'M/S. SKS Embroidery Mart', 'Proprietorship', 'Md. Khokon', NULL, 'Plot-42, Road-01, Rajabari, Nishadnagar, Turag, Dhaka-1230', NULL, '01314468484', 'khokonwooil@gmail.com', 'Male', 5000.00, 0.00, 4, 'Moonstar', '80', '9', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/Jox7nMw2HeTHOIwKmsH5u3pzRSprqFfDTshAy3rt.jpg', '[]', 'membership/photos/3elFT9KhoHt0Od89Qm1mLjlX3vrPux7mDe7lzcMn.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 06:48:40', '2025-07-16 06:51:27', 1),
(309, 381, '2400897', 'Mayer Doa Embroidery', 'Proprietorship', 'Md. Ruhul Amin', NULL, 'Behakoir, Po: Kachpur, P.S: Sonargaon, dist: Narayangonj. Office: Road-28/ka, Commercial Plot-06, Rupnagar, Mirpur, Dhaka-1216.', NULL, '01920705288', 'haziruhulamin1@gmail.com', 'Male', 5000.00, 0.00, 3, 'China', '60', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/0Dpw9KgJsdPIiHjFBlRaECnOt0cPBTlHXYXgdl6k.jpg', '[]', 'membership/photos/gft6DDfqYpvxbxnZzaXRJegz0uRJOnwXe7KJTb98.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-16 06:55:41', '2025-07-16 06:57:22', 1),
(311, 382, '2400949', 'J.R Fashion', 'Proprietorship', 'Md. Bachu Hossain Jibon', NULL, '712/22/9, Road-10, Baitul Aman Housing Society Adabor, Dhaka-1207', NULL, '01717558116', 'bacchum47@pribd.com', 'Male', 5000.00, 0.00, 2, 'China', '32', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/ZStvagiNEv456uFAMHAhTwpNCCcMAkjgxyOPIOui.jpg', '[]', 'membership/photos/9KDo4FvMDnHT3g2YBmglf7vHSz0t2ck5c7te6nBU.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 04:22:34', '2025-07-17 05:40:17', 1),
(312, 383, '2400948', 'Eva Fashion', 'Proprietorship', 'Md. Kabir Hossain', NULL, '726/48, Road-10, Baitul Aman Housing Society Adabor, Dhaka-1207.', NULL, '01688947191', 'mdkabirsordar28@gmail.com', 'Male', 5000.00, 0.00, 3, 'China', '48', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/9PZBSsER4vdqY7sG1O4K6G7Ud7LyoeqEW1No89Qk.jpg', '[]', 'membership/photos/UshEwHPEKhuQCENOLtZL9ELuKRw6QOV4Lut1iYNd.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 04:24:46', '2025-07-17 05:39:36', 1),
(313, 384, '2400947', 'Tuilip Fashion', 'Proprietorship', 'Safique Ullah', NULL, 'Ka-2, Khilkhet, Tanpara, Nikunja-2, Dhaka-1229.', NULL, '01720246773', 'safiqtito6324@gmail.com', 'Male', 5000.00, 0.00, 2, 'Monstar', '38', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/NdlDcbDGX8tXuwegU4sBajf1CqGfqTPM9soSuLps.jpg', '[]', 'membership/photos/HgjO598x6rgjEompVjNgO6aaKFsQUkXTYOuUIzzP.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 04:47:12', '2025-07-17 05:38:15', 1),
(314, 385, '2400946', 'Ismail Trading', 'Proprietorship', 'Md. Ismail', NULL, 'House: 1025/11, Road-17/A, Baitul Aman Housing Society Adabor, Dhaka-1207.', NULL, '01818586315', 'mdismailbd22@gmail.com', 'Male', 5000.00, 0.00, 2, 'China', '32', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/ENDOYYEHIw1bIGaFYgMw6qZTlAC7CLRWelWvzBD8.jpg', '[]', 'membership/photos/5yMdnDSJ2UzJlvmRH1lb3lK5fxQhLJ1jkoKmpmEZ.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 04:50:42', '2025-07-17 05:37:23', 1),
(315, 386, '2400945', 'Creative Fashion', 'Proprietorship', 'Md. Masbaul Haque Nahid', NULL, '5/1-M/2-A Barabo, Mohonpur, Adabor, Dhaka-1207.', NULL, '01628285511', 'nuhasfashion@gmail.com', 'Male', 5000.00, 0.00, 3, 'TCL & HTM', '71', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/26PiaC4zeYSNR6cqLgxObwCXYXYXEvsBB1XYghUS.jpg', '[]', 'membership/photos/gBh6sjknBUr13rrHrX3Sl8oonplhORiiHUxsngwJ.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 04:55:02', '2025-07-17 05:36:45', 1),
(316, 387, '2400941', 'Bismillah Stitch', 'Proprietorship', 'Md. Mashud Kausher', NULL, 'House: 726/54, Road-10, Baitul Aman  Housing, Society Adabor Dhaka-1207', NULL, '01644311390', 'hk.41.hossain@gmail.com', 'Male', 5000.00, 0.00, 4, 'Star Plus, HB, Autowin & Tazima cn', '67', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/F64Kg2QxFCKustu5tHCWDPdL8WUWoH3eEYfsPqEI.jpg', '[]', 'membership/photos/DslbfzZxBoZKUjYFsQPxmOKEBfPrXXLvhpgMOGqo.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 05:10:04', '2025-07-17 05:35:55', 1),
(317, 390, '2400937', 'Relation Fashion', 'Proprietorship', 'Md. Shamsul Alam', NULL, 'House: 726/40/1, Road-10, Baitul Aman Housing, Society Adabor Dhaka-1207.', NULL, '01716516504', 'ashrafulalamoshi@gmail.com', 'Male', 5000.00, 0.00, 4, 'MTI', '80', '04 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/6jHMStgJj9wiVrgImpjNxqxU2GR37CrmdIf6y233.jpg', '[]', 'membership/photos/LdjBvQ6pSK2cMtjNi19VJ5WEkrMpMhgMeVVBGNDR.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 05:43:11', '2025-07-17 07:04:01', 1),
(318, 391, '2400934', 'Update Fashion', 'Proprietorship', 'Md. Shohel Rana', NULL, 'House: 726/21/1, Road-10, Baitul Aman Housing, Adabor Dhaka-1207.', NULL, '01868793231', 'yousufab1993@gmail.com', 'Male', 5000.00, 0.00, 4, 'Toyota', '80', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/Hls7b5hi41lcg1aEwqDXPZqJOU3G1VP5jJeNe7B0.jpg', '[]', 'membership/photos/0n0kAEGJZ1Uezpge3ewb0bgGqlHN4BriAjAUEYir.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 05:48:02', '2025-07-17 07:02:32', 1),
(319, 392, '2400933', 'Jhuma Fashion', 'Proprietorship', 'Md. Ibrahim', NULL, 'House: 726/46-A, Road-10, Baitul Aman Housing, Adabor Dhaka-1207.', NULL, '01715780555', 'end307589@gmail.com', 'Male', 5000.00, 0.00, 3, 'China', '48', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/3RPVKUYUiUaiTKfrZdaD1IZP0wILeJjQCWZRerEm.jpg', '[]', 'membership/photos/GW1oFdv4RijfP5fA28m0yvviD3cujR4qyp0CVFGa.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 05:52:38', '2025-07-17 07:01:53', 0),
(320, 393, '2400932', 'Akota Fashion', 'Proprietorship', 'Md.Rafiqul Islam (Summon)', NULL, 'House: 712/22/A/1, Road-10, Baitul Aman Housing, Adabor Dhaka-1207.', NULL, '01816046042', 'sumonrofqul@gmail.com', 'Male', 5000.00, 0.00, 4, 'China', '48', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/DMiGppZcTy1RVvGjNr1dVUvgFGMbhxg0jhMw66Cv.jpg', '[]', 'membership/photos/ltpVGqkPMwbAJ581UDdSHB5G4Y3wMnIM2BPIvBua.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 05:56:39', '2025-07-17 07:01:18', 1),
(321, 394, '2400931', 'Rafat Embroidery', 'Proprietorship', 'Falen Al Mamun', NULL, 'House: 726/17, Road-10, Baitul Aman Housing, Adabor Dhaka-1207', NULL, '01731970309', 'falen7205@gmail.com', 'Male', 5000.00, 0.00, 3, 'China', '48', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/JMxa2WgB7UUynh4ggauMr9H7diNVU2uvwkvi9FSm.jpg', '[]', 'membership/photos/7NBEFrUw15athbijW08N1mBKXwNl2S87hJJKuw3b.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 06:02:46', '2025-07-17 07:00:40', 1),
(322, 395, '2400928', 'Al-Modina', 'Proprietorship', 'Belal Sarder', NULL, 'House: 726/20-C, Road-10, Baitul Aman Housing Society Adabor Dhaka-1207', NULL, '01608909933', 'belal4830@gmail.com', 'Male', 5000.00, 0.00, 1, 'Autowin', '15', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/wSUTteaLEczlMN9W3Emecnu7DdkOUm9NyambG69v.jpg', '[]', 'membership/photos/KDVAFMhSsFbwhMLdpbbqvTxGWms2lIdFYkL2djcF.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 06:11:23', '2025-07-17 06:59:58', 1),
(323, 396, '2400925', 'Fashion Dress', 'Proprietorship', 'Md. Anisur Rahman', NULL, 'House: 885, Road-13, Baitul Aman Housing Society Adabor Dhaka-1207.', NULL, '01918949075', 'mdanisur805@gmail.com', 'Male', 5000.00, 0.00, 1, 'Autowin', '15', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/s3F6ZzCYH8es7bLdnQ0pkeyS6NSZxsqyVwNtyzIS.jpg', '[]', 'membership/photos/hT9xB7LPQMfzwPsqk4dXXsInefNBh5hayG2kNFUg.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 06:14:50', '2025-07-17 06:59:17', 1),
(324, 397, '2400922', 'Anas Fashion', 'Proprietorship', 'Md. Shamsul Karim', NULL, 'House: 726/27, Road-10, Baitul Aman Housing Society Adabor Dhaka-1207.', NULL, '01611160505', 'shamsulkarim492@gmail.com', 'Male', 5000.00, 0.00, 2, 'China', '32', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/xMKpUctMrm12SzpzOcsptfUin8qSYxpSDrFfnH13.jpg', '[]', 'membership/photos/pxFMVdSbtQd9TNrBqw7R9f5JwF1XpdiRjySeAi4E.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 06:25:56', '2025-07-17 06:58:36', 1),
(325, 398, '2400924', 'A.R.A Fashion', 'Proprietorship', 'Md. Razzak Hossain', NULL, 'House: 93/20, Road-17, Comfort Housing Adabor Dhaka-1207.', NULL, '01777453802', 'mdrazzak01777453802@gmail.com', 'Male', 5000.00, 0.00, 2, 'MTI & TCL', '37', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/8HS3OcNW0DJoqkGo4rFp3NSPqxOxX5RZYFwq3dco.jpg', '[]', 'membership/photos/J2YauOqXZvAAWvACy3jN9mIpcFvW6TgCvNg54ZLa.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 06:29:45', '2025-07-17 06:56:39', 1),
(326, 399, '2400919', 'Tasnim Fashion', 'Proprietorship', 'Md. Idrish Mia', NULL, 'House: 726/56, Road-10, Baitul Aman Housing Adabor Dhaka-1207.', NULL, '01624950318', 'tasnimfashion2024@gmail.com', 'Male', 5000.00, 0.00, 3, 'China', '48', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/JllIMJQNN42Xh8DEwBeQoY3oQhPhvfXeZQdy1sF8.jpg', '[]', 'membership/photos/YtudShqXZ8MElou3pAISf05rphqe3BsfN02ipRIj.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 06:50:11', '2025-07-17 06:55:50', 1),
(327, 400, '2400914', 'Salman Fashion', 'Proprietorship', 'Md. Safiullah Sarker', NULL, 'House-726/50, Road-10, Baitul Aman Housing Society Adabor Dhaka-1207.', NULL, '01725072148', 'salmanfashion2024@gmail.com', 'Male', 5000.00, 0.00, 2, 'China', '32', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/eZSnoAJ4HRVxyIsPeVmRgbRA72tUL18q9s6viGtf.jpg', '[]', 'membership/photos/tRj5KAxzyROLC3aReNvSEyLoxaamNXACxb9xcHLw.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 06:56:46', '2025-07-17 07:05:23', 1),
(328, 401, '2400910', 'Setu Fashion', 'Proprietorship', 'Md. Rubel', NULL, 'House-1035/1, Road-17/B, Baitul Anam Housing, Adabor, Dhaka-1216', NULL, '01914457993', 'johirul7993@gmail.com', 'Male', 5000.00, 0.00, 3, 'Daimond & Tajima cn', '56', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/Fp4lONiVwgRsDGPbmSFDo338TSgfeW7KR8H50yvu.jpg', '[]', 'membership/photos/znJ6ryOryEEQ9cI9ggwafzTit3gTtIETjRr7j60s.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 07:00:39', '2025-07-17 07:04:40', 1),
(329, 402, '2400909', 'T.H Fashion', 'Proprietorship', 'Nazrul Islam', NULL, 'House:32/B-1/C, Road-13, Comfort Housing Society Adabor, Dhaka-1216', NULL, '01739739332', 'mn01739332@gmail.com', 'Male', 5000.00, 0.00, 4, 'China', '64', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/9oUuDaIDYQ09yOjw4fUh6Lx6kcFhJnH0E0D1UO39.jpg', '[]', 'membership/photos/MqBoJH9fTU4fI8yaVx4NNZ1tub9PePjM6X8ag1N9.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 07:04:33', '2025-07-17 07:06:03', 1),
(330, 403, '2400908', 'Alpana Fashion', 'Proprietorship', 'Md. Shohel Sorkar', NULL, '39/11/A, Baishtaki Mirpur-13, Dhaka-1216', NULL, '01712347326', 'shohelsorker018@gmail.com', 'Male', 5000.00, 0.00, 2, 'TCL', '40', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/rkLxRHixccegWo9fgQLR57ZcIGeuZoUwkkLEAGmt.jpg', '[]', 'membership/photos/DrH9zGCI7Ye9WQfHoGv8NQAg2rnxEj1tjypcbULm.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 07:10:39', '2025-07-17 08:48:55', 1),
(331, 404, '2400907', 'ABS Fashion', 'Proprietorship', 'Md. Abu Bakar Siddique', NULL, '51/4. West Baishtaki, Mirpur-13, Dhaka-1216', NULL, '01925984737', 'siddikw10@gmail.com', 'Male', 5000.00, 0.00, 4, 'Tajin & Gama', '75', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/O3MZj3BIK4ITaVeea9wNgfjUD2869el97Ke2OUc0.jpg', '[]', 'membership/photos/IhaVut6BCMkAMC03gpQqehzReEcwugEvlc6OMN0z.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 07:18:36', '2025-07-17 08:50:14', 1),
(332, 405, '2400906', 'A H R Fashion', 'Proprietorship', 'Md. Ekramul Hasan (Sumu)', NULL, '39/8/A-1, Hazi Ali Hossain Road, Baishtaki, Mirpur-13, Dhaka-1216', NULL, '01925307181', 'ahrembroidery@gmail.com', 'Male', 5000.00, 0.00, 4, 'Tajima & Selis', '70', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/tkxsOcIWVdju2kLMeUoZmQur8ars9AgVrzZMqen8.jpg', '[]', 'membership/photos/AcemVflk9LfOSUuyTx3UxYunBz1B98QbcfUlStfY.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 07:27:20', '2025-07-17 10:39:12', 1),
(333, 406, '2400905', 'Usha Fashion & Design', 'Proprietorship', 'Shahid Ullah Chowdhury(Reaz)', NULL, 'House:18, Road:04, Block:E, Bamnartek, Romjan Market, Turag Dhaka-1230.', NULL, '01715276094', 'ushafashonbd@gmail.com', 'Male', 5000.00, 0.00, 4, 'TCL & Daimond', '80', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/TX3jlpvKj0bVPgkGCANgAZJFnmJzHUoGxxdqugPb.jpg', '[]', 'membership/photos/nPT5VgG2ABu2o4QwV5Syj71PtcMuJxjPPxOByDCI.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 07:32:43', '2025-07-17 10:40:36', 1),
(334, 407, '2400904', 'Vision Embroidery Ltd.', 'Limited Company', 'A.K.M Hamid', NULL, 'B-49, Purbo Rajashon, Savar, Dhaka-1340.', NULL, '01711522436', 'samiron@vision-bd.com', 'Male', 10000.00, 0.00, 12, 'Tajima & Barudan', '96', '07 & 09', 20000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/hERRQQlD6aRW4jDi5V4R5JAg7ZzY1qncsQFsVF1o.jpg', '[]', 'membership/photos/M5WCJw5564UdsaKpnmOiOuFaNjmAr07v0WfzxMjx.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-17 07:41:33', '2025-07-17 10:42:37', 1),
(335, 408, '2400902', 'Shrabony Knitwear Ltd.', 'Limited Company', 'Md. Belayet Hossain  Ripon', NULL, 'Kathgora, Ashulia, Savar, Dhaka.', NULL, '01715555111', 'belayet@ponditgroup.com.bd', 'Male', 10000.00, 0.00, 13, 'Autoking', '220', '09', 10000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/JcavzpdGgwY3QeiRT8GLs1LbpVGpLgo2FBZ3cx44.jpg', '[]', 'membership/photos/PKNIkGIRcD79ZwJZ2W956LtdNj4R5KTnOYiT8jaf.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 07:46:08', '2025-07-17 10:43:33', 1),
(336, 409, '2400901', 'Overseas Embroidery', 'Proprietorship', 'Md. Shakil Ahmed', NULL, 'Holding No: 69/2, Ward No: 05. Purbo Bagbari, Kashimpur, Gazipur-1746', NULL, '01712197312', 'shakil@overseascollectionltd.com', 'Male', 5000.00, 0.00, 7, 'China & MWF', '105', '06 & 09', 5000.00, NULL, 5000.00, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/qRjIvpOXU7jD2vzsk6hGvnUooBCabEIEIaR6eLS3.jpg', '[]', 'membership/photos/rC5GhCzb0KajMp3BMkpqzxL0wmrAJ1W39rkI25Iv.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 07:50:38', '2025-07-17 10:44:58', 1),
(337, 410, '2400899', 'L.M Accessories & Embroidery', 'Proprietorship', 'Md. Mahabub Laskar', NULL, 'Plot-96, Kutub Uddin Road, Faidabad, Abdullapur, Uttara Dhaka-1230', NULL, '01611143178', 'lmaccessoresembroidery@gmail.com', 'Male', 5000.00, 0.00, 4, 'China', '70', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/PCPLcHhOLOTR5RtmpYauzQWXL451j188RdeGJ8hF.jpg', '[]', 'membership/photos/Dqdp2iPWDzLpsmHYm72qhM8jdQ8U78ISd1ouGKNt.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-17 10:18:03', '2025-07-17 10:39:56', 1),
(338, 418, '2400898', 'Madina Fashion', 'Proprietorship', 'Md. Jasim Uddin', NULL, '251/1, Modhumita Road, Arichpur tongi Gazipur.', NULL, '01710830905', 'madinamf18@gmail.com', 'Male', 5000.00, 0.00, 4, 'China', '96', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/es0IM9ak3XJR10QvYOEwqPjstIoSnwIlnkgAUpWM.jpg', '[]', 'membership/photos/PPrpGmnmgpXW0jlktHjnJio2S5O3G3DmetSwNpnJ.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 04:24:05', '2025-07-19 10:42:42', 1),
(339, 420, '2400896', 'Texstock Trading Inc', 'Proprietorship', 'Mohammad Omar Faruk', NULL, 'House: 107, Paper mill Road, Abdullapur Uttara Dhaka-1230', NULL, '01719356311', 'sales@texstock.net', 'Male', 5000.00, 0.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/U7FaC0DnxbxebkSIZY8X39SjiZOiKHQll2XK1hbR.jpg', '[]', 'membership/photos/yU4O70DQXZliQf4nfubfoVX04U30BtEpr0Pjr8Se.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 04:30:26', '2025-07-19 10:46:22', 1),
(340, 421, '2300895', 'Yu Lee Embroidery Ltd.', 'Limited Company', 'Yong Oh Yu', 'Lee sun Ha', 'Chitrashil. Kathaltala Bazar, Zirabo, Ashulia, Dhaka-1341', NULL, '01738131616', 'yuleeembo.bd@gmail.com', 'Male', 10000.00, 0.00, 33, 'Tajma', '919', '06 & 09', 20000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/USpDgacH1HuD8owZus8GO9cjEmINiTThIWmMbS7M.jpg', '[]', 'membership/photos/3x83JvFVCOMwZnXTlNdA7HK9rPSLJ0SvmZhCI8uB.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 04:39:41', '2025-07-19 10:47:41', 1),
(341, 422, '2300894', 'State Apparels Limited', 'Limited Company', 'Kamrul Akefin Shawon', 'A. Aymaan Lhmam Aziz, B. Arian Hossain Aziz C. Fahmida Urmee Shawon.', 'Vill: Hizalhati, Union: 08 No Atabaha, Post: Baroipara, Kaliakair, Gazipur Office: House: 19, Road: 6-A, Sector-12, Uttara, Dhaka-1230.', NULL, '01714272777', 'shawon@stateapparels.com', 'Male', 10000.00, 5000.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/41KLSyurd5DRooD8wk7dOswSHRY0amrgkNn8gxrn.jpg', '[]', 'membership/photos/QMwhRFMw5mLxu9bbs6iqUa8PfoAyJGVLpzFa6w4h.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 05:00:15', '2025-07-19 10:49:08', 1),
(342, 423, '2300893', 'Humaira Trading International', 'Proprietorship', 'Md. Juwel', NULL, '534, Atipara, Uttar khan Dhaka-1230', NULL, '01580354973', 'juwelrahman15@gmail.com', 'Male', 5000.00, 0.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/ZbsxOnBuaRNgKhYx69KeaeFf8EJkUrsmjsmhoxDR.jpg', '[]', 'membership/photos/9gcZJGGlSXbx6K6rkQ12UJp72oPTIRavQZhaFSGD.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 05:05:40', '2025-07-19 10:50:12', 1),
(343, 424, '2300891', 'AD-Din Exim', 'Proprietorship', 'Mrs Zakia Sultana', NULL, 'Village : Hijalbari, Post: Machar para, Woard : 07, Kotalipara, Gopalganj', NULL, '01730900789', 'addinexim@gmail.com', 'Female', 5000.00, 0.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/gHFya9xWqDerEDM7i4YwyhXvyOdJG8b56qiEqDEF.jpg', '[]', 'membership/photos/Fi3fJd34jGg0jAV8BLnnhjcRJicIMGUhmVG1dNGr.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 05:11:39', '2025-07-19 10:51:53', 1),
(344, 425, '2300890', 'RKR Trade International', 'Proprietorship', 'Md. Abdur Rahim Khan', NULL, '206/11, Rajabari Taltala Road, Turag, Dhaka-1230.', NULL, '01711232249', 'rkrtil@gmail.com', 'Male', 5000.00, 0.00, 3, 'BKC & Autowin', '45', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/uqvqdmN73oX5dcAlKGZzZYRT7AmPBeCeGVBlooXV.jpg', '[]', 'membership/photos/tZpV5BgQjgm0JxdMLM5JNruD6XhjaMtWI1eLb6R7.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 05:15:59', '2025-07-19 10:52:58', 1),
(345, 426, '2300888', 'Bhai Bhai Embroidery and Textile', 'Proprietorship', 'Md. Shahin Bhuiyan', NULL, 'Ragubdi, Dhuptara, Araihazar, Narayanganj, -1460', NULL, '01822255005', 'shahinbhuiyan464@gmail.com', 'Male', 5000.00, 2000.00, 4, 'China', '64', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/GONkw0fp32ExaYYA5WLuP4TiRkLtsnc2DpWg6Eph.jpg', '[]', 'membership/photos/e79lHS3147Pmix5fSqkAwCZC6DH2Qbo2tgaozwOM.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 05:28:15', '2025-07-19 10:54:19', 1),
(346, 427, '2300887', 'Design Mood Embroidery', 'Proprietorship', 'Anowar Hossen Dalim', NULL, 'House-11, Ward-54, Razabari Pukurpar, Kamarpara, Turag, Dhaka', NULL, '01755998868', 'designmood24@gmail.com', 'Male', 5000.00, 0.00, 3, 'Ralian, Orginal & Portugal', '45', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/7cH4HpFUAdkWx3pSTIt8f6d8Ze5gbyXAFqP8ZbjH.jpg', '[]', 'membership/photos/SCPpQwV0P4kebycfGg4KQcIE6pU8d1r9m280jK0t.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 05:35:51', '2025-07-19 10:55:17', 1),
(347, 428, '2300885', 'Two Star Embroidery', 'Proprietorship', 'Md. Tohedul Islam', NULL, 'Nayanichala, Taltala, Turag, Dhaka-1230', NULL, '01680001110', '2starembroidery@gmail.com', 'Male', 5000.00, 0.00, 4, 'Two Star & China', '80', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/CDILlm6AGBZZSXt3gOlbEL6BikqgROzNs3mOzKck.jpg', '[]', 'membership/photos/boWrRL2hJrfsJEiBYW0YvixD2UehpoEtECbWOv1B.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 05:48:12', '2025-07-19 10:56:05', 1),
(348, 429, '2300884', 'Chowdhury Trading Corporation', 'Proprietorship', 'Md. Khijir Chowdhury', NULL, 'Yearpur, Zirabo, Ashulia, Dhaka', NULL, '01912324010', 'chowdhurytrad.corp@gmail.com', 'Male', 5000.00, 2000.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/dTue5jtpxim9SdYRsRk3Kary9PqgyGtbGZuF44uf.jpg', '[]', 'membership/photos/tEExE46Lq5wZxZu24JUWxA1vhXDQ8oQ6YcDVIJzv.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 05:54:18', '2025-07-19 10:57:46', 1),
(349, 430, '2300892', 'M/S. Chowdhury Stitch & Design Wears', 'Proprietorship', 'Md. Khijir Chowdhury', NULL, 'Yearpur, Zirabo, Ashulia, Dhaka', NULL, '01912324010', 'pritomfashion@gmail.com', 'Male', 5000.00, 5000.00, 9, 'Autoking', '185', '06 & 09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/AG6LN0LCC6LCGLLrgkMdPcKwgstK6GVgiNOz9MiC.jpg', '[]', 'membership/photos/zmUEzmClzf8MisQhFdrGFL8d4BUsDKpEaAFaTivL.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 06:12:33', '2025-07-19 10:59:44', 1),
(350, 431, '2300883', 'Engineer Stitch', 'Proprietorship', 'Md. Abdur Rouf', NULL, 'House: 08, Road: 05, Block-A, Uttaran Housing, Dhour, Turag, Dhaka-1230.', NULL, '01932333736', 'engineerstitch@gmail.com', 'Male', 5000.00, 0.00, 6, 'China', '120', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/sxm004gNTS3wVkgR9yun6jwnCjpYZ3iTIBnzywb3.jpg', '[]', 'membership/photos/R6CqjlaN1gQTvWjKenWe2BFvWRHWZDDrgbf74xMs.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 07:20:42', '2025-07-19 11:01:27', 1),
(351, 432, '2300882', 'Rechoice Fashion', 'Proprietorship', 'Md. Zahedur Rahman', NULL, '1/A, Road-10, Monsurabad Housing Society Adabor Dhaka-1207', NULL, '01316508090', 'rechoicefashion@gmail.com', 'Male', 5000.00, 2000.00, 1, 'MTI', '32', '06', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/fnSSKElO4z53SZ6WKvtGYSqzywX9DQvhLnXs6kGc.jpg', '[]', 'membership/photos/Vx6R6JYWNbjQ3QnKt9PWTZunsbUgjQMalGtFsq80.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 07:37:30', '2025-07-19 11:02:30', 1),
(352, 433, '2300880', 'Zamzam Fashion', 'Proprietorship', 'Md. Raihan', NULL, 'House:03, Road: 10, Ibnesina Brothers Housing Adabor, Dhaka-1207', NULL, '01783748525', 'zamzamfashions2021@gmail.com', 'Male', 5000.00, 2000.00, 2, 'MTI', '64', '06', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/2MOM1PNxnvGdlZr7NDRLCaEUQcONgN6PMeqiK7uq.jpg', '[]', 'membership/photos/y9kbtaHcPkOMnkHhD2BJ405h74eQOJhOXxXGEPcy.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 07:46:51', '2025-07-19 11:03:29', 1),
(353, 434, '2300876', 'Your Choice Emboridery', 'Proprietorship', 'Md. Ripon', NULL, 'House:14/1, Road: 10, Ibnesina Housing Society Adabor, Dhaka-1207', NULL, '01677006397', 'yourchoose18@gmail.com', 'Male', 5000.00, 2000.00, 3, 'China', '47', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/siR3Gqj6GTaUHXKIGEgxX1qR9Mqe00F79gTsAnRp.jpg', '[]', 'membership/photos/4Q3B21hISFLFg2P4iL4rzCj0kITYxw1raxJZOaMO.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 09:25:25', '2025-07-19 11:04:31', 1),
(354, 435, '2300874', 'Mir Fashion', 'Proprietorship', 'Mir.Md. Hammadur Rahman', NULL, 'House:04, Road: 10, Ibnesina Housing Society Adabor, Dhaka-1207', NULL, '01714801662', 'hrshohag@yahoo.com', 'Male', 5000.00, 2000.00, 1, 'Tajima CN', '15', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/GgiL8e0PEmflinfzKbLACNx1KHvWcZ2FqMOzgirQ.jpg', '[]', 'membership/photos/9YITS52hpnBbE9sbRpKQg2UvV5eZtzwsM6igTDLM.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 09:38:27', '2025-07-19 11:05:31', 1),
(355, 436, '2300872', 'Mariya Fashion', 'Proprietorship', 'Mariya Fashion', NULL, 'House:02, Road: 10, Ibnesina Housing Society Adabor, Dhaka-1207', NULL, '01837000492', 'farhad.chowdhury1992@gmail.com', 'Male', 5000.00, 2000.00, 3, 'MTI & Autowin', '47', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/rA9ukftBXZICwVUKJClLpqAWwDk1PpP73gxlTG7m.jpg', '[]', 'membership/photos/p1B3I3ttIs2xckrvViPCqlafgu7r80ymKDmxWpq5.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 09:55:20', '2025-07-19 11:06:49', 1),
(356, 437, '2300869', 'Modina Fashion', 'Proprietorship', 'Md. Ilias Hossain', NULL, 'House:726/54, Road: 10, Baitul Aman H/S Adabor, Dhaka-1207', NULL, '01946200121', 'elyais011988@gmail.com', 'Male', 5000.00, 2000.00, 3, 'Autowin, Champion & Portugal', '50', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/haTEFNUx6DP5LDwFU0Oar4aoNL3ER5WGa1OojZQK.jpg', '[]', 'membership/photos/v8ThNUwWPE03gdtXHxzLK9in6kg06Q5wkKbilxuD.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 10:13:44', '2025-07-19 11:07:56', 1),
(357, 438, '2300868', 'Rafsan Jany Fashion', 'Proprietorship', 'Md. Imran Hossain', NULL, 'House:14/1, Road: 10, Ibnesina Housing Adabor, Dhaka-1207', NULL, '01716674813', 'rafsanfashionbd@gmail.com', 'Male', 5000.00, 2000.00, 3, 'Tajima Cn', '54', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/8QczlB2O0If9MDMGCa94IAYEtKKh5tNLoW8Nzvh5.jpg', '[]', 'membership/photos/q9SSCJ6w2kqr7xflMnkoxw3JkIHjaQ9tbgzCxs0P.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 10:21:33', '2025-07-19 11:08:52', 1),
(358, 439, '2300867', 'Raya Solution', 'Proprietorship', 'Mohammad Shamim Chowdhury', NULL, 'House:04, Road: 10, Ibnesina Housing Adabor, Dhaka-1207', NULL, '01678061102', 'raya.solution@gmail.com', 'Male', 5000.00, 0.00, 2, 'Tajima', '30', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/LSLIUuXJs3H7apHlnIw3PJj3pTwJqmtG4k1NJH9M.jpg', '[]', 'membership/photos/EYLmU6irccHMFz0TG8LPwmdtS5RFxMlaaeUXFfU3.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 10:32:03', '2025-07-19 11:09:55', 1),
(359, 440, '2300866', 'F R Enterprise', 'Proprietorship', 'Md. Enamul Kabir', NULL, 'Kha-99/1-G, Khilkhet East Nama para, Dhaka-1229', NULL, '01715700639', 'enamul_kabir02@yahoo.com', 'Male', 5000.00, 0.00, 0, NULL, NULL, NULL, 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/bdv5HrjHgLYUu4VrChlt78VOZ93DBf4jakoa9ewE.jpg', '[]', 'membership/photos/xWIf3V0bXfZaqtUXNFnCWU1espQ2n8DjCxWqlmht.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 10:38:34', '2025-07-19 11:11:15', 1),
(360, 441, '2300863', 'Molla Enterprise', 'Proprietorship', 'Md. Azaharul Islam', NULL, 'Vogra Matir Majsid, Attachad Bashon, Gazipur', NULL, '01978852210', 'mollaenterpriseaz@gmail.com', 'Male', 5000.00, 0.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/z6CdQsgQHlkg3LFQGQnLfWX5Nrgz2m5c7LX0ZI1I.jpg', '[]', 'membership/photos/xzZfFyhvO8SCJz1RWlIdMpqfqNjgppGftDyewRP0.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-19 11:19:22', '2025-07-20 06:37:24', 1),
(361, 442, '2300861', 'A S Stitch Embroidery', 'Proprietorship', 'Md. Alamgir Hossain', NULL, '333/6, Natunbagh, Taltola Khilgaon (Neer Loharget) Dhaka-1219', NULL, '01917073292', 'as.alamgir24@gmail.com', 'Male', 5000.00, 0.00, 3, 'China', '48', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/S5SdqiUzzYuKKD1FkteLLrtdMR1KLIHetcAwvXiT.jpg', '[]', 'membership/photos/GLSxPpipgJjI1e8Tag14ZmLixjUBQjZ0uoU7kk1Y.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-20 04:44:48', '2025-07-20 06:53:45', 1),
(362, 443, '2300860', 'Haque Embroidery', 'Proprietorship', 'Md. Enamul Haq', NULL, '1173-Moulovir Tek Balurmat, P.S: Rampura Dhaka-1209', NULL, '01822912143', 'hoque.embroidery@gmail.com', 'Male', 5000.00, 0.00, 2, 'SEAL', '30', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/lKJWqv1PJt3q9lbdWLeu4z3JcJEEgh2Gtr4Yf902.jpg', '[]', 'membership/photos/yeMSUHnHGf8PDFLZ7RgiHa4ZhBbLaXUMezlHrHK5.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-20 04:53:39', '2025-07-20 06:54:43', 1),
(363, 444, '2200859', 'Zarif Print & Embroidery', 'Proprietorship', 'Md. Reaz Uddin', NULL, 'House-26, Road-04, Block-B, Nayanagar, Nishatnagar, Turag,Dhaka', NULL, '01829140284', 'reazuddin136@gmail.com', 'Male', 5000.00, 0.00, 3, 'China MTI', '50', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/5CTz8BbLCaVZL55xh9Mo8alx2hsMdhXXCgIS5rCW.jpg', '[]', 'membership/photos/zScn9YsmIP6Pr549epXjie85Xwrd20tHZt4Qw22X.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-20 04:59:49', '2025-07-20 06:57:49', 1),
(364, 445, '2200858', 'Loyal International Enterprise', 'Proprietorship', 'Md. Shofikul Islam', NULL, '250/4/Ka/2/2, Meradia, Khilgaon, Dhaka-1219.', NULL, '01973552668', 's01973552668@gmail.com', 'Male', 5000.00, 0.00, 7, 'China', '120', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/HlRhdPPr4vR1tIIw7UwijYPEfQ8TXpOzNkHcxXHN.jpg', '[]', 'membership/photos/wRyTeARk2SfHPvUo4UOxHHknB32Kwe3CRA0w4aSs.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-20 05:07:04', '2025-07-20 07:05:43', 1);
INSERT INTO `memberships` (`id`, `user_id`, `membership_id`, `company_name`, `company_type`, `director_name`, `nominated_director`, `address`, `telephone`, `phone`, `email`, `gender`, `membership_fee`, `due_amount`, `machine_count`, `brand`, `total_head`, `needle_colors`, `yearly_subscription`, `discount`, `advance_amount`, `receipt_no`, `payment_date`, `payment_year`, `sister_concerns`, `remarks`, `nomination_certificate`, `trade_license`, `factory_photos`, `director_photo`, `is_active`, `membership_expire_date`, `expense_id`, `created_at`, `updated_at`, `existing_member`) VALUES
(365, 446, '2200857', 'Different Collection', 'Proprietorship', 'Muhammad Shariful Islam', NULL, 'House-70, Nayani chala, Dotala Masjid Road, Word-54, Nishatnagar,Turag,Dhaka', NULL, '01678088746', 'sharifdcemb@gmail.com', 'Male', 5000.00, 0.00, 3, 'Sistek & champion', '46', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/YE0P0XUmAie70kWamq2OWb3ogdKhcSA15bdHdZO3.jpg', '[]', 'membership/photos/c67eZ9doKVDTWYcRLFGxDGki2aoiXbqDe8yUhJdI.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-20 05:15:47', '2025-07-20 07:06:25', 1),
(366, 447, '2200855', 'Handmade Terry & Embroidey House', 'Proprietorship', 'Lameya Akter', NULL, '78/4/I, Uttor Jatrabari, Dhaka-1204.', NULL, '01983376083', 'mohammadshakil456123@gmail.com', 'Female', 5000.00, 4000.00, 2, 'China', '30', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/VMvBCr3yX0pNItSZQQlCbSYV9EltTSlURLq60b7j.jpg', '[]', 'membership/photos/imtkCObwjt4DjBwpA7qTLeO2Djjeh0dmC1eBv24Q.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-20 05:35:05', '2025-07-20 07:07:18', 1),
(367, 448, '2200856', 'M/S Jenuine Fashion', 'Proprietorship', 'Alamgir Hossain', NULL, 'Plot-37, Road-03, Block-B, Uttaran Housing, Dhour, Turag, Dhaka-1230.', NULL, '01612525807', 'najfashion1@gmail.com', 'Male', 5000.00, 0.00, 8, 'Juki, Seeing, & Tajima cn', '131', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/01K0KABQ8XMZ1G42TVR96DCHS5.jpg', '[]', 'membership/photos/r4ykQirrdYcvNYuupDFE26BHPAKlt7LHxCFf7RH1.jpg', 1, '2025-12-30 18:00:00', 99, '2025-07-20 05:55:31', '2025-07-21 11:51:20', 1),
(368, 449, '2200851', 'R.S Fashion', 'Proprietorship', 'Md. Abu Zubair Shimul', NULL, 'Plot-11, Road-01, Section-07, Mirpur, Dhaka-1216.', NULL, '01674918149', 'shimul007zubair@gmail.com', 'Male', 5000.00, 4000.00, 2, 'Chuangpa', '30', '06', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/crttbR0MB0Jw9TTAhKDNcOFqXqRzgzHAZIZTAeSA.jpg', '[]', 'membership/photos/6XkT7p9jm9KPI5ub0fdjAKFFUVDub4FbI92nQNzv.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-20 06:16:10', '2025-07-20 07:08:25', 1),
(369, 450, '2300854', 'New Star Fashion', 'Proprietorship', 'Md. Mostafa Kamal', NULL, 'Plot-68, Block-B, Road-16, Sunibir Housing Adabor Dhaka-1207.', NULL, '01731389528', 'starfashionbd6@gmail.com', 'Male', 5000.00, 0.00, 3, 'China', '60', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/TAY6qzh4u3eEjGOPz2o3gdatXhT9oIQ19BS9ZhM3.jpg', '[]', 'membership/photos/l2i475kcxMmJ6OxytVsR9XG91jvY8ueQnFroIYrr.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-20 06:26:57', '2025-07-20 07:09:25', 1),
(371, 451, '2300862', 'Minha Enterprise', 'Proprietorship', 'Md. Mohsin', NULL, '448/3, Khilgaon, Taltola Dhaka-1219', NULL, '01844266226', 'goldstar336699@gmail.com', 'Male', 5000.00, 0.00, 2, 'Gold Star', '40', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/okuNt0WjU4GVS7i74VcMqZPmRy5NCJ8LtMuMjLA1.jpg', '[]', 'membership/photos/FzJpG3dKtx4k6CgWF80g0oyqwUGNoaAeW7nKg3m0.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-20 07:59:15', '2025-07-21 08:54:08', 1),
(372, 452, '2300870', 'Zarif Trade International', 'Proprietorship', 'Abul Kalam Azad', NULL, '4/1, Road: 10, Ibnesina Housing Society Adabor, Dhaka-1207', NULL, '01617081547', 'akazad021985@gmail.com', 'Male', 5000.00, 0.00, 2, 'Autowin', '30', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/nAkckZddzduZjG1Mg7FRviJ0gAhq5WV6PKjlBqtW.jpg', '[]', 'membership/photos/FeS3eXtL3QPiSCr7lH8TbECCjKretbzQNBtuX9Nz.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-20 08:45:35', '2025-07-21 08:55:00', 1),
(373, 453, '2000807', 'ANR Fashion Embroidery', 'Proprietorship', 'Md. Ahsan Habib Pranto', NULL, '177, Abdullahpur, Sector-08, Uttara, Dhaka-1230.', NULL, '01625872606', 'anrembroideryltd@gmail.com', 'Male', 5000.00, 0.00, 4, 'China', '60', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/Nvum77z2a0Qk0B5728McQJ2OBnixH0vlMjdBl9p4.jpg', '[]', 'membership/photos/1qLGrl7gwmyR6XGnk5vR22bMivWUCMKwArgz2ENf.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-20 09:26:12', '2025-07-21 08:55:53', 1),
(374, 454, '2000808', 'AR International', 'Proprietorship', 'Md. Ahtasur Rahman Shanto', NULL, '177, Abdullahpur, Sector-08, Uttara, Dhaka-1230.', NULL, '01916858825', 'feathertexprint@gmail.com', 'Male', 5000.00, 0.00, 4, 'China', NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-10-31', 1, NULL, NULL, NULL, 'membership/documents/V4MXTwLMFThSRVtaF9freUiUWSCNzMZz7cTefUJ3.jpg', '[]', 'membership/photos/ojxJXN3BVGm7aNZ0MU1f74ik4hMGTkE7z1GJydSP.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-20 09:48:08', '2025-07-21 08:56:41', 1),
(375, 455, '2000809', 'Icon Fashion and Embroidery', 'Proprietorship', 'Md. Ibrahim', NULL, 'Block-C, Holding-831, Worad-17, Bonorupa Road, Chandana Chowrasata, Joydebpur, Gazipur.', NULL, '01920104607', 'iconfashion1971@gmail.com', 'Male', 5000.00, 10000.00, 3, 'Seeing, Zhanyi & Z.d', '50', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/ncWrGnx2x1anbgUFYAkrMNJ6n1NM99yFvcpJwj77.jpg', '[]', 'membership/photos/2IOhpEIwyGjAcpdOXmRW98lxiCVWbGmofE4Tt811.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-20 10:07:51', '2025-07-21 09:00:38', 1),
(376, 456, '2000810', 'S.S Fashion Wear', 'Proprietorship', 'Md. Mostafizur Rahman', NULL, 'Ashulia, Zirabo, Savar, Dhaka.', NULL, '01678115245', 'mostaiz.759@gmail.com', 'Male', 5000.00, 25000.00, 8, 'Tajima & Autoking', '160', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/1zIn2iq62ILHR8thJ0j9JsE3dzfVjn33k95ZXssV.jpg', '[]', 'membership/photos/FZ2AM5XbAluetNLJ9SGFzKD6tMr8GRXjcoOabNbG.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-20 10:14:15', '2025-07-21 09:02:14', 1),
(377, 457, '2000811', 'EN Embroidery', 'Proprietorship', 'Md. jamilur Rahman', 'Fahmida Akhter', 'House-03, Ashulia Road, Block-D, Vatulia Nishadnagar, Turag, Dhaka-1230.', NULL, '01755731063', 'frshikha@yahoo.com', 'Male', 5000.00, 20000.00, 8, 'Barudan', '160', '06 & 09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/i1QAmTzCJ7bMlzN4C8TvsEUa8S7Qsdp0UX6vgCWx.jpg', '[]', 'membership/photos/9w5ys5iKeJphVYIU1nWJ4y2WcAHoxJfG4OJHzjoU.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-20 10:24:24', '2025-07-21 09:03:26', 1),
(378, 458, '2000812', 'Royal Embroidery', 'Proprietorship', 'Abu Taher Sumon', NULL, '39/7/C, Baistaki, Haji Ali Hossain Road, Mirpur, Section-13, Dhaka-1216.', NULL, '01718328309', 'asmaaakteraka@gmail.com', 'Male', 5000.00, 3000.00, 4, 'Jintel, RNP & Tajima', '70', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/eeEi23fVc004SzzukWuRP4TFXFcfEmVuudzntbgI.jpg', '[]', 'membership/photos/L4TdVRxdmVgR7ZRxTAVYEkXxz7WIaxf0TbDiGt55.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-20 10:33:49', '2025-07-21 09:04:30', 1),
(379, 459, '2000813', 'Janani Sequins Embroidery', 'Proprietorship', 'D M Liton', NULL, 'House-13 Baistaki, Haji Ali Hossain Road, Mirpur, Section-13, Dhaka-1216.', NULL, '01869804869', 'litondaly@gmail.com', 'Male', 5000.00, 25000.00, 5, 'Portugal & Topper', '76', '06 & 09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/MdjP5uywdIyp0psO9V9nTtEO07GkO2JfRWQq8FgN.jpg', '[]', 'membership/photos/YsO73GizFG04VP3Vunsl3ZqGZjOjP586D8Aa9QO8.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-20 10:57:45', '2025-07-21 09:07:19', 1),
(380, 460, '2000814', 'Fair Tex', 'Proprietorship', 'Most. Monjuara Khatun', NULL, '882, Bimalia, Baliarpur, Hemayetpur, Savar, Dhaka.', NULL, '01750613597', 'fairtexemb@gmail.com', 'Female', 5000.00, 20000.00, 8, 'Portugal & RNP', '120', '06 & 09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/rpVSxV7yEC2WLdxN2yMBqlVDWvf4il7R3osIhk5C.jpg', '[]', 'membership/photos/Xjxo17VuswJUPen1bWaA2wc8yrpcNnSVRbSTO7Jb.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-20 11:03:26', '2025-07-21 09:08:28', 0),
(381, 461, '2000815', 'Raj Fashion Touch', 'Proprietorship', 'Md. Aminul Islam', NULL, 'Plot-19/5, Suriarango Road, South Auch Para, Tongi, Gazipur.', NULL, '01913396080', 'rajfashiontouch2012@gmail.com', 'Male', 5000.00, 20000.00, 5, 'RNP', '75', '06 & 09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/4HL6pnDAmxdQgS27fKWDq1JFwDUKe9ncQHqfEpgR.jpg', '[]', 'membership/photos/qDKF3nNseiTBvLo5y3fopXF6nRBAO2C5rznSlb8k.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-20 11:11:59', '2025-07-21 09:09:46', 1),
(382, 462, '2000817', 'Haque Embroidery & Print', 'Proprietorship', 'Jamal Uddin Rana', 'Anika Tasnim', 'Baroipara Stand, Baroipara, Ashulia, Savar-1349.', NULL, '01755557133', 'jamal@haquetextile.com', 'Male', 5000.00, 2000.00, 5, 'Tajima', '100', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/Sp4O99LubcdRkpBpA0xhke5qDez9nl1H6rSsi0G7.jpg', '[]', 'membership/photos/7E1M71nYaU5YP9wjQ9RgQG353RKkFGmJg7gWCrbB.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-20 11:19:34', '2025-07-21 09:13:39', 1),
(383, 464, '2000819', 'Globus Embroidery', 'Proprietorship', 'M. Shahid Hossain', NULL, 'Plot-7,9,10 &14, Road-14, B-M, Eastern Housing, Mirpur, Dhaka.', NULL, '01731661374', 'chairman@dekkoisho.com', 'Male', 5000.00, 0.00, 12, 'Barudan', '220', '09', 10000.00, NULL, 10000.00, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/76vd66E5qFwKg99aZnaev0HH58Vx6dxRnxejw6Vk.jpg', '[]', 'membership/photos/FbBrDKDVQYpZgjX8ei5OqhJBCKYgeqkYR7HDkzrX.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-21 04:37:53', '2025-07-21 09:15:13', 1),
(384, 465, '2000818', 'Vision and Vision Industries Ltd.', 'Limited Company', 'Tanvir Ahammed', NULL, 'A/25, Jalkury, shiddirgonj, Narayangonj.', NULL, '01924306035', 'visionandvisionindustiresltd@gmail.com', 'Male', 10000.00, 8000.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/VUvo5BWJXyuut3kE9fy5Kf9PGNTIfgYau8vhZYKc.jpg', '[]', 'membership/photos/EANtRKeZbtn5U42bHlEO7whBpLlKwM8Jwfa7Csv3.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-21 04:57:38', '2025-07-21 09:16:17', 1),
(385, 466, '2000820', 'Friends Embroidery and Fashion', 'Proprietorship', 'Anowar Hossain', NULL, '726/21/1, Road-10, Baitul Aman H/S, Adabor, Dhaka-1207.', NULL, '01613745757', 'starthread.bd.adabor@gmail.com', 'Male', 5000.00, 0.00, 4, 'RAM', '46', '06', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/0bLaijTcjFdh3IWpqRNjcgB4yJKJMUsBu5Fmvw2L.jpg', '[]', 'membership/photos/3goe60srMdv3PSWfAwrC44kmPIfsNkGxKhExjHph.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-21 05:46:41', '2025-07-21 09:17:22', 1),
(386, 467, '2100821', 'AST Knitwear Limited', 'Limited Company', 'Mohammad Zahidur Rahman', 'A. Md. Golam Sarower B. Bozlur Rahman Bhuiya C. Abu Sayed Masum Haider', 'Plot-3/1, East Chandana, Joydebpur Road, Gazipur.', NULL, '01713236100', 'zahid@nhk-ast.com', 'Male', 10000.00, 0.00, 10, 'Tajima & China', '164', '06 & 09', 10000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/6c2CfJAiIvEU4cNKfOaKZ5ekcLTDCtSoqVoLfiZ2.jpg', '[]', 'membership/photos/t7We05pidjWTjojMlbQ09VwFaMO4V13R5xqE1Hu5.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-21 06:34:10', '2025-07-21 09:18:26', 1),
(387, 468, '2501014', 'B D Tex', 'Proprietorship', 'Mohammed Abu Sayed', NULL, '6 No Sayed Awlad Hossain Lane, Islampur Under Ground Shop No:A-02, Dhaka.', NULL, '01926001940', 'sayeed_1600@yahoo.com', 'Male', 5000.00, 0.00, 2, 'China', NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/eTO23VPhKvoXXAklWEjhoE0j5B1D4hs7RvnTfVds.jpg', '[]', 'membership/photos/WXIIV4J7o3LQAgNEhlmHn3H4Y0yoALgeBBs9qFGz.jpg', 1, '2026-12-30 18:00:00', NULL, '2025-07-21 07:00:18', '2025-07-21 07:37:04', 0),
(388, 469, '2100822', 'RMB Design & Accessories', 'Proprietorship', 'Md. Rafiqul Islam', 'A. Md. Nahid Hasan Chowdhury B. Md. Moznu Rahman', 'Plot-1/41, Road-20/1, Block-D, Mirpur-12, Dhaka-1216.', NULL, '01911240963', 'bodyrafik@gmail.com', 'Male', 5000.00, 6000.00, 3, 'China', '45', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/gD0wGUN1mSqvgiyLetIQ6hqGqtrbFnqAAfgFQFIp.jpg', '[]', 'membership/photos/gXZA4CIzRxg2AgwicTLCbAtNLJvPhRQx6Z7Gh1kG.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-21 07:10:38', '2025-07-21 08:53:05', 1),
(389, 470, '2100823', 'Mahadi Trading Corporation', 'Proprietorship', 'Md. Ali Azgar Khan', NULL, 'Polwel Carnation Centre, Plot-09, Level-04, Shop-36, Sector-08, Uttara, Dhaka-1230.', NULL, '01911703696', 'mahaditrading05@gmail.com', 'Male', 5000.00, 6000.00, 4, 'China', '60', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/OhQ3CPn4xh3cA3wAFeFd8HmpQOkjCy7LU6Rx2QbC.jpg', '[]', 'membership/photos/qc2ukdyaQAOt92YdiKgrKDobNplQwc1S63bXG7Nj.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-21 07:20:18', '2025-07-21 07:38:58', 1),
(390, 471, '2100824', 'Manik Kerchopi', 'Proprietorship', 'Md. Manik Hossain', NULL, '90/4/D, Palash Nagar, Section-11, Mirpur,Dhaka-1216', NULL, '01716922269', 'manikhossain2733@gmail.com', 'Male', 5000.00, 15000.00, 7, 'Autowin & MK', '135', '06 & 09', 5000.00, NULL, NULL, NULL, '2025-12-31', 1, NULL, NULL, NULL, 'membership/documents/OGZYPZbn0td3FFVfBqcJ5IZjLibfb8G1jIB5AIoD.jpg', '[]', 'membership/photos/ldsyvGjTdm3X987qNi7oS3T0m1jnpO5mI0CCu3HP.jpg', 1, '2025-12-30 18:00:00', NULL, '2025-07-21 08:35:21', '2025-07-21 09:47:45', 1),
(391, 472, '0391', 'Abida Enterprise', 'Proprietorship', 'Abdul Kader', NULL, '197, kamrangirchar, Munshihati, Woard-55, Dhaka-1211.', '2100825', '01870238389', 'a.k.mohon969@gmail.com', 'Male', 5000.00, 0.00, 3, 'China', '45', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/9iecN6yaOGjCA41phrpOApnAOplSYNwqR1LrTL0T.jpg', NULL, 'membership/photos/dLhLdvYRtYlhzrcsP0uKbYgCoaq5BT26ctpZCULs.jpg', 0, NULL, NULL, '2025-07-21 08:41:32', '2025-07-21 08:41:32', 0),
(392, 473, '0392', 'Zubair Industries Limited', 'Limited Company', 'Md. Ariful Haque Awal', 'A. Aeisha Akter B. Yasin Arafat', 'Dag No-963, Mouza-Behakair, P.S-Sonargaon, P.O-Kachpur Bazar, Dist-Narayanganj', '2100826', '01957772945', 'arif.awal@gmail.com', 'Male', 10000.00, 0.00, 3, 'China', '45', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/h1dy0xU2EcNgV5FHqf8L3SUqeU7HD929Eg6Ghj4n.jpg', NULL, 'membership/photos/uC9XwXTG8JCCW2YrIux6yKIOJlNRi3bV6eBPKM4J.jpg', 0, NULL, NULL, '2025-07-21 08:50:28', '2025-07-21 08:50:28', 0),
(393, 474, '0393', 'Design Fashion Work', 'Proprietorship', 'Yeasin Al-Kabir', NULL, 'House-26, Road-03, Block-A, Word-8, Majukhan, Harbaid, Gazipur.', '2200831', '01919595222', 'designfashionwork@gmail.com', 'Male', 5000.00, 0.00, 4, 'China', '60', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/d5nA22oUGXsgYrgna3NBHPsO85Aoo98FEqbbFMr1.jpg', NULL, 'membership/photos/V5tveNkZBYSPA3s9cKEVtv65WmuhasaeJrkYEKrd.jpg', 0, NULL, NULL, '2025-07-21 09:09:01', '2025-07-21 09:09:01', 0),
(394, 475, '0394', 'BD Synthetic Down Ltd.', 'Limited Company', 'A.K.M Shoaib', 'A. Md. sharif Hossain Khan B. shaheb Jada Yeakub  C. Md. Rafiqul Alam', 'Plot-390-392, Block-B, Basundhara Project, Gazirchat, Ashulia, Savar, Dhaka.', '2200834', '01711541566', 'shoaib.dmo@gmail.com', 'Male', 10000.00, 0.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 2, 'Ultra Embroidery Ltd.', NULL, NULL, 'membership/documents/oSkT3fRva95qVoKFoEgAohjB54UAx53CwBky4afJ.jpg', NULL, 'membership/photos/onh8SESU9idglMHG0ijnXAwCDWpB0vihUYQUshVa.jpg', 0, NULL, NULL, '2025-07-21 09:21:41', '2025-07-21 09:21:41', 0),
(395, 476, '0395', 'Boisakhi Traders', 'Proprietorship', 'Md. Billal Hossain', NULL, 'House-15, Abdullahpur, North-West, Uttara, Dhaka-1230.', '2200833', '01716733728', 'msboisakhitraders1@gmail.com', 'Male', 5000.00, 0.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/mpq3egNaeZdy0a4rEVbG235CsbbOyq6KWK7rPhcJ.jpg', NULL, 'membership/photos/jWXuTFIoLt2oU6S9w2cYf8pyGkE8NkIdFHept0Iw.jpg', 0, NULL, NULL, '2025-07-21 09:31:26', '2025-07-21 09:31:26', 0),
(396, 477, '0396', 'Royal Embroidery', 'Proprietorship', 'Md. Shamim-Al-Mamoun', NULL, 'Holding -133, Vatulia, Nishat Nagar, Turag, Kamarpara, Dhaka-1230.', '2200837', '01716206648', 'royalembroidery524@gmail.com', 'Male', 5000.00, 0.00, 4, 'Royal Portugal', '80', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/rl81U2pwzwunDtADXAr7awtbFMJKu6sue4Dugy2C.jpg', NULL, 'membership/photos/xVt1VAPatTiyA8n3VWGQXHEi9q3TpVWOpk9KPGFS.jpg', 0, NULL, NULL, '2025-07-21 10:06:40', '2025-07-21 10:06:40', 0),
(397, 478, '0397', 'Allahar Dan Embroidery', 'Proprietorship', 'Md. Nur Alam', NULL, 'RS-643, Ramjan Market, Bamnartek, Main Road, Turag, Kamarpara, Dhaka-1230.', '2200838', '01765018767', 'allahardanemb@gmail.com', 'Male', 5000.00, 0.00, 4, 'Dimond & China', '64', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/axWtnFJGkRYgPhuBX6tBy9vRZK4DeEJ3FzYeSuoR.jpg', NULL, 'membership/photos/V060yA1L6OYbhHBpfEuucrRWiGfDDr88B1hMM8A0.jpg', 0, NULL, NULL, '2025-07-21 10:45:57', '2025-07-21 10:45:57', 0),
(398, 484, '0398', 'Tapestry Fashion', 'Proprietorship', 'Narayan Chandra Das', NULL, '192, Ashkona, Dakshin Khan, Uttara, Dhaka-1230.', '2200841', '01819615079', 'tapestryfashion@gmail.com', 'Male', 5000.00, 0.00, 4, 'Tajima, HTM & Janzu', '65', '06 & 09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/CDTtRYCy9QdY9YcTSAXHIqtuPUrNdma3b6Fi7XuB.jpg', NULL, 'membership/photos/L6fRIxM4EvAXKdhklA7x2uduSMVWOzpj8xWwtDYy.jpg', 0, NULL, NULL, '2025-07-22 07:31:34', '2025-07-22 07:31:34', 0),
(399, 485, '0399', 'ABC International', 'Proprietorship', 'Md. Ahidur Rahman', NULL, 'Plot-134, Word-54, Block-D, Dotala Masjid Road, Vatulia, Nishatnagar, Dhaka-1230.', '2200842', '01675009739', 'abcinternational2013@gmail.com', 'Male', 5000.00, 0.00, 13, 'Barudan Tajima & SWF', '245', '09', 10000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/E26QOn9D0TGfjeXB9cXGdWnmEDmmPZEpCyLPJU96.jpg', NULL, 'membership/photos/0rMTCh4wtEEEkYsh2G8bGgaFeUBD4ZMlpLqDCfVX.jpg', 0, NULL, NULL, '2025-07-22 07:38:15', '2025-07-22 07:38:15', 0),
(400, 486, '0400', 'Rong Mela Fashion House', 'Proprietorship', 'Md. Mosharraf Hossain', NULL, 'Plot-103/1, Road-17/C, Comfort Housing, Adabor, Dhaka-1207.', '2200843', '01917169413', 'rongmelafashion94@gmail.com', 'Male', 5000.00, 0.00, 3, 'Autoking & Autowin', '50', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/skfXQ7vAgZeUsP8IwyTxxiyNovIcn9AA8RTjvIZc.jpg', NULL, 'membership/photos/G4OSsknMwLKIbTbWvfquvyyJjkYzYKLz4jKnx7kj.jpg', 0, NULL, NULL, '2025-07-22 07:43:41', '2025-07-22 07:43:41', 0),
(401, 487, '0401', 'ZSK Dhaka Punching', 'Proprietorship', 'Mahbub –Ul- Arefin', NULL, '350, Free School, Hatirpool,  Dhaka-1205.', '2200844', '01716937777', 'arefin2004@gmail.com', 'Male', 5000.00, 0.00, 0, NULL, NULL, NULL, 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/d1ENfNITRHe9F9eBi4PXCEF6lKgKzZXQQz4F7blj.jpg', NULL, 'membership/photos/qLgeuPfxh7I6whMiAr3sf9rwizCXMXPkSnMC1GRm.jpg', 0, NULL, NULL, '2025-07-22 07:56:00', '2025-07-22 07:56:00', 0),
(402, 488, '0402', 'Maryeam Apparels', 'Proprietorship', 'Fahamida Urmee Shawon', NULL, 'House-10/1, Ranavola Main Road, Block-C, Turag, Utaara Dhaka-1230.', '2200846', '01718107222', 'emran@maryeamapparels.com', 'Female', 5000.00, 0.00, 6, 'Portugal', '90', '09', 5000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/LcmIox8Gq2vX6Upb0a7nrJ1pKFuCq2dif0c2cHeS.jpg', NULL, 'membership/photos/0Y7tFkYGTzlkkpUgriNgTyGz4bj6n57ca6teroTZ.jpg', 0, NULL, NULL, '2025-07-22 08:05:50', '2025-07-22 08:05:50', 0),
(403, 489, '0403', 'Tex Zone', 'Proprietorship', 'Badsha Alam', NULL, '110/4, Naya Nagar, Nishatnagar, Turag, Dhaka-1230.', '2200847', '01716189010', 'tex_zone@yahoo.com', 'Male', 5000.00, 0.00, 4, 'China & Maya', '64', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/7N9f2Rxadh1ZaoAugfitZOVvxRVx1w2t1G5G0LFF.jpg', NULL, 'membership/photos/aOWNRtpplyoOhGNwC4q3haoROzlOO3Vt4ESLnu0G.jpg', 0, NULL, NULL, '2025-07-22 08:14:03', '2025-07-22 08:14:03', 0),
(404, 491, '0404', 'HSPR Fashion', 'Proprietorship', 'Rafjany Rahman Srijan', NULL, 'House-121, Nasa Bhaban, Faidabad, Chowrirtek, Dakshin Khan, Uttara, Dhaka-1230.', '2200840', '01932356888', 'hsprfashion93@gmail.com', 'Male', 5000.00, 0.00, 2, 'Seeing', '40', '09', 2000.00, NULL, NULL, NULL, '2025-12-31', 2, NULL, NULL, NULL, 'membership/documents/J7qdPHTZAiP1NxtGzyYEYpAPzarJtKHbXQTKEWn2.jpg', NULL, 'membership/photos/AM82LRqN9mWjQXDFqzi7Pw1VTFSY7ystlbDuNIMV.jpg', 0, NULL, NULL, '2025-07-23 06:59:33', '2025-07-23 06:59:33', 0);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT 1,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `linkable_type` varchar(255) DEFAULT NULL,
  `linkable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(10) NOT NULL DEFAULT '_self',
  `order` int(11) NOT NULL DEFAULT 0,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(255) NOT NULL,
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
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
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
(40, '2025_06_15_063312_add_column_to_event_members_table', 16);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `layout` varchar(255) NOT NULL DEFAULT 'default',
  `blocks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`blocks`)),
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `layout`, `blocks`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'About us', 'about ', 'default', '[{\"data\": {\"heading\": \"About Us\", \"header_image\": \"page-file/01JTFJN0SQY795AFX4KZ0RZQTD.jpg\"}, \"type\": \"page-header\"}, {\"data\": {\"size\": \"h1\", \"color\": \"#000000\", \"heading\": \"Our History\", \"alignment\": \"center\"}, \"type\": \"heading\"}, {\"data\": {\"description\": \"Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.\\n\\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\"}, \"type\": \"textarea\"}, {\"data\": {\"how_many\": \"1\"}, \"type\": \"br\"}, {\"data\": {\"size\": \"h2\", \"color\": \"#000000\", \"heading\": \"Advisory Council Members\", \"alignment\": \"center\"}, \"type\": \"heading\"}, {\"data\": {\"members\": [{\"brand\": \"Bigraja\", \"email\": \"mdrajakhan1064@gmail.com\", \"photo\": \"page-content-members/01JTG5H68VMXTD93AK9BMP7QR3.png\", \"mobile\": \"01645681877\", \"address\": \"SNB vata, Gonga proshad pur\\nRajbari\", \"colours\": \"SNB vata, Gonga proshad pur\\nRajbari\", \"machine\": \"100\", \"total_head\": \"500\", \"company_name\": \"Bigraja\", \"membership_no\": \"#0564\", \"proprietor_name\": \"Raja Khan\", \"proprietor_title\": \"Proprietor\"}, {\"brand\": \"Bigraja\", \"email\": \"mdrajakhan1064@gmail.com\", \"photo\": \"page-content-members/01JTG5H68VMXTD93AK9BMP7QR3.png\", \"mobile\": \"01645681877\", \"address\": \"SNB vata, Gonga proshad pur\\nRajbari\", \"colours\": \"SNB vata, Gonga proshad pur\\nRajbari\", \"machine\": \"100\", \"total_head\": \"500\", \"company_name\": \"Bigraja\", \"membership_no\": \"#0564\", \"proprietor_name\": \"Raja Khan\", \"proprietor_title\": \"Proprietor\"}, {\"brand\": \"Bigraja\", \"email\": \"mdrajakhan1064@gmail.com\", \"photo\": \"page-content-members/01JTG5H68VMXTD93AK9BMP7QR3.png\", \"mobile\": \"01645681877\", \"address\": \"SNB vata, Gonga proshad pur\\nRajbari\", \"colours\": \"SNB vata, Gonga proshad pur\\nRajbari\", \"machine\": \"100\", \"total_head\": \"500\", \"company_name\": \"Bigraja\", \"membership_no\": \"#0564\", \"proprietor_name\": \"Raja Khan\", \"proprietor_title\": \"Proprietor\"}, {\"brand\": \"Bigraja\", \"email\": \"mdrajakhan1064@gmail.com\", \"photo\": \"page-content-members/01JTG5H68VMXTD93AK9BMP7QR3.png\", \"mobile\": \"01645681877\", \"address\": \"SNB vata, Gonga proshad pur\\nRajbari\", \"colours\": \"SNB vata, Gonga proshad pur\\nRajbari\", \"machine\": \"100\", \"total_head\": \"500\", \"company_name\": \"Bigraja\", \"membership_no\": \"#0564\", \"proprietor_name\": \"Raja Khan\", \"proprietor_title\": \"Proprietor\"}]}, \"type\": \"member-card\"}, {\"data\": {\"size\": \"h2\", \"color\": \"#000000\", \"heading\": \"Executive Council Members\", \"alignment\": \"center\"}, \"type\": \"heading\"}]', NULL, '2025-05-05 10:38:05', '2025-05-07 20:11:11'),
(2, 'Our History', 'our-history', 'default', '[{\"data\":{\"heading\":\"Our History\",\"header_image\":\"page-file\\/01JVFT3JM2G7YQF8G9156M4EBB.jpg\"},\"type\":\"page-header\"},{\"data\":{\"how_many\":\"1\"},\"type\":\"br\"},{\"data\":{\"description\":null},\"type\":\"textarea\"},{\"data\":{\"how_many\":\"1\"},\"type\":\"br\"},{\"data\":{\"content\":\"<h3>Under developing<\\/h3><p><br><\\/p><p><br><\\/p>\"},\"type\":\"rich-editor\"}]', NULL, '2025-05-05 17:58:21', '2025-07-10 07:47:15'),
(3, 'Advisory Council Members', 'advisory-council-members', 'default', '[{\"data\":{\"heading\":\".\",\"header_image\":\"page-file\\/01JTNG69MW57PKCRV26MYAHM77.jpg\"},\"type\":\"page-header\"},{\"data\":{\"how_many\":\"1\"},\"type\":\"br\"},{\"data\":{\"size\":\"h2\",\"color\":\"#ffffff\",\"heading\":\"Advisory Council Members\",\"alignment\":\"center\",\"background\":\"#13bd0a\"},\"type\":\"heading\"},{\"data\":{\"members\":[{\"photo\":\"page-content-members\\/01JZTA2DEXV0YYAP3YXP0HE2YA.png\",\"proprietor_name\":\"Under developing\",\"proprietor_title\":\"Under developing\"},{\"photo\":\"page-content-members\\/01JZTA2DEZGN7VD1SNMJFQSN27.png\",\"proprietor_name\":\"Under developing\",\"proprietor_title\":\"Under developing\"},{\"photo\":\"page-content-members\\/01JZTA2DF0ZJ6DDRW3R20V46RQ.png\",\"proprietor_name\":\"Under developing\",\"proprietor_title\":\"Under developing\"},{\"photo\":\"page-content-members\\/01JZTA2DF0ZJ6DDRW3R20V46RR.png\",\"proprietor_name\":\"Under developing\",\"proprietor_title\":\"Under developing\"}]},\"type\":\"board-of-members\"}]', NULL, '2025-05-07 17:50:32', '2025-07-10 07:58:15'),
(4, 'Executive Council Members', 'executive-council-members', 'default', '[{\"data\":{\"heading\":\"Executive Council Members\",\"header_image\":\"page-file\\/01JWKTH1N2XZGR56RC2WB1R3HP.png\"},\"type\":\"page-header\"},{\"type\":\"br\",\"data\":{\"how_many\":\"2\"}},{\"type\":\"heading\",\"data\":{\"heading\":\"Executive Council Members\",\"alignment\":\"center\",\"size\":\"h1\",\"color\":\"#ffffff\",\"background\":\"#e26124\"}},{\"type\":\"board-of-members\",\"data\":{\"members\":[{\"proprietor_name\":\"Under developing\",\"proprietor_title\":\"Under developing\",\"photo\":\"page-content-members\\/01JZTAD61FBNFSZPPS9P8PR0PC.png\"}]}},{\"type\":\"board-of-members\",\"data\":{\"members\":[{\"proprietor_name\":\"Under developing\",\"proprietor_title\":\"Under developing\",\"photo\":\"page-content-members\\/01JZTAD61HBYK2KYPDNK1095J2.png\"},{\"proprietor_name\":\"Under developing\",\"proprietor_title\":\"Under developing\",\"photo\":\"page-content-members\\/01JZTAD61JGDTPS5RW8ABXV5JV.png\"},{\"proprietor_name\":\"Under developing\",\"proprietor_title\":\"Under developing\",\"photo\":\"page-content-members\\/01JZTAD61KTM9YHTE7VPZAD84F.png\"},{\"proprietor_name\":\"Under developing\",\"proprietor_title\":\"Under developing\",\"photo\":\"page-content-members\\/01JZTAD61M4JQ1YEXFFE60QYCC.png\"}]}}]', NULL, '2025-05-07 17:56:31', '2025-07-10 08:04:08'),
(5, 'Past BEMEA Members', 'Past BEMEA Members', 'default', '[{\"data\":{\"heading\":\"Past BEMEA Members\",\"header_image\":\"page-file\\/01JTNGPH54XDF5SN27XC2ATQYC.jpg\"},\"type\":\"page-header\"}]', 1, '2025-05-07 17:59:24', '2025-05-30 04:02:38'),
(6, 'Our  Executive Members', 'our-executive-members', 'default', '[{\"data\": {\"heading\": \"Our  Executive Members\", \"header_image\": \"page-file/01JTNGV93FZ66JS40P0YSARYVR.jpg\"}, \"type\": \"page-header\"}]', NULL, '2025-05-07 18:02:00', '2025-05-07 18:02:00'),
(7, 'Contact Us', 'contact-us', 'default', '[{\"data\":{\"heading\":\"Contact Us\",\"header_image\":\"page-file\\/01JWKRH9FJEFSTG3T22618SQ7Y.png\"},\"type\":\"page-header\"},{\"data\":{\"address\":\"7\\/7 A Sector -17 Block - H1, Uttara,Dhaka, Bangladesh\",\"email_1\":\"contact@bemeabd.com\",\"email_2\":\"bemea2000@gmail.com\",\"phone_1\":\"01720578171\",\"phone_2\":\"01970578171\",\"background_image\":\"contact-info-backgrounds\\/01JTNRN4248CQJHR4NZ6AETWDX.jpg\"},\"type\":\"contact-info\"},{\"data\":{\"title\":null,\"tagline\":\"Contact with us\",\"formAction\":\"theme-assets\\/inc\\/sendemail.php\",\"description\":null,\"socialLinks\":[{\"url\":null,\"platform\":\"twitter\"},{\"url\":null,\"platform\":\"facebook\"}]},\"type\":\"contact-one\"},{\"data\":{\"map_embed_url\":\"<div class=\\\"mapouter\\\" style=\\\"position:relative; text-align:right; width:500px; height:450px;\\\">\\n  <div class=\\\"gmap_canvas\\\" style=\\\"overflow:hidden; background:none!important; width:500px; height:450px;\\\">\\n    <iframe width=\\\"500px\\\" height=\\\"450px\\\" style=\\\"border:0;\\\" allowfullscreen=\\\"\\\" loading=\\\"lazy\\\" referrerpolicy=\\\"no-referrer-when-downgrade\\\" src=\\\"https:\\/\\/www.google.com\\/maps\\/embed\\/v1\\/place?q=https%3A%2F%2Fmaps.app.goo.gl%2FwM1kKHEHb2RkeV3X9&key=AIzaSyBFw0Qbyq9zTFTd-tUY6dZWTgaQzuU17R8\\\"><\\/iframe>\\n  <\\/div>\\n  <a href=\\\"https:\\/\\/norsumediagroup.com\\/embed-google-map-website-free\\\" target=\\\"_blank\\\" rel=\\\"noopener noreferrer\\\" class=\\\"gme-generated-link\\\">Embed Map on Website for Free<\\/a>\\n  <style>\\n   .mapouter{position:relative;text-align:right;} .gmap_canvas{overflow:hidden;background:none!important;} .gmap_canvas iframe{width:100%;height:100%;} .mapouter a{display:block;font-size:0.85em;text-align:center;padding:5px 0;color:#6c757d;text-decoration:none;} .gme-generated-link{display:none!important;}\\n  <\\/style>\\n<\\/div>\",\"height\":null},\"type\":\"google-map\"}]', NULL, '2025-05-07 18:03:03', '2025-07-05 22:58:52'),
(8, 'Members', 'members', 'default', '[{\"data\":{\"heading\":\"Our Honorable Members\",\"header_image\":\"page-file\\/01JW398F5EK2K7CM66NKW8063F.png\"},\"type\":\"page-header\"},{\"data\":{\"how_many\":\"1\"},\"type\":\"br\"},{\"data\":{\"size\":\"h2\",\"color\":\"#000000\",\"heading\":null,\"alignment\":\"center\",\"background\":\"#ffffff\"},\"type\":\"heading\"},{\"data\":{\"section_tagline\":null,\"section_title\":null,\"display_limit\":\"162\",\"button_text_all_members\":null,\"button_link_all_members\":null},\"type\":\"membership-list\"}]', NULL, '2025-05-07 18:06:02', '2025-07-12 23:31:14'),
(9, 'Events', 'events', 'default', '[{\"data\":{\"heading\":\"Events\",\"header_image\":\"page-file\\/01JW39QXDAZK8CEN7FYYKE7D6Q.png\"},\"type\":\"page-header\"},{\"data\":[],\"type\":\"event-list\"}]', NULL, '2025-05-07 18:12:26', '2025-05-25 02:42:53'),
(10, 'Sponsors', 'sponsors', 'default', '[{\"data\":{\"heading\":\"Thank you for staying with us\",\"header_image\":\"page-file\\/01JW372W3JQRMD73D5G1K882VW.png\"},\"type\":\"page-header\"},{\"data\":[],\"type\":\"sponsor-carousel\"}]', NULL, '2025-05-07 18:15:08', '2025-05-26 09:44:40'),
(11, 'Home', '/', 'default', '[{\"data\":{\"items\":[{\"heading\":\"BANGLADESH EMBROIDERY MANUFACTURES & EXPORTER ASSOCIATION\",\"slug_line\":\"\\\"Where Style Meets Scale \\u2013 Multi-Head Embroidery for Modern Fashion\\\"\",\"button_link\":\"https:\\/\\/bemea.amarsite.top\\/register\",\"button_text\":\"NEW MEMBER REG\",\"slider_image\":\"page-file\\/01JXVVQ8E6QDZMJNCX5YMHB7H0.png\"},{\"slider_image\":\"page-file\\/01JXVVQ8E9VP0S57QCD18KMR9X.png\",\"heading\":\"BANGLADESH EMBROIDERY MANUFACTURES & EXPORTER ASSOCIATION\",\"slug_line\":null,\"button_text\":null,\"button_link\":\"#\"}]},\"type\":\"slider\"},{\"data\":{\"how_many\":\"1\"},\"type\":\"br\"},{\"data\":{\"size\":\"h1\",\"color\":\"#e3a316\",\"heading\":\"Board Of Directors \",\"alignment\":\"center\",\"background\":\"#bd7948\"},\"type\":\"heading\"},{\"data\":{\"size\":\"h5\",\"color\":\"#ffffff\",\"heading\":\"2024-2026\",\"alignment\":\"center\",\"background\":\"#e87738\"},\"type\":\"heading\"},{\"data\":{\"members\":[{\"photo\":\"page-content-members\\/01JXVPG16AD9HMHS4QT64SF0BK.png\",\"proprietor_name\":\"Shahnawz Chowdhury\",\"proprietor_title\":\"President\"}]},\"type\":\"board-of-members\"},{\"data\":{\"members\":[{\"photo\":\"page-content-members\\/01JY419XD2VVFNJQZJJ58SRVB3.png\",\"proprietor_name\":\"Md Sharif Hossain Khan \",\"proprietor_title\":\"First Sr.Vice President\"},{\"photo\":\"page-content-members\\/01JY8FDK5PPZA7QR0AAMRC0MEH.png\",\"proprietor_name\":\"Md Shamsul Islam \",\"proprietor_title\":\"First Sr.Vice President\"},{\"photo\":\"page-content-members\\/01JY8FDK5RZQY1A59Z0MA3TKC1.png\",\"proprietor_name\":\"A.R.M Shahidul Haque Apu\",\"proprietor_title\":\"Vice President\"},{\"photo\":\"page-content-members\\/01JY8FDK5SKCSXKQPF3SDPFARA.png\",\"proprietor_name\":\"Rasaul Karim Popy\",\"proprietor_title\":\"Vice President \"},{\"proprietor_name\":\"Md Sarif Uddin Khan Momen\",\"proprietor_title\":\"Vice President \",\"photo\":\"page-content-members\\/01JY8FDK5T2Y6KM0JW8BW6PN6V.png\"},{\"proprietor_name\":\"Md Anwar Hossain \",\"proprietor_title\":\"Vice President \",\"photo\":\"page-content-members\\/01JY8FKTR7B4Z97QFWKYZHPSVT.png\"},{\"proprietor_name\":\"Md. Khijir Chowdhury\",\"proprietor_title\":\"Secretary General\",\"photo\":\"page-content-members\\/01JYK0ZAXJXWFATN5GGX4VV9RZ.png\"},{\"proprietor_name\":\"Md. Muksedur Rahman Abir\",\"proprietor_title\":\"Joint Secretary General\",\"photo\":\"page-content-members\\/01JYK0ZAXKYJ9JAE27PJRMFY1N.png\"},{\"proprietor_name\":\"A.T.M. Mostaen Billah Mukim\",\"proprietor_title\":\"Finance Director\",\"photo\":\"page-content-members\\/01JYK0ZAXME502EEH07DAPDTXQ.png\"},{\"proprietor_name\":\"Md. Delowar Hossain Ansary\",\"proprietor_title\":\"Joint Finance Director\",\"photo\":\"page-content-members\\/01JXVVH6VT37YSNHFVVNQYEZ58.png\"},{\"proprietor_name\":\"Md. Ruhul Amin\",\"proprietor_title\":\"Director\",\"photo\":\"page-content-members\\/01JYK0ZAXP78M8CHVZ2QPNBF7X.png\"},{\"proprietor_name\":\"Md. Azizul Islam\",\"proprietor_title\":\"Director\",\"photo\":\"page-content-members\\/01JYP3PERMSFHR426BVY2KTCFY.png\"},{\"proprietor_name\":\"Md. Rasel Sheikh\",\"proprietor_title\":\"Director\",\"photo\":\"page-content-members\\/01JYK0ZAXRAM2PFZGG7VFPEZ96.png\"},{\"proprietor_name\":\"Mohammad Nura Alam Sarker\",\"proprietor_title\":\"Director\",\"photo\":\"page-content-members\\/01JYK0ZAXRAM2PFZGG7VFPEZ97.png\"},{\"proprietor_name\":\"Md. Ataul Goni\",\"proprietor_title\":\"Director\",\"photo\":\"page-content-members\\/01JYK0ZAXTMZ6G64TW21PSMR5V.png\"},{\"proprietor_name\":\"Md. Monir Ahmed Manik\",\"proprietor_title\":\"Director\",\"photo\":\"page-content-members\\/01JYK0ZAXVQPJSFQ80PRBZ66YH.png\"},{\"proprietor_name\":\"Md. Abdulla Al Mamun\",\"proprietor_title\":\"Director\",\"photo\":\"page-content-members\\/01K0C2XNZSE5J1VXA6X8P8J5GQ.png\"},{\"proprietor_name\":\"Md. Sanjil Hossain\",\"proprietor_title\":\"Director\",\"photo\":\"page-content-members\\/01JYNBKTBBBRTB8CT9F30ABJKD.png\"},{\"proprietor_name\":\"Md. Sharif Ullah Bapu\",\"proprietor_title\":\"Director\",\"photo\":\"page-content-members\\/01JYNBKTBDW945HGJBXCZN4DYJ.png\"},{\"proprietor_name\":\"Md. Main Uddin Khan\",\"proprietor_title\":\"Director\",\"photo\":\"page-content-members\\/01JYNBKTBE3RV06QAV1Y12SQQA.png\"}]},\"type\":\"board-of-members\"},{\"data\":{\"how_many\":\"1\"},\"type\":\"br\"},{\"data\":{\"background_image\":\"pageblock-video-one\\/01JWKGGY7D92YK4Y72305CPQ1W.jpeg\",\"video_area_list_items\":[],\"video_popup_url\":null,\"video_area_title\":\"\\u098f\\u09ae\\u09ac\\u09cd\\u09b0\\u09af\\u09bc\\u09a1\\u09be\\u09b0\\u09bf \\u09ab\\u09cd\\u09af\\u09be\\u0995\\u09cd\\u099f\\u09b0\\u09bf\\u09a4\\u09c7 \\u099a\\u09be\\u0995\\u09b0\\u09bf \\u0995\\u09b0\\u09c7 \\u09a6\\u09c7\\u09b6\\u09c7\\u09b0 \\u0985\\u09b0\\u09cd\\u09a5\\u09a8\\u09c0\\u09a4\\u09bf\\u09b0 \\u0989\\u09a8\\u09cd\\u09a8\\u09af\\u09bc\\u09a8\\u09c7 \\u0985\\u09ac\\u09a6\\u09be\\u09a8 \\u09b0\\u09be\\u0996\\u09c1\\u09a8\\u0964 \\n\\u0986\\u099c\\u0995\\u09c7\\u0987 \\u099a\\u09be\\u0995\\u09b0\\u09bf\\u09b0 \\u099c\\u09a8\\u09cd\\u09af \\u0986\\u09ac\\u09c7\\u09a6\\u09a8 \\u0995\\u09b0\\u09c1\\u09a8\\u0964 \\n\\u0986\\u09aa\\u09a8\\u09be\\u09b0 \\u098f\\u0987 \\u0986\\u09ac\\u09c7\\u09a6\\u09a8\\u099f\\u09bf \\u0986\\u09ae\\u09be\\u09a6\\u09c7\\u09b0 \\u09b8\\u0995\\u09b2 \\u09ae\\u09c7\\u09ae\\u09cd\\u09ac\\u09be\\u09b0\\u09a6\\u09c7\\u09b0 \\u0995\\u09be\\u099b\\u09c7 \\u09aa\\u09cc\\u0981\\u099b\\u09c7 \\u09af\\u09be\\u09ac\\u09c7\\u0964\\n\\n\",\"form_section_title\":null,\"form_section_tagline\":null,\"form_section_description\":null,\"form_submit_button_text\":null},\"type\":\"video-one\"},{\"type\":\"testimonials-one\",\"data\":{\"background_image\":\"pageblock-testimonials\\/01JWKG3R7GRPJ2J6N5Z7YSBRYN.jpg\",\"gallery_images\":[],\"section_tagline\":null,\"section_title\":null,\"section_description\":null,\"button_text\":null,\"button_link\":\"https:\\/\\/bemea.bemeabd.com\\/all-notice\",\"cv_display_limit\":\"5\",\"notice_display_limit\":null}},{\"data\":{\"images\":[{\"image\":\"pageblock-gallery-one\\/01JYBVDABFSEY4BTC4G5HNC94S.png\",\"alt_text\":\"test \",\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JYBVH8DRJQBM2EG9C08G55BN.png\",\"alt_text\":\"test \",\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JYBVNTWPTGXG3WPJ1F4W67MH.png\",\"alt_text\":\"test\",\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JYBVNTWRAFCTZ8WRY3WD38MH.png\",\"alt_text\":\"test\",\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JWKEX17BP74XT6BNW9EQ0Z0W.jpg\",\"alt_text\":\"test\",\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JYBVNTWT8KNAAFCS534FPPFV.png\",\"alt_text\":\"test\",\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JWKEX17H92EX2ZN08AJ7NCA9.jpg\",\"alt_text\":\"test\",\"category_filter_tag\":\"ec meeting \"},{\"image\":\"pageblock-gallery-one\\/01JZFPTKE8X6WB1765QNG8MTGZ.jpg\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZFPTKECEC3HNJ6MSHXVFM92.jpg\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT0SCTNTQSEM4QD61EZT491.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B267TGN7BSR3PTZF2T6P.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B2693MWP7AR685MX4R6A.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26ADNSD960EDDM80PV0.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26BTGQ00P3P7DVVT7TF.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26BTGQ00P3P7DVVT7TG.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26C31XWYY91XDPFV21S.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26DTCF326NW3H917GRZ.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26E1PHH1HRXB8D7GV0P.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26F1AGDDR0TG4RXTXAB.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26G3BE8JBMR6PZK9Y3W.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26HC29492F3QF2H4G94.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26JTPVEAS4GE46HEGC3.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26JTPVEAS4GE46HEGC4.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26KS0VP1RSYKJCJQ3E6.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26NRCQ1ETXCQRDF5WX3.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26PPQB996TMF64MNWH7.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26PPQB996TMF64MNWH8.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26Q2FG4EWSYJBSNKA32.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26RP4FP6ZF135KZKFG5.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26SJN4YDB66PNAYW25B.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26TC1A2PV87GGEZSVWE.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26VRKSXPW0SZVRMZT12.png\",\"alt_text\":null,\"category_filter_tag\":null},{\"image\":\"pageblock-gallery-one\\/01JZT3B26WWZ21G0JV31FGGN28.png\",\"alt_text\":null,\"category_filter_tag\":null}],\"section_tagline\":null,\"section_title\":null},\"type\":\"gallery-one\"},{\"data\":{\"section_title\":null,\"display_limit\":null},\"type\":\"sponsor-carousel\"}]', NULL, '2025-05-07 20:11:20', '2025-07-17 14:01:27'),
(12, 'Picnic 2025', 'picnic-2025', 'default', '[{\"type\":\"page-header\",\"data\":{\"header_image\":\"page-file\\/01JWKJ8K2KWQRAA5B7YF1ACNYQ.jpg\",\"heading\":\"Picnic 2025\"}},{\"type\":\"photo-gallery\",\"data\":{\"gallery_title\":\"Picnic 2025\",\"images\":[{\"image_path\":\"photo-gallery-images\\/01JWRR5TSJFGE69R0VGG0NXREV.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSM6PFXFGY1JE4Y8YWQ.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSN0A1KKW9XC4JRK4DX.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSQ44MQKMM0W7AY9WGT.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSR2MNHKK2NY5MMNM6R.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSSN372ARQ1HTK0SDQE.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSTHNDNN5TTJD27H2NY.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSVJH4ESND7S7EFCCH2.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSW2RVZVG4444P1WJFY.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSX469F00J380F1AS71.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSYBE40Z6X9JK6F6C7D.jpg\",\"caption\":null},{\"image_path\":\"photo-gallery-images\\/01JWRR5TSZZPSHH19JT8RYZR4H.jpg\",\"caption\":null}]}}]', NULL, '2025-05-31 10:18:49', '2025-06-02 10:39:12'),
(13, 'Picnic 2026', 'picnic-2026', 'default', '[{\"type\":\"page-header\",\"data\":{\"header_image\":\"page-file\\/01JWRSPZMG3DTPEM4SKXWGX2EN.jpg\",\"heading\":\"Picnic 2026\"}},{\"type\":\"photo-gallery\",\"data\":{\"gallery_title\":\"Our Photo Gallery\",\"images\":[{\"image_path\":\"photo-gallery-images\\/01JWRSPZMHX9Q71BQVS3XD9FSN.png\",\"caption\":null}]}}]', NULL, '2025-06-02 11:06:03', '2025-06-02 11:06:03'),
(14, 'Picnic 2027', 'picnic-2027', 'default', '[]', NULL, '2025-06-02 11:13:27', '2025-06-02 11:14:58'),
(15, 'Former Presidents', 'former-presidents', 'default', '[{\"type\":\"page-header\",\"data\":{\"header_image\":\"page-file\\/01JWTB5R5RB786DMQ9AMM2XQRG.jpg\",\"heading\":\"Former Presidents\"}},{\"type\":\"former-presidents\",\"data\":{\"presidents\":[{\"name\":\"Under developing\",\"time_period\":\"Under developing\",\"image\":\"former-presidents\\/01JZTAHKE7N8D7H12SM5TVDFK9.png\",\"description\":null},{\"name\":\"Under developing\",\"time_period\":\"Under developing\",\"image\":\"former-presidents\\/01JZTAHKE9RP9FK59F13WV5A79.png\",\"description\":null},{\"name\":\"Under developing\",\"time_period\":\"Under developing\",\"image\":\"former-presidents\\/01JZTAHKEAY0Y0GZKXQDN75ST6.png\",\"description\":null},{\"name\":\"Under developing\",\"time_period\":\"Under developing\",\"image\":\"former-presidents\\/01JZTAHKEAY0Y0GZKXQDN75ST7.png\",\"description\":null}]}}]', NULL, '2025-06-03 01:30:27', '2025-07-10 08:06:32'),
(16, 'Donate To Bemea', 'Donate To Bemea', 'default', '[{\"type\":\"slider\",\"data\":{\"items\":[{\"slider_image\":\"page-file\\/01JX0R13BKF6GZCS5YW7ENNXBD.png\",\"heading\":\"Donate To Bemea\",\"slug_line\":\"Donate To Bemea\",\"button_text\":null,\"button_link\":\"#\"},{\"slider_image\":\"page-file\\/01JX0R1V322C9GTYPP4R3M6WG9.png\",\"heading\":\"Donate To Bemea\",\"slug_line\":\"Donate To Bemea\",\"button_text\":null,\"button_link\":\"#\"}]}}]', NULL, '2025-06-05 13:07:21', '2025-06-05 13:10:57'),
(17, 'all-notice', 'all-notice', 'default', '[{\"type\":\"page-header\",\"data\":{\"header_image\":\"page-file\\/01JXQ5S6G711E8T8NWPJ7MG0KA.jpg\",\"heading\":\"All Notice\"}},{\"type\":\"all-notice\",\"data\":{\"section_title\":\"All Notices\",\"per_page\":\"25\"}}]', NULL, '2025-06-14 06:14:11', '2025-06-14 22:14:37');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `renew_memberships`
--

CREATE TABLE `renew_memberships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `membership_id` bigint(20) UNSIGNED NOT NULL,
  `machine_count` int(11) NOT NULL,
  `yearly_subscription` decimal(10,2) NOT NULL,
  `deu_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `director_photo` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `renew_expire_date` timestamp NULL DEFAULT NULL,
  `expense_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `renew_amount` int(11) DEFAULT NULL,
  `payment_year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `group` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`payload`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `reason` text DEFAULT NULL,
  `company_logo` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_address` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sponsors`
--

INSERT INTO `sponsors` (`id`, `expense_id`, `user_id`, `reason`, `company_logo`, `company_name`, `company_address`, `is_active`, `created_at`, `updated_at`) VALUES
(18, NULL, 448, NULL, NULL, 'M/S JENUINE FASHION', 'PLOT#37.ROAD#03.UTTARAN HOUSING.DHOUR.TURAG.DHAKA-1230', 0, '2025-07-20 07:42:04', '2025-07-20 07:42:04');

-- --------------------------------------------------------

--
-- Table structure for table `taggables`
--

CREATE TABLE `taggables` (
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `taggable_type` varchar(255) NOT NULL,
  `taggable_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`name`)),
  `slug` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`slug`)),
  `type` varchar(255) DEFAULT NULL,
  `order_column` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `mobile_number_verified_at` timestamp NULL DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'user',
  `can_login` tinyint(1) NOT NULL DEFAULT 1,
  `profile_picture` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `profile_photo_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `mobile_number`, `mobile_number_verified_at`, `address`, `password`, `type`, `can_login`, `profile_picture`, `is_admin`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `profile_photo_path`) VALUES
(28, 'momen khan', 'dahaobd@gmail.com', NULL, '01711544994', NULL, NULL, '$2y$12$GDeROAmW7.MNmqIR./hcOeCiLRKxt0dLLUJaKThphvSjPg5ZZsCwi', 'user', 1, '01JX1KYTJK24QY5R96AE8H8EZ0.jpg', 1, '1FgQ7WpweWPYckAOYjHKsjVSurDVusLkOpRWvYjKQSc96BwDGTcQbekY9HaK', '2025-05-23 22:10:38', '2025-06-16 00:18:57', NULL, NULL),
(48, 'MR ISHAQ ', 'bemea2000@gmail.com', '2025-06-16 05:16:29', '01720578171', NULL, 'bgmea building , uttara, dhaka ', '$2y$12$qURuuPvXcSJfjgFy7h.OHOVDr5X4nRO.HDgHjGrduApMC4XfSULo.', 'user', 1, NULL, 1, NULL, '2025-06-15 23:14:16', '2025-06-17 00:14:00', NULL, NULL),
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
(204, 'Md. Mostafa Khan', 'mmkhanex@gmail.com', NULL, '01711287926', NULL, NULL, '$2y$12$kpUlq6.cqhFYNsXrOqDNqevmEsPMwZp16tl.RnMfTkCgqf6o8d.dK', 'user', 1, NULL, 0, NULL, '2025-07-08 03:38:27', '2025-07-08 03:38:27', NULL, NULL),
(205, 'zia', 'zia@gmail.com', NULL, '01645628593', NULL, NULL, '$2y$12$Gj/jEBtOJERim7Ed4o94zuhkJeDh1yNCpHvih7dTJs/cxNeMUtaJ.', 'user', 1, NULL, 0, NULL, '2025-07-08 13:03:54', '2025-07-08 13:03:54', NULL, NULL),
(207, 'Nur Mohammad', 'nur976172@gmail.com', NULL, '01715909343', NULL, NULL, '$2y$12$ytngpdw2bcmDEQItQcT0yu839TMPXYlKgUt.tz60K2KejHXYtTXNm', 'user', 1, NULL, 0, NULL, '2025-07-09 03:28:22', '2025-07-09 03:28:22', NULL, NULL),
(212, 'Saad Rahim Chowdhury', 'saadchow@gmail.com', NULL, '01713002900', NULL, NULL, '$2y$12$Im4nhC37CyXavBJMM035gOsaRd21whrtu9PHOsov.lTvofdjDZDwW', 'user', 1, NULL, 0, NULL, '2025-07-10 03:59:59', '2025-07-10 03:59:59', NULL, NULL),
(213, 'Md. Ariful  Islam (Montu)', 'maafashionmontu@gmail.com', NULL, '01913380277', NULL, NULL, '$2y$12$uALfjP.NE86bWh9MuiiHeelwg.CKTlyDFSMkcT1ziXJ9H14CC45G.', 'user', 1, NULL, 0, NULL, '2025-07-10 04:11:41', '2025-07-10 04:11:41', NULL, NULL),
(215, 'MAIMUNA EMBROIDERY', 'shohagdesigner70@gmail.com', NULL, '01924094695', NULL, NULL, '$2y$12$TQkqlKkVD0mqPQEJOloPKu93hxI8JzWFZGz6sEkF0nVoibOClLcgO', 'user', 1, NULL, 0, NULL, '2025-07-10 08:42:51', '2025-07-10 08:42:51', NULL, NULL),
(222, 'TECH GIAN ', 'embroiderybd@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$/V/A3ilLDjtM6KW9Ja5dsOTYaPuiUKiHHj8OsI8TW7XdoodCdA9Im', 'admin', 1, NULL, 1, 'rTakH5w9wihmjdCsO4mqh1laILQwYPNMDWp8NDFpo4uGwqrfVrrPY3m6N1Y2', '2025-07-12 00:20:44', '2025-07-12 00:20:44', NULL, NULL),
(225, 'xZtxPYnHfhCxUdb', 'tilorcraney28@gmail.com', NULL, '4411497114', NULL, NULL, '$2y$12$269WwGV5M2uygK8LMu18YuHcy26BdjB1xiAGC22b3DRXBGkPyU0mK', 'user', 1, NULL, 0, NULL, '2025-07-13 02:34:12', '2025-07-13 02:34:12', NULL, NULL),
(226, 'YmDIxZwpR', 'kinrothvv28@gmail.com', NULL, '5005224728', NULL, NULL, '$2y$12$hj298GF6UlJQFKShare7Y.2LC28BzyyBHySDjNEemZHzNIG4fcHGW', 'user', 1, NULL, 0, NULL, '2025-07-13 02:50:54', '2025-07-13 02:50:54', NULL, NULL),
(227, 'kyRcqdbBPbklvPK', 'bmeyerid@gmail.com', NULL, '9314747885', NULL, NULL, '$2y$12$2tnPhUxg0mMCqV0WWaxFIea.SPt9je9BGJCZMXFTVEvnd8m7x03Su', 'user', 1, NULL, 0, NULL, '2025-07-13 09:56:50', '2025-07-13 09:56:50', NULL, NULL),
(228, 'Mosharof Hossain', 'msenterprise1@hotmail.com', NULL, '01711561905', NULL, NULL, '$2y$12$g6uAMywUlIBt6IUuls2SmOCxfJLw9EFFHGUGxmi4ESu/rbrCrG5N6', 'user', 1, NULL, 0, NULL, '2025-07-13 22:19:41', '2025-07-13 22:19:41', NULL, NULL),
(229, 'M.A.W.Azim Bhuyah', 'azimenterprisepable@gmail.com', NULL, '01915034103', NULL, NULL, '$2y$12$dbTpu4sq64NnnqTirhnu5e0sKoG2XPK67F/m7FlWZKEViAm65W2oK', 'user', 1, NULL, 0, NULL, '2025-07-13 22:27:42', '2025-07-13 22:27:42', NULL, NULL),
(230, 'Md. Jamir Hossain (Gibon)', 'maaemep@gmail.com', NULL, '01716494204', NULL, NULL, '$2y$12$gN5FD75tJpeiAFBIxma5BuZbSAByp.VechgWcze4jiwuCe.854sZG', 'user', 1, NULL, 0, NULL, '2025-07-13 22:32:13', '2025-07-13 22:32:13', NULL, NULL),
(231, 'Md. Mainul Islam Bhuiyan (Monir)', 'maamoni93@yahoo.com', NULL, '01711527879', NULL, NULL, '$2y$12$cYNsuRDa4ZmBOnjmlJMhcuaZgDbunVZwiLNJuCxUoHyzTDlvSbMnW', 'user', 1, NULL, 0, NULL, '2025-07-13 22:49:13', '2025-07-13 22:49:13', NULL, NULL),
(232, 'Asif', 'asif@gmail.com', NULL, '01758040074', NULL, NULL, '$2y$12$P3Z8Mcn6IoyFi0nXV8qFBuAYH5NFEn7S8gxKGcM.IC9chL3IGkUBm', 'user', 1, NULL, 0, NULL, '2025-07-13 22:55:12', '2025-07-13 22:55:12', NULL, NULL),
(233, 'Md. Ariful Haque', 'arif@manefashion.com', NULL, '01713005166', NULL, NULL, '$2y$12$HRzMdjxGdraNjS/t3HI.9eEvCUjqzH8EcC39mXZS1G1svhbZBzalW', 'user', 1, NULL, 0, NULL, '2025-07-13 22:58:05', '2025-07-13 22:58:05', NULL, NULL),
(234, 'M. Bodruzzaman (Pintu)', 'maowafashion@gmail.com', NULL, '01713077753', NULL, NULL, '$2y$12$ucDYo2SlKS30a1IUTBlbXebimkh0WdQIjSxD1.dbgalXEmB9/R/7e', 'user', 1, NULL, 0, NULL, '2025-07-13 23:06:02', '2025-07-13 23:06:02', NULL, NULL),
(235, 'Alhaj Amdadul Kabir (Faysal)', 'md.faysal549@gmail.com', NULL, '01811951504', NULL, NULL, '$2y$12$J5dbC4HBB9XIdekwp97jD.FaLoLGGlCzUylIgXb91sISaDSW5ePTK', 'user', 1, NULL, 0, NULL, '2025-07-13 23:14:06', '2025-07-13 23:14:06', NULL, NULL),
(236, 'Md. M. N Kabir', 'maximsourcing24/7@gmail.com', NULL, '01818101264', NULL, NULL, '$2y$12$n5HrOeKlc9WLR43n532EbOJ0rReDz190rUI7Kv/I3/diWpwW5W.mW', 'user', 1, NULL, 0, NULL, '2025-07-13 23:43:28', '2025-07-13 23:43:28', NULL, NULL),
(237, 'Shohel Rana', 'shohelranabd1982@gmail.com', NULL, '01711168144', NULL, NULL, '$2y$12$vCrpm6ZV3GZMrdlh37P2eOHRK/XZFSiZtaX64qnC6snzECCMlGy5e', 'user', 1, NULL, 0, NULL, '2025-07-14 00:16:56', '2025-07-14 00:16:56', NULL, NULL),
(238, 'NkhpwzBgaQl', 'annikkwhitec89@gmail.com', NULL, '6481919577', NULL, NULL, '$2y$12$Qax7tiJmOnzBgR0qTYDYi.mgJJdJR1TLuw0yn9O4Ts6K1Vpces3D6', 'user', 1, NULL, 0, NULL, '2025-07-14 00:47:01', '2025-07-14 00:47:01', NULL, NULL),
(239, 'Md. Awlad Hossain', 'awlad.hossain40@yahoo.com', NULL, '01712532639', NULL, NULL, '$2y$12$D5.yFkj6g9DeUXIzx7z9cOqnGWKTkdNKF378e1KRfXq/69hFll12O', 'user', 1, NULL, 0, NULL, '2025-07-14 00:54:11', '2025-07-14 00:54:11', NULL, NULL),
(240, 'Md. Mirajul Islam (Miraj)', 'mirajfashion87@gmail.com', NULL, '01714277061', NULL, NULL, '$2y$12$XdewVuWRpPj3pa/UehWx..Rjrz8orPjk6uk4DTN6wCD1IuZC9fFOG', 'user', 1, NULL, 0, NULL, '2025-07-14 01:03:39', '2025-07-14 01:03:39', NULL, NULL),
(241, 'Kowser Hossain Riaz', 'nrf2001@yahoo.com', NULL, '01713301555', NULL, NULL, '$2y$12$UaxnxGrldy0YVltBxowInuseCF8KWRigCTsOKuQQKEAu6ARC2vABG', 'user', 1, NULL, 0, NULL, '2025-07-14 01:08:01', '2025-07-14 01:08:01', NULL, NULL),
(242, 'Mrs. Hamida Yesmin', 'najembro@yahoo.com', NULL, '01610378890', NULL, NULL, '$2y$12$hYNojYx/QasBEMe8hPrGsO/g7DlUq/kh/v.uP1CXg/B/CGTj0qVXu', 'user', 1, NULL, 0, NULL, '2025-07-14 01:12:06', '2025-07-14 01:12:06', NULL, NULL),
(243, 'Mohammad Shachhu Miah', 'shachhu.nakshi@yahoo.com', NULL, '01712074907', NULL, NULL, '$2y$12$bc36xR/p3pLaSCTdbKKWbe2hxMX39AtC5YpR6.AndPtToHBnqGm56', 'user', 1, NULL, 0, NULL, '2025-07-14 01:17:36', '2025-07-14 01:17:36', NULL, NULL),
(244, 'Md. Jashim Uddin Swapon', 'namiraapparels@gmail.com', NULL, '01552355375', NULL, NULL, '$2y$12$QYLdJZtUWXj8qOMe0MBg8OEZgUjLzSfG608Rwe2TpOsSR13K4gUVm', 'user', 1, NULL, 0, NULL, '2025-07-14 01:24:45', '2025-07-14 01:24:45', NULL, NULL),
(245, 'Md. Abul kalam Azad', 'azad_3235@yahoo.com', NULL, '01720542968', NULL, NULL, '$2y$12$wB3kgwL6j/PyjGz0H2oK2eQry4S2saT8FOD9ntnILfwL/cVlS0j0C', 'user', 1, NULL, 0, NULL, '2025-07-14 01:36:47', '2025-07-14 01:36:47', NULL, NULL),
(246, 'Md. Belayet Hosen Bhuiyan', 'balayet_hosen@yahoo.com', NULL, '01818957155', NULL, NULL, '$2y$12$8kFVFQ0DqiZl01M3eh119uTYpvwe5ZJIvvgeChPSMGMtQ4f16.fmy', 'user', 1, NULL, 0, NULL, '2025-07-14 01:41:58', '2025-07-14 01:41:58', NULL, NULL),
(247, 'Md. Nazrul Islam Mazumder', 'emb@nassagroup.org', NULL, '01713094455', NULL, NULL, '$2y$12$hhSc4WQJfyPeczH/fucA2uipYwtkjL9EVcHc4am1s5iUNaL01HLwO', 'user', 1, NULL, 0, NULL, '2025-07-14 01:46:01', '2025-07-14 01:46:01', NULL, NULL),
(248, 'Bellal Hossain', 'nbmkhan@gmail.com', NULL, '01711507118', NULL, NULL, '$2y$12$E4cOU3laa/yDvum6zB1y/O.Jqk7MHJ9ZGq1hYSCxmCSZqZy0g958K', 'user', 1, NULL, 0, NULL, '2025-07-14 01:51:56', '2025-07-14 01:51:56', NULL, NULL),
(249, 'A.F.M Sarwar Mahboob', 'niaz.needleart@gmail.com', NULL, '01713090009', NULL, NULL, '$2y$12$v.wa3r6BIOEGp90rNRhefODNKMdjIDOFap/8DgjlxZF3TIcvmKW9i', 'user', 1, NULL, 0, NULL, '2025-07-14 01:56:03', '2025-07-14 01:56:03', NULL, NULL),
(250, 'Md. Jakir  Hossain Sajal', 'needlecraft04@gmail.com', NULL, '01819463192', NULL, NULL, '$2y$12$fQII.DF64JIiWxHW4QsfUuDQt1bFwTJM5DBv7OJv3/AByViyVsEVm', 'user', 1, NULL, 0, NULL, '2025-07-14 02:02:11', '2025-07-14 02:02:11', NULL, NULL),
(251, 'Md. Mizanur Rahman Patwary', 'nilu_mizan@yahoo.com', NULL, '01715124176', NULL, NULL, '$2y$12$gnroGL8D.1c4mPyryX/xW.FSntU9/GN9ARFgmwoBgeDknw7K69geS', 'user', 1, NULL, 0, NULL, '2025-07-14 02:11:45', '2025-07-14 02:11:45', NULL, NULL),
(252, 'Md. Shofiqul Alam', 'nipunep@gmail.com', NULL, '01819199880', NULL, NULL, '$2y$12$OBp2Xnogu02rZ9IWgwLj4.V95KlW5AqqLA9oqNI5kW0TqA87TUQLO', 'user', 1, NULL, 0, NULL, '2025-07-14 02:15:03', '2025-07-14 02:15:03', NULL, NULL),
(253, 'Wahid Ahmed', 'wahid.ahmed@parkscenebd.com', NULL, '01711560633', NULL, NULL, '$2y$12$m8315YEaMxuAgjJq6rbVUOskXXLIL/CAwfTnmVcIajsDKUdEcSsXS', 'user', 1, NULL, 0, NULL, '2025-07-14 02:18:31', '2025-07-14 02:18:31', NULL, NULL),
(254, 'Nerup Kumar Saha', 'pr.embroidery2010@gmail.com', NULL, '01972158960', NULL, NULL, '$2y$12$QXI7uU3Di9nU8EYljfVAoua5.a5dagLg/AeDCBCjbAWFGoJg/rT86', 'user', 1, NULL, 0, NULL, '2025-07-14 03:17:02', '2025-07-14 03:17:02', NULL, NULL),
(255, 'Md. Kamruzzaman Milon', 'info@peacockdesign.net', NULL, '01713004734', NULL, NULL, '$2y$12$HKNEGxMzmrEct0uxRdUvw./ZuJNpYxIDJDU5laFja9SRIlO1ZpfAm', 'user', 1, NULL, 0, NULL, '2025-07-14 03:20:53', '2025-07-14 03:20:53', NULL, NULL),
(256, 'Mizanur Rahman', 'prashank1995@yahoo.com', NULL, '01711542475', NULL, NULL, '$2y$12$SfQE91NaOzBwl3lWeYhCOOzdROrikyRFOQZZSjTOr8UtLWFVxQ3nu', 'user', 1, NULL, 0, NULL, '2025-07-14 03:28:07', '2025-07-14 03:28:07', NULL, NULL),
(257, 'Shoeb Ahmed', 'perfect.shoeb@gmail.com', NULL, '01794341902', NULL, NULL, '$2y$12$D0glC/bxYMd0.qZGTs1ym.B5AAE5A5NKRwLHuqJyrS03QK1XnxAJu', 'user', 1, NULL, 0, NULL, '2025-07-14 03:36:59', '2025-07-14 03:36:59', NULL, NULL),
(258, 'Md. Emam Hossain', 'emam@quaisgarments.com', NULL, '01711463486', NULL, NULL, '$2y$12$Scl2jKVuGh9RDwaKvKUzN.ESxw0t4LIl.JwzCX4uqvHJMDoC3IElK', 'user', 1, NULL, 0, NULL, '2025-07-14 03:41:30', '2025-07-14 03:41:30', NULL, NULL),
(259, 'Md. Ramzan Ali', 'rkfashion@gmail.com', NULL, '01914605421', NULL, NULL, '$2y$12$EY6A0XCsZ.NF4ZWqOS2Kbew4gKfnBG0rcNtGB2cJqvJNRR7UVTi9.', 'user', 1, NULL, 0, NULL, '2025-07-14 04:00:54', '2025-07-14 04:00:54', NULL, NULL),
(260, 'Md. Liton Sikder', 'rsdesign.fashion@yahoo.com', NULL, '01720098140', NULL, NULL, '$2y$12$a94u8Uce1TUVRU2K/aG0k.15.UKl1nmLB2I2pyRWNTV4cDpvyUbbi', 'user', 1, NULL, 0, NULL, '2025-07-14 04:05:56', '2025-07-14 04:05:56', NULL, NULL),
(261, 'A.K.M Kamruzzaman', 'rk.embro@yahoo.com', NULL, '01819283750', NULL, NULL, '$2y$12$/4nslDI6Z5SyYbrG73n9guFkjMIjd6bc/0/zXY5/ejVytLQkAuQHi', 'user', 1, NULL, 0, NULL, '2025-07-14 04:19:32', '2025-07-14 04:19:32', NULL, NULL),
(262, 'R.K. Fashions', 'rkfashions.bd25@gmail.com', NULL, '01847056098', NULL, NULL, '$2y$12$m/BwvoOQxjQrgvoxB9YKruVvSyVf2IgzqS9xglo5lyxv/5Dd6pxMS', 'user', 1, NULL, 0, NULL, '2025-07-14 04:24:19', '2025-07-14 04:24:19', NULL, NULL),
(263, 'Md. Fakhrul Islam', 'fakhrulislam27@yahoo.com', NULL, '01612584294', NULL, NULL, '$2y$12$E1/oHaSXluAQm3PyYBJzqODrCyFJc9Q5Kj3wY2WukRDcYzYeGc7BS', 'user', 1, NULL, 0, NULL, '2025-07-14 04:29:52', '2025-07-14 04:29:52', NULL, NULL),
(264, 'Md. Kamrul Hossen Sarker', 'kamal_sarker@hotmail.com', NULL, '01630463600', NULL, NULL, '$2y$12$cfrysZwyUvxCeTvNVjSvXuq4VCZSi1wopjb4eSvGwCPDrEOo3cvqO', 'user', 1, NULL, 0, NULL, '2025-07-14 04:36:35', '2025-07-14 04:36:35', NULL, NULL),
(265, 'Syed Saiful Shihab', 'shihab@raimentapparels.com', NULL, '01819292260', NULL, NULL, '$2y$12$QLiSIkVIC3tTUUucchQAoedGzUoAGqCj7IZnJZOoEZ2LMmHkXKbZu', 'user', 1, NULL, 0, NULL, '2025-07-14 04:59:05', '2025-07-14 04:59:05', NULL, NULL),
(266, 'Resaul Karim Chowdhury Popy', 'rnppopy@yahoo.com', NULL, '01819224240', NULL, NULL, '$2y$12$bn6a73g.57JA2/Ahr20zG.o/ODvtsRwQ9VXOEorg.5hvaijdVNCT6', 'user', 1, NULL, 0, NULL, '2025-07-14 05:03:21', '2025-07-14 05:03:21', NULL, NULL),
(267, 'Md. Fakhrul Alam', 'm.f.a.shimul@gmail.com', NULL, '01817585060', NULL, NULL, '$2y$12$NVVQNBAF0LR/evvtSdIpt.Wl00KVYXsUhgQ/AO27sKTnDamFy4dHG', 'user', 1, NULL, 0, NULL, '2025-07-14 05:19:40', '2025-07-14 05:19:40', NULL, NULL),
(268, 'Rafiqul Alam Helal', 'ralam@ramsfashion.com', NULL, '01713047708', NULL, NULL, '$2y$12$/H02Pgl6OioSW4OZcz4.xOCmjOxMEx.0hIf9oCs1rdp1oY1mCRvt.', 'user', 1, NULL, 0, NULL, '2025-07-14 05:25:24', '2025-07-14 05:25:24', NULL, NULL),
(269, 'Narayan Karmaker', 'regaindf@yahoo.com', NULL, '01731694277', NULL, NULL, '$2y$12$dibIKYq09nzvO/mpr5U3P.wIFEI.oU9htqZn718Q.iSnoTiOKi.36', 'user', 1, NULL, 0, NULL, '2025-07-14 05:31:12', '2025-07-14 05:31:12', NULL, NULL),
(270, 'Md. Amir Hossain Salim', 'hossainfashion@yahoo.com', NULL, '01715111887', NULL, NULL, '$2y$12$Uz4GMQfAg95.AzYlYc.grOEodS3xGFAlvmDee.i6efo1B25lPKgPq', 'user', 1, NULL, 0, NULL, '2025-07-14 05:35:30', '2025-07-14 05:35:30', NULL, NULL),
(271, 'Md. Aminur Rahman (Swapon)', 'swapon100@gmail.com', NULL, '01819262056', NULL, NULL, '$2y$12$MbOQws9c7TxryWY/scT9N.MOjD9JHjrTzNbTuiPTtRtfOFPgz9AYi', 'user', 1, NULL, 0, NULL, '2025-07-14 05:38:21', '2025-07-14 05:38:21', NULL, NULL),
(272, 'Bulbul Kumar Roy', 'rodfemb@yahoo.com', NULL, '01715542704', NULL, NULL, '$2y$12$zvK0u93fWQAcLsd3WwW3IORlNKOdAxDr3Fy.YBKvixE7RpsrKsJUW', 'user', 1, NULL, 0, NULL, '2025-07-14 05:42:13', '2025-07-14 05:42:13', NULL, NULL),
(273, 'Md. Ahtasur Rahman (Shanto)', 'royalbdfashion@gmail.com', NULL, '01916858825', NULL, NULL, '$2y$12$UdQKz46qjZTSqaU9FsrIy.xPfq8RGHPyEKgCMQhLvnwwIE9OH1JBi', 'user', 1, NULL, 0, NULL, '2025-07-14 05:49:12', '2025-07-14 05:49:12', NULL, NULL),
(274, 'Md. Ibrahim Khalil', 'royelembroidery@gmail.com', NULL, '01719755190', NULL, NULL, '$2y$12$GwFBrF08LxXVgX3mrmnJOOu2BYkiSERoxoNpirILyC7COHdUNYgym', 'user', 1, NULL, 0, NULL, '2025-07-14 05:53:39', '2025-07-14 05:53:39', NULL, NULL),
(275, 'S.M Alauddin Ahmed', 'smalauddinahamed@yahoo.com', NULL, '01973215225', NULL, NULL, '$2y$12$mUpIkcpx4MIubUKRdjcuqeOhh6BYx7Kxozim0XUimb01jthkzRRle', 'user', 1, NULL, 0, NULL, '2025-07-14 05:59:18', '2025-07-14 05:59:18', NULL, NULL),
(276, 'Ahsan Habib   Dulal', 'sndd67@gmail.com', NULL, '01713002867', NULL, NULL, '$2y$12$8JVykRv63tugzqtoIIJlleluxQxi4yKzvLGF49XiIWEY3aj40/eC6', 'user', 1, NULL, 0, NULL, '2025-07-14 06:03:01', '2025-07-14 06:03:01', NULL, NULL),
(277, 'Md. Akhter Hossain', 'akbar.snpd@gmail.com', NULL, '01911402114', NULL, NULL, '$2y$12$PKZMynf.vom02AUcIoa8vOppoVntf2thwy.QXTYHp94h6lvZ0cjSK', 'user', 1, NULL, 0, NULL, '2025-07-14 06:07:58', '2025-07-14 06:07:58', NULL, NULL),
(278, 'Md. Abu Sayed Khan', 'sm_inter2010@yahoo.com', NULL, '01740957875', NULL, NULL, '$2y$12$efzbMfUT5bCtePxpaSba/.U1Ezu71faxYxQU5zqfkycFoCVgmdjSu', 'user', 1, NULL, 0, NULL, '2025-07-14 06:11:52', '2025-07-14 06:11:52', NULL, NULL),
(279, 'Md. Shafiqul Islam', 'sabizbd@yahoo.com', NULL, '01713075620', NULL, NULL, '$2y$12$NvQh0..buStOw/u0UkSLQeEvpEGoVkDEZrwP3.lfNWpcN8i.B5kKO', 'user', 1, NULL, 0, NULL, '2025-07-14 06:15:36', '2025-07-14 06:15:36', NULL, NULL),
(280, 'Asi Uddin Sarker Khokon', 'sadiafashion134@gmail.com', NULL, '01733710258', NULL, NULL, '$2y$12$cIzyldyqWXBG9D0BH7qBnehpVJ7xJsrLcVEogyjJVSgtbfRbDR6UG', 'user', 1, NULL, 0, NULL, '2025-07-14 06:19:48', '2025-07-14 06:19:48', NULL, NULL),
(281, 'Md. Kawsar Alam (Kazol)', 'safiafashiondesign@yahoo.com', NULL, '01714219524', NULL, NULL, '$2y$12$d96AUh57eiU4NiohniP0W.1BY3QSW5g31LEQSj55f327s2kdFqLzW', 'user', 1, NULL, 0, NULL, '2025-07-14 06:25:01', '2025-07-14 06:25:01', NULL, NULL),
(282, 'Md. Shamim', 'samanthaembroidery@yahoo.com', NULL, '01716892027', NULL, NULL, '$2y$12$ztnscmnvqjoIavvQhQtHH.Ry8FRrHb7kdivbTrBmTrl6Q8NswhQkK', 'user', 1, NULL, 0, NULL, '2025-07-14 06:31:33', '2025-07-14 06:31:33', NULL, NULL),
(283, 'Alhaj Abdul Aziz Dewan', 'samsembr@gmail.com', NULL, '01715019555', NULL, NULL, '$2y$12$4T16.UMQD6aep7XSgD9rduYRvn5UyyETJ0Kd1x.tv5DILOtgJVcNi', 'user', 1, NULL, 0, NULL, '2025-07-14 06:35:36', '2025-07-14 06:35:36', NULL, NULL),
(284, 'Abdul Basit', 'bst_sarah@yahoo.com', NULL, '01316172528', NULL, NULL, '$2y$12$DSBThKTT4Ru9IOFdz59m9.2JZjEseShZaj015irtW1lZC/KR2byGa', 'user', 1, NULL, 0, NULL, '2025-07-14 06:41:54', '2025-07-14 06:41:54', NULL, NULL),
(285, 'Kamruzzaman Sikder (Babul)', 'albi_sayememb@yahoo.com', NULL, '01726705265', NULL, NULL, '$2y$12$p7voBNfybtRrZylKh.K1XOcx037ADwD63GvDBrXvs0ldd0eTtyk0a', 'user', 1, NULL, 0, NULL, '2025-07-14 06:47:49', '2025-07-14 06:47:49', NULL, NULL),
(286, 'Mustaeem Billah Chowdhury', 'info@regreenbangla.com', NULL, '01717828450', NULL, NULL, '$2y$12$dfJcLrnLulkOq0E2tRfb6u4U2FWfsQBFvL6L4bsIas7KnQG/4MB8a', 'user', 1, NULL, 0, NULL, '2025-07-14 06:52:41', '2025-07-14 06:52:41', NULL, NULL),
(287, 'Ahmadul Hasan', 'sadeshiuddog96@gmail.com', NULL, '01711034936', NULL, NULL, '$2y$12$28vCeAjzKhoM2QSlD8pcpO/bV0xTVSFXJ.gZGFUkfI0J34kBZRKq.', 'user', 1, NULL, 0, NULL, '2025-07-14 06:56:46', '2025-07-14 06:56:46', NULL, NULL),
(288, 'Md. Rafiqul Islam Mridha', 'shawon_fashion@yahoo.com', NULL, '01718715345', NULL, NULL, '$2y$12$fL7V2h4xrle5MAwcvTufDuxefEslpDEWyPtHQa.dWARqfiXEj6WAq', 'user', 1, NULL, 0, NULL, '2025-07-14 07:01:30', '2025-07-14 07:01:30', NULL, NULL),
(289, 'Md. Abdur Rob', 'shotataareefashion@gmail.com', NULL, '01720068690', NULL, NULL, '$2y$12$uvjscypZSKhMXPELWZ8Qb.yAhAeVuW2uMCwoBYxgLE16g2rNtkss.', 'user', 1, NULL, 0, NULL, '2025-07-14 07:04:40', '2025-07-14 07:04:40', NULL, NULL),
(290, 'Md. Mizanur Rahman', 'sikderemb1@gmail.com', NULL, '01731156248', NULL, NULL, '$2y$12$A.6703xKaQL3g6Z4c7Ta1uHMe.RKZqY8IsXSV5ZIWeHvWGEpz5nLe', 'user', 1, NULL, 0, NULL, '2025-07-14 07:08:14', '2025-07-14 07:08:14', NULL, NULL),
(291, 'Md. Abul kalam Azad', 'azad@maxlfeets.com', NULL, '01713081208', NULL, NULL, '$2y$12$Q0gvoDuvk5gisgr1HNH.5exk0ju./MnmIWtMUyex9L2WqwviYmdkm', 'user', 1, NULL, 0, NULL, '2025-07-14 07:15:12', '2025-07-14 07:15:12', NULL, NULL),
(292, 'Nooruddin Chowdhury Manik', 'manikc30@yahoo.com', NULL, '01819253276', NULL, NULL, '$2y$12$8hhK0ssbCOSISa6oApZP4eVZU1NNir0w7mKn1KPF1OSLleZJxVGM6', 'user', 1, NULL, 0, NULL, '2025-07-14 07:20:21', '2025-07-14 07:20:21', NULL, NULL),
(293, 'Md. Rafiqul Islam (Shamim)', 'sikderemb02@gmail.com', NULL, '01923707749', NULL, NULL, '$2y$12$W8AJ7Kc4ggk.Rf8xtBkC7OR9nII3OZaTVJ8mu9LlnDK4psv9d9Slm', 'user', 1, NULL, 0, NULL, '2025-07-14 07:25:04', '2025-07-14 07:25:04', NULL, NULL),
(294, '* * * Unlock Free Spins Today: https://nhatnambds.com/index.php?bjg3ou * * * hs=29eb72db26595fb4bfc6e21ca8bf3b84* ххх*', 'pazapz@mailbox.in.ua', NULL, '916096606909', NULL, NULL, '$2y$12$eew28PqU1KvMQYeSllB.U.XDmst9mW55hT1cVdKrdOT.XdtpaVUaa', 'user', 1, NULL, 0, NULL, '2025-07-14 19:31:21', '2025-07-14 19:31:21', NULL, NULL),
(295, 'Md. shahidul Islam', 'srembroidery@gmail.com', NULL, '01716907437', NULL, NULL, '$2y$12$PX5ErlRsMiFEWGR4OFZnyOeZGaoLkxvgr.2ItzVFm8sb03kc0QY9S', 'user', 1, NULL, 0, NULL, '2025-07-14 23:17:58', '2025-07-14 23:17:58', NULL, NULL),
(296, 'Nafiees Muntasir khan', 'nafees@gearsgroup.com.bd', NULL, '01817140709', NULL, NULL, '$2y$12$WGstAxNXDIfo7i0aDu4yVOEcrKzl8R4LHxps9cqcwel/Wi2307cYm', 'user', 1, NULL, 0, NULL, '2025-07-14 23:25:15', '2025-07-14 23:25:15', NULL, NULL),
(297, 'A.K.M. Al Mamun', 'sonarbanglaemb@yahoo.com', NULL, '01711892363', NULL, NULL, '$2y$12$Ucw9clDVbbRpnHN/7mAZAutPtuZFK3Gm8NHvCC/ghr0k57V0Q0Wv.', 'user', 1, NULL, 0, NULL, '2025-07-14 23:31:31', '2025-07-14 23:31:31', NULL, NULL),
(298, 'Mehedi Hassan', 'mehedi89hassan@gmail.com', NULL, '01721005335', NULL, NULL, '$2y$12$R.kwOd2jxQRjYFv7fopwSOnBIpNcYvmiYBEuk1I6CqJO1XhJfLfkS', 'user', 1, NULL, 0, NULL, '2025-07-14 23:32:06', '2025-07-14 23:32:06', NULL, NULL),
(299, 'Chi Bin Kim', 'smembroiderybd@gmail.com', NULL, '01711549746', NULL, NULL, '$2y$12$xR4KjWTlYJKsE82vCX221.2MaoKlS2ejSFqar.OEyWF75ipkzjexO', 'user', 1, NULL, 0, NULL, '2025-07-14 23:36:39', '2025-07-14 23:36:39', NULL, NULL),
(300, 'Dr. S. Ainul Haque', 'sumaiyalace@gmail.com', NULL, '01678002555', NULL, NULL, '$2y$12$QarI0sDDF1g7AxOYRS6LT.nIn35bL5b60Hp/ItCNSvODPLK/.q5eu', 'user', 1, NULL, 0, NULL, '2025-07-14 23:58:30', '2025-07-14 23:58:30', NULL, NULL),
(301, 'Mrs. Anoara Akhan (Liza)', 'sundasaccessories2005@gmail.com', NULL, '01715008621', NULL, NULL, '$2y$12$Bx/UupzFBHi39rSwV/jteuceF1xKhGrJj2sMFhEakph1f8SxiLKFS', 'user', 1, NULL, 0, NULL, '2025-07-15 00:05:44', '2025-07-15 00:05:44', NULL, NULL),
(302, 'Syed Enamul Hoque', 'info@sunyanbd.net', NULL, '01713020577', NULL, NULL, '$2y$12$5aF/Ruf3FSBoaV7MIp/juehXGuJJsWVsvYCZPCtr5Hs.PxkgzUtSa', 'user', 1, NULL, 0, NULL, '2025-07-15 00:16:49', '2025-07-15 00:16:49', NULL, NULL),
(303, 'Md. Nurul Islam', 'info@ssfbdl.com', NULL, '01711567878', NULL, NULL, '$2y$12$zi5kyc5rrabtonVH9Ox1ge7OsT3US9DrhiZFWWCVUAfRoyGB9DA7S', 'user', 1, NULL, 0, NULL, '2025-07-15 00:23:32', '2025-07-15 00:23:32', NULL, NULL),
(304, 'Mukhlesur Rahman', 'nrgroup@global-bd.net', NULL, '01712229268', NULL, NULL, '$2y$12$M2NfcbZCiPD7AMn0uObMnOo6EjbehVeYUgOQnlKrs95yCqxPk7rm6', 'user', 1, NULL, 0, NULL, '2025-07-15 00:37:41', '2025-07-15 00:37:41', NULL, NULL),
(305, 'Minhaj Mukul', 'minhajmukul@yahoo.com', NULL, '01715400939', NULL, NULL, '$2y$12$85aV2JIlM3M06zWPBS8FC.P60Da7u2oHf/tROf.MaA2fmUQdwcc/C', 'user', 1, NULL, 0, NULL, '2025-07-15 00:41:32', '2025-07-15 00:41:32', NULL, NULL),
(306, 'Md. Masud Rana', 'safinfashion2010@gmail.com', NULL, '01790508888', NULL, NULL, '$2y$12$EfJO64aq1W9ckjT6PRtKruyCQmbv7fPe0w7RvwTKMUK1deysj1Oo.', 'user', 1, NULL, 0, NULL, '2025-07-15 00:51:27', '2025-07-15 00:51:27', NULL, NULL),
(307, 'Md. Shohel Siddiq', 'shohelmo@gmail.com', NULL, '01798303040', NULL, NULL, '$2y$12$zx4RtLk4pcPLISHYSS3yjul6O5pMylnZETzIYKUuV0mRryuJv6ORW', 'user', 1, NULL, 0, NULL, '2025-07-15 00:59:03', '2025-07-15 00:59:03', NULL, NULL),
(308, 'Nurul Islam', 'habib.inctl@gmail.com', NULL, '01711801271', NULL, NULL, '$2y$12$8NJZ7t7I./Qb0uQngJyz4OoGCuKRmimGYlZ5mQSgwMcUgArlSon2.', 'user', 1, NULL, 0, NULL, '2025-07-15 01:14:19', '2025-07-15 01:14:19', NULL, NULL),
(309, 'Shahnawaz Mahmood', 'tensy@yahoo.com', NULL, '01711978485', NULL, NULL, '$2y$12$aBXegZ3VicDZ72fk/cq8COwtj4uOx/npTXRphwy70aX571JzMUdwa', 'user', 1, NULL, 0, NULL, '2025-07-15 01:20:24', '2025-07-15 01:20:24', NULL, NULL),
(310, 'Md. Milon  Shikder', 'millonshikder095@gmail.com', NULL, '01726076288', NULL, NULL, '$2y$12$jaTGX4hgoE/NueUO8pGSTepz1losuJgOdqEZyomZ4rqE/N5EkASqK', 'user', 1, NULL, 0, NULL, '2025-07-15 01:26:50', '2025-07-15 01:26:50', NULL, NULL),
(311, 'Syed Mahfooz  Ali', 'linkers1993@yahoo.com', NULL, '01711544675', NULL, NULL, '$2y$12$i5JUibLaVEYlBBO4YsYVxuUnwcrUYwG.BLvLymFltEQnq1xGFa0eO', 'user', 1, NULL, 0, NULL, '2025-07-15 01:34:19', '2025-07-15 01:34:19', NULL, NULL),
(312, 'Md. Liton Bhuiyan', 'tishafashiondk@gmail.com', NULL, '01711715216', NULL, NULL, '$2y$12$PVSf1IVQc3HKhDEwM6VCtOotoONvcPWKbYXsOdSDuppt6nGXVqla.', 'user', 1, NULL, 0, NULL, '2025-07-15 01:41:01', '2025-07-15 01:41:01', NULL, NULL),
(313, 'Md. Selim Reza', 'topspeedbd@gmail.com', NULL, '01819221520', NULL, NULL, '$2y$12$EG/PA57o3iSz3SYSgBh3jOEH6y61tYhPy7NZleDkMVmDAzWdBcdwK', 'user', 1, NULL, 0, NULL, '2025-07-15 01:47:57', '2025-07-15 01:47:57', NULL, NULL),
(314, 'Md. Golam Zabbar (Sonnet)', 'sonnet3s@yahoo.com', NULL, '01819259860', NULL, NULL, '$2y$12$aA1S7hHGcusP2AqKkCRXfOESmf0dRjjFq3KKEmxIiQJVIXWo0RQWO', 'user', 1, NULL, 0, NULL, '2025-07-15 01:53:25', '2025-07-15 01:53:25', NULL, NULL),
(315, 'Md. Faruk', 'qniquefashion1972@gmail.com', NULL, '01685336731', NULL, NULL, '$2y$12$U3i9mZjImS26pJdCF93mD.vaa0pNMvbANCINid.CMxbrcEFKSiB3.', 'user', 1, NULL, 0, NULL, '2025-07-15 01:58:09', '2025-07-15 01:58:09', NULL, NULL),
(316, 'Md. Ishaqu-Ur-Rahman', 'ishaq003@gmail.com', NULL, '01612300123', NULL, NULL, '$2y$12$zEgje04YFYFEwc63MmxBduX3pcPg1jLDOH4LINDZfOfnn9Om/7lL2', 'user', 1, NULL, 0, NULL, '2025-07-15 02:57:09', '2025-07-15 02:57:09', NULL, NULL),
(317, 'Syed Shariful Islam Ponir', 'wellembo@gmail.com', NULL, '01819401894', NULL, NULL, '$2y$12$JMCFFwd6V4iAuzh.DPtA7uT.EiAg1JPKo8GczCw2orcBtI6F5KLiG', 'user', 1, NULL, 0, NULL, '2025-07-15 03:15:23', '2025-07-15 03:15:23', NULL, NULL),
(318, 'Md. Nazrul Islam', 'yestexltd@gmail.com', NULL, '01711529182', NULL, NULL, '$2y$12$p/kJywZWqdJpB5auZtVHeOhwBFkVgC4hn36hJmME6x3qWBFaN44RO', 'user', 1, NULL, 0, NULL, '2025-07-15 03:25:48', '2025-07-15 03:25:48', NULL, NULL),
(319, 'Zashim Uddin Khan', 'zara@zaragroupbd.com', NULL, '01713460607', NULL, NULL, '$2y$12$/nE0ReRJCiXAe5aQD0l49O9sy245U2G8Z.Tyv3u8ODnVHZj4su/vW', 'user', 1, NULL, 0, NULL, '2025-07-15 03:32:21', '2025-07-15 03:32:21', NULL, NULL),
(320, 'Md. Gulzer Hossain', 'shibber@worldvictorybd.com', NULL, '01796633040', NULL, NULL, '$2y$12$0Yz6sAWGlzKkzlKkn6m8QOFmLWyv7hUEIweMN70gLjK0lv4flCFPG', 'user', 1, NULL, 0, NULL, '2025-07-15 03:39:41', '2025-07-15 03:39:41', NULL, NULL),
(321, 'Kaisar Ahmed', 'asiaiticn2wd@hotmail.com', NULL, '01715416657', NULL, NULL, '$2y$12$hvAZCOr3WTwUviopnYkOQOXOlVzHGNObaxmiA0SpbMUnxxvSHjORC', 'user', 1, NULL, 0, NULL, '2025-07-15 04:53:10', '2025-07-15 04:53:10', NULL, NULL),
(322, 'MD sobujrana', 'sobujrana874@gmail.com', NULL, '01881807215', NULL, NULL, '$2y$12$4qS/Av7LsvFjgF0gPE4Q4.zQYYbET379y666nmD4aGbHPSGx4AsBi', 'user', 1, NULL, 0, NULL, '2025-07-15 05:21:31', '2025-07-15 05:21:31', NULL, NULL),
(323, 'Md. Monir Chowdhury', 'monirswf11@gmail.com', NULL, '01712539522', NULL, NULL, '$2y$12$sN2C6uZdSTeBuMUqqo2yqu01YfEFUW0nOUMZDGXfa7AJHjkRRFwT.', 'user', 1, NULL, 0, NULL, '2025-07-15 05:29:40', '2025-07-15 05:29:40', NULL, NULL),
(324, 'Md. Khokon', 'bkctradingbd@gmail.com', NULL, '01761159564', NULL, NULL, '$2y$12$qWZ.jRcQHKKAeOlo3GGE3u0tuxxQYBHO.WT7JDigl3HrEO2vbw8mO', 'user', 1, NULL, 0, NULL, '2025-07-15 05:45:13', '2025-07-15 05:45:13', NULL, NULL),
(325, 'Mohammad Mizanur Rahman', 'shahaali007@yahoo.com', NULL, '01712111902', NULL, NULL, '$2y$12$YoawcNzaWyB3LraCfcBRh.YeHGJY79Rxbl643iUWlLsJ.72s6p5bm', 'user', 1, NULL, 0, NULL, '2025-07-15 06:00:45', '2025-07-15 06:00:45', NULL, NULL),
(326, 'M.S.I Chowdhury', 'mufrad2003@yahoo.com', NULL, '01720017300', NULL, NULL, '$2y$12$k1gyQ1t51rAqm8mT5w.5BeysgYeYQIKYKD0Pmyf4a/dEyqQ4mxOle', 'user', 1, NULL, 0, NULL, '2025-07-15 06:06:18', '2025-07-15 06:06:18', NULL, NULL),
(327, 'Md. Ahtasur Rahman (Shanto)', 'royalbdsequin@gmail.com', NULL, '01712536460', NULL, NULL, '$2y$12$RlQJqszM5zMVDxpkoedKd.eWPnf9B3MdNOiR7oRmi6hchAGA/SCxS', 'user', 1, NULL, 0, NULL, '2025-07-15 06:11:16', '2025-07-15 06:11:16', NULL, NULL),
(328, 'Md. Sarwar Khaiyam Khan (Shaon)', 'info@saafibd.com', NULL, '01714071290', NULL, NULL, '$2y$12$RUSjsgzANLyG/AS76/OI0OR9JVP9XcuJr20981k72HCaGfzmgPmaq', 'user', 1, NULL, 0, NULL, '2025-07-15 06:17:15', '2025-07-15 06:17:15', NULL, NULL),
(329, 'Md. Alauddin', 'siam13traders@gmail.com', NULL, '01680465738', NULL, NULL, '$2y$12$53S.XPSf/K8do3YB5sdymuiNZwHRAXumn6y5zk5gF0RPKEpB/ns1K', 'user', 1, NULL, 0, NULL, '2025-07-15 06:23:25', '2025-07-15 06:23:25', NULL, NULL),
(330, 'Md. Ruhul Amin', 'visiontradeint@gmail.com', NULL, '01774759300', NULL, NULL, '$2y$12$xkHr9EyTiQd3fVWSFP7nEeaAbUPiumMGGDF31K3uN/HW42R.REa5u', 'user', 1, NULL, 0, NULL, '2025-07-15 06:27:00', '2025-07-15 06:27:00', NULL, NULL),
(331, 'sYUEJJYaPotNig', 'axuhasey836@gmail.com', NULL, '5855687268', NULL, NULL, '$2y$12$yIXsouLlUta/MSIXYzGGlu23tlbHCsLKZ86B613NglYWehfTZwgBu', 'user', 1, NULL, 0, NULL, '2025-07-15 07:26:09', '2025-07-15 07:26:09', NULL, NULL),
(332, 'WbAuPzOn', 'penneygrady1983@yahoo.com', NULL, '9100577817', NULL, NULL, '$2y$12$5dEseuEwgqFjvUGfalZVxeA.BIt46fJDIr97ufoNqy9fc918iy2Za', 'user', 1, NULL, 0, NULL, '2025-07-15 18:50:12', '2025-07-15 18:50:12', NULL, NULL),
(333, 'evoilkru', 'cyngbynr@gmail.com', NULL, NULL, NULL, NULL, '$2y$12$rqcFECzGHCk.P.lCi24BBe2GcTJzrYIZgkPbGWrdZN1l7Xb4jcIKe', 'user', 1, NULL, 0, NULL, '2025-07-15 19:19:52', '2025-07-15 19:19:52', NULL, NULL),
(334, 'Md. Ripon Sheik', 'ripon.tajima@gmail.com', NULL, '01911917565', NULL, NULL, '$2y$12$R8eIGO7OwSJ.8ySjhooe3.iMQUAzQeEQu6jEocitATTqv9sFZ4B0e', 'user', 1, NULL, 0, NULL, '2025-07-15 22:20:57', '2025-07-15 22:20:57', NULL, NULL),
(335, 'Delowar Hossain', 'rejaulrp300@gmail.com', NULL, '01985241396', NULL, NULL, '$2y$12$mklLJHzMYO4zOYBBK04VLesg6bVMuEAwRH4RVGxvyVm.2a1PlYg4m', 'user', 1, NULL, 0, NULL, '2025-07-15 22:41:29', '2025-07-15 22:41:29', NULL, NULL),
(336, 'Ruhul Amin Mia', 'sbrtrade2019@gmail.com', NULL, '01712239625', NULL, NULL, '$2y$12$jdNWU1FyfOK4qCk1LsIBHOCZnXvRUvqwl0AQm./BFWSFFcimW1Kmi', 'user', 1, NULL, 0, NULL, '2025-07-15 22:46:29', '2025-07-15 22:46:29', NULL, NULL),
(337, 'Md. Abdur Rahim Bhyain', 'arahim21@gmail.com', NULL, '01713370622', NULL, NULL, '$2y$12$KtoAiMy2.YDBkTj/AaLDtOAT9gCaWvm4mMs9zhBkmht3ePNd7ZpuS', 'user', 1, NULL, 0, NULL, '2025-07-15 22:53:00', '2025-07-15 22:53:00', NULL, NULL),
(338, 'Md. Rezaul Karim', 'riadembroidery@gmail.com', NULL, '01750180340', NULL, NULL, '$2y$12$sT9SlYD8eL2b5vqcxksTHed3zxVUJb2s2tinfGvK40Zubt6KcJ1ii', 'user', 1, NULL, 0, NULL, '2025-07-15 23:52:53', '2025-07-15 23:52:53', NULL, NULL),
(339, 'S.M Refaeatul Islam', 'rshasorcing@yahoo.com', NULL, '01713045576', NULL, NULL, '$2y$12$GZxzu5TNKYWR0Z5yOQGXM.D9M1P7Z/WpPDjpySsUys0U1uijnpGui', 'user', 1, NULL, 0, NULL, '2025-07-15 23:56:07', '2025-07-15 23:56:07', NULL, NULL),
(340, 'Ritu Akter', 'rezasalimzzz1000@gmail.com', NULL, '01968544878', NULL, NULL, '$2y$12$tlYTRclTIPsIpt30ffn67.Ko0iyY8ttOvhMBeol1EYujwDbMnI/BC', 'user', 1, NULL, 0, NULL, '2025-07-15 23:59:33', '2025-07-15 23:59:33', NULL, NULL),
(341, 'Md. Monirul Islam', 'iqra.phitexbd@gmail.com', NULL, '01771940119', NULL, NULL, '$2y$12$xORw5S389FYJY12T9sKrR.FJlviE.rLIy4xMx2pjsibnZ50tATJxm', 'user', 1, NULL, 0, NULL, '2025-07-16 00:20:30', '2025-07-16 00:20:30', NULL, NULL),
(342, 'Md. Mazidul Islam', 'r.nfashion52@gmail.com', NULL, '01723032708', NULL, NULL, '$2y$12$4aggpCaeYju64Cac13JH9u8lHah.MmmdHk/gB7dalmZM/BqNDCkga', 'user', 1, NULL, 0, NULL, '2025-07-16 00:25:04', '2025-07-16 00:25:04', NULL, NULL),
(343, 'Md. Ali Akbar', 'aliakber01717@gmail.com', NULL, '01717178753', NULL, NULL, '$2y$12$YYH5DUVlflcvj/hYFyTmoui9sknGOR4K3tE2GfoQI.U6wBW5P6wRq', 'user', 1, NULL, 0, NULL, '2025-07-16 00:29:28', '2025-07-16 00:29:28', NULL, NULL),
(344, 'Nazrul Islam', 'ni400624@gmail.com', NULL, '01839336190', NULL, NULL, '$2y$12$0pW6KWw4UV5Kz7HTXLs0DuaxREXIjAWzIiUx2W0eG5vUbVyEKdMzW', 'user', 1, NULL, 0, NULL, '2025-07-16 00:32:50', '2025-07-16 00:32:50', NULL, NULL);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `mobile_number`, `mobile_number_verified_at`, `address`, `password`, `type`, `can_login`, `profile_picture`, `is_admin`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `profile_photo_path`) VALUES
(345, 'Md. Mazammel Hossain', 'almahfujtraders@gmail.com', NULL, '01912104015', NULL, NULL, '$2y$12$SCe3baPzmd4GqdEbBweLw.uAKG4SUzuH.gTXxse8.WUZGsn2hWVpy', 'user', 1, NULL, 0, NULL, '2025-07-16 00:40:17', '2025-07-16 00:40:17', NULL, NULL),
(346, 'kazi Aminul Islam', 'aminulepw@gmail.com', NULL, '01677555420', NULL, NULL, '$2y$12$hQygZbDtj0qD9waQ9NfuM.FZDKzle2X9bdWxDTeQznAgskfaAjX6W', 'user', 1, NULL, 0, NULL, '2025-07-16 00:44:20', '2025-07-16 00:44:20', NULL, NULL),
(347, 'Md. Khairul Islam', 'aktstitchanddesign@gmail.com', NULL, '01715364341', NULL, NULL, '$2y$12$Do.J5H54oVmJTtvyzE/HNOrXTPCmoBTjCjDv4muCMX3Z2wvDg2ode', 'user', 1, NULL, 0, NULL, '2025-07-16 00:53:43', '2025-07-16 00:53:43', NULL, NULL),
(348, 'Md. Parvez Alam', 'mdsamirkhan2464@gmail.com', NULL, '01789672147', NULL, NULL, '$2y$12$SZccQ.ZbS7zsNHfpwb9BUeXKS.6mHsOEhmM8mwq4425weqVUrCeme', 'user', 1, NULL, 0, NULL, '2025-07-16 00:57:43', '2025-07-16 00:57:43', NULL, NULL),
(349, 'eMjOaQowQQ', 'abapoyaqubu39@gmail.com', NULL, '9222390374', NULL, NULL, '$2y$12$pDVAfC8jdfxysgYSIn70DeoFYicWOqniuXGxYCw0WYPFdWoykewB2', 'user', 1, NULL, 0, NULL, '2025-07-16 01:15:51', '2025-07-16 01:15:51', NULL, NULL),
(350, 'Md. Abdur Rahim', 'rafashion329@gmail.com', NULL, '01712014468', NULL, NULL, '$2y$12$pdVDtEapS1IE/8/roh9d4eR9r67yETdxmGTJr.peuHq/SvW9UQcHa', 'user', 1, NULL, 0, NULL, '2025-07-16 01:28:30', '2025-07-16 01:28:30', NULL, NULL),
(351, 'zfhviOwJ', 'wnymediasharma976691@yahoo.com', NULL, '5944370757', NULL, NULL, '$2y$12$uQePrFb4mjvuDx0zcuWCcuUO8BPrdvPuh4oZaUfg6L/wTcyD/7/wy', 'user', 1, NULL, 0, NULL, '2025-07-16 02:18:01', '2025-07-16 02:18:01', NULL, NULL),
(352, 'Md. Abdur Rahim', 'abdurrohim32926@gmail.com', NULL, '01914932926', NULL, NULL, '$2y$12$xCN61BFg7lqDd264oSiaxOEy3qRqH5WugFXB5/vLvWtYR/.hdCmf2', 'user', 1, NULL, 0, NULL, '2025-07-16 02:50:21', '2025-07-16 02:50:21', NULL, NULL),
(353, 'Md. Ebrahim Ahmed', 'hdfashion288@gmail.com', NULL, '01724262543', NULL, NULL, '$2y$12$5c73p1c77h0cG0x4VaKA8.E.fAlxt5.K8PEuHuItH4Ipm5H/LqM9i', 'user', 1, NULL, 0, NULL, '2025-07-16 02:56:26', '2025-07-16 02:56:26', NULL, NULL),
(354, 'Magharul Islam', 'jewel7644@gmail.com', NULL, '01914049842', NULL, NULL, '$2y$12$doRkwGsZb/YYQPw68YTHaOjDpCQk90C8cWfVn48n/7RH2pqpEizEa', 'user', 1, NULL, 0, NULL, '2025-07-16 03:10:47', '2025-07-16 03:10:47', NULL, NULL),
(355, 'Sha Md. Shorab Hossain', 'shorab_1980@yahoo.com', NULL, '01712125571', NULL, NULL, '$2y$12$lLT4XCiFAGfZ.saFMyMp7eAWfHh.uDKidmpfK2HMbU1zcS1P5hwxS', 'user', 1, NULL, 0, NULL, '2025-07-16 03:21:12', '2025-07-16 03:21:12', NULL, NULL),
(356, 'Md. Mohiuddin', 'fashion.mohin@gmail.com', NULL, '01795241642', NULL, NULL, '$2y$12$aAOvwnhuDIV7INMh3E8iA.1qehT0ObHqYvZKmq91f.UKz19pumGzG', 'user', 1, NULL, 0, NULL, '2025-07-16 03:28:45', '2025-07-16 03:28:45', NULL, NULL),
(357, 'Hasan Mohammad Tarek', 'qdcconcern@gmail.com', NULL, '01844074989', NULL, NULL, '$2y$12$iO1LFxHV2J7dH8jxSShJheMW2oJ6zyX19gGoYnIlwZjOJLCI1KDgi', 'user', 1, NULL, 0, NULL, '2025-07-16 03:40:19', '2025-07-16 03:40:19', NULL, NULL),
(358, 'Md. Rasel Uddin Jhon', 'rtexinternational9@gmail.com', NULL, '01726391768', NULL, NULL, '$2y$12$YFTn2lRl575tic6SAD6/euQC54.K0D8tdjrc9Qai8tJRquX5iJ.Jm', 'user', 1, NULL, 0, NULL, '2025-07-16 03:49:59', '2025-07-16 03:49:59', NULL, NULL),
(359, 'Md. Mahadi Hsaan', 'ms.shemb@gmail.com', NULL, '01624214896', NULL, NULL, '$2y$12$2KAnCcUCEgLA1qxYReRbC.5zXnAVtUF4FpM4.Yw6JfNdj0sUs.afK', 'user', 1, NULL, 0, NULL, '2025-07-16 03:54:02', '2025-07-16 03:54:02', NULL, NULL),
(360, 'Md. Parvez Sikder', 'nusaiba.emb@gmail.com', NULL, '01911023054', NULL, NULL, '$2y$12$hUEwdEJoZiqi0djZCY/AheDvvlpIYMCqS6WcnjILB1ToLIsdIxpym', 'user', 1, NULL, 0, NULL, '2025-07-16 03:58:15', '2025-07-16 03:58:15', NULL, NULL),
(361, 'Md. Shofeul Alam', 'goldenbanglaagrocare@gmail.com', NULL, '01723274841', NULL, NULL, '$2y$12$u22F2l9sEQJdYEF1ZL02Ae6FiQDIxUDPFTa7B3xDQVNcwH.0GOQ7C', 'user', 1, NULL, 0, NULL, '2025-07-16 04:09:51', '2025-07-16 04:09:51', NULL, NULL),
(362, 'Abdus Salam', 'msnbmembroidery@gmail.com', NULL, '01672575745', NULL, NULL, '$2y$12$mBKqeI18IatVklMyOZQyzusKsWFbbqDe1aMxUTVRZh12n7utoq40q', 'user', 1, NULL, 0, NULL, '2025-07-16 04:13:53', '2025-07-16 04:13:53', NULL, NULL),
(363, 'Masud Alam Rana', 'masudalnur@gmail.com', NULL, '01849737389', NULL, NULL, '$2y$12$gcQShVaggSlpNvIKVEgH7OtreCFi/.9JVyNFzif6CVko6ujKmNfLq', 'user', 1, NULL, 0, NULL, '2025-07-16 04:23:33', '2025-07-16 04:23:33', NULL, NULL),
(364, 'Romit Kumar Roy', 'laxworld2020@gmail.com', NULL, '01886655322', NULL, NULL, '$2y$12$eT9YjBrGy4oZVGALjWZsyO3rmd5TnZdmRGbhqMirMFYtRF7VbRrRG', 'user', 1, NULL, 0, NULL, '2025-07-16 04:32:22', '2025-07-16 04:32:22', NULL, NULL),
(365, 'Md. Farid Sarker', 'stfashionhouse@gmail.com', NULL, '01780373619', NULL, NULL, '$2y$12$CDxZ6VEPm3VR893UtGvpSO38LGPpopIv27R2ZIE9nu2GvbVfyghJy', 'user', 1, NULL, 0, NULL, '2025-07-16 04:42:43', '2025-07-16 04:42:43', NULL, NULL),
(366, 'Md. Mohor Miah', 'moonfabricsbd@gmail.com', NULL, '01819342080', NULL, NULL, '$2y$12$FdNHjfoeFqZRoUyvXWcNJehM0IUCZgvVt3V79gTs9s543alsOE7JK', 'user', 1, NULL, 0, NULL, '2025-07-16 04:49:22', '2025-07-16 04:49:22', NULL, NULL),
(367, 'Anwer Hossain (Mohor)', 'info@runexpressbd.com', NULL, '01735598907', NULL, NULL, '$2y$12$e9JYYoHtn1zD0c4J85xKiOs4nlPB2IvcZUMPEyfp2SRuv76jKzZvy', 'user', 1, NULL, 0, NULL, '2025-07-16 04:56:22', '2025-07-16 04:56:22', NULL, NULL),
(368, 'Masud Rana', 'masuddesigncenter@gmail.com', NULL, '01617638844', NULL, NULL, '$2y$12$Y7uEP80wSsr4qsXBHAIuLeX0EFYrGkgfst7Nof5I4zEzXpAS0dKPS', 'user', 1, NULL, 0, NULL, '2025-07-16 05:08:23', '2025-07-16 05:08:23', NULL, NULL),
(369, 'Md. Anwar Hossain', 'ricomabd@gmail.com', NULL, '01918444222', NULL, NULL, '$2y$12$xIb9JgtSBPcRuyBa3JtV4uNHZHvJitU04xjh9v6wWZtgg7ze9cHei', 'user', 1, NULL, 0, NULL, '2025-07-16 05:11:24', '2025-07-16 05:11:24', NULL, NULL),
(370, 'Md. Asadul  Islam', 'assarviccenter@gmail.com', NULL, '01729796838', NULL, NULL, '$2y$12$f7ilmOI5TbOlaBWeqTkIG.jzPTuGhrhyb9T6wS1EmaTexzQuCKoG.', 'user', 1, NULL, 0, NULL, '2025-07-16 05:19:35', '2025-07-16 05:19:35', NULL, NULL),
(371, 'Md Anawarul Kabir', 'rasel.01625446688@gmail.com', NULL, '01625446688', NULL, NULL, '$2y$12$dsG.vfyaO9.WR8kDw56bf.OV1I/ePTien41hZnU7aLjxsBgQHaZ5S', 'user', 1, NULL, 0, NULL, '2025-07-16 05:24:49', '2025-07-16 05:24:49', NULL, NULL),
(372, 'Md. Ifte Khayer  Bhuiya', 'firstqualityfashion@gmail.com', NULL, '01636190075', NULL, NULL, '$2y$12$4c3l3o9shGXrux6PgYX/v.3ZQ.AKGWB82dbItgTXl3jqp4E0zxDeG', 'user', 1, NULL, 0, NULL, '2025-07-16 05:29:48', '2025-07-16 05:29:48', NULL, NULL),
(373, 'Mozammal Haqu', 'mozammelhaque3226@gmail.com', NULL, '01751676574', NULL, NULL, '$2y$12$2oVurTa285kLjKGGsE9btu6tna2ZXAsCUQZ3NxI7HA0iEcH2wyoX6', 'user', 1, NULL, 0, NULL, '2025-07-16 05:34:31', '2025-07-16 05:34:31', NULL, NULL),
(374, 'Md. Hasan', 'otofashiondesign@gmail.com', NULL, '01872649090', NULL, NULL, '$2y$12$wJtjrr0qKS4.2Ap/R98no.0iV0QZYh563kvKAqXSBNPr0/MsOneU2', 'user', 1, NULL, 0, NULL, '2025-07-16 05:39:12', '2025-07-16 05:39:12', NULL, NULL),
(375, 'Nahidur Rahman Nabil', 'nabil@natex-bd.com', NULL, '01677417710', NULL, NULL, '$2y$12$8PYcK62N7Ml4VqMdJCuBDOsyU3vwTfOGtfdUYoCwByVVo4PUqdlgC', 'user', 1, NULL, 0, NULL, '2025-07-16 05:54:35', '2025-07-16 05:54:35', NULL, NULL),
(376, 'Sayduzzaman', 'sayduzzamanrony09@gmail.com', NULL, '01834879051', NULL, NULL, '$2y$12$nynPb8wA0dT3DYfDW2GKfu.BgkfZNlBSutQJYrk1eLt6Jk8.wznVG', 'user', 1, NULL, 0, NULL, '2025-07-16 05:57:33', '2025-07-16 05:57:33', NULL, NULL),
(377, 'Md. Nazrul Islam', 'nislam2085@gmail.com', NULL, '01911115911', NULL, NULL, '$2y$12$2sW0qCS/lmSlhWNQt1sNBOIO/sv0WWAgN1Ulus8gOLa1MgoWCERgq', 'user', 1, NULL, 0, NULL, '2025-07-16 06:04:29', '2025-07-16 06:04:29', NULL, NULL),
(378, 'Md. Abu Nosor (Sarker)', 'nrnfashion2024@gmail.com', NULL, '01631642945', NULL, NULL, '$2y$12$4RKmaoodzxS5/SBy7ezRmuEpul1rVpSHDf.0tOOgyVvU6fUkrwovu', 'user', 1, NULL, 0, NULL, '2025-07-16 06:09:40', '2025-07-16 06:09:40', NULL, NULL),
(379, 'Bellal Hossan Sumon', 'ashuraimpex@gmail.com', NULL, '01816942848', NULL, NULL, '$2y$12$KrAppvgz.YvKRL51WTAjLew2kja5MIldqd9LF/VyU8s6yKMczWnmi', 'user', 1, NULL, 0, NULL, '2025-07-16 06:36:00', '2025-07-16 06:36:00', NULL, NULL),
(380, 'Md. Khokon', 'khokonwooil@gmail.com', NULL, '01314468484', NULL, NULL, '$2y$12$TmnjVWdmMMYbp8h3gw5MHOwGK/OXop41C/wSS57BAj/cUqRRzp8eK', 'user', 1, NULL, 0, NULL, '2025-07-16 06:47:10', '2025-07-16 06:47:10', NULL, NULL),
(381, 'Md. Ruhul Amin', 'haziruhulamin1@gmail.com', NULL, '01920705288', NULL, NULL, '$2y$12$hR0zF9G8qZIYQyxmiV8FmeFyP9p1Hfe0gVlWhkSDvDBG770TYxinS', 'user', 1, NULL, 0, NULL, '2025-07-16 06:53:24', '2025-07-16 06:53:24', NULL, NULL),
(382, 'Md. Bachu Hossain Jibon', 'bacchum47@pribd.com', NULL, '01717558116', NULL, NULL, '$2y$12$LRJhLVXpITw4bKjiayLrCefbs1U4MJ8rBEvLQxrITueolBN6uqUAG', 'user', 1, NULL, 0, NULL, '2025-07-17 04:20:53', '2025-07-17 04:20:53', NULL, NULL),
(383, 'Md. Kabir Hossain', 'mdkabirsordar28@gmail.com', NULL, '01688947191', NULL, NULL, '$2y$12$xXEujRu8vHEX4f9OZ/cYH.bxKw0LPWAaYs/2MlwAOG5H4TqwDibJe', 'user', 1, NULL, 0, NULL, '2025-07-17 04:23:20', '2025-07-17 04:23:20', NULL, NULL),
(384, 'Safique Ullah', 'safiqtito6324@gmail.com', NULL, '01720246773', NULL, NULL, '$2y$12$Iga5/2SnN7iHOwXA81W.4uVga39VpHGCDuqPmo..VjhOdIupvKiyi', 'user', 1, NULL, 0, NULL, '2025-07-17 04:45:40', '2025-07-17 04:45:40', NULL, NULL),
(385, 'Md. Ismail', 'mdismailbd22@gmail.com', NULL, '01818586315', NULL, NULL, '$2y$12$QElEWQzivv6qKmiqHx11R.aqLQrkmabXabI4vPOrhn4q8eU0IGG1q', 'user', 1, NULL, 0, NULL, '2025-07-17 04:48:53', '2025-07-17 04:48:53', NULL, NULL),
(386, 'Md. Masbaul Haque Nahid', 'nuhasfashion@gmail.com', NULL, '01628285511', NULL, NULL, '$2y$12$hwxUicBBcUBgi2Q.zIje1OhfJJJbsofMlBwHPLf3HTudV4N3eOr7S', 'user', 1, NULL, 0, NULL, '2025-07-17 04:53:30', '2025-07-17 04:53:30', NULL, NULL),
(387, 'Md. Mashud Kausher', 'hk.41.hossain@gmail.com', NULL, '01644311390', NULL, NULL, '$2y$12$032zc1v/IVwtVM428QOqU.zvZ8mdkmKEFeqwcByN/PVp1VHCtmlLi', 'user', 1, NULL, 0, NULL, '2025-07-17 05:08:02', '2025-07-17 05:08:02', NULL, NULL),
(388, 'LXLpQNdst', 'dboylexx3@gmail.com', NULL, '7135311715', NULL, NULL, '$2y$12$1FZa0yHpZyNzDnKFAAthxuEnPGz/dcAuGUKAerDalBJiprnDZVt/G', 'user', 1, NULL, 0, NULL, '2025-07-17 05:12:05', '2025-07-17 05:12:05', NULL, NULL),
(389, 'Abdur Rob', 'roba87336@gmail.com', NULL, '01676151636', NULL, NULL, '$2y$12$aPDeur6PntAqZwfHm4Fy3e.tjiI2XpzSLFWm1KbZdMiCs9gqUQd.2', 'user', 1, NULL, 0, NULL, '2025-07-17 05:15:48', '2025-07-17 05:15:48', NULL, NULL),
(390, 'Md. Shamsul Alam', 'ashrafulalamoshi@gmail.com', NULL, '01716516504', NULL, NULL, '$2y$12$7MfEc7jF2m2.cmV3TBaVLOkOPje16VTnJAeQubIwLAXJcNY6z.tyi', 'user', 1, NULL, 0, NULL, '2025-07-17 05:41:18', '2025-07-17 05:41:18', NULL, NULL),
(391, 'Md. Shohel Rana', 'yousufab1993@gmail.com', NULL, '01868793231', NULL, NULL, '$2y$12$CNngJLbOD.SaafM0g/XAmORHKL/oThmBzBykbWIRjUSeswBP.3LaO', 'user', 1, NULL, 0, NULL, '2025-07-17 05:46:39', '2025-07-17 05:46:39', NULL, NULL),
(392, 'Md. Ibrahim', 'end307589@gmail.com', NULL, '01715780555', NULL, NULL, '$2y$12$538nMRadO1MahVlB4VliYulwOo6U84nG5.FO2CaRF6FDZ5luUfwxa', 'user', 1, NULL, 0, NULL, '2025-07-17 05:51:17', '2025-07-17 05:51:17', NULL, NULL),
(393, 'Md.Rafiqul Islam (Summon)', 'sumonrofqul@gmail.com', NULL, '01816046042', NULL, NULL, '$2y$12$hr7wUtctDY/XUWnDJ7d4Ae/.gSXoknlxek90KL91SUNsHsZPA1TrC', 'user', 1, NULL, 0, NULL, '2025-07-17 05:54:47', '2025-07-17 05:54:47', NULL, NULL),
(394, 'Falen Al Mamun', 'falen7205@gmail.com', NULL, '01731970309', NULL, NULL, '$2y$12$Hjj229JSFqHaPON0rDQgfuEdNjYOSuKG7tasLtB6mc1wC0Yic27Zi', 'user', 1, NULL, 0, NULL, '2025-07-17 06:01:18', '2025-07-17 06:01:18', NULL, NULL),
(395, 'Belal Sarder', 'belal4830@gmail.com', NULL, '01608909933', NULL, NULL, '$2y$12$ZAP08PTP0hzQCUhCCVmByu2TSZJJBnGb2EI10XNksEaknICsyeKw.', 'user', 1, NULL, 0, NULL, '2025-07-17 06:06:53', '2025-07-17 06:06:53', NULL, NULL),
(396, 'Md. Anisur Rahman', 'mdanisur805@gmail.com', NULL, '01918949075', NULL, NULL, '$2y$12$RbGKt9KJ4KodP79Zr7PnOus9/j2YVmch8GgzcnzToVg/lrYWMC5Z.', 'user', 1, NULL, 0, NULL, '2025-07-17 06:13:35', '2025-07-17 06:13:35', NULL, NULL),
(397, 'Md. Shamsul Karim', 'shamsulkarim492@gmail.com', NULL, '01611160505', NULL, NULL, '$2y$12$jM.4Irh1qQz6hmm9hk8/5OlNPr/Ih4gP9jQCIqskVkMw9ZCSyth3u', 'user', 1, NULL, 0, NULL, '2025-07-17 06:21:19', '2025-07-17 06:21:19', NULL, NULL),
(398, 'Md. Razzak Hossain', 'mdrazzak01777453802@gmail.com', NULL, '01777453802', NULL, NULL, '$2y$12$ZzHYCoCsWssG7MF9SbIUdOXpOiKQW9VmxOaGlLNCgl6T0Vkt.9V22', 'user', 1, NULL, 0, NULL, '2025-07-17 06:27:41', '2025-07-17 06:27:41', NULL, NULL),
(399, 'Md. Idrish Mia', 'tasnimfashion2024@gmail.com', NULL, '01624950318', NULL, NULL, '$2y$12$6AUJktCenE8rkKUPXuB7OO4MuvvAgHw.Na2BNyjucDg/J4zlXRCFK', 'user', 1, NULL, 0, NULL, '2025-07-17 06:48:48', '2025-07-17 06:48:48', NULL, NULL),
(400, 'Md. Safiullah Sarker', 'salmanfashion2024@gmail.com', NULL, '01725072148', NULL, NULL, '$2y$12$KNK/oAHbsZNpn89ThuCbsuZvQhXrCe3jaCraRCCImVtVVyNJRsT1K', 'user', 1, NULL, 0, NULL, '2025-07-17 06:55:27', '2025-07-17 06:55:27', NULL, NULL),
(401, 'Md. Rubel', 'johirul7993@gmail.com', NULL, '01914457993', NULL, NULL, '$2y$12$DlKWQXMvsDsWM.D4Fhpnaulw7oTNCfGJQG5apcpnxBoeQXIA/7zSS', 'user', 1, NULL, 0, NULL, '2025-07-17 06:59:02', '2025-07-17 06:59:02', NULL, NULL),
(402, 'Nazrul Islam', 'mn01739332@gmail.com', NULL, '01739739332', NULL, NULL, '$2y$12$XOIX1yrj636rx3Yu.DZfb.KxAsb.OhP.Oq5XloxVek6kCTuXyMALa', 'user', 1, NULL, 0, NULL, '2025-07-17 07:02:47', '2025-07-17 07:02:47', NULL, NULL),
(403, 'Md. Shohel Sorkar', 'shohelsorker018@gmail.com', NULL, '01712347326', NULL, NULL, '$2y$12$pk8bM.mnyoUKGcpn4C0cP.cF3cdhzshcUjJf1MVfKeFgAlVFZq3u.', 'user', 1, NULL, 0, NULL, '2025-07-17 07:08:57', '2025-07-17 07:08:57', NULL, NULL),
(404, 'Md. Abu Bakar Siddique', 'siddikw10@gmail.com', NULL, '01925984737', NULL, NULL, '$2y$12$kspbQulRB.eWKZHtyA3IlOO.gPhc1xLXe3YVIHQ0TOpgiKAGEj3na', 'user', 1, NULL, 0, NULL, '2025-07-17 07:17:04', '2025-07-17 07:17:04', NULL, NULL),
(405, 'Md. Ekramul Hasan (Sumu)', 'ahrembroidery@gmail.com', NULL, '01925307181', NULL, NULL, '$2y$12$8NUU.mEU.vbD5623aPUV9uEf4.FIXNK/dBN5MRxio222nUQnGISF.', 'user', 1, NULL, 0, NULL, '2025-07-17 07:21:41', '2025-07-17 07:21:41', NULL, NULL),
(406, 'Shahid Ullah Chowdhury(Reaz)', 'ushafashonbd@gmail.com', NULL, '01715276094', NULL, NULL, '$2y$12$uGcDXMvhX1PQwhmSxa5w6el32oiTmA6eVQ68T.8jQELrntvV19rxC', 'user', 1, NULL, 0, NULL, '2025-07-17 07:31:05', '2025-07-17 07:31:05', NULL, NULL),
(407, 'A.K.M Hamid', 'samiron@vision-bd.com', NULL, '01711522436', NULL, NULL, '$2y$12$f2roDxzbnvuZdJX33lnbuOfRL6MflfqcKDaG7MUcokwO/UeHgmXXO', 'user', 1, NULL, 0, NULL, '2025-07-17 07:37:37', '2025-07-17 07:37:37', NULL, NULL),
(408, 'Md. Belayet Hossain  Ripon', 'belayet@ponditgroup.com.bd', NULL, '01715555111', NULL, NULL, '$2y$12$WNF/MfYaUg6DgC1R2UyVvOMnaG4a4O0Ve39WzTyPEofrmT9jxf2UC', 'user', 1, NULL, 0, NULL, '2025-07-17 07:44:31', '2025-07-17 07:44:31', NULL, NULL),
(409, 'Md. Shakil Ahmed', 'shakil@overseascollectionltd.com', NULL, '01712197312', NULL, NULL, '$2y$12$OBnrWsY8wtL2V5xHfVrm8Obnbs8VmITuJ26x7btDf56gGIhwm8p8m', 'user', 1, NULL, 0, NULL, '2025-07-17 07:48:55', '2025-07-17 07:48:55', NULL, NULL),
(410, 'Md. Mahabub Laskar', 'lmaccessoresembroidery@gmail.com', NULL, '01611143178', NULL, NULL, '$2y$12$2kB11Yx7zdcX/kDBHVEf8eAL76JVIv/NgfuLc1uLo2ybJdypsPyHW', 'user', 1, NULL, 0, NULL, '2025-07-17 10:11:11', '2025-07-17 10:11:11', NULL, NULL),
(411, 'BxXzASHMQ', 'jenniferwilliams816469@yahoo.com', NULL, '2974490450', NULL, NULL, '$2y$12$0Yw1qp1sYRDQ3zkh58x3cO0oZ5X1O6NSLOW6tqLx03gQSly1/bYvm', 'user', 1, NULL, 0, NULL, '2025-07-17 10:21:52', '2025-07-17 10:21:52', NULL, NULL),
(412, 'vOWDsBYKjbcfEGa', 'princegollager@gmail.com', NULL, '5729608969', NULL, NULL, '$2y$12$NrFAflqg3C1hGQekEUD86O4Z2z1d8aGl63AqbYNyVQeANk7BLZ5T6', 'user', 1, NULL, 0, NULL, '2025-07-17 10:36:23', '2025-07-17 10:36:23', NULL, NULL),
(413, 'LavillSog', 'revers711@1ti.ru', NULL, '3114', NULL, NULL, '$2y$12$HmnmV1IM1jukRUdblpzM4exanF6x9RvAz5sNIzM0PRGLsVW.YUSsi', 'user', 1, NULL, 0, NULL, '2025-07-17 14:42:50', '2025-07-17 14:42:50', NULL, NULL),
(414, 'BexlasTralo', 'mironborisov@openhook.ru', NULL, '4959', NULL, NULL, '$2y$12$ozpF8d/5A8hDQpkMhymInutu3LIExS9YjMjdJUIUVr1Uqa6ksIXnK', 'user', 1, NULL, 0, NULL, '2025-07-17 23:24:10', '2025-07-17 23:24:10', NULL, NULL),
(415, 'TUfakbpgmNYke', 'cimipumi644@gmail.com', NULL, '5801194745', NULL, NULL, '$2y$12$7ZetKSIHVxiTfkse0OsjcO/.JNECepGpWZ4bvH8JasjWJQ.A5yRNW', 'user', 1, NULL, 0, NULL, '2025-07-18 04:27:20', '2025-07-18 04:27:20', NULL, NULL),
(416, 'rmhXlnZWeeBgr', 'ranthonyjy19@gmail.com', NULL, '6649409437', NULL, NULL, '$2y$12$X4K.Jeo9TY0GUSa7qx75UuOHbR8xdt0Am6bmxPnZuce0UUcSNTaju', 'user', 1, NULL, 0, NULL, '2025-07-18 12:31:53', '2025-07-18 12:31:53', NULL, NULL),
(417, 'IruuiAxPSiuxr', 'grosskarleilyg@gmail.com', NULL, '2902377843', NULL, NULL, '$2y$12$XGoXKowMZ77cUZWoaATlBeSIKlCKf9Wv9NcGW/sHmANXgdbFzA0re', 'user', 1, NULL, 0, NULL, '2025-07-19 00:44:48', '2025-07-19 00:44:48', NULL, NULL),
(418, 'Md. Jasim Uddin', 'madinamf18@gmail.com', NULL, '01710830905', NULL, NULL, '$2y$12$cSJN26Z6WEmDrJEVFOl.YuooVkwMyq9HtsL4LNEJnFU8uGm3RCcda', 'user', 1, NULL, 0, NULL, '2025-07-19 04:22:31', '2025-07-19 04:22:31', NULL, NULL),
(419, 'ALTAAISRAbqW', 'chenscombsxn98@gmail.com', NULL, '9646277717', NULL, NULL, '$2y$12$Z/OpxTqwJTUNEaqLBtMTj.iigmIdWiuF/nNTSJF6Q28Ssnxg8WYXi', 'user', 1, NULL, 0, NULL, '2025-07-19 04:25:54', '2025-07-19 04:25:54', NULL, NULL),
(420, 'Mohammad Omar Faruk', 'sales@texstock.net', NULL, '01719356311', NULL, NULL, '$2y$12$dr77ubRv6FDtp3ndDlr4K.r6xdqr4KEqp7WiLF0JCO.Y9dNocH8Aq', 'user', 1, NULL, 0, NULL, '2025-07-19 04:26:28', '2025-07-19 04:26:28', NULL, NULL),
(421, 'Yong Oh Yu', 'yuleeembo.bd@gmail.com', NULL, '01738131616', NULL, NULL, '$2y$12$9.BnWeQkds5LqYHeaOq.pO.IkRIh.oppPW3sn1.2.kTY.m8L18YOW', 'user', 1, NULL, 0, NULL, '2025-07-19 04:34:36', '2025-07-19 04:34:36', NULL, NULL),
(422, 'Kamrul Akefin Shawon', 'shawon@stateapparels.com', NULL, '01714272777', NULL, NULL, '$2y$12$cgCDBq57SodbA6xHQLYpQuT5QaEFyyEaXASpprWlgCqYikPq18hIu', 'user', 1, NULL, 0, NULL, '2025-07-19 04:48:44', '2025-07-19 04:48:44', NULL, NULL),
(423, 'Md. Juwel', 'juwelrahman15@gmail.com', NULL, '01580354973', NULL, NULL, '$2y$12$/.SDMNSxeCruW5t8QOstH.Rj6OHXuvunpVPwDoxEzlzyFsbvkbNra', 'user', 1, NULL, 0, NULL, '2025-07-19 05:04:09', '2025-07-19 05:04:09', NULL, NULL),
(424, 'Mrs Zakia Sultana', 'addinexim@gmail.com', NULL, '01730900789', NULL, NULL, '$2y$12$ka94LBzgaPywu4QdeiWJw.Wwn8vcqtdL1GD3F0ZOtjKNPNtUn5r6a', 'user', 1, NULL, 0, NULL, '2025-07-19 05:10:18', '2025-07-19 05:10:18', NULL, NULL),
(425, 'Md. Abdur Rahim Khan', 'rkrtil@gmail.com', NULL, '01711232249', NULL, NULL, '$2y$12$scNvcLwyHJPLTcdwjDrp8OUdsw9sfOVHnZXonRhOOLD.YATV4ci.S', 'user', 1, NULL, 0, NULL, '2025-07-19 05:14:26', '2025-07-19 05:14:26', NULL, NULL),
(426, 'Md. Shahin Bhuiyan', 'shahinbhuiyan464@gmail.com', NULL, '01822255005', NULL, NULL, '$2y$12$sm3fg/JiKzkKSsAqxFlrquCXCoJ0R9Pf3piNFGXoQWKFRP/0UNHs6', 'user', 1, NULL, 0, NULL, '2025-07-19 05:26:13', '2025-07-19 05:26:13', NULL, NULL),
(427, 'Anowar Hossen Dalim', 'designmood24@gmail.com', NULL, '01755998868', NULL, NULL, '$2y$12$SSV5LVWktZs6kNhVLPjK8epviM1k5p7hB2mS/5lBg7Kp7.1dOgWeK', 'user', 1, NULL, 0, NULL, '2025-07-19 05:31:31', '2025-07-19 05:31:31', NULL, NULL),
(428, 'Md. Tohedul Islam', '2starembroidery@gmail.com', NULL, '01680001110', NULL, NULL, '$2y$12$S.keVMQrGuQM7ETZfaIVoewzlO5PZB.JYJa4F4TatavTrCFWqgN2y', 'user', 1, NULL, 0, NULL, '2025-07-19 05:45:37', '2025-07-19 05:45:37', NULL, NULL),
(429, 'Md. Khijir Chowdhury', 'chowdhurytrad.corp@gmail.com', NULL, '01912324010', NULL, NULL, '$2y$12$kg7coU/U.LzOAcynnmpdW.9FRIBBuG8Lbk1WhCEjhrJ55q2XHvf7W', 'user', 1, NULL, 0, NULL, '2025-07-19 05:50:05', '2025-07-19 05:50:05', NULL, NULL),
(430, 'Md. Khijir Chowdhury', 'pritomfashion@gmail.com', NULL, '01912324010', NULL, NULL, '$2y$12$U/G2lIcY/re4guUT7XSU5eHOodaWHvDJODw..pZntbNs9EQxfgV4u', 'user', 1, NULL, 0, NULL, '2025-07-19 06:10:28', '2025-07-19 06:10:28', NULL, NULL),
(431, 'Md. Abdul Rouf', 'engineerstitch@gmail.com', NULL, '01932333736', NULL, NULL, '$2y$12$2an6GwN1OjdmNDZJZdlQf.ogTJDrRsxvRY.ozdtIVMt9u/AMGtTja', 'user', 1, NULL, 0, NULL, '2025-07-19 07:18:29', '2025-07-19 07:18:29', NULL, NULL),
(432, 'Md. Zahedur Rahman', 'rechoicefashion@gmail.com', NULL, '01316508090', NULL, NULL, '$2y$12$s9WbdFA1uCgXMZXdMR0gXOq7ImqSdzdyg3jvNXBL/m5hDBu0IQAv2', 'user', 1, NULL, 0, NULL, '2025-07-19 07:35:39', '2025-07-19 07:35:39', NULL, NULL),
(433, 'Md. Raihan', 'zamzamfashions2021@gmail.com', NULL, '01783748525', NULL, NULL, '$2y$12$Pb3ghu0iChwnKbbj/QSF6.6zalg54uLqO.lUwQuWOYmZDFVZD/7bW', 'user', 1, NULL, 0, NULL, '2025-07-19 07:44:52', '2025-07-19 07:44:52', NULL, NULL),
(434, 'Md. Ripon', 'yourchoose18@gmail.com', NULL, '01677006397', NULL, NULL, '$2y$12$xlbk9zzCxv1TVtJYAMQrKO9SahE9Q6kwcGJZacjE108AfOzYOlgkK', 'user', 1, NULL, 0, NULL, '2025-07-19 09:22:52', '2025-07-19 09:22:52', NULL, NULL),
(435, 'Mir.Md. Hammadur Rahman', 'hrshohag@yahoo.com', NULL, '01714801662', NULL, NULL, '$2y$12$2w/ew31fP/RtU74M7Iga9etX9Lp0A9xS8DljSmqvU43v2sSEnb1QO', 'user', 1, NULL, 0, NULL, '2025-07-19 09:34:04', '2025-07-19 09:34:04', NULL, NULL),
(436, 'Forhad Hossain', 'farhad.chowdhury1992@gmail.com', NULL, '01837000492', NULL, NULL, '$2y$12$DDffYOWWJsX6PwB2KV4Iv.ukoX9zGfoMFrkeDZh9jEMPPVdVfyDUO', 'user', 1, NULL, 0, NULL, '2025-07-19 09:52:48', '2025-07-19 09:52:48', NULL, NULL),
(437, 'Md. Ilias Hossain', 'elyais011988@gmail.com', NULL, '01946200121', NULL, NULL, '$2y$12$hwTuDv5Vr2KdTtcg8KA3aeiGagpCesTb5OZt4AVaAdMunix21I0n.', 'user', 1, NULL, 0, NULL, '2025-07-19 10:11:25', '2025-07-19 10:11:25', NULL, NULL),
(438, 'Md. Imran Hossain', 'rafsanfashionbd@gmail.com', NULL, '01716674813', NULL, NULL, '$2y$12$zN8LFjjAyLjKJFM3DbA4m.pqM361jFsMx.6S7yTYD4g0BzEubSU/C', 'user', 1, NULL, 0, NULL, '2025-07-19 10:19:54', '2025-07-19 10:19:54', NULL, NULL),
(439, 'Mohammad Shamim Chowdhur', 'raya.solution@gmail.com', NULL, '01678061102', NULL, NULL, '$2y$12$pS9ddAHFVdzwcCU9S0Ntb.hVzdZ8t2wJYiO1a.V.3x2VigECDg9Zi', 'user', 1, NULL, 0, NULL, '2025-07-19 10:29:45', '2025-07-19 10:29:45', NULL, NULL),
(440, 'Md. Enamul Kabir', 'enamul_kabir02@yahoo.com', NULL, '01715700639', NULL, NULL, '$2y$12$cYzckmq2TRxM4JMTbC8sxuPBv7VSHRUyAAV5sPOjQfK0ol8lziSQS', 'user', 1, NULL, 0, NULL, '2025-07-19 10:36:41', '2025-07-19 10:36:41', NULL, NULL),
(441, 'Md. Azaharul Islam', 'mollaenterpriseaz@gmail.com', NULL, '01978852210', NULL, NULL, '$2y$12$ksFdT3iu1VMQgnQYJviqfOE4/ZNVyojhrNtuvNgQLs68Ike11TsyW', 'user', 1, NULL, 0, NULL, '2025-07-19 11:17:57', '2025-07-19 11:17:57', NULL, NULL),
(442, 'Md. Alamgir Hossain', 'as.alamgir24@gmail.com', NULL, '01917073292', NULL, NULL, '$2y$12$hUm768ugbxx2DX750a1O/e2CUIJML6K2bZ0yEMs8b904KfFy0tQ2K', 'user', 1, NULL, 0, NULL, '2025-07-20 04:42:31', '2025-07-20 04:42:31', NULL, NULL),
(443, 'Md. Enamul Haq', 'hoque.embroidery@gmail.com', NULL, '01822912143', NULL, NULL, '$2y$12$QDEGKL1oNQXD/Dax15.dx.T0VwonePazzxD4T.LHYD.uyfvl5mt.a', 'user', 1, NULL, 0, NULL, '2025-07-20 04:52:12', '2025-07-20 04:52:12', NULL, NULL),
(444, 'Md. Reaz Uddin', 'reazuddin136@gmail.com', NULL, '01829140284', NULL, NULL, '$2y$12$7HO/eKy7ZuI.VOKULjWiZ.URf9pYLYipLryjSxR2hFY4bwhi8Mc7.', 'user', 1, NULL, 0, NULL, '2025-07-20 04:57:36', '2025-07-20 04:57:36', NULL, NULL),
(445, 'Md. Shofikul Islam', 's01973552668@gmail.com', NULL, '01973552668', NULL, NULL, '$2y$12$2chn94yOYfQKzu7ThEFKsOpLb/qjhvkBtMcRr5V5sXUM6sYQjMuCG', 'user', 1, NULL, 0, NULL, '2025-07-20 05:05:41', '2025-07-20 05:05:41', NULL, NULL),
(446, 'Muhammad Shariful Islam', 'sharifdcemb@gmail.com', NULL, '01678088746', NULL, NULL, '$2y$12$pEjfr2TaO8HKtriT5zIsKumwXMinYNfOnvvR90TEZ.vcDcfkASWmK', 'user', 1, NULL, 0, NULL, '2025-07-20 05:13:30', '2025-07-20 05:13:30', NULL, NULL),
(447, 'Lameya Akter', 'mohammadshakil456123@gmail.com', NULL, '01983376083', NULL, NULL, '$2y$12$IGytOiiY3tIeRGYhxuU5aelE/hzKhh3DjMJHC06VLNu/ubrk7sJHq', 'user', 1, NULL, 0, NULL, '2025-07-20 05:31:53', '2025-07-20 05:31:53', NULL, NULL),
(448, 'Md. Alamgir hossain Chowdhury', 'jenuinefashionemb@gmail.com', NULL, '01612525807', NULL, NULL, '$2y$12$FeQyNvL2BAkspE9FCJufqOObFIL2wLpIo/ypb.AiT.h/HD8NLmgMy', 'user', 1, NULL, 0, 'jaUIaQpgFME1U6UsApjKbMSGPhrezUiCTvQxQg8eARgNeMckD2q1yVcIWW60', '2025-07-20 05:42:10', '2025-07-21 11:47:24', NULL, NULL),
(449, 'Md. Abu Zubair Shimul', 'shimul007zubair@gmail.com', NULL, '01674918149', NULL, NULL, '$2y$12$U8XxqeZuSoV2zicSMMgvau91FamSxC5EWHywJoOvHzKO8iAQGUFwK', 'user', 1, NULL, 0, NULL, '2025-07-20 06:14:08', '2025-07-20 06:14:08', NULL, NULL),
(450, 'Md. Mostafa Kamal', 'starfashionbd6@gmail.com', NULL, '01731389528', NULL, NULL, '$2y$12$reG5Pan.vjY9ZLD96gZtQ.NYctbK4E1fRKnu7jx8VYXF/YA4yfWbO', 'user', 1, NULL, 0, NULL, '2025-07-20 06:23:55', '2025-07-20 06:23:55', NULL, NULL),
(451, 'Md. Mohsin', 'goldstar336699@gmail.com', NULL, '01844266226', NULL, NULL, '$2y$12$DR4Q2XbFsJYd5dnkxqnUUOpttyo6bFmIaXju5nP93RYsAS1X.Xo9K', 'user', 1, NULL, 0, NULL, '2025-07-20 07:21:33', '2025-07-20 07:21:33', NULL, NULL),
(452, 'Abul Kalam Azad', 'akazad021985@gmail.com', NULL, '01617081547', NULL, NULL, '$2y$12$rDI8AnCTnGtX8YPRsKkD7.yExr/LTDIxX/dDxSZRIJxchJIECnH7K', 'user', 1, NULL, 0, NULL, '2025-07-20 08:42:36', '2025-07-20 08:42:36', NULL, NULL),
(453, 'Md. Ahsan Habib Pranto', 'anrembroideryltd@gmail.com', NULL, '01625872606', NULL, NULL, '$2y$12$16JBPgkm9rZ7uXGN2NtmtemD9IILb53Y32W84e65lfFDDen9na./.', 'user', 1, NULL, 0, NULL, '2025-07-20 09:23:56', '2025-07-20 09:23:56', NULL, NULL),
(454, 'Md. Ahtasur Rahman Shanto', 'feathertexprint@gmail.com', NULL, '01916858825', NULL, NULL, '$2y$12$BWoF0.Olhq9C9CwIjLkaIeKST7haqd4SvX61pD8UebSlHbPgJlfFq', 'user', 1, NULL, 0, NULL, '2025-07-20 09:36:12', '2025-07-20 09:36:12', NULL, NULL),
(455, 'Md. Ibrahim', 'iconfashion1971@gmail.com', NULL, '01920104607', NULL, NULL, '$2y$12$7nKdpKVrYIBkSHoY1LcXx.7cRDbUt2BBi2olTU0RxCKdC5K8qEXi6', 'user', 1, NULL, 0, NULL, '2025-07-20 10:03:50', '2025-07-20 10:03:50', NULL, NULL),
(456, 'Md. Mostafizur Rahman', 'mostaiz.759@gmail.com', NULL, '01678115245', NULL, NULL, '$2y$12$1ZgCpybxq1at/NRTy5MnC.Fy/sj4UuwGBFMSJOYZooOmGDGFxoPEy', 'user', 1, NULL, 0, NULL, '2025-07-20 10:11:56', '2025-07-20 10:11:56', NULL, NULL),
(457, 'Md. Jamilur Rahman', 'frshikha@yahoo.com', NULL, '01755731063', NULL, NULL, '$2y$12$nOZ2aAwtG/6mokWyaaJv7O66vMSrlH5gd3wbAO0KgLodFhaKkREhi', 'user', 1, NULL, 0, NULL, '2025-07-20 10:20:10', '2025-07-20 10:20:10', NULL, NULL),
(458, 'Abu Taher Sumon', 'asmaaakteraka@gmail.com', NULL, '01718328309', NULL, NULL, '$2y$12$I.WHS6ZxJWtDDCUS2AQxp.jyfblP0IWCTselh3wxRMD5ukoPdTnfy', 'user', 1, NULL, 0, NULL, '2025-07-20 10:30:27', '2025-07-20 10:30:27', NULL, NULL),
(459, 'D M Liton', 'litondaly@gmail.com', NULL, '01869804869', NULL, NULL, '$2y$12$yRhD31a7fe13MVK3jsKTKuAeRUIz9mHL.Mj5kT2zRN2GSF3QU.EpK', 'user', 1, NULL, 0, NULL, '2025-07-20 10:55:30', '2025-07-20 10:55:30', NULL, NULL),
(460, 'Most. Monjuara Khatun', 'fairtexemb@gmail.com', NULL, '01750613597', NULL, NULL, '$2y$12$EmXyyfG5F5BL.l4rzjUuZeUfkEejuH49x3JgcqjRNHLJbBSVrNi8m', 'user', 1, NULL, 0, NULL, '2025-07-20 11:01:18', '2025-07-20 11:01:18', NULL, NULL),
(461, 'Md. Aminul Islam', 'rajfashiontouch2012@gmail.com', NULL, '01913396380', NULL, NULL, '$2y$12$zaMfpAH55xb9XDcbCmaCfuFi7RM61PZxdKKGqpBeFjyKRgKk3EyNu', 'user', 1, NULL, 0, NULL, '2025-07-20 11:09:40', '2025-07-20 11:09:40', NULL, NULL),
(462, 'Jamal Uddin Rana', 'jamal@haquetextile.com', NULL, '01755557133', NULL, NULL, '$2y$12$69/gQ8E8iTegGviC.8BZyuSpy3xRbKvlqJj7bbmQXgFMcNwuaMQyS', 'user', 1, NULL, 0, NULL, '2025-07-20 11:16:40', '2025-07-20 11:16:40', NULL, NULL),
(463, 'GJEuhZkIgCVS', 'vexiciweboye53@gmail.com', NULL, '9661558993', NULL, NULL, '$2y$12$utgUG0nHubqqjcvqoDEPKu5h77udsgh7H.rzbjOt3bPLSmCl5RCYu', 'user', 1, NULL, 0, NULL, '2025-07-20 13:41:51', '2025-07-20 13:41:51', NULL, NULL),
(464, 'M. Shahid Hossain', 'chairman@dekkoisho.com', NULL, '01731661374', NULL, NULL, '$2y$12$iNrjw0..GMVporhKR/3cx.lobi8Y0Hoe1G0o3m.uiB6y3WoMCVFOi', 'user', 1, NULL, 0, NULL, '2025-07-21 04:34:38', '2025-07-21 04:34:38', NULL, NULL),
(465, 'Tanvir Ahmmed', 'visionandvisionindustiresltd@gmail.com', NULL, '01924306035', NULL, NULL, '$2y$12$xSSJAaYD/DfnD2SQcrwdtOn9wmBdBH5gwYWB7XfMDUKukrvug7Hw2', 'user', 1, NULL, 0, NULL, '2025-07-21 04:51:42', '2025-07-21 04:51:42', NULL, NULL),
(466, 'Anower Hossain', 'starthread.bd.adabor@gmail.com', NULL, '01613745757', NULL, NULL, '$2y$12$qVbHLFOlHwFPOSpuWsvMRecOoOCOOlD9IC4Ks9yPg8u5Z9Yauqr6C', 'user', 1, NULL, 0, NULL, '2025-07-21 05:01:07', '2025-07-21 05:01:07', NULL, NULL),
(467, 'Mohammad Zahidur Rahman', 'zahid@nhk-ast.com', NULL, '01713236100', NULL, NULL, '$2y$12$OL5Jo2tRLImQ/Kwh4kUBf.m7ckqEtz5144lRX7v6O/a4/jSqJuOo.', 'user', 1, NULL, 0, NULL, '2025-07-21 06:23:50', '2025-07-21 06:23:50', NULL, NULL),
(468, 'Mohammed Abu Sayed', 'sayeed_1600@yahoo.com', NULL, '01926001940', NULL, NULL, '$2y$12$wHns8.Cnvyo99NUbgLwbkulGv2mRjA7TCVlxuKHqI5qOPF1fxHeTq', 'user', 1, NULL, 0, NULL, '2025-07-21 06:56:07', '2025-07-21 06:56:07', NULL, NULL),
(469, 'Md. Rafiqul Islam', 'bodyrafik@gmail.com', NULL, '01911240963', NULL, NULL, '$2y$12$AhAQODxS3Y6wgtru4YiEkuz9Ls9aDJVHnU2JnmwvyS6dvMR6A3MW6', 'user', 1, NULL, 0, NULL, '2025-07-21 07:07:12', '2025-07-21 07:07:12', NULL, NULL),
(470, 'Md. Ali Azgar Khan', 'mahaditrading05@gmail.com', NULL, '01911703696', NULL, NULL, '$2y$12$kwI.f6f4352KGdFjpnUSoeRHubJ4eZKNYIrtoXnejVzHJW8vf288q', 'user', 1, NULL, 0, NULL, '2025-07-21 07:16:00', '2025-07-21 07:16:00', NULL, NULL),
(471, 'Md. Manik Hossain', 'manikhossain2733@gmail.com', NULL, '01716922269', NULL, NULL, '$2y$12$Zph6yumLCZgGoeA/ws/sGuNFeKIGrV874CvGX5BBH25zKv05qKbc2', 'user', 1, NULL, 0, NULL, '2025-07-21 08:29:41', '2025-07-21 08:29:41', NULL, NULL),
(472, 'Abdul Kader', 'a.k.mohon969@gmail.com', NULL, '01870238389', NULL, NULL, '$2y$12$Huf4xmR3uvaG3bf.U.M1XuAg6yWiBek5tQV6.YWvYiMJImbpMJAE.', 'user', 1, NULL, 0, NULL, '2025-07-21 08:39:02', '2025-07-21 08:39:02', NULL, NULL),
(473, 'Md. Ariful Haque Awal', 'arif.awal@gmail.com', NULL, '01957772945', NULL, NULL, '$2y$12$pcP/BcfXClaIHL.VHkhjnubSid191wBmbvRu1DdX9SG0KNHbaPlqW', 'user', 1, NULL, 0, NULL, '2025-07-21 08:45:04', '2025-07-21 08:45:04', NULL, NULL),
(474, 'Yeasin Al-Kabir', 'designfashionwork@gmail.com', NULL, '01919595222', NULL, NULL, '$2y$12$WXvdmeZmcd9Nek2V8ZWx6.D.cB/IldCDeOyQ.i7tmLY1ezq9DToi6', 'user', 1, NULL, 0, NULL, '2025-07-21 09:00:14', '2025-07-21 09:00:14', NULL, NULL),
(475, 'A.K.M Shoaib', 'shoaib.dmo@gmail.com', NULL, '01711541566', NULL, NULL, '$2y$12$2DCDL98X.1lruLBQsCgCPO4rjkr32nn3aNGU/kD6C0V3HHx7zGk5u', 'user', 1, NULL, 0, NULL, '2025-07-21 09:13:16', '2025-07-21 09:13:16', NULL, NULL),
(476, 'Md. Billal Hossain', 'msboisakhitraders1@gmail.com', NULL, '01716733728', NULL, NULL, '$2y$12$3F2ZgRsj4s3CV.VEtgy94OwCItE09JkoRUp5OI4.bMQK9ZFsAaz2q', 'user', 1, NULL, 0, NULL, '2025-07-21 09:25:26', '2025-07-21 09:25:26', NULL, NULL),
(477, 'Md. Shamim -Al-Mamoun', 'royalembroidery524@gmail.com', NULL, '01716206648', NULL, NULL, '$2y$12$6ES5mPZXA6/rxOBlYtL/3eg9gkO1YfaQZ8BeYltsj8.XpTH3kdkAe', 'user', 1, NULL, 0, NULL, '2025-07-21 10:04:35', '2025-07-21 10:04:35', NULL, NULL),
(478, 'Md. Nur Alam', 'allahardanemb@gmail.com', NULL, '01765018767', NULL, NULL, '$2y$12$i0UtV5wBJOZ/c0uHC8AQsuEoFtO8hj/PNF6wKhahVDhQZ9RKBDZdu', 'user', 1, NULL, 0, NULL, '2025-07-21 10:11:35', '2025-07-21 10:11:35', NULL, NULL),
(479, 'IQXHWEwPiGyjh', 'lunadjohf44@gmail.com', NULL, '5420717882', NULL, NULL, '$2y$12$2cRtSjC0cP3xJPc0OgbBXO3Apt8c3Atm6GsZ451rfoa8T.sPltWJe', 'user', 1, NULL, 0, NULL, '2025-07-21 10:18:17', '2025-07-21 10:18:17', NULL, NULL),
(480, 'nTgaAhNVPgqV', 'hardingsiliyau@gmail.com', NULL, '9808441745', NULL, NULL, '$2y$12$Q1qr8B45pu1b.NPa5bt/seUqAmmuUshPA9FWJSnLvmp2bpeXGqZ1S', 'user', 1, NULL, 0, NULL, '2025-07-21 11:18:09', '2025-07-21 11:18:09', NULL, NULL),
(481, 'MQFkDIyoRTx', 'summersmontgomerieg@gmail.com', NULL, '7221991021', NULL, NULL, '$2y$12$kw/s41t7F7afxr26O/0cSOW3AqYLyRkCpJbVQ9R8YszxyhJxBM87O', 'user', 1, NULL, 0, NULL, '2025-07-22 02:00:49', '2025-07-22 02:00:49', NULL, NULL),
(482, 'JAnmlfiVTyqNaEC', 'lukssnowa39@gmail.com', NULL, '9346819284', NULL, NULL, '$2y$12$fsB8xQSrVLiWxa0ylJyruuLPC8Nta8aEVUhZ1hPwqntWVuE1u2nPe', 'user', 1, NULL, 0, NULL, '2025-07-22 02:47:41', '2025-07-22 02:47:41', NULL, NULL),
(483, 'WcAtmmZQSz', 'olsenalikse1988@gmail.com', NULL, '5297340667', NULL, NULL, '$2y$12$c.tF/C/cJkb9TNYkPlmshuhdmC6l.Xdu2GFVVEiEhAS1GU1v6GyP.', 'user', 1, NULL, 0, NULL, '2025-07-22 02:59:30', '2025-07-22 02:59:30', NULL, NULL),
(484, 'Narayan Chandra Das', 'tapestryfashion@gmail.com', NULL, '01819615079', NULL, NULL, '$2y$12$2A4LCDa3VdPyOMpOze.Y.eBiaoNMQuJOdLqvOEKmwUP2fUmXjsCk6', 'user', 1, NULL, 0, NULL, '2025-07-22 07:29:10', '2025-07-22 07:29:10', NULL, NULL),
(485, 'Md. Ahidur Rahman', 'abcinternational2013@gmail.com', NULL, '01675009739', NULL, NULL, '$2y$12$4ZpVfpZbx81XuPSYks.yaOxm0s7Mz9YxkKbENiQoHsv5AEZtKBfkO', 'user', 1, NULL, 0, NULL, '2025-07-22 07:35:08', '2025-07-22 07:35:08', NULL, NULL),
(486, 'Md. Mosharraf Hossain', 'rongmelafashion94@gmail.com', NULL, '01917169413', NULL, NULL, '$2y$12$CO1NARe0DiWcOikUBhypeuMBXWaU9EWU1J1qBGk7QVWggdnC28fz.', 'user', 1, NULL, 0, NULL, '2025-07-22 07:41:28', '2025-07-22 07:41:28', NULL, NULL),
(487, 'Mahbub –Ul- Arefin', 'arefin2004@gmail.com', NULL, '01716937777', NULL, NULL, '$2y$12$LdLewoJWe9FquW/fObz8XeY7/fAol3Xzkfug7dpPWgv8TJcHWzcxK', 'user', 1, NULL, 0, NULL, '2025-07-22 07:54:28', '2025-07-22 07:54:28', NULL, NULL),
(488, 'Fahamida Urmee Shawon', 'emran@maryeamapparels.com', NULL, '01718107222', NULL, NULL, '$2y$12$QnExb/jsR0sV2YGzlPoBPOcGDVZlJMwPMe6wlRX2oVlKekjoeO9Pa', 'user', 1, NULL, 0, NULL, '2025-07-22 08:00:25', '2025-07-22 08:00:25', NULL, NULL),
(489, 'Badsha Alam', 'tex_zone@yahoo.com', NULL, '01716189010', NULL, NULL, '$2y$12$c4eRO2YTkjZSbZQYPi6Ux.u2GA9lcvecHFxbphnDuaW6RIefZN3w.', 'user', 1, NULL, 0, NULL, '2025-07-22 08:11:53', '2025-07-22 08:11:53', NULL, NULL),
(490, 'kiLqmxxubNRl', 'vgeigrd7@gmail.com', NULL, '3591151963', NULL, NULL, '$2y$12$kdxIXsmPglgcGoCeKvUW/.UNxg6RGfl.PZWs77SA9s1wKVBaviswO', 'user', 1, NULL, 0, NULL, '2025-07-23 03:30:36', '2025-07-23 03:30:36', NULL, NULL),
(491, 'Rafjany Rahman Srijan', 'hsprfashion93@gmail.com', NULL, '01932356888', NULL, NULL, '$2y$12$tEiP6j2Uwe2ppr4jgQC4tea7goBetkRd3mPZW.DcaSoYzAnm.r.DS', 'user', 1, NULL, 0, NULL, '2025-07-23 06:56:54', '2025-07-23 06:56:54', NULL, NULL),
(492, 'iXFYgobatxWSCH', 'maleksandrax9@gmail.com', NULL, '4581228175', NULL, NULL, '$2y$12$kladoCM.V0x9fM1R2CeR9ezCXbf.BjvzaAXLMWTrovVRBTL4Ss.vy', 'user', 1, NULL, 0, NULL, '2025-07-24 04:08:29', '2025-07-24 04:08:29', NULL, NULL),
(493, 'hvoCAfdzXfqi', 'ixinubanef08@gmail.com', NULL, '8941157477', NULL, NULL, '$2y$12$dpPvdiekPulC8ymd/iTtYe6UECb1OpeOA1tn7FiiaehO8o27hh9XG', 'user', 1, NULL, 0, NULL, '2025-07-24 09:54:32', '2025-07-24 09:54:32', NULL, NULL),
(494, 'lCKcUdoZqMdmvkk', 'sosboernkc5@gmail.com', NULL, '5255764272', NULL, NULL, '$2y$12$qAXTCn/xAUoOxtrBTUM9EujsBeZeAT1HLtpK5pv2HhiUUDbf.urqq', 'user', 1, NULL, 0, NULL, '2025-07-24 14:51:28', '2025-07-24 14:51:28', NULL, NULL),
(495, 'GzAoGVRfpwxexfr', 'uvobobibo454@gmail.com', NULL, '8729974851', NULL, NULL, '$2y$12$jbZq6VcKDaLYaC7282ZHa.ew/bq/FNTis2FfqcHKtez2ZXh/8i8mi', 'user', 1, NULL, 0, NULL, '2025-07-24 21:11:55', '2025-07-24 21:11:55', NULL, NULL),
(496, 'ipJzmODDstBR', 'kanuyukexir458@gmail.com', NULL, '4649210555', NULL, NULL, '$2y$12$pjEeyIYM.t7h5RbVH4Ufwe/npnQwE1SAZh/562H1dLB1ifeoFz9Tq', 'user', 1, NULL, 0, NULL, '2025-07-25 05:38:04', '2025-07-25 05:38:04', NULL, NULL),
(497, 'BknKiXSUXFpYh', 'azutunadox082@gmail.com', NULL, '7356315576', NULL, NULL, '$2y$12$gk6iqC25Lzx6z5jnu2ukHuA9gykhkntSkoTU4k59VUoxuz9Rrbug6', 'user', 1, NULL, 0, NULL, '2025-07-25 13:02:01', '2025-07-25 13:02:01', NULL, NULL),
(498, 'INwXsqRwIrzrtx', 'irunarij36@gmail.com', NULL, '7029526057', NULL, NULL, '$2y$12$/jMWLIgsKdD60rtqIYZ4/eDS7H/2fVVTCO6UxWmH9bXk9UYs46Lqi', 'user', 1, NULL, 0, NULL, '2025-07-25 21:18:57', '2025-07-25 21:18:57', NULL, NULL),
(499, 'zTHKfsJk', 'larinfmv6@gmail.com', NULL, '7678841215', NULL, NULL, '$2y$12$26LxOq6ulMszHAXp/eWPPeG6vvBkGi4VFLKtHqBVXcIvwPPpWwyC2', 'user', 1, NULL, 0, NULL, '2025-07-25 22:57:49', '2025-07-25 22:57:49', NULL, NULL),
(500, 'SRMJzdrUzCicj', 'afafiyog054@gmail.com', NULL, '8892499294', NULL, NULL, '$2y$12$kwdN369cKywDPjDhiUCVHucjv6s8BZVmzjKk4uqJ6zRekAQj2Lg8K', 'user', 1, NULL, 0, NULL, '2025-07-26 00:15:11', '2025-07-26 00:15:11', NULL, NULL),
(501, 'Mfuehudwj hiwjswdwidjwidji jdiwjswihdfeufhiwj ijdiwjwihdiwkdoq jiwjdwidjwifjei jwdodkwofjiehiehgiejdiw jifjeifjeifwkfijrghis kwoskowfiejifefefefe bemeabd.com', 'nomin.momin+317z7@mail.ru', NULL, '0506915322', NULL, NULL, '$2y$12$8Uujnd56VxLORItvaBjQPuL28dEXW7ePLzlOxkpmbQt9nZWbJA25W', 'user', 1, NULL, 0, NULL, '2025-07-26 02:33:25', '2025-07-26 02:33:25', NULL, NULL);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `breezy_sessions`
--
ALTER TABLE `breezy_sessions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bulk_sms_b_d_logs`
--
ALTER TABLE `bulk_sms_b_d_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `certificate_requests`
--
ALTER TABLE `certificate_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `event_joined_companies`
--
ALTER TABLE `event_joined_companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `event_members`
--
ALTER TABLE `event_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `event_member_tokens`
--
ALTER TABLE `event_member_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fblog_categories`
--
ALTER TABLE `fblog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fblog_category_fblog_post`
--
ALTER TABLE `fblog_category_fblog_post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fblog_comments`
--
ALTER TABLE `fblog_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fblog_news_letters`
--
ALTER TABLE `fblog_news_letters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fblog_posts`
--
ALTER TABLE `fblog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fblog_post_fblog_tag`
--
ALTER TABLE `fblog_post_fblog_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fblog_seo_details`
--
ALTER TABLE `fblog_seo_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fblog_settings`
--
ALTER TABLE `fblog_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fblog_share_snippets`
--
ALTER TABLE `fblog_share_snippets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fblog_tags`
--
ALTER TABLE `fblog_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `memberships`
--
ALTER TABLE `memberships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=405;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `menu_locations`
--
ALTER TABLE `menu_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `renew_memberships`
--
ALTER TABLE `renew_memberships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `sponsors`
--
ALTER TABLE `sponsors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=502;

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
