-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 26, 2023 lúc 06:32 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `sinhnhat`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Giảm giá ưu đãi mới', 'giam-gia-uu-dai-moi', '/storage/photos/1/Banners/banner1.png', 'Chưa cập nhật !', 'active', '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
(2, 'Mẫu mã cập nhật liên tục', 'uu-dai-khi-thanh-toan-qua-paypal', '/storage/photos/1/Banners/banner2.png', 'Chưa cập nhật !', 'active', '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
(3, 'MẶt hàng đang được ưa chuộng', 'mat-hang-dang-duoc-ua-chuong', '/storage/photos/1/Banners/banner3.png', 'Chưa cập nhật !', 'active', '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
(4, 'Lịch lãm trong từng sự kiện', 'lich-lam-trong-tung-su-kien', '/storage/photos/1/Banners/banner4.png', 'Chưa cập nhật !', 'active', '2023-02-02 01:31:23', '2023-02-02 01:31:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Việt Nam', 'vietnam', 'active', '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
(2, 'Trung Quốc', 'trungquoc', 'active', '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
(3, 'Thái Lan', 'Thái Lan', 'active', '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
(4, 'Âu Mĩ', 'aumi', 'active', '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
(5, 'Nội Địa Trung', 'noidiatrung', 'active', '2023-02-02 01:31:23', '2023-02-02 01:31:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` decimal(18,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(25, 9, 11, 6, 760000.00, 'new', 1, 760000.00, '2023-05-24 10:07:00', '2023-05-24 10:08:11'),
(24, 11, 11, 6, 395000.00, 'new', 1, 395000.00, '2023-05-24 10:06:53', '2023-05-24 10:08:11'),
(10, 6, 3, 1, 540000.00, 'new', 1, 540000.00, '2023-02-02 01:31:23', '2023-02-02 01:31:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bong Bóng Trang Trí', 'bong-trang-tri', '<p>Lorem dddddddddddskjjjjjjjjjjjjjjjjjjjjjjjjj</p>', '/storage/photos/1/Category/anh1.jpg', 1, NULL, NULL, 'active', '2023-02-02 01:31:23', '2023-05-24 07:44:58'),
(2, 'Phụ Kiện Sinh Nhật', 'phu-kien', '<p>Lorem síisuhshshsbsnsh</p>', '/storage/photos/1/Category/anh2.jpg', 1, NULL, NULL, 'active', '2023-02-02 01:31:23', '2023-05-24 07:45:17'),
(3, 'Tem Sinh Nhật', 'tem', '<p>Lorem siushhsjsjsbsbhshshsjs</p>', '/storage/photos/1/Category/anh3.jpg', 1, NULL, NULL, 'active', '2023-02-02 01:31:23', '2023-05-24 07:45:26'),
(4, 'Chủ Đề Sinh Nhật', 'chu-de', '<p>Loremne ssjshshs</p>', '/storage/photos/1/Category/anh4.jpg', 1, NULL, NULL, 'active', '2023-02-02 01:31:23', '2023-05-24 07:45:35');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` enum('fixed','percent') NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'giamgia', 'fixed', 10000.00, 'active', '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
(2, 'trung', 'fixed', 50000.00, 'active', '2023-02-02 01:31:23', '2023-02-02 01:31:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `subject` text NOT NULL,
  `email` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `message` longtext NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(3, 'Nguyễn Văn B', 'A', '1@gmail.com', NULL, '0936846270', 'san pham con it', NULL, '2023-05-24 09:34:25', '2023-05-24 09:34:25'),
(4, 'Nguyễn Văn A', 'Bc', 'nrodamelau@gmail.com', NULL, '0934444454', 'San pham ban dat', NULL, '2023-05-24 09:34:47', '2023-05-24 09:34:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_07_10_021010_create_brands_table', 1),
(6, '2020_07_10_025334_create_banners_table', 1),
(7, '2020_07_10_112147_create_categories_table', 1),
(8, '2020_07_11_063857_create_products_table', 1),
(9, '2020_07_12_073132_create_post_categories_table', 1),
(10, '2020_07_12_073701_create_post_tags_table', 1),
(11, '2020_07_12_083638_create_posts_table', 1),
(12, '2020_07_13_151329_create_messages_table', 1),
(13, '2020_07_14_023748_create_shippings_table', 1),
(14, '2020_07_15_054356_create_orders_table', 1),
(15, '2020_07_15_102626_create_carts_table', 1),
(16, '2020_07_16_041623_create_notifications_table', 1),
(17, '2020_07_16_053240_create_coupons_table', 1),
(18, '2020_07_23_143757_create_wishlists_table', 1),
(19, '2020_07_24_074930_create_product_reviews_table', 1),
(20, '2020_07_24_131727_create_post_comments_table', 1),
(21, '2020_08_01_143408_create_settings_table', 1),
(22, '2022_08_06_140946_create_table_bill', 1),
(23, '2022_08_06_141010_create_table_billdetail', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('fd0c6e84-6f01-4826-b0f8-6efce7b011e7', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/giay-du-lic-nam\",\"fas\":\"fa-star\"}', '2023-05-23 07:33:49', '2023-02-02 01:31:23', '2023-05-23 07:33:49'),
('9435998a-9c3c-43ba-a69b-97dae71c7584', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', '2023-05-23 07:52:52', '2023-02-02 01:31:23', '2023-05-23 07:52:52'),
('1da047ef-9f22-47d5-9324-c03936bbc1b1', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', '2023-05-24 09:24:13', '2023-02-02 01:31:23', '2023-05-24 09:24:13'),
('607302d8-9c76-459e-aa33-efa25a2cbc55', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/giay-nam-jshsjhagagg\",\"fas\":\"fa-star\"}', NULL, '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
('95c3d78c-4bd1-49b6-91a7-1e083dd4ab37', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/blog-detail\\/san-pham-nao-nen-mua\",\"fas\":\"fas fa-comment\"}', '2023-05-23 07:52:59', '2023-02-02 01:31:23', '2023-05-23 07:52:59'),
('2fa1db00-29fb-4ce5-b085-8a6bf478bf9f', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/giay-da-bong-san-co-nhan-tao-adidas-x-speedflow3\",\"fas\":\"fa-star\"}', '2023-05-23 07:44:29', '2023-02-02 01:31:23', '2023-05-23 07:44:29'),
('d8f2a6bb-5f34-4ef6-b5de-8fb6e3a2075a', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
('a702ff71-b9e8-4f49-9b36-aaec3a398f9b', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
('627921b8-2ae2-49bc-a9be-d15a891a81a9', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
('704565a2-e290-48f7-a448-590df2627de8', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
('91a82990-9e61-4d64-83dc-a063acf68ff7', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}', NULL, '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
('a7f4eacb-e3eb-471b-b2ac-682c45c0ffaf', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/giay-choi-bong-ro-protect-120\",\"fas\":\"fa-star\"}', NULL, '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
('c7e7f38c-7569-46ed-87b5-76f650da5202', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/blog-detail\\/cac-mat-hang-dang-giam-gia-manh\",\"fas\":\"fas fa-comment\"}', NULL, '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
('8baecf1f-e274-47fe-bf94-4cdbb3b3eea1', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/8\",\"fas\":\"fa-file-alt\"}', NULL, '2023-05-24 09:28:10', '2023-05-24 09:28:10'),
('05147419-ecdd-4e37-9423-694a4c8747af', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/9\",\"fas\":\"fa-file-alt\"}', NULL, '2023-05-24 09:29:40', '2023-05-24 09:29:40'),
('93359391-5fd6-461a-80dc-c2bccb4191f9', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/giay-thoi-trang-nam-kajhs\",\"fas\":\"fa-star\"}', NULL, '2023-05-24 09:36:51', '2023-05-24 09:36:51'),
('60d2532d-ff03-42d3-810c-afd87a9ff1ad', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/giay-da-bong-san-co-nhan-tao-bang-da-agility-540-cho-nguoi-lon-den\",\"fas\":\"fa-star\"}', NULL, '2023-05-24 09:47:49', '2023-05-24 09:47:49'),
('ebbc67a3-334d-4ca7-80a6-e53eab834116', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/10\",\"fas\":\"fa-file-alt\"}', NULL, '2023-05-24 09:49:16', '2023-05-24 09:49:16'),
('8aa77a6f-98f5-43ed-a192-d8798f776f30', 'App\\Notifications\\StatusNotification', 'App\\Models\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/11\",\"fas\":\"fa-file-alt\"}', NULL, '2023-05-24 10:08:11', '2023-05-24 10:08:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` decimal(18,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` decimal(18,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') NOT NULL DEFAULT 'new',
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `post_code` varchar(191) DEFAULT NULL,
  `address1` text NOT NULL,
  `address2` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(9, 'ORD-BOSKHNKIE5', 1, 500000.00, 5, NULL, 540000.00, 1, 'cod', 'unpaid', 'delivered', 'Nguyễn', 'Trung', 'admin@gmail.com', '093444444444', 'Việt Nam', '123', '395 thôn đông cận', 'a', '2023-05-24 09:29:40', '2023-05-24 09:54:32'),
(10, 'ORD-L3AQEFLT8E', 6, 500000.00, 5, NULL, 540000.00, 1, 'cod', 'unpaid', 'new', 'Nguyễn', 'Trung 1', 'hfffanh8205@gmail.com', '0934444454', 'Việt Nam', '1233333', 'gia lộc', 'v', '2023-05-24 09:49:16', '2023-05-24 09:49:16'),
(11, 'ORD-BDN5C3UNKA', 6, 1155000.00, 4, NULL, 1165000.00, 2, 'cod', 'unpaid', 'new', 'Nguyễn', 'Hung', 'thanhtru02@gmail.com', '09556834', 'Việt Nam', '346754', 'gia lộc', 'gia loc', '2023-05-24 10:08:11', '2023-05-24 10:08:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('admin@gmail.com', '$2y$10$kRpQl5X12rd.GiER27stZ..Nwm/A.v4EpWP/jp4vq/8xtd3ND9MXS', '2023-05-24 07:32:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `quote` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Ưu đãi trong tháng 8', 'uu-dai-trong-thang-8', '<div class=\"blog__details__text\" style=\"margin-bottom: 50px; color: rgb(33, 37, 41); font-family: &quot;Nunito Sans&quot;, sans-serif;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span><br></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span><br></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p></div><div class=\"blog__details__text\" style=\"margin-bottom: 50px; color: rgb(33, 37, 41); font-family: &quot;Nunito Sans&quot;, sans-serif;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span></p></div>', '<div class=\"blog__details__text\" style=\"margin-bottom: 50px; color: rgb(33, 37, 41); font-family: &quot;Nunito Sans&quot;, sans-serif;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span><br></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span><br></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p></div><div class=\"blog__details__text\" style=\"margin-bottom: 50px; color: rgb(33, 37, 41); font-family: &quot;Nunito Sans&quot;, sans-serif;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span></p></div>', '<div class=\"blog__details__text\" style=\"margin-bottom: 50px; color: rgb(33, 37, 41); font-family: &quot;Nunito Sans&quot;, sans-serif;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span><br></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span><br></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p></div><div class=\"blog__details__text\" style=\"margin-bottom: 50px; color: rgb(33, 37, 41); font-family: &quot;Nunito Sans&quot;, sans-serif;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span></p></div>', '/storage/photos/1/Posts/p3.png', 'SJYSTSG', 1, NULL, 1, 'active', '2023-02-02 01:31:23', '2023-05-24 08:20:58'),
(2, 'Các mặt hàng đang giảm giá mạnh', 'cac-mat-hang-dang-giam-gia-manh', '<div class=\"blog__details__text\" style=\"margin-bottom: 50px; color: rgb(33, 37, 41); font-family: &quot;Nunito Sans&quot;, sans-serif;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span><br></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span><br></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p></div><div class=\"blog__details__text\" style=\"margin-bottom: 50px; color: rgb(33, 37, 41); font-family: &quot;Nunito Sans&quot;, sans-serif;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span></p></div>', '<div class=\"blog__details__text\" style=\"margin-bottom: 50px; color: rgb(33, 37, 41); font-family: &quot;Nunito Sans&quot;, sans-serif;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span><br></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span><br></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p></div><div class=\"blog__details__text\" style=\"margin-bottom: 50px; color: rgb(33, 37, 41); font-family: &quot;Nunito Sans&quot;, sans-serif;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span></p></div>', '<div class=\"blog__details__text\" style=\"margin-bottom: 50px; color: rgb(33, 37, 41); font-family: &quot;Nunito Sans&quot;, sans-serif;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span><br></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span><br></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p></div><div class=\"blog__details__text\" style=\"margin-bottom: 50px; color: rgb(33, 37, 41); font-family: &quot;Nunito Sans&quot;, sans-serif;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span></p></div>', '/storage/photos/1/Posts/p2.png', 'SJYSTSG', 1, NULL, 1, 'active', '2023-02-02 01:31:23', '2023-05-24 08:20:49'),
(3, 'Sản phẩm nào nên mua', 'san-pham-nao-nen-mua', '<div class=\"blog__details__text\" style=\"margin-bottom: 50px; color: rgb(33, 37, 41); font-family: &quot;Nunito Sans&quot;, sans-serif;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span><br></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span><br></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p></div><div class=\"blog__details__text\" style=\"margin-bottom: 50px; color: rgb(33, 37, 41); font-family: &quot;Nunito Sans&quot;, sans-serif;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span></p></div>', '<div class=\"blog__details__text\" style=\"margin-bottom: 50px; color: rgb(33, 37, 41); font-family: &quot;Nunito Sans&quot;, sans-serif;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span><br></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span><br></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p></div><div class=\"blog__details__text\" style=\"margin-bottom: 50px; color: rgb(33, 37, 41); font-family: &quot;Nunito Sans&quot;, sans-serif;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span></p></div>', '<div class=\"blog__details__text\" style=\"margin-bottom: 50px; color: rgb(33, 37, 41); font-family: &quot;Nunito Sans&quot;, sans-serif;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span><br></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span><br></p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p></div><div class=\"blog__details__text\" style=\"margin-bottom: 50px; color: rgb(33, 37, 41); font-family: &quot;Nunito Sans&quot;, sans-serif;\"><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"></p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-size: 18px; color: rgb(61, 61, 61); line-height: 34px;\"><span style=\"color: rgb(102, 102, 102); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 13px;\"><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">Điều quan trọng là phải chăm sóc bệnh nhân, được bệnh nhân theo dõi, nhưng nó sẽ xảy ra vào thời điểm đó rất nhiều công việc và đau đớn.&nbsp;</font><font style=\"vertical-align: inherit;\">Vì đến từng chi tiết nhỏ nhất, không ai nên thực hành bất kỳ loại công việc nào trừ khi anh ta thu được một số lợi ích từ nó.&nbsp;</font><font style=\"vertical-align: inherit;\">Đừng tức giận với nỗi đau trong sự khiển trách trong niềm vui, anh ấy muốn được một sợi tóc từ nỗi đau với hy vọng rằng không có giống.&nbsp;</font><font style=\"vertical-align: inherit;\">Nếu họ không bị dục vọng làm cho mù quáng, họ sẽ không xuất hiện; họ có lỗi khi từ bỏ nhiệm vụ của mình và mềm lòng, đó là công việc của họ.</font></font></span></p></div>', '/storage/photos/1/Posts/p1.png', 'APOAHSH', 1, NULL, 1, 'active', '2023-02-02 01:31:23', '2023-05-24 08:20:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bài viết mới', 'bai-viet-moi', 'active', '2023-02-02 01:31:23', '2023-02-02 01:31:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `replied_comment` text DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'APOAHSH', 'apoahsh', 'active', '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
(2, 'SJYSTSG', 'sjystsg', 'active', '2023-02-02 01:31:23', '2023-02-02 01:31:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `photo` text NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) DEFAULT 'M',
  `condition` enum('default','new','hot') NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Combo Set Trang Trí Sinh Nhật Thôi Nôi Doraemon', 'giay-thoi-trang-nam-kajhs', '<p><span style=\"font-weight: 600; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif;\">Lưu Ý SẢN PHẨM</span><br></p><div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">SHOP chỉ bán sản phẩm chất lượng tốt có giấy tờ nhập khẩu và kiểm định đầy đủ</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Bán đúng số lượng và sản phẩm cam kết trong set</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không ăn bớt để hạ giá sản phẩm</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không bán hàng tồn kho hàng thanh lý chất lượng thấp</p></div>', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Nếu như mẹ đặt các dịch vụ tới nhà trang trí giống như trọn set đồ trang trí sinh nhật thôi nôi Doraemon của Kool Style thì chắc chắn sẽ chi phí sẽ không dưới 2 triệu, nhưng nếu mẹ mua về để cả gia đình mình cùng tự tay trang trí thì chi phí chỉ bằng 1/4. Cả nhà mình sẽ có một tiệc sinh nhật thôi nôi tuyệt đẹp mà lại tiết kiệm được rất nhiều chi phí.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Kool Style đã tự sản xuất được 90% những món đồ trong set, chỉ có mấy trái bóng kiếng là shop em phải nhập từ Trung Quốc thôi, rất mong được quý khách hàng ủng hộ để shop có được nhà máy sản xuất bóng kiếng tại Việt Nam, shop em biết rằng tự sản xuất chi phí vẫn cao hơn nhập nhưng shop đặt vấn đề an toàn sức khỏe của khách hàng, kiểm soát chất lượng lên trên yếu tố giá rất mong được khách hàng ủng hộ để shop có động lực phấn đấu.</p>', '/storage/photos/1/Products/PD206-Set-bong-trang-tri-sinh-nhat-tong-pastel--415x415.jpg', 100, 'To,Nhỏ', 'new', 'active', 300000.00, 0.00, 1, 2, NULL, 1, '2023-02-02 01:31:23', '2023-05-23 09:28:39'),
(2, 'Set trang trí sinh nhật Siêu Nhân Gà', 'giay-du-lic-nam', '<p><span style=\"font-weight: 600; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif;\">Lưu Ý SẢN PHẨM</span><br></p><div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">SHOP chỉ bán sản phẩm chất lượng tốt có giấy tờ nhập khẩu và kiểm định đầy đủ</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Bán đúng số lượng và sản phẩm cam kết trong set</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không ăn bớt để hạ giá sản phẩm</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không bán hàng tồn kho hàng thanh lý chất lượng thấp</p></div>', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Line bong bóng nghệ thuật free style của Kool Style sẽ tạo nên một sân khấu sinh nhật thật đẹp dành riêng cho bé trai nhà mình, mẫu line bong bóng này được áp dụng khi nhà hàng tổ chức tiệc đã có sẵn backdrop lá cây ở đằng sau, Kool Style chỉ việc tới tiệc để trang trí</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Trọn gói trang trí bong bóng nghệ thuật cho bé trai gồm:</p><ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\"><li>Kết line bong bóng thành một vòm cổng vuông ( 3m x 2,5m ) theo màu sắc khách hàng yêu thích</li><li>Trụ vuông để khách hàng trang trí</li><li>Chuẩn bị các bộ kệ bánh và đĩa đựng bánh ngọt để khách hàng trang trí thành bàn bánh kem theo phong cách của riêng mình</li></ul><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Kool Style sẽ chỉ các mẹ chỗ mua bánh đẹp hoặc tính toán lượng bánh phù hợp để đặt hộ mẹ nên mẹ cứ yên tâm về vấn để bánh trang trí nhé.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Note: Giá set up áp dụng cho các địa điểm tại các quận trung tâm nội thành SG, các địa điểm xa trung tâm sẽ tính phụ phí di chuyển tùy địa điểm cụ thể shop sẽ tư vấn chi tiết.</p>', '/storage/photos/1/Products/set-trang-tri-sinh-nhat-cocomelon-bell-1-415x311.jpg', 100, 'To,Nhỏ', 'hot', 'active', 450000.00, 10.00, 1, 2, NULL, 3, '2023-02-02 01:31:23', '2023-05-23 09:24:06'),
(3, 'Set trang trí sinh nhật chủ đề Baby Boss', 'giay-thoi-trang-di-du-lich', '<p><span style=\"font-weight: 600; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif;\">Lưu Ý SẢN PHẨM</span><br></p><div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">SHOP chỉ bán sản phẩm chất lượng tốt có giấy tờ nhập khẩu và kiểm định đầy đủ</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Bán đúng số lượng và sản phẩm cam kết trong set</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không ăn bớt để hạ giá sản phẩm</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không bán hàng tồn kho hàng thanh lý chất lượng thấp</p></div>', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Xe kem sinh nhật kết hợp tông màu hồng xanh cam được kết line theo một phong cách nghệ thuật chắc chắn sẽ là một điểm nhấn tuyệt vời cho tiệc sinh nhật bé yêu. Kool Style sẽ luôn có những loại bong bóng với nhiều tông màu đẹp, phù hợp cho tiệc sinh nhật con yêu</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Trọn gói trang trí sinh nhật thôi nôi bong bóng xe kem gồm</p><ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\"><li>Xe kem sinh nhật ( 1,5m x 0.6m ) được chở tới tận tiệc để lắp đặt trang trí cho khách hàng</li><li>Kết line bong bóng nghệ thuật mix màu để tô điểm xe kem sinh nhật của bé</li><li>Chuẩn bị sẵn bộ kệ bánh và các đĩa đựng bánh ngọt, bánh cupcake để khách hàng có một bàn bánh trang trí cực kỳ đẳng cấp</li></ul><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Kool Style sẽ chỉ các mẹ chỗ mua bánh đẹp hoặc tính toán lượng bánh phù hợp để đặt hộ mẹ nên mẹ cứ yên tâm về vấn để bánh trang trí nhé</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Note: Giá set up áp dụng cho các địa điểm tại các quận trung tâm nội thành SG, các địa điểm xa trung tâm sẽ tính phụ phí di chuyển tùy địa điểm cụ thể shop sẽ tư vấn chi tiết.</p>', '/storage/photos/1/Products/trang-tri-bong-bong-free-style-ket-hop-tru.jpg', 100, 'To,Nhỏ', 'hot', 'active', 500000.00, 0.00, 1, 2, NULL, 3, '2023-02-02 01:31:23', '2023-05-23 09:27:33'),
(4, 'Bảng Trang Trí Sinh Nhật', 'giay-thoi-trang-nu-kajsh', '<p><span style=\"font-weight: 600; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif;\">Lưu Ý SẢN PHẨM</span><br></p><div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">SHOP chỉ bán sản phẩm chất lượng tốt có giấy tờ nhập khẩu và kiểm định đầy đủ</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Bán đúng số lượng và sản phẩm cam kết trong set</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không ăn bớt để hạ giá sản phẩm</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không bán hàng tồn kho hàng thanh lý chất lượng thấp</p></div>', '<p><font color=\"#333333\" face=\"Open Sans, sans-serif\"><span style=\"font-size: 13px;\">Chưa có mô tả !</span></font></p>', '/storage/photos/1/Products/bang-thong-tin-chalkboard-micky-benji.jpg', 100, 'To,Nhỏ', 'new', 'active', 250000.00, 5.00, 1, 3, NULL, 4, '2023-02-02 01:31:23', '2023-05-23 09:26:35'),
(5, 'Lorem issusmmss LJSHSHH', 'lorem-issusmmss-ljshshh', '<p><span style=\"font-weight: 600; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif;\">Lưu Ý SẢN PHẨM</span><br></p><div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">SHOP chỉ bán sản phẩm chất lượng tốt có giấy tờ nhập khẩu và kiểm định đầy đủ</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Bán đúng số lượng và sản phẩm cam kết trong set</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không ăn bớt để hạ giá sản phẩm</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không bán hàng tồn kho hàng thanh lý chất lượng thấp</p></div>', '<h2 style=\"text-rendering: optimizespeed; color: rgb(35, 35, 35); margin-bottom: 0.5em; width: 787.906px; line-height: 1.3; font-size: 1.6em; font-family: sans-serif;\">Không bao gồm</h2><ul style=\"list-style-position: initial; list-style-image: initial; padding: 0px; margin-bottom: 1.3em; color: rgb(35, 35, 35); font-family: sans-serif; font-size: medium;\"><li style=\"margin-bottom: 0.6em;\">2 trụ bóng Jumbo</li><li style=\"margin-bottom: 0.6em;\">Chibi bé</li></ul><h2 style=\"text-rendering: optimizespeed; color: rgb(35, 35, 35); margin-bottom: 0.5em; width: 787.906px; line-height: 1.3; font-size: 1.6em; font-family: sans-serif;\">Dịch vụ thi công trọn gói</h2><ul style=\"list-style-position: initial; list-style-image: initial; padding: 0px; margin-bottom: 1.3em; color: rgb(35, 35, 35); font-family: sans-serif; font-size: medium;\"><li style=\"margin-bottom: 0.6em;\">Phí&nbsp;<span style=\"font-weight: bolder;\">1.600.000 đ VNĐ</span>, nhân viên tới trang trí tận nơi như mẫu.</li><li style=\"margin-bottom: 0.6em;\">Thêm bóng thả sàn.</li><li style=\"margin-bottom: 0.6em;\">Tăng size khung thành 1m5x2m.</li></ul><h3 style=\"text-rendering: optimizespeed; color: rgb(35, 35, 35); margin-bottom: 0.5em; width: 787.906px; font-size: 1.25em; font-family: sans-serif;\">Khách hàng lưu ý</h3><ul style=\"list-style-position: initial; list-style-image: initial; padding: 0px; margin-bottom: 1.3em; color: rgb(35, 35, 35); font-family: sans-serif; font-size: medium;\"><li style=\"margin-bottom: 0.6em;\"><span style=\"font-weight: bolder;\">Giá sản phẩm là giá bán lẻ, không bao gồm chi phí thi công setup. Khách hàng có nhu cầu setup như mẫu, inbox page để được tư vấn.</span></li><li style=\"margin-bottom: 0.6em;\">Bong bóng shop giao cho khách trong tình trạng chưa bơm.</li><li style=\"margin-bottom: 0.6em;\">Đối với bong bóng bay bơm có tính phí tại cửa hàng</li></ul><h3 style=\"text-rendering: optimizespeed; color: rgb(35, 35, 35); margin-bottom: 0.5em; width: 787.906px; font-size: 1.25em; font-family: sans-serif;\">Quà tặng kèm khi mua nguyên Combo/Set:</h3><ul style=\"list-style-position: initial; list-style-image: initial; padding: 0px; margin-bottom: 1.3em; color: rgb(35, 35, 35); font-family: sans-serif; font-size: medium;\"><li style=\"margin-bottom: 0.6em;\">Bơm tay</li><li style=\"margin-bottom: 0.6em;\">Dây định hình bong bóng</li><li style=\"margin-bottom: 0.6em;\">Keo dán chuyên dụng cho bong bóng</li></ul>', '/storage/photos/1/Products/combo_trang_tri_phong_mau_21_-_rose_gold_f303de73b9394e4094ea3cfd03938085_master.jpg', 100, 'To,Nhỏ', 'hot', 'active', 600000.00, 8.00, 1, 3, NULL, 4, '2023-02-02 01:31:23', '2023-05-23 09:15:52'),
(6, 'Trang Trí Trọn Gói Sinh Nhật Cho Bé Trai', 'giay-nam-jshsjhagagg', '<p><span style=\"font-weight: 600; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif;\">Lưu Ý SẢN PHẨM</span><br></p><div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">SHOP chỉ bán sản phẩm chất lượng tốt có giấy tờ nhập khẩu và kiểm định đầy đủ</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Bán đúng số lượng và sản phẩm cam kết trong set</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không ăn bớt để hạ giá sản phẩm</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không bán hàng tồn kho hàng thanh lý chất lượng thấp</p></div>', 'Sản phẩm đang trong quá trình update !!!', '/storage/photos/1/Products/trang-tri-bong-bong-ket-hop-backdrop-tron-cho-be-gai-800x800.jpg', 200, 'To,Nhỏ', 'hot', 'active', 600000.00, 5.00, 1, 4, NULL, 1, '2023-02-02 01:31:23', '2023-05-23 08:58:04'),
(7, 'Combo Set Đồ Trang Trí Thôi Nôi Sinh Nhật Bé Gái Tuổi Chuột Minnie', 'giay-chay-bo-run-one-cho-nam-xam', '<p><span style=\"font-weight: 600; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif;\">Lưu Ý SẢN PHẨM</span><br></p><div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">SHOP chỉ bán sản phẩm chất lượng tốt có giấy tờ nhập khẩu và kiểm định đầy đủ</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Bán đúng số lượng và sản phẩm cam kết trong set</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không ăn bớt để hạ giá sản phẩm</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không bán hàng tồn kho hàng thanh lý chất lượng thấp</p></div>', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Đối với bé gái tuổi chuột thì hiện tại chưa có chú chuột nào đủ thông minh ngoan ngoãn dịu dàng như chú chuột Minnie đáng yêu Với ý tưởng trang trí của Kool Style cả gia đình mình sẽ có thể tự tay trang trí một buổi tiệc sinh nhật thật đẹp thật hoành tráng với chi phí cực rẻ và tiết kiệm Điều quan trọng là combo set đồ trang trí thôi nôi Minnie của Kool Style luôn có đầy đủ không thiếu thứ gì để các mẹ có thể làm một buổi tiệc thật hoành tráng Hãy ghé Kool Style shop ngay để mua set đồ sinh nhật thôi nôi cho bé gái tuổi chuột của Kool Style nhé.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Kool Style đã tự sản xuất được 90% những món đồ trong set, chỉ có mấy trái bóng kiếng là shop em phải nhập từ Trung Quốc thôi, rất mong được quý khách hàng ủng hộ để shop có được nhà máy sản xuất bóng kiếng tại Việt Nam, shop em biết rằng tự sản xuất chi phí vẫn cao hơn nhập nhưng shop đặt vấn đề an toàn sức khỏe của khách hàng, kiểm soát chất lượng lên trên yếu tố giá rất mong được khách hàng ủng hộ để shop có động lực phấn đấu.</p>', '/storage/photos/1/Products/set-phu-kien-sinh-nhat-thoi-noi-gia-re-be-gai-tuoi-cho.jpg', 100, 'To,Nhỏ', 'hot', 'active', 275000.00, 0.00, 1, 1, NULL, 2, '2023-02-02 01:31:23', '2023-05-23 08:39:43'),
(8, 'Combo Set Đồ Trang Trí Sinh Nhật Mc Queen', 'giay-chay-dia-hinh-tr2-cho-nam', '<p><span style=\"font-weight: 600; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif;\">Lưu Ý SẢN PHẨM</span><br></p><div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">SHOP chỉ bán sản phẩm chất lượng tốt có giấy tờ nhập khẩu và kiểm định đầy đủ</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Bán đúng số lượng và sản phẩm cam kết trong set</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không ăn bớt để hạ giá sản phẩm</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không bán hàng tồn kho hàng thanh lý chất lượng thấp</p></div>', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Xe hơi và những chiếc siêu xe luôn là niềm đam mê không chỉ của ba mẹ mà còn của tất cả mọi người Nếu gia đình mình chưa có điều kiện mua những chiếc siêu xe thì hãy mang những chú xe hơi tinh nghịch trong bộ phim hoạt hình Vương Quốc Xe Hơi đến với sinh nhật bé yêu nhà mình nhé.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Kool Style đã tự sản xuất được 90% những món đồ trong set, chỉ có mấy trái bóng kiếng là shop em phải nhập từ Trung Quốc thôi, rất mong được quý khách hàng ủng hộ để shop có được nhà máy sản xuất bóng kiếng tại Việt Nam, shop em biết rằng tự sản xuất chi phí vẫn cao hơn nhập nhưng shop đặt vấn đề an toàn sức khỏe của khách hàng, kiểm soát chất lượng lên trên yếu tố giá rất mong được khách hàng ủng hộ để shop có động lực phấn đấu.</p>', '/storage/photos/1/Products/combo-set-do-trang-tri-sinh-nhat-cho-be-trai-mc-queen.jpg', 100, 'To,Nhỏ', 'new', 'active', 750000.00, 0.00, 1, 4, NULL, 4, '2023-02-02 01:31:23', '2023-05-23 08:38:25'),
(9, 'Trang Trí Trọn Gói Sinh Nhật Chủ Đề Xì Trum', 'giay-da-bong-san-co-nhan-tao-bang-da-agility-540-cho-nguoi-lon-den', '<p><span style=\"font-weight: 600; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif;\">Lưu Ý SẢN PHẨM</span><br></p><div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">SHOP chỉ bán sản phẩm chất lượng tốt có giấy tờ nhập khẩu và kiểm định đầy đủ</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Bán đúng số lượng và sản phẩm cam kết trong set</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không ăn bớt để hạ giá sản phẩm</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không bán hàng tồn kho hàng thanh lý chất lượng thấp</p></div>', '<font color=\"#424453\" face=\"Roboto Condensed, sans-serif\"><span style=\"font-size: 14px;\">Chưa Cập Nhật Mô Tả !!!</span></font>', '/storage/photos/1/Products/set-phu-kien-sinh-nhat-thoi-noi-gia-re-be-gai-tuoi-cho.jpg', 100, 'To,Nhỏ', 'new', 'active', 800000.00, 5.00, 1, 1, NULL, 4, '2023-02-02 01:31:23', '2023-05-23 08:31:14'),
(10, 'Hộp Bóng Bay + 2 Chùm Bóng Bay - Xanh Hồng Pastel', 'giay-da-bong-san-co-nhan-tao-co-quai-dan-agility-500-hg-cho-tre-em-xanh-duong', '<p><span style=\"font-weight: 600; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif;\">Lưu Ý SẢN PHẨM</span><br></p><div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">SHOP chỉ bán sản phẩm chất lượng tốt có giấy tờ nhập khẩu và kiểm định đầy đủ</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Bán đúng số lượng và sản phẩm cam kết trong set</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không ăn bớt để hạ giá sản phẩm</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không bán hàng tồn kho hàng thanh lý chất lượng thấp</p></div>', '<span style=\"color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Gender reveal party – Boy or Girl</span><br style=\"color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\"><span style=\"color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Buổi tiệc công bố giới tính của bé yêu rất quen thuộc với các gia đình phương Tây , khi gia đình chuẩn bị đón chào một thành viên mới, mọi người sẽ rất tò mò giới tính của bé lúc Mẹ đang mang thai.</span><br style=\"color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\"><span style=\"color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Vào những tháng cuối khi bào thai đủ lớn và xác định được giới tính của bé, cả nhà sẽ tổ chức 1 buổi tiệc, công bố giới tính của thai nhi cho tất cả mọi người cùng biết để cùng chúc mừng và chọn mua các món quà tặng cho em bé theo đúng giới tính.</span><br style=\"color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\"><span style=\"color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Buổi tiệc này được thực hiện dưới ý tưởng chung là trang trí các vật dụng có tone màu chủ đạo xanh dương và hồng, xanh dương cho bé trai và hồng cho bé gái, sau đó sẽ có 1 đồ vật đặt biệt, ẩn giấu bên trong là kết quả thể hiện giới tính của bé , ví dụ như : bột phấn, kim tuyến, lỗng vũ, bóng bay , quần áo , pháo , hay bất kỳ thứ gì miễn nó có mang tone màu giới tính của bé .</span><br style=\"color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\"><span style=\"color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Gần đây thì các Ba Mẹ Việt đã mang nó về Việt Nam cùng nhiều ý tưởng đáng yêu và độc đáo , ví dụ với set bóng ngày hôm nay Kool Style thực hiện cho Ba Mẹ , người vợ đã lên ý tưởng 1 chiếc hộp bóng bên dưới được kéo những tấm giấy ghi nội dung ” ITS A BOY ” để công bố cho người chồng và tất cả bạn bè gia đình rằng chúng ta sắp đón chào 1 bé trai ,</span><br style=\"color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\"><span style=\"color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Với những chiếc nơ và tua rua cũng được phối màu xanh theo màu chủ đạo của bé trai . Ban đầu hộp bóng sẽ được cố định bằng chiếc nơ ruybang, bên trong sẽ có 2 tone màu xanh và hồng để mọi người cùng dự đoán , cho đến khi người chồng mở chiếc nơ ra , quả bóng sẽ bay lên kèm theo câu trả lời , cả nhà vô cùng bất ngờ và thú vị với kết quả này.</span><br>', '/storage/photos/1/Products/hop-qua-bong-bong-sinh-nhat-jumbo.jpg', 100, 'To,Nhỏ', 'hot', 'active', 500000.00, 0.00, 1, 1, NULL, 2, '2023-02-02 01:31:23', '2023-05-23 08:27:53'),
(11, 'Bong Bóng Trái Tim Đủ Màu', 'giay-da-bong-san-co-nhan-tao-adidas-x-speedflow3', '<p><span style=\"font-weight: 600; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif;\">Lưu Ý SẢN PHẨM</span><br></p><div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">SHOP chỉ bán sản phẩm chất lượng tốt có giấy tờ nhập khẩu và kiểm định đầy đủ</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Bán đúng số lượng và sản phẩm cam kết trong set</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không ăn bớt để hạ giá sản phẩm</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không bán hàng tồn kho hàng thanh lý chất lượng thấp</p></div>', '<ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\"><li>Kích thước : 20cm</li><li>Sử dụng dụng cụ bơm bằng tay có đầu bơm nhỏ hoặc ống hút để làm phòng lên</li><li>Bóng chỉ bơm phồng , không tự bay được nhe ạ</li><li>Van khí 1 chiều tự đóng sau khi bạn rút ống bơm ra, không cần cột dây hay bất kỳ dụng cụ nào</li></ul>', '/storage/photos/1/Products/fdgf-800x800.jpg', 100, 'To,Nhỏ', 'hot', 'active', 395000.00, 0.00, 1, 2, NULL, 1, '2023-02-02 01:31:23', '2023-05-23 08:21:26'),
(12, 'Bong Bóng Chữ W Màu Vàng', 'giay-lv-trainer-trang-den-rep', '<p><span style=\"font-weight: 600; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif;\">Lưu Ý SẢN PHẨM</span><br></p><div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">SHOP chỉ bán sản phẩm chất lượng tốt có giấy tờ nhập khẩu và kiểm định đầy đủ</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Bán đúng số lượng và sản phẩm cam kết trong set</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không ăn bớt để hạ giá sản phẩm</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không bán hàng tồn kho hàng thanh lý chất lượng thấp</p></div>', '<ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\"><li>Kích thước : 20cm</li><li>Sử dụng dụng cụ bơm bằng tay có đầu bơm nhỏ hoặc ống hút để làm phòng lên</li><li>Bóng chỉ bơm phồng , không tự bay được nhe ạ</li><li>Van khí 1 chiều tự đóng sau khi bạn rút ống bơm ra, không cần cột dây hay bất kỳ dụng cụ nào</li></ul>', '/storage/photos/1/Products/bong-bong-chu-W-mau-vang.jpg', 200, 'To,Nhỏ', 'hot', 'active', 350000.00, 0.00, 1, 1, NULL, 3, '2023-02-02 01:31:23', '2023-05-23 08:07:33'),
(13, 'Set Trang Trí Sinh Nhật Tông Bạc Đen - Kool Style', 'giay-the-thao-nam-ag0156', '<p><span style=\"font-weight: 600; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif;\">Lưu Ý SẢN PHẨM</span><br></p><div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">SHOP chỉ bán sản phẩm chất lượng tốt có giấy tờ nhập khẩu và kiểm định đầy đủ</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Bán đúng số lượng và sản phẩm cam kết trong set</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không ăn bớt để hạ giá sản phẩm</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không bán hàng tồn kho hàng thanh lý chất lượng thấp</p></div>', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Các mẫu set trang trí sinh nhật tại nhà do Kool Style cung cấp luôn có sẵn hàng tại các cửa hàng</p><ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\"><li>&nbsp;Set bao gồm tất cả các món được ghi trên ảnh bìa – đúng size đúng màu đúng số lượng</li><li>Được tặng kèm keo dán bóng và đồ bơm bóng loại tốt</li><li>Bóng cao su được sử dụng bóng Thái cao cấp dày dặn đều màu</li><li>&nbsp;Đối với set có kèm số tuổi, tên – vui lòng ghi chú số tuổi và tên ( không quá 10 ký tự) của chủ tiệc khi đặt hàng để shop soạn đơn đúng và nhanh nhất.</li></ul><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Chúng tôi cam kết sản phẩm như hình đúng mẫu 100%,</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Đây là sản phẩm độc quyền do đội ngũ Kool Style tự lên thiết kế và soạn hàng nên khách hàng có thể yên tâm mua sắm các set đóng sẳn tại Kool Style.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Quý khách có thể liên hệ với chúng tôi mọi lúc để sở hữu set trang trí sinh nhật vô cùng tiện lợi này nhá !</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">1 Vài lưu ý đối với các sản phẩm tự làm :</p><ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\"><li>Bóng bơm bằng dụng cụ bơmthường sẽ không tự bay (bóng chỉ bay khi được bơm bằng khí heli / hidro)</li><li>Chỉ bơm vừa đủ độ căng để tránh bể, nổ ( nhất là với các loại bóng có màu siêu nhũ kim loại )&nbsp; Sau đó dán lên tường theo vị trí như ảnh bìa demo</li><li>Video hướng dẫn cách bơm và các kỷ thuật trang trí bóng đơn giản có tại kênh Youtube&nbsp; Kool Style : https://www.youtube.com/@BongbongNghethuatkoolstyle/videos</li><li>Quý khách nên bơm bóng trước 3-4 tiếng trước khi bắt đầu tiệc, vì nếu bơm bóng cao su quá sớm để qua ngày bóng sẽ giảm độ bóng, không được đẹp như ban đầu trừ khi mình sử dụng thêm lớp xịt dưỡng giữ màu bóng nhe ạ .<br>Trân trọng.</li></ul>', '/storage/photos/1/Products/Set-trang-tri-sinh-nhat-tone-bac-den-1.jpg', 100, 'To,Nhỏ', 'new', 'active', 850000.00, 0.00, 1, 1, NULL, 3, '2023-02-02 01:31:23', '2023-05-23 07:56:50'),
(14, 'Set Trang Trí Sinh Nhật Tông Vàng - Kool Style', 'giay-truot-patin-1-hang-play-5-cho-tre-em-do-den', '<p><span style=\"font-weight: 600; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif;\">Lưu Ý SẢN PHẨM</span><br></p><div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">SHOP chỉ bán sản phẩm chất lượng tốt có giấy tờ nhập khẩu và kiểm định đầy đủ</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Bán đúng số lượng và sản phẩm cam kết trong set</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không ăn bớt để hạ giá sản phẩm</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không bán hàng tồn kho hàng thanh lý chất lượng thấp</p></div>', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Các mẫu set trang trí sinh nhật tại nhà do Kool Style cung cấp luôn có sẵn hàng tại các cửa hàng</p><ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\"><li>&nbsp;Set bao gồm tất cả các món được ghi trên ảnh bìa – đúng size đúng màu đúng số lượng</li><li>Được tặng kèm keo dán bóng và đồ bơm bóng loại tốt</li><li>Bóng cao su được sử dụng bóng Thái cao cấp dày dặn đều màu</li><li>&nbsp;Đối với set có kèm số tuổi, tên – vui lòng ghi chú số tuổi và tên ( không quá 10 ký tự) của chủ tiệc khi đặt hàng để shop soạn đơn đúng và nhanh nhất.</li></ul><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Chúng tôi cam kết sản phẩm như hình đúng mẫu 100%,</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Đây là sản phẩm độc quyền do đội ngũ Kool Style tự lên thiết kế và soạn hàng nên khách hàng có thể yên tâm mua sắm các set đóng sẳn tại Kool Style.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Quý khách có thể liên hệ với chúng tôi mọi lúc để sở hữu set trang trí sinh nhật vô cùng tiện lợi này nhá !</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">1 Vài lưu ý đối với các sản phẩm tự làm :</p><ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\"><li>Bóng bơm bằng dụng cụ bơmthường sẽ không tự bay (bóng chỉ bay khi được bơm bằng khí heli / hidro)</li><li>Chỉ bơm vừa đủ độ căng để tránh bể, nổ ( nhất là với các loại bóng có màu siêu nhũ kim loại )&nbsp; Sau đó dán lên tường theo vị trí như ảnh bìa demo</li><li>Video hướng dẫn cách bơm và các kỷ thuật trang trí bóng đơn giản có tại kênh Youtube&nbsp; Kool Style : https://www.youtube.com/@BongbongNghethuatkoolstyle/videos</li><li>Quý khách nên bơm bóng trước 3-4 tiếng trước khi bắt đầu tiệc, vì nếu bơm bóng cao su quá sớm để qua ngày bóng sẽ giảm độ bóng, không được đẹp như ban đầu trừ khi mình sử dụng thêm lớp xịt dưỡng giữ màu bóng nhe ạ .<br>Trân trọng.</li></ul>', '/storage/photos/1/Products/anh3.jpg', 100, 'To,Nhỏ', 'new', 'active', 400000.00, 5.00, 1, 1, NULL, 2, '2023-02-02 01:31:23', '2023-05-23 07:37:14'),
(15, 'Set Bóng Sinh Nhật Khủng Long Và Hổ', 'giay-da-ngoai-co-lung-nh100-cho-na', '<p><span style=\"font-weight: 600; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif;\">Lưu Ý SẢN PHẨM</span><br></p><div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">SHOP chỉ bán sản phẩm chất lượng tốt có giấy tờ nhập khẩu và kiểm định đầy đủ</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Bán đúng số lượng và sản phẩm cam kết trong set</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không ăn bớt để hạ giá sản phẩm</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không bán hàng tồn kho hàng thanh lý chất lượng thấp</p></div>', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Các mẫu set trang trí sinh nhật tại nhà do Kool Style cung cấp luôn có sẵn hàng tại các cửa hàng</p><ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\"><li>&nbsp;Set bao gồm tất cả các món được ghi trên ảnh bìa – đúng size đúng màu đúng số lượng</li><li>Được tặng kèm keo dán bóng và đồ bơm bóng loại tốt</li><li>Bóng cao su được sử dụng bóng Thái cao cấp dày dặn đều màu</li><li>&nbsp;Đối với set có kèm số tuổi, tên – vui lòng ghi chú số tuổi và tên ( không quá 10 ký tự) của chủ tiệc khi đặt hàng để shop soạn đơn đúng và nhanh nhất.</li></ul><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Chúng tôi cam kết sản phẩm như hình đúng mẫu 100%,</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Đây là sản phẩm độc quyền do đội ngũ Kool Style tự lên thiết kế và soạn hàng nên khách hàng có thể yên tâm mua sắm các set đóng sẳn tại Kool Style.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Quý khách có thể liên hệ với chúng tôi mọi lúc để sở hữu set trang trí sinh nhật vô cùng tiệnlợi này nhé .</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">1 Vài lưu ý đối với các sản phẩm tự làm :</p><ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\"><li>Bóng bơm bằng dụng cụ bơmthường sẽ không tự bay (bóng chỉ bay khi được bơm bằng khí heli / hidro)</li><li>Chỉ bơm vừa đủ độ căng để tránh bể, nổ ( nhất là với các loại bóng có màu siêu nhũ kim loại )&nbsp; Sau đó dán lên tường theo vị trí như ảnh bìa demo</li><li>Video hướng dẫn cách bơm và các kỷ thuật trang trí bóng đơn giản có tại kênh Youtube&nbsp; Kool Style : https://www.youtube.com/@BongbongNghethuatkoolstyle/videos</li><li>Quý khách nên bơm bóng trước 3-4 tiếng trước khi bắt đầu tiệc, vì nếu bơm bóng cao su quá sớm để qua ngày bóng sẽ giảm độ bóng, không được đẹp như ban đầu trừ khi mình sử dụng thêm lớp xịt dưỡng giữ màu bóng nhe ạ .<br>Trân trọng.</li></ul>', '/storage/photos/1/Products/anh2.jpg', 100, 'To,Nhỏ', 'new', 'active', 600000.00, 10.00, 1, 1, NULL, 1, '2023-02-02 01:31:23', '2023-05-23 07:23:55'),
(16, 'Set Bóng Sinh Nhật Cho Bé Thích Người Nhện Spiderman', 'giay-choi-bong-ro-protect-120', '<p><span style=\"font-weight: 600; color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif;\">Lưu Ý SẢN PHẨM</span><br></p><div class=\"made-for\" style=\"color: rgb(66, 68, 83); font-family: &quot;Roboto Condensed&quot;, sans-serif; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">SHOP chỉ bán sản phẩm chất lượng tốt có giấy tờ nhập khẩu và kiểm định đầy đủ</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Bán đúng số lượng và sản phẩm cam kết trong set</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không ăn bớt để hạ giá sản phẩm</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 16px; background-color: rgb(243, 225, 156);\">Không bán hàng tồn kho hàng thanh lý chất lượng thấp</p></div>', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Các mẫu set trang trí sinh nhật tại nhà do Kool Style cung cấp luôn có sẵn hàng tại các cửa hàng</p><ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\"><li>&nbsp;Set bao gồm tất cả các món được ghi trên ảnh bìa – đúng size đúng màu đúng số lượng</li><li>Được tặng kèm keo dán bóng và đồ bơm bóng loại tốt</li><li>Bóng cao su được sử dụng bóng Thái cao cấp dày dặn đều màu</li><li>&nbsp;Đối với set có kèm số tuổi, tên – vui lòng ghi chú số tuổi và tên ( không quá 10 ký tự) của chủ tiệc khi đặt hàng để shop soạn đơn đúng và nhanh nhất.</li></ul><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Chúng tôi cam kết sản phẩm như hình đúng mẫu 100%,</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Đây là sản phẩm độc quyền do đội ngũ Kool Style tự lên thiết kế và soạn hàng nên khách hàng có thể yên tâm mua sắm các set đóng sẳn tại Kool Style.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Quý khách có thể liên hệ với chúng tôi mọi lúc để sở hữu set trang trí sinh nhật vô cùng tiện lợi này nhá !<span style=\"font-size: 1rem;\">&nbsp;</span></p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">Một bữa tiệc sinh nhật đích thực phải có sự xuất hiện của những chiếc bong bóng. Nếu chủ đề tiệc là người nhện, thì trang trí bong bóng sinh nhật chủ đề người nhện sẽ làm cho bữa tiệc sinh nhật của bạn thêm sôi động và đáng nhớ. Nhưng làm thế nào để trang trí bong bóng sinh nhật chủ đề người nhện đẹp mắt và ấn tượng nhất? Bài viết này sẽ giúp bạn giải quyết vấn đề này.</p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\"><br></p><hr><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; padding: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\">1 Vài lưu ý đối với các sản phẩm tự làm :</p><ul style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(109, 118, 128); font-family: Helvetica, Arial, sans-serif;\"><li>Bóng bơm bằng dụng cụ bơmthường sẽ không tự bay (bóng chỉ bay khi được bơm bằng khí heli / hidro)</li><li>Chỉ bơm vừa đủ độ căng để tránh bể, nổ ( nhất là với các loại bóng có màu siêu nhũ kim loại )&nbsp; Sau đó dán lên tường theo vị trí như ảnh bìa demo</li><li>Video hướng dẫn cách bơm và các kỷ thuật trang trí bóng đơn giản có tại kênh Youtube&nbsp; Kool Style : https://www.youtube.com/@BongbongNghethuatkoolstyle/videos</li><li>Quý khách nên bơm bóng trước 3-4 tiếng trước khi bắt đầu tiệc, vì nếu bơm bóng cao su quá sớm để qua ngày bóng sẽ giảm độ bóng, không được đẹp như ban đầu trừ khi mình sử dụng thêm lớp xịt dưỡng giữ màu bóng nhe ạ .<br>Trân trọng</li></ul>', '/storage/photos/1/Products/anh1.jpg', 100, 'To,Nhỏ', 'hot', 'active', 500000.00, 0.00, 1, 1, NULL, 5, '2023-02-02 01:31:23', '2023-05-24 07:37:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(5, 1, 1, 5, 'san pham dep', 'active', '2023-05-24 09:36:51', '2023-05-24 09:36:51'),
(6, 1, 9, 5, 'ok', 'active', '2023-05-24 09:47:49', '2023-05-24 09:47:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext NOT NULL,
  `short_des` text NOT NULL,
  `logo` varchar(191) NOT NULL,
  `photo` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'HỆ THỐNG CỬA HÀNG KSHOP', 'Chưa cập nhật thêm mô tả !!!', '/storage/photos/1/Settings/logo.png', '/storage/photos/1/Settings/footer-logo.png', 'Gia Lộc - Hải Dương - TP Hải Dương.', '038.2002.295.', 'nrodeptrai14445@gmail.com', NULL, '2023-02-02 01:31:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Giao Hàng Tiết Kiệm', 15000.00, 'active', '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
(2, 'Giao Hàng Nhanh', 25000.00, 'active', '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
(3, 'Giao hàng hỏa tốc', 70000.00, 'active', '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
(4, 'VN EXPRESS', 10000.00, 'active', '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
(5, 'Việt Nam POST', 40000.00, 'active', '2023-02-02 01:31:23', '2023-02-02 01:31:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Thành Trung', 'admin@gmail.com', NULL, '$2y$10$8MUIjvzCMpskc03As0dPFuw/D3TebyBgK/uuJEYiipZCTV8ZSfHoy', '/storage/photos/1/Users/a1.jpg', 'admin', NULL, NULL, 'active', 'FzTvJ1E5bomX021jJyr2zo4TofsDsUvi8EKcgW437iewpcEhnLOXzXLrExWs', '2023-02-02 01:31:23', '2023-05-24 09:58:00'),
(5, 'Nguyễn Văn A', 'user@gmail.com', NULL, '$2y$10$qR/ayItxiQJxVxaHLcTqquglO4eFq9RUMAsi7b2YBdWLvy4sbwMt.', '/storage/photos/1/Users/a2.jpg', 'user', NULL, NULL, 'active', NULL, '2023-02-02 01:31:23', '2023-05-24 09:24:34'),
(6, 'Nguyễn Văn B', 'trung@gmail.com', NULL, '$2y$10$C8Bl.6tnzsEYSbpznPsFjuoy3zAps6gDCfP6TehUlyf.MhFSzBClS', '/storage/photos/1/Users/a3.jpg', 'user', NULL, NULL, 'active', NULL, '2023-05-24 09:25:54', '2023-05-24 09:25:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 6, 7, 2, 540000.00, 1, 540000.00, '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
(4, 13, 14, 1, 850000.00, 1, 850000.00, '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
(6, 16, 19, 5, 500000.00, 1, 500000.00, '2023-02-02 01:31:23', '2023-02-02 01:31:23'),
(8, 14, 21, 1, 380000.00, 1, 380000.00, '2023-05-23 08:56:12', '2023-05-23 09:24:44'),
(9, 15, 22, 1, 540000.00, 1, 540000.00, '2023-05-24 08:30:37', '2023-05-24 09:29:06'),
(10, 1, NULL, 1, 300000.00, 1, 300000.00, '2023-05-24 09:36:36', '2023-05-24 09:36:36');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Chỉ mục cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Chỉ mục cho bảng `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Chỉ mục cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
