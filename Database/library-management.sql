-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2022 at 07:29 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library-management`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `publisher` varchar(50) NOT NULL,
  `quantity` int(50) NOT NULL,
  `issued_quantity` int(50) NOT NULL DEFAULT 0,
  `added_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `name`, `author`, `publisher`, `quantity`, `issued_quantity`, `added_date`) VALUES
('bk-501', 'Wings of Fire', 'APJ Abdul Kalam', 'Universities Press', 5, 5, '26/03/2020'),
('bk-504', 'Harry Potter', 'JK Rowling', 'Bloomsbury Publishers', 19, 2, '07/10/2022');

-- --------------------------------------------------------

--
-- Table structure for table `issued-books`
--

CREATE TABLE `issued-books` (
  `id` varchar(50) NOT NULL,
  `book` varchar(50) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `student_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `dept` varchar(50) NOT NULL,
  `issued_date` varchar(50) NOT NULL,
  `renewal_date` varchar(50) NOT NULL,
  `issue_no` varchar(50) NOT NULL,
  `prim` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `issued-books`
--

INSERT INTO `issued-books` (`id`, `book`, `student_id`, `student_name`, `email`, `dept`, `issued_date`, `renewal_date`, `issue_no`, `prim`) VALUES
('bk-501', 'Wings of Fire', '18cs206', 'Adarsh V S', 'adarshvs6665@gmail.com', 'CS', '08/10/2022', '22/12/2022', '18cs206bk-501', 55),
('bk-501', 'Wings of Fire', '18cs206', 'Adarsh V S', 'adarshvs6665@gmail.com', 'CS', '08/10/2022', '22/12/2022', '18cs206bk-501', 56),
('bk-504', 'Harry Potter', '18cs207', 'Adwait', 'adwaitkannan@gmail.com', 'CS', '08/10/2022', '23/10/2022', '18cs207bk-504', 60),
('bk-501', 'Wings of Fire', '19it210', 'Karthika P H', 'karthikaph123@gmail.com', 'IT', '08/10/2022', '21/04/2023', '19it210bk-501', 61),
('bk-501', 'Wings of Fire', '19it210', 'Karthika P H', 'karthikaph123@gmail.com', 'IT', '08/10/2022', '21/04/2023', '19it210bk-501', 62);

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

CREATE TABLE `librarian` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `librarian`
--

INSERT INTO `librarian` (`id`, `name`, `email`, `password`) VALUES
('libid-200', 'Librarian', 'librarian@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` varchar(50) NOT NULL,
  `book` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `publisher` varchar(50) NOT NULL,
  `reservation_no` int(50) NOT NULL,
  `student_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `book`, `author`, `publisher`, `reservation_no`, `student_id`) VALUES
('bk-504', 'Harry Potter', 'JK Rowling', 'Bloomsbury Publishers', 11, '18cs206'),
('bk-501', 'Wings of Fire', 'APJ Abdul Kalam', 'Universities Press', 12, '18cs206');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `age` int(10) NOT NULL,
  `dept` varchar(50) NOT NULL,
  `joining_date` varchar(50) NOT NULL,
  `fine` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `email`, `password`, `age`, `dept`, `joining_date`, `fine`) VALUES
('18cs206', 'Adarsh V S', 'adarshvs@gmail.com', '123456', 22, 'CS', '03/06/2022', 400),
('18cs207', 'Adwait', 'adwait@gmail.com', '123456', 22, 'CS', '03/06/2022', 100);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issued-books`
--
ALTER TABLE `issued-books`
  ADD PRIMARY KEY (`prim`);

--
-- Indexes for table `librarian`
--
ALTER TABLE `librarian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_no`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `issued-books`
--
ALTER TABLE `issued-books`
  MODIFY `prim` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_no` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
