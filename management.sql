-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 09, 2021 at 01:50 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `management`
--

-- --------------------------------------------------------

--
-- Table structure for table `blood_groups`
--

DROP TABLE IF EXISTS `blood_groups`;
CREATE TABLE IF NOT EXISTS `blood_groups` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blood_groups`
--

INSERT INTO `blood_groups` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'O-', '2021-06-06 01:44:54', '2021-06-06 01:44:54'),
(2, 'O+', '2021-06-06 01:44:54', '2021-06-06 01:44:54'),
(3, 'A+', '2021-06-06 01:44:54', '2021-06-06 01:44:54'),
(4, 'A-', '2021-06-06 01:44:54', '2021-06-06 01:44:54'),
(5, 'B+', '2021-06-06 01:44:54', '2021-06-06 01:44:54');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `my_class_id` int(10) UNSIGNED DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_copies` int(11) DEFAULT NULL,
  `issued_copies` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `books_my_class_id_foreign` (`my_class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_requests`
--

DROP TABLE IF EXISTS `book_requests`;
CREATE TABLE IF NOT EXISTS `book_requests` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `book_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `start_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `returned` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_requests_book_id_foreign` (`book_id`),
  KEY `book_requests_user_id_foreign` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_types`
--

DROP TABLE IF EXISTS `class_types`;
CREATE TABLE IF NOT EXISTS `class_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_types`
--

INSERT INTO `class_types` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'ssc1', 'C', NULL, NULL),
(2, 'hsc1', 'PN', NULL, NULL),
(3, 'bba1', 'N', NULL, NULL),
(4, 'mba1', 'P', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dorms`
--

DROP TABLE IF EXISTS `dorms`;
CREATE TABLE IF NOT EXISTS `dorms` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dorms_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dorms`
--

INSERT INTO `dorms` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Faith Hostel', NULL, NULL, NULL),
(2, 'Peace Hostel', NULL, NULL, NULL),
(3, 'Grace Hostel', NULL, NULL, NULL),
(4, 'Success Hostel', NULL, NULL, NULL),
(5, 'Trust Hostel', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
CREATE TABLE IF NOT EXISTS `exams` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `term` tinyint(4) NOT NULL,
  `year` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exams_term_year_unique` (`term`,`year`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_records`
--

DROP TABLE IF EXISTS `exam_records`;
CREATE TABLE IF NOT EXISTS `exam_records` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `exam_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `my_class_id` int(10) UNSIGNED NOT NULL,
  `section_id` int(10) UNSIGNED NOT NULL,
  `total` int(11) DEFAULT NULL,
  `ave` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class_ave` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `af` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ps` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `p_comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `t_comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_records_exam_id_foreign` (`exam_id`),
  KEY `exam_records_my_class_id_foreign` (`my_class_id`),
  KEY `exam_records_student_id_foreign` (`student_id`),
  KEY `exam_records_section_id_foreign` (`section_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
CREATE TABLE IF NOT EXISTS `grades` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_type_id` int(10) UNSIGNED DEFAULT NULL,
  `mark_from` tinyint(4) NOT NULL,
  `mark_to` tinyint(4) NOT NULL,
  `remark` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grades_name_class_type_id_remark_unique` (`name`,`class_type_id`,`remark`),
  KEY `grades_class_type_id_foreign` (`class_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `name`, `class_type_id`, `mark_from`, `mark_to`, `remark`, `created_at`, `updated_at`) VALUES
(1, 'A', NULL, 70, 100, 'Excellent', NULL, NULL),
(2, 'B', NULL, 60, 69, 'Very Good', NULL, NULL),
(3, 'C', NULL, 50, 59, 'Good', NULL, NULL),
(4, 'D', NULL, 45, 49, 'Pass', NULL, NULL),
(5, 'E', NULL, 40, 44, 'Poor', NULL, NULL),
(6, 'F', NULL, 0, 39, 'Fail', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lgas`
--

DROP TABLE IF EXISTS `lgas`;
CREATE TABLE IF NOT EXISTS `lgas` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `state_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lgas_state_id_foreign` (`state_id`)
) ENGINE=MyISAM AUTO_INCREMENT=775 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lgas`
--

INSERT INTO `lgas` (`id`, `state_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Aba North', '2021-06-06 01:44:54', '2021-06-06 01:44:54'),
(26, 2, 'Larmurde', '2021-06-06 01:44:54', '2021-06-06 01:44:54'),
(27, 2, 'Madagali', '2021-06-06 01:44:54', '2021-06-06 01:44:54'),
(41, 3, 'Eket', '2021-06-06 01:44:54', '2021-06-06 01:44:54'),
(42, 3, 'Esit Eket', '2021-06-06 01:44:54', '2021-06-06 01:44:54'),
(43, 3, 'Essien Udim', '2021-06-06 01:44:54', '2021-06-06 01:44:54');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
CREATE TABLE IF NOT EXISTS `marks` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` int(10) UNSIGNED NOT NULL,
  `subject_id` int(10) UNSIGNED NOT NULL,
  `my_class_id` int(10) UNSIGNED NOT NULL,
  `section_id` int(10) UNSIGNED NOT NULL,
  `exam_id` int(10) UNSIGNED NOT NULL,
  `t1` int(11) DEFAULT NULL,
  `t2` int(11) DEFAULT NULL,
  `t3` int(11) DEFAULT NULL,
  `t4` int(11) DEFAULT NULL,
  `tca` int(11) DEFAULT NULL,
  `exm` int(11) DEFAULT NULL,
  `tex1` int(11) DEFAULT NULL,
  `tex2` int(11) DEFAULT NULL,
  `tex3` int(11) DEFAULT NULL,
  `sub_pos` tinyint(4) DEFAULT NULL,
  `cum` int(11) DEFAULT NULL,
  `cum_ave` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grade_id` int(10) UNSIGNED DEFAULT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marks_student_id_foreign` (`student_id`),
  KEY `marks_my_class_id_foreign` (`my_class_id`),
  KEY `marks_section_id_foreign` (`section_id`),
  KEY `marks_subject_id_foreign` (`subject_id`),
  KEY `marks_exam_id_foreign` (`exam_id`),
  KEY `marks_grade_id_foreign` (`grade_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2013_09_20_121733_create_blood_groups_table', 1),
(2, '2013_09_22_124750_create_states_table', 1),
(3, '2013_09_22_124806_create_lgas_table', 1),
(4, '2013_09_26_121148_create_nationalities_table', 1),
(5, '2014_10_12_000000_create_users_table', 1),
(6, '2014_10_12_100000_create_password_resets_table', 1),
(7, '2018_09_20_100249_create_user_types_table', 1),
(8, '2018_09_20_150906_create_class_types_table', 1),
(9, '2018_09_22_073005_create_my_classes_table', 1),
(10, '2018_09_22_073526_create_sections_table', 1),
(11, '2018_09_22_080555_create_settings_table', 1),
(12, '2018_09_22_081302_create_subjects_table', 1),
(13, '2018_09_22_151514_create_student_records_table', 1),
(14, '2018_09_26_124241_create_dorms_table', 1),
(15, '2018_10_04_224910_create_exams_table', 1),
(16, '2018_10_06_224846_create_marks_table', 1),
(17, '2018_10_06_224944_create_grades_table', 1),
(18, '2018_10_06_225007_create_pins_table', 1),
(19, '2018_10_18_205550_create_skills_table', 1),
(20, '2018_10_18_205842_create_exam_records_table', 1),
(21, '2018_10_31_191358_create_books_table', 1),
(22, '2018_10_31_192540_create_book_requests_table', 1),
(23, '2018_11_01_132115_create_staff_records_table', 1),
(24, '2018_11_03_210758_create_payments_table', 1),
(25, '2018_11_03_210817_create_payment_records_table', 1),
(26, '2018_11_06_083707_create_receipts_table', 1),
(27, '2018_11_27_180401_create_time_tables_table', 1),
(28, '2019_09_22_142514_create_fks', 1),
(29, '2019_09_26_132227_create_promotions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `my_classes`
--

DROP TABLE IF EXISTS `my_classes`;
CREATE TABLE IF NOT EXISTS `my_classes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_type_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `my_classes_class_type_id_name_unique` (`class_type_id`,`name`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `my_classes`
--

INSERT INTO `my_classes` (`id`, `name`, `class_type_id`, `created_at`, `updated_at`) VALUES
(1, 'ssc', 3, NULL, NULL),
(2, 'hsc', 3, NULL, NULL),
(3, 'bba', 3, NULL, NULL),
(4, 'mba', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nationalities`
--

DROP TABLE IF EXISTS `nationalities`;
CREATE TABLE IF NOT EXISTS `nationalities` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nationalities`
--

INSERT INTO `nationalities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'bangladesh', '2021-06-06 01:44:54', '2021-06-06 01:44:54'),
(2, 'india', '2021-06-06 01:44:54', '2021-06-06 01:44:54'),
(3, 'Algerian', '2021-06-06 01:44:54', '2021-06-06 01:44:54'),
(4, 'American', '2021-06-06 01:44:54', '2021-06-06 01:44:54'),
(5, 'china', '2021-06-06 01:44:54', '2021-06-06 01:44:54');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `ref_no` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cash',
  `my_class_id` int(10) UNSIGNED DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payments_ref_no_unique` (`ref_no`),
  KEY `payments_my_class_id_foreign` (`my_class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_records`
--

DROP TABLE IF EXISTS `payment_records`;
CREATE TABLE IF NOT EXISTS `payment_records` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `payment_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `ref_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amt_paid` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `paid` tinyint(4) NOT NULL DEFAULT '0',
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_records_ref_no_unique` (`ref_no`),
  KEY `payment_records_payment_id_foreign` (`payment_id`),
  KEY `payment_records_student_id_foreign` (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pins`
--

DROP TABLE IF EXISTS `pins`;
CREATE TABLE IF NOT EXISTS `pins` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `used` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `times_used` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `student_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pins_code_unique` (`code`),
  KEY `pins_user_id_foreign` (`user_id`),
  KEY `pins_student_id_foreign` (`student_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
CREATE TABLE IF NOT EXISTS `promotions` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` int(10) UNSIGNED NOT NULL,
  `from_class` int(10) UNSIGNED NOT NULL,
  `from_section` int(10) UNSIGNED NOT NULL,
  `to_class` int(10) UNSIGNED NOT NULL,
  `to_section` int(10) UNSIGNED NOT NULL,
  `grad` tinyint(4) NOT NULL,
  `from_session` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_session` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promotions_student_id_foreign` (`student_id`),
  KEY `promotions_from_class_foreign` (`from_class`),
  KEY `promotions_from_section_foreign` (`from_section`),
  KEY `promotions_to_section_foreign` (`to_section`),
  KEY `promotions_to_class_foreign` (`to_class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

DROP TABLE IF EXISTS `receipts`;
CREATE TABLE IF NOT EXISTS `receipts` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pr_id` int(10) UNSIGNED NOT NULL,
  `amt_paid` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receipts_pr_id_foreign` (`pr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
CREATE TABLE IF NOT EXISTS `sections` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `my_class_id` int(10) UNSIGNED NOT NULL,
  `teacher_id` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sections_name_my_class_id_unique` (`name`,`my_class_id`),
  KEY `sections_my_class_id_foreign` (`my_class_id`),
  KEY `sections_teacher_id_foreign` (`teacher_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `name`, `my_class_id`, `teacher_id`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Gold', 1, NULL, 1, NULL, NULL),
(2, 'Diamond', 1, NULL, 0, NULL, NULL),
(3, 'Silver', 2, NULL, 1, NULL, NULL),
(4, 'Lemon', 2, NULL, 0, NULL, NULL),
(8, 'Blue', 6, NULL, 1, NULL, NULL),
(10, 'A', 8, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `description`, `created_at`, `updated_at`) VALUES
(1, 'current_session', '2018-2019', NULL, '2021-06-06 06:16:42'),
(2, 'system_title', 'CJIA', NULL, '2021-06-06 06:16:42'),
(3, 'system_name', 'Nurul Islam', NULL, '2021-06-06 06:16:42'),
(4, 'term_ends', '7/10/2018', NULL, '2021-06-06 06:16:42'),
(5, 'term_begins', '7/10/2018', NULL, '2021-06-06 06:16:42'),
(6, 'phone', '0123456789', NULL, '2021-06-06 06:16:42'),
(7, 'address', '18B North Central Park, Behind Central Square Tourist Center', NULL, '2021-06-06 06:16:42'),
(8, 'system_email', 'cjacademy@cj.com', NULL, '2021-06-06 06:16:42'),
(9, 'alt_email', '', NULL, NULL),
(10, 'email_host', '', NULL, NULL),
(11, 'email_pass', '', NULL, NULL),
(12, 'lock_exam', '0', NULL, '2021-06-06 06:16:42'),
(13, 'logo', 'http://localhost/New%20folder/lav_sms/public/storage/uploads//logo.jpeg', NULL, '2021-06-06 01:53:52'),
(14, 'next_term_fees_j', '20000', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
CREATE TABLE IF NOT EXISTS `skills` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skill_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `name`, `skill_type`, `class_type`, `created_at`, `updated_at`) VALUES
(1, 'PUNCTUALITY', 'AF', NULL, NULL, NULL),
(2, 'NEATNESS', 'AF', NULL, NULL, NULL),
(3, 'HONESTY', 'AF', NULL, NULL, NULL),
(4, 'RELIABILITY', 'AF', NULL, NULL, NULL),
(5, 'RELATIONSHIP WITH OTHERS', 'AF', NULL, NULL, NULL),
(6, 'POLITENESS', 'AF', NULL, NULL, NULL),
(7, 'ALERTNESS', 'AF', NULL, NULL, NULL),
(8, 'HANDWRITING', 'PS', NULL, NULL, NULL),
(9, 'GAMES & SPORTS', 'PS', NULL, NULL, NULL),
(10, 'DRAWING & ARTS', 'PS', NULL, NULL, NULL),
(11, 'PAINTING', 'PS', NULL, NULL, NULL),
(12, 'CONSTRUCTION', 'PS', NULL, NULL, NULL),
(13, 'MUSICAL SKILLS', 'PS', NULL, NULL, NULL),
(14, 'FLEXIBILITY', 'PS', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff_records`
--

DROP TABLE IF EXISTS `staff_records`;
CREATE TABLE IF NOT EXISTS `staff_records` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `staff_records_code_unique` (`code`),
  KEY `staff_records_user_id_foreign` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'nurul', '2021-06-06 01:44:54', '2021-06-06 01:44:54'),
(2, 'islam', '2021-06-06 01:44:54', '2021-06-06 01:44:54'),
(3, 'imran', '2021-06-06 01:44:54', '2021-06-06 01:44:54'),
(4, 'jobaer', '2021-06-06 01:44:54', '2021-06-06 01:44:54'),
(5, 'aminul', '2021-06-06 01:44:54', '2021-06-06 01:44:54'),
(6, 'belal', '2021-06-06 01:44:54', '2021-06-06 01:44:54');

-- --------------------------------------------------------

--
-- Table structure for table `student_records`
--

DROP TABLE IF EXISTS `student_records`;
CREATE TABLE IF NOT EXISTS `student_records` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL,
  `my_class_id` int(10) UNSIGNED NOT NULL,
  `section_id` int(10) UNSIGNED NOT NULL,
  `adm_no` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `my_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `dorm_id` int(10) UNSIGNED DEFAULT NULL,
  `dorm_room_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `session` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `house` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` tinyint(4) DEFAULT NULL,
  `year_admitted` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grad` tinyint(4) NOT NULL DEFAULT '0',
  `grad_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_records_adm_no_unique` (`adm_no`),
  KEY `student_records_user_id_foreign` (`user_id`),
  KEY `student_records_my_class_id_foreign` (`my_class_id`),
  KEY `student_records_section_id_foreign` (`section_id`),
  KEY `student_records_my_parent_id_foreign` (`my_parent_id`),
  KEY `student_records_dorm_id_foreign` (`dorm_id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_records`
--

INSERT INTO `student_records` (`id`, `user_id`, `my_class_id`, `section_id`, `adm_no`, `my_parent_id`, `dorm_id`, `dorm_room_no`, `session`, `house`, `age`, `year_admitted`, `grad`, `grad_date`, `created_at`, `updated_at`) VALUES
(1, 18, 1, 1, NULL, NULL, NULL, NULL, '2018-2019', NULL, NULL, NULL, 0, NULL, '2021-06-06 01:44:56', '2021-06-06 01:44:56'),
(2, 19, 1, 1, NULL, NULL, NULL, NULL, '2018-2019', NULL, NULL, NULL, 0, NULL, '2021-06-06 01:44:56', '2021-06-06 01:44:56'),
(3, 20, 1, 1, NULL, NULL, NULL, NULL, '2018-2019', NULL, NULL, NULL, 0, NULL, '2021-06-06 01:44:56', '2021-06-06 01:44:56'),
(4, 21, 1, 1, NULL, NULL, NULL, NULL, '2018-2019', NULL, NULL, NULL, 0, NULL, '2021-06-06 01:44:56', '2021-06-06 01:44:56'),
(5, 22, 1, 2, NULL, NULL, NULL, NULL, '2018-2019', NULL, NULL, NULL, 0, NULL, '2021-06-06 01:44:57', '2021-06-06 01:44:57'),
(6, 23, 1, 2, NULL, NULL, NULL, NULL, '2018-2019', NULL, NULL, NULL, 0, NULL, '2021-06-06 01:44:57', '2021-06-06 01:44:57'),
(26, 43, 7, 9, NULL, NULL, NULL, NULL, '2018-2019', NULL, NULL, NULL, 0, NULL, '2021-06-06 01:44:59', '2021-06-06 01:44:59'),
(27, 44, 7, 9, NULL, NULL, NULL, NULL, '2018-2019', NULL, NULL, NULL, 0, NULL, '2021-06-06 01:44:59', '2021-06-06 01:44:59');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE IF NOT EXISTS `subjects` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `my_class_id` int(10) UNSIGNED NOT NULL,
  `teacher_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subjects_my_class_id_name_unique` (`my_class_id`,`name`),
  KEY `subjects_teacher_id_foreign` (`teacher_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `slug`, `my_class_id`, `teacher_id`, `created_at`, `updated_at`) VALUES
(1, 'English Language', 'Eng', 1, 3, NULL, NULL),
(2, 'Mathematics', 'html', 1, 3, NULL, NULL),
(3, 'English Language', 'Eng', 2, 3, NULL, NULL),
(4, 'Mathematics', 'css', 2, 3, NULL, NULL),
(5, 'English Language', 'Eng', 3, 3, NULL, NULL),
(6, 'Mathematics', 'php', 3, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

DROP TABLE IF EXISTS `time_slots`;
CREATE TABLE IF NOT EXISTS `time_slots` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ttr_id` int(10) UNSIGNED NOT NULL,
  `hour_from` tinyint(4) NOT NULL,
  `min_from` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meridian_from` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hour_to` tinyint(4) NOT NULL,
  `min_to` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meridian_to` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_from` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_to` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp_from` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp_to` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `time_slots_timestamp_from_timestamp_to_ttr_id_unique` (`timestamp_from`,`timestamp_to`,`ttr_id`),
  KEY `time_slots_ttr_id_foreign` (`ttr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_tables`
--

DROP TABLE IF EXISTS `time_tables`;
CREATE TABLE IF NOT EXISTS `time_tables` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ttr_id` int(10) UNSIGNED NOT NULL,
  `ts_id` int(10) UNSIGNED NOT NULL,
  `subject_id` int(10) UNSIGNED DEFAULT NULL,
  `exam_date` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp_from` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp_to` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `day_num` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `time_tables_ttr_id_ts_id_day_unique` (`ttr_id`,`ts_id`,`day`),
  UNIQUE KEY `time_tables_ttr_id_ts_id_exam_date_unique` (`ttr_id`,`ts_id`,`exam_date`),
  KEY `time_tables_ts_id_foreign` (`ts_id`),
  KEY `time_tables_subject_id_foreign` (`subject_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_table_records`
--

DROP TABLE IF EXISTS `time_table_records`;
CREATE TABLE IF NOT EXISTS `time_table_records` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `my_class_id` int(10) UNSIGNED NOT NULL,
  `exam_id` int(10) UNSIGNED DEFAULT NULL,
  `year` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `time_table_records_name_unique` (`name`),
  UNIQUE KEY `time_table_records_my_class_id_exam_id_year_unique` (`my_class_id`,`exam_id`,`year`),
  KEY `time_table_records_exam_id_foreign` (`exam_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_table_records`
--

INSERT INTO `time_table_records` (`id`, `name`, `my_class_id`, `exam_id`, `year`, `created_at`, `updated_at`) VALUES
(1, 'uykyu', 9, NULL, '2018-2019', '2021-06-06 05:55:18', '2021-06-06 05:55:18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'http://localhost/global_assets/images/user.png',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_id` int(10) UNSIGNED DEFAULT NULL,
  `state_id` int(10) UNSIGNED DEFAULT NULL,
  `lga_id` int(10) UNSIGNED DEFAULT NULL,
  `nal_id` int(10) UNSIGNED DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_code_unique` (`code`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_state_id_foreign` (`state_id`),
  KEY `users_lga_id_foreign` (`lga_id`),
  KEY `users_bg_id_foreign` (`bg_id`),
  KEY `users_nal_id_foreign` (`nal_id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `code`, `username`, `user_type`, `dob`, `gender`, `photo`, `phone`, `phone2`, `bg_id`, `state_id`, `lga_id`, `nal_id`, `address`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nurul Islam', 'admin@gmail.com', 'OCNRNJARYY', 'Nurul', 'super_admin', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$YlSpzRfYrPxHHXGVAJh34uEXpXhuB1jfRyI6W7HFW9xbFy.UN0hii', 'Arz4FgHsvqjUg3QyhWJbmd63g59MxSeKjOqewMOdOkLHdC5rcubzVaqkxGJb', NULL, '2021-06-06 06:10:13'),
(2, 'Nurul Islam', 'admin@admin.com', 'FEZV4IIWEI', 'admin', 'admin', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$cnaCQfCQnJav/0BSo3dytO7ve0aJo/C70BMOCQXbBbpZeMYYy7kOu', '0aAg9kMqaGxNSO6cUgt7DPQbX1h5jcC21lIQmSheOxxDC04MMjjJz3eSJQiP', NULL, '2021-06-09 06:05:38'),
(3, 'Teacher Chike', 'teacher@teacher.com', '04LGST5NZH', 'teacher', 'teacher', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$CsPtDsLLAhY8MSvFp4sG6e9zHx3j9M2ca4xJjl08mvCy931fB1b52', '3gyl5zDFEmeHP9XndZ2zP3gXCBDXui1PPeIJsVFVpfL9ABryJVBqBUNbeDG1', NULL, NULL),
(4, 'Parent Kaba', 'parent@parent.com', 'P3ZCS8AH3X', 'parent', 'parent', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$CsPtDsLLAhY8MSvFp4sG6e9zHx3j9M2ca4xJjl08mvCy931fB1b52', 'KQlRSycSCT', NULL, NULL),
(5, 'Accountant Jeff', 'accountant@accountant.com', 'PIBVUEJIO1', 'accountant', 'accountant', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$CsPtDsLLAhY8MSvFp4sG6e9zHx3j9M2ca4xJjl08mvCy931fB1b52', '0z9EcSHbHV', NULL, NULL),
(26, 'Miss Susan Block', 'ikemmer@example.org', 'JDNNBPVBVS', 'funk.stephon', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$AVMTn9NJoqjuxkXdt72mMumwBVD0X.mXGgFIj67QTbWARdW8XE5/i', 'LM8jzv1GOS', '2021-06-06 01:44:57', '2021-06-06 01:44:57'),
(27, 'Bernadette Ullrich', 'ismael.rolfson@example.net', 'TUFMCK2QEY', 'stamm.orlando', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$AVMTn9NJoqjuxkXdt72mMumwBVD0X.mXGgFIj67QTbWARdW8XE5/i', 'g4DNzFXtCM', '2021-06-06 01:44:57', '2021-06-06 01:44:57'),
(28, 'Miss Stacy Medhurst III', 'howe.lennie@example.org', 'VYJFKQVCIX', 'dietrich.rozella', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$dXeqFyupQb0WPI0v74EsEehT/bvnoZ.wvSkdtHVRV.MKnl0aeDneS', 'aNxwJenF9E', '2021-06-06 01:44:58', '2021-06-06 01:44:58'),
(29, 'Godfrey Braun', 'kiara.schroeder@example.com', 'THEIJA7YE6', 'jhartmann', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$dXeqFyupQb0WPI0v74EsEehT/bvnoZ.wvSkdtHVRV.MKnl0aeDneS', 'kwnD7r43og', '2021-06-06 01:44:58', '2021-06-06 01:44:58'),
(30, 'Mr. Arvel Kulas PhD', 'alice.gislason@example.com', '3WAFYIEH5S', 'amcclure', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$dXeqFyupQb0WPI0v74EsEehT/bvnoZ.wvSkdtHVRV.MKnl0aeDneS', '2AO9d6uhXD', '2021-06-06 01:44:58', '2021-06-06 01:44:58'),
(31, 'Alisa Wolff IV', 'tyra50@example.com', 'RCJCULRMS6', 'dgutkowski', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$zvcf1NqW7emdZexgDlFHPus9O3y6B.xDSFB/9GNx3JiVMfvrx/Msy', 'NUwfWT29TY', '2021-06-06 01:44:58', '2021-06-06 01:44:58'),
(32, 'Violet Satterfield V', 'parker.chester@example.org', '4I3JIKHU2Y', 'renee.bradtke', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$zvcf1NqW7emdZexgDlFHPus9O3y6B.xDSFB/9GNx3JiVMfvrx/Msy', 'oIqaz1xxg1', '2021-06-06 01:44:58', '2021-06-06 01:44:58'),
(33, 'Prof. Leon Kling', 'reese20@example.com', 'STGOUUPMA8', 'julianne82', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$zvcf1NqW7emdZexgDlFHPus9O3y6B.xDSFB/9GNx3JiVMfvrx/Msy', 'SZYmcCRaUI', '2021-06-06 01:44:58', '2021-06-06 01:44:58'),
(34, 'Karen Prosacco', 'elisabeth37@example.net', 'HZS7IIO5QB', 'jadyn.schaefer', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$jaSnAU62DY8f7BjmWqB.9e6WG9.pwNELpVUOgZ8HOOO8XyTb8fWFS', 'Bd6yxutkde', '2021-06-06 01:44:58', '2021-06-06 01:44:58'),
(35, 'Marcia Cassin', 'rebekah46@example.com', 'VHF7HMHMFK', 'leanna.roberts', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$jaSnAU62DY8f7BjmWqB.9e6WG9.pwNELpVUOgZ8HOOO8XyTb8fWFS', 'iBPppGDnX1', '2021-06-06 01:44:58', '2021-06-06 01:44:58'),
(36, 'Sarina Ortiz', 'hwaelchi@example.org', 'Y3XYZOBZXJ', 'victoria50', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$jaSnAU62DY8f7BjmWqB.9e6WG9.pwNELpVUOgZ8HOOO8XyTb8fWFS', 'GXWcy50G4E', '2021-06-06 01:44:58', '2021-06-06 01:44:58'),
(37, 'Prof. Amaya Reichel', 'hagenes.guy@example.net', '6584BUPVGU', 'dooley.milton', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ZvBPCxXXL89vDzOTQsdUCu6lWlSEyKqoLLEEbRFo78WO6jAAxn/rq', 'BibuTSUcSq', '2021-06-06 01:44:59', '2021-06-06 01:44:59'),
(38, 'Elvie Tremblay', 'garrison.skiles@example.net', 'NE83BOUMLF', 'patience.nicolas', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ZvBPCxXXL89vDzOTQsdUCu6lWlSEyKqoLLEEbRFo78WO6jAAxn/rq', 'B16ui4C1Rn', '2021-06-06 01:44:59', '2021-06-06 01:44:59'),
(39, 'Christian Friesen', 'chet.balistreri@example.net', 'XUKAYJYFKW', 'boehm.elody', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ZvBPCxXXL89vDzOTQsdUCu6lWlSEyKqoLLEEbRFo78WO6jAAxn/rq', '9r3zSyGkiD', '2021-06-06 01:44:59', '2021-06-06 01:44:59'),
(40, 'Jackeline Ritchie', 'swift.marge@example.com', '7SOMPFAOEQ', 'fparker', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$3mJxbuQMT.MeeJl5gtxvt.qJrSysqIR5w4PcSf1J8mnJlU0PG4I1m', 'vzIKR6jJYV', '2021-06-06 01:44:59', '2021-06-06 01:44:59'),
(41, 'Malvina Bergnaum', 'lucie09@example.org', 'KEPF7NTEGK', 'randi55', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$3mJxbuQMT.MeeJl5gtxvt.qJrSysqIR5w4PcSf1J8mnJlU0PG4I1m', 'tqzayfOoQE', '2021-06-06 01:44:59', '2021-06-06 01:44:59'),
(42, 'Prof. Cicero Ebert', 'lynch.tess@example.com', 'J6WRU96I0F', 'alphonso.homenick', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$3mJxbuQMT.MeeJl5gtxvt.qJrSysqIR5w4PcSf1J8mnJlU0PG4I1m', '52RFSV538n', '2021-06-06 01:44:59', '2021-06-06 01:44:59'),
(43, 'Dr. Delores Huel III', 'gina94@example.org', 'DTMBTILAVV', 'dframi', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ySJupCxrxyPCMl1C4xW/XegN3ZVtFkQrL5rdc84dn8dLh.P83cnNS', 'AcFTgqLfSj', '2021-06-06 01:44:59', '2021-06-06 01:44:59'),
(44, 'Alia Krajcik', 'yasmeen92@example.net', 'NGKFUHADFN', 'pcrona', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ySJupCxrxyPCMl1C4xW/XegN3ZVtFkQrL5rdc84dn8dLh.P83cnNS', 'ipn86j6hzk', '2021-06-06 01:44:59', '2021-06-06 01:44:59'),
(45, 'Claudine Wilderman', 'tmurazik@example.com', 'N3GJRUC2XT', 'ngrady', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ySJupCxrxyPCMl1C4xW/XegN3ZVtFkQrL5rdc84dn8dLh.P83cnNS', '37zepNcpG5', '2021-06-06 01:44:59', '2021-06-06 01:44:59'),
(46, 'Keon Hill', 'pheller@example.com', 'SI0M3RFVIK', 'xgreenholt', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$MQUGhj1KPWP1Ck6X7GKKvu7uf0MMdvp9eZqT1J.wpClGhzS7O6nMy', 'TojzNzkQSL', '2021-06-06 01:45:00', '2021-06-06 01:45:00'),
(47, 'Dannie Bernier MD', 'glover.kiera@example.org', '4LEIHY07SN', 'conn.jermey', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$MQUGhj1KPWP1Ck6X7GKKvu7uf0MMdvp9eZqT1J.wpClGhzS7O6nMy', 'zyd7TFoklW', '2021-06-06 01:45:00', '2021-06-06 01:45:00'),
(48, 'Prof. Furman Wilderman III', 'rogahn.delfina@example.org', 'ZRSMZRTA7E', 'wuckert.paige', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$MQUGhj1KPWP1Ck6X7GKKvu7uf0MMdvp9eZqT1J.wpClGhzS7O6nMy', '0jc6GEjBCI', '2021-06-06 01:45:00', '2021-06-06 01:45:00'),
(49, 'Pansy Steuber', 'ebahringer@example.net', 'UGYZ6KSIWL', 'trevor.hudson', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$7AyAFj.7VKjoEWr8cSTdg.nR7JcmwDF2RzsppsXJfC/qwwpSp9aYq', 'bju4w6JCKM', '2021-06-06 01:45:00', '2021-06-06 01:45:00'),
(50, 'Leo Emmerich', 'joana.kreiger@example.com', 'L5GXKMN5HY', 'zoie89', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$7AyAFj.7VKjoEWr8cSTdg.nR7JcmwDF2RzsppsXJfC/qwwpSp9aYq', 'QvkvBDF5uQ', '2021-06-06 01:45:00', '2021-06-06 01:45:00'),
(51, 'King Luettgen', 'sbernhard@example.net', 'P3ZBXY70VB', 'wmills', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$7AyAFj.7VKjoEWr8cSTdg.nR7JcmwDF2RzsppsXJfC/qwwpSp9aYq', 'IPyAXkycKv', '2021-06-06 01:45:00', '2021-06-06 01:45:00'),
(52, 'Gust Wunsch', 'jaufderhar@example.org', '6UDQF3TCGT', 'roberto03', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$qFEFbI4hP3AQontf0zOy9ep3XBCzCXaFxfde0lmUwIsBfWKH6xswa', 'EzXs1UJ5Zt', '2021-06-06 01:45:01', '2021-06-06 01:45:01'),
(53, 'Kailee Spinka', 'andy69@example.org', 'C7WF12RTMV', 'stacy86', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$qFEFbI4hP3AQontf0zOy9ep3XBCzCXaFxfde0lmUwIsBfWKH6xswa', 'LR54xWnHqt', '2021-06-06 01:45:01', '2021-06-06 01:45:01'),
(54, 'Elinor Homenick', 'janice.schamberger@example.com', '7JVWVUODZ5', 'adaline86', 'student', NULL, NULL, 'http://localhost/global_assets/images/user.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$qFEFbI4hP3AQontf0zOy9ep3XBCzCXaFxfde0lmUwIsBfWKH6xswa', '26kRw7nszf', '2021-06-06 01:45:01', '2021-06-06 01:45:01');

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

DROP TABLE IF EXISTS `user_types`;
CREATE TABLE IF NOT EXISTS `user_types` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `title`, `name`, `level`, `created_at`, `updated_at`) VALUES
(1, 'accountant', 'Accountant', '5', NULL, NULL),
(2, 'parent', 'Parent', '4', NULL, NULL),
(3, 'teacher', 'Teacher', '3', NULL, NULL),
(4, 'admin', 'Admin', '2', NULL, NULL),
(5, 'super_admin', 'Super Admin', '1', NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
