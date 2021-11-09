-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Ноя 09 2021 г., 07:22
-- Версия сервера: 10.4.21-MariaDB
-- Версия PHP: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `authors`
--

CREATE TABLE `authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `authors`
--

INSERT INTO `authors` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Miss Raegan Will V', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(2, 'Derek Farrell', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(3, 'Eliza Goodwin', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(4, 'Davon Krajcik', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(5, 'Miss Marquise Moore', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(6, 'Candice Lehner', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(7, 'Colleen Nikolaus I', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(8, 'Dr. Adelia Schowalter Jr.', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(9, 'Prof. Jayson Klocko', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(10, 'Arnaldo Kshlerin', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(11, 'Destany Mayert', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(12, 'Dr. Valentin Nitzsche', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(13, 'Annamarie Brown', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(14, 'Josiane Mills', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(15, 'Hellen Quitzon', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(16, 'Dr. Wilbert Johnson', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(17, 'Keara Langworth', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(18, 'Mrs. Myrtie Kirlin', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(19, 'Madge Gottlieb', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(20, 'Dr. Pink Mueller', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(21, 'Адам Д. Скотт', '2021-11-08 07:11:53', '2021-11-08 07:11:53'),
(22, 'Дэвид Флэнаган', '2021-11-08 14:15:37', '2021-11-08 14:15:37'),
(23, 'Стив Макконнелл', '2021-11-08 16:46:44', '2021-11-08 16:46:44'),
(24, 'Жаклин Нолис', '2021-11-08 16:46:58', '2021-11-08 16:46:58'),
(25, 'Эмили Робинсон', '2021-11-08 16:47:09', '2021-11-08 16:47:09'),
(26, 'Алекс Петров', '2021-11-08 16:47:17', '2021-11-08 16:47:17'),
(27, 'Роберт Мартин', '2021-11-08 16:47:27', '2021-11-08 16:47:27'),
(28, 'Юскэ Мурата', '2021-11-08 16:47:42', '2021-11-08 16:47:42'),
(29, 'One', '2021-11-08 16:47:44', '2021-11-08 16:47:44'),
(30, 'Алан Мур', '2021-11-08 16:47:52', '2021-11-08 16:47:52'),
(31, 'Джеми Делано', '2021-11-08 16:48:02', '2021-11-08 16:48:02'),
(32, 'Фрэнк Миллер', '2021-11-08 16:48:08', '2021-11-08 16:48:08'),
(33, 'Нейт Купер', '2021-11-08 16:48:18', '2021-11-08 16:48:18'),
(34, 'М. Такахаши', '2021-11-08 16:48:45', '2021-11-08 16:48:45');

-- --------------------------------------------------------

--
-- Структура таблицы `authors_products`
--

CREATE TABLE `authors_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `authors_products`
--

