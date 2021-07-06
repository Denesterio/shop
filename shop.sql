-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Июл 06 2021 г., 13:41
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
(7, 'Hellbalzer', '2021-07-05 03:42:14', '2021-07-05 03:42:14');

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
(8, 7, 6, '2021-07-05 03:42:32', '2021-07-05 03:42:32');

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
(58, '2021_06_27_065124_create_tags_products_table', 1);

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
(1, 1, 1, '2021-07-02 04:57:33', '2021-07-02 04:59:31'),
(2, 1, 1, '2021-07-02 05:02:17', '2021-07-02 05:02:27'),
(3, 1, 0, '2021-07-02 05:02:44', '2021-07-02 05:02:44');

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
(1, 1, 1, 2, 900.00, '2021-07-02 04:57:33', '2021-07-02 04:57:36'),
(2, 1, 2, 1, 950.00, '2021-07-02 04:57:35', '2021-07-02 04:57:35'),
(3, 2, 3, 1, 1220.00, '2021-07-02 05:02:17', '2021-07-02 05:02:17'),
(4, 2, 2, 1, 950.00, '2021-07-02 05:02:19', '2021-07-02 05:02:19'),
(6, 3, 5, 1, 1240.00, '2021-07-03 09:15:01', '2021-07-04 10:28:12'),
(17, 3, 2, 1, 950.00, '2021-07-06 08:33:49', '2021-07-06 08:33:49'),
(18, 3, 1, 1, 900.00, '2021-07-06 08:33:51', '2021-07-06 08:33:51');

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
(1, 'Совершенный код', 900.00, 'Практическое руководство по разработке программного обеспечения', 'arhitektura', 'img/LT39sAHy1UxC5CEBWX35wceWksqkT1xEmgyL6Ijg.jpg', '2021-07-01 09:34:28', '2021-07-01 09:34:28'),
(2, 'Программист-прагматик', 950.00, 'От подмастерья к мастеру', 'arhitektura', 'img/wVAmTcSjungtJ1j0web1HktVMMzG4mxoNNpWwBa7.jpg', '2021-07-01 09:36:17', '2021-07-01 09:36:17'),
(3, 'Структура и интерпретация компьютерных программ', 1220.00, 'Структура и интерпретация компьютерных программ', 'arhitektura', 'img/uQztiDF7ilnzgO2Ornrwnfrip5fbAlylzmxYpxnG.jpg', '2021-07-01 09:41:41', '2021-07-01 09:41:41'),
(4, 'Batman', 120.00, 'Batman bats', 'dc-comics', 'img/xKBMaWqW7d1gsG25HQ2UETk1qMVdYErLr1PIGNcv.jpg', '2021-07-02 16:01:36', '2021-07-02 16:01:36'),
(5, 'Хорошая книга', 1240.00, 'Хорошая книга', 'web', 'img/61PkmmgVwoHnlXpEtI5CrDyDNj50yBnx2yAHe66M.jpg', '2021-07-03 09:14:05', '2021-07-03 09:14:05'),
(6, 'Hellbalzer', 150.00, 'Джон Константин против ада', 'dc-comics', 'img/4QY23dipaq8LqewHiOYAUvssXHTOwoZbCLKCS7kv.jpg', '2021-07-05 03:42:32', '2021-07-05 03:42:32');

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
(5, 'Машинное обучение', 'mashinnoe-obuchenie', 1, '2021-07-05 15:02:43', '2021-07-05 15:02:43');

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
(5, 'java', '2021-07-01 09:16:48', '2021-07-01 09:16:48'),
(6, 'rust', '2021-07-01 09:16:52', '2021-07-01 09:16:52');

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
(10, 4, 6, '2021-07-05 03:42:32', '2021-07-05 03:42:32');

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
(1, 'admin', 1, 'mail@mail.ru', NULL, '$2y$10$WPmoA/yxzgF6fPFaEFnkD.Iw6oEsWVZNawpnhOOR3v2sDThg9oASi', NULL, '2021-07-01 09:12:25', '2021-07-01 09:12:25'),
(2, 'notadmin', 0, 'd@ya.ru', NULL, '$2y$10$I.qXQ1cSHdUuxMSIALX7ee6kk/QNJKvP2y5NSx70qgoAVrc3fjDA.', NULL, '2021-07-05 04:57:33', '2021-07-05 04:57:33');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `authors_products`
--
ALTER TABLE `authors_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `orders_products`
--
ALTER TABLE `orders_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `tags_products`
--
ALTER TABLE `tags_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
