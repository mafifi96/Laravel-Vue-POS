-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 17, 2022 at 08:45 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `abilities`
--

CREATE TABLE `abilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `abilities`
--

INSERT INTO `abilities` (`id`, `name`, `label`, `created_at`, `updated_at`) VALUES
(1, 'create-product', 'create', '2022-08-23 23:33:20', '2022-08-23 23:33:20'),
(2, 'update-product', 'update', '2022-08-23 23:33:31', '2022-08-23 23:33:31'),
(3, 'delete-product', 'delete', '2022-08-23 23:33:49', '2022-08-23 23:33:49'),
(4, 'create-category', 'create', '2022-08-23 23:34:15', '2022-08-23 23:34:15'),
(5, 'update-category', 'update', NULL, NULL),
(6, 'delete-category', 'delete', NULL, NULL),
(7, 'create-order', 'create', NULL, NULL),
(8, 'update-order', 'update', NULL, NULL),
(9, 'delete-order', 'delete', NULL, NULL),
(10, 'create-customer', 'create', NULL, NULL),
(11, 'update-customer', 'update', NULL, NULL),
(12, 'delete-customer', 'delete', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ability_role`
--

CREATE TABLE `ability_role` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `ability_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(151, 'mmmmmm', 'mmmmmmmmmmmmmmmmmmmmm', '2022-08-23 23:23:03', '2022-09-12 12:43:24'),
(152, 'Crimson', 'Iste id error numquam dolores provident et. Et quisquam blanditiis tenetur alias magnam repellat. Non et rem unde doloremque amet earum occaecati in.', '2022-08-23 23:23:04', '2022-08-23 23:23:04'),
(153, 'Maroon', 'Qui minima esse necessitatibus non. Magnam sunt est aliquid est. Odit explicabo asperiores aut alias animi. Adipisci quaerat autem et.', '2022-08-23 23:23:05', '2022-08-23 23:23:05'),
(154, 'Chartreuse', 'Iure praesentium voluptatum earum at. Aut dolore omnis aut harum est sit. Ipsam dolores harum id consectetur dolorem voluptates non aperiam.', '2022-08-23 23:23:05', '2022-08-23 23:23:05'),
(155, 'LawnGreen', 'Exercitationem qui occaecati ea nemo. Quisquam explicabo ea ut. Aut dolores quia consequuntur voluptas eius dolor. Harum sunt quidem et est.', '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(156, 'Green', 'Dolores veritatis deleniti rem. Quia illo omnis quia. Quae quia eligendi id. Nihil voluptatem excepturi nemo voluptatibus unde consequuntur.', '2022-08-23 23:23:07', '2022-08-23 23:23:07'),
(157, 'DarkMagenta', 'Et dolores reiciendis nostrum est eaque magni qui. Exercitationem in porro suscipit omnis explicabo maiores. Veritatis est sed nihil molestiae ipsum distinctio dolores vitae.', '2022-08-23 23:23:07', '2022-08-23 23:23:07'),
(158, 'DarkBlue', 'Eligendi minima sunt explicabo in dolores recusandae. Molestias quae facilis quo. Odio qui quisquam natus sit omnis voluptatem. Illo officiis laudantium qui recusandae harum repellendus.', '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(159, 'MediumBlue', 'Maiores tempore ut omnis ab qui nihil omnis aut. Enim culpa consequuntur sit dolor a dicta. Quidem eum architecto placeat.', '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(160, 'DarkGoldenRod', 'Iste ipsum omnis sint. Ducimus fugit dolorem deserunt a dolorum tenetur eius velit. Eligendi eveniet et voluptate vel praesentium doloribus. Nam dolore voluptatem ratione facere consequatur.', '2022-08-23 23:23:09', '2022-08-23 23:23:09');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_04_23_084900_create_ProductBrand_table', 1),
(6, '2021_04_23_084909_create_categories_table', 1),
(7, '2021_04_24_084710_create_products_table', 1),
(8, '2021_04_24_091632_create_product_images_table', 1),
(9, '2021_10_03_064419_create_orders_table', 1),
(10, '2021_10_03_075940_create_session_table', 1),
(11, '2021_10_13_055438_create_roles_table', 1),
(12, '2022_12_14_000001_create_personal_access_tokens_table', 2),
(13, '2022_09_08_204646_create_jobs_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_price` double(8,2) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `status`, `total_price`, `user_id`, `created_at`, `updated_at`) VALUES
(34, 'shipped', 3593.00, 19, '2022-09-07 00:39:18', '2022-09-08 19:48:00'),
(35, 'shipped', 620.00, 19, '2022-09-07 00:40:20', '2022-09-08 19:48:00'),
(36, 'shipped', 244.00, 19, '2022-09-07 00:40:37', '2022-09-08 19:48:00'),
(37, 'shipped', 620.00, 19, '2022-09-07 00:43:32', '2022-09-08 19:48:00'),
(38, 'shipped', 244.00, 19, '2022-09-07 00:44:07', '2022-09-08 19:48:00'),
(39, 'shipped', 864.00, 19, '2022-09-07 00:45:20', '2022-09-08 19:49:00'),
(40, 'shipped', 349.00, 19, '2022-09-07 00:47:14', '2022-09-08 19:49:00'),
(41, 'shipped', 376.00, 19, '2022-09-07 00:47:42', '2022-09-08 19:49:00'),
(42, 'shipped', 712.00, 19, '2022-09-07 00:47:51', '2022-09-08 19:49:00'),
(43, 'shipped', 626.00, 19, '2022-09-07 00:48:16', '2022-09-08 19:49:00'),
(44, 'shipping', 376.00, 19, '2022-09-07 00:48:41', '2022-09-08 19:42:00'),
(45, 'shipping', 488.00, 19, '2022-09-07 00:49:51', '2022-09-08 19:42:00'),
(46, 'shipping', 655.00, 19, '2022-09-07 00:50:21', '2022-09-08 19:42:00'),
(47, 'shipping', 2192.00, 19, '2022-09-07 00:51:28', '2022-09-08 19:42:00'),
(48, 'shipping', 620.00, 19, '2022-09-07 12:43:17', '2022-09-08 19:42:00'),
(49, 'shipping', 620.00, 19, '2022-09-07 12:43:59', '2022-09-08 19:42:00'),
(50, 'shipping', 620.00, 19, '2022-09-07 12:47:05', '2022-09-08 19:42:00'),
(51, 'shipping', 620.00, 19, '2022-09-07 12:49:16', '2022-09-08 19:42:01'),
(52, 'shipping', 620.00, 19, '2022-09-07 12:49:59', '2022-09-08 19:42:01'),
(53, 'shipping', 620.00, 19, '2022-09-07 12:53:01', '2022-09-08 19:42:01'),
(55, 'shipping', 1691.00, 19, '2022-09-07 12:57:06', '2022-09-08 19:42:01'),
(56, 'canceled', 848.00, 19, '2022-09-07 12:57:48', '2022-09-12 17:23:05'),
(57, 'shipped', 620.00, 20, '2022-09-08 13:14:19', '2022-09-12 12:28:45'),
(58, 'shipping', 488.00, 20, '2022-09-11 21:36:16', '2022-09-11 21:36:16'),
(59, 'shipping', 965.00, 20, '2022-09-12 12:55:28', '2022-09-12 12:55:28');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(39, 34, 73, '4'),
(40, 34, 84, '1'),
(41, 34, 83, '2'),
(42, 34, 85, '1'),
(43, 35, 73, '1'),
(44, 36, 83, '1'),
(45, 37, 73, '1'),
(46, 38, 83, '1'),
(47, 39, 73, '1'),
(48, 39, 83, '1'),
(49, 40, 166, '1'),
(50, 41, 136, '1'),
(51, 42, 137, '1'),
(52, 42, 138, '1'),
(53, 43, 151, '1'),
(54, 44, 136, '1'),
(55, 45, 106, '1'),
(56, 46, 122, '1'),
(57, 47, 94, '1'),
(58, 47, 95, '1'),
(59, 47, 91, '1'),
(60, 48, 73, '1'),
(61, 49, 73, '1'),
(62, 50, 73, '1'),
(63, 51, 73, '1'),
(64, 52, 73, '1'),
(65, 53, 73, '1'),
(70, 55, 91, '1'),
(71, 55, 94, '1'),
(72, 56, 77, '1'),
(73, 57, 73, '1'),
(74, 58, 106, '1'),
(75, 59, 73, '1'),
(76, 59, 84, '1');

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 17, 'mafifi350@gmail.com', 'a9c4480bec4278c4bd63f9ca290096f6b1c6a3deb9c415b24fab868cc4124be9', '[\"*\"]', NULL, NULL, '2022-08-19 21:27:57', '2022-08-19 21:27:57'),
(3, 'App\\Models\\User', 18, 'aaa@aaa.cc', '025ed56992dffc7071f1b8cec14fd97b2fbc96f012789be4593a543bcfefa99a', '[\"*\"]', NULL, NULL, '2022-08-19 21:39:31', '2022-08-19 21:39:31'),
(43, 'App\\Models\\User', 16, 'Token', 'cabac8f4d8a6d86124f34979b52b68f7c34e478a8a2471abfdd0e4b4eb2e0c20', '[\"*\"]', NULL, NULL, '2022-09-17 13:21:25', '2022-09-17 13:21:25');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `quantity`, `price`, `category_id`, `created_at`, `updated_at`) VALUES
(73, 'Miss', 'Et rerum aut excepturi expedita. Atque quia harum provident sint id sit quam. Dolores reiciendis ut hic aut dolores quis velit eos. Aut autem est sit totam facilis quia.', 69, '620.00', 151, '2022-08-23 23:23:04', '2022-09-12 12:55:28'),
(77, 'Dr.', 'Illo asperiores culpa illum fugiat labore ullam. Nemo tempora amet enim dolor omnis est libero. Enim in et laudantium sed qui sunt. Quo autem nihil eaque et fugit asperiores. Autem aliquam voluptatem distinctio qui perferendis et id.', 63, '848.00', 152, '2022-08-23 23:23:04', '2022-09-07 12:57:48'),
(83, 'Mr.', 'Et accusantium voluptas iste commodi nulla. Amet dolorem reiciendis est perspiciatis. Delectus quisquam quia qui.', 80, '244.00', 152, '2022-08-23 23:23:04', '2022-09-07 12:53:20'),
(84, 'Dr.', 'Quia architecto in non vel deleniti odit sequi velit. Qui amet saepe ut voluptate voluptatem. Voluptate deserunt qui ea qui id animi illo autem. Est pariatur sed pariatur velit ut fuga.', 51, '345.00', 152, '2022-08-23 23:23:04', '2022-09-12 12:55:29'),
(85, 'Dr.', 'Cum qui reprehenderit quo odit quis molestiae. Voluptates animi assumenda maxime occaecati molestias quo. Officiis dolor ut nesciunt ullam.', 65, '280.00', 152, '2022-08-23 23:23:04', '2022-09-07 12:53:20'),
(88, 'Ms.', 'Fugiat voluptatem similique illum fugiat quisquam facere sunt. Consequuntur eligendi minima eveniet consequatur sapiente. Est esse saepe esse ut quo suscipit. Totam autem accusamus rem. Rerum eligendi adipisci est minima consectetur.', 80, '718.00', 152, '2022-08-23 23:23:05', '2022-08-23 23:23:05'),
(90, 'Prof.', 'Necessitatibus nihil doloribus quidem eveniet iusto. Ipsam nulla est quo dolorum. Necessitatibus ea enim quo corrupti fugiat et. Sint est delectus facilis non harum nihil omnis. Eaque et asperiores aut cum consectetur. Quia voluptatibus atque porro voluptas voluptas expedita.', 75, '741.00', 152, '2022-08-23 23:23:05', '2022-08-23 23:23:05'),
(91, 'Prof.', 'Molestiae sed natus occaecati iste ratione. Quis cum ut dignissimos quia fugit dignissimos. Sed animi molestias omnis deleniti modi.', 57, '957.00', 153, '2022-08-23 23:23:05', '2022-09-07 12:57:06'),
(94, 'Miss', 'Voluptatem saepe officiis eos consectetur voluptate. Iste qui debitis soluta sunt. Cupiditate amet mollitia et laboriosam perspiciatis deserunt itaque. Est enim dolor asperiores cum sed incidunt. Est aut nihil quas architecto error enim. A fugit fugiat harum quis asperiores.', 77, '734.00', 153, '2022-08-23 23:23:05', '2022-09-07 12:57:06'),
(95, 'Miss', 'Earum placeat accusamus eos. Consequuntur molestiae aperiam unde debitis ut quos porro quasi. Autem provident non incidunt aliquam cumque asperiores. Sunt modi culpa autem impedit libero. Tempore aspernatur dignissimos et fugit omnis cum qui.', 95, '501.00', 153, '2022-08-23 23:23:05', '2022-09-07 00:51:28'),
(96, 'Mr.', 'Rerum corporis magni qui maiores maxime suscipit. Dolores nihil a quia neque ratione possimus. Temporibus perspiciatis aut dolor non quae non sit.', 89, '243.00', 153, '2022-08-23 23:23:05', '2022-08-23 23:23:05'),
(97, 'Dr.', 'Amet rerum provident voluptatem molestiae quis sunt. Libero aperiam impedit eos placeat earum molestias voluptatum. Corrupti occaecati accusamus suscipit voluptas praesentium.', 87, '227.00', 153, '2022-08-23 23:23:05', '2022-08-23 23:23:05'),
(98, 'Mrs.', 'Autem doloremque ratione labore quo est doloremque. Enim atque voluptas in quo amet. Possimus fuga officiis aut quam amet enim veritatis quis.', 96, '249.00', 153, '2022-08-23 23:23:05', '2022-08-23 23:23:05'),
(99, 'Dr.', 'Nesciunt quae facere optio blanditiis illum ea aut. Et alias maiores magnam odio quo quasi numquam. Illum voluptas ullam facere in sed. Eveniet quo sed ex cumque aut. Ea accusamus exercitationem cumque et in. Adipisci et et voluptatem cupiditate.', 65, '226.00', 153, '2022-08-23 23:23:05', '2022-08-23 23:23:05'),
(100, 'Dr.', 'Consequuntur rerum numquam in quod provident. Architecto est molestias quasi eligendi recusandae voluptatem. Repudiandae ratione et similique ex. Sapiente quis numquam sint velit. Perferendis distinctio ea consequatur est.', 66, '936.00', 153, '2022-08-23 23:23:05', '2022-08-23 23:23:05'),
(101, 'Prof.', 'Quisquam commodi quia corrupti suscipit numquam in. Consequuntur pariatur id inventore sequi. Odio eos iste enim non illum dicta qui ut. Cumque in et aut non est quos expedita.', 71, '374.00', 153, '2022-08-23 23:23:05', '2022-08-23 23:23:05'),
(102, 'Mr.', 'Perspiciatis ut praesentium quis possimus. Adipisci est quo molestiae repellat. Est molestiae dicta doloremque aut. Atque similique error odio assumenda ut cupiditate eius. Corrupti ea aut quasi iste voluptatibus.', 98, '253.00', 153, '2022-08-23 23:23:05', '2022-08-23 23:23:05'),
(103, 'Mr.', 'Iure ea qui ut. Fuga et sit recusandae magni quos doloremque. Repudiandae cupiditate vel dolore modi autem amet. Quam voluptas ut et eligendi et est nemo.', 100, '358.00', 153, '2022-08-23 23:23:05', '2022-08-23 23:23:05'),
(104, 'Mr.', 'Esse ipsam distinctio amet cumque suscipit. Commodi molestiae perspiciatis possimus nulla. Aut maiores porro voluptatibus cum quae. Illo eos nihil nisi minus dolorem voluptatem unde. Et nostrum quisquam hic rerum molestiae dolorem.', 97, '948.00', 153, '2022-08-23 23:23:05', '2022-08-23 23:23:05'),
(105, 'Miss', 'Quis ut mollitia minus iusto vitae. Dolorem quia dolor veritatis et velit quia. Et distinctio sit quo suscipit. Vero deserunt assumenda aperiam.', 62, '235.00', 153, '2022-08-23 23:23:05', '2022-08-23 23:23:05'),
(106, 'Dr.', 'Similique consequatur sed quia autem. Qui aut repudiandae assumenda at corrupti vel minus. Consequuntur iure aut nulla eligendi qui quo ut ad. Consequuntur vel error pariatur corporis asperiores. Earum sunt ad sint eligendi provident et maxime.', 63, '488.00', 154, '2022-08-23 23:23:05', '2022-09-11 21:36:16'),
(107, 'Mr.', 'A et non labore laudantium nulla qui perferendis. Saepe ipsa eligendi officiis vero et quia. Facilis ut magni repellat. Corrupti tempore veniam impedit omnis nam et officiis. Quos consequatur voluptatem perferendis laudantium quos dolores beatae.', 91, '668.00', 154, '2022-08-23 23:23:05', '2022-08-23 23:23:05'),
(108, 'Mrs.', 'Consequatur et illo fugit accusantium qui reiciendis. Molestiae ut voluptatem repellat earum porro. Ullam pariatur voluptas laboriosam deserunt nesciunt amet. Dolor quam id cumque sint.', 57, '380.00', 154, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(109, 'Dr.', 'Quis ipsa et est dolor nam repellat error est. Aut accusamus quibusdam est ad sit ducimus laboriosam. Asperiores dolorem fuga magnam exercitationem et assumenda voluptatibus rerum. Eveniet et quod nam dolor dolore deleniti. Non consequatur quas commodi velit et.', 55, '325.00', 154, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(110, 'Dr.', 'Ipsa voluptate debitis porro eum. Eum distinctio perferendis enim voluptatem atque aut ea. Sit id velit magni quidem. Optio error beatae consequatur tempora.', 56, '462.00', 154, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(111, 'Miss', 'Adipisci praesentium eum aperiam quis labore expedita autem. Ab accusantium tenetur ex illum architecto. Eum ullam officiis sint porro voluptas veniam. Sint aperiam placeat corporis necessitatibus est reiciendis. Expedita et a provident reiciendis.', 87, '232.00', 154, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(112, 'Prof.', 'Sint ut officiis voluptas distinctio. Voluptatem autem voluptatum quam dolor veritatis. Adipisci qui natus dolore libero incidunt sunt reprehenderit.', 64, '492.00', 154, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(113, 'Dr.', 'Voluptas corporis neque voluptatem veritatis. Blanditiis quae consequatur repellendus est nesciunt. Laboriosam alias quia aut maiores veritatis voluptas consequatur. Ut et fuga et architecto autem voluptatibus delectus.', 70, '705.00', 154, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(114, 'Dr.', 'Qui quibusdam fugiat voluptatem. Et consequatur vero ex et qui tempora ut. Voluptatem adipisci et ad voluptatem provident. Molestias adipisci temporibus ut.', 79, '880.00', 154, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(115, 'Mr.', 'Voluptatibus optio corporis aliquid ducimus. Quod molestiae itaque qui consequatur dolores amet. Quis eos et quos aut rem in harum omnis. Sunt cupiditate eum facere voluptatum. Commodi error suscipit aliquam odit distinctio voluptas provident similique.', 84, '713.00', 154, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(116, 'Prof.', 'Quam harum unde quibusdam inventore atque enim quisquam. Iure illum accusamus velit maxime omnis odio. Expedita ab qui inventore eius. Placeat corrupti nisi provident nisi.', 76, '878.00', 154, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(117, 'Dr.', 'Est voluptatem qui eaque excepturi esse. Qui et voluptatum et qui quos dolorem necessitatibus. Sit rerum excepturi et dolor inventore facere. Rerum aliquam inventore aut quod eos laudantium omnis.', 81, '588.00', 154, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(118, 'Prof.', 'Aspernatur incidunt enim pariatur commodi ratione dolores ducimus. Et praesentium dolorem et in. Culpa deserunt reprehenderit est unde. Impedit et expedita est dignissimos nesciunt corrupti optio dolorum. Ex voluptatem enim neque animi ea.', 51, '473.00', 154, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(119, 'Prof.', 'Blanditiis et delectus veniam omnis. At nam quis voluptatem. Voluptates aliquid ad quos qui qui magni et. Nihil culpa quo itaque ratione consequatur. Et nobis error eaque earum.', 77, '971.00', 154, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(120, 'Mrs.', 'Et sit nisi asperiores sunt neque veritatis. Accusamus possimus nihil corporis omnis non ut. Ipsum quo natus sit id eum. Rerum hic rem quasi odio.', 83, '834.00', 154, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(121, 'Mrs.', 'Eius maxime velit ut magnam est expedita voluptatibus architecto. Qui necessitatibus voluptates rerum laboriosam hic. Eos eligendi vel quo unde est nesciunt. Excepturi molestias consequatur omnis quisquam voluptate. Quis autem provident officia aut veniam. Earum quae similique porro incidunt eaque rerum.', 85, '268.00', 155, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(122, 'Prof.', 'Ut non aut eaque ipsam. Molestiae iste sed commodi ipsa illum iusto. Sed placeat id est nisi. Ipsa facere iste sed eum ab rerum.', 92, '655.00', 155, '2022-08-23 23:23:06', '2022-09-07 00:50:21'),
(123, 'Mrs.', 'Quis odio quo et. Dicta iusto quidem modi velit harum. Officia dicta ipsam mollitia quo explicabo fuga eos. Laudantium repellendus esse ipsam porro quae.', 58, '776.00', 155, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(124, 'Miss', 'Et doloremque eaque quia laborum eius. Aut quas voluptate dolorum et autem veniam. Ad dolorem voluptas animi et quibusdam. Unde dolor voluptatibus tempora aut sunt amet.', 70, '902.00', 155, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(125, 'Mr.', 'Cumque maiores nihil aut odio quo. Tempora inventore rem illum id et magni. Dolorem ipsum et velit. Quia pariatur incidunt est eius.', 82, '705.00', 155, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(126, 'Miss', 'Natus nihil et rerum. Optio non ab alias tempora nostrum aut. Amet et neque commodi. Corporis corporis ea voluptas maiores libero nihil sequi. Aliquid et maxime qui voluptatem.', 50, '723.00', 155, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(127, 'Mr.', 'Temporibus reiciendis enim quia delectus qui exercitationem. Enim debitis perspiciatis molestiae beatae. Animi id at exercitationem saepe eligendi praesentium.', 71, '339.00', 155, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(128, 'Ms.', 'Deserunt alias nesciunt temporibus voluptatem qui commodi. Facilis aliquid provident temporibus voluptatibus aut nihil dolores. Exercitationem modi dolorum alias placeat et.', 86, '289.00', 155, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(129, 'Mrs.', 'Tempora dolorem sint impedit assumenda. Velit consequatur est voluptas natus. At fuga omnis reprehenderit assumenda. Dicta eos eum quisquam nam.', 71, '578.00', 155, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(130, 'Mrs.', 'Qui harum aspernatur porro praesentium modi eaque atque. Saepe et dolorem facilis nihil eius numquam velit. Repellat consectetur alias necessitatibus cumque qui voluptas. Quaerat qui totam eos molestiae.', 57, '228.00', 155, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(131, 'Miss', 'Rem illo iure deserunt quas ullam alias tempora. Cumque blanditiis et aut incidunt dicta officiis sed. Maxime cupiditate modi delectus amet. Animi sequi eum et distinctio saepe. Sunt ea in qui blanditiis doloribus.', 54, '969.00', 155, '2022-08-23 23:23:06', '2022-08-23 23:23:06'),
(132, 'Dr.', 'Dolorem placeat et quod eaque voluptatum accusantium nesciunt. Dolores magnam est pariatur eos. Omnis ea ut rerum sint. Ad consequuntur est eum voluptatem iusto. Voluptates in ut voluptatem consequuntur tenetur.', 56, '937.00', 155, '2022-08-23 23:23:07', '2022-08-23 23:23:07'),
(133, 'Mr.', 'Voluptas fugit optio saepe adipisci velit et. Itaque laudantium voluptatum voluptatem ut aut qui. Perspiciatis modi dolor dolor sit impedit mollitia ut culpa.', 74, '296.00', 155, '2022-08-23 23:23:07', '2022-08-23 23:23:07'),
(134, 'Mrs.', 'Voluptate ut maiores amet iste ea odit. Omnis voluptatem incidunt assumenda. Sunt sint aspernatur vero aut. Enim at sit quisquam corporis. Culpa eaque consequatur voluptate rerum.', 99, '746.00', 155, '2022-08-23 23:23:07', '2022-08-23 23:23:07'),
(136, 'Mrs.', 'Rem omnis expedita fugiat nobis mollitia voluptatem. Qui est est officiis tenetur sit et ratione. Optio repudiandae deleniti maiores culpa qui cum dolores id.', 50, '376.00', 156, '2022-08-23 23:23:07', '2022-09-07 00:48:41'),
(137, 'Mrs.', 'Ut ex eos ullam nihil. Atque atque deleniti quas veniam. Quas sint eum est neque saepe.', 59, '371.00', 156, '2022-08-23 23:23:07', '2022-09-07 00:47:51'),
(138, 'Dr.', 'Ducimus accusamus voluptatibus ea vel natus facilis. Maiores reiciendis molestiae perferendis cupiditate ipsam at. Amet quas eos itaque. Officia sed illo quibusdam saepe. Ut in eius iure aut. Possimus est quo praesentium dolores maiores aspernatur velit.', 87, '341.00', 156, '2022-08-23 23:23:07', '2022-09-07 00:47:51'),
(139, 'Mr.', 'Ea ipsa voluptatibus tempora at explicabo quae doloribus. Qui in voluptatem deleniti quae sed quo dolor. Est voluptate fugiat est rem est amet dolorem.', 54, '745.00', 156, '2022-08-23 23:23:07', '2022-08-23 23:23:07'),
(140, 'Dr.', 'In repellat dolorem et repudiandae enim ipsum omnis quas. Blanditiis est ipsa dolorem ut at nemo non. Aut dolorem repellendus esse vero. Enim aut commodi maxime tenetur. Est architecto aut esse accusamus.', 75, '929.00', 156, '2022-08-23 23:23:07', '2022-08-23 23:23:07'),
(141, 'Dr.', 'Doloribus suscipit modi voluptas voluptas facere qui totam. Iusto voluptatem neque autem libero atque aut. Quos ut non sint dignissimos sapiente est. Modi quibusdam porro optio.', 60, '807.00', 156, '2022-08-23 23:23:07', '2022-08-23 23:23:07'),
(142, 'Miss', 'Unde ut quo qui minima distinctio et. Voluptas alias accusamus fuga nihil quo deserunt maxime. Omnis est quos dolorum et. Dolores animi animi omnis et aut vitae et.', 97, '216.00', 156, '2022-08-23 23:23:07', '2022-08-23 23:23:07'),
(143, 'Dr.', 'Voluptatem quae omnis rem quod nihil. Saepe cupiditate rerum eum debitis est libero repellat. Qui voluptas tempora commodi nihil dolorem.', 67, '335.00', 156, '2022-08-23 23:23:07', '2022-08-23 23:23:07'),
(145, 'Ms.', 'Id in modi praesentium et vel et esse. Odit quibusdam magni distinctio sint aut. Placeat qui et ex et eligendi animi. Saepe veritatis qui nostrum. Nam quis a quia in aut sunt natus.', 76, '353.00', 156, '2022-08-23 23:23:07', '2022-08-23 23:23:07'),
(146, 'Dr.', 'Ullam repudiandae molestiae voluptas. Perferendis dolores necessitatibus nisi aut doloribus. Et eligendi et facilis dolores aut non qui. Occaecati nihil nihil laborum beatae. Molestiae nemo voluptatum architecto quas.', 88, '897.00', 156, '2022-08-23 23:23:07', '2022-08-23 23:23:07'),
(148, 'Prof.', 'Voluptas recusandae maxime itaque expedita. Officia aliquid quaerat non officia provident vel in perspiciatis. Autem quae illum aut dolore deserunt sunt. Est et sint voluptates vitae autem voluptates dolorum. Porro optio ea ea quaerat.', 92, '756.00', 156, '2022-08-23 23:23:07', '2022-08-23 23:23:07'),
(149, 'Ms.', 'Rerum autem totam exercitationem sed numquam. Aut laboriosam quo accusantium rerum ea nisi. Ipsam deserunt voluptate sint voluptatem.', 98, '420.00', 156, '2022-08-23 23:23:07', '2022-08-23 23:23:07'),
(150, 'Prof.', 'Rerum non numquam voluptatem ipsam laudantium quia. Fuga at non illum aliquid consectetur eum eveniet quae. Pariatur voluptate nemo commodi sit. Veritatis laudantium quod repellendus distinctio est. Velit a eveniet voluptatum est. Et perspiciatis accusantium sunt ut eum ut aut.', 71, '367.00', 156, '2022-08-23 23:23:07', '2022-08-23 23:23:07'),
(151, 'Miss', 'Voluptatem ratione iusto dolorem doloribus hic. Maiores libero eaque voluptatibus modi laboriosam. At eos odio molestias eius ullam incidunt iste.', 65, '626.00', 157, '2022-08-23 23:23:07', '2022-09-07 00:48:16'),
(152, 'Ms.', 'Quod quia nemo reiciendis et rerum. Aliquid aperiam ex sequi qui quaerat necessitatibus. Fuga est perferendis dolorem sed commodi beatae atque. Est natus labore placeat fugiat sunt voluptas et.', 98, '568.00', 157, '2022-08-23 23:23:07', '2022-08-23 23:23:07'),
(153, 'Ms.', 'Eligendi rem sit ut placeat eligendi doloribus at. Nobis deserunt repellendus dolore sint voluptatibus cum. Magnam modi blanditiis deserunt sint nam id eveniet. Officia fugiat non eum praesentium minus similique. Deleniti dolorum saepe a sequi vero. Praesentium nulla culpa accusantium sunt ut tempora.', 65, '972.00', 157, '2022-08-23 23:23:07', '2022-08-23 23:23:07'),
(154, 'Miss', 'Aut quis explicabo deleniti nihil est. Repellat laboriosam et temporibus libero quis voluptas rerum. Ipsa et voluptas sunt.', 53, '368.00', 157, '2022-08-23 23:23:07', '2022-08-23 23:23:07'),
(155, 'Miss', 'Vel minus accusamus possimus aliquam. Odio est neque alias consectetur sint ut quibusdam. In blanditiis distinctio animi voluptatem perspiciatis asperiores laborum. Fugiat explicabo voluptatum aliquam minus soluta sint. Maxime et aut aut eum aperiam iusto.', 84, '493.00', 157, '2022-08-23 23:23:07', '2022-08-23 23:23:07'),
(158, 'Miss', 'Amet consectetur ad veritatis sit et tempora. Culpa quibusdam est ut iusto. Ut possimus laborum aut maiores.', 89, '796.00', 157, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(159, 'Prof.', 'Est perspiciatis ea sunt quia commodi natus cupiditate. Atque et quas perspiciatis dicta. Ut illum quasi maxime unde vero atque. Est quibusdam tempora voluptatem voluptatem impedit cum in blanditiis. Ab aliquid porro est animi vel tenetur nam distinctio.', 51, '410.00', 157, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(160, 'Prof.', 'Vel suscipit illum provident minus voluptas quod sint. Autem omnis minus ea nobis autem. Dolores amet et possimus velit culpa at veniam. Sunt quis aut autem nemo ad repudiandae ut.', 91, '830.00', 157, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(161, 'Mrs.', 'Culpa eum velit eius fugit. Nihil debitis dolorum occaecati facere deleniti iste dolorem. Illo provident corporis eius doloremque magni asperiores voluptatem. Voluptas voluptatum temporibus vitae nemo eos optio.', 76, '655.00', 157, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(162, 'Mr.', 'Ipsam sit quam nemo in ducimus. Repudiandae magni sed aut dolorum. Distinctio incidunt a voluptatem ipsum. Eveniet sint eos eos ex. Eligendi nulla odio amet ullam distinctio.', 72, '650.00', 157, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(163, 'Mrs.', 'Quas rerum voluptatem id culpa explicabo et. Harum suscipit voluptatem et est neque eius. Expedita quae fugiat voluptates dolor beatae rem.', 66, '419.00', 157, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(164, 'Prof.', 'Aut et voluptatem sed sed eius nobis. Fugiat veritatis tempora voluptas. Est et unde aperiam reiciendis.', 76, '473.00', 157, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(165, 'Prof.', 'Impedit placeat ut consequatur expedita. Quia sed sed nesciunt delectus impedit. Reiciendis distinctio et mollitia temporibus inventore maxime odio. Iste aut saepe tempora. Doloremque cupiditate natus ipsum quia fugit.', 69, '663.00', 157, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(166, 'Mr.', 'Quia voluptates recusandae qui qui. Quos ratione iste ratione. Et alias aut omnis sit ipsum. Incidunt eligendi repellat rem molestiae hic adipisci eos. Distinctio sapiente aliquam sequi modi dolores architecto debitis et. Ut et quia odio recusandae consequuntur rem voluptas veritatis.', 99, '349.00', 158, '2022-08-23 23:23:08', '2022-09-07 00:47:14'),
(167, 'Miss', 'Deleniti maxime eius sit eum placeat aut ut. Ab debitis similique doloremque ut assumenda aliquid temporibus. Sint et voluptatem atque qui. Aspernatur dolores voluptate qui in voluptatem fugiat dolor. Voluptatibus provident reprehenderit ratione dolor.', 53, '541.00', 158, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(168, 'Dr.', 'Cupiditate beatae non provident officia sit est ut et. Nulla dolores rerum voluptatem blanditiis blanditiis. Enim voluptatem inventore sed ex voluptates possimus suscipit suscipit. Officiis harum neque voluptas cumque. Amet illo voluptatem consequuntur dolor ea dolor id itaque. Quia voluptatibus temporibus autem.', 59, '814.00', 158, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(169, 'Mr.', 'Molestiae veniam totam ut alias. Voluptatem exercitationem labore ut mollitia. Corporis unde sunt commodi quia quod eveniet eos. Accusantium quibusdam aut repellat voluptas doloremque at. Quasi nihil totam praesentium.', 93, '693.00', 158, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(170, 'Mr.', 'Id quia quo eius repudiandae ut eaque. Blanditiis nam aut neque. Impedit itaque in earum sed necessitatibus corporis voluptatem cupiditate. Sint fugit culpa qui quae reprehenderit a.', 62, '337.00', 158, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(171, 'Dr.', 'Ut molestiae aut deleniti et. Eius vero est vitae et occaecati facere minima. Vero illo at rerum exercitationem dolor.', 83, '273.00', 158, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(172, 'Prof.', 'Reprehenderit a tempore amet quisquam in est alias. Numquam ea dolorum sequi voluptas quae. Est tempora vero laboriosam maiores minima quia. Impedit fuga dicta et harum.', 100, '421.00', 158, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(173, 'Prof.', 'Aut quod rerum quo ea dolores omnis pariatur. Temporibus molestiae repellendus sed est qui. Dolore aliquid totam ratione aperiam voluptas nulla. Qui dolor et error molestias voluptates expedita. Animi suscipit rerum enim officia enim. Veniam praesentium et et aut vel.', 63, '789.00', 158, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(174, 'Ms.', 'Blanditiis dolores voluptatibus sint quod voluptatem porro et facere. Debitis odit voluptas est quisquam. In vitae doloremque omnis et inventore fuga. Id est est eos maxime dolores porro. Ipsa at quaerat inventore exercitationem omnis.', 73, '290.00', 158, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(175, 'Mr.', 'Consequatur esse odio autem dicta quae est libero quae. Aliquam iure vitae ea libero eligendi eos. Exercitationem optio ducimus ut est quis quia vel. Sint laboriosam assumenda voluptas sed aut qui et. Est vel quo ducimus dolores et.', 90, '354.00', 158, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(176, 'Mr.', 'Dicta quidem temporibus quia aut enim cupiditate incidunt inventore. Consequuntur aut laboriosam corporis et fuga quae rerum. Id et rem deserunt qui dolorem. Doloremque voluptas nemo maxime accusantium. Voluptas quisquam in rerum hic et. Hic reiciendis accusamus est dolorem et.', 65, '556.00', 158, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(177, 'Mrs.', 'Quae molestiae numquam temporibus nulla. Eligendi inventore possimus sint repellendus et dolorem. Inventore id odit quaerat ex saepe. Quasi molestiae est voluptatibus in iste recusandae sed.', 95, '786.00', 158, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(178, 'Dr.', 'Nisi et et veniam omnis dignissimos. Quam laborum inventore impedit possimus vel rerum. Laudantium qui fugit recusandae iste nobis perferendis sequi. Dolorem sunt ea cumque voluptatibus maiores eaque vel rerum. Illum ut repellendus porro rem recusandae voluptatem totam.', 87, '579.00', 158, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(179, 'Ms.', 'Quibusdam voluptates illo enim animi recusandae possimus. Sunt amet fugit autem beatae ut et fugit quibusdam. Quia illum omnis cum iure. Rem voluptatem nihil omnis est.', 82, '512.00', 158, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(180, 'Mr.', 'At quo voluptates ratione quasi harum vel quaerat possimus. Omnis perferendis dolore ab et tempore atque velit. Voluptatibus eos vel perspiciatis beatae. Ut ratione est deleniti accusamus accusantium porro. Nihil quos in voluptas quia ut.', 77, '405.00', 158, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(181, 'Dr.', 'Blanditiis et quis illo numquam autem eius distinctio. Ut libero id et culpa. Est ut aut et possimus.', 65, '482.00', 159, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(182, 'Prof.', 'Quo voluptates natus sint sit doloribus quia quibusdam quisquam. Id ut accusamus architecto doloribus voluptas necessitatibus quaerat sapiente. Non architecto aspernatur nostrum praesentium. Aliquid iste nostrum dolore non et rerum provident.', 69, '459.00', 159, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(183, 'Dr.', 'Numquam quisquam cupiditate dolorem. Adipisci ut officiis dolorem voluptatem. Quod possimus est omnis itaque omnis. Porro fugit excepturi quo exercitationem eligendi. Impedit a neque non sint id.', 91, '480.00', 159, '2022-08-23 23:23:08', '2022-08-23 23:23:08'),
(185, 'title mmmmmmmm', 'Similique praesentium est aut ad sequi harum exercitationem. Repellendus sint et sit adipisci eum. Neque aliquam dolore non. Omnis dolor molestiae eos assumenda dolorem qui est. Accusantium in qui quis incidunt ut aut. Et sunt ducimus fugit voluptatem impedit minus consequuntur et.', 57, '791.00', 159, '2022-08-23 23:23:09', '2022-09-10 16:44:30'),
(189, 'Dr.', 'Vel dolores sunt dolorum. Culpa dolor officiis porro. Harum ipsa rerum illum distinctio et veniam eligendi. Distinctio vel modi ducimus consequatur.', 86, '865.00', 159, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(191, 'Prof.', 'Facere ipsam dignissimos atque enim unde nobis id. Voluptate voluptatem ipsa fuga repellendus quia molestiae. Laborum quae omnis quasi quod ut.', 82, '577.00', 159, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(192, 'Ms.', 'Voluptatibus rerum nisi ut. Et ad doloribus omnis sequi ipsum ratione laboriosam. Eos et in illo libero eum iste labore. Voluptatibus nulla quod voluptatem quo impedit inventore veniam.', 52, '907.00', 159, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(193, 'Prof.', 'Fugiat dolore modi numquam quia. Temporibus sed eaque asperiores veritatis provident. In molestiae aut rem qui ut. Quas debitis velit veritatis debitis in eveniet non. Non id et perferendis dolorem laudantium. Tenetur non ut quia omnis inventore animi distinctio.', 98, '269.00', 159, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(194, 'Miss', 'Aliquam odio necessitatibus inventore. Aliquam qui dolorem dicta blanditiis voluptate ad sed. Iusto qui facilis et est iure in possimus. Distinctio reprehenderit eum nemo aut doloremque autem sed.', 95, '811.00', 159, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(195, 'Dr.', 'Ipsa et eos sed est ad perferendis dolores maiores. Eum sunt repellendus ipsum maxime voluptatibus ullam. Consequuntur inventore itaque sed ex alias fugiat nihil. Voluptatum inventore debitis occaecati voluptatem voluptas.', 52, '790.00', 159, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(196, 'Ms.', 'Amet magnam in hic adipisci. Eligendi libero laudantium provident et. Quo aut blanditiis asperiores in. Aperiam et nam vel et aspernatur. Consequatur eaque ratione et qui eligendi ab dignissimos.', 80, '887.00', 160, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(197, 'Prof.', 'Voluptatum exercitationem assumenda laudantium aut quia earum. Ex dicta vero deleniti dolorem. Aut sit ea voluptas nihil provident laboriosam maxime. Sit asperiores harum quas nobis. Qui atque blanditiis repudiandae et. Et id eaque quia aut asperiores animi nisi.', 55, '538.00', 160, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(198, 'Ms.', 'Explicabo consequatur et distinctio. In est at delectus praesentium aut autem dolor exercitationem. Quis dolorum illum maxime explicabo pariatur velit. Veritatis natus accusantium ut dolorem velit rerum.', 77, '394.00', 160, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(199, 'Dr.', 'Et architecto qui consequatur omnis sequi enim. Omnis praesentium qui eos quisquam fuga. Adipisci et omnis dolorem cupiditate dolorem commodi itaque repellendus. Qui aut vel assumenda et quo expedita.', 57, '803.00', 160, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(200, 'Dr.', 'Laborum ullam aut perspiciatis. Maiores nihil magnam tempore. Suscipit officia delectus quis at. Inventore voluptatem assumenda laudantium at eum. Rerum velit eum quidem illum quia rerum est.', 74, '592.00', 160, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(201, 'Miss', 'Expedita perspiciatis earum qui autem. Repellat omnis molestiae officia nulla. Incidunt aspernatur ut repellendus quo ut.', 55, '245.00', 160, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(202, 'Dr.', 'Rem est ducimus eaque quia animi quia molestias. Et voluptas et labore exercitationem. Et placeat iure accusamus nemo in deserunt fugiat.', 98, '643.00', 160, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(203, 'Mr.', 'Aut eum vel at autem. Rerum aliquam harum quo nam accusamus. Sapiente dolore culpa et rerum. Rerum et molestias aliquid blanditiis deleniti eum accusantium.', 95, '301.00', 160, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(204, 'Mrs.', 'Suscipit neque aliquam quia numquam consequatur. Quia reiciendis amet cum aliquam eligendi ut cum. Repellat dolor dolores itaque consequatur. Quidem qui magni odit aperiam laboriosam voluptatibus placeat nam.', 95, '544.00', 160, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(205, 'Mrs.', 'Repudiandae perspiciatis sed reiciendis qui dolores est sed fuga. Alias voluptas ipsam dolor voluptas corporis distinctio. In eos quia eaque odit et eum nostrum. Nam veniam labore sit ut. Qui veritatis vel minima.', 69, '317.00', 160, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(206, 'Dr.', 'Sit in et aut dolorem id autem eos. Est illum eum veniam cumque laboriosam sed. Nihil est nesciunt doloremque vero repudiandae quas tempore.', 64, '514.00', 160, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(207, 'Ms.', 'Ducimus cumque sit labore quo atque nam eos. Quis neque qui qui in sit ipsum debitis magni. Aut officiis est molestias ipsa laborum dolores.', 73, '964.00', 160, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(208, 'Mr.', 'Magnam quibusdam impedit cumque iusto consequatur et quidem. Dolorem repudiandae sunt voluptatem omnis consequatur nihil doloribus. Consequatur unde quasi similique quia. Exercitationem dignissimos molestiae impedit quo velit eligendi sunt porro.', 70, '790.00', 160, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(209, 'Mr.', 'Quis rerum reiciendis et in suscipit qui nesciunt. Blanditiis suscipit velit nulla consequuntur odit et. Aut iusto eaque doloremque est enim ipsa tempore. Officia harum placeat numquam doloremque.', 79, '862.00', 160, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(210, 'Mrs.', 'Ut dolor vitae quas earum incidunt. Ea dicta earum minima officiis ab accusamus. Eum quae autem officiis eveniet voluptas sint. Quia nesciunt et et qui laboriosam. A necessitatibus temporibus dicta praesentium enim pariatur. Quis quia rem molestiae occaecati sed vero.', 54, '629.00', 160, '2022-08-23 23:23:09', '2022-08-23 23:23:09'),
(212, 'lenovo ideapad 330000', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 46, '6000.00', 160, '2022-09-10 13:22:53', '2022-09-10 15:10:02');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `image`, `product_id`, `created_at`, `updated_at`) VALUES
(4, 'covers/kejWsNPmX9LjFD3CdbTYhKnv3MpVBYtxTsZMIdwt.png', 185, '2022-09-10 16:58:34', '2022-09-10 16:58:34'),
(5, 'covers/PF7zTvOdABBvrXJfgkKLHHczUNpR9SeBNQyEIqNY.png', 212, '2022-09-10 16:59:05', '2022-09-10 16:59:05');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `label`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', NULL, NULL),
(2, 'supervisor', 'supervisor', NULL, NULL),
(3, 'customer', 'client', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 16, '2022-08-17 21:27:17', '2022-08-17 21:27:17'),
(1, 17, '2022-08-19 21:27:57', '2022-08-19 21:27:57'),
(3, 19, '2022-08-29 22:03:48', '2022-08-29 22:03:48'),
(3, 20, '2022-09-08 13:13:14', '2022-09-08 13:13:14'),
(2, 21, '2022-09-13 21:44:16', '2022-09-13 21:44:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `address`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES
(16, 'Mohamed Sanhouty', 'san@houty.com', NULL, '$2y$10$y5La20KWJkZFVO.45J.bbe7FwGoI64t.J8X9KW7buoyB5JxcgMBHa', NULL, NULL, NULL, '2022-08-17 21:27:17', '2022-08-23 22:07:01'),
(17, 'Mohamed Afifi', 'mafifi350@gmail.com', NULL, '$2y$10$P6NGUexKmUDOE5WgLyEzgeMNG9vvTloSkmhbZDGwE2Muija.6yRIG', NULL, NULL, NULL, '2022-08-19 21:27:57', '2022-08-19 21:27:57'),
(19, 'Mohamed Ali', 'dffd@ffff.cc', NULL, '$$hashedPassword200', NULL, NULL, NULL, '2022-08-29 22:03:48', '2022-09-12 16:35:36'),
(20, 'Alaa Mohamed', 'alaa@gmail.com', NULL, '$$hashedPassword200', NULL, NULL, NULL, '2022-09-08 13:13:14', '2022-09-08 13:13:14'),
(21, 'Mohamed Sayed', 'msayed@gmail.com', NULL, '$$hashedPassword200', 'cairo', 123456, NULL, '2022-09-13 21:44:16', '2022-09-13 21:44:16');

-- --------------------------------------------------------

--
-- Table structure for table `user_ability`
--

CREATE TABLE `user_ability` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ability_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_ability`
--

INSERT INTO `user_ability` (`user_id`, `ability_id`, `created_at`, `updated_at`) VALUES
(21, 10, NULL, NULL),
(21, 8, NULL, NULL),
(21, 4, NULL, NULL),
(21, 3, NULL, NULL),
(21, 2, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abilities`
--
ALTER TABLE `abilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ability_role`
--
ALTER TABLE `ability_role`
  ADD KEY `ability_role_role_id_foreign` (`role_id`),
  ADD KEY `ability_role_ability_id_foreign` (`ability_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_order_id_foreign` (`order_id`),
  ADD KEY `order_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD KEY `role_user_role_id_foreign` (`role_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_ability`
--
ALTER TABLE `user_ability`
  ADD KEY `user_ability_user_id_foreign` (`user_id`),
  ADD KEY `user_ability_ability_id_foreign` (`ability_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abilities`
--
ALTER TABLE `abilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ability_role`
--
ALTER TABLE `ability_role`
  ADD CONSTRAINT `ability_role_ability_id_foreign` FOREIGN KEY (`ability_id`) REFERENCES `abilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ability_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_ability`
--
ALTER TABLE `user_ability`
  ADD CONSTRAINT `user_ability_ability_id_foreign` FOREIGN KEY (`ability_id`) REFERENCES `abilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ability_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
