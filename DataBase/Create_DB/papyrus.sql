-- phpMyAdmin SQL Dump
-- version 5.0.4deb2ubuntu5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 27, 2022 at 11:05 AM
-- Server version: 8.0.28-0ubuntu0.21.10.3
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `papyrus`
--

-- --------------------------------------------------------

--
-- Table structure for table `entcom`
--

CREATE TABLE `entcom` (
  `NUMCOM` int UNSIGNED NOT NULL,
  `OBSCOM` varchar(50) DEFAULT NULL,
  `DATCOM` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NUMFOU` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `fournis`
--

CREATE TABLE `fournis` (
  `NUMFOU` varchar(25) NOT NULL,
  `NOMFOU` varchar(25) NOT NULL,
  `RUEFOU` varchar(50) NOT NULL,
  `POSFOU` char(5) NOT NULL,
  `VILFOU` varchar(30) NOT NULL,
  `CONFOU` varchar(15) NOT NULL,
  `SATISF` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `ligcom`
--

CREATE TABLE `ligcom` (
  `NUMLIG` tinyint NOT NULL,
  `NUMCOM` int UNSIGNED NOT NULL,
  `CODART` char(4) NOT NULL,
  `QTECDE` int NOT NULL,
  `PRIUNI` varchar(50) NOT NULL,
  `QTELIV` int DEFAULT NULL,
  `DERLIV` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `CODART` char(4) NOT NULL,
  `LIBART` varchar(30) NOT NULL,
  `STKALE,` int NOT NULL,
  `STKPHY` int NOT NULL,
  `QTEANN` int NOT NULL,
  `UNIMES` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `vente`
--

CREATE TABLE `vente` (
  `NUMFOU` varchar(25) NOT NULL,
  `CODART` char(4) NOT NULL,
  `DELLIV` smallint NOT NULL,
  `QTE1` int NOT NULL,Créez un index sur le champ cli_nom de la table client.
  `PRIX1` varchar(50) NOT NULL,
  `QTE2` int DEFAULT NULL,
  `PRIX2` varchar(50) DEFAULT NULL,
  `QTE3` int DEFAULT NULL,
  `PRIX3` varchar(50) DEFAULT NULLCréez un index sur le champ cli_nom de la table client.
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Indexes for dumped tables
--

--Créez un index sur le champ cli_nom de la table client.
-- Indexes for table `entcom`
--
ALTER TABLE `entcom`
  ADD PRIMARY KEY (`NUMCOM`),
  ADD KEY `NUMFOU` (`NUMFOU`);

--
-- Indexes for table `fournis`
--
ALTER TABLE `fournis`
  ADD PRIMARY KEY (`NUMFOU`);

--
-- Indexes for table `ligcom`utf8mb3
--
ALTER TABLE `ligcom`
  ADD PRIMARY KEY (`NUMLIG`),
  ADD KEY `ligcom_entcom` (`NUMCOM`),
  ADD KEY `ligcom_produit` (`CODART`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`CODART`);

--
-- Indexes for table `vente`
--
ALTER TABLE `vente`
  ADD KEY `vente_produit` (`CODART`),
  ADD KEY `vente_fournis` (`NUMFOU`);

--
-- AUTO_INCREMENT for dumped tablesCREATE UNIQUE INDEX client ON newClient(cli_nom);
--

--
-- AUTO_INCREMENT for table `entcom`
--
ALTER TABLE `entcom`
  MODIFY `NUMCOM` int UNSIGNED NOT NULL AUTO_INCREMENT;
utf8mb3
--
-- Constraints for dumped tables
--

--
-- Constraints for table `entcom`
--
ALTER TABLE `entcom`
  ADD CONSTRAINT `entcom_fournis` FOREIGN KEY (`NUMFOU`) REFERENCES `fournis` (`NUMFOU`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `ligcom`
--
ALTER TABLE `ligcom`
  ADD CONSTRAINT `ligcom_entcom` FOREIGN KEY (`NUMCOM`) REFERENCES `entcom` (`NUMCOM`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ligcom_produit` FOREIGN KEY (`CODART`) REFERENCES `produit` (`CODART`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `vente_fournis` FOREIGN KEY (`NUMFOU`) REFERENCES `fournis` (`NUMFOU`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `vente_produit` FOREIGN KEY (`CODART`) REFERENCES `produit` (`CODART`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