INSERT INTO `authors_products` (`id`, `author_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 18, 1, NULL, NULL),
(2, 15, 2, NULL, NULL),
(3, 6, 3, NULL, NULL),
(4, 6, 4, NULL, NULL),
(5, 14, 5, NULL, NULL),
(6, 4, 6, NULL, NULL),
(7, 19, 7, NULL, NULL),
(8, 2, 8, NULL, NULL),
(9, 6, 9, NULL, NULL),
(10, 8, 10, NULL, NULL),
(11, 11, 11, NULL, NULL),
(12, 4, 12, NULL, NULL),
(13, 5, 13, NULL, NULL),
(14, 4, 14, NULL, NULL),
(15, 17, 15, NULL, NULL),
(16, 14, 16, NULL, NULL),
(17, 8, 17, NULL, NULL),
(18, 3, 18, NULL, NULL),
(19, 19, 19, NULL, NULL),
(20, 10, 20, NULL, NULL),
(21, 5, 21, NULL, NULL),
(22, 11, 22, NULL, NULL),
(23, 18, 23, NULL, NULL),
(24, 18, 24, NULL, NULL),
(25, 13, 25, NULL, NULL),
(26, 14, 26, NULL, NULL),
(27, 18, 27, NULL, NULL),
(28, 14, 28, NULL, NULL),
(29, 1, 29, NULL, NULL),
(30, 6, 30, NULL, NULL),
(31, 7, 31, NULL, NULL),
(32, 20, 32, NULL, NULL),
(33, 4, 33, NULL, NULL),
(34, 13, 34, NULL, NULL),
(35, 15, 35, NULL, NULL),
(36, 16, 36, NULL, NULL),
(37, 6, 37, NULL, NULL),
(38, 5, 38, NULL, NULL),
(39, 19, 39, NULL, NULL),
(40, 18, 40, NULL, NULL),
(41, 11, 41, NULL, NULL),
(42, 20, 42, NULL, NULL),
(43, 15, 43, NULL, NULL),
(44, 4, 44, NULL, NULL),
(45, 6, 45, NULL, NULL),
(46, 1, 46, NULL, NULL),
(47, 6, 47, NULL, NULL),
(48, 9, 48, NULL, NULL),
(49, 4, 49, NULL, NULL),
(50, 11, 50, NULL, NULL),
(51, 14, 51, NULL, NULL),
(52, 8, 52, NULL, NULL),
(53, 11, 53, NULL, NULL),
(54, 1, 54, NULL, NULL),
(55, 9, 55, NULL, NULL),
(56, 4, 56, NULL, NULL),
(57, 3, 57, NULL, NULL),
(58, 16, 58, NULL, NULL),
(59, 14, 59, NULL, NULL),
(60, 3, 60, NULL, NULL),
(61, 14, 61, NULL, NULL),
(62, 7, 62, NULL, NULL),
(63, 19, 63, NULL, NULL),
(64, 1, 64, NULL, NULL),
(65, 19, 65, NULL, NULL),
(66, 18, 66, NULL, NULL),
(67, 14, 67, NULL, NULL),
(68, 8, 68, NULL, NULL),
(69, 4, 69, NULL, NULL),
(70, 1, 70, NULL, NULL),
(71, 19, 71, NULL, NULL),
(72, 6, 72, NULL, NULL),
(73, 6, 73, NULL, NULL),
(74, 1, 74, NULL, NULL),
(75, 15, 75, NULL, NULL),
(76, 18, 76, NULL, NULL),
(77, 7, 77, NULL, NULL),
(78, 10, 78, NULL, NULL),
(79, 17, 79, NULL, NULL),
(80, 7, 80, NULL, NULL),
(81, 1, 81, NULL, NULL),
(82, 1, 82, NULL, NULL),
(83, 13, 83, NULL, NULL),
(84, 15, 84, NULL, NULL),
(85, 17, 85, NULL, NULL),
(86, 2, 86, NULL, NULL),
(87, 18, 87, NULL, NULL),
(88, 19, 88, NULL, NULL),
(89, 19, 89, NULL, NULL),
(90, 11, 90, NULL, NULL),
(91, 8, 91, NULL, NULL),
(92, 10, 92, NULL, NULL),
(93, 11, 93, NULL, NULL),
(94, 7, 94, NULL, NULL),
(95, 8, 95, NULL, NULL),
(96, 6, 96, NULL, NULL),
(97, 19, 97, NULL, NULL),
(98, 19, 98, NULL, NULL),
(99, 2, 99, NULL, NULL),
(100, 3, 100, NULL, NULL),
(101, 9, 101, NULL, NULL),
(102, 7, 102, NULL, NULL),
(103, 5, 103, NULL, NULL),
(104, 16, 104, NULL, NULL),
(105, 11, 105, NULL, NULL),
(106, 19, 106, NULL, NULL),
(107, 13, 107, NULL, NULL),
(108, 11, 108, NULL, NULL),
(109, 20, 109, NULL, NULL),
(110, 13, 110, NULL, NULL),
(111, 9, 111, NULL, NULL),
(112, 14, 112, NULL, NULL),
(113, 20, 113, NULL, NULL),
(114, 19, 114, NULL, NULL),
(115, 3, 115, NULL, NULL),
(116, 11, 116, NULL, NULL),
(117, 1, 117, NULL, NULL),
(118, 16, 118, NULL, NULL),
(119, 3, 119, NULL, NULL),
(120, 13, 120, NULL, NULL),
(121, 9, 121, NULL, NULL),
(122, 10, 122, NULL, NULL),
(123, 20, 123, NULL, NULL),
(124, 9, 124, NULL, NULL),
(125, 17, 125, NULL, NULL),
(126, 10, 126, NULL, NULL),
(127, 16, 127, NULL, NULL),
(128, 13, 128, NULL, NULL),
(129, 19, 129, NULL, NULL),
(130, 14, 130, NULL, NULL),
(131, 13, 131, NULL, NULL),
(132, 1, 132, NULL, NULL),
(133, 19, 133, NULL, NULL),
(134, 16, 134, NULL, NULL),
(135, 7, 135, NULL, NULL),
(136, 3, 136, NULL, NULL),
(137, 1, 137, NULL, NULL),
(138, 8, 138, NULL, NULL),
(139, 14, 139, NULL, NULL),
(140, 6, 140, NULL, NULL),
(141, 2, 141, NULL, NULL),
(142, 1, 142, NULL, NULL),
(143, 2, 143, NULL, NULL),
(144, 14, 144, NULL, NULL),
(145, 8, 145, NULL, NULL),
(146, 20, 146, NULL, NULL),
(147, 16, 147, NULL, NULL),
(148, 20, 148, NULL, NULL),
(149, 19, 149, NULL, NULL),
(150, 19, 150, NULL, NULL),
(151, 14, 151, NULL, NULL),
(152, 5, 152, NULL, NULL),
(153, 11, 153, NULL, NULL),
(154, 1, 154, NULL, NULL),
(155, 16, 155, NULL, NULL),
(156, 16, 156, NULL, NULL),
(157, 2, 157, NULL, NULL),
(158, 8, 158, NULL, NULL),
(159, 17, 159, NULL, NULL),
(160, 5, 160, NULL, NULL),
(161, 7, 161, NULL, NULL),
(162, 5, 162, NULL, NULL),
(163, 11, 163, NULL, NULL),
(164, 10, 164, NULL, NULL),
(165, 12, 165, NULL, NULL),
(166, 18, 166, NULL, NULL),
(167, 2, 167, NULL, NULL),
(168, 2, 168, NULL, NULL),
(169, 12, 169, NULL, NULL),
(170, 6, 170, NULL, NULL),
(171, 17, 171, NULL, NULL),
(172, 6, 172, NULL, NULL),
(173, 17, 173, NULL, NULL),
(174, 4, 174, NULL, NULL),
(175, 7, 175, NULL, NULL),
(176, 13, 176, NULL, NULL),
(177, 15, 177, NULL, NULL),
(178, 13, 178, NULL, NULL),
(179, 15, 179, NULL, NULL),
(180, 16, 180, NULL, NULL),
(181, 11, 181, NULL, NULL),
(182, 20, 182, NULL, NULL),
(183, 17, 183, NULL, NULL),
(184, 13, 184, NULL, NULL),
(185, 4, 185, NULL, NULL),
(186, 7, 186, NULL, NULL),
(187, 5, 187, NULL, NULL),
(188, 1, 188, NULL, NULL),
(189, 3, 189, NULL, NULL),
(190, 2, 190, NULL, NULL),
(191, 1, 191, NULL, NULL),
(192, 15, 192, NULL, NULL),
(193, 12, 193, NULL, NULL),
(194, 8, 194, NULL, NULL),
(195, 2, 195, NULL, NULL),
(196, 11, 196, NULL, NULL),
(197, 11, 197, NULL, NULL),
(198, 16, 198, NULL, NULL),
(201, 21, 201, NULL, NULL),
(202, 22, 202, NULL, NULL),
(203, 33, 203, NULL, NULL),
(204, 34, 204, NULL, NULL),
(205, 32, 205, NULL, NULL),
(206, 31, 206, NULL, NULL),
(207, 30, 207, NULL, NULL),
(208, 29, 208, NULL, NULL),
(209, 28, 208, NULL, NULL),
(210, 28, 209, NULL, NULL),
(211, 29, 209, NULL, NULL),
(213, 27, 211, NULL, NULL),
(214, 27, 212, NULL, NULL),
(215, 26, 213, NULL, NULL),
(216, 24, 214, NULL, NULL),
(217, 25, 214, NULL, NULL),
(218, 23, 215, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Книги по программированию', 'Большой набор книг, посвященных программированию, помогут научиться сложной профессии.', NULL, NULL),
(2, 'Комиксы', 'Увлекательные истории, которые помогут ненадолго отвлечься от тяжелой работы.', NULL, NULL),
(3, 'Комиксы по программированию', 'Дают возможность изучать новое в увлекательной форме.', NULL, NULL),
(4, 'Книги комиксов', 'А, может, ну его, это программирование!', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `covers`
--

CREATE TABLE `covers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `covers`
--

INSERT INTO `covers` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Твердая', NULL, NULL),
(2, 'Мягкая', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(153, '2014_10_12_000000_create_users_table', 1),
(154, '2014_10_12_100000_create_password_resets_table', 1),
(155, '2019_08_19_000000_create_failed_jobs_table', 1),
(156, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(157, '2021_06_10_161440_create_categories_table', 1),
(158, '2021_06_17_151343_create_orders_table', 1),
(159, '2021_06_20_074809_create_subcategories_table', 1),
(160, '2021_06_20_081243_create_authors_table', 1),
(161, '2021_06_20_083539_create_products_table', 1),
(162, '2021_06_20_083932_create_orders_products_table', 1),
(163, '2021_06_20_084143_create_authors_products_table', 1),
(164, '2021_06_23_070625_alter_users_table', 1),
(165, '2021_06_27_064058_create_tags_table', 1),
(166, '2021_06_27_065124_create_tags_products_table', 1),
(167, '2021_07_14_174016_create_cache_table', 1),
(168, '2021_08_10_075922_create_product_reviews_table', 1),
(169, '2021_08_20_105853_create_covers_table', 1),
(170, '2021_08_24_070339_create_ratings_table', 1),
(171, '2021_08_24_194022_alter_products_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2021-11-08 17:05:48', '2021-11-08 17:05:53');

-- --------------------------------------------------------

--
-- Структура таблицы `orders_products`
--

CREATE TABLE `orders_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `orders_products`
--

INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 212, 1, 777.00, '2021-11-08 17:05:48', '2021-11-08 17:05:53');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` double(8,2) NOT NULL,
  `description` text NOT NULL,
  `subcategory_slug` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `pictures` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`pictures`)),
  `year` smallint(5) UNSIGNED NOT NULL,
  `pages` smallint(5) UNSIGNED NOT NULL,
  `cover_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `description`, `subcategory_slug`, `picture`, `pictures`, `year`, `pages`, `cover_id`, `created_at`, `updated_at`) VALUES
(1, 'Dolores perspiciatis sit sit quia ipsa id.', 1227.00, 'Et tenetur expedita rem ut pariatur. Quia necessitatibus minus omnis sapiente autem ipsum quisquam. Quis molestiae quia nostrum hic in. Quas velit quae porro nihil sit. Dolor nulla maiores alias eaque id aut. Repudiandae et aliquam provident eos quod vero. Veritatis ut placeat perspiciatis ut ea eligendi pariatur reprehenderit. Architecto ut minima accusantium aut voluptatem rem vel dignissimos. Qui quibusdam ea eaque magni. Ex velit quaerat cumque eum aut quos laudantium.', 'europe', '', '[]', 2006, 160, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(2, 'Ipsam odit.', 1336.00, 'Modi cum dicta blanditiis et eos iusto. Et saepe debitis molestias quis dignissimos autem. Voluptatem perferendis voluptas error aut laborum. Ut cum quia et quibusdam quidem possimus quo. Debitis officia saepe maxime quidem. Inventore occaecati ut nihil illo qui atque necessitatibus maxime. Fugit similique modi et non. Omnis voluptas et omnis. Dolor dolor quod quas pariatur ex. Rerum ut minus saepe ratione natus quibusdam aut. Provident qui fuga eveniet dolorem ipsum est nemo. Qui praesentium id ut incidunt et praesentium nesciunt.', 'marvel', '', '[]', 2011, 313, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(3, 'Placeat eius quibusdam ab vel.', 514.00, 'Dolorem nisi tempora qui accusamus. Aperiam sed odio eos dolorum incidunt. Voluptatem at incidunt rerum eos. Quia aperiam beatae voluptatem rerum. Nihil aut nam aliquam et itaque voluptate. Dolorem id dolor accusamus enim aut qui. Odio natus rerum voluptatem a. Dicta in sed quis id harum quasi. Corporis ad distinctio dignissimos id aliquam soluta. Similique quae sed voluptatem mollitia est harum laudantium. Iure omnis maxime blanditiis dolorum molestiae quod. Illo perferendis accusamus aut. Cum et non quos repellat debitis. Quaerat incidunt nulla dolor odio.', 'europe', '', '[]', 2008, 435, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(4, 'Voluptatem voluptas aliquid qui.', 1242.00, 'Fuga excepturi quidem eum repudiandae ut. Occaecati consequuntur quo ut nisi vero et qui. Eos ut eaque unde iste neque. Et quasi repellat dolorem. Delectus numquam consectetur deserunt minima. Nobis reiciendis sit ut facilis est aut repellendus nostrum. Suscipit vitae perspiciatis ullam ut magnam non. Debitis adipisci eligendi eligendi occaecati. Sed reprehenderit voluptas est vel. In modi est ipsa ab consectetur et dolores. Exercitationem ut vel quisquam. Nostrum dicta alias laborum nostrum ut. Et a consequatur aut voluptatem.', 'architecture', '', '[]', 2014, 438, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(5, 'Eveniet quasi dolorem rerum eos.', 1152.00, 'At illo cupiditate voluptatem omnis repudiandae. Sequi doloremque accusantium qui error. Aut ratione minima voluptatem sint ullam laborum. Non cupiditate adipisci reprehenderit expedita. Repudiandae eum voluptatibus optio quo velit. Nihil mollitia nam fugiat voluptatem in. Amet quis enim eius sint laborum odit aliquid. Odit magnam sint veritatis explicabo. Quasi et amet hic ipsam quis consectetur. Velit facilis veritatis commodi nobis saepe optio doloribus. Atque modi aut ipsa minima aliquid suscipit.', 'dccomics', '', '[]', 2011, 500, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(6, 'Temporibus earum facere quo quia veritatis.', 1438.00, 'Commodi quos occaecati accusamus quia. Maiores dolores eaque accusantium velit natus quo expedita iste. Eveniet alias vitae quae consequatur aut vel temporibus. Accusamus est vitae tempore quia ut quisquam. Pariatur libero exercitationem vitae. Blanditiis magnam exercitationem quisquam itaque et enim illum. Praesentium aspernatur repellendus enim quisquam et aliquam. Voluptatem error magnam iure praesentium impedit. Qui quia cumque quas repudiandae ab sunt eos aut.', 'dlyadetei', '', '[]', 2017, 259, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(7, 'Enim sit commodi nihil.', 559.00, 'Mollitia nobis quia voluptatem. Explicabo recusandae quae voluptatum. Nihil qui accusantium quia voluptatem. Porro asperiores at iusto. Blanditiis voluptas totam a explicabo recusandae nam. Rerum rerum ea et quaerat rerum nesciunt dolorem. Impedit earum dolorem consectetur et. Facere beatae minus enim doloribus voluptatem ut voluptatum. Qui voluptatem aperiam eos odit sequi omnis. Eligendi nisi voluptatem totam dolor harum mollitia.', 'web', '', '[]', 2009, 394, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(8, 'Odio non ut dolore.', 1164.00, 'Autem quia hic vel aut eveniet. Id ut est qui est ipsam. Cupiditate aliquid doloribus cupiditate rerum perferendis sapiente. Sit eum beatae quos odit non voluptatem delectus. Quia rem ut laudantium aut eos velit. Sapiente est ea ut eos qui. Esse assumenda eligendi nemo. Officiis ab a et occaecati voluptatum nobis autem laborum. Reprehenderit quos qui est dolorum at quia nulla. Perferendis totam facere laudantium recusandae sunt dignissimos sit. Officiis quam ex minus at aperiam.', 'architecture', '', '[]', 2006, 259, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(9, 'Blanditiis odit libero modi ducimus.', 1737.00, 'Est aperiam maxime quod tempore. Consequuntur quia fugiat aut voluptas possimus. Dolores odit pariatur voluptatem voluptatem. Officiis atque deleniti porro. Ad porro non cum nam autem quis explicabo optio. Eius voluptatem repellat voluptatibus rerum consequatur. Voluptatibus illum vero voluptatem ut. Consequatur excepturi eveniet autem iure beatae et ab porro. Atque iste quaerat et in soluta a. Dignissimos iusto asperiores porro illo quod. Fuga ea est ut fuga maiores quam.', 'web', '', '[]', 2010, 373, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(10, 'Est dicta enim cupiditate.', 1833.00, 'Impedit nesciunt sit voluptatem ex omnis ipsam. Placeat quaerat et quod praesentium adipisci voluptatem eveniet qui. Ad eaque reprehenderit molestiae tempora dolor omnis itaque. Explicabo corrupti et dolorum voluptas tempora. Quod ut dolores aut odit voluptatem. Dolorem est eveniet at velit libero. Ut occaecati odio cupiditate ducimus aut quibusdam error consequuntur. Fuga nihil provident et pariatur libero itaque sed qui. Laborum est qui ab aut. Aut voluptatibus consequuntur in vel beatae. Deserunt dignissimos dignissimos corporis vitae eos consequuntur in fuga.', 'architecture', '', '[]', 1990, 212, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(11, 'Consectetur explicabo sequi et.', 504.00, 'Minima nemo veniam praesentium omnis. Sed totam consectetur hic quis voluptatibus. Porro impedit nulla velit rerum natus. Ea soluta cumque et ut praesentium exercitationem hic provident. Nisi voluptatum architecto adipisci est. Consequatur aliquam sunt suscipit id necessitatibus dolore. Rerum necessitatibus dicta porro accusantium quisquam quisquam rerum. Nisi possimus commodi iure eveniet rem iure. Quam ut saepe eum est. Sed quis in quaerat. Doloremque deleniti tempore maxime eos fuga. Commodi quo tenetur a.', 'dlyadetei', '', '[]', 2007, 281, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(12, 'Nam quas illo dolore dicta omnis.', 1092.00, 'Doloribus quod nostrum sit delectus dolorem. Quisquam animi rerum sapiente quas. Et excepturi aut corrupti hic blanditiis. Minima laudantium quia aut labore. Cumque aut quaerat eius at quia ea est. Voluptas ducimus dolorem culpa maxime. Deleniti enim quaerat ab et. Eaque nesciunt atque officia sunt voluptatibus animi. Nam omnis at aliquid. Ex voluptatem dolorem vitae nihil sit consequuntur dolores. Aut aut porro fugiat soluta tenetur laudantium nobis.', 'marvel', '', '[]', 2018, 471, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(13, 'Sed enim porro.', 561.00, 'Ea rerum voluptatem eos nesciunt illum aut repellat. Ut deserunt mollitia et molestias voluptates. Reprehenderit vitae quos qui dicta quas. Vitae tempore harum dolore aliquid. Eos nemo omnis laboriosam ut provident accusantium dignissimos. Consequatur praesentium provident est dolores. Officia vitae aperiam quam aut accusamus reiciendis necessitatibus consequatur. Architecto perspiciatis sint recusandae in dolorum quis. Inventore ipsum explicabo reprehenderit consequatur. Dicta sit ea et sit voluptatem odit nostrum. Perspiciatis autem delectus asperiores non.', 'manga', '', '[]', 2006, 318, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(14, 'Doloribus voluptas qui voluptatem culpa amet.', 1518.00, 'Non rerum dolore tenetur odio eveniet officiis tempore. Ad est autem necessitatibus ipsam. Officiis aut repellendus cupiditate doloremque corrupti. Ullam earum quasi natus deleniti sint maiores tempora nihil. Rerum alias quasi amet id. Quasi commodi doloribus velit odit. Et qui qui nulla dolorum. Consequatur rerum accusamus cum quia dicta. Quas dolorem nihil minima ipsa quia neque eum animi. Explicabo quasi dolorum sit dolores voluptatem. Sed quam soluta unde similique ut aut. Rerum et officia magni aspernatur cupiditate reiciendis consequatur.', 'web', '', '[]', 2009, 308, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(15, 'Tenetur a corrupti molestiae et.', 1722.00, 'Aspernatur vel perferendis quam quas. Dicta officia aut magnam dolor. Placeat culpa enim fuga eum. Architecto ea ut sunt libero cumque amet. Dicta est odit nisi voluptatem exercitationem doloremque suscipit. Sint est dolor autem aut. Tenetur porro at aliquid maxime voluptatem qui nisi et. Officiis ullam ex nesciunt quo repellendus. Aspernatur similique quasi optio quae. Rem quos est quia in qui vitae voluptas aut. Error unde ex voluptatibus qui quis quas quo. Quasi architecto quas et in vel beatae sint. At sed quia modi omnis veritatis nostrum qui. Non aut dolorem tenetur.', 'europe', '', '[]', 1991, 493, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(16, 'Aut sed dolore omnis aut molestias.', 1066.00, 'Et mollitia iure rem dolor dolorem dolor. Aut dignissimos possimus nesciunt iusto. Omnis laudantium nobis dolorem. Tempore ipsa eos tempora sed autem. Nihil tempore neque nisi. Deleniti provident minima molestias quisquam cupiditate consequuntur necessitatibus. Est tenetur aut assumenda dolores incidunt vitae. Eius perspiciatis id asperiores aut repudiandae veniam. Cumque in et consequatur magni quibusdam. Quas et et dolorem hic soluta non dignissimos. Ratione alias voluptatem et. Quibusdam minima et optio nisi exercitationem distinctio est aperiam.', 'manga', '', '[]', 1998, 352, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(17, 'Est eos odio minus placeat similique.', 1879.00, 'Corrupti in itaque minus non eos tenetur eligendi ea. Voluptates voluptatibus molestias iure praesentium voluptas nam ullam. Neque doloremque aperiam aut autem commodi rerum corporis. Qui dolores explicabo dignissimos corrupti voluptates occaecati quia natus. Quia aspernatur quae adipisci asperiores necessitatibus eveniet. Qui dolor culpa accusantium quae. Aut tempora quia sapiente voluptatem dolor. Accusamus mollitia voluptates natus voluptatibus voluptas expedita alias.', 'manga', '', '[]', 2005, 176, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(18, 'Quia dolorem.', 976.00, 'Et maiores ullam officiis veritatis magni. Voluptates et est ut sed dolores. Eveniet praesentium eum eligendi fuga. Maiores fugit eius aut eum. Et et iste nemo rerum. Laudantium doloremque illum aut et. Perferendis nemo eos tempora nisi. Necessitatibus nihil omnis aspernatur hic temporibus beatae delectus. Neque deleniti vitae esse earum qui maiores. Aut rerum dolorem et perferendis adipisci aut qui. Voluptas et magni blanditiis nihil. Asperiores quos quia omnis.', 'architecture', '', '[]', 2009, 545, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(19, 'Quae ut quis.', 1515.00, 'Consequatur est eos natus optio. Reiciendis aspernatur sint sint accusamus. Est unde illum modi autem. Odio ad dolores rem et nobis est. Consequatur dolorem quisquam voluptas explicabo. Et dicta tempora officia aliquam officiis sunt fugiat. Ea velit sint impedit rem. Non mollitia reiciendis nemo asperiores. Asperiores numquam omnis nobis. Consectetur dolor vel sit est molestiae nulla. Consequatur exercitationem cum consequatur eos nulla sint minima.', 'manga', '', '[]', 1997, 179, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(20, 'Et est sed aperiam voluptas.', 794.00, 'Delectus provident velit velit eius. Magni et cupiditate et et minima numquam sint vel. Quis harum velit ut quisquam voluptates reprehenderit possimus. Rerum qui natus corrupti error. Unde quis ad dolor perspiciatis alias expedita minus ut. Consectetur molestiae aperiam quaerat eum consequatur et mollitia. Quia ex et quia earum. Porro nulla vel aliquam quam tempora. Aperiam harum modi saepe adipisci explicabo non est. Et voluptatem doloremque est error ut est qui. Libero non ut eos blanditiis. Atque voluptatum libero quia officia.', 'dccomics', '', '[]', 2000, 317, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(21, 'Cumque.', 1623.00, 'Facere provident nesciunt perspiciatis molestias accusantium et quia. Inventore et ea non quaerat in. Aut nobis repellendus quod velit quia ad. Debitis vel sunt accusantium minima ut et et. Consectetur corporis hic qui reiciendis. Eum libero occaecati expedita reiciendis. Modi sed atque repellat sit deleniti sed omnis. Praesentium assumenda soluta explicabo at illum officia omnis. Et qui repellendus aut voluptatem quia repudiandae explicabo. Quia dicta omnis veniam. Quis voluptatem sit perferendis quis quasi iste cumque maxime. Omnis maxime quo praesentium quisquam optio ab consectetur.', 'europe', '', '[]', 2012, 399, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(22, 'Aut atque.', 1316.00, 'Rerum minus quis tempore animi harum molestiae. Nulla rem et facilis. Autem laboriosam perspiciatis aut quibusdam consequuntur quos. Sapiente laborum similique fuga quia et optio ut. Esse quis architecto in rerum. Quo quisquam ullam ut culpa odio dolor a. At facilis occaecati sit dolores dolores quidem dolorem veniam. Dolorum dolor impedit non. Fugiat eligendi adipisci nesciunt molestiae impedit harum neque. Cum assumenda saepe nemo similique repellendus.', 'architecture', '', '[]', 1995, 277, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(23, 'Sequi magnam libero ut blanditiis.', 1731.00, 'Maiores tempore consequatur magnam autem iste quo accusantium. Enim molestiae repellendus quia amet natus ut. Omnis qui temporibus est excepturi expedita. Itaque ipsa at et aut. Excepturi aliquam voluptas ut. Occaecati quod laboriosam nobis blanditiis. Necessitatibus ullam laborum alias quo fuga repellendus sed. Alias est reprehenderit consequatur ea et. Excepturi cum magni expedita voluptas quibusdam animi ex. A dolore soluta repudiandae voluptatibus sit accusamus atque. Mollitia at et sunt quia quaerat aspernatur velit.', 'dccomics', '', '[]', 2002, 376, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(24, 'Vitae mollitia quia voluptatem qui dicta quia.', 509.00, 'Amet dolorum aliquam blanditiis aperiam esse ullam. Debitis eligendi ullam doloribus et. Numquam iure vero et ad eius est earum. Et eveniet et ratione excepturi iste sit. Voluptatibus qui impedit sed nostrum dolorem nostrum. Cumque eveniet qui maxime iste. Iusto et quidem quo accusamus praesentium minima dolorum nihil. Fugit autem qui quod. Similique sapiente cum sapiente. Libero doloremque qui veniam et. Odio sit voluptas itaque possimus quas. Voluptatibus nulla voluptatem rerum. Est sed cupiditate quia earum accusamus.', 'web', '', '[]', 2019, 359, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(25, 'Aut enim.', 681.00, 'Quos nobis facere cum in labore et. Dolore provident odit et occaecati consequatur. Est fuga eum non praesentium qui. Voluptas sed facere ducimus nobis odit. Sed aut ut et corporis eum id. Error nihil pariatur dolorem velit. Necessitatibus neque debitis quia voluptas sunt. Quas animi veritatis ut fugiat. Et iusto aut assumenda et. Impedit alias omnis sunt repudiandae neque est molestias consequuntur. Ratione ut ea animi ipsa non magnam quis. Nisi nisi distinctio non libero a minus dolores. Est dolorem voluptate consectetur repudiandae ullam earum.', 'dlyadetei', '', '[]', 2007, 418, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(26, 'Exercitationem qui excepturi et.', 1908.00, 'Id officiis eaque animi rerum amet. Numquam enim et ad et illum enim. Consequuntur autem eius modi nisi. Molestiae illum et rerum non et. Placeat ipsum reiciendis cum sed officiis. Esse hic dolor odio vel. Ipsa consequatur corrupti ea non et quo veritatis. Sed provident doloremque aut nesciunt perspiciatis. Quam omnis et nobis nulla qui debitis. Temporibus illum quia laboriosam quae. Culpa laudantium atque itaque incidunt temporibus inventore. Perferendis corporis quia labore dicta impedit.', 'web', '', '[]', 1990, 291, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(27, 'Est recusandae.', 1292.00, 'Error accusantium voluptatem inventore id vel. Sed distinctio aliquid velit officia exercitationem enim. Dolores quibusdam omnis omnis corporis. Qui tempore impedit ducimus. Ducimus assumenda deleniti soluta voluptas odio consequatur aspernatur. Corrupti dolor enim sunt non voluptates et deserunt. Illo alias minus et eius quaerat. Blanditiis qui et sed sunt molestiae non reiciendis. Ullam deleniti ut repellendus suscipit. Praesentium et voluptatibus ut quas beatae et. Labore at nostrum eveniet libero. Cumque nam pariatur aliquam.', 'architecture', '', '[]', 2020, 496, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(28, 'Rerum.', 1960.00, 'Odit et quos iste. Et molestiae officia distinctio quaerat ut. Ipsum delectus quod ut qui cum ex. Asperiores beatae voluptatibus sit ab facere dolorem quo quia. Minima praesentium ut in vitae. Et asperiores cum totam explicabo soluta excepturi vel. Quia ea consequatur reprehenderit distinctio. Aliquid odit consequatur sit amet. Est sed iure maiores quia quaerat. Et eum vel omnis eaque sed nihil. Dicta autem eius possimus perferendis maxime consequatur. Perspiciatis dolorum dolorem enim et quas ipsam. Provident nihil est animi sit aut.', 'marvel', '', '[]', 2012, 333, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(29, 'Eum vero consequatur beatae in doloremque est.', 1847.00, 'Dolorum eaque dolore ratione cumque dignissimos. Ut nisi odit commodi ea quaerat blanditiis consequatur facilis. Sunt sequi voluptas commodi ut porro molestias. Et qui veniam porro. Voluptate quis alias ab aliquid error fugit. Expedita id magnam et repellat placeat error et voluptas. Qui atque fuga fugit dolor. Tenetur eos possimus odit delectus. Vitae quas in dolore fuga vitae occaecati eligendi. Necessitatibus quae at quasi neque inventore sunt exercitationem. Iste eveniet ut voluptas eius qui beatae.', 'marvel', '', '[]', 1994, 179, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(30, 'Quis quo inventore.', 770.00, 'Incidunt maxime repudiandae illo provident neque. Ab consequatur optio explicabo fuga perferendis. Sit et consequatur qui explicabo. Iste ipsam et suscipit optio maiores. Et nesciunt corrupti architecto delectus perferendis. Corporis soluta odio impedit amet qui omnis blanditiis. Ut doloremque ad quisquam enim et numquam error libero. Quis rerum vel aut veniam. Exercitationem labore porro dolor. Dolores explicabo accusantium illum aliquid qui. Quia dolorum dolorum provident omnis inventore. Est fugiat ipsum minima repudiandae cumque modi.', 'europe', '', '[]', 1996, 411, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(31, 'Saepe quae.', 623.00, 'Quisquam delectus inventore qui. Dolorum minima porro mollitia ea assumenda id laboriosam. Ullam mollitia provident possimus et voluptatem voluptas. Ut deserunt qui non aliquid ut dolore fuga. Repudiandae aut optio odio qui pariatur et. Vero dolor fugit nostrum in quaerat explicabo quam. Provident sed quibusdam quam sed. Aperiam voluptas iusto itaque veniam. Et expedita maxime rerum dolorem quo. Qui nam et sapiente amet nulla incidunt sed.', 'web', '', '[]', 2003, 542, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(32, 'Illo aperiam.', 819.00, 'Quos dolor accusantium voluptas necessitatibus maxime necessitatibus sint. Quia dolores eius tempore non nam. Ut accusamus iste non quisquam nisi tenetur qui culpa. Velit consequuntur vitae tenetur qui dolorem voluptatem voluptatum. Nisi labore eaque magni enim harum ea sunt. Quod molestiae quis est qui doloribus et. Possimus velit illo voluptatem voluptatem qui. Illum repellendus et non commodi excepturi. Deserunt corrupti voluptates non a aut. Consectetur et est sit dolore magnam blanditiis. Quia quaerat officiis et distinctio iure. Unde quod mollitia officiis sed adipisci et quis.', 'manga', '', '[]', 2018, 397, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(33, 'Voluptas omnis distinctio nemo.', 710.00, 'Sint iste nostrum nesciunt provident ratione ullam voluptatibus doloremque. Doloremque voluptas iure dolorem a qui. Dolorum facere dolorem voluptas dolorem qui omnis sunt voluptas. Dicta autem minus facilis et harum aliquid inventore quo. Velit incidunt sed voluptas ad exercitationem voluptatibus. Consequuntur similique dolore molestias hic. Repudiandae dignissimos voluptate quam est earum blanditiis deserunt.', 'europe', '', '[]', 2000, 401, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(34, 'Tempora.', 880.00, 'Et quo perferendis qui aut laboriosam. Dolores exercitationem libero officia. Quibusdam molestiae harum iusto voluptas aspernatur dolorum. Et distinctio est sapiente hic pariatur dolorum rerum. Quis illo in ex nemo. Magni vero molestiae ipsum quis et sit. Autem culpa earum tempore molestias et reiciendis cumque. Nam labore incidunt animi consequuntur nulla fugiat. Ut quis rerum perferendis aut voluptate optio. Quidem et odit at ut nisi. Adipisci at laudantium nemo iusto aliquam.', 'architecture', '', '[]', 2002, 377, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(35, 'Eos.', 1244.00, 'Laudantium culpa voluptatibus quis quibusdam cum. Culpa voluptatem nisi quo sunt velit. Eaque est doloremque aut et ipsam aut ipsa ut. Quo omnis illum a non accusantium blanditiis esse. A voluptatibus veritatis unde sunt totam veniam amet doloremque. Ducimus possimus quidem explicabo dolor facilis asperiores. Distinctio architecto vitae et. Voluptatibus et qui at omnis illum aut nemo. Sunt velit minima quasi voluptatem ut eligendi maxime. Soluta maiores quam ducimus eos natus enim. Ex repellendus sunt enim nisi.', 'web', '', '[]', 1993, 394, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(36, 'Quasi nesciunt id ut et omnis.', 1598.00, 'Repellat aut molestiae ex dolore vero. Aspernatur placeat magnam rerum iure ipsum est et ut. Incidunt non velit molestiae consequatur et enim id. Unde distinctio excepturi sed neque vero tempora eum et. Reprehenderit magnam quo et et. Voluptatem quibusdam vero maiores similique autem. Eveniet eveniet nemo rerum perspiciatis molestiae quasi. Similique harum repellendus sint eveniet perspiciatis a in. Vitae et incidunt eius consequatur maiores qui non. In temporibus quasi eum quaerat error non. Sint esse aperiam saepe omnis et modi debitis.', 'marvel', '', '[]', 2007, 450, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(37, 'Et cupiditate.', 558.00, 'Natus cupiditate et eum quis aperiam sint et. Voluptatem optio ducimus velit laboriosam est nostrum. Laborum ut rerum qui id distinctio possimus explicabo ex. Quo perspiciatis quo quod est deleniti eligendi. At sed dignissimos et voluptatibus quis ad. Deleniti dolores et alias. Similique dolor totam sapiente veritatis. Sit ut qui sed odio. Eius itaque illo qui aut tenetur ut libero. Libero fugiat sunt nesciunt ad. Totam ducimus voluptate et officia itaque ut. Possimus reiciendis ut expedita distinctio non est.', 'marvel', '', '[]', 2011, 375, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(38, 'Occaecati et autem ut.', 1013.00, 'Quam non magnam molestiae similique. Velit aut magnam vel eius ut omnis veniam eum. Animi architecto nesciunt molestiae vero commodi. Aliquam dolores quasi illum sit. Et quam minima sed eaque illo numquam ea. Perspiciatis corrupti dolore tenetur voluptatem. Dolores molestiae ut qui facilis quo voluptatem modi. Modi et explicabo eligendi aut eaque repudiandae. Magnam aliquid veritatis nisi harum ea accusantium autem et. Nam ipsam sit illum iste dolor aut voluptate fugit. Facilis aut rerum corporis. Temporibus culpa et quod fugiat enim.', 'architecture', '', '[]', 2007, 165, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(39, 'Soluta soluta.', 725.00, 'Molestiae sapiente velit optio ipsam. Sit sit non consequatur beatae modi. Ipsa nobis quisquam beatae numquam est quos. Eos beatae omnis nemo saepe consectetur. Quis quidem et exercitationem dolorem illo esse autem. Et iste in explicabo fuga. Ea dicta id saepe. A quod et similique officiis nostrum sit consequatur. Id tempore illo veritatis magnam et. Aut nesciunt cupiditate autem vel quasi quidem accusantium repellendus. A consequuntur eos libero in.', 'europe', '', '[]', 1995, 188, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(40, 'Consequuntur omnis molestias.', 1070.00, 'Quisquam consequuntur eum qui nam nihil. Libero dolor voluptatem natus nesciunt. Eos qui rerum odit voluptatem praesentium aut aspernatur. Qui sit eos veniam autem molestias sunt. Consequuntur ut nostrum dolor tempora omnis ratione. Incidunt tempore laudantium sed ratione aut corporis sit. Nulla aut quibusdam ipsum eveniet inventore ea. Cum aut aspernatur est rem et eos vitae. Nostrum cum quis qui. Minima et nihil qui corrupti dolores excepturi et. Id mollitia ut qui mollitia. Dicta repellendus ut reprehenderit. Deserunt excepturi occaecati nihil optio saepe hic.', 'dccomics', '', '[]', 2019, 284, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(41, 'Rerum qui.', 1263.00, 'Aliquid quia quia et vel in perspiciatis. Quam quaerat porro labore laboriosam nihil et est. Deserunt debitis temporibus ut et dolorem. Ullam commodi officiis dolore et velit asperiores. Omnis explicabo exercitationem sed optio itaque nisi. Expedita in voluptas nihil nobis. Sed est labore est placeat. Quis quidem aut qui. Vel quis modi esse ex sunt non. Laudantium doloremque libero rerum odit reprehenderit repellendus repellat. Deleniti id nostrum facere eius debitis cum voluptatem.', 'dlyadetei', '', '[]', 1996, 273, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(42, 'Aliquam aut iusto.', 1764.00, 'Illum est recusandae ipsam suscipit error magnam dolorum est. Aut corporis asperiores libero et repudiandae aut nemo maiores. Illum ex quia omnis optio sed. Velit beatae suscipit est qui et. Aut sapiente ut ut voluptas minus. Pariatur provident voluptate ut placeat sapiente eum. Nemo quia mollitia ut et est quo. Aperiam et animi labore quos ex. Ut iste voluptates perspiciatis facere quidem. Sint voluptate optio at sequi ratione doloribus in voluptas. Consequuntur adipisci placeat natus quidem.', 'web', '', '[]', 1999, 433, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(43, 'Alias id voluptatem optio quo earum.', 871.00, 'Dolorem enim quibusdam laborum repudiandae at ea iure. Iure quis dolorem quos temporibus voluptate. Vitae necessitatibus aliquam et alias. Quasi fuga ut reiciendis qui voluptatem ratione. Cupiditate id ut nisi quod. Sit itaque aut adipisci dolorum. Sint veritatis ut est quam tenetur magni officiis. Earum error veniam rerum cupiditate asperiores ut. Quae illo voluptate repellat vel. Dignissimos ipsum libero minus quo cupiditate est. Neque culpa ipsa necessitatibus. Sed quis aut vel sit dolorem quaerat. Omnis vel eligendi dolore qui ut placeat sit qui.', 'dlyadetei', '', '[]', 1994, 216, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(44, 'Ut quos non labore sit rerum qui.', 1801.00, 'Consequatur enim accusamus vel voluptate. Delectus minus numquam adipisci consequatur vero voluptas. Dicta expedita nesciunt sequi rerum omnis iste. Vel corporis numquam necessitatibus nulla voluptas et nihil exercitationem. Cum nihil nihil dignissimos autem possimus. Praesentium nulla dolorum molestias asperiores et. Rerum qui adipisci et dolorem odio et rerum. Aspernatur ipsum dicta ut qui quas qui. Fugit id et sequi est alias nulla. Cumque sed voluptates consequatur eum. Recusandae alias dolor dolor adipisci voluptas voluptatem et ut. Maxime aperiam quibusdam qui illum.', 'marvel', '', '[]', 2020, 391, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(45, 'Temporibus ut vel illum facere necessitatibus.', 1355.00, 'Et illum deserunt quam enim quod non. Deserunt ex quia et aspernatur aut consequatur. Veritatis iusto id adipisci et sint facilis. Culpa adipisci repellat qui quos et facilis soluta. Eligendi enim quo laborum repudiandae. Et sed dolores voluptas deleniti velit ipsum in esse. Et necessitatibus necessitatibus officiis odio consequuntur ad quasi. Et praesentium ut est asperiores sequi. Eius aut nobis sit delectus ab consequatur eaque. Labore sed aut voluptatem tenetur dolores dicta. Quam est porro dolor.', 'web', '', '[]', 2013, 249, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(46, 'Dolores ad accusamus expedita sit.', 724.00, 'Exercitationem quia mollitia ex praesentium. Nisi in vitae iste non et et. Fugiat quia minima voluptatum enim sit praesentium error. Voluptatem perferendis dolor occaecati molestiae minima. Architecto vero similique dolore esse dolorem voluptatem magnam. Libero accusantium voluptatem distinctio quod. Dicta quos ut eum architecto ipsam magni est. Nihil quae error illum nisi. Sit velit excepturi tempora voluptas praesentium autem alias. Qui qui explicabo sit atque. Sequi quia et accusantium quia harum quod possimus. Voluptatem deleniti rerum saepe nisi. Non delectus ut dolorum.', 'europe', '', '[]', 2013, 525, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(47, 'Vel velit in.', 1377.00, 'Corrupti et excepturi similique accusamus nihil architecto odio. Quo expedita accusantium aspernatur. Magni at earum corporis. Et ut nobis quaerat sequi aliquid doloremque enim. Voluptas aliquid voluptas earum. Cumque quasi reiciendis praesentium reiciendis numquam repellendus asperiores. Quia est consequatur culpa cupiditate earum quia. Numquam et aut molestiae exercitationem itaque. Commodi veniam eaque eligendi dolores. Dolorum voluptas ducimus qui voluptates repellat. Ducimus debitis tenetur rem in ut quisquam. Ab sed repudiandae dolore quis aut dolorem.', 'manga', '', '[]', 2004, 391, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(48, 'Deserunt quo consectetur ipsam eveniet sequi.', 1961.00, 'Amet ea magnam sequi laboriosam esse aspernatur a. Numquam pariatur magni omnis aperiam. Cum ducimus facilis enim voluptatem quasi praesentium. Adipisci esse ut vel delectus velit dolores. Quia est voluptatem adipisci possimus quia. Voluptate reiciendis voluptates suscipit iusto nobis. Saepe magni omnis sunt et a dignissimos et. Voluptates impedit consequatur perspiciatis ea aliquid dolor iusto. Totam sit ut aut modi. Pariatur fuga qui consectetur doloremque temporibus consequuntur placeat.', 'marvel', '', '[]', 1996, 217, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(49, 'Aut ad at soluta.', 1261.00, 'Quo aut excepturi dolorum non perspiciatis sint. Cupiditate ad suscipit neque eum. Qui id rerum ea voluptas temporibus. Exercitationem adipisci hic nemo mollitia qui. Eveniet minima ullam voluptate consequuntur nobis dolor incidunt reiciendis. Exercitationem quisquam quae perspiciatis porro labore. Inventore illum necessitatibus iusto ad doloremque ex. Et rerum ut earum consequatur molestiae assumenda. Nesciunt unde voluptates voluptatem illum velit architecto. Eos veniam et neque veniam dolores ea. Et omnis velit dolorem est commodi aut. Veritatis a impedit atque libero explicabo a a.', 'web', '', '[]', 2008, 288, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(50, 'Nesciunt aut pariatur dolorem nihil rerum ex.', 1887.00, 'Quis rerum rerum aliquid et magnam non ea. Aut laborum molestias delectus pariatur aperiam qui. Voluptatem quisquam qui ex veritatis. Autem ea quia quisquam repudiandae aut ut. Accusamus aliquid aspernatur veniam incidunt sapiente error architecto commodi. Ut iusto accusantium consequatur consequatur sequi nihil. Et excepturi alias quasi autem. Quod ipsam consequatur inventore omnis amet. Ex voluptatem velit ipsum reprehenderit rerum autem. Et expedita voluptates et et laudantium illum aspernatur.', 'manga', '', '[]', 2015, 152, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(51, 'Voluptas cumque ducimus et sequi enim debitis praesentium asperiores.', 1452.00, 'Excepturi voluptatem sunt consequuntur esse quod voluptatibus. Enim corrupti qui vel quia et ut aliquam. Minima alias adipisci excepturi sit non illo blanditiis. Voluptates non at aut minus. Qui nihil eius et inventore suscipit suscipit. Sapiente non iste ipsa nobis. Iure quasi eum pariatur provident ea sit. Labore in nisi enim et et dolorem maiores. Veritatis dignissimos delectus cumque quisquam voluptas recusandae sed. Alias et ratione dolore temporibus reiciendis illo est quae. Vel ea ut voluptas voluptatem. Odit soluta qui illum perspiciatis at.', 'europe', '', '[]', 2014, 464, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(52, 'Eum earum ut.', 622.00, 'Praesentium exercitationem beatae ut laborum rerum rem totam voluptates. Modi facere delectus eius ut assumenda odio. Ipsam perspiciatis ad porro consequuntur cumque fugit. Omnis repellat atque mollitia ea. Aut deleniti soluta qui autem optio amet. Et minus officia temporibus quia. Aspernatur tempore voluptas quidem debitis eos delectus similique. Eligendi adipisci ex quibusdam dolorem minus molestias veniam dolores. Aut deleniti voluptatem maiores nihil nam qui fugiat.', 'web', '', '[]', 2011, 416, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(53, 'Nisi consequuntur deleniti.', 955.00, 'Quia repudiandae exercitationem rerum ut id iusto. Qui provident ut neque repellat. Et aut ipsum ut non dicta nesciunt. Porro odit quaerat perspiciatis voluptas. Tempore placeat consequatur est nihil at est quaerat. Adipisci possimus architecto aliquam fugit veritatis magnam. Similique optio omnis sit omnis quis. Id consequatur aut est eveniet sapiente. Rerum alias temporibus ea et quod ab. Inventore aut corrupti esse excepturi ea et molestias. Voluptate maiores ea id aut. Inventore et aliquam dolorem sit qui.', 'manga', '', '[]', 1999, 158, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(54, 'Non repudiandae magni minima qui ab.', 924.00, 'Occaecati velit repudiandae consequatur hic voluptas. Quaerat eligendi eius voluptatem maxime error dolores. Mollitia vero repudiandae magni non tempora repellat dignissimos. Veritatis tempora nulla molestiae a natus quis voluptatem. Cumque earum dignissimos dignissimos. Tenetur magnam dolorem et id. Ut enim voluptas expedita quaerat possimus soluta. Est beatae non rerum ut vitae illum. Magni id molestiae qui ipsam sit deserunt. Sed optio doloremque cupiditate delectus tenetur. Libero atque sed rerum.', 'dccomics', '', '[]', 2017, 474, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(55, 'Quia blanditiis alias laborum nesciunt minus.', 636.00, 'Temporibus aperiam et aperiam eaque. Rerum dolor dolore qui ullam in. Sequi sapiente laboriosam earum libero. Facere nostrum pariatur qui numquam quibusdam. Earum quae sapiente et consequatur dolores. A aliquid laboriosam omnis saepe optio. Assumenda eveniet ipsum consequatur consequatur ipsum aut autem neque. Minus quia magnam non dolore dicta vero temporibus quo. Dolor eos incidunt nesciunt reiciendis. Tenetur voluptatem sunt molestiae error eum. Incidunt et ut esse dolorem nisi dolor.', 'architecture', '', '[]', 1995, 462, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(56, 'Minus debitis aliquam.', 821.00, 'Dolorem rerum voluptatem illum voluptates non accusantium. Expedita quibusdam qui a quae debitis. Vel qui et illum architecto ducimus. Omnis architecto sed et maxime ullam quisquam non officiis. Voluptatem unde neque incidunt voluptas nostrum. Optio saepe repellendus quo beatae maiores. Assumenda beatae a et deserunt et. Et laboriosam architecto quae rerum. Repellendus quia distinctio totam nesciunt culpa voluptatum. Aperiam similique quia sit placeat dolor et rem. Qui magnam vero qui accusamus ut accusamus ullam.', 'europe', '', '[]', 1993, 292, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(57, 'Iusto culpa sed est fugit sit dolorem.', 1952.00, 'Omnis ut deserunt quia cum. Labore reiciendis quia consequatur quaerat vitae. Quam blanditiis corporis repellendus occaecati. Ipsa eos ad debitis voluptatem quaerat. Eligendi consequatur et nemo non vel voluptatum. Dolor sit provident alias deserunt voluptatem unde nostrum. Perspiciatis minus et inventore vel est sunt. Quis harum corrupti quibusdam incidunt quia. Aperiam possimus omnis neque libero minus.', 'architecture', '', '[]', 2016, 201, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(58, 'Sit reiciendis molestiae.', 1058.00, 'Qui dolores et placeat. Sed sit accusantium voluptas ut est. Labore est modi sapiente ut non. Voluptatem adipisci qui odio molestiae sint dolor impedit. Architecto dolor consequatur aut possimus doloremque voluptatibus. Occaecati aut cupiditate blanditiis ut aut quia. Culpa consequatur voluptatum consequuntur eum laboriosam ea. Et distinctio et et maiores ipsam aut cumque. Quaerat dicta id est et. Quas blanditiis magnam perferendis dolor. Deserunt nesciunt neque placeat dolor. Id consequatur distinctio qui. Est officia consequatur eveniet. Est laboriosam et dolorem autem ducimus et.', 'architecture', '', '[]', 2016, 439, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(59, 'Aut facilis rerum.', 1408.00, 'Assumenda eaque aut eos labore ducimus unde nemo voluptatibus. Ea reprehenderit hic et aut consequuntur labore. Impedit alias ullam blanditiis rerum quis similique voluptas sapiente. Fugiat ea voluptatum voluptatem quis aut voluptatem rerum. Inventore blanditiis ut et labore eaque illo est. Sed molestiae et unde delectus non sunt aut. Qui nobis perferendis quo. Quo ut corporis aliquid recusandae excepturi officia. Ut corrupti praesentium velit omnis earum assumenda. Aut corporis autem ipsam recusandae labore. Non iusto quis optio sit molestiae.', 'europe', '', '[]', 2018, 346, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(60, 'Laudantium.', 1053.00, 'Dolor quis dolor dolores in. Unde aut corporis architecto soluta non fuga ipsa. Incidunt id animi impedit sed itaque possimus porro eaque. Id eos deleniti accusantium ipsum. Sunt iusto ipsam doloribus nesciunt eos. Nisi fuga deleniti ea non. Qui voluptatibus qui maiores quas neque. Numquam voluptates voluptatum sit et totam est. Quis est aut ullam maiores est et autem explicabo. Repellat et in reprehenderit molestiae et. Ea incidunt cumque nostrum minus aut quia provident.', 'dlyadetei', '', '[]', 2004, 197, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(61, 'Rerum.', 1091.00, 'Qui vel et nulla quibusdam mollitia natus. Ut consequuntur sed sint eaque. Et ut aut quis eos adipisci deleniti facilis. Sed earum alias voluptatem corporis aperiam laborum doloremque. Velit est laboriosam ex. Ipsa ut alias et sit. Dolorem blanditiis temporibus aut. Dolores repellat sit in omnis omnis est rerum id. Autem dolor debitis voluptate quis dignissimos porro velit. Rerum est qui nam temporibus incidunt. Distinctio labore optio qui qui. Placeat sit quia qui aspernatur ratione sed et. Laborum a omnis itaque facere hic aut pariatur. Nostrum quod atque consequatur natus ipsum ut et.', 'manga', '', '[]', 1993, 491, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(62, 'Maxime asperiores modi provident dolores.', 1770.00, 'Corrupti rerum laboriosam repellat sed beatae. Molestias non qui adipisci excepturi. Dolorum aut debitis ipsam laudantium voluptatum quisquam expedita est. Quo inventore corporis nam esse non voluptate eligendi. Non suscipit rem aliquam et et eum provident enim. In aliquam et aliquam laboriosam voluptatem blanditiis. Dolor rerum corporis ad eius maiores assumenda tempora. Dolores ut occaecati ab veniam dolor distinctio. Aut rem aut doloremque veritatis. Eos natus nihil ipsa. Veniam sit a a vitae.', 'dlyadetei', '', '[]', 2001, 395, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(63, 'Harum.', 1968.00, 'Quaerat porro dignissimos ratione dicta. Veniam est quasi tempore ipsum sit ut. Qui atque et veritatis. Unde accusantium ut ullam autem. Quo adipisci et maxime fugit autem ipsam dignissimos. Qui voluptas at explicabo eum qui omnis incidunt qui. Deserunt velit vel animi. Voluptas vitae facere non mollitia maxime consequatur. Accusantium officia nisi veniam error accusantium quo sint. Sint in accusantium eum eos accusamus voluptas aut. Tempore eos natus possimus. Iure perspiciatis ut temporibus harum nemo distinctio quam. Blanditiis non autem rerum quod maiores repudiandae et qui.', 'web', '', '[]', 2005, 278, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(64, 'Sed non velit numquam labore est.', 1455.00, 'Incidunt nulla illo ex rem qui eum et. Iure et velit rerum consequatur quas. Quis dolorum alias id maxime. Accusantium amet nobis quia ipsam aut corrupti sit. Officia dolore possimus harum blanditiis natus esse amet unde. Recusandae voluptatem facere distinctio sed nulla. Rerum rerum quia adipisci occaecati sit occaecati harum. Tenetur mollitia nesciunt dolor occaecati. Vel minus quam aspernatur non quia provident natus. Omnis non vitae officiis esse temporibus ut. Id velit et occaecati.', 'dlyadetei', '', '[]', 2004, 515, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(65, 'Dolor dolores non tempora.', 1812.00, 'Illo est aperiam consequuntur dolor voluptas. Corporis temporibus enim corrupti recusandae nostrum a. Eos mollitia nulla dicta ullam quam illum. Voluptas nihil omnis doloremque voluptates quae nulla. Molestiae distinctio quasi sit iure temporibus. Dolor voluptatum perferendis qui itaque possimus nihil. Est aut enim dolor vel modi hic id. Consequatur vitae laudantium dolorem neque possimus sunt omnis eveniet. Voluptas dolores aliquid minus voluptatem quo et. Est non blanditiis natus quis non hic. Et voluptas et fugiat dolores deleniti.', 'dlyadetei', '', '[]', 2014, 526, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(66, 'At voluptatem.', 781.00, 'Aut aperiam voluptatum rem dolorem ducimus odit. Quidem veniam eum porro consequatur quia ratione. Voluptas autem explicabo iure rerum voluptas. Eos pariatur neque id aut ipsum sunt temporibus optio. Sed adipisci voluptatibus et aut. Esse quis vel molestiae veniam dicta consequuntur amet. Quisquam quos aut qui vel voluptas iste porro. Ut quia quos at et pariatur nisi qui. Dolore optio debitis voluptatum. Vel cupiditate dicta omnis quasi vero autem. Quae itaque debitis a aut perferendis dicta doloribus.', 'dlyadetei', '', '[]', 2019, 233, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(67, 'Vel excepturi debitis.', 1482.00, 'Alias autem tempora hic dolores modi eum corrupti voluptatem. Natus pariatur voluptas eius fugiat. Et sapiente quia doloremque fuga similique. Omnis voluptatem molestiae totam saepe iure deserunt. Optio neque quia optio in adipisci id. In est laborum amet in libero porro. Quo cupiditate totam ut qui itaque ut odit. Quas occaecati adipisci iure ea. Sint ea animi nobis et nisi. Ea corporis rem voluptas consectetur nulla ad. Repellat vitae id voluptas a sit.', 'dccomics', '', '[]', 2020, 413, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(68, 'Eum commodi suscipit.', 1506.00, 'Veniam et rerum qui eum. Assumenda illum architecto sit et quidem. Vitae iusto quae error sit. Accusantium aspernatur asperiores hic eum. Itaque eligendi pariatur ea deleniti nihil est est. Non eum vel rerum deleniti exercitationem quo voluptatem. Laudantium at consequatur odio et et. Adipisci ex quasi blanditiis et voluptatem est aut. Animi nihil provident maiores non quae aut. Sunt consequuntur iste asperiores. Necessitatibus labore dolor cumque. Consequuntur laboriosam eum dolorem provident accusantium at mollitia ut.', 'architecture', '', '[]', 2001, 443, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(69, 'Eos voluptatem quidem necessitatibus aliquid.', 1886.00, 'Quae placeat consequuntur aut dolores qui. Repellat eos quis sit assumenda. Vel in explicabo maiores error magni dolores. Et sapiente numquam explicabo id officiis autem. Sequi et consequatur sunt laborum quibusdam ut. Sed perspiciatis tempora et non distinctio qui. Itaque quia minus distinctio laborum aliquid. Repellat quod eligendi ut consequatur eligendi totam dolorem. Sint quasi deserunt quas quia. Accusantium suscipit non in quaerat autem quo amet. Fugiat aliquid occaecati ducimus doloribus. Tenetur dolores blanditiis ea sed ex qui natus.', 'europe', '', '[]', 2008, 496, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(70, 'Voluptates minus non eos sed vel atque neque aut.', 1811.00, 'Officiis et voluptas ipsum laboriosam molestiae fugiat voluptates. Est repellat et rerum. Nihil iure blanditiis totam voluptatibus aut. Et laborum neque et tempora provident soluta. Odit eligendi magnam temporibus dicta voluptatem ducimus. Esse est eum minima impedit dolores. Ad perspiciatis illo enim molestiae. Magnam impedit iusto consequuntur laboriosam. Iusto nisi ullam perspiciatis aut nostrum voluptatem.', 'manga', '', '[]', 2002, 293, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(71, 'Veniam est cumque.', 916.00, 'Quo et et optio magni reiciendis nobis. Fuga doloremque rem ipsum voluptates. Ea nam quos repellendus voluptate modi saepe debitis. Ipsa consequatur commodi nihil labore. Debitis occaecati qui praesentium. At voluptate aut exercitationem iusto modi. Sapiente ut veritatis facere modi modi placeat. Quaerat ducimus cum molestias magni et explicabo aperiam. Laboriosam laboriosam repellat vitae culpa hic quis. Tenetur voluptate molestias vitae quisquam culpa omnis. Occaecati laudantium ut accusantium adipisci.', 'architecture', '', '[]', 2013, 492, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(72, 'Minus deleniti exercitationem provident.', 1862.00, 'Distinctio omnis et nostrum optio ut. In quos ad qui ratione vero vel. Cupiditate facilis modi est consequatur repellendus recusandae. Omnis omnis architecto sapiente adipisci. Vel excepturi magni non reprehenderit non. Eos aut sunt ut totam ut laudantium. Eveniet minima eius sunt sed ad. Et excepturi quae est ipsa dolores qui. Nesciunt voluptatem facere autem nostrum sit numquam libero. Nulla cumque exercitationem voluptate numquam. Numquam vero deserunt quia nostrum.', 'web', '', '[]', 1991, 545, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(73, 'Totam dignissimos aut in sint aut.', 728.00, 'Asperiores rerum et vel impedit enim perspiciatis velit. Saepe maxime velit fugit sit. Nam veniam sit aliquam facilis. Facere temporibus est voluptas quia aut voluptas. Incidunt ut eos doloremque iusto assumenda est. Similique dolores ad itaque beatae. Eum recusandae itaque ipsam illum enim. Rerum tenetur dolore voluptate quidem ut aut et. Omnis numquam possimus velit. Officia in repellendus ducimus consequuntur perspiciatis quisquam. Ut odit qui aut velit. Ut aperiam ut et consequatur.', 'dlyadetei', '', '[]', 2012, 287, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(74, 'Impedit quod.', 890.00, 'Aut animi dolorum nisi autem. Eveniet consequatur incidunt eum dolorem. Optio asperiores excepturi mollitia animi ut consequatur sunt. Cum itaque ut quis qui fugiat rerum sed. Illo eius quas repellat delectus voluptate. Nisi voluptatem asperiores excepturi accusamus quia. Quam adipisci provident illo qui. Iste quia qui voluptatem quisquam dolorum facilis aut quo. Soluta dolorem voluptatem officiis sequi sed eaque. Nesciunt voluptatum qui nostrum eius. Aut voluptatem veniam facilis corporis dignissimos et ipsam. Enim quasi aut voluptates vel.', 'architecture', '', '[]', 2004, 400, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(75, 'At.', 518.00, 'Enim rerum aut repudiandae et repellendus. Ut et voluptatem dignissimos. Eaque ducimus voluptatem rerum dolorum. Et iure repudiandae non odit quo eligendi totam qui. Fugit vel sint velit dolor illum repellat sunt repudiandae. Doloremque harum odio illo aliquam consequatur voluptatem hic. Dicta ipsum quae vitae et nesciunt. Aut expedita ut commodi et cum autem. Vero deleniti placeat consequuntur velit tenetur facere vel. Nihil harum exercitationem nostrum cupiditate officiis est rerum. Magni voluptas commodi nostrum ducimus doloremque.', 'europe', '', '[]', 2010, 501, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(76, 'Eveniet distinctio.', 1002.00, 'Neque rerum adipisci et cumque. Voluptas harum error dolore dolor adipisci. Doloribus qui harum magni itaque vel quos. Delectus mollitia itaque odit ad fuga et. Ipsa est est laborum sed ut ad. Voluptatum cumque expedita aut voluptatem eveniet error. Est laboriosam quas omnis inventore id molestias quia. Eaque consequatur enim architecto quia tempore dolorem est. Impedit nesciunt officiis natus. Voluptas laborum harum laudantium nobis quam similique dolore.', 'dccomics', '', '[]', 2009, 192, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(77, 'Eaque.', 876.00, 'Enim incidunt sed perspiciatis corporis. Aut aut ut aut esse. Ipsa doloremque pariatur aperiam dolorem. Sed sed dolores voluptates ab quo quam sed. Tempora dolorem aliquid suscipit minima. Enim reprehenderit illum id et quaerat dolor. Sequi aut fugit perspiciatis id ratione in voluptates. Sequi repellendus cum deleniti. Eos consequatur iste voluptatum cupiditate. Impedit ad et cumque voluptatem quia unde. Voluptates iure in placeat laborum autem. Illum architecto est rerum.', 'marvel', '', '[]', 1999, 432, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56');
INSERT INTO `products` (`id`, `title`, `price`, `description`, `subcategory_slug`, `picture`, `pictures`, `year`, `pages`, `cover_id`, `created_at`, `updated_at`) VALUES
(78, 'Facilis asperiores eos enim.', 1814.00, 'Ut iste cupiditate velit quasi molestiae blanditiis saepe. Omnis labore non id iure. Quas et enim at reiciendis numquam. Et saepe est quia. Magnam corrupti dolor incidunt et et et dolor. Excepturi aut unde sed. Rem vel voluptatem inventore culpa aut. Quos eligendi nam qui. Aperiam dolorem ut omnis laborum voluptate. Minima perferendis iste labore et tempore. Quod quia id consequatur sed non itaque perspiciatis enim. Assumenda corrupti at exercitationem dolorum tempora. Rem totam provident debitis sed et. Excepturi et saepe temporibus tempore vitae commodi voluptas.', 'europe', '', '[]', 1996, 286, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(79, 'Id.', 1332.00, 'Qui et odit fugiat quis. Qui sit aliquid est beatae. Et libero repudiandae natus a harum qui quas. In non facere suscipit omnis excepturi aspernatur. In facere tempore culpa quia eum id. Est suscipit culpa excepturi quis excepturi. Nisi quas ipsa cumque non consequatur. Sint aut maiores quas voluptatum voluptatem ut commodi. Eos qui est consectetur. Architecto ullam aliquid et ut deserunt quia consequatur. Odio doloremque aliquam enim dolore cumque cum voluptatem sunt. Eos provident praesentium illum.', 'marvel', '', '[]', 2010, 347, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(80, 'Quod.', 765.00, 'Unde officia cumque omnis nulla blanditiis. Impedit totam exercitationem id ducimus neque. Corporis tempora ducimus aspernatur voluptatibus cumque. Quas porro voluptatem est sint eum dolor animi ea. Odio ipsa harum et eius quis maxime provident. Omnis eos id eum tenetur et modi eos eius. Accusamus porro corrupti nihil voluptate perferendis qui doloribus. In voluptas eum et et iusto deleniti. Atque dignissimos qui exercitationem facilis. Minus consequatur eos quae perspiciatis. Accusamus beatae et et velit facilis. Omnis animi qui corporis sed. Sit facere voluptas ea officia aut nihil.', 'manga', '', '[]', 2001, 466, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(81, 'Beatae velit dolorum amet.', 1381.00, 'Velit temporibus dicta fugiat est sint aliquam eum. Eaque sit molestiae ut sed sed. Adipisci atque quam magnam impedit voluptas sed corporis assumenda. Aspernatur maiores autem quo est molestias. Reiciendis autem fugiat voluptas voluptas cum laudantium. Eveniet laboriosam modi natus. Ea est asperiores velit quis qui. Animi assumenda laborum deleniti quos et quia. Delectus odit amet vitae quaerat omnis. Necessitatibus rerum molestias non dolorem ut ut id. Aut modi magni non voluptatem. Sed eum fuga dicta dolor.', 'marvel', '', '[]', 2015, 164, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(82, 'Exercitationem voluptas totam saepe.', 1162.00, 'Porro ratione qui voluptatum aperiam. Iusto voluptas itaque nulla non eum nesciunt. Omnis consequatur illo ad vitae minus dolores. Sint aliquam aut reiciendis aut. Consequatur repellat sunt numquam sint beatae amet. Magnam eligendi architecto error fugiat ducimus et ducimus et. Illum dignissimos non voluptates. Debitis et ab itaque reiciendis. Vero provident odit quas harum eligendi dolorem. Quo nisi beatae sed et. Sed sint corporis hic unde quibusdam qui ut.', 'web', '', '[]', 2006, 412, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(83, 'Quis qui dolorum in.', 1403.00, 'Aut enim dignissimos consequuntur id voluptas error voluptatem. Atque voluptatem dolores eligendi animi voluptate eum enim iure. Sequi impedit qui modi voluptatem. Non eligendi beatae ipsa quae debitis assumenda suscipit. Quo dolores ex sint temporibus. Quaerat mollitia quia aut ea. Sed ipsam sequi odio necessitatibus iste nulla doloremque ratione. Porro accusantium rerum sapiente in deleniti vel. At id aut suscipit voluptatibus porro id temporibus omnis. At harum fugit recusandae qui mollitia culpa dolorum. Doloribus ullam impedit quam sint earum dolorem repudiandae quae.', 'architecture', '', '[]', 1997, 186, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(84, 'Impedit cupiditate labore necessitatibus.', 684.00, 'Ratione sit distinctio adipisci incidunt velit unde autem. Et facere facilis molestiae nulla eveniet et. Molestiae sint quo consequuntur quibusdam consequatur dolores. Nobis nam sint qui autem nobis rerum. Impedit enim impedit et. Illum et consectetur et voluptas dolor beatae. Aliquam et fuga natus saepe mollitia. Fugit veniam fugit iste nihil voluptas nulla sed. Sunt non esse cum reiciendis facilis consectetur. Ut asperiores deserunt et minima rerum. Blanditiis similique aliquid voluptatem voluptatem repellat.', 'web', '', '[]', 2013, 160, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(85, 'Doloremque officiis sit et omnis ipsam.', 1053.00, 'Ut non ut dignissimos maxime laborum commodi velit. Non soluta adipisci ex veritatis ducimus reiciendis. Quia non incidunt eaque laboriosam cupiditate deleniti ea. Nemo reiciendis ut quos vel explicabo. Eum rerum eveniet non. Ut reprehenderit atque quia et non voluptatem quas. Eligendi commodi assumenda et nemo similique. Ratione et error ea in. Sed numquam eos distinctio asperiores amet qui explicabo. Tempora quos ut neque. Magni aut deserunt sed temporibus.', 'marvel', '', '[]', 1992, 399, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(86, 'Nihil doloremque hic expedita.', 767.00, 'Qui iure rerum beatae aut ex. Assumenda non est non. Vitae aut aut in sed odit. Est vel laudantium dolorem voluptas consequatur excepturi minus. Est placeat labore est sit et. Voluptatibus hic veniam et dolores qui. Odio omnis dolores nostrum omnis. Quas enim cumque ipsam. Provident quidem modi rerum error. Id et corporis voluptatibus. Blanditiis est sit rerum velit. Et quaerat corrupti omnis quasi harum sequi id provident. Fuga quos sed animi quod. Voluptatem maiores commodi repellendus sequi nihil architecto.', 'manga', '', '[]', 2008, 258, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(87, 'Vel fugit officia animi aut rerum.', 1412.00, 'Ea adipisci quis ut qui distinctio est dolor consequatur. Nostrum blanditiis dolores fugiat molestiae aliquam dolores. Recusandae in eos veniam corrupti quis tempore. Molestiae velit ipsa saepe est necessitatibus. Dolorem iusto commodi ex. Non veritatis voluptatem omnis. Molestiae aspernatur voluptatum esse saepe. Placeat id modi tenetur qui quis eius labore voluptatem. Neque ea sed assumenda vero. Nobis non voluptatem voluptatum explicabo. Perferendis harum aperiam aperiam sequi est libero. Totam est vel voluptas eum repudiandae quibusdam.', 'architecture', '', '[]', 2011, 301, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(88, 'Dignissimos.', 595.00, 'Consequatur eius unde aut consectetur mollitia officiis rerum. Facilis nemo blanditiis iusto id eos. Est enim sapiente sunt soluta non. Beatae et eum tenetur necessitatibus quia incidunt nihil. Neque omnis libero ducimus at quia doloribus soluta repellendus. Aliquam non adipisci sint laborum. Animi a expedita aliquid et in at et. Ullam facilis id aperiam consequuntur quas. Perferendis dicta est ratione architecto sint in. Voluptatum sunt velit quo est et.', 'dccomics', '', '[]', 1997, 246, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(89, 'Eius quibusdam autem nemo consequuntur nulla.', 1220.00, 'Ut eum quidem architecto perspiciatis dolorem. Aut sequi qui quos autem. Rerum aperiam nisi eveniet amet voluptas. Cupiditate et facere dolores rem distinctio et sit. Iste non et aliquam neque eum. Dolores minima soluta eos earum tenetur. Maiores perspiciatis tenetur sit quam similique possimus. Dolore qui rerum veritatis voluptatem esse ea aliquid. Animi eum assumenda architecto nulla vel voluptates numquam. Fuga enim non magni. Laudantium eos ipsum hic officiis eum. Dignissimos fugit repudiandae asperiores sequi quo.', 'dlyadetei', '', '[]', 1991, 445, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(90, 'Maxime unde eos dolore deleniti molestiae.', 964.00, 'Voluptatem laudantium non in cupiditate aut. Ex quis fugiat commodi. Explicabo veritatis placeat vel fugit blanditiis. Dolore aperiam labore et saepe error porro. Iste nulla tenetur quae. Eaque recusandae minima quasi optio et illum. Neque ut et sed qui magni consequatur sunt. Dolore non quia est. Est qui suscipit inventore eligendi enim ut. Sed similique distinctio sunt est iste. Id qui blanditiis illum possimus aliquam dolorem. Eum quia odit ex expedita facere eius. Et et ullam repellat velit. Mollitia error ullam cupiditate totam provident. Ut non autem debitis temporibus.', 'web', '', '[]', 2001, 431, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(91, 'Aut nesciunt natus.', 1776.00, 'Sunt quod corporis tempora. Nemo ducimus et dolorem aut dicta quae. Excepturi quisquam aut et quas et ipsam assumenda magnam. Rerum vel pariatur ut. Eaque amet ad voluptatem minima ad. Ut praesentium ullam illum laborum illo sit. Minus facilis dolores quia. Facere at odit voluptatem maxime est rem. Eligendi omnis enim consequuntur. Consequatur dolorem eius sequi iure. Et illum et nihil eum incidunt. Eveniet quos qui et quaerat sed. Voluptate hic tenetur et qui atque. Quia odio reiciendis quas sint et non vel. Culpa amet aut fugiat excepturi.', 'manga', '', '[]', 2019, 380, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(92, 'Et est praesentium aut.', 1671.00, 'Eius accusantium et et ut adipisci reprehenderit. Sit voluptate incidunt et vero cum. Quas atque inventore et dolorem quae. Dolores unde enim dicta non quia aut. Quibusdam dolores vel aut blanditiis eos aperiam. Doloribus dicta est accusantium aut qui aut nobis hic. Illo omnis ipsam mollitia id reprehenderit neque. Voluptas cupiditate quis sapiente aperiam consequuntur est sit. Sit impedit eveniet nobis consectetur non a quisquam. Quia ut aut quia earum aspernatur aspernatur sed inventore. Vel ut aut quod et qui.', 'dccomics', '', '[]', 2014, 485, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(93, 'Odio.', 1868.00, 'Voluptas fugit inventore suscipit enim sed accusamus rerum. Sed rerum at neque itaque repudiandae ut. Necessitatibus velit est accusamus incidunt eum molestiae ut distinctio. Ut quia perspiciatis dolorum nostrum reiciendis aperiam quo est. Unde saepe corrupti voluptas tenetur et est. Similique voluptatem repellat iste suscipit quis in fugiat rerum. Rerum et et deserunt assumenda quas magni. Et placeat quia alias temporibus tempore at. Debitis dolore similique qui. Dicta eligendi alias repudiandae animi est quo voluptates aut. Magni laudantium voluptatem ut iusto expedita.', 'manga', '', '[]', 2000, 276, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(94, 'Eius autem quis nam voluptates.', 935.00, 'Quibusdam id est quia ducimus. Occaecati ex dolore non et quam. Quas voluptas ut aspernatur vitae. Voluptas voluptatem qui excepturi laborum quibusdam non odit. Quo voluptatem dolore et. Quas necessitatibus asperiores officiis iure ut qui autem. Non nihil rerum quia soluta dolorum mollitia recusandae voluptates. Dolorem reiciendis tempore aliquid vero sapiente. Aut incidunt minus necessitatibus occaecati dolorem error. Qui sequi voluptates voluptatibus doloremque tempore dicta. Placeat eum et aut labore. Amet sit enim suscipit.', 'dccomics', '', '[]', 1991, 447, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(95, 'Aut sed.', 654.00, 'Quasi aut repudiandae ut quis nisi eius possimus. Natus saepe sequi reiciendis. Explicabo est aut voluptas blanditiis earum. Sunt labore cum ex doloribus nihil. Adipisci quidem dolor omnis. Ut deserunt maxime unde. Id qui nihil et quod qui dolor et est. Pariatur recusandae cumque omnis. Ullam consequuntur provident ratione aperiam reprehenderit neque nihil. Ut pariatur blanditiis dolore ut incidunt. Impedit nobis veritatis tenetur officia qui nihil. Dolorem facilis optio quia recusandae consequatur qui rerum. Illo laborum maiores fugiat.', 'dlyadetei', '', '[]', 2006, 475, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(96, 'At consequatur.', 1305.00, 'Aliquam itaque praesentium sed molestiae animi. Veritatis nulla fugiat vel magni. Ab libero quia quis esse praesentium nulla. Ad pariatur ipsa sint exercitationem. Omnis sint quia numquam sit aut ut. Recusandae eligendi molestias ullam ut consequuntur modi. Libero est sed minus id nam nam. Ipsum possimus sed cupiditate velit. Omnis qui rem sint est iste. Eius ipsa voluptatem iusto id dolor aliquid. Tempore eius ducimus recusandae reprehenderit consequuntur error.', 'dccomics', '', '[]', 2020, 203, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(97, 'Repudiandae eveniet aut dolorem aut minima.', 1369.00, 'Nulla voluptatem fugit quia hic mollitia quas. Dolor ut officiis nisi tempore. Quos laboriosam ut saepe. Est deleniti aut quibusdam est. Beatae at dolores doloribus maiores dolorem natus consectetur. Earum modi quos voluptas vel. Aspernatur voluptate sint ipsa quas corrupti in consectetur. Voluptatibus ut totam esse non repellat vitae. Ea qui saepe a ipsum. Quasi fuga molestias consequatur cum qui. Ut sint labore qui perspiciatis recusandae. Dignissimos quasi aspernatur aut quisquam. Iure cumque assumenda aut. Eum vero magnam dolor nesciunt voluptatem corporis vel.', 'web', '', '[]', 2012, 156, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(98, 'Nulla sit quae voluptatum similique a.', 1990.00, 'Ipsum nesciunt saepe consequatur. Aut similique autem velit et necessitatibus aut eum. Rem tempora voluptas dolores esse aspernatur. Quae illum velit deserunt quia eos suscipit. Architecto repudiandae aut architecto ullam id nisi. Id atque eaque ipsa aut dolores velit. Quod optio molestiae eos est at odit. Et qui dolor consequuntur illo. Sed ad modi quis voluptas ut quis voluptatem sunt. Eos itaque est assumenda. Recusandae qui labore deleniti voluptatem exercitationem dolor quam. Voluptatum tempore quasi tenetur repudiandae facere quaerat. Qui quod sit voluptas molestiae.', 'dlyadetei', '', '[]', 1997, 240, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(99, 'Expedita repudiandae aperiam autem sint.', 1956.00, 'Consectetur voluptatem omnis aut fugiat. Quibusdam quo deserunt ut repudiandae in. Consequatur quas eos non dolor temporibus fugit. Ipsam ipsa qui voluptates quisquam velit nihil natus. Animi quisquam fugiat incidunt inventore non totam et. Illo quis voluptatem saepe dicta adipisci. Et est consequatur ipsam impedit incidunt molestiae quidem. Ut magnam odio saepe soluta mollitia facilis minus. Autem repudiandae natus modi sequi. Iusto tenetur quidem eius eius reiciendis. Itaque adipisci aut minima placeat. Odio omnis ab temporibus animi saepe adipisci voluptas.', 'manga', '', '[]', 2004, 248, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(100, 'Expedita ex.', 1702.00, 'Quibusdam error iure veritatis ad. Animi culpa eum quas molestiae voluptatem perferendis recusandae et. Porro incidunt suscipit est eos enim velit et. Reiciendis ipsa enim alias accusamus cupiditate architecto. Culpa hic totam sunt et assumenda culpa rerum. Vel molestiae sit officia sit assumenda quia. Blanditiis ut consequuntur amet at et maiores. Aut quia consequuntur iste et exercitationem quia in. Quidem porro fugiat sint nulla aut fugit et. Praesentium consequatur est et voluptates et et. Cum quia ipsum odio excepturi quos. Soluta iusto dolores amet sed inventore culpa.', 'web', '', '[]', 2004, 250, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(101, 'Ipsa corporis maxime consectetur libero.', 885.00, 'Rerum dignissimos in officiis fugit accusantium. Porro eveniet ipsam suscipit ut. Porro et voluptate ea vel atque delectus. Eveniet eligendi repudiandae nobis optio. Natus possimus sed quasi voluptatem accusamus. Commodi ut mollitia voluptatum voluptatum ab laborum reprehenderit. Totam aperiam qui aspernatur repellat autem corrupti voluptas. Assumenda ducimus ipsum illum ea. Et non iusto sed distinctio. Voluptatibus beatae saepe harum aperiam. Consequuntur vel et repudiandae. Voluptas cupiditate iusto suscipit rerum voluptas ullam quaerat quis. Enim et temporibus minima qui eaque a optio.', 'architecture', '', '[]', 1998, 418, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(102, 'Nesciunt sequi animi minus non ut iure.', 1276.00, 'Magni excepturi consequuntur porro rerum reiciendis et. Hic sit veniam necessitatibus. Officia dolorem eligendi facere aut dolorem occaecati. Consequatur rerum quasi optio. Officiis enim quia sit id molestiae ut. Sapiente sequi voluptatem ut nemo aut nesciunt esse ut. Est ipsam ad dolorem natus. Voluptatibus iusto in et aut odit consequuntur rerum iste. Ratione tenetur fugit eum et iusto. Nihil eveniet voluptas quis corporis quam et dolor.', 'dlyadetei', '', '[]', 2005, 181, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(103, 'Est repudiandae facere.', 1362.00, 'Praesentium consequuntur est veritatis dignissimos. Mollitia sed velit et. Laborum nulla deleniti optio laudantium quasi. Non expedita amet expedita harum. Qui consectetur sed est. Tempore quod exercitationem dicta vel maxime. Culpa modi quia in voluptatibus. Qui eos distinctio magni. Consectetur voluptate dolores et a rerum. Eum consequatur eligendi repellat libero eligendi aut veritatis sit. Debitis corporis fugiat commodi quidem et consequuntur magnam assumenda. Aliquid porro eveniet quia cumque et.', 'architecture', '', '[]', 1998, 530, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(104, 'Sapiente corporis accusamus nulla sit ipsa.', 1409.00, 'Ea non omnis est sed quo voluptate animi. Fugit deserunt sit laudantium fuga quam sint. Accusantium voluptas omnis magni illum praesentium deleniti recusandae et. Corrupti placeat ut vitae occaecati quia exercitationem. Omnis voluptas in qui hic sunt quia. Molestiae architecto non sunt consequatur illo non. Esse non totam dolore et odio aliquid eligendi voluptatem. Consequatur nulla quo quod voluptas sit adipisci. Et assumenda velit harum qui. Ipsum voluptas velit praesentium libero nostrum exercitationem. Architecto nihil eos modi eos nihil. Totam rem fugiat fugiat enim et.', 'manga', '', '[]', 2010, 174, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(105, 'In quae sapiente quas quibusdam error omnis qui.', 1099.00, 'Iste inventore qui unde suscipit culpa modi voluptate. Laboriosam et asperiores dolorum quo ut voluptates eaque. Exercitationem non aliquid et est dolore architecto ex. Ea in est debitis laborum sit voluptatum ipsum. Deserunt autem dolor error placeat veniam fugit. Et illum consequuntur nobis non commodi deleniti non. Dolor dolor numquam eveniet quae. Ut mollitia odit et cumque inventore.', 'marvel', '', '[]', 2006, 272, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(106, 'At mollitia eos omnis molestiae.', 829.00, 'Velit expedita molestias blanditiis. Excepturi et quidem autem officia qui praesentium earum. Exercitationem aliquid enim nesciunt dolores. Molestiae quo voluptatum nihil dolorem. Dolorem nisi aperiam et nihil iusto laudantium quia. Et cum sequi tempore est. Maxime voluptatibus sed nam illo officia praesentium et. Odit velit dignissimos quisquam dignissimos earum labore. Et consequuntur in temporibus animi mollitia exercitationem rerum. Hic itaque veritatis sapiente sequi ut. Vel temporibus autem nostrum maiores velit quasi laboriosam tenetur.', 'web', '', '[]', 2016, 195, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(107, 'Fugit et rerum.', 899.00, 'Minima consequatur similique perferendis. Ipsam voluptates at omnis occaecati voluptatibus aut modi. Qui illum est quam optio maiores. Omnis quod libero est quod aliquam non. Optio qui voluptatibus esse vitae. Totam possimus deserunt rerum sit eligendi. Saepe totam assumenda ducimus consequuntur. Est nobis quam aspernatur voluptates. Reprehenderit aut deleniti perferendis cupiditate occaecati ex impedit culpa. Et id numquam voluptatem et velit aut ducimus.', 'manga', '', '[]', 2002, 513, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(108, 'Libero ducimus illum laboriosam iste ut.', 1194.00, 'Id fuga et vero perferendis ut eaque. Doloribus quam dolor quaerat possimus et tempore ut. Sint omnis nobis consectetur ut est neque numquam nulla. Soluta aut autem esse eligendi officia. Quidem in est qui aperiam aliquid quisquam fugiat. In quia accusamus et voluptate. Tempora sunt in nam consectetur. Nam illo sequi eveniet repellendus ipsum voluptatem. Quam perferendis voluptatem voluptas consequuntur repudiandae minus voluptas. Tenetur inventore hic et. Excepturi velit ratione laborum dicta. Consectetur aut incidunt repellendus dicta asperiores in eum.', 'web', '', '[]', 2006, 414, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(109, 'Aut voluptas omnis.', 1919.00, 'Labore accusantium optio nam distinctio voluptas. Suscipit nostrum cum quo minima nam aut debitis qui. Neque pariatur et quod id et nam. Voluptatem ut occaecati aliquam velit dolorem quo dicta modi. Autem aut neque nihil atque. Vitae fugit omnis sunt. Rerum sit distinctio dolorum corrupti nulla consequatur commodi vitae. Et fugiat dolorem animi sunt. Rerum ipsum ut nihil soluta. Debitis soluta omnis ut et et. Sapiente quam dignissimos sed sapiente et ut. Aut porro omnis hic. Qui delectus natus velit id temporibus.', 'web', '', '[]', 1996, 158, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(110, 'Delectus.', 1616.00, 'Facilis est sit voluptatem dignissimos aut sed qui odit. Voluptatem ut et sed et commodi. Et nihil ipsa quo placeat. Saepe consectetur ratione animi quo sed pariatur modi doloribus. Eos natus est commodi architecto. Eum aut velit possimus voluptas fugiat ex. Modi eos perspiciatis officia. Cupiditate consequatur aperiam reprehenderit consequatur dolores magnam. Eius odio nihil dolore placeat. Explicabo natus est eaque illum laudantium. Nam aliquid optio ut esse quia. Repellendus maxime at assumenda quo laboriosam aut.', 'manga', '', '[]', 2004, 255, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(111, 'Voluptatum possimus dolor.', 989.00, 'Labore sunt natus accusantium est. Qui atque impedit saepe omnis iusto. Veritatis in ea quae adipisci minima. Dolores eos aut omnis voluptas aut. Aut unde ut earum aperiam. Dolor cum aut voluptas temporibus. Aut dicta dolorem laborum voluptas ea amet qui officiis. Laboriosam eos et ab. Reiciendis rerum dignissimos sed in dolorem doloremque. Enim aliquid doloribus omnis id sunt consequatur.', 'manga', '', '[]', 2016, 407, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(112, 'Odio laboriosam dolor aperiam sed asperiores non explicabo.', 519.00, 'Reprehenderit nemo inventore et consectetur consequatur. Atque temporibus in quo doloribus. Minima aut ut dignissimos. Veritatis ducimus ut id libero perspiciatis quam. Voluptatem minus in temporibus et eius. Ut ab in qui explicabo quos ut aut. Est veritatis maiores vel totam expedita eligendi nulla. Repudiandae iure ut explicabo. Ut magni eum aperiam saepe non vitae. Sed illum aspernatur ut ut modi maiores est. Voluptatem iste repellendus illum dolorum tenetur. Nobis quae voluptas tempore rerum. Sint debitis maxime aut earum sed ut sequi modi.', 'europe', '', '[]', 1993, 172, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(113, 'Veniam dicta eos iusto facere ex.', 1467.00, 'Mollitia quia accusamus sit qui ea. Debitis vel praesentium alias nam. Dolores non sit veniam est sit et. Consequuntur ipsam aut ex labore sed ut. Ea sit repellendus natus facere cumque ad. Inventore magni et at ut tempore. Debitis alias repellendus consectetur distinctio natus rerum et. Est quaerat repudiandae ipsa autem sed tempore nihil reiciendis. Tempore ducimus doloribus voluptatem. Et ut nemo earum omnis ex facere quod. Aut omnis dolorum est beatae. Rerum explicabo in quis qui. Perspiciatis perspiciatis necessitatibus blanditiis repudiandae fugit dolores et vitae.', 'manga', '', '[]', 2016, 490, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(114, 'Dolor provident aspernatur id quasi rerum.', 1685.00, 'Cumque distinctio itaque velit. Et et et est eos officiis autem voluptas. Dolor quo veniam praesentium harum eligendi sit ea. Veniam illo qui odio nam neque. Ut est laboriosam eveniet voluptates tempore. Consequatur sed eveniet labore aut. Voluptas officia architecto illum mollitia facilis. Enim ex vel voluptatem non sint a eligendi totam. Necessitatibus eligendi velit ut eos. Placeat corporis ullam cum voluptate ullam officiis. Eveniet alias corporis sed minus assumenda doloremque fugit voluptatem.', 'manga', '', '[]', 2013, 459, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(115, 'Alias sit et.', 1060.00, 'Consequuntur ut est eius aliquam dolor fugiat. Voluptatem magni ipsam dolor qui commodi veritatis. Nesciunt sunt impedit doloremque ex dicta. Rerum consectetur corrupti deleniti accusantium maiores distinctio ut aperiam. Perferendis excepturi nisi ipsam perspiciatis laborum enim. Tenetur aut minima eos et facere beatae. Aut temporibus modi ipsum autem quaerat. Excepturi libero soluta reprehenderit a iste voluptate. Non debitis ut tempora cumque aut. Nostrum ratione mollitia qui autem quasi fuga.', 'dccomics', '', '[]', 2018, 414, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(116, 'Distinctio et molestiae officiis molestias ex.', 1474.00, 'Minima sed architecto quas necessitatibus porro. Architecto veniam unde ex qui quisquam. Ullam consequatur et eveniet sed qui nisi rerum. Cumque molestiae omnis repudiandae quam eum neque quae. Dolor nemo aspernatur saepe magnam laboriosam et. Perferendis laudantium architecto cumque non omnis. Qui minima quo dolor quae beatae hic fugit. Et dolorum rerum maxime enim perspiciatis. Eligendi corporis nihil corporis omnis. Modi eveniet facilis officiis numquam qui. Qui consequatur ipsam dolore nihil.', 'dccomics', '', '[]', 2002, 164, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(117, 'Facere explicabo accusamus inventore omnis dignissimos.', 714.00, 'Possimus ut ipsam perspiciatis quasi. Explicabo maiores voluptatem doloribus aliquid. Voluptates inventore id iure inventore natus qui. Reiciendis architecto voluptate culpa amet. Minus totam voluptatum dolorum quas vel veritatis ullam. Repellat quo officia ex laudantium et quia quia. Excepturi aut mollitia earum quidem. Excepturi cumque quam voluptas porro ut atque repudiandae. Dolorem ipsum qui sunt officia commodi.', 'dlyadetei', '', '[]', 1993, 542, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(118, 'Dignissimos rerum dolorem libero.', 1317.00, 'Totam et repellendus distinctio reiciendis. Nulla quisquam nulla est voluptatem dolorem qui. Et quis ducimus corrupti. Est odio sed odit repudiandae. Nemo facilis fuga cupiditate aut atque fuga. Consectetur vero sunt a earum. Qui minima ex voluptatem maxime. Mollitia sequi alias nesciunt adipisci saepe harum soluta. Est earum tempore qui enim aut eaque. Qui quaerat temporibus eligendi consequatur laudantium sint dignissimos. Laboriosam nulla ipsa architecto id iste quidem sed eius. Adipisci error et necessitatibus qui facilis ut quasi ut.', 'dccomics', '', '[]', 1998, 447, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(119, 'Quod.', 560.00, 'Iusto et ducimus ratione est voluptatem. Odio et impedit omnis reprehenderit corrupti cumque. Cumque provident repellat eum repellat. Quo eveniet omnis dignissimos voluptatibus fugit dolor. Expedita exercitationem vel ut eligendi porro. Ipsam at aperiam quia sint. Esse debitis laborum vel autem nisi sed. Voluptatum et minus omnis optio velit itaque. Nobis quia quibusdam et reiciendis sunt distinctio sunt rerum. Eum et voluptatem qui ut quos corrupti et. Quibusdam et sed dolore. Qui voluptates labore quam iusto debitis rerum hic. Eveniet aut excepturi tempore voluptatem.', 'manga', '', '[]', 2019, 349, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(120, 'Non enim est.', 1100.00, 'Est atque voluptate est vero. Ipsam qui distinctio ea non sint ut cum. Asperiores dolor suscipit ea sint expedita. Ut id in saepe autem at ducimus fugit dolorum. Amet voluptatem aliquam voluptatum ut sit quod et. Tempore cumque qui ad quibusdam eveniet distinctio. Praesentium magnam in repudiandae. Laboriosam perferendis quas tempore adipisci officiis doloribus. Numquam odio veniam consectetur fuga ea. Reprehenderit sed voluptas adipisci qui eum inventore. Accusamus est enim debitis ipsum voluptas temporibus aut. Aliquid fugiat repellat nesciunt possimus qui et.', 'architecture', '', '[]', 2004, 422, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(121, 'Optio sed aut sunt vitae.', 1413.00, 'Qui rem quisquam commodi. Dignissimos fugiat vel neque magni a laborum omnis suscipit. Quo quos et vel doloribus error molestias perferendis. Maxime qui aut labore saepe facilis eligendi quidem. Aut iure ut atque blanditiis rerum. Ut dolore eligendi molestiae voluptatem. Nobis et perspiciatis error sed. Numquam qui vel distinctio alias. Reiciendis repellendus iure qui ullam vero sed esse. Distinctio aut odio doloribus aut explicabo suscipit consequuntur. Et et beatae nihil enim sit.', 'web', '', '[]', 2010, 282, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(122, 'Ut.', 861.00, 'Autem cumque neque esse sed quis et. Quo dolor asperiores molestiae sint non. Hic at excepturi et velit id. Omnis ad voluptatem eveniet consectetur. Vitae aspernatur qui sed qui molestiae ab debitis sint. Quis eum illum ut doloribus molestiae itaque ut ut. Voluptates nobis odit numquam eveniet sequi totam quae. Praesentium temporibus repellendus dolor at velit molestias laborum. Iusto provident et numquam quia nesciunt ipsa. Iusto earum qui nesciunt quisquam eaque. Amet sint nobis temporibus ipsam voluptas nesciunt eaque.', 'manga', '', '[]', 1993, 390, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(123, 'Est esse suscipit temporibus laboriosam adipisci.', 1052.00, 'Ut et illo ipsum illum alias vero nemo est. Odit hic ad harum omnis. Ea corporis eius et. Cupiditate ab sed earum nisi aspernatur est. Quae accusamus sed distinctio et at et. Beatae dicta aut ut at ut ut sint. Ut quis qui nihil. Sit sunt ut dolore facilis rerum quae sed. Et et delectus voluptatem eum debitis aliquam. Est enim quia voluptas saepe ut. Temporibus natus ratione est iusto. Voluptatem et reprehenderit officiis culpa. Repellat consequatur repellendus quia non illum dolorem. Id beatae rerum ratione ut. Animi facere in eum quasi. Omnis repudiandae similique reprehenderit.', 'web', '', '[]', 2001, 466, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(124, 'Aut.', 1642.00, 'Ut eum tempore ut vel. Facilis et mollitia consequatur quasi inventore. Excepturi qui libero ea perferendis beatae. Doloremque at odio qui iste qui delectus. Voluptatem voluptates saepe qui impedit tempora praesentium. Veritatis eos impedit fugiat adipisci quia. Ducimus optio aperiam quia temporibus eos vero. At cupiditate assumenda laboriosam dolores. Quo et omnis dicta veniam corrupti incidunt consequatur. Molestiae enim quaerat et nobis. Voluptates illo voluptatibus enim. Quos omnis sapiente numquam ex distinctio dolorem. Ea et quas numquam voluptas dicta est.', 'dlyadetei', '', '[]', 2018, 156, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(125, 'Exercitationem voluptatem.', 904.00, 'Aut doloremque aspernatur omnis facilis ab incidunt. Et rerum et laborum. Voluptates maxime asperiores illo vel quibusdam amet. Repellendus est ut rerum quidem enim ut voluptatem. Quaerat consectetur animi sit id tempora. Blanditiis atque eum alias. Quibusdam corporis quibusdam inventore id ut aut qui qui. Adipisci sint a facilis. In fuga ratione rerum dolor voluptatibus natus illo. Quia tenetur temporibus id sapiente est. Aut et impedit voluptas perspiciatis ipsam cumque. Expedita asperiores dignissimos sit assumenda voluptates ut.', 'architecture', '', '[]', 2008, 168, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(126, 'Sequi fugit dolor expedita aut aliquid.', 1213.00, 'Voluptatem distinctio praesentium aut consectetur dicta est ut. Aut rerum non sunt non distinctio qui harum. Beatae molestiae vel modi assumenda velit cumque voluptate. Dolorem eos debitis sed qui. Numquam dolor dignissimos in qui ea rerum. Deleniti quis porro dolorum sunt rerum vero perspiciatis. Et aut quis qui sed nulla qui. At qui illo non ipsa consectetur rerum illo. Tempore laudantium iste perspiciatis rerum amet quis. Fugiat cum illum autem. Non sit est quidem ratione nihil. Mollitia est aspernatur eligendi perferendis. Debitis quae a quos aliquam non libero dignissimos eos.', 'manga', '', '[]', 2013, 290, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(127, 'Totam cum.', 677.00, 'Voluptatem repudiandae architecto aut. Distinctio quia rem tempora aut nam quos. Placeat saepe et magnam sunt. Magni ut libero cum culpa et. Amet nihil quidem similique consequatur beatae eveniet. Dolorem nihil esse quo nihil. Exercitationem vitae excepturi veritatis omnis minima deserunt. Ratione eos nihil sed et sequi vero. Quidem dolor ipsam ut iste dolorum cumque. Itaque mollitia facere repellendus ut tempora. Minima ipsa aut corrupti voluptatum omnis ipsam. Rem recusandae cumque dignissimos. Corrupti excepturi maxime sunt molestiae eaque. Qui et sit illo.', 'europe', '', '[]', 1997, 375, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(128, 'Est porro quasi similique.', 784.00, 'Sit pariatur aliquam iusto odio voluptatum nihil quis. Voluptas saepe consequatur illo cum. Fugiat et nemo libero voluptatem. Aut omnis soluta aut qui qui. Voluptas dicta repellendus vitae saepe recusandae. Sit autem enim eligendi sit ad autem. Magnam sequi reiciendis qui eligendi nemo totam aliquid. Rerum iste quia illum deserunt sit voluptatem sint. Fuga sequi sunt tempore omnis. Eius numquam ducimus nam voluptatem aut rerum. Omnis omnis voluptatem explicabo ut deserunt voluptas maxime. Non rerum omnis ut. Mollitia qui eos non magnam rem deleniti.', 'marvel', '', '[]', 2014, 512, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(129, 'Minus et ipsam quasi et voluptas sit.', 841.00, 'Sed est quia sunt sed totam quas. Mollitia voluptatibus delectus voluptatem excepturi tempora. Ipsa laboriosam sint provident qui omnis. Libero commodi qui illum. Nihil mollitia et vero autem sint in aut. Error nam minus ex et laborum. Rerum nihil quia non modi officiis et et. Enim aut consequuntur consequatur asperiores amet blanditiis. Est eum aliquam tempore et dolorum. Velit explicabo aut sed.', 'manga', '', '[]', 1996, 327, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(130, 'Qui impedit aut.', 1513.00, 'Cupiditate incidunt non dolor maxime et aut. Est aut pariatur et assumenda enim nam. Nemo sint perspiciatis quis fugit nam nam at. Molestiae ullam enim eum consequatur aut quaerat unde. Quia dignissimos nihil aut libero magni. Atque rem sed commodi minima dicta eaque possimus accusantium. Veniam eaque quibusdam sequi autem vel cum. Non assumenda asperiores quas sed nisi maiores odio. Voluptas magnam facere recusandae dignissimos voluptas. Alias velit dolorem cumque vel. Explicabo est molestias nisi laudantium illum alias laboriosam. Cupiditate quisquam minus temporibus molestias ducimus.', 'dccomics', '', '[]', 1996, 450, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(131, 'Dignissimos.', 658.00, 'Ut facere qui delectus ut velit ut. Sequi numquam facere neque accusamus quis. Aut doloribus ut nam dolores provident officiis voluptatem. Itaque officia amet labore distinctio ut vel. Vel doloremque quia ut soluta commodi voluptatibus et laboriosam. Nulla vero accusantium esse optio ad velit sed. Nobis sequi cumque sed numquam. Aut autem fugiat ut eum voluptatum deserunt consequatur voluptatum.', 'europe', '', '[]', 1998, 522, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(132, 'Laudantium voluptate non earum.', 580.00, 'Et ut voluptatem consequatur ullam sint quisquam. Aut perspiciatis quia dolores et tempore minus quisquam. Qui maiores quae similique id. Aut quam debitis hic sit autem sapiente voluptatem. Alias iure harum enim in. Voluptatem harum id deserunt nemo dolorum eos. Nisi numquam sunt aperiam aut vero commodi. Et facere ipsam et eligendi minima. Est consequatur odio et voluptatum quia. Iusto numquam et et libero enim ut. Provident tempore hic est magni. Omnis iusto et unde illum sint incidunt tempora. Assumenda quisquam nulla ea asperiores. Molestiae fugiat non assumenda ut.', 'marvel', '', '[]', 1992, 252, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(133, 'Nihil omnis.', 803.00, 'Eius porro ex dolorum ut perspiciatis tempore qui distinctio. Eius animi enim blanditiis et nemo eveniet. Consequuntur eveniet sed voluptatum consequatur architecto. Magnam autem ab quis mollitia praesentium. Dolores nulla sed assumenda quae et id consequatur. Voluptas ab omnis dolor ut. Neque eveniet quod nesciunt enim molestiae sint. Vitae rerum velit aut quibusdam cumque ducimus. Neque tempore qui molestiae facilis repellendus. Dignissimos qui est nulla natus inventore iusto. Omnis officia incidunt accusantium distinctio.', 'dlyadetei', '', '[]', 1990, 511, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(134, 'Nihil id voluptas saepe.', 594.00, 'Iusto sed quam autem sit quia dolore fuga. Dignissimos eligendi et aut eligendi doloribus repudiandae quo. Vitae tempora delectus minima hic maxime est totam maxime. Doloremque quidem cupiditate repellat ut consequatur ex id. Officiis odio libero provident veritatis nostrum voluptatum velit necessitatibus. Incidunt eaque libero assumenda in numquam. Necessitatibus accusantium voluptatum modi eveniet et. Fuga voluptatem neque in modi. Doloribus vero fugiat sunt nesciunt non quisquam nihil.', 'dccomics', '', '[]', 1991, 486, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(135, 'Non autem vel est.', 1509.00, 'Non qui explicabo laborum qui. Incidunt alias fugit dolores et voluptatum cupiditate. Quae et itaque voluptatem ut eius autem non. Sint totam hic non cumque. Non omnis ratione voluptatem ea. Eius cupiditate et illo ut animi est commodi. Consequatur pariatur molestiae voluptatem similique blanditiis. Eveniet quia distinctio voluptates quas nobis natus voluptate. Repellat aut tempora ipsa voluptas dolor. Tempora voluptatem accusantium eos non neque error non. Adipisci esse maiores aut dignissimos saepe. Consequatur veniam porro quibusdam dolorum eligendi maxime.', 'manga', '', '[]', 2014, 349, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(136, 'Est incidunt dolorem qui et.', 624.00, 'Rerum fuga rerum veniam dolor earum dolorum. Aperiam accusamus iure est. Enim eum et esse eligendi. Eveniet nobis quidem dolor odio. Voluptatem aut et rerum qui officia repellat mollitia inventore. Expedita a aut eligendi quo non maxime qui. Et ea deleniti dignissimos quisquam. Rerum aliquam aut natus dolor id. Veritatis laudantium quia inventore beatae. Veniam dolores sed deleniti unde excepturi quis a saepe. Maiores occaecati nobis voluptates rerum. At eum excepturi distinctio odio. Vero est autem est quo id et sapiente. Cumque voluptatem consequuntur deserunt facere explicabo sed quod.', 'manga', '', '[]', 2006, 250, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(137, 'Incidunt maxime et unde autem hic.', 1899.00, 'Saepe voluptatum nam aspernatur sunt. Maxime sint quam minima dolore dolorum. Est similique quas nulla qui ducimus. Qui maxime repellat minima inventore sit. Consequatur magnam et repellendus facilis mollitia ab cumque. Reiciendis quis non nobis eos quia laborum sit. Ad nobis quam quia at ullam sint fuga quasi. Architecto eligendi porro ex non mollitia quis. Consequatur provident eum quasi nisi consequatur corporis sunt accusantium. Enim deserunt minus dicta tempore.', 'dlyadetei', '', '[]', 1990, 291, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(138, 'Animi quis sint commodi modi.', 1044.00, 'Est quia modi dolor maiores sed provident quidem. Aperiam non dolor magni aut corporis. Corrupti cumque sed iste ducimus autem perferendis impedit. Vel optio veritatis laudantium non. Qui qui tempore maiores officia ea aut autem. Ducimus officia dolores architecto minus tempore aut. Exercitationem velit quos modi porro minus suscipit quis. Doloribus autem dolor expedita nemo aspernatur velit. Molestias assumenda pariatur voluptas ipsam quibusdam. Nostrum sequi architecto inventore facere omnis. Praesentium consectetur rerum beatae quo qui aut ut asperiores.', 'architecture', '', '[]', 1996, 181, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(139, 'Earum magnam qui a nostrum voluptas.', 1611.00, 'Commodi assumenda eum nisi. Sequi non veritatis culpa sunt accusamus doloribus. Quisquam nisi aut nam voluptate. Tempora ipsa ut est. Qui aliquam voluptatem alias quidem nesciunt. Quos laudantium eaque rerum occaecati est. Non voluptates ea alias placeat magni rerum eveniet. Eius libero laboriosam voluptas voluptas vel assumenda laudantium. Qui fugit occaecati aut est ipsum hic illum. Non esse dicta commodi tempora recusandae quas. Amet ut ullam distinctio ut consequuntur modi et. A quae sapiente consequatur occaecati.', 'europe', '', '[]', 2000, 376, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(140, 'Reprehenderit.', 613.00, 'Omnis maxime corporis distinctio et et cum. Perspiciatis omnis minima deserunt esse nihil ut quae dolorem. Aspernatur aut omnis veniam pariatur. Ut quo est consequatur aut qui aut porro. Deleniti explicabo non dolor qui autem repudiandae. Et quia necessitatibus unde molestiae. Unde voluptatem et eaque voluptatem necessitatibus ut. Qui fugiat autem voluptatem assumenda. Incidunt rerum odit sit rem quia illum. Consequatur laboriosam magni et aut libero facere. Facilis quia magni similique numquam ratione. Velit nihil dolore explicabo amet quam quo dolores.', 'manga', '', '[]', 2005, 465, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(141, 'Et maiores est.', 1076.00, 'Labore ut vitae itaque occaecati officiis provident autem ducimus. Assumenda earum minus quia eveniet deleniti. Est id est porro sed commodi cum. In sit ducimus totam quia unde quo. Libero tempora neque pariatur corporis sint. Aperiam in molestiae sint qui architecto non. Incidunt perspiciatis quibusdam quia ipsa ut nemo tenetur. Nihil magni et qui ut quo voluptates tempore vitae. Suscipit fuga illum odio similique qui autem et. Et modi iste quisquam sed iusto quibusdam aliquid quae. Quo voluptatem soluta ea qui. Qui consequatur dolorem ipsa id.', 'marvel', '', '[]', 2019, 308, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(142, 'Ipsa quam minus.', 1952.00, 'Voluptatum impedit repellendus quo ipsum aperiam eum odit. Aut occaecati magni rerum. Sed dolorem magni est expedita praesentium quia. Accusantium blanditiis sapiente debitis dignissimos porro ipsum inventore. Aliquid et iure corrupti. Perspiciatis et numquam dolorem aspernatur omnis. Omnis non nihil quod et quia maxime. Sed officia eaque nulla nam. Sint impedit qui id itaque molestiae. Cum corrupti impedit commodi exercitationem voluptatem nobis. Porro cumque aliquam dignissimos aut dignissimos assumenda enim. Molestiae laudantium quia perspiciatis accusamus.', 'dccomics', '', '[]', 2013, 274, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(143, 'Corrupti officia repellendus quo.', 1036.00, 'Non et eum laudantium magni voluptatem et ut aliquid. Nulla aut libero quis quisquam quaerat. Nihil quibusdam nulla eum quo nemo deserunt nostrum debitis. Quibusdam voluptatem magni sunt quae. Et aspernatur deleniti debitis quia est est. Sit libero quia voluptas et. Et hic nobis error quisquam omnis distinctio corporis. Tenetur qui dolores earum rem. Sed quam molestiae rerum incidunt dignissimos accusamus assumenda. Inventore placeat ea dicta quam.', 'web', '', '[]', 2019, 384, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(144, 'Dolorum.', 1946.00, 'Iure voluptates ut aut molestias. Quod quas quaerat ea sit corporis nulla. Unde voluptatem ex doloremque velit cum enim nisi. In voluptas magnam adipisci quis doloribus ea quisquam itaque. Est perspiciatis laudantium tempore in excepturi autem et. Debitis commodi molestiae aperiam rerum saepe. Harum quo voluptatem est esse mollitia impedit eum in. Eaque qui laboriosam reprehenderit exercitationem deleniti unde.', 'marvel', '', '[]', 1996, 311, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(145, 'Corrupti.', 1323.00, 'Voluptas corporis beatae incidunt repudiandae consequatur ut sint. At temporibus et occaecati quas ut quam neque ex. Id debitis quaerat sunt suscipit ea consectetur reiciendis ut. Assumenda cum a et. Omnis eius quia quis est praesentium. Doloremque commodi qui est earum sunt. Laborum veniam id veniam et velit dolorem quaerat. Dolore sit reprehenderit provident repellendus totam facilis. Libero delectus ipsa occaecati in culpa. Ut omnis sequi soluta ea. Dicta non quo laboriosam voluptatum ratione.', 'dccomics', '', '[]', 1996, 398, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(146, 'Optio fugiat et.', 1040.00, 'Nisi eveniet delectus officiis aut. Id excepturi voluptatum ea quisquam aut quidem. Dolores aut in enim. Veritatis porro voluptas culpa sit debitis. At dolor vero iure natus quos eum ut. Et qui eaque totam omnis consectetur ut ex. Aspernatur non minus doloribus ut corporis autem. Animi voluptate maxime qui est. Vel excepturi sint tenetur distinctio exercitationem incidunt. Deleniti corporis autem qui omnis. Repellat nobis porro quis voluptatem exercitationem ab natus veritatis. Consequatur molestias nihil temporibus aut doloribus et ab. Omnis natus dolor quia qui.', 'manga', '', '[]', 2017, 442, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(147, 'In deleniti blanditiis sed est.', 1858.00, 'Veritatis aliquid architecto perferendis qui id similique nisi. Necessitatibus autem sint enim et. Ut iste quisquam veritatis. Quibusdam aut qui qui nihil rerum iure quidem rerum. Iure consequatur voluptatem blanditiis et molestias. Eum ab exercitationem in ipsam modi. Labore voluptatem quisquam aliquid. Ut perferendis dolor qui voluptas ipsam. Ut nostrum eveniet quaerat repudiandae neque architecto quo. Possimus qui dolorem porro illum sit tenetur. Debitis libero cum quaerat reprehenderit. Sed vero fugit esse eveniet qui. Non sed laboriosam repellendus perspiciatis.', 'dccomics', '', '[]', 2007, 370, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(148, 'Iure tenetur incidunt reprehenderit.', 1282.00, 'Eos qui atque maiores dolor iste. Voluptatem ex molestias accusantium est quis. Vel ratione sed consectetur vero maxime qui minima. Modi quisquam incidunt neque eum natus. Et autem mollitia maxime molestiae. Est nulla iste vitae adipisci placeat. Totam eveniet sunt blanditiis veniam fuga ut. Odio autem ut voluptate molestias et repellendus aspernatur.', 'marvel', '', '[]', 2002, 298, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(149, 'Est aut commodi est explicabo.', 1038.00, 'Porro ex rerum numquam blanditiis qui temporibus. Est ut sunt unde illo. Nulla odio adipisci provident dolore. Saepe facere amet accusamus odit fuga harum quia. Incidunt enim eos quasi fugit enim. Praesentium nemo et veritatis perferendis. Deserunt tempore voluptatem incidunt odit id. Ducimus fugiat esse iste voluptas quasi ut facilis. Aut corporis eum placeat eum est aperiam. Rerum quos sunt dolor facilis. Dolores expedita occaecati magni voluptatum nihil ut. Et sunt accusamus quam optio. Ab nemo officiis consequatur. Dolor est unde error vel aut et hic blanditiis.', 'architecture', '', '[]', 2006, 379, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(150, 'Aliquid inventore mollitia pariatur eum.', 1935.00, 'Et in iusto ut enim libero. Assumenda consectetur alias rerum amet. Consequatur molestiae a qui voluptatem quaerat. Occaecati qui voluptas voluptatem ipsum illum. Aspernatur aperiam maiores quisquam dolorum itaque corporis velit. Aliquam dolorem dolore quia magnam dolore iste. Magnam est et cum explicabo. Incidunt ipsum voluptatem similique dolorum aliquam. Ut et minus non vero. Sunt aut aliquam in unde ullam vel neque. Corrupti et distinctio dolor aut neque blanditiis.', 'manga', '', '[]', 1998, 160, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(151, 'Beatae.', 780.00, 'Accusantium praesentium cupiditate qui at incidunt esse nesciunt. Quia tempore officiis qui labore. Dolore omnis consequatur ut sit. Et dolor vitae possimus maiores suscipit aspernatur dolores. Dignissimos rerum velit vel est beatae ipsum eius quasi. Sed odit iure minus aperiam architecto laudantium. Libero ipsum aut quidem omnis vel. Odit et consequuntur natus veritatis amet quo. Tempora sed eligendi nisi. Voluptatibus consequatur architecto labore explicabo dolorum. Recusandae et rerum omnis occaecati repellat. Vero minima ex libero incidunt. Modi et perspiciatis fuga expedita.', 'dlyadetei', '', '[]', 2017, 276, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(152, 'Iure doloribus in dolorum.', 740.00, 'Aut maxime omnis ullam voluptatem. Fugit est libero enim dolores accusantium dignissimos sint. Ratione quis accusamus ut consequatur voluptate quos ipsum. Qui qui non qui quia dolorem. Et praesentium qui error quidem. Ut quia id deleniti modi. Adipisci ipsam labore blanditiis repellat placeat consequatur vitae. Aut fugiat quis dicta aut consequatur sit eum. Incidunt illum nemo dolore ut.', 'dccomics', '', '[]', 2013, 464, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(153, 'Cupiditate eius consectetur.', 862.00, 'Dignissimos voluptatem porro distinctio. Quam rerum dolorem aliquid a repellat tempora. Voluptatum sit et reiciendis optio molestiae provident libero. Excepturi nisi nesciunt veritatis quo deserunt. Sint quo sunt tempora blanditiis incidunt libero facere. Amet fugiat ipsa eum voluptatem consequatur molestias. Dolor tempore perspiciatis neque. Commodi omnis officia quae incidunt odio cupiditate. Nostrum aut velit est perferendis. Natus tempora molestiae et natus voluptatum reprehenderit aliquam.', 'web', '', '[]', 1994, 306, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56');
INSERT INTO `products` (`id`, `title`, `price`, `description`, `subcategory_slug`, `picture`, `pictures`, `year`, `pages`, `cover_id`, `created_at`, `updated_at`) VALUES
(154, 'Aut facilis velit ex repudiandae reprehenderit quisquam.', 804.00, 'Earum maiores velit odit saepe occaecati doloremque voluptatibus. A hic rerum qui nemo explicabo. Totam velit dolorem sequi excepturi similique eaque. Facilis ea sit quibusdam adipisci. Aliquam autem expedita non nisi sit vel cumque. Expedita qui molestiae eligendi. Et repellendus animi hic voluptatem aut dolores esse ratione. Harum sed beatae eos et. Aspernatur placeat qui molestiae iusto. Qui voluptatem est enim natus fuga totam consequatur. Laborum eum ad aut qui expedita nulla. Ratione officiis velit cum dolorem.', 'dccomics', '', '[]', 1992, 272, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(155, 'Odio et consectetur in.', 1754.00, 'Excepturi libero commodi dolorem ea iste eum aut. Quam sint veritatis dolores accusamus qui. Voluptas at expedita quia. Suscipit ut dicta et numquam laborum. Aut sequi aut maiores nam et consequatur. Aut aliquam est vero qui asperiores a ad. Quidem modi nesciunt illo facilis error. Nemo expedita voluptatum dolor blanditiis beatae. Sequi ut et dolores velit vitae. Et hic numquam in ipsam eius quod quidem. Tempora aut labore ullam non non. Voluptates nisi modi accusantium.', 'manga', '', '[]', 2009, 339, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(156, 'Est dolor dolor at.', 1579.00, 'Beatae culpa et tenetur et qui doloremque dolorem. Possimus et ut perspiciatis quasi dolorem voluptatem. Deserunt molestiae officiis odio odio rerum rerum. At quo et inventore molestiae hic nobis corrupti. Fuga cumque ut a praesentium incidunt voluptate. Tempora unde corrupti debitis assumenda. Ipsum rerum repellendus fugiat et magni mollitia velit. Quibusdam in quam voluptates minus ad. Eaque dignissimos eos deserunt. Aut quos recusandae eveniet quam. Est culpa illo debitis ut dicta porro. Quo molestias assumenda aspernatur vitae repudiandae aperiam.', 'web', '', '[]', 2008, 491, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(157, 'Dolores similique dolorum delectus.', 1144.00, 'Laudantium corrupti fugit et qui iusto non delectus. Aut enim temporibus autem veritatis est magni. Incidunt eum officiis numquam dolorem qui. Consequatur blanditiis quibusdam aut amet et illum sunt. Et atque tenetur vero et animi adipisci quia ex. Possimus omnis dolor debitis quibusdam. Ea quasi id magnam quia autem culpa sint iste. Consequatur accusantium deleniti optio magnam et consequatur ut dolores. Aut ratione tempore repellat ipsam est velit tempora. Molestias officia veniam quos iste.', 'dccomics', '', '[]', 2011, 233, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(158, 'Dolorum enim.', 1583.00, 'Aut dolor necessitatibus esse magni et iste. Inventore ipsam rem saepe itaque ut et. Itaque et occaecati neque dolores dolor quasi tempora earum. Quis ratione accusamus voluptatem ea perferendis. Eveniet dolores aut libero cumque sunt repellat doloremque. Commodi inventore est esse magni expedita quo occaecati. Minima aut totam doloribus aut tempora. Fugiat soluta ut fugit inventore. Omnis rerum unde sed aperiam et dicta. Quaerat eaque sed quisquam cupiditate et aut. Consequuntur tenetur autem est omnis dolores repudiandae. Voluptatem eaque velit quia ad dolor itaque rem magnam.', 'web', '', '[]', 2002, 180, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(159, 'Rerum voluptas saepe dolor ad laboriosam minus.', 1319.00, 'Dignissimos quia quo est libero. Vero corporis doloribus in vero voluptate. Itaque corporis aliquid quas et at aut. Nam deserunt eius repellat sit et excepturi harum. Doloribus et voluptatibus itaque veniam. Temporibus quaerat officiis minima vel earum et nam. Soluta sed qui nemo quo nemo. Doloremque soluta veritatis non. In eaque veniam recusandae dolores expedita. Delectus tempora vero et. Aut consequatur et illum quia. Cupiditate et deserunt atque ex dolore incidunt.', 'web', '', '[]', 2007, 230, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(160, 'Deleniti porro provident et.', 860.00, 'Quae maxime ut ea repudiandae dolorem tempore maiores. Hic corrupti doloremque aut aut assumenda. Dolores consequatur libero unde magni rerum molestiae similique esse. Consequatur iste minus veritatis mollitia omnis beatae et. Quasi voluptatibus praesentium accusamus quisquam libero expedita ipsum. Non voluptas sed placeat. Voluptas dolores facere saepe voluptate. Omnis voluptatum libero enim labore voluptate error consequuntur. Qui quia voluptatum consequatur ipsam. At perferendis enim qui velit libero minima. Fugit ut tempore ipsum. Nam possimus qui ipsa delectus.', 'dccomics', '', '[]', 1992, 440, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(161, 'Adipisci eveniet et.', 905.00, 'Sit eos vero illo nesciunt. Debitis aliquam qui at laboriosam cupiditate autem dolore. Qui corrupti voluptas est qui. Qui voluptas numquam voluptas est libero ut a repellat. Laudantium quo molestiae enim qui magni. Quis quia non itaque nam. Laudantium eos cumque dolorum quod rerum molestias quia. Odit porro consequuntur earum necessitatibus autem quia nostrum. Earum eum est sed dolorum aliquid. Enim est ut dolorum vel. Alias est voluptatem aut. Totam dolores qui eveniet et sunt sint. Voluptatem voluptatem dolores et a fuga. Consequatur inventore laudantium ut dolor cumque.', 'web', '', '[]', 2003, 284, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(162, 'Provident ipsum quae officia commodi odio.', 1433.00, 'Magni voluptas quaerat sit. Rerum accusantium ab quasi cumque ullam sed est. Tempore est earum blanditiis doloremque. Aut aliquam quo est vitae. Laboriosam omnis suscipit voluptatem non voluptatem. Ducimus reprehenderit ipsam deleniti mollitia odit hic dolor. Iusto culpa reprehenderit et quo. Totam vero odit laborum sit est. Ratione at aut deserunt et dolore recusandae. Sed modi et dolor voluptas alias enim.', 'architecture', '', '[]', 2013, 154, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(163, 'Sequi earum.', 884.00, 'Repudiandae animi facere alias omnis atque id. In tenetur repellat ut sequi veritatis temporibus. Est alias culpa unde earum aut. Iure aliquam iure et nisi voluptate. Qui reiciendis atque rerum omnis similique eligendi. Molestiae dolor recusandae deserunt. Ea dolores alias itaque optio harum. Porro voluptas ab voluptas enim recusandae. Quam cum velit in eligendi architecto nam qui. Dolore libero perferendis dolor molestiae cumque et. Voluptatibus assumenda velit odit dolores perferendis. Recusandae explicabo dolores corporis voluptatibus autem.', 'manga', '', '[]', 2013, 360, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(164, 'Atque id corporis ipsum.', 1851.00, 'Atque optio autem beatae. Porro sit sunt autem odio omnis. Dolorem at earum ducimus. Sed dolor optio id porro placeat est. Labore autem voluptate commodi nihil eos nesciunt. Sint reprehenderit in incidunt et ut veritatis. Provident sed sed aliquid eos. Aut soluta dignissimos quia quo facilis commodi fuga. Earum nihil et porro laudantium pariatur quia quod. Veniam sint nihil alias sit. Enim non voluptate sint dolores et. Vero voluptatibus voluptas facilis et quaerat quibusdam. Temporibus consectetur laborum sed ratione ullam vel. Provident officia ipsam aut eum laborum quas.', 'dlyadetei', '', '[]', 1999, 543, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(165, 'Minus voluptas in consequatur.', 1080.00, 'Id consequuntur et voluptas molestiae. Facere sed deserunt impedit labore reprehenderit. Architecto impedit placeat omnis debitis perspiciatis unde inventore. Consequuntur adipisci consequatur quaerat quibusdam. Aut sit labore corporis rerum facilis cumque. Deserunt atque veritatis aliquam ex iusto hic. Temporibus dolorem ut at occaecati aut ab totam id. Ad totam qui dolores molestiae necessitatibus natus quasi. Eos consequatur perferendis asperiores distinctio est et architecto. Quis quaerat sed error. Id voluptatum distinctio iste voluptatem et.', 'architecture', '', '[]', 1991, 247, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(166, 'Molestiae quas.', 1307.00, 'Labore accusamus quia alias modi eum nihil. Et rem et omnis doloribus libero itaque provident. Vitae modi deserunt enim sapiente dicta fugit. Ut consequatur ea earum molestias. Rerum cupiditate suscipit molestiae tempore. Provident soluta eligendi est libero dicta sit ratione. Molestiae qui rem voluptatibus voluptas eveniet. Molestiae quae qui perferendis. Est autem vero ipsum autem molestiae quia magni. Assumenda id unde corrupti dolor iure ullam. Nulla sed quas minima sit illo pariatur doloribus.', 'dccomics', '', '[]', 2018, 379, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(167, 'Dolorum iure esse quia.', 905.00, 'Et atque aliquam iusto ut voluptas tempora. Tenetur autem aut sit vero aliquam rerum. Incidunt numquam sint animi. Vero veniam quae non eum ullam. Nam atque occaecati ab dignissimos. Unde qui velit dolor architecto dolores. Aliquid ea deleniti cumque voluptatibus sed. Ea aut amet nihil itaque. Iure necessitatibus vel laboriosam nostrum voluptatem possimus. Voluptatem doloremque ut molestias molestiae non. Sint qui deleniti porro aut. Omnis molestiae laborum fugit totam mollitia ullam et.', 'manga', '', '[]', 1996, 507, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(168, 'Et sed quia sint.', 593.00, 'Rem autem voluptas rem in non. Est ratione blanditiis impedit maiores illum est. Et enim eligendi ullam ut. Vel libero veniam neque occaecati aspernatur id. At in accusantium similique. Nihil ad sint ut autem neque temporibus expedita. Voluptatem magni excepturi numquam voluptate non illum ullam sit. Fugiat ut maiores aut. Reiciendis id pariatur labore perferendis quia. Quia animi voluptatem pariatur aut. Rem et odio ratione veniam fuga aut qui.', 'web', '', '[]', 2008, 454, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(169, 'Perspiciatis labore ut aspernatur dolorum.', 1488.00, 'Eum laborum facilis molestias assumenda architecto. Consequatur sed et quibusdam. Aut tempore voluptas veniam unde. Quia voluptas corporis hic voluptas dignissimos eligendi. Perferendis quasi et aut quis. Placeat necessitatibus sunt ipsa eius. Accusamus voluptatem qui amet commodi. Est ut debitis sequi labore velit. Perferendis amet quia error ullam aut enim. Voluptatem et incidunt atque aut repellendus.', 'web', '', '[]', 1992, 430, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(170, 'Doloremque et expedita libero non.', 580.00, 'Aut aliquid exercitationem provident perspiciatis nam amet. Eum officia magni odio sapiente reiciendis perspiciatis enim. Ut impedit voluptatem et error eaque molestias. Est id ut voluptas similique consequatur perspiciatis enim. Unde perferendis rerum aut laboriosam eum consequuntur. Et occaecati possimus illo dolore quis. Iusto hic a ut sit. Maxime omnis ea eaque est eos quod. Quam nihil perferendis quo debitis aperiam dolore. Voluptatum non ullam fugit dolorum delectus. Temporibus temporibus eum autem est sit quo totam culpa. Aut vitae laudantium ut.', 'europe', '', '[]', 1993, 335, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(171, 'Placeat omnis qui facilis eius.', 765.00, 'Quia repellat ducimus nostrum exercitationem est omnis est. Adipisci molestiae et rerum magnam repellat ut laborum. Voluptatem sed voluptatum sequi occaecati ut optio voluptas. Et amet odio eos magni est. Omnis perspiciatis in et nisi. Culpa omnis blanditiis ut rerum et. Officiis aut aspernatur voluptatem. Cupiditate nihil est tenetur quia. Sit explicabo et eligendi suscipit. Iure quo sunt magnam laboriosam omnis. Itaque distinctio ratione quo facilis unde rem necessitatibus. Explicabo fugiat ut vitae nam at voluptas. Laborum accusantium corrupti dolores nesciunt quidem.', 'web', '', '[]', 2013, 291, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(172, 'Dicta.', 976.00, 'Corporis sequi beatae quidem eos vel dolor. Recusandae est aut accusantium tempora quis rerum. Aut illo nobis voluptates soluta expedita. Est qui et eveniet. Ut facere animi illo voluptatum ipsa provident. Distinctio nam perspiciatis amet aut sapiente. Sed occaecati occaecati vel sint ut saepe. Ex consequatur minima est eveniet neque. Quidem quia optio et tenetur. Debitis laudantium ad sed reiciendis esse nisi dolorem. Quia porro praesentium aut magnam inventore. Inventore culpa quas eaque voluptatem eum placeat quaerat ipsum. Quo id est iusto id. Modi reiciendis ipsum atque qui libero.', 'architecture', '', '[]', 2011, 317, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(173, 'Et veniam corporis adipisci adipisci rerum qui.', 1645.00, 'Est iure cupiditate sit praesentium eum dolores dolorem eum. Libero ut assumenda rerum quos voluptatem quia et. Nemo saepe atque dolor occaecati tenetur. At quia ipsum aut nostrum est veritatis. Accusamus doloremque consequatur eveniet nemo. Enim et natus officiis debitis rem. Quas excepturi totam dolore dicta ad excepturi. Ut et sint laboriosam similique et illum cupiditate. Velit sunt aut maiores nesciunt qui quo. Vel exercitationem dolorum eveniet eligendi quasi impedit. Necessitatibus et expedita non itaque repellendus mollitia. Voluptate autem minima dolorem tenetur quas omnis cumque.', 'europe', '', '[]', 2013, 258, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(174, 'Enim dolore.', 585.00, 'Debitis pariatur quas minima quasi quasi. Et pariatur possimus ipsum assumenda laboriosam. Odio aut nisi ut voluptates porro ducimus consequuntur. Laudantium cupiditate ab nisi est. Ullam aliquid rerum nobis odit cumque et. Eveniet molestias hic ut. Rerum et occaecati magni libero non quae. Voluptas totam architecto necessitatibus qui reiciendis laboriosam omnis. Ratione et eum est et ut est ad. Dolorem ut at voluptas beatae tenetur. Deleniti eum aliquid voluptas quas officiis omnis.', 'dccomics', '', '[]', 2002, 411, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(175, 'Inventore laudantium magnam explicabo placeat.', 864.00, 'Sunt autem unde rerum vitae nostrum consequatur quis. Quo recusandae distinctio ea est exercitationem fugiat dignissimos. Dolor quidem aut sapiente nemo placeat enim quo sint. Non molestias maiores saepe. Aut at animi unde consequatur repellat. Sed alias tempore itaque. Et laboriosam voluptatem veritatis unde. Veniam repellat eaque expedita est. Incidunt sed et nesciunt neque fuga eligendi aliquid nemo. Vitae qui accusantium ut et magni saepe ea. Facere dolorem laudantium est inventore libero. Iste repellat nam dolor provident voluptatem. Rerum sequi esse qui voluptatibus.', 'europe', '', '[]', 2004, 333, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(176, 'Voluptatem ea quia.', 999.00, 'Ut odit ratione maiores perspiciatis corrupti accusantium consequatur fugit. Consequuntur architecto porro doloremque officia aperiam deleniti voluptatum. Odit suscipit voluptate possimus aut. Ut quo minus voluptate autem. Sapiente quas commodi esse eveniet reiciendis at. Animi quia magni corrupti et alias. Qui sunt in id ipsa omnis. Pariatur sit voluptatibus omnis ut error a. Aut repellendus ullam aut nam cumque vitae ut occaecati. Velit harum consequatur ipsam eligendi eveniet in. Impedit delectus et et voluptatibus.', 'web', '', '[]', 2012, 382, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(177, 'Consequuntur tempora facilis.', 1757.00, 'Nihil est molestias facere voluptatum et. Rerum rem impedit eos et magni minima expedita. Rerum itaque quod eos beatae. Amet pariatur harum porro. Et fugit sed ullam fugit eos. Nesciunt quidem magni iure voluptatem voluptas cum molestiae. Iusto et molestias quas et quod rerum id neque. Inventore pariatur voluptate molestias aspernatur qui consequatur. Aut ut tempora voluptates ea similique nulla nam. Aperiam commodi harum eius. Officiis ut eos eos eligendi. Ab hic velit saepe aliquid at fugit non neque. Ut reprehenderit voluptas quia dolorem officiis repudiandae.', 'web', '', '[]', 2009, 333, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(178, 'Aliquam animi.', 914.00, 'Ipsa corporis ipsam odit recusandae soluta. Quos distinctio quam perferendis quae dignissimos qui. Ea vel laboriosam saepe. Consequatur quis numquam accusantium corrupti magni. Velit temporibus et veniam iure consectetur ab fugiat eum. Ut molestiae dignissimos qui dolorem. Et commodi fugiat magni rerum quia animi quam et. Facere est facilis aut deserunt non dignissimos. Suscipit culpa exercitationem et eius. Eaque et dolorem ducimus id voluptate. Sint sed voluptas repellat culpa sed provident.', 'dccomics', '', '[]', 2018, 386, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(179, 'Odit vel repudiandae dolor.', 1903.00, 'Earum quis beatae molestias enim sequi impedit. Excepturi tempora molestiae vitae ut. Voluptatibus rerum ut ex dolore sunt sed. Harum voluptatem et voluptas veniam. Et sint ipsa ea hic. Numquam blanditiis rerum et rerum in nostrum provident. Magnam nostrum incidunt et enim. Officiis vel voluptas quia at ut. Est consequatur nobis aspernatur eos quia aliquam. Quis facilis ad ut exercitationem consequatur velit.', 'marvel', '', '[]', 2011, 151, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(180, 'Et ut veniam.', 572.00, 'Aut consectetur perspiciatis qui libero eos. Temporibus aliquid saepe labore blanditiis. Quidem veniam aut nemo libero laudantium aut delectus non. Porro debitis voluptas voluptatem eaque quaerat est sunt. Impedit explicabo cupiditate dolorem. Reprehenderit sunt consequatur sunt animi non tempora. Quis et in consectetur architecto voluptas. Nihil autem dolor id nesciunt voluptas sed. Maiores omnis assumenda aut minima vitae exercitationem voluptas. Sapiente repudiandae est voluptas nesciunt quia repudiandae. Similique dolorem natus in. Iste neque doloribus officiis distinctio culpa.', 'europe', '', '[]', 2015, 401, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(181, 'Maiores unde autem nemo.', 1743.00, 'Necessitatibus dolor enim autem velit est rerum accusantium. Aut modi quisquam recusandae est omnis assumenda. Autem consequatur maiores alias id ut. Quod necessitatibus quas ducimus illum rem perferendis. Molestiae eos eius vel minima minima enim neque. Dolorem soluta voluptas nemo aut itaque. Magnam est et tempora et. Ab et sed ut aliquid fugit omnis est. Dolorem amet id saepe voluptatem assumenda. Impedit occaecati est architecto iusto. Temporibus nam voluptatibus qui harum sint est et. Exercitationem qui molestiae reprehenderit. Quasi voluptas et sequi. Tempore inventore dicta culpa.', 'dlyadetei', '', '[]', 1998, 530, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(182, 'Consequatur dolores nulla.', 1017.00, 'Consequatur molestiae reiciendis tempore hic. Reprehenderit temporibus quos earum. Voluptatem quia aut quis dolorem. Omnis et rerum in atque nesciunt doloribus consequatur. Ea nihil rerum dolores adipisci veniam aliquid. Ullam aut nisi voluptas pariatur. Vero est et a fuga laudantium. Autem saepe est libero veritatis nulla facere. Similique optio aut quia dolorum omnis. Est iusto architecto consequatur enim numquam. Ut omnis quae iure cum laborum. Mollitia in temporibus et ea impedit. Rem autem delectus distinctio vitae quaerat vel. Vitae assumenda voluptatibus voluptate qui.', 'architecture', '', '[]', 2003, 477, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(183, 'Quibusdam iusto doloremque aut aliquam alias ipsum quas.', 943.00, 'Ea eius nihil autem accusantium nihil omnis adipisci aut. Dolor itaque maiores qui est rem minus. Nihil laborum quis autem et unde neque atque harum. Omnis tenetur eligendi laboriosam repellat sit iure. Vitae similique dolorem et illum reprehenderit maiores porro quo. Qui itaque inventore non omnis rerum dolorum. Aliquid et amet sunt totam rerum rerum. Quasi et sunt veniam sed officiis ullam. Nesciunt sed nihil fugiat et suscipit. Deleniti facilis est voluptas quo nemo.', 'dlyadetei', '', '[]', 1996, 531, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(184, 'Magnam minus veritatis occaecati.', 1583.00, 'Molestias veritatis similique quo quisquam. Nemo magnam iusto quia inventore. Omnis incidunt quam aspernatur velit. Iste qui aut recusandae eos dolorem debitis sed. Temporibus quis consectetur impedit cupiditate eum. Repellendus corrupti totam perferendis iste numquam. Ipsa temporibus id ab et sunt accusamus. Quibusdam et accusamus sint et. Officia distinctio sunt recusandae temporibus. Ut aut officiis quae harum velit. Dignissimos voluptas et iste officia corrupti. Dolores voluptatem occaecati et. Aut nostrum aliquid accusantium quia numquam ipsa.', 'web', '', '[]', 2004, 169, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(185, 'Repellendus officia omnis.', 1302.00, 'Corporis qui in ex reiciendis incidunt. Natus id accusantium quod ut iusto expedita. Ea nostrum aspernatur consequatur non facilis molestiae pariatur molestias. Voluptate et harum qui labore. Nihil id dolore quidem aut dolore quisquam. Commodi velit numquam consectetur enim. Possimus velit harum reprehenderit omnis suscipit non. Qui dolorem provident nihil. In odit est ut. Iusto et sunt aut possimus excepturi maiores doloremque sint. Ut est dolorum distinctio nam eum. Id suscipit sed tempore fuga enim autem suscipit.', 'architecture', '', '[]', 2008, 372, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(186, 'Quidem doloremque est a quia.', 1079.00, 'Doloremque veritatis sit inventore perferendis rerum a et. Corporis rerum numquam magnam. Et laboriosam ipsam assumenda fugit veniam quae. Itaque hic sit sunt ducimus praesentium. Aut non quae est temporibus debitis facilis in. Et cum sequi occaecati et et nostrum inventore. Modi facere dolor minima impedit doloribus iste. Velit dolores ut similique veniam. Dolorem distinctio corporis minima quia. Fugit sit minima deserunt eos perferendis.', 'dlyadetei', '', '[]', 2003, 484, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(187, 'Quod culpa non sunt.', 1384.00, 'Omnis et autem saepe rerum dolorum atque. Qui ex libero repellendus similique perspiciatis. Incidunt natus omnis error. Nesciunt cum dolor qui voluptatum. Quam rem aut reprehenderit perferendis accusamus. Velit aliquid autem expedita. Ad qui provident corporis saepe unde. Molestias excepturi id voluptas doloribus nulla omnis exercitationem. Sint similique perferendis sit autem et reiciendis. Perferendis ut vel omnis dolorem ipsam optio et. Vel est nostrum natus consequatur. Aut voluptatem unde iure et facilis ut. Non hic ea sequi omnis dolorem consequatur.', 'europe', '', '[]', 2015, 328, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(188, 'At doloremque.', 1534.00, 'In quidem voluptas sint. Aut voluptas excepturi omnis reprehenderit. Voluptate pariatur in sequi omnis fugiat. Nostrum odio eligendi aut quam reprehenderit deleniti aliquid. Atque ut fuga reiciendis accusantium est nisi asperiores. Consequatur saepe dolorem qui illum deserunt. Quia eligendi repellendus sint molestias. Quod officia recusandae laborum dolorum. Est dolor expedita sint sapiente vitae necessitatibus. Natus doloribus quo quam porro et natus molestiae expedita. Veniam quisquam consectetur consequatur sunt et nemo. Repudiandae enim et quos et officia veniam placeat.', 'manga', '', '[]', 1993, 274, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(189, 'Iusto libero sed eos hic consectetur dolorem a.', 1699.00, 'Quas odio id velit molestiae eum in. Ea hic non sed reprehenderit mollitia qui. Nisi quia qui qui ut omnis consequatur voluptas. Dolores amet aut totam natus nisi qui dolores. Voluptate quisquam eum est debitis est iure. Quo doloribus sint illum voluptatem illo. Dolorem aliquid vel nihil laudantium reprehenderit. Et corrupti error saepe vel hic. Ut suscipit aut quo est minus et quas minus. Aperiam similique iusto quibusdam amet odio eius velit dolore. Nam est facilis aut. Eum fugit cum non ea nulla distinctio molestiae ex.', 'europe', '', '[]', 2019, 409, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(190, 'Tempora nemo velit.', 595.00, 'Expedita est corrupti possimus voluptatum aspernatur vitae. Veniam neque doloribus dolores itaque. Animi voluptas omnis repudiandae aut reprehenderit. Ullam ipsum ut dignissimos aut laborum. Autem beatae facere ex recusandae maxime. Iusto autem est nisi. Sint laborum cumque repellendus et rerum voluptatibus similique. Ut praesentium molestias quibusdam maxime illum deleniti aut sed.', 'europe', '', '[]', 2002, 174, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(191, 'Minima qui dolore.', 641.00, 'Ex voluptas at quasi explicabo sunt corporis. Quod tenetur sint blanditiis ut dolores quas similique. Numquam corrupti quasi impedit. Assumenda repudiandae qui nihil minus vel. Officia nihil consequatur quo repudiandae. At quae sint sunt vitae voluptatibus. Magni similique est sit odio. Officia aut magni quis nihil ea aut. Minus provident fugiat dignissimos dolore aut. Facilis ut laboriosam aut debitis unde impedit ratione. Quia excepturi omnis molestiae doloremque nihil consequatur quas. Corporis sint at esse occaecati.', 'architecture', '', '[]', 2014, 548, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(192, 'Sed aut saepe.', 1873.00, 'Laboriosam saepe et iure alias. Aperiam deleniti dolore et. Reprehenderit dignissimos quisquam ex blanditiis ut maxime ea earum. Nisi rerum nostrum dolorem praesentium. Tenetur quidem sunt magnam sequi. Nobis quo nemo amet sapiente sint sequi qui. Perspiciatis fugit facilis nobis esse. Repellat id dolor possimus beatae explicabo. Quos ratione illo sed corrupti sed. Quidem officiis veritatis est recusandae quisquam reiciendis. Qui adipisci voluptatem quaerat. Illum ab doloribus enim nemo repellat dolor expedita.', 'manga', '', '[]', 2012, 524, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(193, 'Laborum.', 1716.00, 'A excepturi repellat velit beatae fugit. Id rem omnis ut vitae. Sed libero ipsa rerum tempore vel quia. Officia magni natus maiores voluptates earum ab dolorem. Suscipit alias exercitationem omnis laborum debitis architecto qui. Qui consequatur non deleniti voluptas quas porro. Earum voluptas illum fuga dolorem repudiandae. Vel reiciendis aut corporis inventore officia tenetur voluptatem. Hic laudantium eveniet quis. Illo ipsum blanditiis nam non quo sunt. Quidem in molestiae iste est. Repellat illum enim quo numquam rerum.', 'manga', '', '[]', 2020, 495, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(194, 'Quo.', 761.00, 'Sed esse distinctio aut voluptatem at non. Deserunt deleniti atque eius tempora impedit et et. Omnis non quaerat maxime non autem voluptas aut. Aut commodi veritatis saepe iste est officiis. Tempore sequi sit iste ab dicta. Quod occaecati optio amet amet ullam. Consequatur quia hic omnis aut. Nam amet mollitia sint corrupti sed amet sunt quia. Nesciunt tempora id quam in occaecati. Aliquam qui labore voluptates aut. Qui ullam et ad soluta. Iste rerum suscipit magnam ratione. Quod impedit ut qui provident. Dolorem nemo cumque omnis deserunt.', 'marvel', '', '[]', 2014, 295, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(195, 'Ratione vel dolorem.', 849.00, 'Iure labore optio fugit laborum. Et recusandae autem earum magnam voluptate quo et veniam. Doloribus molestiae ut qui eaque nemo sit. A vero deserunt quia iste doloribus. Ipsa modi provident consectetur fuga culpa. Maiores quis temporibus occaecati hic. Tempora dolor ratione odit a. Iste saepe vel sunt ullam id. Sapiente autem quis ut necessitatibus voluptatem facilis cupiditate aut. Et beatae officiis distinctio ex veniam. Tempora quia quia vel vitae. Accusamus omnis consequatur ut est iusto aut.', 'europe', '', '[]', 1995, 507, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(196, 'Molestias enim et.', 1151.00, 'Blanditiis excepturi qui cumque magnam voluptatem id. Ut corrupti voluptates autem ut tempora. Nihil exercitationem porro corrupti veniam. Et voluptates repellendus id rerum magnam sunt sapiente. Accusamus exercitationem quia corporis inventore ducimus. Distinctio quae omnis enim ut sit et vero. Quas est numquam aliquid omnis. Sequi repudiandae culpa ipsa quas. Reprehenderit nihil placeat officiis eum maxime. Eos alias quam et labore tenetur sunt ea. Modi reiciendis unde perferendis sunt perspiciatis commodi sed molestias.', 'dccomics', '', '[]', 2014, 522, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(197, 'Deserunt dolorum ipsam consequatur architecto.', 1380.00, 'Maxime alias tenetur molestiae unde voluptate nesciunt. Et minima odio rerum accusamus est blanditiis incidunt. Qui ad nobis facere quam tempora voluptates hic. Sit velit porro sed qui vel necessitatibus. Itaque enim labore ea incidunt expedita porro. Ad dolore quia dolore qui enim voluptas. Perferendis rerum explicabo natus ea ex et. Inventore ullam corporis ad exercitationem qui. Ipsum non voluptas quibusdam tempora. Excepturi vero sequi provident excepturi dignissimos molestias. Nulla aliquid dignissimos quibusdam aliquam consequuntur.', 'marvel', '', '[]', 2015, 458, 2, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(198, 'Voluptatem.', 1510.00, 'Voluptates distinctio pariatur optio minima sed quia. Ut quibusdam aspernatur rem rerum aut aperiam. Ratione quam commodi ipsa voluptatem cum quos. Enim illo delectus hic culpa. Quo numquam nesciunt non sunt. Mollitia porro necessitatibus eaque optio laborum incidunt. Aliquid eaque nihil eaque soluta eum laborum. Molestias dolores nobis dolorem in quidem qui. Et ut omnis nemo ut. Ipsam quis consequatur debitis itaque sint. Optio dolorem velit omnis voluptatum.', 'dccomics', '', '[]', 2001, 516, 1, '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(201, 'Разработка на JavaScript. Построение кроссплатформенных приложений с помощью GraphQL, React, React Native и Electron', 1500.00, 'Что такое современный JavaScript? Когда-то он просто добавлял интерактивности к окнам веб-браузера, а теперь превратился в основательный фундамент мощного и надежного софта. Разработчики любого уровня смогут использовать JavaScript для создания API, веб-, мобильных и десктопных приложений.\nВ этой книге:\n- Работа с данными с помощью GraphQL.\n- Аутентификация для API, веб- и нативных приложений.\n- Создание высокопроизводительных веб-приложений\n- Разработка кроссплатформенных приложений под iOS и Android\n- Создание десктопных приложений.', 'web', '1636366588_thumbnail_razr_js.jpg', '[\"1636366588_razr_js.jpg\"]', 2021, 320, 2, '2021-11-08 07:16:28', '2021-11-08 07:16:28'),
(202, 'JavaScript. Полное руководство: Справочник по самому популярному языку программирования', 2000.00, 'JavaScript — это язык программирования для веб-сети, который в настоящее время используется большим количеством разработчиков программного обеспечения, чем любой другой язык программирования. В течение почти 25 лет этот бестселлер служил исчерпывающим руководством для программистов на JavaScript, и новое издание книги полностью обновлено с целью охвата версии 2020 языка JavaScript. Повсюду в книге вы будете находить яркие и привлекательные примеры кода. Вам также предлагаются новые главы, в которых раскрываются классы, модули, итераторы, генераторы, объекты Promise и async/await.\n\nКнига предназначена для программистов, желающих изучить язык JavaScript, и для разработчиков веб-приложений, которые стремятся повысить уровень своих знаний и мастерства.', 'web', '1636391818_thumbnail_джаваскрипт.jpg', '[\"1636391818_\\u0434\\u0436\\u0430\\u0432\\u0430\\u0441\\u043a\\u0440\\u0438\\u043f\\u0442.jpg\"]', 2021, 750, 1, '2021-11-08 14:16:58', '2021-11-08 14:16:58'),
(203, 'Как создать сайт. Комикс-путеводитель по HTML, CSS и WordPress', 600.00, 'Пытаясь сделать сайт для своего портфолио, художница Ким попадает на удивительную планету. Чтобы вернуться домой, ей придется выучить азы HTML, победить злобного дракона 404, подружиться с веб-гуру и доброй колдуньей CSS и выяснить, что таится за стенами WordPress-сити.\n\nВ формате увлекательного комикса книга познакомит детей с языками HTML и CSS, а также с конструктором сайтов WordPress.', 'dlyadetei', '1636401031_thumbnail_каксоздатьсайт.jpg', '[\"1636401031_\\u043a\\u0430\\u043a\\u0441\\u043e\\u0437\\u0434\\u0430\\u0442\\u044c\\u0441\\u0430\\u0439\\u0442.jpg\"]', 2015, 266, 2, '2021-11-08 16:50:31', '2021-11-08 16:50:31'),
(204, 'Занимательное программирование. Базы данных', 660.00, 'Простой, последовательный, наглядный и необременительный путь изучения основ информатики! Читай комиксы манга и становись отличником!\n\nУ принцессы Руруны и Кейна возникла проблема: в их торгующей фруктами империи царит неразбериха из-за противоречивых данных, и поэтому дыни подменяются яблоками и клубникой, что вызывает большие трудности в работе. И что же им делать? Конечно же, построить реляционную базу данных, и поможет им в этом Тико, чудесная фея баз данных. Она покажет Руруне и Кейну, как создать базу данных, которая поможет управлять продажами, реализацией товара и его экспортом. Вы узнаете, как работает база данных, и поймёте значение таких терминов, как схемы, ключи, нормализация и транзакции. Если у вас голова идёт кругом, когда речь заходит о базах данных, или же вы просто заплутали в лабиринте чисел и данных, которые, как вам кажется, неподвластны контролю, присоединяйтесь к Руруне и Кейну.', 'dlyadetei', '1636401097_thumbnail_занимпрогр.jpg', '[\"1636401097_\\u0437\\u0430\\u043d\\u0438\\u043c\\u043f\\u0440\\u043e\\u0433\\u0440.jpg\"]', 2014, 240, 2, '2021-11-08 16:51:37', '2021-11-08 16:51:37'),
(205, 'Город Грехов: Тихая Ночь', 120.00, 'Город Грехов, Порочный Город, мегаполис, даже днем живущий ночной жизнью. Город, населенный сильными и неуправляемыми людьми, уличными хищниками и их жертвами, полицейскими и маньяками; город, душа которого опрокинута во тьму. Но именно благодаря этой тьме в Порочном Городе так хорошо виден каждый проблеск света, не остаются незамеченными ни самоубийственное благородство вора, ни полоснувшая по женской щеке слеза. Город такого не пропускает. И не прощает...', 'dccomics', '1636401170_thumbnail_sin-city-silent-night_big.jpg', '[\"1636401170_sin-city-silent-night_big.jpg\"]', 1995, 28, 2, '2021-11-08 16:52:50', '2021-11-08 16:52:50'),
(206, 'Джон Константин: Посланник ада', 200.00, 'Серия Hellblazer была задумана создателями как мрачный мистический комикс. Главный герой - Джон Константин - детектив, расследующий дела, связанные с мистикой и сверхъествественным. Духи, демоны, ангелы - с некоторыми из них главный герой знаком лично и даже успел получить врагов среди этой потусторонней братии. Константин нередко использует грязные приемы для достижения целей, хотя и думает, что делает то или иное дело во благо.', 'dccomics', '1636401213_thumbnail_hellblazer-001_big.jpg', '[\"1636401213_hellblazer-001_big.jpg\"]', 1998, 52, 2, '2021-11-08 16:53:33', '2021-11-08 16:53:33'),
(207, 'Хранители. Абсолютное издание', 899.00, 'Уникальное издание культового графического романа, включающее дополнительные материалы и спин-офф выпуски. Самая полная версия мирового супербестселлера!\n\nСамый известный комикс в мире. Бесспорный хит и бессменный лидер продаж. Комикс «Хранители» — обязательная книга на полках всех любителей рисованных историй, а также идеальный выбор для тех, кто хочет начать знакомство с комиксами с чего-то «серьезного». 1985-й год. Супергерои под запретом, кто-то — на пенсии, кто-то — скрывается, кто-то — тайно работает на правительство. Спокойствие в мире висит на волоске. И тут за бывшими мстителями с плащах и масках начинается жестокая охота.\n\nАлан Мур в своей грандиозной истории не только препарирует жанр супергероики с холодностью хирурга, но и поражает воображение читателя яркими образами и персонажами — при помощи художника Дэйва Гиббонса. Многие символы, появившиеся в «Хранителях», прочно вошли в массовую культуру, а влияние самой истории на комиксы сложно переоценить.', 'europe', '1636401275_thumbnail_хранители.jpg', '[\"1636401275_\\u0445\\u0440\\u0430\\u043d\\u0438\\u0442\\u0435\\u043b\\u0438.jpg\"]', 2014, 528, 1, '2021-11-08 16:54:35', '2021-11-08 16:54:35'),
(208, 'One-Punch Man. Книга 1', 650.00, 'Главный герой — Сайтама — обрёл настолько невероятную силу, что ему трудно найти достойного соперника. Ведь любого бойца он отправляет в нокаут с одного удара! Впервые «One-Punch Man» был опубликован в качестве веб-комикса, и уже через три года ремейк истории был опубликован в журнале Weekly Young Jump', 'manga', '1636401333_thumbnail_ванпанчмен1.jpg', '[\"1636401333_\\u0432\\u0430\\u043d\\u043f\\u0430\\u043d\\u0447\\u043c\\u0435\\u043d1.jpg\"]', 2018, 400, 1, '2021-11-08 16:55:33', '2021-11-08 16:55:33'),
(209, 'One-Punch Man. Книга 2', 700.00, 'Сайтама несколько лет геройствовал на досуге, но так и не прославился. Сдав экзамен на квалификацию героя, он стал настоящим профессионалом своего дело. Теперь ему нипочем не только всевозможные чудовища, но даже гигантский метеорит. Жаль, только не все довольны подвигами Сайтамы…', 'manga', '1636401385_thumbnail_ванпанчмен2.jpg', '[\"1636401384_\\u0432\\u0430\\u043d\\u043f\\u0430\\u043d\\u0447\\u043c\\u0435\\u043d2.jpg\"]', 2019, 408, 1, '2021-11-08 16:56:25', '2021-11-08 16:56:25'),
(211, 'Чистый код: создание, анализ и рефакторинг', 999.00, 'Даже плохой программный код может работать. Однако если код не является «чистым», это всегда будет мешать развитию проекта и компании-разработчика, отнимая значительные ресурсы на его поддержку и «укрощение».\n\nЭта книга посвящена хорошему программированию. Она полна реальных примеров кода. Мы будем рассматривать код с различных направлений: сверху вниз, снизу вверх и даже изнутри. Прочитав книгу, вы узнаете много нового о коде. Более того, вы научитесь отличать хороший код от плохого. Вы узнаете, как писать хороший код и как преобразовать плохой код в хороший.\nКнига состоит из трех частей. В первой части излагаются принципы, паттерны и приемы написания чистого кода; приводится большой объем примеров кода. Вторая часть состоит из практических сценариев нарастающей сложности. Каждый сценарий представляет собой упражнение по чистке кода или преобразованию проблемного кода в код с меньшим количеством проблем. Третья часть книги — концентрированное выражение ее сути. Она состоит из одной главы с перечнем эвристических правил и «запахов кода», собранных во время анализа. Эта часть представляет собой базу знаний, описывающую наш путь мышления в процессе чтения, написания и чистки кода.', 'architecture', '1636401818_thumbnail_чистый_код2.jpg', '[\"1636401818_\\u0447\\u0438\\u0441\\u0442\\u044b\\u0439_\\u043a\\u043e\\u04342.jpg\",\"1636401818_\\u0447\\u0438\\u0441\\u0442\\u044b\\u0439_\\u043a\\u043e\\u04341.jpg\"]', 2018, 418, 2, '2021-11-08 16:59:13', '2021-11-08 17:03:38'),
(212, 'Чистая архитектура. Искусство разработки программного обеспечения', 777.00, '«Идеальный программист» и «Чистый код» — легендарные бестселлеры Роберта Мартина — рассказывают, как достичь высот профессионализма. «Чистая архитектура» продолжает эту тему, но не предлагает несколько вариантов в стиле «решай сам», а объясняет, что именно следует делать, по какой причине и почему именно такое решение станет принципиально важным для вашего успеха.\n\nРоберт Мартин дает прямые и лаконичные ответы на ключевые вопросы архитектуры и дизайна. «Чистую архитектуру» обязаны прочитать разработчики всех уровней, системные аналитики, архитекторы и каждый программист, который желает подняться по карьерной лестнице или хотя бы повлиять на людей, которые занимаются данной работой.\n\nВсе архитектуры подчиняются одним и тем же правилам!\nРоберт Мартин (дядюшка Боб)', 'architecture', '1636401591_thumbnail_чистая_архитектура.jpg', '[\"1636401591_\\u0447\\u0438\\u0441\\u0442\\u0430\\u044f_\\u0430\\u0440\\u0445\\u0438\\u0442\\u0435\\u043a\\u0442\\u0443\\u0440\\u0430.jpg\"]', 2018, 356, 2, '2021-11-08 16:59:51', '2021-11-08 16:59:51'),
(213, 'Распределенные данные. Алгоритмы работы современных систем хранения информации', 1599.00, 'Когда дело доходит до выбора, использования и обслуживания базы данных, важно понимать ее внутреннее устройство. Как разобраться в огромном море доступных сегодня распределенных баз данных и инструментов? На что они способны? Чем различаются?\n\nАлекс Петров знакомит нас с концепциями, лежащими в основе внутренних механизмов современных баз данных и хранилищ. Для этого ему пришлось обобщить и систематизировать разрозненную информацию из многочисленных книг, статей, постов и даже из нескольких баз данных с открытым исходным кодом.\nВы узнаете о принципах и концепциях, используемых во всех типах СУБД, с акцентом на подсистеме хранения данных и компонентах, отвечающих за распределение. Эти алгоритмы используются в базах данных, очередях сообщений, планировщиках и в другом важном инфраструктурном программном обеспечении. Вы разберетесь, как работают современные системы хранения информации, и это поможет взвешенно выбирать необходимое программное обеспечение и выявлять потенциальные проблемы.', 'architecture', '1636401654_thumbnail_распределенные_данные.jpg', '[\"1636401654_\\u0440\\u0430\\u0441\\u043f\\u0440\\u0435\\u0434\\u0435\\u043b\\u0435\\u043d\\u043d\\u044b\\u0435_\\u0434\\u0430\\u043d\\u043d\\u044b\\u0435.jpg\"]', 2021, 336, 2, '2021-11-08 17:00:54', '2021-11-08 17:00:54'),
(214, 'Data Science для карьериста', 1799.00, 'Все мы хотим построить успешную карьеру. Как найти ключ к долгосрочному успеху в Data Science? Для этого понадобятся не только технические ноу-хау, но и правильные «мягкие навыки». Лишь объединив оба этих компонента, можно стать востребованным специалистом.\n\nУзнайте, как получить первую работу в Data Science и превратиться в ценного сотрудника высокого уровня! Четкие и простые инструкции научат вас составлять потрясающие резюме и легко проходить самые сложные интервью.\nData Science стремительно меняется, поэтому поддерживать стабильную работу проектов, адаптировать их к потребностям компании и работать со сложными стейкхолдерами не так уж и легко. Опытные дата-сайентисты делятся идеями, которые помогут реализовать ваши ожидания, справиться с неудачами и спланировать карьерный путь.', 'architecture', '1636401714_thumbnail_data_science.jpg', '[\"1636401714_data_science.jpg\"]', 2021, 368, 2, '2021-11-08 17:01:54', '2021-11-08 17:01:54'),
(215, 'Совершенный код: Практическое руководство по разработке программного обеспечения', 999.00, 'Более 10 лет первое издание этой книги считалось одним из лучших практических руководств по программированию. Сейчас эта книга полностью обновлена с учетом современных тенденций и технологий и дополнена сотнями новых примеров, иллюстрирующих искусство и науку программирования. Опираясь на академические исследования, с одной стороны, и практический опыт коммерческих разработок ПО - с другой, автор синтезировал из самых эффективных методик и наиболее эффективных принципов ясное прагматичное руководство. Каков бы ни был ваш профессиональный уровень, с какими бы средствами разработками вы ни работали, какова бы ни была сложность вашего проекта, в этой книге вы найдете нужную информацию, она заставит вас размышлять и поможет создать совершенный код. Изложенные в книге методики и стратегии помогут вам:проектировать с минимальной сложностью и максимальной продуктивностью извлекать выгоду из групповой разработки применять методики защитного программирования, позволяющие избежать ошибок совершенствовать свой код применять методики конструирования, наиболее подходящие для вашего проекта быстро и эффективно производить отладку своевременно и быстро обнаруживать критические проблемы проекта обеспечивать качество на всех стадиях проекта.', 'architecture', '1636401772_thumbnail_совершенный_код.jpg', '[\"1636401772_\\u0441\\u043e\\u0432\\u0435\\u0440\\u0448\\u0435\\u043d\\u043d\\u044b\\u0439_\\u043a\\u043e\\u0434.jpg\"]', 2017, 856, 1, '2021-11-08 17:02:52', '2021-11-08 17:02:52');

-- --------------------------------------------------------

--
-- Структура таблицы `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `body`, `created_at`, `updated_at`) VALUES
(1, 1, 7, '<p>Хорошая книжка, могу посоветовать.</p>\n\n<ol>\n	<li>Толстая, но недорогая</li>\n	<li>Обложка красивая</li>\n	<li>Шрифт крупный, картинки есть</li>\n</ol>', '2021-11-07 16:36:27', '2021-11-07 16:36:27'),
(2, 1, 9, 'Хорошая книжка, читать обязательно.\nХорошая...\nКнижка.', '2021-11-07 16:38:12', '2021-11-07 16:38:12');

