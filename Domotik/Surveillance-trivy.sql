-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Mer 22 Mai 2019 à 10:07
-- Version du serveur :  10.1.37-MariaDB-0+deb9u1
-- Version de PHP :  7.0.33-0+deb9u3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `Surveillance`
--
create database Surveillance;
use Surveillance;

-- --------------------------------------------------------

--
-- Structure de la table `ALERTE`
--

CREATE TABLE `ALERTE` (
  `IdAlert` int(11) NOT NULL,
  `DateH` char(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `IdCapt` int(11) DEFAULT NULL,
  `IdCam` int(11) DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin,
  `DateAlerte` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ALERTE`
--

INSERT INTO `ALERTE` (`IdAlert`, `DateH`, `IdCapt`, `IdCam`, `description`, `DateAlerte`) VALUES
(1, 'Tue May  7 23:11:07 2019\n', 36, NULL, NULL, '2019-05-07'),
(5, 'Wed May  8 15:13:17 2019\n', NULL, 6, NULL, '2019-05-08'),
(13, 'Wed May  8 22:30:04 2019\n', 49, NULL, 'Pas placé', '2019-05-08'),
(19, 'Wed May  8 22:46:47 2019\n', 49, NULL, 'Pas placé', '2019-05-08'),
(20, 'Thu May  9 12:46:13 2019\n', NULL, 2, 'Cam50', '2019-05-09'),
(27, 'Wed May 15 00:24:01 2019\n', NULL, 6, 'Cam52', '2019-05-15'),
(28, 'Thu May 16 08:20:51 2019\n', 49, NULL, 'Pas placé', '2019-05-16'),
(29, 'Thu May 16 09:55:44 2019\n', 44, NULL, 'Capteur  Mvt Chamb1', '2019-05-16'),
(30, 'Thu May 16 09:56:01 2019\n', 49, NULL, 'Pas placé', '2019-05-16'),
(31, 'Thu May 16 09:56:15 2019\n', 49, NULL, 'Pas placé', '2019-05-16'),
(32, 'Thu May 16 09:56:39 2019\n', 49, NULL, 'Pas placé', '2019-05-16'),
(33, 'Tue May 21 17:26:14 2019\n', 39, NULL, 'Capt Mvt Salle', '2019-05-21'),
(42, 'Tue May 21 19:46:08 2019\n', 37, NULL, 'Ouverture PF Salle', '2019-05-21'),
(44, 'Wed May 22 07:20:55 2019\n', 37, NULL, 'Ouverture PF Salle', '2019-05-22'),
(45, 'Wed May 22 09:08:59 2019\n', 40, NULL, 'Ouverture 2', '2019-05-22'),
(46, 'Wed May 22 09:09:49 2019\n', 40, NULL, 'Ouverture 2', '2019-05-22'),
(47, 'Wed May 22 09:10:38 2019\n', 40, NULL, 'Ouverture 2', '2019-05-22'),
(48, 'Wed May 22 09:11:42 2019\n', 40, NULL, 'Ouverture 2', '2019-05-22');

-- --------------------------------------------------------

--
-- Structure de la table `CAMERA`
--

CREATE TABLE `CAMERA` (
  `IdCam` int(11) NOT NULL,
  `Nom` char(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `NomRep` char(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Int_Ext` enum('EXT','INT') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `PosGeo` char(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `HautPX` int(11) NOT NULL,
  `LargPX` int(11) NOT NULL,
  `IP` char(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `TypeAlert` enum('FTP','RTSP') CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `NbPixAlert` int(11) DEFAULT NULL,
  `RepAlert` char(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `AdRTSP` char(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ID` char(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `CAMERA`
--

INSERT INTO `CAMERA` (`IdCam`, `Nom`, `NomRep`, `Int_Ext`, `PosGeo`, `HautPX`, `LargPX`, `IP`, `TypeAlert`, `NbPixAlert`, `RepAlert`, `AdRTSP`, `ID`) VALUES
(1, 'Cam05', 'Cam05', 'EXT', 'pos5', 720, 1280, '192.168.3.5', 'FTP', NULL, NULL, 'rtsp://192.168.3.5/11', 'WXH-121433-DFEAA'),
(2, 'Cam50', 'Cam50', 'EXT', 'pos50', 720, 1280, '192.168.3.50', 'FTP', NULL, NULL, NULL, ''),
(3, 'Cam07', 'Cam07', 'EXT', 'pos7', 1280, 768, '192.168.3.7', 'RTSP', NULL, NULL, NULL, ''),
(4, 'Cam10', 'Cam10', 'EXT', 'pos10', 720, 1280, '192.168.3.10', 'RTSP', NULL, NULL, NULL, ''),
(5, 'Cam08', 'Cam08', 'EXT', 'Labo', 1024, 768, '192.16.3.8', 'FTP', NULL, NULL, NULL, ''),
(6, 'Cam52', 'Cam52', 'EXT', 'pos52', 1024, 768, '192.16.3.52', 'FTP', NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Structure de la table `CAPTEUR`
--

CREATE TABLE `CAPTEUR` (
  `IdCapt` int(11) NOT NULL,
  `Type` char(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT 'Température',
  `Nom` char(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `PosGeo` char(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `adIP` char(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Code` int(11) NOT NULL,
  `Valeur` float DEFAULT NULL,
  `alert` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `CAPTEUR`
--

INSERT INTO `CAPTEUR` (`IdCapt`, `Type`, `Nom`, `PosGeo`, `adIP`, `Code`, `Valeur`, `alert`) VALUES
(35, 'Inconnu', 'Element inconnu', NULL, NULL, 0, NULL, NULL),
(36, 'Temperature', 'Capt temp21', NULL, NULL, 21, 24.75, 5),
(37, 'Ouverture', 'Ouverture PF Salle', NULL, NULL, 4674901, NULL, NULL),
(38, 'Ouverture', 'Ouverture 1', NULL, NULL, 5526869, NULL, NULL),
(39, 'Mouvement', 'Capt Mvt Salle', NULL, NULL, 7689557, NULL, NULL),
(40, 'Ouverture', 'Ouverture 2', NULL, NULL, 5330261, NULL, NULL),
(41, 'Mouvement', 'Capt Mvt Chamb2', NULL, NULL, 4541765, NULL, NULL),
(42, 'Mouvement', 'Capt Mvt Atelier', NULL, NULL, 5592437, NULL, NULL),
(43, 'Mouvement', 'Capt Ouverture 3', NULL, NULL, 13631487, NULL, NULL),
(44, 'Mouvement', 'Capteur  Mvt Chamb1', NULL, NULL, 12770345, NULL, NULL),
(45, 'Mouvement', 'Mvt St Denis Entree', NULL, NULL, 5592919, NULL, NULL),
(46, 'Temperature', 'Capt Temp 2', NULL, NULL, 22, 22.1, 5),
(47, 'Mouvement', 'Capt Mvt Atelier', NULL, NULL, 5592437, NULL, NULL),
(48, 'Mouvement', 'Capt Ouverture 4', NULL, NULL, 5594445, NULL, NULL),
(49, 'Ouverture', 'Pas placé', NULL, NULL, 5594453, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `IMAGE`
--

CREATE TABLE `IMAGE` (
  `idImage` int(11) NOT NULL,
  `nomImage` char(254) COLLATE utf8_bin DEFAULT NULL,
  `dateIm` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Contenu de la table `IMAGE`
--

INSERT INTO `IMAGE` (`idImage`, `nomImage`, `dateIm`) VALUES
(0, NULL, NULL),
(1, 'Cam52-11mai2019_20:03:21.jpg', '2019-05-11 20:03:21'),
(2, '-14mai2019_23:36:52.jpg', '2019-05-14 23:36:53'),
(3, '-14mai2019_23:48:30.jpg', '2019-05-14 23:48:30'),
(4, '-14mai2019_23:55:17.jpg', '2019-05-14 23:55:18'),
(5, 'Cam52-15mai2019_00:24:01.jpg', '2019-05-15 00:24:01'),
(6, '-16mai2019_10:15:12.jpg', '2019-05-16 10:15:13'),
(7, '-16mai2019_10:23:38.jpg', '2019-05-16 10:23:39'),
(8, '-16mai2019_10:25:58.jpg', '2019-05-16 10:25:58'),
(9, '-21mai2019_23:03:50.jpg', '2019-05-21 23:03:51'),
(10, 'Cam52-09mai2019_23:38:03.jpg', '2019-05-09 23:38:03'),
(11, 'Cam52-10mai2019_16:42:15.jpg', '2019-05-10 16:42:16'),
(12, '9', NULL),
(13, NULL, NULL),
(14, NULL, NULL),
(15, NULL, NULL),
(16, NULL, NULL),
(17, NULL, NULL),
(18, NULL, NULL),
(19, NULL, NULL),
(20, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `INFO`
--

CREATE TABLE `INFO` (
  `IdInfo` int(11) NOT NULL,
  `NoTel3G` char(13) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nomSite` char(30) NOT NULL,
  `Pin` char(6) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `WiFiSSID` char(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `WiFiMdP` char(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `pwd` text CHARACTER SET utf8 COLLATE utf8_bin,
  `state` int(11) DEFAULT NULL,
  `etatVMC` tinyint(1) DEFAULT '0',
  `cle3G` int(2) NOT NULL DEFAULT '0',
  `pwdSMS` char(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ftpAdr` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ftpLogin` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ftpMdp` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `INFO`
--

INSERT INTO `INFO` (`IdInfo`, `NoTel3G`, `nomSite`, `Pin`, `WiFiSSID`, `WiFiMdP`, `pwd`, `state`, `etatVMC`, `cle3G`, `pwdSMS`, `ftpAdr`, `ftpLogin`, `ftpMdp`) VALUES
(1, '0769101655', 'Trivy', NULL, 'PiBeutte', 'labeutte71', 'test', 0, 1, 1, '3456', 'ftp://perso-ftp.orange.fr/images/', 'gillesaucaigne@orange.fr', 'gilles21');

-- --------------------------------------------------------

--
-- Structure de la table `OPERATEUR`
--

CREATE TABLE `OPERATEUR` (
  `IdOp` int(11) NOT NULL,
  `login` char(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mdpasse` char(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `IdPers` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `OPERATEUR`
--

INSERT INTO `OPERATEUR` (`IdOp`, `login`, `mdpasse`, `IdPers`) VALUES
(1, 'admin', 'admin', 3);

-- --------------------------------------------------------

--
-- Structure de la table `PERSONNE`
--

CREATE TABLE `PERSONNE` (
  `IdPers` int(11) NOT NULL,
  `Nom` char(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Prenom` char(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Tel` char(13) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Mail` char(60) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Groupe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `PERSONNE`
--

INSERT INTO `PERSONNE` (`IdPers`, `Nom`, `Prenom`, `Tel`, `Mail`, `Groupe`) VALUES
(1, 'Aucaigne', 'Gilles', '+33651980787', 'gillesaucaigne@orange.fr', 1),
(3, 'Desvalois', 'Nicolas', '+33615173377', 'gillesaucaigne@orange.fr', 2);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `ALERTE`
--
ALTER TABLE `ALERTE`
  ADD PRIMARY KEY (`IdAlert`),
  ADD UNIQUE KEY `ID_Alerte_IND` (`IdAlert`),
  ADD KEY `FKCap_Declenche` (`IdCapt`),
  ADD KEY `FKCam_Declenche` (`IdCam`);

--
-- Index pour la table `CAMERA`
--
ALTER TABLE `CAMERA`
  ADD PRIMARY KEY (`IdCam`);

--
-- Index pour la table `CAPTEUR`
--
ALTER TABLE `CAPTEUR`
  ADD PRIMARY KEY (`IdCapt`);

--
-- Index pour la table `IMAGE`
--
ALTER TABLE `IMAGE`
  ADD PRIMARY KEY (`idImage`);

--
-- Index pour la table `INFO`
--
ALTER TABLE `INFO`
  ADD PRIMARY KEY (`IdInfo`);

--
-- Index pour la table `OPERATEUR`
--
ALTER TABLE `OPERATEUR`
  ADD PRIMARY KEY (`IdOp`),
  ADD KEY `FKInclue` (`IdPers`);

--
-- Index pour la table `PERSONNE`
--
ALTER TABLE `PERSONNE`
  ADD PRIMARY KEY (`IdPers`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `ALERTE`
--
ALTER TABLE `ALERTE`
  MODIFY `IdAlert` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT pour la table `CAMERA`
--
ALTER TABLE `CAMERA`
  MODIFY `IdCam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `CAPTEUR`
--
ALTER TABLE `CAPTEUR`
  MODIFY `IdCapt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT pour la table `INFO`
--
ALTER TABLE `INFO`
  MODIFY `IdInfo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `OPERATEUR`
--
ALTER TABLE `OPERATEUR`
  MODIFY `IdOp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `PERSONNE`
--
ALTER TABLE `PERSONNE`
  MODIFY `IdPers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `ALERTE`
--
ALTER TABLE `ALERTE`
  ADD CONSTRAINT `FKCam_Declenche` FOREIGN KEY (`IdCam`) REFERENCES `CAMERA` (`IdCam`),
  ADD CONSTRAINT `FKCap_Declenche` FOREIGN KEY (`IdCapt`) REFERENCES `CAPTEUR` (`IdCapt`);

--
-- Contraintes pour la table `OPERATEUR`
--
ALTER TABLE `OPERATEUR`
  ADD CONSTRAINT `FKInclue` FOREIGN KEY (`IdPers`) REFERENCES `PERSONNE` (`IdPers`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
