-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Dim 12 Avril 2020 à 09:29
-- Version du serveur :  10.3.17-MariaDB-0+deb10u1
-- Version de PHP :  7.3.11-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `Surveillance`
--

-- --------------------------------------------------------

--
-- Structure de la table `ALERTE`
--

CREATE TABLE `ALERTE` (
  `IdAlert` int(11) NOT NULL,
  `DateH` char(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `IdCapt` int(11) DEFAULT NULL,
  `IdCam` int(11) DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `DateAlerte` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ALERTE`
--

INSERT INTO `ALERTE` (`IdAlert`, `DateH`, `IdCapt`, `IdCam`, `description`, `DateAlerte`) VALUES
(418, 'Sat Apr 11 18:34:43 2020\n', NULL, 1, 'Cam51', '2020-04-11');

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
(1, 'Cam51', 'cam51', 'INT', 'pos51', 720, 1280, '192.168.0.51', 'FTP', NULL, NULL, 'rtsp://192.168.2.51/11', 'WXH-121433-DFEAA'),
(2, 'Cam52', 'cam52', 'INT', 'pos52', 720, 1280, '192.168.0.52', 'FTP', NULL, NULL, NULL, ''),
(3, 'Cam53', 'cam53', 'EXT', 'pos53', 1280, 768, '192.168.0.53', 'RTSP', NULL, NULL, NULL, ''),
(4, 'Cam54', 'cam54', 'INT', 'pos54', 720, 1280, '192.168.0.54', 'RTSP', NULL, NULL, NULL, ''),
(5, 'Cam55', 'cam55', 'INT', 'Labo', 1024, 768, '192.168.0.55', 'FTP', NULL, NULL, NULL, ''),
(6, 'Cam56', 'cam56', 'INT', 'pos56', 1024, 768, '192.168.0.56', 'FTP', NULL, NULL, NULL, ''),
(7, 'Cam57', 'cam57', 'EXT', 'pos57-Atelier', 1024, 768, '192.168.0.57', 'FTP', NULL, NULL, NULL, '');

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
(36, 'Temperature', 'Capt temp21', NULL, NULL, 21, 24.06, 5),
(37, 'Ouverture', 'Ouverture PF Salle', NULL, NULL, 4674901, NULL, NULL),
(38, 'Ouverture', 'Ouverture 1', NULL, NULL, 5526869, NULL, NULL),
(39, 'Mouvement', 'Capt Mvt Salle', NULL, NULL, 7689557, NULL, NULL),
(40, 'Ouverture', 'PorteEntree', NULL, NULL, 5330261, NULL, NULL),
(41, 'Mouvement', 'Capt Mvt Chamb2', NULL, NULL, 4541765, NULL, NULL),
(42, 'Mouvement', 'Capt Mvt Atelier', NULL, NULL, 5592437, NULL, NULL),
(43, 'Mouvement', 'Capt Ouverture 3', NULL, NULL, 13631487, NULL, NULL),
(44, 'Mouvement', 'Capteur  Mvt Chamb1', NULL, NULL, 12770345, NULL, NULL),
(45, 'Mouvement', 'Mvt St Denis Entree', NULL, NULL, 12801493, NULL, NULL),
(46, 'Temperature', 'Capt Temp 2', NULL, NULL, 22, 17.1, 4),
(47, 'Mouvement', 'Capt Mvt Atelier', NULL, NULL, 5592437, NULL, NULL),
(48, 'Ouverture', 'Cave St Denis', NULL, NULL, 12866901, NULL, NULL),
(49, 'Ouverture', 'Pas placé', NULL, NULL, 205870420, NULL, NULL),
(50, 'Mouvement', 'Capt Mvt Demo', NULL, NULL, 12770345, NULL, NULL);

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
(1, '2020-04-11-11avr2020_17:59:34.jpg', '2020-04-11 17:59:35'),
(2, 'Cam51-11avr2020_18:08:09.jpg', '2020-04-11 18:08:10'),
(3, '2020-04-11-11avr2020_18:23:51.jpg', '2020-04-11 18:23:52'),
(4, 'Cam51-11avr2020_18:34:43.jpg', '2020-04-11 18:34:44'),
(5, '2020-04-11-11avr2020_18:47:52.jpg', '2020-04-11 18:47:52'),
(6, '2020-04-11-11avr2020_20:36:44.jpg', '2020-04-11 20:36:44'),
(7, '2020-04-11-11avr2020_20:53:55.jpg', '2020-04-11 20:53:55'),
(8, '2020-04-11-11avr2020_20:54:47.jpg', '2020-04-11 20:54:47'),
(9, '2020-04-11-11avr2020_17:44:06.jpg', '2020-04-11 17:44:07'),
(10, '2020-04-11-11avr2020_17:54:08.jpg', '2020-04-11 17:54:09'),
(11, '2020-04-11-11avr2020_17:57:01.jpg', '2020-04-11 17:57:01'),
(12, '8', NULL),
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
  `nomSite` char(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pwd` text CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `etatVMC` tinyint(1) DEFAULT 0,
  `pwdSMS` char(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `INFO`
--

INSERT INTO `INFO` (`IdInfo`, `NoTel3G`, `nomSite`, `pwd`, `state`, `etatVMC`, `pwdSMS`) VALUES
(1, '0769101655', 'StDenis', 'test', 1, 1, '3456');

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
(1, 'admin', 'admin', 3),
(2, 'gilles', 'gilles', 3);

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
  MODIFY `IdAlert` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=423;
--
-- AUTO_INCREMENT pour la table `CAMERA`
--
ALTER TABLE `CAMERA`
  MODIFY `IdCam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT pour la table `CAPTEUR`
--
ALTER TABLE `CAPTEUR`
  MODIFY `IdCapt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT pour la table `INFO`
--
ALTER TABLE `INFO`
  MODIFY `IdInfo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `OPERATEUR`
--
ALTER TABLE `OPERATEUR`
  MODIFY `IdOp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
