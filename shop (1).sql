-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июл 20 2021 г., 14:37
-- Версия сервера: 10.4.18-MariaDB
-- Версия PHP: 7.4.16

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
(1, 'С. Макконелл', '2021-07-01 09:17:35', '2021-07-01 09:17:35'),
(3, 'Программист', '2021-07-01 09:18:50', '2021-07-01 09:18:50'),
(4, 'Э. Хант', '2021-07-01 09:35:42', '2021-07-01 09:35:42'),
(5, 'Batman', '2021-07-02 15:52:50', '2021-07-02 15:52:50'),
(7, 'Hellbalzer', '2021-07-05 03:42:14', '2021-07-05 03:42:14'),
(8, 'Алан Мур', '2021-07-07 03:48:37', '2021-07-07 03:48:37'),
(11, 'Нил Гейман', '2021-07-07 03:58:37', '2021-07-07 03:58:37'),
(13, 'One', '2021-07-08 07:33:10', '2021-07-08 07:33:10'),
(14, 'Юскэ Мурата', '2021-07-08 07:33:31', '2021-07-08 07:33:31'),
(15, 'Сайто Такао', '2021-07-12 15:09:46', '2021-07-12 15:09:46'),
(16, 'Эрик Фримен', '2021-07-12 16:04:41', '2021-07-12 16:04:41'),
(17, 'Элизабет Робсон', '2021-07-12 16:04:54', '2021-07-12 16:04:54');

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
(1, 1, 1, '2021-07-01 09:34:28', '2021-07-01 09:34:28'),
(2, 4, 2, '2021-07-01 09:36:17', '2021-07-01 09:36:17'),
(3, 1, 3, '2021-07-01 09:41:41', '2021-07-01 09:41:41'),
(4, 3, 3, '2021-07-01 09:41:41', '2021-07-01 09:41:41'),
(5, 5, 4, '2021-07-02 16:01:36', '2021-07-02 16:01:36'),
(6, 3, 5, '2021-07-03 09:14:05', '2021-07-03 09:14:05'),
(7, 4, 5, '2021-07-03 09:14:05', '2021-07-03 09:14:05'),
(8, 7, 6, '2021-07-05 03:42:32', '2021-07-05 03:42:32'),
(9, 13, 7, '2021-07-08 07:34:01', '2021-07-08 07:34:01'),
(10, 14, 7, '2021-07-08 07:34:01', '2021-07-08 07:34:01'),
(11, 13, 8, '2021-07-08 08:51:50', '2021-07-08 08:51:50'),
(12, 14, 8, '2021-07-08 08:51:50', '2021-07-08 08:51:50'),
(13, 15, 9, '2021-07-12 16:00:10', '2021-07-12 16:00:10'),
(14, 16, 10, '2021-07-12 16:09:33', '2021-07-12 16:09:33'),
(15, 17, 10, '2021-07-12 16:09:33', '2021-07-12 16:09:33');

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
(1, 'Books', 'Computer books', '2021-07-01 09:13:14', '2021-07-01 09:13:14'),
(2, 'Comics', 'Comics books', '2021-07-01 09:13:31', '2021-07-01 09:13:31'),
(3, 'Книги комиксов', 'Не будем о программировании', '2021-07-05 15:07:51', '2021-07-05 15:07:51'),
(4, 'Комиксы о программировании', 'Детям доступно о сложном и не очень', '2021-07-05 15:13:59', '2021-07-05 15:13:59');

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
(46, '2014_10_12_000000_create_users_table', 1),
(47, '2014_10_12_100000_create_password_resets_table', 1),
(48, '2019_08_19_000000_create_failed_jobs_table', 1),
(49, '2021_06_10_161440_create_categories_table', 1),
(50, '2021_06_17_151343_create_orders_table', 1),
(51, '2021_06_20_074809_create_subcategories_table', 1),
(52, '2021_06_20_081243_create_authors_table', 1),
(53, '2021_06_20_083539_create_products_table', 1),
(54, '2021_06_20_083932_create_orders_products_table', 1),
(55, '2021_06_20_084143_create_authors_products_table', 1),
(56, '2021_06_23_070625_alter_users_table', 1),
(57, '2021_06_27_064058_create_tags_table', 1),
(58, '2021_06_27_065124_create_tags_products_table', 1),
(59, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(60, '2021_07_14_174016_create_cache_table', 3);

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
(12, 1, 1, '2021-07-16 04:02:36', '2021-07-16 04:03:46'),
(13, 1, 0, '2021-07-16 04:04:27', '2021-07-16 04:04:27');

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
(48, 12, 1, 1, 999.00, '2021-07-16 04:02:36', '2021-07-16 04:03:46'),
(49, 12, 5, 1, 1099.00, '2021-07-16 04:02:39', '2021-07-16 04:03:46'),
(50, 12, 8, 1, 550.00, '2021-07-16 04:02:44', '2021-07-16 04:03:46'),
(51, 13, 1, 1, 999.00, '2021-07-16 04:04:27', '2021-07-20 07:46:00'),
(62, 13, 5, 1, 1099.00, '2021-07-19 03:26:16', '2021-07-20 07:44:42');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `description`, `subcategory_slug`, `picture`, `created_at`, `updated_at`) VALUES
(1, 'Совершенный код', 999.00, 'Практическое руководство по разработке программного обеспечения', 'arhitektura', 'LT39sAHy1UxC5CEBWX35wceWksqkT1xEmgyL6Ijg.jpg', '2021-07-01 09:34:28', '2021-07-01 09:34:28'),
(2, 'Программист-прагматик', 950.00, 'От подмастерья к мастеру', 'arhitektura', 'wVAmTcSjungtJ1j0web1HktVMMzG4mxoNNpWwBa7.jpg', '2021-07-01 09:36:17', '2021-07-01 09:36:17'),
(3, 'Структура и интерпретация компьютерных программ', 1220.00, 'Структура и интерпретация компьютерных программ', 'arhitektura', 'uQztiDF7ilnzgO2Ornrwnfrip5fbAlylzmxYpxnG.jpg', '2021-07-01 09:41:41', '2021-07-01 09:41:41'),
(4, 'Batman', 120.00, 'Batman bats', 'dc-comics', 'xKBMaWqW7d1gsG25HQ2UETk1qMVdYErLr1PIGNcv.jpg', '2021-07-02 16:01:36', '2021-07-02 16:01:36'),
(5, 'Хорошая книга', 1099.00, 'Хорошая книга', 'web', '61PkmmgVwoHnlXpEtI5CrDyDNj50yBnx2yAHe66M.jpg', '2021-07-03 09:14:05', '2021-07-03 09:14:05'),
(6, 'Hellbalzer', 150.00, 'Джон Константин против ада', 'dc-comics', '4QY23dipaq8LqewHiOYAUvssXHTOwoZbCLKCS7kv.jpg', '2021-07-05 03:42:32', '2021-07-05 03:42:32'),
(7, 'One-Punch Man 1 Книги 1-2', 550.00, 'Главный герой — Cайтама — обрел настолько невероятную силу, что ему трудно найти достойного соперника. Ведь любого врага он может одолеть одним ударом. Удастся ли сильнейшему человеку на свете вновь ощутить накал страстей в сражении?', 'manga', 'A8YZNmuuVACq8IgVpK2gNvrMkRveU0RZblbqs3mP.jpg', '2021-07-08 07:34:01', '2021-07-08 07:34:01'),
(8, 'One-Punch Man 3. Книги 5-6', 550.00, 'Настоящие герои никогда не отступают перед лицом опасности! Вот и на этот раз Сайтама и Дженос спешат дать отпор Повелителю Морских Глубин, который с легкостью одолел даже героя класса S. Но совсем скоро сражение с чудовищем, чей уровень угрозы – «Демон», покажется им детской сказкой, ведь герои еще ничего не знают о страшном пророчестве, согласно которому нашей Земле кранты!', 'manga', 'dJRx1CWZBLzO9aebtUzVecbOX8ovMVw6yQMVT5no.jpg', '2021-07-08 08:51:50', '2021-07-08 08:51:50'),
(9, 'Голго 13', 850.00, 'Голго-13 не жмёт руку при знакомстве. Не позволяет никому заходить себе за спину. И никогда не улыбается. Способный совершать невозможное, этот «одинокий волк» берётся за самые трудные заказы – и выполняет их, невзирая на случайности и вопреки любым обстоятельствам.', 'manga', '1626116410golgo.jpg', '2021-07-12 16:00:10', '2021-07-12 16:00:10'),
(10, 'Изучаем программирование на JavaScript', 1999.00, 'Вы готовы сделать шаг вперед в веб-программировании и перейти от верстки в HTML и CSS к созданию полноценных динамических страниц? Тогда пришло время познакомиться с самым \"горячим\" языком программирования - JavaScript!\nС помощью этой книги вы узнаете все о языке JavaScript - от переменных до циклов. Вы поймете, почему разные браузеры по-разному реагируют на код и как написать универсальный код, поддерживаемый всеми браузерами. Вам станет ясно, почему с кодом JavaScript никогда не придется беспокоиться о перегруженности страниц и ошибках передачи данных. Не пугайтесь, даже если ранее вы не написали ни одной строчки кода, - благодаря уникальному формату подачи материала эта книга с легкостью проведет вас по всему пути обучения: от написания простейшего скрипта до создания сложных веб-проектов, которые будут работать во всех современных браузерах.\nОсобенностью этого издания является уникальный способ подачи материала, выделяющий серию \"Head First\" издательства O\'Reilly в ряду множества скучных книг, посвященных программированию.', 'web', '1626116972js.jpg', '2021-07-12 16:09:32', '2021-07-12 16:09:32');

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
(1, 'Веб', 'web', 1, '2021-07-01 09:15:29', '2021-07-01 09:15:29'),
(2, 'Архитектура', 'arhitektura', 1, '2021-07-01 09:15:50', '2021-07-01 09:15:50'),
(3, 'Марвел', 'marvel', 2, '2021-07-01 09:15:57', '2021-07-01 09:15:57'),
(4, 'DC comics', 'dc-comics', 2, '2021-07-01 09:16:13', '2021-07-01 09:16:13'),
(5, 'Машинное обучение', 'mashinnoe-obuchenie', 1, '2021-07-05 15:02:43', '2021-07-05 15:02:43'),
(8, 'Манга', 'manga', 3, '2021-07-08 07:23:37', '2021-07-08 07:23:37');

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
(1, 'php', '2021-07-01 09:16:25', '2021-07-01 09:16:25'),
(2, 'clean code', '2021-07-01 09:16:36', '2021-07-01 09:16:36'),
(3, 'html', '2021-07-01 09:16:40', '2021-07-01 09:16:40'),
(4, 'css', '2021-07-01 09:16:43', '2021-07-01 09:16:43'),
(6, 'rust', '2021-07-01 09:16:52', '2021-07-01 09:16:52'),
(7, 'супергерой', '2021-07-08 08:49:35', '2021-07-08 08:49:35'),
(8, 'фантастика', '2021-07-08 08:49:42', '2021-07-08 08:49:42'),
(9, 'Пародия', '2021-07-08 08:50:02', '2021-07-08 08:50:02'),
(16, 'детектив', '2021-07-12 15:29:41', '2021-07-12 15:29:41'),
(17, 'C++', '2021-07-12 15:32:01', '2021-07-12 15:32:01'),
(18, 'javascript', '2021-07-12 15:32:54', '2021-07-12 15:32:54'),
(19, 'vue', '2021-07-12 15:33:01', '2021-07-12 15:33:01'),
(20, 'bootstrap', '2021-07-12 15:33:09', '2021-07-12 15:33:09'),
(21, 'R', '2021-07-12 15:33:17', '2021-07-12 15:33:17'),
(22, 'Lisp', '2021-07-12 15:33:22', '2021-07-12 15:33:22'),
(23, 'Python', '2021-07-12 15:33:30', '2021-07-12 15:33:30'),
(24, 'React', '2021-07-20 05:05:00', '2021-07-20 05:05:00'),
(25, 'Суперагент', '2021-07-20 05:05:40', '2021-07-20 05:05:40');

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
(1, 2, 1, '2021-07-01 09:34:28', '2021-07-01 09:34:28'),
(2, 2, 2, '2021-07-01 09:36:17', '2021-07-01 09:36:17'),
(3, 2, 3, '2021-07-01 09:41:41', '2021-07-01 09:41:41'),
(4, 3, 4, '2021-07-02 16:01:36', '2021-07-02 16:01:36'),
(5, 4, 4, '2021-07-02 16:01:36', '2021-07-02 16:01:36'),
(6, 1, 5, '2021-07-03 09:14:05', '2021-07-03 09:14:05'),
(7, 3, 5, '2021-07-03 09:14:05', '2021-07-03 09:14:05'),
(8, 4, 5, '2021-07-03 09:14:05', '2021-07-03 09:14:05'),
(9, 3, 6, '2021-07-05 03:42:32', '2021-07-05 03:42:32'),
(10, 4, 6, '2021-07-05 03:42:32', '2021-07-05 03:42:32'),
(11, 3, 7, '2021-07-08 07:34:01', '2021-07-08 07:34:01'),
(12, 4, 7, '2021-07-08 07:34:01', '2021-07-08 07:34:01'),
(13, 7, 8, '2021-07-08 08:51:50', '2021-07-08 08:51:50'),
(14, 8, 8, '2021-07-08 08:51:50', '2021-07-08 08:51:50'),
(15, 9, 8, '2021-07-08 08:51:50', '2021-07-08 08:51:50'),
(16, 7, 9, '2021-07-12 16:00:10', '2021-07-12 16:00:10'),
(17, 16, 9, '2021-07-12 16:00:10', '2021-07-12 16:00:10'),
(18, 3, 10, '2021-07-12 16:09:32', '2021-07-12 16:09:32'),
(19, 4, 10, '2021-07-12 16:09:32', '2021-07-12 16:09:32'),
(20, 18, 10, '2021-07-12 16:09:32', '2021-07-12 16:09:32');

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
(1, 'admin', 1, 'mail@mail.ru', NULL, '$2y$10$WPmoA/yxzgF6fPFaEFnkD.Iw6oEsWVZNawpnhOOR3v2sDThg9oASi', NULL, '2021-07-01 09:12:25', '2021-07-18 07:20:17'),
(2, 'notadmin', 0, 'd@ya.ru', NULL, '$2y$10$I.qXQ1cSHdUuxMSIALX7ee6kk/QNJKvP2y5NSx70qgoAVrc3fjDA.', NULL, '2021-07-05 04:57:33', '2021-07-05 04:57:33'),
(4, 'qwerty', 0, 'user@mail.ru', NULL, '$2y$10$5PVO1mKw6VYbC1oCvEqNTuU7.VoaGvygXeoR/UkpuWd/.o0Au1sVy', NULL, '2021-07-08 03:59:47', '2021-07-08 03:59:47');

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
  ADD KEY `products_subcategory_slug_foreign` (`subcategory_slug`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `authors_products`
--
ALTER TABLE `authors_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `orders_products`
--
ALTER TABLE `orders_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `tags_products`
--
ALTER TABLE `tags_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  ADD CONSTRAINT `products_subcategory_slug_foreign` FOREIGN KEY (`subcategory_slug`) REFERENCES `subcategories` (`slug`) ON UPDATE CASCADE;

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
