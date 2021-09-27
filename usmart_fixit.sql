-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2021 at 01:41 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `usmart_fixit`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `type` enum('personal','commercial') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'commercial',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_types`
--

INSERT INTO `account_types` (`id`, `name_ar`, `name_en`, `deleted`, `type`, `created_at`, `updated_at`) VALUES
(1, 'شخصى', 'personal', '0', 'personal', '2021-06-26 13:02:03', '2021-06-26 13:02:03'),
(2, 'مكتب', 'office', '0', 'commercial', '2021-06-26 13:02:21', '2021-06-26 13:02:21'),
(3, 'شركة', 'company', '0', 'commercial', '2021-06-26 13:02:39', '2021-06-26 13:02:39'),
(4, 'مؤسسة', 'Establishment', '0', 'commercial', '2021-06-26 13:03:08', '2021-06-27 08:15:28');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `add_data` tinyint(1) NOT NULL DEFAULT 0,
  `update_data` tinyint(1) NOT NULL DEFAULT 0,
  `delete_data` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `created_at`, `updated_at`, `password`, `add_data`, `update_data`, `delete_data`) VALUES
(1, 'Super Admin', 'admin@admin.com', '2020-02-19 08:44:50', '2020-02-24 14:06:28', '$2y$10$IQ8M6C.879gvIw54Y08.N.D5ATolN9AktgFXBvAlTBxXE5PzRmd5G', 1, 1, 1),
(3, 'manager33', 'admin@admin3.com', '2020-02-19 10:50:31', '2020-02-19 11:06:12', '$2y$10$Ui0gZLEUy6YarW7okzvNgeBsoLfu4h2CndJkPLnZbu2Tcn9AfkQle', 0, 0, 0),
(4, 'test name', 'admin22@admin.com', '2020-02-19 12:43:40', '2020-02-19 12:43:40', '$2y$10$/7h98VQ0XrGgZ14TXiZn4OHMTmrWKoUykt1x5Q6o7h2Kdylo6k/CG', 0, 0, 0),
(5, 'manager4', 'manager@manager.co', '2020-02-19 13:00:00', '2020-02-19 13:00:00', '$2y$10$MHvXZVU8iSMTUhXtO4t8h.JuA80GcGADmmtMyp02DvI7hG5w7wtgi', 0, 0, 0),
(6, 'sadsa', 'asda@hgh.com', '2020-02-19 13:01:11', '2020-02-19 13:01:11', '$2y$10$861HYnfj/D68ZmEFBbaXqOpC7VegdABOBswCG1S00bc9I4HTtY5X.', 0, 0, 0),
(7, 'manager Name', 'manager@man.com', '2020-02-19 13:05:12', '2020-02-19 13:05:12', '$2y$10$dJiHXbxdeQeZk1PGVHEV7.pRrUT.sL7KOXrD4nfXItaOqh8qA1dXa', 0, 0, 0),
(8, 'Admin With Permition', 'admin@admin18.com', '2020-02-19 13:25:11', '2020-02-19 13:25:11', '$2y$10$2rELqWaPoWf/qFmOFiKYn.cCuOVQauWRe.MfKBZUk2jnT2aTtTK2m', 0, 0, 0),
(9, 'test', 'test@test.com', '2020-02-20 05:30:10', '2020-02-20 05:30:10', '$2y$10$7fHeRr886MOh.5E/2AoSTOI3nD9UpmHoIFG1tRbASiLfEk5XZT48O', 0, 0, 0),
(10, 'Admin Tested', 'tested@gmail.com', '2020-02-20 07:17:27', '2020-02-20 07:17:27', '$2y$10$B3TkLlv/T42Z//vMUuSYauAGEk44ae9JDNirmUZwyQ8xbkkzSzPpm', 0, 0, 0),
(11, 'Admin', 'admin28@admin.com', '2020-02-24 08:54:51', '2020-02-24 08:54:51', '$2y$10$tIjEcMcLtdoe5mjscdQrKOvm0rnhwVYpubw/MyBEliDPJQC1HfG2W', 0, 0, 0),
(12, 'gfgf', 'fdf@gh.vom', '2020-02-24 09:01:18', '2020-02-24 09:12:40', '$2y$10$eY.gEsu.8ule1zgs1Pfw1u7gnMKDC5wo.W7MfEj3zQmoD9zPeqGUS', 0, 1, 1),
(13, 'test', 'tets@tetst.com', '2020-04-12 13:26:02', '2020-04-12 13:26:02', '$2y$10$sKuir65TxpW.RrRhzCqRKe/nUKDUnWtv9cujab7ZqDVnFCNSl5UkC', 1, 1, 1),
(14, 'islam', 'islam@islam.com', '2020-07-12 05:22:46', '2020-07-12 05:22:46', '$2y$10$Bv3xrrl0TiSRSwnhrb5q.Oo2M/fYsuR84ioVkalSuR3b1QhQKGj5m', 0, 0, 0),
(15, 'محمد', 'sdfdsfds@sdfsdfsd.com', '2020-09-10 08:43:56', '2020-09-10 08:43:56', '$2y$10$F0jvUoN1.kK819cLUIKx/ejyBudoXvKh63qFjgcgv.AQpmLls7wdq', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `admin_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(27, 8, 1, '2020-02-20 07:16:53', '2020-02-20 07:16:53'),
(28, 8, 4, '2020-02-20 07:16:53', '2020-02-20 07:16:53'),
(29, 8, 5, '2020-02-20 07:16:53', '2020-02-20 07:16:53'),
(30, 8, 8, '2020-02-20 07:16:53', '2020-02-20 07:16:53'),
(31, 8, 9, '2020-02-20 07:16:53', '2020-02-20 07:16:53'),
(61, 10, 4, '2020-02-20 10:39:07', '2020-02-20 10:39:07'),
(62, 10, 5, '2020-02-20 10:39:07', '2020-02-20 10:39:07'),
(63, 10, 6, '2020-02-20 10:39:07', '2020-02-20 10:39:07'),
(64, 10, 7, '2020-02-20 10:39:07', '2020-02-20 10:39:07'),
(65, 10, 8, '2020-02-20 10:39:07', '2020-02-20 10:39:07'),
(66, 10, 9, '2020-02-20 10:39:07', '2020-02-20 10:39:07'),
(67, 10, 10, '2020-02-20 10:39:07', '2020-02-20 10:39:07'),
(116, 1, 1, '2020-02-20 11:18:23', '2020-02-20 11:18:23'),
(117, 1, 2, '2020-02-20 11:18:24', '2020-02-20 11:18:24'),
(118, 1, 3, '2020-02-20 11:18:24', '2020-02-20 11:18:24'),
(119, 1, 4, '2020-02-20 11:18:24', '2020-02-20 11:18:24'),
(120, 1, 5, '2020-02-20 11:18:24', '2020-02-20 11:18:24'),
(121, 1, 6, '2020-02-20 11:18:24', '2020-02-20 11:18:24'),
(122, 1, 7, '2020-02-20 11:18:24', '2020-02-20 11:18:24'),
(123, 1, 8, '2020-02-20 11:18:24', '2020-02-20 11:18:24'),
(124, 1, 9, '2020-02-20 11:18:24', '2020-02-20 11:18:24'),
(125, 1, 10, '2020-02-20 11:18:24', '2020-02-20 11:18:24'),
(126, 3, 1, '2020-02-20 11:21:03', '2020-02-20 11:21:03'),
(127, 3, 2, '2020-02-20 11:21:03', '2020-02-20 11:21:03'),
(128, 3, 3, '2020-02-20 11:21:03', '2020-02-20 11:21:03'),
(129, 3, 4, '2020-02-20 11:21:03', '2020-02-20 11:21:03'),
(130, 3, 5, '2020-02-20 11:21:03', '2020-02-20 11:21:03'),
(131, 3, 6, '2020-02-20 11:21:03', '2020-02-20 11:21:03'),
(132, 3, 7, '2020-02-20 11:21:03', '2020-02-20 11:21:03'),
(133, 3, 8, '2020-02-20 11:21:03', '2020-02-20 11:21:03'),
(134, 3, 9, '2020-02-20 11:21:03', '2020-02-20 11:21:03'),
(135, 3, 10, '2020-02-20 11:21:03', '2020-02-20 11:21:03'),
(136, 9, 1, '2020-02-20 11:21:09', '2020-02-20 11:21:09'),
(137, 9, 2, '2020-02-20 11:21:09', '2020-02-20 11:21:09'),
(138, 9, 3, '2020-02-20 11:21:09', '2020-02-20 11:21:09'),
(139, 9, 4, '2020-02-20 11:21:09', '2020-02-20 11:21:09'),
(140, 9, 5, '2020-02-20 11:21:09', '2020-02-20 11:21:09'),
(141, 9, 6, '2020-02-20 11:21:09', '2020-02-20 11:21:09'),
(142, 9, 7, '2020-02-20 11:21:09', '2020-02-20 11:21:09'),
(143, 9, 8, '2020-02-20 11:21:09', '2020-02-20 11:21:09'),
(144, 9, 9, '2020-02-20 11:21:09', '2020-02-20 11:21:09'),
(145, 9, 10, '2020-02-20 11:21:09', '2020-02-20 11:21:09'),
(146, 7, 1, '2020-02-20 11:21:18', '2020-02-20 11:21:18'),
(147, 7, 2, '2020-02-20 11:21:18', '2020-02-20 11:21:18'),
(148, 7, 3, '2020-02-20 11:21:18', '2020-02-20 11:21:18'),
(149, 7, 4, '2020-02-20 11:21:18', '2020-02-20 11:21:18'),
(150, 7, 5, '2020-02-20 11:21:18', '2020-02-20 11:21:18'),
(151, 7, 6, '2020-02-20 11:21:18', '2020-02-20 11:21:18'),
(152, 7, 7, '2020-02-20 11:21:18', '2020-02-20 11:21:18'),
(153, 7, 8, '2020-02-20 11:21:18', '2020-02-20 11:21:18'),
(154, 7, 9, '2020-02-20 11:21:18', '2020-02-20 11:21:18'),
(155, 7, 10, '2020-02-20 11:21:18', '2020-02-20 11:21:18'),
(156, 6, 5, '2020-02-20 11:21:26', '2020-02-20 11:21:26'),
(157, 6, 9, '2020-02-20 11:21:26', '2020-02-20 11:21:26'),
(158, 5, 6, '2020-02-20 11:21:31', '2020-02-20 11:21:31'),
(159, 5, 10, '2020-02-20 11:21:31', '2020-02-20 11:21:31'),
(160, 4, 6, '2020-02-20 11:21:36', '2020-02-20 11:21:36'),
(161, 4, 10, '2020-02-20 11:21:36', '2020-02-20 11:21:36'),
(162, 11, 1, '2020-02-24 08:54:51', '2020-02-24 08:54:51'),
(163, 11, 2, '2020-02-24 08:54:51', '2020-02-24 08:54:51'),
(164, 11, 3, '2020-02-24 08:54:51', '2020-02-24 08:54:51'),
(165, 11, 4, '2020-02-24 08:54:51', '2020-02-24 08:54:51'),
(166, 11, 5, '2020-02-24 08:54:51', '2020-02-24 08:54:51'),
(167, 11, 6, '2020-02-24 08:54:52', '2020-02-24 08:54:52'),
(168, 11, 7, '2020-02-24 08:54:52', '2020-02-24 08:54:52'),
(169, 11, 8, '2020-02-24 08:54:52', '2020-02-24 08:54:52'),
(170, 11, 9, '2020-02-24 08:54:52', '2020-02-24 08:54:52'),
(171, 11, 10, '2020-02-24 08:54:52', '2020-02-24 08:54:52'),
(212, 12, 1, '2020-02-24 09:12:40', '2020-02-24 09:12:40'),
(213, 12, 2, '2020-02-24 09:12:40', '2020-02-24 09:12:40'),
(214, 12, 3, '2020-02-24 09:12:40', '2020-02-24 09:12:40'),
(215, 12, 4, '2020-02-24 09:12:40', '2020-02-24 09:12:40'),
(216, 12, 5, '2020-02-24 09:12:40', '2020-02-24 09:12:40'),
(217, 12, 6, '2020-02-24 09:12:40', '2020-02-24 09:12:40'),
(218, 12, 7, '2020-02-24 09:12:40', '2020-02-24 09:12:40'),
(219, 12, 8, '2020-02-24 09:12:40', '2020-02-24 09:12:40'),
(220, 12, 9, '2020-02-24 09:12:40', '2020-02-24 09:12:40'),
(221, 12, 10, '2020-02-24 09:12:40', '2020-02-24 09:12:40'),
(222, 13, 2, '2020-04-12 13:26:02', '2020-04-12 13:26:02'),
(223, 13, 4, '2020-04-12 13:26:02', '2020-04-12 13:26:02'),
(224, 13, 6, '2020-04-12 13:26:02', '2020-04-12 13:26:02'),
(225, 13, 7, '2020-04-12 13:26:02', '2020-04-12 13:26:02'),
(226, 13, 10, '2020-04-12 13:26:02', '2020-04-12 13:26:02'),
(227, 13, 11, '2020-04-12 13:26:02', '2020-04-12 13:26:02'),
(228, 1, 11, '2020-04-11 21:00:00', '2020-04-11 21:00:00'),
(229, 1, 13, '2021-01-28 15:46:40', '2021-01-28 15:46:50'),
(230, 1, 14, '2020-07-08 22:00:00', '2020-07-08 22:00:00'),
(231, 14, 1, '2020-07-12 05:22:47', '2020-07-12 05:22:47'),
(232, 14, 2, '2020-07-12 05:22:47', '2020-07-12 05:22:47'),
(233, 14, 4, '2020-07-12 05:22:47', '2020-07-12 05:22:47'),
(234, 14, 13, '2020-07-12 05:22:47', '2020-07-12 05:22:47'),
(235, 14, 14, '2020-07-12 05:22:47', '2020-07-12 05:22:47'),
(236, 15, 3, '2020-09-10 08:43:56', '2020-09-10 08:43:56'),
(237, 15, 6, '2020-09-10 08:43:56', '2020-09-10 08:43:56'),
(239, 1, 16, '2021-01-28 15:46:40', '2021-01-28 15:46:50'),
(240, 1, 17, '2021-01-28 15:46:40', '2021-01-28 15:46:50'),
(241, 1, 18, '2021-01-28 15:46:40', '2021-01-28 15:46:50'),
(242, 1, 19, '2021-01-28 15:46:40', '2021-01-28 15:46:50');

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `place` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `image`, `title_ar`, `title_en`, `deleted`, `city_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 'عبدالله السالم', 'Abdullah al-Salem', '0', 1, '2021-03-01 13:50:15', '2021-04-18 15:33:12'),
(2, NULL, 'العديلية', 'Adailiya', '0', 1, '2021-04-18 15:33:26', '2021-04-18 15:33:26'),
(3, NULL, 'بنيد القار', 'Bnied Al-Gar', '0', 1, '2021-04-18 15:33:36', '2021-04-18 15:33:36'),
(4, NULL, 'الدعية', 'Daiya', '0', 1, '2021-04-18 15:33:49', '2021-04-18 15:33:49'),
(5, NULL, 'الدسمة', 'Dasma', '0', 1, '2021-04-18 15:34:02', '2021-04-18 15:34:02');

-- --------------------------------------------------------

--
-- Table structure for table `balance_packages`
--

CREATE TABLE `balance_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `amount` double NOT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `balance_packages`
--

