-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 10, 2021 at 10:00 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_online_cv`
--
CREATE DATABASE IF NOT EXISTS `db_online_cv` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_online_cv`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_interests`
--

DROP TABLE IF EXISTS `tb_interests`;
CREATE TABLE `tb_interests` (
  `id_interest` varchar(64) NOT NULL,
  `interest_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_interests`
--

INSERT INTO `tb_interests` (`id_interest`, `interest_name`, `user_id`) VALUES
('5cb9ec8973f3f29', 'lauren', '1'),
('5cb9ec8973f3fcg', 'Programming', '1'),
('5cb9ecac10d924', 'Study', '1'),
('5cb9ecc8c42c34', 'movie', '1'),
('5cb9ecd7e84228', 'music', '1'),
('5cb9ecd9177b08', 'video', '1'),
('5cb9f7fec35f54', 'phone', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_languages`
--

DROP TABLE IF EXISTS `tb_languages`;
CREATE TABLE `tb_languages` (
  `id_language` varchar(64) NOT NULL,
  `language_name` varchar(64) NOT NULL,
  `language_star` float NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `is_active` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_projects`
--

DROP TABLE IF EXISTS `tb_projects`;
CREATE TABLE `tb_projects` (
  `id_project` varchar(64) NOT NULL,
  `project_title` varchar(255) NOT NULL,
  `project_headline` varchar(64) NOT NULL,
  `project_description_id` text NOT NULL,
  `project_description_en` text NOT NULL,
  `project_link` text NOT NULL,
  `project_image` text NOT NULL,
  `date_created` varchar(25) NOT NULL,
  `user_id` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_projects`
--

INSERT INTO `tb_projects` (`id_project`, `project_title`, `project_headline`, `project_description_id`, `project_description_en`, `project_link`, `project_image`, `date_created`, `user_id`) VALUES
('5e008b216fc03', 'Point IS - For PT. IS Ing Silver Customers', 'Mobile (Android)', 'Point IS ditujukan untuk pelanggan PT. IS Ing Silver. Pelanggan dapat melihat transaksi yang telah dilakukan, history dari point, dan dapat melakukan beberapa perubahan pada profil.', 'Point IS is provide to the customers of PT. IS Ing Silver. Customers can view their transaction, point history, and do some changes in their profile.', 'https://play.google.com/store/apps/details?id=com.ingsilver.is_poin&utm_source=ingsilver&utm_medium=is+poin+app&utm_campaign=is_poin', 'x', '2021-09-09', 'x');

-- --------------------------------------------------------

--
-- Table structure for table `tb_skills`
--

DROP TABLE IF EXISTS `tb_skills`;
CREATE TABLE `tb_skills` (
  `id_skill` varchar(64) NOT NULL,
  `skill_name` varchar(64) NOT NULL,
  `skill_star` float NOT NULL,
  `user_id` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users` (
  `id_user` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `headline` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `interests_id` varchar(64) NOT NULL,
  `date_created` date NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_interests`
--
ALTER TABLE `tb_interests`
  ADD PRIMARY KEY (`id_interest`);

--
-- Indexes for table `tb_languages`
--
ALTER TABLE `tb_languages`
  ADD PRIMARY KEY (`id_language`);

--
-- Indexes for table `tb_projects`
--
ALTER TABLE `tb_projects`
  ADD PRIMARY KEY (`id_project`);

--
-- Indexes for table `tb_skills`
--
ALTER TABLE `tb_skills`
  ADD PRIMARY KEY (`id_skill`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