-- --------------------------------------------------------

--
-- Структура таблицы `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `ratings`
--

INSERT INTO `ratings` (`id`, `user_id`, `rating`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 'nqtroaslkc1636313839', 5, 7, '2021-11-07 16:37:19', '2021-11-07 16:37:19'),
(2, 'nqtroaslkc1636313839', 5, 211, '2021-11-08 17:03:50', '2021-11-08 17:03:50'),
(3, 'nqtroaslkc1636313839', 4, 208, '2021-11-08 17:04:31', '2021-11-08 17:04:31');

-- --------------------------------------------------------

--
-- Структура таблицы `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `subcategories`
--

INSERT INTO `subcategories` (`id`, `title`, `slug`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Веб', 'web', 1, NULL, NULL),
(2, 'Архитектура', 'architecture', 1, NULL, NULL),
(3, 'Марвел', 'marvel', 2, NULL, NULL),
(4, 'DC Comics', 'dccomics', 2, NULL, NULL),
(5, 'Для детей', 'dlyadetei', 3, NULL, NULL),
(6, 'Манга', 'manga', 4, NULL, NULL),
(7, 'Европейские комиксы', 'europe', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'perferendis', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(2, 'consequatur', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(3, 'quaerat', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(4, 'ea', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(5, 'nisi', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(6, 'expedita', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(7, 'error', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(8, 'sit', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(9, 'autem', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(10, 'voluptatibus', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(11, 'doloremque', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(12, 'sed', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(13, 'assumenda', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(14, 'distinctio', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(15, 'quidem', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(16, 'nobis', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(17, 'dolorem', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(18, 'esse', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(19, 'aut', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(20, 'deleniti', '2021-11-03 05:06:56', '2021-11-03 05:06:56'),
(21, 'JavaScript', '2021-11-08 12:29:19', '2021-11-08 12:29:19'),
(22, 'clean code', '2021-11-08 12:29:48', '2021-11-08 12:29:48');

-- --------------------------------------------------------

--
-- Структура таблицы `tags_products`
--

CREATE TABLE `tags_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `tags_products`
--

INSERT INTO `tags_products` (`id`, `tag_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 20, 1, NULL, NULL),
(2, 10, 2, NULL, NULL),
(3, 3, 3, NULL, NULL),
(4, 14, 4, NULL, NULL),
(5, 11, 5, NULL, NULL),
(6, 16, 6, NULL, NULL),
(7, 2, 7, NULL, NULL),
(8, 12, 8, NULL, NULL),
(9, 5, 9, NULL, NULL),
(10, 18, 10, NULL, NULL),
(11, 9, 11, NULL, NULL),
(12, 3, 12, NULL, NULL),
(13, 9, 13, NULL, NULL),
(14, 4, 14, NULL, NULL),
(15, 8, 15, NULL, NULL),
(16, 15, 16, NULL, NULL),
(17, 20, 17, NULL, NULL),
(18, 4, 18, NULL, NULL),
(19, 2, 19, NULL, NULL),
(20, 16, 20, NULL, NULL),
(21, 11, 21, NULL, NULL),
(22, 20, 22, NULL, NULL),
(23, 6, 23, NULL, NULL),
(24, 11, 24, NULL, NULL),
(25, 20, 25, NULL, NULL),
(26, 4, 26, NULL, NULL),
(27, 7, 27, NULL, NULL),
(28, 10, 28, NULL, NULL),
(29, 20, 29, NULL, NULL),
(30, 18, 30, NULL, NULL),
(31, 17, 31, NULL, NULL),
(32, 13, 32, NULL, NULL),
(33, 19, 33, NULL, NULL),
(34, 12, 34, NULL, NULL),
(35, 7, 35, NULL, NULL),
(36, 11, 36, NULL, NULL),
(37, 19, 37, NULL, NULL),
(38, 13, 38, NULL, NULL),
(39, 12, 39, NULL, NULL),
(40, 8, 40, NULL, NULL),
(41, 7, 41, NULL, NULL),
(42, 20, 42, NULL, NULL),
(43, 9, 43, NULL, NULL),
(44, 13, 44, NULL, NULL),
(45, 13, 45, NULL, NULL),
(46, 9, 46, NULL, NULL),
(47, 14, 47, NULL, NULL),
(48, 13, 48, NULL, NULL),
(49, 5, 49, NULL, NULL),
(50, 16, 50, NULL, NULL),
(51, 14, 51, NULL, NULL),
(52, 20, 52, NULL, NULL),
(53, 13, 53, NULL, NULL),
(54, 3, 54, NULL, NULL),
(55, 7, 55, NULL, NULL),
(56, 7, 56, NULL, NULL),
(57, 16, 57, NULL, NULL),
(58, 17, 58, NULL, NULL),
(59, 5, 59, NULL, NULL),
(60, 4, 60, NULL, NULL),
(61, 10, 61, NULL, NULL),
(62, 7, 62, NULL, NULL),
(63, 7, 63, NULL, NULL),
(64, 10, 64, NULL, NULL),
(65, 12, 65, NULL, NULL),
(66, 11, 66, NULL, NULL),
(67, 7, 67, NULL, NULL),
(68, 2, 68, NULL, NULL),
(69, 6, 69, NULL, NULL),
(70, 20, 70, NULL, NULL),
(71, 8, 71, NULL, NULL),
(72, 1, 72, NULL, NULL),
(73, 12, 73, NULL, NULL),
(74, 16, 74, NULL, NULL),
(75, 3, 75, NULL, NULL),
(76, 2, 76, NULL, NULL),
(77, 11, 77, NULL, NULL),
(78, 9, 78, NULL, NULL),
(79, 13, 79, NULL, NULL),
(80, 9, 80, NULL, NULL),
(81, 16, 81, NULL, NULL),
(82, 18, 82, NULL, NULL),
(83, 16, 83, NULL, NULL),
(84, 3, 84, NULL, NULL),
(85, 19, 85, NULL, NULL),
(86, 18, 86, NULL, NULL),
(87, 18, 87, NULL, NULL),
(88, 13, 88, NULL, NULL),
(89, 7, 89, NULL, NULL),
(90, 3, 90, NULL, NULL),
(91, 5, 91, NULL, NULL),
(92, 7, 92, NULL, NULL),
(93, 17, 93, NULL, NULL),
(94, 16, 94, NULL, NULL),
(95, 19, 95, NULL, NULL),
(96, 10, 96, NULL, NULL),
(97, 7, 97, NULL, NULL),
(98, 14, 98, NULL, NULL),
(99, 12, 99, NULL, NULL),
(100, 18, 100, NULL, NULL),
(101, 5, 101, NULL, NULL),
(102, 9, 102, NULL, NULL),
(103, 11, 103, NULL, NULL),
(104, 18, 104, NULL, NULL),
(105, 12, 105, NULL, NULL),
(106, 2, 106, NULL, NULL),
(107, 19, 107, NULL, NULL),
(108, 2, 108, NULL, NULL),
(109, 12, 109, NULL, NULL),
(110, 12, 110, NULL, NULL),
(111, 8, 111, NULL, NULL),
(112, 18, 112, NULL, NULL),
(113, 10, 113, NULL, NULL),
(114, 8, 114, NULL, NULL),
(115, 3, 115, NULL, NULL),
(116, 12, 116, NULL, NULL),
(117, 18, 117, NULL, NULL),
(118, 3, 118, NULL, NULL),
(119, 17, 119, NULL, NULL),
(120, 13, 120, NULL, NULL),
(121, 14, 121, NULL, NULL),
(122, 3, 122, NULL, NULL),
(123, 13, 123, NULL, NULL),
(124, 13, 124, NULL, NULL),
(125, 12, 125, NULL, NULL),
(126, 3, 126, NULL, NULL),
(127, 10, 127, NULL, NULL),
(128, 1, 128, NULL, NULL),
(129, 14, 129, NULL, NULL),
(130, 7, 130, NULL, NULL),
(131, 12, 131, NULL, NULL),
(132, 14, 132, NULL, NULL),
(133, 13, 133, NULL, NULL),
(134, 12, 134, NULL, NULL),
(135, 1, 135, NULL, NULL),
(136, 4, 136, NULL, NULL),
(137, 2, 137, NULL, NULL),
(138, 14, 138, NULL, NULL),
(139, 10, 139, NULL, NULL),
(140, 17, 140, NULL, NULL),
(141, 3, 141, NULL, NULL),
(142, 20, 142, NULL, NULL),
(143, 2, 143, NULL, NULL),
(144, 18, 144, NULL, NULL),
(145, 10, 145, NULL, NULL),
(146, 3, 146, NULL, NULL),
(147, 4, 147, NULL, NULL),
(148, 11, 148, NULL, NULL),
(149, 5, 149, NULL, NULL),
(150, 18, 150, NULL, NULL),
(151, 12, 151, NULL, NULL),
(152, 15, 152, NULL, NULL),
(153, 6, 153, NULL, NULL),
(154, 15, 154, NULL, NULL),
(155, 18, 155, NULL, NULL),
(156, 15, 156, NULL, NULL),
(157, 20, 157, NULL, NULL),
(158, 12, 158, NULL, NULL),
(159, 6, 159, NULL, NULL),
(160, 14, 160, NULL, NULL),
(161, 20, 161, NULL, NULL),
(162, 11, 162, NULL, NULL),
(163, 2, 163, NULL, NULL),
(164, 15, 164, NULL, NULL),
(165, 1, 165, NULL, NULL),
(166, 3, 166, NULL, NULL),
(167, 7, 167, NULL, NULL),
(168, 14, 168, NULL, NULL),
(169, 20, 169, NULL, NULL),
(170, 3, 170, NULL, NULL),
(171, 3, 171, NULL, NULL),
(172, 14, 172, NULL, NULL),
(173, 4, 173, NULL, NULL),
(174, 20, 174, NULL, NULL),
(175, 4, 175, NULL, NULL),
(176, 3, 176, NULL, NULL),
(177, 19, 177, NULL, NULL),
(178, 6, 178, NULL, NULL),
(179, 14, 179, NULL, NULL),
(180, 15, 180, NULL, NULL),
(181, 15, 181, NULL, NULL),
(182, 10, 182, NULL, NULL),
(183, 18, 183, NULL, NULL),
(184, 13, 184, NULL, NULL),
(185, 4, 185, NULL, NULL),
(186, 12, 186, NULL, NULL),
(187, 8, 187, NULL, NULL),
(188, 14, 188, NULL, NULL),
(189, 15, 189, NULL, NULL),
(190, 15, 190, NULL, NULL),
(191, 18, 191, NULL, NULL),
(192, 8, 192, NULL, NULL),
(193, 1, 193, NULL, NULL),
(194, 1, 194, NULL, NULL),
(195, 19, 195, NULL, NULL),
(196, 4, 196, NULL, NULL),
(197, 2, 197, NULL, NULL),
(198, 18, 198, NULL, NULL),
(201, 12, 201, NULL, NULL),
(202, 21, 202, NULL, NULL),
(203, 22, 202, NULL, NULL),
(204, 21, 203, NULL, NULL),
(205, 5, 203, NULL, NULL),
(206, 16, 203, NULL, NULL),
(207, 21, 204, NULL, NULL),
(208, 6, 204, NULL, NULL),
(209, 9, 204, NULL, NULL),
(210, 13, 205, NULL, NULL),
(211, 9, 205, NULL, NULL),
(212, 19, 205, NULL, NULL),
(213, 5, 206, NULL, NULL),
(214, 16, 206, NULL, NULL),
(215, 6, 207, NULL, NULL),
(216, 2, 207, NULL, NULL),
(217, 20, 207, NULL, NULL),
(218, 13, 208, NULL, NULL),
(219, 4, 208, NULL, NULL),
(220, 4, 209, NULL, NULL),
(221, 7, 209, NULL, NULL),
(223, 22, 211, NULL, NULL),
(224, 22, 212, NULL, NULL),
(225, 22, 213, NULL, NULL),
(226, 22, 214, NULL, NULL),
(227, 22, 215, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `admin`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 1, 'mail@mail.ru', NULL, '$2y$10$4BIWzbpkwEw8G2Wy3s56jO59qUB8GegwTvm0OZFFpQVSFMqNZdd8K', NULL, NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `authors_title_unique` (`title`);

--
-- Индексы таблицы `authors_products`
--
ALTER TABLE `authors_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authors_products_author_id_foreign` (`author_id`),
  ADD KEY `authors_products_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_title_unique` (`title`);

--
-- Индексы таблицы `covers`
--
ALTER TABLE `covers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `orders_products`
--
ALTER TABLE `orders_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_products_order_id_foreign` (`order_id`),
  ADD KEY `orders_products_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_subcategory_slug_foreign` (`subcategory_slug`),
  ADD KEY `products_cover_id_foreign` (`cover_id`);

--
-- Индексы таблицы `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_product_id_index` (`product_id`);

--
-- Индексы таблицы `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subcategories_title_unique` (`title`),
  ADD UNIQUE KEY `subcategories_slug_unique` (`slug`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_title_unique` (`title`);

--
-- Индексы таблицы `tags_products`
--
ALTER TABLE `tags_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_products_tag_id_foreign` (`tag_id`),
  ADD KEY `tags_products_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `authors_products`
--
ALTER TABLE `authors_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `covers`
--
ALTER TABLE `covers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `orders_products`
--
ALTER TABLE `orders_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT для таблицы `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `tags_products`
--
ALTER TABLE `tags_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `authors_products`
--
ALTER TABLE `authors_products`
  ADD CONSTRAINT `authors_products_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `authors_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orders_products`
--
ALTER TABLE `orders_products`
  ADD CONSTRAINT `orders_products_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_cover_id_foreign` FOREIGN KEY (`cover_id`) REFERENCES `covers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_subcategory_slug_foreign` FOREIGN KEY (`subcategory_slug`) REFERENCES `subcategories` (`slug`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tags_products`
--
ALTER TABLE `tags_products`
  ADD CONSTRAINT `tags_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tags_products_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
