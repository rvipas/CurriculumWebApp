-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-12-2016 a las 10:55:18
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `test`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_curriculum`
--

CREATE TABLE `user_curriculum` (
	`user_curriculum_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `cv_ident` varchar(220) DEFAULT NULL,
  `ispublic` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

ALTER TABLE `user_curriculum`
  ADD PRIMARY KEY (`user_curriculum_id`),
  ADD UNIQUE KEY `uni_username_role` (`role`,`username`),
  ADD KEY `fk_username_idx` (`username`);

ALTER TABLE `user_curriculum`
  MODIFY `user_curriculum_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `user_curriculum`
  ADD CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

  
INSERT INTO `user_curriculum` (`username`, `cv_ident`, `public`) VALUES ('mkyong', '584b359dfc3de7ac2c1c0ed7', 1)

----

CREATE TABLE `user_curriculum` (
	`user_curriculum_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `cv_ident` varchar(220) DEFAULT NULL,
  `ispublic` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `user_curriculum`
  ADD PRIMARY KEY (`user_curriculum_id`),
  ADD KEY `fk_username_idx` (`username`);

ALTER TABLE `user_curriculum`
  MODIFY `user_curriculum_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `user_curriculum`
  ADD CONSTRAINT `fk_username_cv` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

  
INSERT INTO `user_curriculum` (`username`, `cv_ident`, `ispublic`) VALUES ('mkyong', '584b359dfc3de7ac2c1c0ed7', 1)