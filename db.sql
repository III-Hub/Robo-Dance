-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: mdb:3306
-- Generation Time: Jan 26, 2020 at 10:55 PM
-- Server version: 10.1.41-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--

-- --------------------------------------------------------

--
-- Table structure for table `danceoffs`
--

CREATE TABLE `danceoffs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `season_id` bigint(20) UNSIGNED NOT NULL,
  `won` bigint(20) UNSIGNED NOT NULL,
  `lost` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `danceoffs`
--

INSERT INTO `danceoffs` (`id`, `season_id`, `won`, `lost`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 6, '2020-01-20 21:17:55', '2020-01-20 21:17:55'),
(5, 1, 7, 2, '2020-01-20 21:38:16', '2020-01-20 21:38:16'),
(7, 1, 3, 10, '2020-01-26 22:52:20', '2020-01-26 22:52:20'),
(8, 1, 8, 4, '2020-01-26 22:52:55', '2020-01-26 22:52:55'),
(9, 1, 9, 5, '2020-01-26 22:53:43', '2020-01-26 22:53:43');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(20, '2014_10_12_000000_create_users_table', 1),
(21, '2014_10_12_100000_create_password_resets_table', 1),
(22, '2020_01_19_211949_create_robots_table', 1),
(23, '2020_01_20_081057_create_teams_table', 1),
(24, '2020_01_20_083120_create_team_members_table', 1),
(25, '2020_01_20_083549_create_danceoffs_table', 1),
(26, '2020_01_20_083804_create_seasons_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `robots`
--

CREATE TABLE `robots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `powermove` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `experience` int(11) NOT NULL,
  `outOfOrder` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `robots`
--

INSERT INTO `robots` (`id`, `name`, `powermove`, `experience`, `outOfOrder`, `created_at`, `updated_at`) VALUES
(1, 'Funky Joe', 'Spinning Turtle', 5, 0, '2020-01-20 13:43:50', '2020-01-20 13:43:50'),
(2, 'Da Vinci', 'Surgical Blade', 4, 0, '2020-01-20 14:38:11', '2020-01-20 14:38:11'),
(3, 'Knight Rider', 'Speeding Bullet', 4, 0, '2020-01-20 14:41:45', '2020-01-20 14:41:45'),
(4, 'Tachi Komas', 'Ghost in the Shell', 3, 0, '2020-01-20 14:44:12', '2020-01-20 14:44:12'),
(5, 'Toyota Violin', 'Angelic moves', 2, 0, '2020-01-20 14:48:15', '2020-01-20 14:48:15'),
(6, 'Funky Tom', 'Revolving wheels', 5, 0, '2020-01-20 14:48:57', '2020-01-20 14:48:57'),
(7, 'Jokey Jane', 'Drunken Steps ', 6, 0, '2020-01-20 14:49:03', '2020-01-20 14:49:03'),
(8, 'Funny Molly', 'Power puff', 4, 0, '2020-01-20 14:50:13', '2020-01-20 14:50:13'),
(9, 'Gerty Blues ', 'Moon Walk', 7, 0, '2020-01-20 14:50:23', '2020-01-20 14:50:23'),
(10, 'Rocky Mervin', 'rock and roll', 4, 0, '2020-01-20 15:14:27', '2020-01-20 15:14:27');

-- --------------------------------------------------------

--
-- Table structure for table `seasons`
--

CREATE TABLE `seasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seasons`
--

INSERT INTO `seasons` (`id`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-01-20 15:50:28', '2020-01-20 15:50:28');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `created_at`, `updated_at`) VALUES
(1, '2020-01-20 13:42:35', '2020-01-20 13:42:35'),
(2, '2020-01-20 13:42:39', '2020-01-20 13:42:39'),
(3, '2020-01-20 21:41:06', '2020-01-20 21:41:06');

-- --------------------------------------------------------

--
-- Table structure for table `team_members`
--

CREATE TABLE `team_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `robot_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `team_members`
--

INSERT INTO `team_members` (`id`, `team_id`, `robot_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2020-01-20 13:43:50', '2020-01-20 13:43:50'),
(2, 1, 2, '2020-01-20 14:38:11', '2020-01-20 14:38:11'),
(3, 1, 3, '2020-01-20 14:41:45', '2020-01-20 14:41:45'),
(4, 1, 4, '2020-01-20 14:44:12', '2020-01-20 14:44:12'),
(5, 1, 5, '2020-01-20 14:48:15', '2020-01-20 14:48:15'),
(6, 2, 6, '2020-01-20 14:48:57', '2020-01-20 14:48:57'),
(7, 2, 7, '2020-01-20 14:49:03', '2020-01-20 14:49:03'),
(8, 2, 8, '2020-01-20 14:50:13', '2020-01-20 14:50:13'),
(9, 2, 9, '2020-01-20 14:50:23', '2020-01-20 14:50:23'),
(10, 2, 10, '2020-01-20 15:14:27', '2020-01-20 15:14:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `danceoffs`
--
ALTER TABLE `danceoffs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `robots`
--
ALTER TABLE `robots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seasons`
--
ALTER TABLE `seasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_members`
--
ALTER TABLE `team_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `danceoffs`
--
ALTER TABLE `danceoffs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `robots`
--
ALTER TABLE `robots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `seasons`
--
ALTER TABLE `seasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `team_members`
--
ALTER TABLE `team_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
