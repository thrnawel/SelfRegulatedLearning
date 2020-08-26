-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 26 août 2020 à 01:05
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `oaa`
--

-- --------------------------------------------------------

--
-- Structure de la table `apprenant`
--

DROP TABLE IF EXISTS `apprenant`;
CREATE TABLE IF NOT EXISTS `apprenant` (
  `idApprenant` int(11) NOT NULL AUTO_INCREMENT,
  `nomApprenant` varchar(50) NOT NULL,
  `prenomApprenant` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mot_de_passe` varchar(100) NOT NULL,
  PRIMARY KEY (`idApprenant`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `apprenant`
--

INSERT INTO `apprenant` (`idApprenant`, `nomApprenant`, `prenomApprenant`, `email`, `mot_de_passe`) VALUES
(1, 'ikram', 'ben', 'ikram@gmail.com', 'ikik'),
(2, 'ikram', 'ben', 'ik@gmail.com', 'benik'),
(3, 'Ikram', 'Ben', 'ikramBen@gmail.com', 'ikaiko'),
(4, 'Abbad', 'Yacine', 'yacine@gmail.com', 'yaya'),
(5, 'Abbad', 'Yacine', 'abd@gmail.com', 'yaya'),
(10, 'ikram', 'ben', 'b@gmail.com', 'okok'),
(11, 'wafia', 'abbad', 'abadw@gmail.com', 'wawa'),
(13, 'yasmine', 'didi', 'yasmine@gmail.com', 'yas');

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

DROP TABLE IF EXISTS `cours`;
CREATE TABLE IF NOT EXISTS `cours` (
  `idCours` int(11) NOT NULL AUTO_INCREMENT,
  `plateforme_url` varchar(100) NOT NULL,
  `nomCours` varchar(200) NOT NULL,
  `id_apprenant_plateforme` int(11) NOT NULL,
  PRIMARY KEY (`idCours`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cours`
--

INSERT INTO `cours` (`idCours`, `plateforme_url`, `nomCours`, `id_apprenant_plateforme`) VALUES
(1, 'OC', 'php', 1),
(2, 'OC', 'java', 1),
(3, 'OC', 'html', 1),
(4, 'OC', 'css', 1),
(5, 'OC', 'javaScript', 1),
(6, 'OC', 'mongo', 1),
(7, 'OC', 'php', 12472),
(8, 'OC', 'php', 12),
(9, 'OC', 'php', 1234566),
(10, 'OC', 'java', 12),
(11, 'OC', 'uu', 12472),
(12, 'zero', 'java', 123),
(13, 'OC', 'php', 1234),
(14, 'OC', 'javaS', 1234),
(15, 'OC', 'mmmmm', 12345566),
(16, 'OC', 'php', 9),
(17, 'openclassroom', 'javaEE', 12),
(18, 'OpenClassrooms', 'javaEE', 471),
(19, 'OpenClassrooms', 'Python', 472),
(20, 'OC', 'html css', 12),
(21, 'x', 'y', 12),
(22, 'y', 'x', 12),
(23, 'OC', 'xy', 1222),
(24, 'OC', 'php', 13),
(25, 'OC', 'php', 1247),
(26, 'xx', 'yy', 12),
(27, 'u', 'xxxx', 12),
(28, 'Z', 'T', 1),
(29, 'aa', 'java', 1234566),
(30, 'A', 'B', 13),
(31, 'p', 'p', 7),
(32, 'open', 'css', 142),
(33, 'k', 'k', 9);

-- --------------------------------------------------------

--
-- Structure de la table `cours_has_suggestion`
--

DROP TABLE IF EXISTS `cours_has_suggestion`;
CREATE TABLE IF NOT EXISTS `cours_has_suggestion` (
  `cours_idCours` int(11) NOT NULL,
  `suggestion_idSuggestion` int(11) NOT NULL,
  PRIMARY KEY (`cours_idCours`,`suggestion_idSuggestion`),
  KEY `fk_cours_has_suggestion_suggestion1_idx` (`suggestion_idSuggestion`),
  KEY `fk_cours_has_suggestion_cours1_idx` (`cours_idCours`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `indicateur`
--

DROP TABLE IF EXISTS `indicateur`;
CREATE TABLE IF NOT EXISTS `indicateur` (
  `idIndicateur` int(11) NOT NULL AUTO_INCREMENT,
  `nomIndicateur` varchar(100) NOT NULL,
  `type` varchar(45) NOT NULL,
  `valeur` double NOT NULL,
  `valeursNormales` double NOT NULL,
  `stratégie_idStratégie` int(11) NOT NULL,
  `apprenant_idApprenant` int(11) NOT NULL,
  PRIMARY KEY (`idIndicateur`),
  KEY `fk_indicateur_stratégie1_idx` (`stratégie_idStratégie`),
  KEY `fk_indicateur_apprenant1_idx` (`apprenant_idApprenant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `indicateur_has_suggestion`
--

DROP TABLE IF EXISTS `indicateur_has_suggestion`;
CREATE TABLE IF NOT EXISTS `indicateur_has_suggestion` (
  `indicateur_idIndicateur` int(11) NOT NULL,
  `suggestion_idSuggestion` int(11) NOT NULL,
  PRIMARY KEY (`indicateur_idIndicateur`,`suggestion_idSuggestion`),
  KEY `fk_indicateur_has_suggestion_suggestion1_idx` (`suggestion_idSuggestion`),
  KEY `fk_indicateur_has_suggestion_indicateur1_idx` (`indicateur_idIndicateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `objectif`
--

DROP TABLE IF EXISTS `objectif`;
CREATE TABLE IF NOT EXISTS `objectif` (
  `apprenant_idApprenant` int(11) NOT NULL,
  `cours_idCours` int(11) NOT NULL,
  `description_objectif` varchar(45) NOT NULL,
  PRIMARY KEY (`apprenant_idApprenant`,`cours_idCours`),
  KEY `fk_apprenant_has_cours_cours1_idx` (`cours_idCours`),
  KEY `fk_apprenant_has_cours_apprenant1_idx` (`apprenant_idApprenant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `objectif`
--

INSERT INTO `objectif` (`apprenant_idApprenant`, `cours_idCours`, `description_objectif`) VALUES
(1, 1, 'terminer le cours dans une semaine'),
(1, 6, 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkk'),
(1, 7, 'terminer le cours dans 5 jours'),
(1, 9, 'terminer le cours dans une semaine '),
(1, 10, 'terminer le cours dans une semaine '),
(1, 12, 'terminer le cours dans une semaine \r\n'),
(1, 13, 'cxxxxxxxxxxxxxxx'),
(1, 14, 'hhhhhhhhhhhhhhhhhhh'),
(1, 15, 'xxxxxxxxxxxxxxxxxxxxx'),
(1, 16, 'nn'),
(1, 17, 'terminer le cours dans une semaine '),
(1, 18, 'Terminer le cours dans une semaine \r\n'),
(1, 19, 'terminer le cours dans une semaine'),
(1, 21, 'xxxxxxxxxxxxx'),
(1, 22, 'xxxxxxxxxxx'),
(1, 23, 'xxxxxxxxxxxxxxx'),
(1, 24, 'terminer le cours'),
(1, 25, 'xxxxxxxxxxxxxxxxxxxxxxxxx'),
(4, 26, 'xxxxxxxx'),
(4, 27, 'UUUUUUUUUUUUUU'),
(4, 30, 'xxxxxxxxxxxxxxxxxxx'),
(11, 28, 'TTTTTTTTTT'),
(11, 29, 'HH'),
(13, 32, 'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii'),
(13, 33, 'jkb');

-- --------------------------------------------------------

--
-- Structure de la table `strategie`
--

DROP TABLE IF EXISTS `strategie`;
CREATE TABLE IF NOT EXISTS `strategie` (
  `idStrategie` int(11) NOT NULL AUTO_INCREMENT,
  `nomStrategie` varchar(100) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`idStrategie`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `strategie`
--

INSERT INTO `strategie` (`idStrategie`, `nomStrategie`, `description`) VALUES
(1, 'Gestion du temps', '-Estimez le temps necessaire a la formation et repartissez les heurs equitablement entre les differents jours de la semaine en mettant un planning clair '),
(2, 'Fixation d objectifs ', '\r\n-Fixez tous les objectifs que vous souhaitez atteindre dans votre parcours de formation avant de commencer                             \r\n-Saisissez toutes les connaissances que vous souhaitez acquerir \r\n'),
(3, 'Rechercher d information et Demande d aide\r\n', '\r\n-Posez des questions des le depart. Choisissez les bons mots cles avec une bonne syntaxe\r\n-Utilisez les outils appropries et les filtres langues/ pays appropries\r\n-Evaluez la fiabilite des informations et la pertinence des resultats\r\n(En utilisant des moteurs et metamoteurs, Outils de traduction..)\r\n\r\n'),
(4, 'Elaboration ', '-Gardez toujours avec vous un cahier et un stylo dedies \r\n-Prenez des notes \r\n'),
(5, 'Regularite', '-Adoptez des rythmes reguliers tout au long du parcours\r\n'),
(6, 'Relecture pour consolidation ou rectification ', '-Si vous trouvez qu un tel chapitre est difficilement comprehensible, il vaut la peine que vous relisiez les chapitres precedents\r\n'),
(7, 'Structuration de l\'environnement ', '-Installez-vous dans un endroit dedie a l apprentissage (calme), idealement un bureau, loin de toute distraction\r\n-Interdisez-vous d acceder a l internet pour d autres choses que les recherches obligatoires \r\n-Prenez soin d avoir a portee de main tout le materiel necessaire(ordiateur avec connexion internet)\r\n');

-- --------------------------------------------------------

--
-- Structure de la table `suggestion`
--

DROP TABLE IF EXISTS `suggestion`;
CREATE TABLE IF NOT EXISTS `suggestion` (
  `idSuggestion` int(11) NOT NULL AUTO_INCREMENT,
  `methode` varchar(200) NOT NULL,
  PRIMARY KEY (`idSuggestion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `trace`
--

DROP TABLE IF EXISTS `trace`;
CREATE TABLE IF NOT EXISTS `trace` (
  `idTrace` int(11) NOT NULL AUTO_INCREMENT,
  `nomTrace` varchar(100) NOT NULL,
  `debut` datetime(6) NOT NULL,
  `fin` datetime(6) NOT NULL,
  `apprenant_idApprenant` int(11) NOT NULL,
  `cours_idCours` int(11) NOT NULL,
  PRIMARY KEY (`idTrace`),
  KEY `fk_trace_apprenant1_idx` (`apprenant_idApprenant`),
  KEY `fk_trace_cours1_idx` (`cours_idCours`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `trace_has_indicateur`
--

DROP TABLE IF EXISTS `trace_has_indicateur`;
CREATE TABLE IF NOT EXISTS `trace_has_indicateur` (
  `trace_idTrace` int(11) NOT NULL,
  `indicateur_idIndicateur` int(11) NOT NULL,
  PRIMARY KEY (`trace_idTrace`,`indicateur_idIndicateur`),
  KEY `fk_trace_has_indicateur_indicateur1_idx` (`indicateur_idIndicateur`),
  KEY `fk_trace_has_indicateur_trace1_idx` (`trace_idTrace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cours_has_suggestion`
--
ALTER TABLE `cours_has_suggestion`
  ADD CONSTRAINT `fk_cours_has_suggestion_cours1` FOREIGN KEY (`cours_idCours`) REFERENCES `cours` (`idCours`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cours_has_suggestion_suggestion1` FOREIGN KEY (`suggestion_idSuggestion`) REFERENCES `suggestion` (`idSuggestion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `indicateur`
--
ALTER TABLE `indicateur`
  ADD CONSTRAINT `fk_indicateur_apprenant1` FOREIGN KEY (`apprenant_idApprenant`) REFERENCES `apprenant` (`idApprenant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_indicateur_stratégie1` FOREIGN KEY (`stratégie_idStratégie`) REFERENCES `strategie` (`idStrategie`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `indicateur_has_suggestion`
--
ALTER TABLE `indicateur_has_suggestion`
  ADD CONSTRAINT `fk_indicateur_has_suggestion_indicateur1` FOREIGN KEY (`indicateur_idIndicateur`) REFERENCES `indicateur` (`idIndicateur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_indicateur_has_suggestion_suggestion1` FOREIGN KEY (`suggestion_idSuggestion`) REFERENCES `suggestion` (`idSuggestion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `objectif`
--
ALTER TABLE `objectif`
  ADD CONSTRAINT `fk_apprenant_has_cours_apprenant1` FOREIGN KEY (`apprenant_idApprenant`) REFERENCES `apprenant` (`idApprenant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_apprenant_has_cours_cours1` FOREIGN KEY (`cours_idCours`) REFERENCES `cours` (`idCours`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `trace`
--
ALTER TABLE `trace`
  ADD CONSTRAINT `fk_trace_apprenant1` FOREIGN KEY (`apprenant_idApprenant`) REFERENCES `apprenant` (`idApprenant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_trace_cours1` FOREIGN KEY (`cours_idCours`) REFERENCES `cours` (`idCours`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `trace_has_indicateur`
--
ALTER TABLE `trace_has_indicateur`
  ADD CONSTRAINT `fk_trace_has_indicateur_indicateur1` FOREIGN KEY (`indicateur_idIndicateur`) REFERENCES `indicateur` (`idIndicateur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_trace_has_indicateur_trace1` FOREIGN KEY (`trace_idTrace`) REFERENCES `trace` (`idTrace`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