INSERT INTO `balance_packages` (`id`, `name_ar`, `name_en`, `desc_ar`, `desc_en`, `price`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(2, 'الباقة 1', 'package 1', 'ستحصل على 100 رصيد اعلانى', 'you will got 100 ad balance', 75, 100, 'show', '2021-02-07 05:14:17', '2021-02-07 06:27:58'),
(3, 'الباقة 2', 'package 2', 'ستحصل على 200 رصيد اعلانى', 'you will got 200 ad balance', 20, 200, 'show', '2021-03-02 09:57:54', '2021-03-02 09:57:54');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(10) UNSIGNED NOT NULL,
  `image` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_en` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_ar` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `sort` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `image`, `title_en`, `title_ar`, `deleted`, `sort`, `created_at`, `updated_at`) VALUES
(11, 'pgrs8yd5zqvfx41senlm.png', 'Electrician', 'فني كهربائي', 0, NULL, '2021-09-27 09:05:42', '2021-09-27 09:05:42'),
(12, 'vcsndf3h8yl7ytpioejr.png', 'car service', 'خدمة السيارات', 0, NULL, '2021-09-27 09:06:15', '2021-09-27 09:06:15'),
(13, 'm5p9nnwt0vbw8iufx3w2.png', 'plumbing work', 'أعمال السباكة', 0, NULL, '2021-09-27 09:08:41', '2021-09-27 09:08:41'),
(14, 'v88h1ozbb1vinmu30dja.png', 'satellite technician', 'فنء ستالايت', 0, NULL, '2021-09-27 09:09:43', '2021-09-27 09:09:43'),
(15, 'tzh8my3jsaegzpojoivk.png', 'fix phones', 'صيانة هواتف', 0, NULL, '2021-09-27 09:10:38', '2021-09-27 09:10:38');

-- --------------------------------------------------------

--
-- Table structure for table `categories_ads`
--

CREATE TABLE `categories_ads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ad_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_options`
--

CREATE TABLE `category_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cat_type` enum('category','subcategory','subTwoCategory') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'category',
  `is_required` enum('y','n') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_options`
--

INSERT INTO `category_options` (`id`, `title_ar`, `image`, `title_en`, `deleted`, `cat_id`, `cat_type`, `is_required`, `created_at`, `updated_at`) VALUES
(32, 'نجف', 'yjdahquogq9klexfuph5.png', 'Najaf', '0', 11, 'category', 'y', '2021-09-27 09:20:53', '2021-09-27 09:20:53'),
(33, 'اسبوت', 'yhrzifxnrl9m43h0po0d.png', 'Spot', '0', 11, 'category', 'y', '2021-09-27 09:21:33', '2021-09-27 09:21:33'),
(34, 'مفتاح كهربا', 'ut5h8zfedl9jmz7g86ck.png', 'electric switch', '0', 11, 'category', 'y', '2021-09-27 09:22:04', '2021-09-27 09:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `category_option_values`
--

CREATE TABLE `category_option_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `value_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_option_values`
--

INSERT INTO `category_option_values` (`id`, `value_ar`, `value_en`, `option_id`, `deleted`, `created_at`, `updated_at`) VALUES
(31, 'تركيب', 'Installation', 32, '0', '2021-09-27 09:23:32', '2021-09-27 09:23:32');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `image`, `title_ar`, `title_en`, `deleted`, `created_at`, `updated_at`) VALUES
(1, NULL, 'مدينة الكويت', 'Kuwait city', '0', '2021-03-01 13:46:37', '2021-04-18 15:29:53'),
(2, NULL, 'c', 'Class 3', '1', '2021-04-18 15:28:43', '2021-04-18 15:30:11'),
(3, NULL, 'محافظة حولي', 'Hawalli Governorate', '0', '2021-04-18 15:30:56', '2021-04-18 15:30:56'),
(4, NULL, 'محافظة الفروانية', 'Farwaniya Governorate', '0', '2021-04-18 15:31:20', '2021-04-18 15:31:20'),
(5, NULL, 'محافظة الأحمدي', 'Ahmadi Governorate', '0', '2021-04-18 15:31:38', '2021-04-18 15:31:38'),
(6, NULL, 'محافظة الجهراء', 'Jahra Governorate', '0', '2021-04-18 15:32:02', '2021-04-18 15:32:02'),
(7, NULL, 'محافظة مبارك الكبير', 'Mubarak Al-Kabeer Governorate', '0', '2021-04-18 15:32:26', '2021-04-18 15:32:26');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(10) UNSIGNED NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversations`
--

CREATE TABLE `conversations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `last_message_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `main_ads`
--

CREATE TABLE `main_ads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `main_ads`
--

INSERT INTO `main_ads` (`id`, `image`, `deleted`, `created_at`, `updated_at`) VALUES
(3, 'ri4euo1vt80cisjyi9g0.jpg', '1', '2021-03-01 08:43:31', '2021-04-18 14:50:43');

-- --------------------------------------------------------

--
-- Table structure for table `markas`
--

CREATE TABLE `markas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_en` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_id` bigint(20) NOT NULL,
  `deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `markas`
--

INSERT INTO `markas` (`id`, `image`, `title_en`, `title_ar`, `cat_id`, `deleted`, `created_at`, `updated_at`) VALUES
(1, '', 'sAudi', 'اودى', 0, '1', '2021-01-25 21:04:58', '2021-01-29 10:02:26'),
(2, '', 'sheverolle', 'شيفورليه', 0, '0', '2021-01-19 21:05:04', '2021-01-20 21:05:07');

-- --------------------------------------------------------

--
-- Table structure for table `marka_types`
--

CREATE TABLE `marka_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_en` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `marka_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cat_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marka_types`
--

INSERT INTO `marka_types` (`id`, `image`, `title_en`, `title_ar`, `deleted`, `marka_id`, `cat_id`, `created_at`, `updated_at`) VALUES
(2, '', 'Type1', 'النوع الاول', '0', 1, 0, '2021-01-04 11:30:21', '2021-01-19 11:30:25'),
(3, '', 'type 2020', 'نوع 2020', '0', 2, 0, '2021-01-13 11:30:27', '2021-01-12 11:30:29'),
(5, NULL, 'atype', 'النوع a', '1', 2, 0, '2021-01-29 09:39:25', '2021-01-29 09:57:09'),
(6, NULL, 'sad', 'asd', '0', 2, 0, '2021-01-29 10:02:47', '2021-01-29 10:02:47');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id` bigint(20) UNSIGNED NOT NULL,
  `ad_product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meta_tags`
--

CREATE TABLE `meta_tags` (
  `id` int(11) NOT NULL,
  `home_meta_en` text DEFAULT NULL,
  `home_meta_ar` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;

--
-- Dumping data for table `meta_tags`
--

INSERT INTO `meta_tags` (`id`, `home_meta_en`, `home_meta_ar`, `created_at`, `updated_at`) VALUES
(1, 'test meta tag english22', 'ميتا تاج عربي1', '2020-02-18 12:45:58', '2020-02-18 10:46:21');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(216, '2014_10_12_000000_create_users_table', 1),
(217, '2014_10_12_100000_create_password_resets_table', 1),
(218, '2019_08_19_000000_create_failed_jobs_table', 1),
(219, '2020_01_22_160948_create_ads_table', 1),
(220, '2020_01_23_102549_create_categories_table', 1),
(221, '2020_01_23_114523_create_settings_table', 1),
(222, '2020_01_23_122840_create_contact_us_table', 1),
(223, '2020_01_27_153233_create_doctors_lawyers_table', 1),
(224, '2020_01_28_090727_create_favorites_table', 1),
(225, '2020_01_28_120020_create_rates_table', 1),
(226, '2020_01_28_121824_create_reservations_table', 1),
(227, '2020_01_29_121840_create_services_table', 1),
(228, '2020_01_29_122258_create_doctor_lawyer_services_table', 1),
(229, '2020_01_29_122545_create_place_images_table', 1),
(230, '2020_01_29_123248_create_holidays_table', 1),
(231, '2020_01_29_124130_create_times_of_works_table', 1),
(232, '2021_01_25_204546_create_markas_table', 2),
(233, '2021_01_25_204641_create_marka_types_table', 2),
(234, '2021_01_25_204702_create_type_models_table', 2),
(235, '2021_01_30_194124_create_mndobs_table', 3),
(236, '2021_01_31_170741_create_product_views_table', 4),
(237, '2021_02_01_195859_create_product_features_table', 5),
(238, '2021_02_03_073507_create_category_options_table', 6),
(239, '2021_02_03_073527_create_category_option_values_table', 6),
(240, '2021_02_03_103018_create_main_ads_table', 7),
(241, '2021_02_04_071812_create_wallet_transactions_table', 8),
(242, '2021_02_07_063618_create_balance_packages_table', 9),
(244, '2021_02_10_102827_create_vistors_table', 10),
(245, '2021_02_11_141842_create_categories_ads_table', 11),
(246, '2021_02_11_123410_create_sub_five_categories_table', 12),
(247, '2021_03_01_151256_create_cities_table', 13),
(248, '2021_03_01_151306_create_areas_table', 13),
(249, '2021_02_17_102345_create_conversations_table', 14),
(250, '2021_02_17_102435_create_messages_table', 15),
(251, '2021_06_20_121917_create_product_reports_table', 16),
(252, '2021_06_21_113313_create_product_comments_table', 17),
(253, '2021_06_26_144746_create_account_types_table', 18),
(254, '2021_07_07_132844_create_specialties_table', 19),
(255, '2021_07_07_132845_create_user_specialties_table', 19),
(256, '2021_09_27_141045_create_product_categories_table', 20);

-- --------------------------------------------------------

--
-- Table structure for table `mndobs`
--

CREATE TABLE `mndobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `watsapp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mndobs`
--

INSERT INTO `mndobs` (`id`, `name_ar`, `name_en`, `image`, `phone`, `watsapp`, `status`, `deleted`, `created_at`, `updated_at`) VALUES
(2, 'ونج', 'wong', 'b5n26ycilxqv9bkvt4iy.jpg', '012015555', 'sadasdwqdesa', 'show', '0', '2021-01-30 19:33:09', '2021-02-04 06:39:38');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `body`, `image`, `created_at`, `updated_at`) VALUES
(5, 'fdssdf', 'dsffds', NULL, '2020-02-18 07:53:57', '2020-02-18 07:53:57'),
(6, 'fdssdf', 'dsffds', NULL, '2020-02-18 07:54:29', '2020-02-18 07:54:29'),
(7, 'fdssdf', 'dsffds', NULL, '2020-02-18 07:55:28', '2020-02-18 07:55:28'),
(8, 'dg', 'dg', NULL, '2020-02-18 07:56:19', '2020-02-18 07:56:19'),
(9, 'fdsafds', 'fdsfds', NULL, '2020-02-18 07:59:14', '2020-02-18 07:59:14'),
(10, 'testy', 'test body', NULL, '2020-02-18 08:04:13', '2020-02-18 08:04:13'),
(11, 'test', 'test', NULL, '2020-02-18 08:06:42', '2020-02-18 08:06:42'),
(12, 'test title', 'test body', NULL, '2020-02-18 08:20:55', '2020-02-18 08:20:55'),
(13, 'test title', 'test body', NULL, '2020-02-18 08:34:20', '2020-02-18 08:34:20'),
(14, 'test title', 'test body', NULL, '2020-02-18 08:35:09', '2020-02-18 08:35:09'),
(15, 'test title', 'test body', NULL, '2020-02-18 08:36:22', '2020-02-18 08:36:22'),
(16, 'test title', 'test body', NULL, '2020-02-18 08:36:54', '2020-02-18 08:36:54'),
(17, 'dsfds', 'dsfdsf', NULL, '2020-02-18 08:37:54', '2020-02-18 08:37:54'),
(18, 'dsfds', 'dsfdsf', NULL, '2020-02-18 08:38:16', '2020-02-18 08:38:16'),
(19, 'fdsfdsfds', 'fdsfdsfds', NULL, '2020-02-18 08:38:30', '2020-02-18 08:38:30'),
(20, 'fdsfdsfds', 'fdsfdsfds', NULL, '2020-02-18 08:54:51', '2020-02-18 08:54:51'),
(21, 'fdsfdsfds', 'fdsfdsfds', NULL, '2020-02-18 08:55:30', '2020-02-18 08:55:30'),
(22, 'fdsfdsfds', 'fdsfdsfds', NULL, '2020-02-18 08:56:04', '2020-02-18 08:56:04'),
(23, 'test', 'test', 'fq6jmy7et4peztea3l8b.jpg', '2020-02-18 09:00:34', '2020-02-18 09:00:34'),
(24, 'test15', 'test', 'ai3t1cmrm9u1rgvhaz0u.jpg', '2020-02-18 09:01:07', '2020-02-18 09:01:07'),
(25, 'test notification', 'body of notification', NULL, '2020-04-05 15:46:01', '2020-04-05 15:46:01'),
(26, 'عنوان التنبيه', 'محتوي التنبيه', 'dx0dtkuqxpurdk0zisv0.jpg', '2020-04-05 15:52:55', '2020-04-05 15:52:55'),
(27, 'تجربة تنبيهات المشروع الاساسي', 'تجربة تنبيهات المشروع الاساسي', 'h6ouw1vxkznnwstb9alw.png', '2020-04-09 15:56:16', '2020-04-09 15:56:16'),
(28, 'تجربة تنبيهات المشروع الاساسي', 'تجربة تنبيهات المشروع الاساسي', 'mvdhb0hopuwicnkkvvuy.png', '2020-04-09 16:00:58', '2020-04-09 16:00:58'),
(29, 'تجربة تنبيهات المشروع الاساسي', 'تجربة تنبيهات المشروع الاساسي', 'qsiyls7q1zi7iekmpidr.jpg', '2020-04-09 16:01:23', '2020-04-09 16:01:23'),
(30, 'Station title', 'body of notification', 'nghr5rp3fodgtolhujuk.png', '2020-04-12 08:11:45', '2020-04-12 08:11:45'),
(31, 'Station title', 'محتوي التنبيه', 'jfllgeese8rcvzwmwcxd.jpg', '2020-04-12 09:33:44', '2020-04-12 09:33:44'),
(32, 'test', 'test', 'qtanf7wvpu3twivexxlk.jpg', '2020-04-12 09:41:37', '2020-04-12 09:41:37'),
(33, 'test', 'test', 'rulwoahqi97pevyn5qb5.jpg', '2020-04-12 09:42:00', '2020-04-12 09:42:00'),
(34, 'test', 'test', 'fzpxjvzfhhjiwzafoaiu.jpg', '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(35, 'new test', 'test', 'rwanlczldh5nhf4bdynt.jpg', '2020-04-12 09:44:14', '2020-04-12 09:44:14'),
(36, 'test notification', 'body of notification', 'ew9aeb3f7gqeutpi0f7r.jpg', '2020-04-12 12:58:35', '2020-04-12 12:58:35'),
(37, 'عنوان التنبيه', 'المحتوي', 'tmfj7vkyj7ukje6ltxx8.jpg', '2020-04-12 13:32:38', '2020-04-12 13:32:38'),
(38, 'عنوان التنبيه', 'محتوي التنبيه', 'oos4vgryeuxyb7cuhlpw.jpg', '2020-04-12 13:34:26', '2020-04-12 13:34:26'),
(39, 'تجربة تنبيه الخميس', 'تجربة إرسال تنبيه لكل التليفونات لتطبيق جمعية الدرة النسائية', NULL, '2020-04-15 09:20:42', '2020-04-15 09:20:42'),
(40, 'Directions Service (Complex)', 'تجربة إرسال تنبيه لكل التليفونات لتطبيق جمعية الدرة النسائية', 'j7thnwktslalm1etras3.png', '2020-04-15 10:20:21', '2020-04-15 10:20:21'),
(41, 'Basic Project Notifications', 'Basic Project Notifications details to see text aligned at left side', 'yd87gqafq2sii8hjxcia.png', '2020-04-15 10:23:02', '2020-04-15 10:23:02'),
(42, 'Mahmoud Alam', 'Mahmoud Alam Notifications', 'objdnasw1n3unwb39bsb.jpg', '2020-04-15 10:27:35', '2020-04-15 10:27:35'),
(43, 'التطبيق الأساسي', 'تجربة إرسال تنبيهات للتطبيق الأساسي', 'wjgx6vyyhktvstoez780.jpg', '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(44, 'Directions Service (Complex)', 'تنبيه تجربة من لوحة التحكم الخاصة بالتطبيق', NULL, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(45, 'نظام لتقييم الموظفين أون لاين', 'Basic Project Notifications details to see text aligned at left side', NULL, '2020-04-15 10:29:54', '2020-04-15 10:29:54'),
(46, 'Directions Service (Complex)', 'Basic Project Notifications details to see text aligned at left side', 'udkqbtzkq3dvwemgyn84.jpg', '2020-04-15 10:30:15', '2020-04-15 10:30:15'),
(47, 'Directions Service (Complex)', 'Basic Project Notifications details to see text aligned at left side', NULL, '2020-04-15 10:32:31', '2020-04-15 10:32:31'),
(48, 'Directions Service (Complex)', 'Basic Project Notifications details to see text aligned at left side', 'dx4zp9na4qf4bkbtch25.jpg', '2020-04-15 10:33:07', '2020-04-15 10:33:07'),
(49, 'موقع للتوظيف', 'test send notification with image from dashboard', 'amr5cp2zs2fthvlvxq6d.png', '2020-04-20 18:24:03', '2020-04-20 18:24:03'),
(50, 'موقع للتوظيف', 'test send notification with image from dashboard', 'oaizrxn2aokeudlwmnmy.png', '2020-04-20 18:25:24', '2020-04-20 18:25:24'),
(52, 'تجربة تنبيه الخميس', 'تجربة تنبيه تطبيق الإعلانات من خلال لوحة التحكم', NULL, '2020-06-25 09:43:48', '2020-06-25 09:43:48'),
(53, 'تجربة تنبيه الخميس', 'تنبيه تجربة من لوحة التحكم الخاصة بالتطبيق', 'gehdgvm4gtllyr3gqhsq.png', '2020-06-25 09:44:13', '2020-06-25 09:44:13'),
(54, 'test', 'test', 'yieqs7c6ftrgpaavuzm5.png', '2020-07-19 09:16:53', '2020-07-19 09:16:53'),
(55, 'lkk', 'kkjj', NULL, '2020-07-21 10:22:07', '2020-07-21 10:22:07'),
(56, 'lkklk', 'lklklk', NULL, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(57, 'title', '123', 'shoqulfcnydgeytft9aj.jpg', '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(58, 'test', 'body test', 'j2bfpvmjgwqgwqjxk8qy.jpg', '2021-02-10 09:07:59', '2021-02-10 09:07:59'),
(59, 'sdada', 'asdadad', 'jaagz5vy2dmbqxqxsmmu.jpg', '2021-02-10 09:10:27', '2021-02-10 09:10:27'),
(60, 'sdf', 'sadf', 'dfd1pe6yucvdqynm4ocy.jpg', '2021-02-10 09:12:12', '2021-02-10 09:12:12'),
(61, 'تجربة تنبيه', 'تجربة تنبيه', NULL, '2021-04-18 16:11:28', '2021-04-18 16:11:28'),
(62, 'صباح الخير', 'صباح الخير', NULL, '2021-04-21 12:38:46', '2021-04-21 12:38:46'),
(63, 'Test', 'Test', NULL, '2021-06-05 11:26:08', '2021-06-05 11:26:08'),
(64, 'Test2', 'Test2', NULL, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(65, 'Test3', 'Test3', NULL, '2021-06-05 11:37:18', '2021-06-05 11:37:18'),
(66, 'Test4', 'Test4', NULL, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(67, 'Test', 'Test', NULL, '2021-06-05 12:16:30', '2021-06-05 12:16:30'),
(68, 'Test', 'Test', NULL, '2021-06-05 13:09:50', '2021-06-05 13:09:50');

-- --------------------------------------------------------

--
-- Table structure for table `participants`
--

CREATE TABLE `participants` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `other_user_id` bigint(20) UNSIGNED NOT NULL,
  `conversation_id` bigint(20) UNSIGNED NOT NULL,
  `ad_product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `status` enum('show','hide') NOT NULL DEFAULT 'show',
  `permission_ar` varchar(255) NOT NULL,
  `permission_en` varchar(255) NOT NULL,
  `order_by_it` bigint(20) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `status`, `permission_ar`, `permission_en`, `order_by_it`, `created_at`, `updated_at`) VALUES
(1, 'show', 'المستخدمين', 'Users', 1, '2020-02-19 14:04:33', '2020-02-19 14:04:33'),
(2, 'show', 'صفحات التطبيق', 'App Pages', 11, '2020-02-19 14:05:13', '2020-02-19 14:05:13'),
(3, 'show', 'الإعلانات الاساسية', 'basic Ads', 5, '2020-02-19 14:06:10', '2020-02-19 14:06:10'),
(4, 'show', 'الأقسام', 'Categories', 3, '2020-02-19 14:06:44', '2020-02-19 14:06:44'),
(5, 'show', 'إتصل بنا', 'Contact Us', 9, '2020-02-19 14:07:10', '2020-02-19 14:07:10'),
(6, 'show', 'التبيهات', 'Notifications', 10, '2020-02-19 14:07:55', '2020-02-19 14:07:55'),
(7, 'show', 'الإعدادات', 'Settings', 12, '2020-02-19 14:08:34', '2020-02-19 14:08:34'),
(8, 'show', 'وسوم البحث', 'Meta Tags', 0, '2020-02-19 14:09:06', '2020-02-19 14:09:06'),
(9, 'show', 'المديرين', 'Managers', 13, '2020-02-19 14:09:59', '2020-02-19 14:09:59'),
(10, 'show', 'تنزيل النسخة الإحتياطية', 'Database Backup', 14, '2020-02-19 14:10:21', '2020-02-19 14:10:21'),
(13, 'show', 'الاعلانات', 'ads', 2, '2020-07-08 22:00:00', '2020-07-08 22:00:00'),
(14, 'hide', 'باقات الاعلانات', 'Plans', 6, '2020-07-08 22:00:00', '2020-07-08 22:00:00'),
(16, 'hide', 'باقات الرصيد', 'Balance Packages', 7, '2020-07-08 22:00:00', '2020-07-08 22:00:00'),
(17, 'show', 'التخصصات', 'specialties', 7, '2020-07-08 22:00:00', '2020-07-08 22:00:00'),
(18, 'show', 'أنواع الحساب التجاري', 'Business account types', 8, '2020-07-08 22:00:00', '2020-07-08 22:00:00'),
(19, 'show', 'المحافظات', 'Provinces', 4, '2020-07-08 22:00:00', '2020-07-08 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `cat_id` varchar(255) NOT NULL,
  `day_num` int(11) DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  `status` enum('show','hide') NOT NULL DEFAULT 'show',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `title_ar`, `title_en`, `cat_id`, `day_num`, `price`, `deleted`, `status`, `created_at`, `updated_at`) VALUES
(15, 'الاساسى', 'Basic', '1', 8, 8.00, '1', 'show', '2021-01-26 17:22:50', '2021-02-20 08:16:14'),
(16, 'الاساسي', 'Basic', 'all', 100, 3.00, '0', 'show', '2021-01-26 17:22:50', '2021-04-18 15:52:04'),
(17, 'مميز', 'Special', '3', 91, 5.50, '1', 'show', '2021-01-26 17:23:22', '2021-04-18 15:53:48'),
(20, 'مثيت', 'pined', 'all', 92, 10.50, '1', 'show', '2021-02-04 09:28:41', '2021-04-18 15:53:51'),
(25, 'الممتاز', 'Excellent', 'all', 120, 6.00, '0', 'hide', '2021-04-18 15:54:38', '2021-04-21 12:38:25'),
(26, 'المثالي', 'ideal', 'all', 200, 10.00, '0', 'show', '2021-04-18 15:55:35', '2021-04-18 15:55:35');

-- --------------------------------------------------------

--
-- Table structure for table `plan_details`
--

CREATE TABLE `plan_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('expier_num','features','re_post','pin','special') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'features',
  `expire_days` bigint(20) DEFAULT NULL,
  `status` enum('show','hide') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plan_details`
--

INSERT INTO `plan_details` (`id`, `title_ar`, `title_en`, `plan_id`, `type`, `expire_days`, `status`, `created_at`, `updated_at`) VALUES
(2, 'يعرض ل 100 يوم', 'display for 100 day', 16, 'expier_num', 100, 'show', '2021-01-26 17:25:27', '2021-04-18 15:52:04'),
(8, 'يعرض ل 92 يوم', 'display for 92 day', 20, 'expier_num', 92, 'show', '2021-02-04 09:28:41', '2021-04-17 16:56:39'),
(10, 'يعرض ل 15 يوم', 'Display for 30 day', 15, 'expier_num', 15, 'show', '2021-01-26 17:25:27', '2021-01-26 17:25:27'),
(11, 'يعرض ل 91 يوم', 'display for 91 day', 17, 'expier_num', 91, 'show', '2021-01-26 17:25:27', '2021-04-17 16:56:27'),
(12, 'سيارات فقط', 'سيارات فقط', 17, 'special', 0, 'show', '2021-01-26 17:25:27', '2021-04-17 16:56:27'),
(13, 'يتم تثبيتة فى الاعلى لمدة 72 ساعة', 'To be fixed on top for 72 hours', 20, 'pin', 3, 'show', '2021-01-26 17:25:27', '2021-02-04 10:27:41'),
(23, 'اعادة', 'repost', 20, 're_post', 2, 'show', '2021-02-14 13:50:51', '2021-02-14 13:50:51'),
(24, 'مميزة', 'مميزة', 20, 'special', 5, 'show', '2021-02-14 13:50:51', '2021-04-17 16:56:39'),
(25, 'يعرض ل 120 يوم', 'display for 120 day', 25, 'expier_num', 120, 'show', '2021-04-18 15:54:38', '2021-04-18 15:54:38'),
(26, 'اعادة نشرة فى المكان الاول كل 8 أيام', 'Republish every 8 days', 25, 're_post', 8, 'show', '2021-04-18 15:54:38', '2021-04-18 15:54:38'),
(27, 'يعرض ل 200 يوم', 'display for 200 day', 26, 'expier_num', 200, 'show', '2021-04-18 15:55:35', '2021-04-18 15:55:35'),
(28, 'اعادة نشرة فى المكان الاول كل 8 أيام', 'Republish every 8 days', 26, 're_post', 8, 'show', '2021-04-18 15:55:35', '2021-04-18 15:55:35'),
(29, 'يتم تثبيته فى الاعلى لمدة 72 ساعة', 'It is pined on top for 72 hours', 26, 'pin', 72, 'show', '2021-04-18 15:55:35', '2021-04-18 15:55:35');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_ar` varchar(300) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `description_ar` text NOT NULL,
  `description_en` varchar(255) NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) DEFAULT NULL,
  `sub_category_two_id` int(11) DEFAULT NULL,
  `sub_category_three_id` int(11) DEFAULT NULL,
  `sub_category_four_id` int(11) DEFAULT NULL,
  `sub_category_five_id` bigint(20) UNSIGNED DEFAULT NULL,
  `main_image` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `views` int(11) NOT NULL DEFAULT 0,
  `offer` tinyint(1) NOT NULL DEFAULT 0,
  `choose_it` int(11) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1,
  `deleted` int(20) NOT NULL DEFAULT 0,
  `publish` enum('Y','N') NOT NULL DEFAULT 'N',
  `publication_date` timestamp NULL DEFAULT NULL,
  `expiry_date` timestamp NULL DEFAULT NULL,
  `retweet_date` timestamp NULL DEFAULT NULL,
  `retweet` int(11) DEFAULT 0,
  `expire_pin_date` timestamp NULL DEFAULT NULL,
  `feature` int(11) NOT NULL DEFAULT 0,
  `plan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `share_location` enum('0','1') NOT NULL DEFAULT '1',
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `pin` int(11) NOT NULL DEFAULT 0,
  `re_post` enum('0','1') NOT NULL DEFAULT '0',
  `re_post_date` timestamp NULL DEFAULT NULL,
  `is_special` enum('0','1') NOT NULL DEFAULT '0',
  `expire_special_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title_ar`, `title_en`, `description_ar`, `description_en`, `price`, `category_id`, `sub_category_id`, `sub_category_two_id`, `sub_category_three_id`, `sub_category_four_id`, `sub_category_five_id`, `main_image`, `user_id`, `type`, `views`, `offer`, `choose_it`, `status`, `deleted`, `publish`, `publication_date`, `expiry_date`, `retweet_date`, `retweet`, `expire_pin_date`, `feature`, `plan_id`, `city_id`, `area_id`, `share_location`, `latitude`, `longitude`, `pin`, `re_post`, `re_post_date`, `is_special`, `expire_special_date`, `created_at`, `updated_at`) VALUES
(91, 'نادر يوسف', 'nader yosef', 'بشيلبسيليسلبسيلي', 'fdggfgfsdfgfsdg', 200.00, 11, NULL, NULL, NULL, NULL, NULL, 'gus2ae5cibrm40wcdopn.jpg', NULL, 1, 0, 0, 0, 1, 0, 'Y', NULL, NULL, NULL, 0, NULL, 0, NULL, 1, NULL, '1', NULL, NULL, 0, '0', NULL, '0', NULL, '2021-09-27 12:28:43', '2021-09-27 12:28:43');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_id`, `cat_id`, `created_at`, `updated_at`) VALUES
(1, 91, 14, '2021-09-27 12:28:43', '2021-09-27 12:28:43'),
(2, 91, 15, '2021-09-27 12:28:43', '2021-09-27 12:28:43'),
(3, 91, 16, '2021-09-27 12:28:43', '2021-09-27 12:28:43');

-- --------------------------------------------------------

--
-- Table structure for table `product_comments`
--

CREATE TABLE `product_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('new','accepted','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_features`
--

CREATE TABLE `product_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `image` varchar(300) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_reports`
--

CREATE TABLE `product_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('new','seen','take action') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_views`
--

CREATE TABLE `product_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `rate` int(11) NOT NULL,
  `admin_approval` tinyint(1) NOT NULL DEFAULT 0,
  `order_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`id`, `user_id`, `text`, `rate`, `admin_approval`, `order_id`, `created_at`, `updated_at`) VALUES
(1, 17, 'test', 3, 1, 1, '2020-03-22 06:19:48', '2020-03-22 06:19:48'),
(2, 21, 'test', 4, 1, 1, '2020-04-07 20:37:47', '2020-04-15 17:45:26'),
(3, 25, 'اهلا وسهلا', 5, 1, 1, '2020-04-12 20:03:13', '2020-04-15 17:45:01'),
(4, 26, 'Hhh', 5, 1, 1, '2020-04-13 13:44:29', '2020-04-15 17:45:24'),
(5, 27, 'تجربة إرسال تقييم من البوستمان', 4, 1, 1, '2020-04-15 17:10:00', '2020-04-15 17:12:48'),
(6, 27, 'this product is very sweet and good packing', 5, 1, 2, '2020-04-15 17:44:48', '2020-04-15 17:44:58'),
(7, 27, 'this product is very sweet and good packing', 5, 1, 3, '2020-04-15 17:46:26', '2020-04-15 17:46:35'),
(8, 27, 'this product is very sweet and good packing', 5, 1, 5, '2020-04-15 17:50:07', '2020-04-15 17:50:52'),
(9, 27, 'this product is very sweet and good packing', 5, 1, 4, '2020-04-15 17:50:32', '2020-04-15 17:50:53'),
(10, 27, 'this product is very sweet and good packing', 5, 1, 6, '2020-04-15 17:51:53', '2020-04-15 17:52:16'),
(11, 27, 'test', 3, 0, 10, '2020-04-21 12:31:24', '2020-04-21 12:31:24'),
(12, 27, 'test', 4, 0, 100, '2020-04-21 12:31:38', '2020-04-21 12:31:38'),
(13, 27, 'test', 4, 0, 111, '2020-04-21 12:38:58', '2020-04-21 12:38:58'),
(14, 27, 'على فكره في صوره صباحيه رسائل اسلامية رسائل نكت', 4, 0, 112, '2020-04-21 12:40:55', '2020-04-21 12:40:55'),
(15, 27, 'test', 4, 0, 141, '2020-04-21 12:43:28', '2020-04-21 12:43:28'),
(16, 27, 'تحميل برنامج ايه يا عم الشيخ الحويني في مجال المبيعات اونلاين', 5, 0, 156, '2020-04-21 13:00:52', '2020-04-21 13:00:52'),
(17, 27, 'على فكره في صوره صباحيه رسائل اسلامية رسائل نكت', 4, 0, 166, '2020-04-21 13:07:01', '2020-04-21 13:07:01'),
(18, 22, 'test', 3, 0, 1, '2020-04-29 17:43:38', '2020-04-29 17:43:38');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `termsandconditions_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `termsandconditions_ar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `aboutapp_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `aboutapp_ar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `counter_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expier_days` int(11) NOT NULL DEFAULT 1,
  `app_name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_name_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(350) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instegram` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snap_chat` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_loop_free_balance` enum('y','n') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `free_loop_period` bigint(20) NOT NULL,
  `free_loop_balance` double(8,2) NOT NULL,
  `free_loop_date` timestamp NULL DEFAULT NULL,
  `post_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free_balance` double(8,2) NOT NULL DEFAULT 0.00,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free_ads_count` int(11) NOT NULL,
  `ad_period` int(11) NOT NULL,
  `offer_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `offer_image_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_buy` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `app_phone`, `termsandconditions_en`, `termsandconditions_ar`, `aboutapp_en`, `aboutapp_ar`, `counter_image`, `created_at`, `updated_at`, `expier_days`, `app_name_en`, `app_name_ar`, `logo`, `email`, `phone`, `address_en`, `address_ar`, `facebook`, `youtube`, `twitter`, `instegram`, `map_url`, `latitude`, `longitude`, `snap_chat`, `is_loop_free_balance`, `free_loop_period`, `free_loop_balance`, `free_loop_date`, `post_address`, `free_balance`, `fax`, `free_ads_count`, `ad_period`, `offer_image`, `offer_image_en`, `show_buy`) VALUES
(1, '0096566848259', '<p>hello terms test</p>', '<p><br />\r\n<br />\r\nمرحباً بك فى ( وينر) ، هذه هي سياسة الإستخدام والشروط والأحكام الخاصة بالتطبيق وإستخدامك له وكل متعلقاته و خدماته ، بموافقتك على (الشروط والأحكام) بالإضافة إلى المعلومات ذات العلاقة المدرجة في هذه الإتفاقية وبإستخدامك التطبيق ، فإنك توضح لنا أنك ملزم بهذه الشروط الخاصة بــ ( وينر ).<br />\r\n<br />\r\nإن استخدامك لتطبيق ( وينر ) يعني موافقتك على تفعيل إتفاقية المستخدم، وان كنت غير موافق على إتفاقية المستخدم، فمن فضلك لا تدخل أو تسجل أو تستخدم هذا التطبيق .<br />\r\n<br />\r\nقبل أن تكون أو تستمر كعضو معنا , لابد أن تقرأ وتوافق على إتفاقية المستخدم وعلى سياسة الخصوصية الخاصة بـ ( وينر ) والدخول إلى أى معلومات متصلة أخرى بخصوص إتفاقية المستخدم مثل أى معلومات مرتبطة بسياسة الإستخدام المطبقة على المستخدم، كل هذه المعلومات وسياسة الخصوصية يتم تطبيقها بموجب هذا القانون الموجود فى إتفاقية المستخدم .<br />\r\n<br />\r\n<br />\r\n<br />\r\nنود في ( وينر ) أن نتأكد من قدرة كل الأعضاء على تكوين عقود إلزام قانونية يحتفظ بحقه فى وضع حد أو إستبعاد عضوية أى شخص يخالف السياسة ، من جهة أخرى، ففى حالة الدخول إلى التطبيق ككيان تجاري أو شخصية إعتبارية, فإنك تؤكد أنك يمكنك إخضاع هذا الكيان إلى إتفاقية المستخدم وأنك والكيان التجاري خاضعين لكافة القوانين المرتبطة بالتجارة عبر الإنترنت.<br />\r\n<br />\r\n<br />\r\n<br />\r\nعند التسجيل كعضو فى التطبيق، يجب عليك تقديم معلومات معينة وتسجيل إسم المستخدم والرقم السرى الخاص بك .<br />\r\n<br />\r\nعندما تصبح عضو بالتطبيق فإنك توافق على الآتي:<br />\r\n<br />\r\nأ- مسؤوليتك في الحفاظ على خصوصية وتقييد إستخدام حسابك الخاص والرقم السرى الخاص بك.<br />\r\n<br />\r\nب- إقرارك بمسؤليتك الكاملة تجاه الأنشطة التي تحدث من خلال حسابك الخاص ورقمك السري، وأنك ستقوم بإبلاغ ( وينر ) عن أي إستخدام غير مشروع لرقمك السري أو حسابك الخاص أو أي خرق أمني.<br />\r\n<br />\r\nج- لن يكون تطبيق ( وينر ) مسئولاً عن أى خسارة مباشرة أو غير مباشرة فى فساد البضاعة من ناحيتك .<br />\r\n<br />\r\nد- لا يمكنك إستخدام الحساب الخاص بشخص آخر بدون إظهار تصريح القبول لحامل الحساب.<br />\r\n<br />\r\nهـ- أن عضويتك تعنى موافقتك على تعويض ( وينر ) عن أى إستخدام غير مشروع لحسابك الخاص عن طريقك أو عن طريق أي شخص آخر يستطيع الوصول للتطبيق والخدمات من خلال استخدام إسم المستخدم الخاص بك ورقمك السري سواء كنت تعلم أو لا تعلم بهذا الإستخدام.<br />\r\n<br />\r\nو- أن تمنحنا معلومات صحيحة ودقيقة وحالية وكاملة عنك كما هو مطلوب فى إستمارة التسجيل (بيانات التسجيل) الخاصة بـ ( وينر ) .<br />\r\n<br />\r\nز- أن لا تضع كلمة &quot; ( وينر ) &quot; في إسم المستخدم الخاص بك.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>', '<p>hello ther ^_^</p>', '<p><span style=\"font-size:18px\">تطبيق فستان أول تطبيق كويتي لعرض وبيع الملابس الجديدة والمستعملة حيث يوفر لك عرض منتجاتك بكل سهولة والتصفح المعروضات والتواصل مع المعلن بضغطة زر</span></p>', 'ardumevbg8l4xsyjpn7q.jpg', '2020-02-05 09:15:45', '2021-09-27 09:03:17', 7, NULL, 'Herage', 'cxzrmshz1eu6uiijlldi.png', 'info@fastan-store.com', '0096566848259', 'Kuwait', 'كويت', 'facebook.com', 'youtube.com', 'twitter.com', 'Fastan_store.com', 'https://www.google.com/maps/@30.0430715,31.4056989,16z', '30.0430715', '31.4056989', 'Fastanstore20.com', 'n', 20, 50.00, '2021-03-09 04:10:00', '2222222', 50.00, '1111111', 3, 365, 'va5jpf5vukmyp2ffgbfi.png', 'wxomesfemvssxk0bxfmv.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `specialties`
--

CREATE TABLE `specialties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `specialties`
--

INSERT INTO `specialties` (`id`, `name_ar`, `name_en`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 'عقارات مؤقتة', 'temporary properties', '0', '2021-07-07 12:14:42', '2021-07-07 12:14:42'),
(2, 'تمويل عقاري', 'Real Estate Finance', '0', '2021-07-07 12:15:12', '2021-07-07 13:09:47'),
(3, 'سيارات', 'cars', '0', '2021-07-07 12:15:29', '2021-07-07 12:15:29');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `category_id` bigint(11) UNSIGNED NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `title_en`, `title_ar`, `image`, `deleted`, `category_id`, `sort`, `created_at`, `updated_at`) VALUES
(14, 'Establishing', 'تأسيس', 'vt9gm79ffx7sch4ryhik.png', 0, 11, NULL, '2021-09-27 11:13:58', '2021-09-27 11:13:58'),
(15, 'finishing', 'تشطيب', 'rwnzx2qwhrvitrrl3agp.png', 0, 11, NULL, '2021-09-27 11:14:17', '2021-09-27 11:15:20'),
(16, 'maintenance', 'صيانة', 'feap9s4qtobqakbhlrkk.png', 0, 11, NULL, '2021-09-27 11:15:41', '2021-09-27 11:15:41');

-- --------------------------------------------------------

--
-- Table structure for table `sub_five_categories`
--

CREATE TABLE `sub_five_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_en` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_four_categories`
--

CREATE TABLE `sub_four_categories` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `sub_category_id` bigint(11) UNSIGNED NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sub_three_categories`
--

CREATE TABLE `sub_three_categories` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `sub_category_id` bigint(11) UNSIGNED NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sub_two_categories`
--

CREATE TABLE `sub_two_categories` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `sub_category_id` bigint(11) UNSIGNED NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `type_models`
--

CREATE TABLE `type_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` bigint(20) DEFAULT NULL,
  `deleted` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `marka_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type_models`
--

INSERT INTO `type_models` (`id`, `image`, `year`, `deleted`, `marka_type_id`, `created_at`, `updated_at`) VALUES
(1, '', 2018, '0', 3, '2021-01-12 12:48:24', '2021-01-29 11:44:51'),
(2, '', 2001, '0', 2, '2021-01-12 12:48:27', NULL),
(4, NULL, 2013, '0', 3, '2021-01-29 11:42:21', '2021-01-29 11:42:21'),
(5, NULL, 2015, '0', 3, '2021-01-29 12:00:55', '2021-01-29 12:00:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `watsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  `account_type` bigint(20) NOT NULL DEFAULT 1,
  `my_wallet` double(8,2) NOT NULL DEFAULT 0.00,
  `free_balance` double(8,2) NOT NULL DEFAULT 0.00,
  `payed_balance` double(8,2) NOT NULL DEFAULT 0.00,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `seen` tinyint(1) DEFAULT 0,
  `free_ads_count` int(11) NOT NULL,
  `paid_ads_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `watsapp`, `email`, `phone_verified_at`, `password`, `image`, `cover`, `about_user`, `city_id`, `area_id`, `account_type`, `my_wallet`, `free_balance`, `payed_balance`, `fcm_token`, `verified`, `remember_token`, `created_at`, `updated_at`, `active`, `seen`, `free_ads_count`, `paid_ads_count`) VALUES
(103, 'test user', '012566653995', '', 'islam@islam.com', NULL, '$2y$10$cmqb1YE40oHpjZ7c1Ii15OJLGh8ANqT5ujvCmcmfr6pmTIuWgfp3.', 'ean6e0hlouf5xo4irorl.jpg', 'c2shainqf1epk2rxdnew.jpg', 'test about', 1, 1, 2, 290.50, 190.50, 100.00, 'test', 1, NULL, '2021-01-26 09:44:53', '2021-09-02 12:38:19', 1, 1, 3, 150),
(104, 'mohamed nasser', '01111651415', NULL, 'nasser@gmail.com', NULL, '$2y$10$40htJaCVadAYsclUVwt4DO9OAxcDkhdT1Rg5WMnCNcqxPgZ.s/PCi', NULL, NULL, NULL, NULL, NULL, 1, 105.00, 105.00, 0.00, 'test', 1, NULL, '2021-02-07 03:39:21', '2021-02-07 04:33:10', 1, 1, 0, 0),
(105, 'mohamed nasser2', '01111651455', NULL, 'nasser2@gmail.com', NULL, '$2y$10$C2VjvUQiIu4K27RJtX7iZOvIHd.XTm6abFgugXXwvbj6i54BVZSGG', NULL, NULL, NULL, NULL, NULL, 1, 50.00, 50.00, 0.00, '11111', 1, NULL, '2021-02-10 08:55:12', '2021-02-10 08:55:12', 1, 1, 0, 0),
(106, 'ahmed ali', '+96501116344148', NULL, 'nasser@gmai1l.com', NULL, '$2y$10$X0f8P0NIUlJBjT5g8RJOV.e0kk8IH7NRN7ox.YmHxsp25EWokpQz6', 'z8prntlqxxklczmplbrv.png', NULL, NULL, NULL, NULL, 1, 1426.50, 1426.50, 0.00, 'deI6kg_YQ0S1PXNBOh4uPK:APA91bHUJudsUtTu37XKqHn07s7SLAsue0aVKq6XX8-2CRstdSqeIJOG2hWW6fOs-tkQntniC4y4PFWCNIQ-Ny-0Mqrn0O8YpxBKNrEWxw4UgdYOb_zcPHIiFEglVPcyZvENtrmQ-wNa', 1, NULL, '2021-03-20 12:35:30', '2021-06-12 14:57:09', 1, 1, 0, 0),
(107, 'Mostafa', '+96501115353169', NULL, 'sasasa@sdasdsa.com', NULL, '$2y$10$f9akg2Rr8xr.jmEmc7MYPOYNBmM.oqy2JfspercBeggNFhKBUEHui', 'vrjfvezxlrfyv94iozmy.jpg', NULL, NULL, NULL, NULL, 1, 917.50, 917.50, 0.00, 'test', 1, NULL, '2021-04-12 11:48:21', '2021-06-13 13:57:06', 1, 1, 1000, 0),
(108, 'Nouh', '9687374', NULL, 'ttt@gmail.com', NULL, '$2y$10$x7ZGxJaUeHec4MOSkTvzx.NZJSbaMwnw0cwj16LgUTNF14zCjvpfq', NULL, NULL, NULL, NULL, NULL, 1, 50.00, 50.00, 0.00, '11111', 1, NULL, '2021-04-18 14:31:58', '2021-04-18 14:31:58', 1, 1, 0, 0),
(109, 'ibrahim salah elsayed', '01016045028', NULL, 'ibrahimsalah093@gmail.com', NULL, '$2y$10$WeUJ08US/tyjzqICsw97l.pKSK49abVlbCR2S2JO1/nIfHsIszVvS', 'xi5mv7yelfss7yztpitu.jpg', NULL, NULL, NULL, NULL, 1, 50.00, 50.00, 0.00, 'test', 1, NULL, '2021-04-29 04:59:06', '2021-05-16 22:32:16', 1, 1, 0, 0),
(110, 'Ibrahim Salah', '+96501016045028', NULL, 'ibrahimsalah93@gmail.com', NULL, '$2y$10$iveIGYtiZIXMYCCmwL0Hmec5YTLcUwt8QFpktd6VRpqGl/ZnaQexG', 'unqasbj8s2ccbkhxbsg7.jpg', NULL, NULL, NULL, NULL, 1, 44.00, 44.00, 0.00, 'fCjtjrYWWkSMiEuHE-MrFn:APA91bFhL30eXM46DGAGV-wi1XYncksPbGu_-jj5YZazFglQNFApnbjuvuKW4t4V-SdrEk8wtoQ8sUF7RKVXiOQ4DuXNEVw6Thc_XDY4A9RN7Vh_AHBUtGmf7K_XxZirc7HtMuR-wjvy', 1, NULL, '2021-04-29 22:56:10', '2021-05-29 15:35:23', 1, 1, 0, 0),
(111, 'AboNasser', '+96596669636', NULL, 'admin545@admin.com', NULL, '$2y$10$3BGVk5qwtHuzTVzxgfA6bOaZaNN9p/NNzDP97GOg.6jBk1iRNiuT2', NULL, NULL, NULL, NULL, NULL, 1, 281.00, 281.00, 0.00, 'test', 1, NULL, '2021-05-24 11:35:35', '2021-08-22 16:10:35', 1, 1, 3, 0),
(112, 'nouh taha', '+96501116344147', NULL, 'nassdder2@gmail.com', NULL, '$2y$10$3Lon0f47iPkWIWtjVv7pS.hHr8x/MTfYkAQTbcFcRVxYdiHHc77UK', NULL, NULL, NULL, NULL, NULL, 1, 8.00, 8.00, 0.00, 'dLCGE9OSSbi4Mgv5cytsat:APA91bGVkP5UUVr0ajB9i_QNTal1PyZkq_krpxmJ0H9cSaHyPMqo432_aNEJzqToU5VeB93jK87VIBmPhieA2yJrA9SkSO4PniJyMPlaqB7boCvwcCJxVOaEB1sb65qp9Mn48TBDytSt', 1, NULL, '2021-06-02 14:35:13', '2021-06-13 09:43:26', 1, 1, 0, 0),
(113, 'tesla user', '01094641332', NULL, 'mohamedengnasser20@gmail.com', NULL, '$2y$10$pD7xptCLuZDyYSi158lEvOBwT4ZdYoWv6YJPskGnYHlk4NeLxvZs6', NULL, NULL, NULL, NULL, NULL, 1, 50.00, 50.00, 0.00, '123456', 1, NULL, '2021-06-20 09:00:04', '2021-06-20 09:00:04', 1, 1, 0, 0),
(114, 'Mahmoud Alam', '+201110837797', NULL, 'mahmoudalam1973@yahoo.co.uk', NULL, '$2y$10$JKKkNV12uRLND2FYawHbi.gXdK92vmgXeDQ70WAOs7vBZD3GBlJcq', 'qu310habvwiaio8hqcvs.jpg', 'pczsd5qvkfld3np8jcxi.jpg', 'السلام عليكم ورحمه الله وبركاته ازيك يا هندسة ايه اخبارك واخبار الاهل كلهم بخير وصحة وعافية وستر ان شاءالله تعالى', 1, 5, 3, 50.00, 50.00, 0.00, 'ca4iGeplR6CW5PNFT6jWz1:APA91bENcxfXPJVJM-amlwGKD7Rt1w83yxue49sFsRddK1OPfdrtPWcI0S4e-iZz7yqidRNJi219DTT5mrRH5cErj9v9khHkyCgk86yqnkm4Rber0pGm2sMwIbHWuXkRkx2Mh3W-mi64', 1, NULL, '2021-08-22 16:03:32', '2021-09-07 18:23:28', 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `visitor_id` int(20) DEFAULT NULL,
  `notification_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `user_id`, `visitor_id`, `notification_id`, `created_at`, `updated_at`) VALUES
(1, 23, NULL, 25, '2020-04-05 15:46:01', '2020-04-05 15:46:01'),
(2, 23, NULL, 26, '2020-04-05 15:52:55', '2020-04-05 15:52:55'),
(3, 24, NULL, 27, '2020-04-09 15:56:16', '2020-04-09 15:56:16'),
(4, 24, NULL, 31, '2020-04-12 09:33:44', '2020-04-12 09:33:44'),
(5, 24, NULL, 32, '2020-04-12 09:41:37', '2020-04-12 09:41:37'),
(6, 1, NULL, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(7, 2, NULL, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(8, 3, NULL, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(9, 4, NULL, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(10, 5, NULL, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(11, 6, NULL, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(12, 7, NULL, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(13, 8, NULL, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(14, 9, NULL, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(15, 10, NULL, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(16, 11, NULL, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(17, 16, NULL, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(18, 17, NULL, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(19, 21, NULL, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(20, 22, NULL, 34, '2020-04-12 09:43:56', '2020-04-12 09:43:56'),
(21, 23, NULL, 34, '2020-04-12 09:43:56', '2020-04-12 09:43:56'),
(22, 24, NULL, 34, '2020-04-12 09:43:56', '2020-04-12 09:43:56'),
(23, 1, NULL, 35, '2020-04-12 09:44:14', '2020-04-12 09:44:14'),
(24, 2, NULL, 35, '2020-04-12 09:44:14', '2020-04-12 09:44:14'),
(25, 3, NULL, 35, '2020-04-12 09:44:14', '2020-04-12 09:44:14'),
(26, 4, NULL, 35, '2020-04-12 09:44:14', '2020-04-12 09:44:14'),
(27, 5, NULL, 35, '2020-04-12 09:44:14', '2020-04-12 09:44:14'),
(28, 6, NULL, 35, '2020-04-12 09:44:14', '2020-04-12 09:44:14'),
(29, 7, NULL, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(30, 8, NULL, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(31, 9, NULL, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(32, 10, NULL, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(33, 11, NULL, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(34, 16, NULL, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(35, 17, NULL, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(36, 21, NULL, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(37, 22, NULL, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(38, 23, NULL, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(39, 24, NULL, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(40, 24, NULL, 36, '2020-04-12 12:58:35', '2020-04-12 12:58:35'),
(41, 24, NULL, 37, '2020-04-12 13:32:38', '2020-04-12 13:32:38'),
(42, 24, NULL, 38, '2020-04-12 13:34:26', '2020-04-12 13:34:26'),
(43, 27, NULL, 39, '2020-04-15 09:20:42', '2020-04-15 09:20:42'),
(44, 27, NULL, 40, '2020-04-15 10:20:21', '2020-04-15 10:20:21'),
(45, 27, NULL, 41, '2020-04-15 10:23:02', '2020-04-15 10:23:02'),
(46, 27, NULL, 42, '2020-04-15 10:27:35', '2020-04-15 10:27:35'),
(47, 1, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(48, 2, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(49, 3, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(50, 4, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(51, 5, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(52, 6, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(53, 7, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(54, 8, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(55, 9, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(56, 10, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(57, 11, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(58, 13, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(59, 16, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(60, 17, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(61, 21, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(62, 22, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(63, 23, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(64, 24, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(65, 25, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(66, 26, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(67, 27, NULL, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(68, 1, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(69, 2, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(70, 3, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(71, 4, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(72, 5, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(73, 6, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(74, 7, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(75, 8, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(76, 9, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(77, 10, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(78, 11, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(79, 13, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(80, 16, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(81, 17, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(82, 21, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(83, 22, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(84, 23, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(85, 24, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(86, 25, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(87, 26, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(88, 27, NULL, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(89, 27, NULL, 45, '2020-04-15 10:29:54', '2020-04-15 10:29:54'),
(90, 27, NULL, 46, '2020-04-15 10:30:15', '2020-04-15 10:30:15'),
(91, 27, NULL, 47, '2020-04-15 10:32:31', '2020-04-15 10:32:31'),
(92, 27, NULL, 48, '2020-04-15 10:33:07', '2020-04-15 10:33:07'),
(93, 27, NULL, 49, '2020-04-20 18:24:03', '2020-04-20 18:24:03'),
(94, 27, NULL, 50, '2020-04-20 18:25:24', '2020-04-20 18:25:24'),
(95, 22, NULL, 51, '2020-06-23 05:49:54', '2020-06-23 05:49:54'),
(96, 22, NULL, 52, '2020-06-25 09:43:48', '2020-06-25 09:43:48'),
(97, 22, NULL, 53, '2020-06-25 09:44:13', '2020-06-25 09:44:13'),
(98, 1, NULL, 54, '2020-07-19 09:16:53', '2020-07-19 09:16:53'),
(99, 2, NULL, 54, '2020-07-19 09:16:53', '2020-07-19 09:16:53'),
(100, 3, NULL, 54, '2020-07-19 09:16:53', '2020-07-19 09:16:53'),
(101, 4, NULL, 54, '2020-07-19 09:16:53', '2020-07-19 09:16:53'),
(102, 5, NULL, 54, '2020-07-19 09:16:53', '2020-07-19 09:16:53'),
(103, 6, NULL, 54, '2020-07-19 09:16:54', '2020-07-19 09:16:54'),
(104, 7, NULL, 54, '2020-07-19 09:16:54', '2020-07-19 09:16:54'),
(105, 8, NULL, 54, '2020-07-19 09:16:54', '2020-07-19 09:16:54'),
(106, 9, NULL, 54, '2020-07-19 09:16:54', '2020-07-19 09:16:54'),
(107, 10, NULL, 54, '2020-07-19 09:16:54', '2020-07-19 09:16:54'),
(108, 11, NULL, 54, '2020-07-19 09:16:54', '2020-07-19 09:16:54'),
(109, 13, NULL, 54, '2020-07-19 09:16:54', '2020-07-19 09:16:54'),
(110, 16, NULL, 54, '2020-07-19 09:16:54', '2020-07-19 09:16:54'),
(111, 17, NULL, 54, '2020-07-19 09:16:54', '2020-07-19 09:16:54'),
(112, 21, NULL, 54, '2020-07-19 09:16:54', '2020-07-19 09:16:54'),
(113, 22, NULL, 54, '2020-07-19 09:16:54', '2020-07-19 09:16:54'),
(114, 23, NULL, 54, '2020-07-19 09:16:54', '2020-07-19 09:16:54'),
(115, 24, NULL, 54, '2020-07-19 09:16:55', '2020-07-19 09:16:55'),
(116, 25, NULL, 54, '2020-07-19 09:16:55', '2020-07-19 09:16:55'),
(117, 26, NULL, 54, '2020-07-19 09:16:55', '2020-07-19 09:16:55'),
(118, 27, NULL, 54, '2020-07-19 09:16:55', '2020-07-19 09:16:55'),
(119, 31, NULL, 54, '2020-07-19 09:16:55', '2020-07-19 09:16:55'),
(120, 32, NULL, 54, '2020-07-19 09:16:55', '2020-07-19 09:16:55'),
(121, 33, NULL, 54, '2020-07-19 09:16:55', '2020-07-19 09:16:55'),
(122, 34, NULL, 54, '2020-07-19 09:16:55', '2020-07-19 09:16:55'),
(123, 35, NULL, 54, '2020-07-19 09:16:55', '2020-07-19 09:16:55'),
(124, 13, NULL, 55, '2020-07-21 10:22:07', '2020-07-21 10:22:07'),
(125, 1, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(126, 2, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(127, 3, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(128, 4, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(129, 5, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(130, 6, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(131, 7, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(132, 8, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(133, 9, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(134, 10, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(135, 11, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(136, 13, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(137, 16, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(138, 17, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(139, 21, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(140, 22, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(141, 23, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(142, 24, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(143, 25, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(144, 26, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(145, 27, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(146, 31, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(147, 32, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(148, 33, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(149, 34, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(150, 35, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(151, 37, NULL, 56, '2020-07-21 10:22:34', '2020-07-21 10:22:34'),
(152, 13, NULL, 57, '2020-07-21 10:56:16', '2020-07-21 10:56:16'),
(153, 13, NULL, 58, '2020-07-21 10:56:51', '2020-07-21 10:56:51'),
(154, 13, NULL, 59, '2020-07-21 10:57:23', '2020-07-21 10:57:23'),
(155, 13, NULL, 60, '2020-07-21 11:04:32', '2020-07-21 11:04:32'),
(156, 1, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(157, 2, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(158, 3, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(159, 4, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(160, 5, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(161, 6, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(162, 7, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(163, 8, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(164, 9, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(165, 10, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(166, 11, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(167, 13, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(168, 16, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(169, 17, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(170, 21, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(171, 22, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(172, 23, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(173, 24, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(174, 25, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(175, 26, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(176, 27, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(177, 31, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(178, 32, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(179, 33, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(180, 34, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(181, 35, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(182, 37, NULL, 61, '2020-07-21 11:08:30', '2020-07-21 11:08:30'),
(183, 22, NULL, 62, '2020-07-21 11:21:49', '2020-07-21 11:21:49'),
(184, 22, NULL, 63, '2020-07-21 11:22:50', '2020-07-21 11:22:50'),
(185, 22, NULL, 64, '2020-07-21 11:24:31', '2020-07-21 11:24:31'),
(186, 40, NULL, 65, '2020-07-23 12:38:48', '2020-07-23 12:38:48'),
(187, 1, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(188, 2, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(189, 3, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(190, 4, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(191, 5, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(192, 6, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(193, 7, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(194, 8, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(195, 9, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(196, 10, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(197, 11, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(198, 13, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(199, 16, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(200, 17, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(201, 21, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(202, 22, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(203, 23, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(204, 24, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(205, 25, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(206, 26, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(207, 27, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(208, 31, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(209, 32, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(210, 33, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(211, 34, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(212, 35, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(213, 37, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(214, 38, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(215, 40, NULL, 66, '2020-07-23 12:42:36', '2020-07-23 12:42:36'),
(216, 40, NULL, 67, '2020-07-23 12:48:02', '2020-07-23 12:48:02'),
(217, 22, NULL, 68, '2020-07-23 12:49:24', '2020-07-23 12:49:24'),
(218, 22, NULL, 69, '2020-07-23 12:49:35', '2020-07-23 12:49:35'),
(219, 40, NULL, 70, '2020-07-23 12:51:19', '2020-07-23 12:51:19'),
(220, 40, NULL, 71, '2020-07-23 12:52:29', '2020-07-23 12:52:29'),
(221, 40, NULL, 72, '2020-07-23 12:53:29', '2020-07-23 12:53:29'),
(222, 22, NULL, 73, '2020-07-23 13:05:15', '2020-07-23 13:05:15'),
(223, 1, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(224, 2, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(225, 3, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(226, 4, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(227, 5, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(228, 6, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(229, 7, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(230, 8, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(231, 9, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(232, 10, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(233, 11, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(234, 13, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(235, 16, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(236, 17, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(237, 21, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(238, 22, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(239, 23, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(240, 24, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(241, 25, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(242, 26, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(243, 27, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(244, 31, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(245, 32, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(246, 33, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(247, 34, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(248, 35, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(249, 37, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(250, 38, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(251, 40, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(252, 41, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(253, 42, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(254, 43, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(255, 44, NULL, 74, '2020-09-10 08:41:38', '2020-09-10 08:41:38'),
(256, 1, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(257, 2, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(258, 3, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(259, 4, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(260, 5, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(261, 6, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(262, 7, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(263, 8, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(264, 9, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(265, 10, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(266, 11, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(267, 13, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(268, 16, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(269, 17, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(270, 21, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(271, 22, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(272, 23, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(273, 24, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(274, 25, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(275, 26, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(276, 27, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(277, 31, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(278, 32, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(279, 33, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(280, 34, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(281, 35, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(282, 37, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(283, 38, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(284, 40, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(285, 41, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(286, 42, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(287, 43, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(288, 44, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(289, 45, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(290, 46, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(291, 47, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(292, 48, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(293, 49, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(294, 50, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(295, 51, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(296, 52, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(297, 53, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(298, 54, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(299, 55, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(300, 56, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(301, 57, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(302, 58, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(303, 59, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(304, 60, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(305, 61, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(306, 62, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(307, 63, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(308, 64, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(309, 65, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(310, 66, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(311, 67, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(312, 68, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(313, 69, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(314, 70, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(315, 71, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(316, 72, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(317, 73, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(318, 74, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(319, 75, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(320, 76, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(321, 77, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(322, 78, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(323, 79, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(324, 80, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(325, 81, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(326, 82, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(327, 83, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(328, 84, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(329, 85, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(330, 86, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(331, 87, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(332, 88, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(333, 89, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(334, 90, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(335, 91, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(336, 92, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(337, 93, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(338, 94, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(339, 95, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(340, 96, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(341, 97, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(342, 98, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(343, 99, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(344, 100, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(345, 101, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(346, 102, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(347, 103, NULL, 57, '2021-02-01 17:36:10', '2021-02-01 17:36:10'),
(348, 1, 1, 58, '2021-02-10 09:07:59', '2021-02-10 09:07:59'),
(349, 105, 1, 59, '2021-02-10 09:10:27', '2021-02-10 09:10:27'),
(350, 105, 1, 60, '2021-02-10 09:12:12', '2021-02-10 09:12:12'),
(351, 108, 1, 61, '2021-04-18 16:11:28', '2021-04-18 16:11:28'),
(352, 103, 2, 61, '2021-04-18 16:11:28', '2021-04-18 16:11:28'),
(353, 106, 3, 61, '2021-04-18 16:11:28', '2021-04-18 16:11:28'),
(354, 106, 4, 61, '2021-04-18 16:11:28', '2021-04-18 16:11:28'),
(355, 107, 5, 61, '2021-04-18 16:11:28', '2021-04-18 16:11:28'),
(356, 106, 6, 61, '2021-04-18 16:11:28', '2021-04-18 16:11:28'),
(357, 106, 7, 61, '2021-04-18 16:11:28', '2021-04-18 16:11:28'),
(358, 108, 1, 62, '2021-04-21 12:38:47', '2021-04-21 12:38:47'),
(359, 103, 2, 62, '2021-04-21 12:38:47', '2021-04-21 12:38:47'),
(360, 106, 3, 62, '2021-04-21 12:38:47', '2021-04-21 12:38:47'),
(361, 106, 4, 62, '2021-04-21 12:38:47', '2021-04-21 12:38:47'),
(362, 107, 5, 62, '2021-04-21 12:38:47', '2021-04-21 12:38:47'),
(363, 106, 6, 62, '2021-04-21 12:38:47', '2021-04-21 12:38:47'),
(364, 106, 7, 62, '2021-04-21 12:38:47', '2021-04-21 12:38:47'),
(365, 112, 1, 63, '2021-06-05 11:26:08', '2021-06-05 11:26:08'),
(366, 107, 2, 63, '2021-06-05 11:26:08', '2021-06-05 11:26:08'),
(367, 106, 3, 63, '2021-06-05 11:26:08', '2021-06-05 11:26:08'),
(368, 106, 4, 63, '2021-06-05 11:26:08', '2021-06-05 11:26:08'),
(369, 107, 5, 63, '2021-06-05 11:26:08', '2021-06-05 11:26:08'),
(370, 106, 6, 63, '2021-06-05 11:26:08', '2021-06-05 11:26:08'),
(371, 107, 7, 63, '2021-06-05 11:26:08', '2021-06-05 11:26:08'),
(372, 107, 8, 63, '2021-06-05 11:26:08', '2021-06-05 11:26:08'),
(373, 106, 9, 63, '2021-06-05 11:26:08', '2021-06-05 11:26:08'),
(374, 110, 10, 63, '2021-06-05 11:26:08', '2021-06-05 11:26:08'),
(375, 107, 11, 63, '2021-06-05 11:26:08', '2021-06-05 11:26:08'),
(376, 107, 12, 63, '2021-06-05 11:26:09', '2021-06-05 11:26:09'),
(377, 107, 13, 63, '2021-06-05 11:26:09', '2021-06-05 11:26:09'),
(378, 107, 14, 63, '2021-06-05 11:26:09', '2021-06-05 11:26:09'),
(379, 111, 15, 63, '2021-06-05 11:26:09', '2021-06-05 11:26:09'),
(380, 111, 16, 63, '2021-06-05 11:26:09', '2021-06-05 11:26:09'),
(381, 112, 17, 63, '2021-06-05 11:26:09', '2021-06-05 11:26:09'),
(382, 107, 18, 63, '2021-06-05 11:26:09', '2021-06-05 11:26:09'),
(383, 107, 19, 63, '2021-06-05 11:26:09', '2021-06-05 11:26:09'),
(384, 107, 20, 63, '2021-06-05 11:26:09', '2021-06-05 11:26:09'),
(385, 106, 21, 63, '2021-06-05 11:26:09', '2021-06-05 11:26:09'),
(386, 112, 1, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(387, 107, 2, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(388, 106, 3, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(389, 106, 4, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(390, 107, 5, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(391, 106, 6, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(392, 107, 7, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(393, 107, 8, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(394, 106, 9, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(395, 110, 10, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(396, 107, 11, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(397, 107, 12, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(398, 107, 13, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(399, 107, 14, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(400, 111, 15, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(401, 111, 16, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(402, 112, 17, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(403, 107, 18, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(404, 107, 19, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(405, 107, 20, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(406, 106, 21, 64, '2021-06-05 11:32:39', '2021-06-05 11:32:39'),
(407, 112, 1, 65, '2021-06-05 11:37:18', '2021-06-05 11:37:18'),
(408, 107, 2, 65, '2021-06-05 11:37:18', '2021-06-05 11:37:18'),
(409, 106, 3, 65, '2021-06-05 11:37:18', '2021-06-05 11:37:18'),
(410, 106, 4, 65, '2021-06-05 11:37:18', '2021-06-05 11:37:18'),
(411, 107, 5, 65, '2021-06-05 11:37:18', '2021-06-05 11:37:18'),
(412, 106, 6, 65, '2021-06-05 11:37:18', '2021-06-05 11:37:18'),
(413, 107, 7, 65, '2021-06-05 11:37:18', '2021-06-05 11:37:18'),
(414, 107, 8, 65, '2021-06-05 11:37:18', '2021-06-05 11:37:18'),
(415, 106, 9, 65, '2021-06-05 11:37:18', '2021-06-05 11:37:18'),
(416, 110, 10, 65, '2021-06-05 11:37:18', '2021-06-05 11:37:18'),
(417, 107, 11, 65, '2021-06-05 11:37:18', '2021-06-05 11:37:18'),
(418, 107, 12, 65, '2021-06-05 11:37:18', '2021-06-05 11:37:18'),
(419, 107, 13, 65, '2021-06-05 11:37:18', '2021-06-05 11:37:18'),
(420, 107, 14, 65, '2021-06-05 11:37:18', '2021-06-05 11:37:18'),
(421, 111, 15, 65, '2021-06-05 11:37:18', '2021-06-05 11:37:18'),
(422, 111, 16, 65, '2021-06-05 11:37:18', '2021-06-05 11:37:18'),
(423, 112, 17, 65, '2021-06-05 11:37:18', '2021-06-05 11:37:18'),
(424, 107, 18, 65, '2021-06-05 11:37:18', '2021-06-05 11:37:18'),
(425, 107, 19, 65, '2021-06-05 11:37:18', '2021-06-05 11:37:18'),
(426, 107, 20, 65, '2021-06-05 11:37:19', '2021-06-05 11:37:19'),
(427, 106, 21, 65, '2021-06-05 11:37:19', '2021-06-05 11:37:19'),
(428, 112, 1, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(429, 107, 2, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(430, 106, 3, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(431, 106, 4, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(432, 107, 5, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(433, 106, 6, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(434, 107, 7, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(435, 107, 8, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(436, 106, 9, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(437, 110, 10, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(438, 107, 11, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(439, 107, 12, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(440, 107, 13, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(441, 107, 14, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(442, 111, 15, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(443, 111, 16, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(444, 112, 17, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(445, 107, 18, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(446, 107, 19, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(447, 107, 20, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(448, 106, 21, 66, '2021-06-05 12:04:07', '2021-06-05 12:04:07'),
(449, 112, 1, 67, '2021-06-05 12:16:30', '2021-06-05 12:16:30'),
(450, 107, 2, 67, '2021-06-05 12:16:30', '2021-06-05 12:16:30'),
(451, 106, 3, 67, '2021-06-05 12:16:30', '2021-06-05 12:16:30'),
(452, 106, 4, 67, '2021-06-05 12:16:30', '2021-06-05 12:16:30'),
(453, 107, 5, 67, '2021-06-05 12:16:30', '2021-06-05 12:16:30'),
(454, 106, 6, 67, '2021-06-05 12:16:30', '2021-06-05 12:16:30'),
(455, 107, 7, 67, '2021-06-05 12:16:30', '2021-06-05 12:16:30'),
(456, 107, 8, 67, '2021-06-05 12:16:30', '2021-06-05 12:16:30'),
(457, 106, 9, 67, '2021-06-05 12:16:30', '2021-06-05 12:16:30'),
(458, 110, 10, 67, '2021-06-05 12:16:30', '2021-06-05 12:16:30'),
(459, 107, 11, 67, '2021-06-05 12:16:30', '2021-06-05 12:16:30'),
(460, 107, 12, 67, '2021-06-05 12:16:30', '2021-06-05 12:16:30'),
(461, 107, 13, 67, '2021-06-05 12:16:30', '2021-06-05 12:16:30'),
(462, 107, 14, 67, '2021-06-05 12:16:30', '2021-06-05 12:16:30'),
(463, 111, 15, 67, '2021-06-05 12:16:30', '2021-06-05 12:16:30'),
(464, 111, 16, 67, '2021-06-05 12:16:31', '2021-06-05 12:16:31'),
(465, 112, 17, 67, '2021-06-05 12:16:31', '2021-06-05 12:16:31'),
(466, 107, 18, 67, '2021-06-05 12:16:31', '2021-06-05 12:16:31'),
(467, 107, 19, 67, '2021-06-05 12:16:31', '2021-06-05 12:16:31'),
(468, 107, 20, 67, '2021-06-05 12:16:31', '2021-06-05 12:16:31'),
(469, 106, 21, 67, '2021-06-05 12:16:31', '2021-06-05 12:16:31'),
(470, 112, 1, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50'),
(471, 107, 2, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50'),
(472, 106, 3, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50'),
(473, 106, 4, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50'),
(474, 107, 5, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50'),
(475, 106, 6, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50'),
(476, 107, 7, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50'),
(477, 107, 8, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50'),
(478, 106, 9, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50'),
(479, 110, 10, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50'),
(480, 107, 11, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50'),
(481, 107, 12, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50'),
(482, 107, 13, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50'),
(483, 107, 14, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50'),
(484, 111, 15, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50'),
(485, 111, 16, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50'),
(486, 112, 17, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50'),
(487, 107, 18, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50'),
(488, 107, 19, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50'),
(489, 107, 20, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50'),
(490, 106, 21, 68, '2021-06-05 13:09:50', '2021-06-05 13:09:50');

-- --------------------------------------------------------

--
-- Table structure for table `user_specialties`
--

CREATE TABLE `user_specialties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `special_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_specialties`
--

INSERT INTO `user_specialties` (`id`, `user_id`, `special_id`, `created_at`, `updated_at`) VALUES
(20, 103, 2, '2021-09-02 12:38:19', '2021-09-02 12:38:19'),
(21, 103, 3, '2021-09-02 12:38:19', '2021-09-02 12:38:19'),
(25, 114, 2, '2021-09-02 22:39:36', '2021-09-02 22:39:36');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` bigint(20) NOT NULL DEFAULT 1,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `unique_id`, `fcm_token`, `type`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '2222222', '11111', 1, 112, '2021-02-10 08:52:14', '2021-06-02 14:35:13'),
(2, 'unique_id', 'test', 2, 103, '2021-02-14 14:33:28', '2021-08-31 20:51:26'),
(3, '528244d378adc2f4', 'fGcN6kKIQiOirT3ubW9HkN:APA91bE0HGJMDRVT1PM5TvEWqXdPWbHZLvOjByBkkHQgEoKgW-fkXkhuQneySO3xbDw1fbcq32UMDr-plYxIr4NxqimVwepQsxxxb7o2VPsRy09s4NcVsJ8ZebAGCA7hwqpB9TlPFwMD', 2, 106, '2021-03-20 12:37:35', '2021-03-20 12:37:35'),
(4, 'd17eb533a4012171', 'dC_x-1E2TKealr3Zf-Yf4q:APA91bGi_xB8vAuWcphvMSE4OPv6tCMtJx9-GTfG2C8j2Nem4jOVKoySr4px3qoOS091n7QPX-RexVmWl6T-oeoAkRwrDgsbEu7HwLenmaW8VHTTSbjv12xtD5uMfDfzx-ey2fsfYUQi', 2, 106, '2021-03-20 16:35:36', '2021-03-20 16:35:36'),
(5, 'a6b555ac991f43f0', 'null', 2, 107, '2021-04-12 11:49:55', '2021-04-12 11:49:55'),
(6, '565759728b1ce7bd', 'null', 2, 106, '2021-04-13 13:15:32', '2021-04-13 13:15:32'),
(7, '475fc210f037a76a', 'null', 2, 107, '2021-04-18 15:11:44', '2021-04-21 13:04:12'),
(8, 'b8fa86d537ec75d1', 'null', 2, 107, '2021-04-25 12:48:27', '2021-04-25 12:48:27'),
(9, 'a4b65b86f292717c', 'null', 2, 106, '2021-04-26 12:56:58', '2021-04-26 12:56:58'),
(10, '8F46C751-8C3E-493D-B704-7D7A7F6CAAFD', 'Test', 1, 110, '2021-04-29 04:59:06', '2021-05-29 15:35:23'),
(11, '43F6A01D-1C1A-44D3-967D-B2994702B8AB', 'Test', 1, 107, '2021-04-29 22:56:10', '2021-04-30 20:26:15'),
(12, 'e1b1e55be659d2ab', 'null', 2, 107, '2021-04-29 22:56:44', '2021-04-30 22:18:14'),
(13, 'BDB54316-AC13-4526-A2B9-8403617CC168', 'test', 1, 107, '2021-05-05 22:18:29', '2021-05-29 13:31:06'),
(14, '83cb3572d6b91987', 'null', 2, 107, '2021-05-13 18:49:03', '2021-05-13 18:49:03'),
(15, '4db1d4a325a287fd', 'null', 2, 111, '2021-05-24 11:58:44', '2021-05-24 11:58:44'),
(16, '0c4d49fe7967dd4c', 'null', 2, 111, '2021-05-24 19:31:07', '2021-05-24 19:31:07'),
(17, '01a5a0260a6ae9c9', 'ceJdwsBxRXqEXyErCPy44L:APA91bFc-6naVFRPT80wMQx4vFQ5iqqwm5eTcfGVgA4mNOstb7_AQ4Hu4PClqjod8GE1NLqssdbFFe0qBzrQe8zaly_WdQx_Yo5_v6QafeV_LP8A8H9wk-oT5PKfqZ5CO2yb-0AYyr2C', 2, 112, '2021-05-26 12:05:19', '2021-06-02 14:35:53'),
(18, '0dad0d2d55776f21', 'null', 2, 107, '2021-05-26 14:19:26', '2021-05-26 14:19:26'),
(19, 'EDEC27CF-E69D-48F8-BCBA-6F96CB9485CF', 'cBtF8PAd4EPGorEqvrtd18:APA91bGnPdsslnh41CGm8-iNwqtBUUpZCr3j8h2W-ZgDP6cNSMBJoFbM0XZMJRURb2dshxLADFI0CmKnHXC0pBOuNLdCuPIK9CY367RD7jTXEjDrqDXqJCDRUpjqjSxjHrT4HJwFLoOC', 1, 107, '2021-05-31 14:41:16', '2021-05-31 14:41:16'),
(20, '17f8a54e30a95222', 'null', 2, 107, '2021-05-31 16:00:55', '2021-05-31 16:00:55'),
(21, '8A99AE4E-B7C4-409C-92A3-4E75128D84A5', 'eYbzfhDzQUIVn1rkw4m1EQ:APA91bFynh9a4T8o2_nK6cgWLQuS2aFK6kE03mlcaL54vtC4E8XFMXw8FDvU9iHB6isUnGZLYFv4dO3Jmvo6b3tcN5MqGofARIwrixykVlkDnJqADgmvrZOcKTLGvxk3KjcPqw61-EFj', 1, 106, '2021-06-01 13:10:20', '2021-06-01 13:10:20'),
(22, '6088149df7da8210', 'null', 2, NULL, '2021-06-07 08:38:35', '2021-06-07 08:38:35'),
(23, '1e8c2fb4939a1c7d', 'null', 2, NULL, '2021-06-13 10:42:29', '2021-06-13 10:42:29'),
(24, '159184163', '123456', 1, 113, '2021-06-20 09:00:04', '2021-06-20 09:00:04'),
(25, 'A8AAAC1F-697F-45EF-9903-608444D2E0FF', 'dLc_mA1nBkedlGzC9q4PBL:APA91bGz6Wm5M8e0sN7i0cevgULs9qn52HgHQ2q43QjphAwlDfQmd62QPpFHe5o-dVuTdxPdefY7eCCD89uVpaCpC54ejwEcFJjyGQiQA82fNus89xJbBu4J8gnPMZOEjc7AN-DcXxC7', 1, 103, '2021-07-28 16:24:37', '2021-07-28 16:24:37'),
(26, 'b0c9678787e04934', 'dAZfS3uDS5atpbaFiqsLBT:APA91bFgfHaAuLiDj-PKWNSvOW1GUjF72ukiYoX9Zf5-aEGJcYbV1RTS_ww--0Bv5Q_GQRy3Mw-_hZBVqmmDs6i45sZ5w2u2FZWPQiboXvYp0VSKtBQJ5bt03C0Ev1zwIX7ok6jn2THQ', 2, 114, '2021-08-22 15:31:59', '2021-08-23 11:40:15'),
(27, 'a1e3e8cbe36e6790', 'c8G82wpxTruQd-bDR-WJGg:APA91bEL23r4GLC2yPhythylqwIMy9Cqgj_obuzmlZ54GUu45cUztGNuSL0QT4mkY0fHXZtxKEVXQdFVcbztKaDwJwzf5IzpB-ee9PNUbNAdjP2zeW2Lx9G8jg6ADrULsqLvNMZ-iu6G', 2, 114, '2021-08-22 15:42:48', '2021-08-22 16:03:32'),
(28, '29c245229faaed74', 'fNlqyg_aRvODWN-CZyaF3q:APA91bH9BjWCv7nZY_i82rb8RtLA77cgFA6mKJzrzTV5BkOLH0n9NZkDXZmt79nAyC7zW5a9PLmrjFXsEiDAf1mrhJ_gcpxzc3gKNii9yJabtjPFCPu6rlQHlJw9Trh3ixTajCY47Q74', 2, 114, '2021-08-22 16:11:19', '2021-08-22 16:11:37'),
(29, '1cc37fc0a00f6bee', 'cnaWhTy0QUCJRsq2ArbJdP:APA91bGOgGUr0szwIJq7lwbjvngceCjqkhP3N1IhXQbw8wboj8HXIZOENiuJTgIccgaVMZUWcyUEjs121gde0VilvuG9tMurKgX4d3aoQLZ5Hykcl9KorEIpxdMewbAJJWxqdh2Jjq1I', 2, 114, '2021-08-23 12:08:55', '2021-08-23 12:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `value` double(8,2) NOT NULL,
  `price` double(8,2) DEFAULT NULL,
  `type` enum('payed','free') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'payed',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet_transactions`
--

INSERT INTO `wallet_transactions` (`id`, `value`, `price`, `type`, `user_id`, `package_id`, `created_at`, `updated_at`) VALUES
(7, 200.00, 20.00, 'payed', 103, 3, '2021-03-10 09:04:41', '2021-03-02 09:04:45'),
(8, 100.00, 14.75, 'payed', 103, 2, '2021-05-13 09:31:10', '2021-02-01 09:31:10'),
(9, 1000.00, NULL, 'free', 107, NULL, '2021-04-12 11:48:32', '2021-04-12 11:48:32'),
(10, 1000.00, NULL, 'free', 106, NULL, '2021-04-20 13:50:16', '2021-04-20 13:50:16'),
(11, 500.00, NULL, 'free', 106, NULL, '2021-04-25 15:02:20', '2021-04-25 15:02:20'),
(12, 300.00, NULL, 'free', 111, NULL, '2021-05-25 10:13:34', '2021-05-25 10:13:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `areas_city_id_foreign` (`city_id`);

--
-- Indexes for table `balance_packages`
--
ALTER TABLE `balance_packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories_ads`
--
ALTER TABLE `categories_ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_options`
--
ALTER TABLE `category_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_options_cat_id_foreign` (`cat_id`);

--
-- Indexes for table `category_option_values`
--
ALTER TABLE `category_option_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_option_values_option_id_foreign` (`option_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversations`
--
ALTER TABLE `conversations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `main_ads`
--
ALTER TABLE `main_ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `markas`
--
ALTER TABLE `markas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marka_types`
--
ALTER TABLE `marka_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marka_types_marka_id_foreign` (`marka_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_user_id_foreign` (`user_id`),
  ADD KEY `messages_conversation_id_foreign` (`conversation_id`),
  ADD KEY `messages_ad_product_id_foreign` (`ad_product_id`);

--
-- Indexes for table `meta_tags`
--
ALTER TABLE `meta_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mndobs`
--
ALTER TABLE `mndobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participants`
--
ALTER TABLE `participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `participants_user_id_foreign` (`user_id`),
  ADD KEY `participants_conversation_id_foreign` (`conversation_id`),
  ADD KEY `participants_product_id_foreign` (`ad_product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plan_details`
--
ALTER TABLE `plan_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plan_fk` (`plan_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_fk` (`user_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_categories_product_id_foreign` (`product_id`),
  ADD KEY `product_categories_cat_id_foreign` (`cat_id`);

--
-- Indexes for table `product_comments`
--
ALTER TABLE `product_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_comments_user_id_foreign` (`user_id`),
  ADD KEY `product_comments_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_features`
--
ALTER TABLE `product_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_id_fk` (`option_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_reports`
--
ALTER TABLE `product_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reports_user_id_foreign` (`user_id`),
  ADD KEY `product_reports_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_views`
--
ALTER TABLE `product_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_views_user_id_foreign` (`ip`(191)),
  ADD KEY `product_views_product_id_foreign` (`product_id`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specialties`
--
ALTER TABLE `specialties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_fk` (`category_id`);

--
-- Indexes for table `sub_five_categories`
--
ALTER TABLE `sub_five_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_five_categories_sub_category_id_foreign` (`sub_category_id`);

--
-- Indexes for table `sub_four_categories`
--
ALTER TABLE `sub_four_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_sub_sub_cat_fk` (`sub_category_id`);

--
-- Indexes for table `sub_three_categories`
--
ALTER TABLE `sub_three_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_sub_cat_fk` (`sub_category_id`);

--
-- Indexes for table `sub_two_categories`
--
ALTER TABLE `sub_two_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_cat_fk` (`sub_category_id`);

--
-- Indexes for table `type_models`
--
ALTER TABLE `type_models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_models_marka_type_id_foreign` (`marka_type_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_specialties`
--
ALTER TABLE `user_specialties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_specialties_user_id_foreign` (`user_id`),
  ADD KEY `user_specialties_special_id_foreign` (`special_id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visitors_user_id_foreign` (`user_id`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallet_transactions_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `balance_packages`
--
ALTER TABLE `balance_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `categories_ads`
--
ALTER TABLE `categories_ads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category_options`
--
ALTER TABLE `category_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `category_option_values`
--
ALTER TABLE `category_option_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `conversations`
--
ALTER TABLE `conversations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=356;

--
-- AUTO_INCREMENT for table `main_ads`
--
ALTER TABLE `main_ads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `markas`
--
ALTER TABLE `markas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `marka_types`
--
ALTER TABLE `marka_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meta_tags`
--
ALTER TABLE `meta_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;

--
-- AUTO_INCREMENT for table `mndobs`
--
ALTER TABLE `mndobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `participants`
--
ALTER TABLE `participants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `plan_details`
--
ALTER TABLE `plan_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_comments`
--
ALTER TABLE `product_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_features`
--
ALTER TABLE `product_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_reports`
--
ALTER TABLE `product_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_views`
--
ALTER TABLE `product_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `specialties`
--
ALTER TABLE `specialties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sub_five_categories`
--
ALTER TABLE `sub_five_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_four_categories`
--
ALTER TABLE `sub_four_categories`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_three_categories`
--
ALTER TABLE `sub_three_categories`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sub_two_categories`
--
ALTER TABLE `sub_two_categories`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `type_models`
--
ALTER TABLE `type_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=491;

--
-- AUTO_INCREMENT for table `user_specialties`
--
ALTER TABLE `user_specialties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `areas_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);

--
-- Constraints for table `category_options`
--
ALTER TABLE `category_options`
  ADD CONSTRAINT `category_options_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `category_option_values`
--
ALTER TABLE `category_option_values`
  ADD CONSTRAINT `category_option_values_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `category_options` (`id`);

--
-- Constraints for table `marka_types`
--
ALTER TABLE `marka_types`
  ADD CONSTRAINT `marka_types_marka_id_foreign` FOREIGN KEY (`marka_id`) REFERENCES `markas` (`id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ad_product_id_foreign` FOREIGN KEY (`ad_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`),
  ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `participants`
--
ALTER TABLE `participants`
  ADD CONSTRAINT `participants_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`),
  ADD CONSTRAINT `participants_product_id_foreign` FOREIGN KEY (`ad_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `plan_details`
--
ALTER TABLE `plan_details`
  ADD CONSTRAINT `plan_fk` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_comments`
--
ALTER TABLE `product_comments`
  ADD CONSTRAINT `product_comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `product_features`
--
ALTER TABLE `product_features`
  ADD CONSTRAINT `option_id_fk` FOREIGN KEY (`option_id`) REFERENCES `category_options` (`id`);

--
-- Constraints for table `product_reports`
--
ALTER TABLE `product_reports`
  ADD CONSTRAINT `product_reports_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `product_views`
--
ALTER TABLE `product_views`
  ADD CONSTRAINT `product_views_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `cat_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `sub_five_categories`
--
ALTER TABLE `sub_five_categories`
  ADD CONSTRAINT `sub_five_categories_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_four_categories` (`id`);

--
-- Constraints for table `sub_four_categories`
--
ALTER TABLE `sub_four_categories`
  ADD CONSTRAINT `sub_sub_sub_cat_fk` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_three_categories` (`id`);

--
-- Constraints for table `sub_three_categories`
--
ALTER TABLE `sub_three_categories`
  ADD CONSTRAINT `sub_sub_cat_fk` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_two_categories` (`id`);

--
-- Constraints for table `sub_two_categories`
--
ALTER TABLE `sub_two_categories`
  ADD CONSTRAINT `sub_cat_fk` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`);

--
-- Constraints for table `type_models`
--
ALTER TABLE `type_models`
  ADD CONSTRAINT `type_models_marka_type_id_foreign` FOREIGN KEY (`marka_type_id`) REFERENCES `marka_types` (`id`);

--
-- Constraints for table `user_specialties`
--
ALTER TABLE `user_specialties`
  ADD CONSTRAINT `user_specialties_special_id_foreign` FOREIGN KEY (`special_id`) REFERENCES `specialties` (`id`),
  ADD CONSTRAINT `user_specialties_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `visitors`
--
ALTER TABLE `visitors`
  ADD CONSTRAINT `visitors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD CONSTRAINT `wallet_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
