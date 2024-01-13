-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : sam. 13 jan. 2024 à 00:12
-- Version du serveur : 5.7.24
-- Version de PHP : 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `snowtricks`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_image_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `categories_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `name`, `slug`, `description`, `main_image_name`, `update_at`, `categories_id`, `author_id`, `created_at`) VALUES
(1, 'Backside Air', 'backside-air', 'Hello World On commence tout simplement avec LE trick. Les mauvaises langues prétendent qu’un backside air suffit à reconnaître ceux qui savent snowboarder. Si c’est vrai, alors Nicolas Müller est le meilleur snowboardeur du monde. Personne ne sait s’étirer aussi joliment, ne demeure aussi zen, n’est aussi provocant dans la jouissance.', '657d8a34add02-enni-rukajarvi.avif', '2023-12-02 22:25:25', 2, 1, NULL),
(2, 'One Foot Tricks', 'one-foot-tricks', 'Bode Merril est la preuve vivante que la réincarnation n’est pas un conte de fée. Dans sa vie antérieure de flamant rose, il avait déjà l’habitude d’affronter le quotidien sur une patte. Quelque 200 ans plus tard, il a eu la chance d’être un homme doté d’un snowboard, ce qui a fini par donner à son être l’élan nécessaire. Il aime bien s’avaler quelques one foot double backflips au p’tit déj.', 'https://www.outsidepursuits.com/wp-content/uploads/2020/07/Tips-to-Get-Started-Snowboarding.jpg', '2023-12-03 11:29:50', 1, 3, NULL),
(3, 'Switch Backside Rodeo 720', 'switch-backside-rodeo-720', 'Si l’univers du snowboard a jamais disposé d’un scientifique, alors c’était David Benedek. Personne mieux que lui n’a su comment monter un kicker pour qu’un trick marche bien. En musique, on qualifie cela d’expérimental. Ce n’est pas un hasard si c’est précisément lui qui a eu l’idée de faire un switch BS rodeo.', 'https://img.redbull.com/images/c_crop,x_0,y_108,h_1012,w_1125/c_fill,w_400,h_368/q_auto,f_auto/redbullcom/2019/11/07/35e1c24a-18ed-4c67-8d11-7f1a7443aaea/jose-fernandes-young', '2023-12-03 11:41:03', 2, 4, NULL),
(4, 'BS 540 Seatbelt', 'bs-540-seatbelt', 'Hitsch aurait tout aussi bien pu faire de la danse classique mais il s’est décidé pour la neige. Peut-être tout simplement parce qu’en Engadine, les montagnes sont plus séduisantes que les gymnases. Quoi qu’il en soit, quiconque arrive à attraper aussi tranquillement l’arrière de la planche avec la main avant pendant un BS 5 dans un half-pipe sans s’ouvrir les lèvres sur le coping devrait occuper une chaire à Cambridge sur les prodiges de la coordination.', 'https://img.redbull.com/images/c_crop,x_1202,y_0,h_3609,w_4211/c_fill,w_400,h_338/q_auto,f_auto/redbullcom/2018/11/29/7c7a3998-2fbd-458a-9c33-89d9dacf709e/ski-europe-meilleures-stations', '2023-12-03 14:53:27', 1, 3, NULL),
(5, 'FS 720 Japan', 'fs-720-japan', 'Si, dans le monde du snowboard, il y avait aujourd’hui encore quelque chose de comparable au rock’n’roll, Ben Ferguson en serait le Jim Morrison, haut la main. Son riding est radical, sans compromis et beau à voir. Bien entendu, rien ne se fait à moins de 200 km/h, pas même les FS 7 Japan dans le pipe.', 'https://www.whistlerskipros.com/images/mobile/wspn.m.21.jpg', '2023-12-03 15:23:33', 3, 4, NULL),
(6, 'Skate Skills', 'skate-skills', 'Scott «MacGyver» Stevens n’aurait en fait pas besoin de forfait de remontée. Scott n’aurait même pas besoin d’aller à la montagne. Scott a juste à sortir de chez lui, respirer un bon coup et démarrer. Après trois jours de tournage, son rôle serait plus long et plus créatif que pour ceux qui ont dû passer 20 heures en avion, 10 heures en voiture, 5 heures en Ski-Doo et 2 heures en hélicoptère pour leur séquence.', 'https://static.pratique.fr/images/unsized/co/comment-skier-comme-un-pro-istock-com-marcin-wiklik-223-1608223150.jpg', '2023-12-08 15:12:37', 1, 1, NULL),
(7, 'Going bigger', 'going-bigger', 'Soyons francs, tous les tricks de Travis pourraient être des signatures. Son genre «I go bigger» se voit probablement dès le matin aux toilettes. Trois fois par dessus la tête ou simply straight, il semble que Travis puisse à peu près tout essayer plus haut, plus loin, plus extrême, plus beau et en premier la plupart du temps.', 'https://www.ski-dazzle.com/wp-content/uploads/choose-when-to-ski-this-winter-1030x568.jpg', '2023-12-08 18:17:12', 1, 1, NULL),
(8, 'McTwist', 'mctwist', 'Terje se sent mieux dans les transitions que Trump dans sa tour. Pas étonnant, il a détenu pendant longtemps le record du highest air. En mars 2007 à Oslo, il s’est catapulté à un bon 9,8 mètres sur un quarterpipe. Pendant le saut, l’altitude l’a surpris lui-même, c’est pourquoi il a rapidement transformé la méthode prévue en un BS 360. Pourquoi se priver quand on peut. Les McTwists dans un half-pipe par contre c’est plutôt comme une fête d’anniversaire. On a besoin d’un peu d’alley-oop et de chicken wings pour trouver le frisson.\n', 'https://photos.demandstudios.com/getty/article/76/92/200367036-001.jpg', '2023-12-08 19:05:57', 1, 1, NULL),
(9, 'Buttered Tricks\n', 'buttered-tricks', 'Que faire quand passer les kickers devient monotone? Facile, on rend l’approche plus difficile. C’est du moins ce que s’est dit Jussi quand il a filmé son rôle pour Afterbang (Robot Food; 2002). Concrètement, ça veut dire faire du buttering à gogo. Pour Jussi, ce n’est pas vraiment un problème même avant un switch backside 900.', 'https://www.bonneglisse.fr/images/snowboard-freestyle-pro_10.jpg', '2023-12-08 19:06:24', 1, 1, NULL),
(14, 'Nuckle Trickss', 'nuckle-trickss', 'Marcus est né juste avant le millénaire et atteint sa majorité cette année. Quel toupet quand on pense à tous les tricks que ce gamin a déjà sous la ceinture. Qu’est-ce que vont dire ses petits enfants en 2075 quand il leur racontera qu’il a appris à faire ses premier 1080 en atterrissant des kickers? Et qu’est-ce qu’il pourra bien leur raconter sur les 2022? Backside Octa Cork to FS Edgeslide au-dessus de télécabine to Triple FS Rodeo Truck Driver out?', 'elena-hight-lake-tahoe.avif', '2023-12-09 01:23:38', 1, 1, NULL),
(15, 'Switch Method', 'switch-method', 'Danny Davis est comme ces meilleurs potes qui peuvent faire tous les tricks avec juste un tout petit plus de classe que toi. Aussi difficiles ou aussi faciles soient-ils. Si un nombre incalculable de blessures ne l’avait pas cloué au lit, il aurait mis sens dessus dessous le monde de la compétition en pipe. Heureusement qu’il y a la vidéo. Et puis on peut quand même se faire une compétition de temps en temps. Et alors on peut y mettre un peu de switch method pour faire tomber les juges à la renverse.', '657453819c34f-mobile_wallpaper.jpg', '2023-12-09 11:46:09', 1, 1, NULL),
(16, 'Nuckle Tricks', 'nuckle-tricks', 'Nuckle Tricks', '6578ab813d108-enni-rukajarvi.avif', '2023-12-12 18:50:41', 1, 1, NULL),
(17, 'FSS 900', 'fss-900', 'Quand le style est vraiment original, on le reconnaît même dans les tricks banals. Vous en voulez l’exemple parfait? Travis Parker. Il fait un FS 900 (aujourd’hui aussi banal que l’était l’indy il y a 20 ans) depuis la carre front, tient le nose et pendant un instant le monde s’immobilise. Que Travis soit original est de toute manière indiscutable. Qui d’autre annule du jour au lendemain les contrats avec tous ses sponsors pour devenir cuisinier de sushis?', '65855752cc500-elena-hight-lake-tahoe.avif', '2023-12-29 16:04:24', 1, 1, NULL),
(18, 'FS 900', 'fs-900', 'Quand le style est vraiment original, on le reconnaît même dans les tricks banals. Vous en voulez l’exemple parfait? Travis Parker. Il fait un FS 900 (aujourd’hui aussi banal que l’était l’indy il y a 20 ans) depuis la carre front, tient le nose et pendant un instant le monde s’immobilise. Que Travis soit original est de toute manière indiscutable. Qui d’autre annule du jour au lendemain les contrats avec tous ses sponsors pour devenir cuisinier de sushis?\r\nTravis Parker | Robot Food', 'elena-hight-lake-tahoe.avif', '2023-12-12 19:18:44', 1, 1, NULL),
(23, 'Vidéo : Une snowboardeuse poursuivie par un ours !', 'vidéo-:-une-snowboardeuse-poursuivie-par-un-ours-!', 'Voici comment survivre face à un ours\r\n\r\nRUN !!!!!!', '657d6502ec2d7-kai-lenny-travis-rice-life-of-kai.avif', '2023-12-16 08:32:09', 1, 1, NULL),
(25, 'like that', 'like-that', 'goods?', 'elena-hight-lake-tahoe.avif', '2024-01-05 09:23:37', 1, 1, NULL),
(26, 'Like this or that', 'like-this-or-that', 'Like that', 'composition-point-interrogation-paysage-naturel_23-2150525235.jpg', '2023-12-23 07:33:39', 1, 1, '2023-12-23 07:33:39'),
(27, 'What Do you Want', 'what-do-you-want', 'do you want', 'Red-Bull-SPECT-Ski-Goggles-MAGNETRON-SLICK-008.jpg', '2023-12-23 08:13:04', 1, 1, '2023-12-23 08:05:33'),
(28, 'This is O ?', 'this-is-o-?', 'Like OK', 'composition-point-interrogation-paysage-naturel_23-2150525235.jpg', '2023-12-23 08:14:28', 1, 1, '2023-12-23 08:14:28'),
(29, 'Figure', 'figure', 'ok', 'composition-point-interrogation-paysage-naturel_23-2150525235.jpg', '2024-01-12 21:18:16', 1, 14, '2024-01-05 15:48:07'),
(30, 'Figures', 'figures', 'Prenez vos Skis', 'mark-landvik-hakuba.avif', '2024-01-12 23:09:41', 1, 15, '2024-01-12 15:28:53');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Débutant'),
(2, 'Intermédiaire'),
(3, 'Confirmé'),
(4, 'Expert');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `article_id`, `author_id`, `created_at`, `content`) VALUES
(1, 2, 1, '2024-01-05 14:51:32', 'good'),
(2, 25, 1, '2024-01-05 15:04:18', 'bien'),
(4, 26, 1, '2024-01-05 15:04:53', 'ok'),
(5, 1, 14, '2024-01-05 15:45:45', 'Super tricks'),
(7, 1, 14, '2024-01-05 15:47:06', 'Je confirme le comment'),
(8, 29, 14, '2024-01-05 15:54:48', 'Good'),
(9, 29, 13, '2024-01-05 18:48:30', 'I think also'),
(10, 29, 1, '2024-01-07 10:57:18', 'Pretty web site'),
(11, 29, 1, '2024-01-07 10:58:13', 'I think also 2'),
(12, 27, 15, '2024-01-12 15:27:30', 'Wouha super article.');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20231113080228', '2023-11-13 09:42:58', 419),
('DoctrineMigrations\\Version20231203151629', '2023-12-03 15:19:13', 130),
('DoctrineMigrations\\Version20231222161058', '2023-12-22 16:11:19', 136),
('DoctrineMigrations\\Version20231223075959', '2023-12-23 08:05:11', 66);

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id`, `article_id`, `name`, `file`, `update_at`) VALUES
(3, 14, 'WIN_20230811_13_52_12_Scan.jpg', 'composition-point-interrogation-paysage-naturel_23-2150525235.jpg', '2023-12-28 18:06:57'),
(4, 14, 'WIN_20230811_13_52_38_Scan.jpg', '6573c19a971db-WIN_20230811_13_52_38_Scan.jpg', '2023-12-09 01:23:38'),
(5, 15, 'WIN_20230811_13_52_12_Scan.jpg', '657453819cc5e-WIN_20230811_13_52_12_Scan.jpg', '2023-12-09 11:46:09'),
(6, 15, 'WIN_20230811_13_52_38_Scan.jpg', '657453819d24e-WIN_20230811_13_52_38_Scan.jpg', '2023-12-09 11:46:09'),
(7, 16, 'mark-landvik-hakuba.avif', '6578ab813d8a8-mark-landvik-hakuba.avif', '2023-12-12 18:50:41'),
(8, 16, 'elena-hight-lake-tahoe.avif', '6578ab813dece-elena-hight-lake-tahoe.avif', '2023-12-12 18:50:41'),
(9, 17, 'kai-lenny-travis-rice-life-of-kai.avif', '6578abe5d148b-kai-lenny-travis-rice-life-of-kai.avif', '2023-12-29 15:12:36'),
(10, 17, 'mark-landvik-hakuba.avif', 'Red-Bull-SPECT-Ski-Goggles-MAGNETRON-SLICK-008.jpg', '2023-12-29 15:23:24'),
(11, 18, 'mark-landvik-hakuba.avif', '6578b21462fa8-mark-landvik-hakuba.avif', '2023-12-12 19:18:44'),
(12, 29, 'composition-point-interrogation-paysage-naturel_23-2150525235.jpg', '659824b7498f1-composition-point-interrogation-paysage-naturel_23-2150525235.jpg', '2024-01-05 15:48:07'),
(13, 29, 'Red-Bull-SPECT-Ski-Goggles-MAGNETRON-SLICK-008.jpg', '659824b749fe8-Red-Bull-SPECT-Ski-Goggles-MAGNETRON-SLICK-008.jpg', '2024-01-05 15:48:07'),
(14, 30, 'elena-hight-lake-tahoe.avif', '65a15ab55d6d0-elena-hight-lake-tahoe.avif', '2024-01-12 15:28:53'),
(15, 30, 'enni-rukajarvi.avif', '65a15ab55edeb-enni-rukajarvi.avif', '2024-01-12 15:28:53'),
(16, 30, 'Red-Bull-SPECT-Ski-Goggles-MAGNETRON-SLICK-008.jpg', '65a1c6b57b5d8-Red-Bull-SPECT-Ski-Goggles-MAGNETRON-SLICK-008.jpg', '2024-01-12 23:09:41'),
(17, 30, 'kai-lenny-travis-rice-life-of-kai.avif', '65a1c6b57c352-kai-lenny-travis-rice-life-of-kai.avif', '2024-01-12 23:09:41');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(1, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":4:{i:0;s:34:\\\"pages/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:169:\\\"http://127.0.0.1:8000/verify/email?expires=1700326347&signature=TM6Xm4OKuwGOEIK5xyYsgN9BXrr%2BseAxQU2scAZckKI%3D&token=ozP%2FoNOOplhyhP8EBwKcRmbelxk%2BYGzR20Sy1Lpw8Lk%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"contact@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:19:\\\"no-reply SnowTricks\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:18:\\\"getssone@mailo.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2023-11-18 15:52:27', '2023-11-18 15:52:27', NULL),
(2, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":4:{i:0;s:30:\\\"reset_password/email.html.twig\\\";i:1;N;i:2;a:1:{s:10:\\\"resetToken\\\";O:58:\\\"SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\\":4:{s:65:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0token\\\";s:40:\\\"XqENamc1vba52EMdVUEFPUq7pq9OKdfHuwAPNbUf\\\";s:69:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0expiresAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2023-11-19 17:26:17.832161\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:71:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0generatedAt\\\";i:1700411177;s:73:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0transInterval\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:17:\\\"contact@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:19:\\\"no-reply SnowTricks\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:18:\\\"getssone@mailo.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:27:\\\"Your password reset request\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2023-11-19 16:26:17', '2023-11-19 16:26:17', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `roles` json NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `avatar`, `is_verified`, `roles`) VALUES
(1, 'Getssone', 'getssone@mailo.com', '$2y$13$.EZcyuxiGQGYa3WmV14fBuO98h6ekygTzKYQsUD7hXIqYVS7nYT1i', 'https://picsum.photos/id/237/200/300', 1, '[]'),
(3, 'testy', 'test@test.fr', '$2y$13$1NMTwZ91ap3DupzlyQI/uezC76cBfzUgWVsL6QsSQD82EAvbZZRZm', 'https://picsum.photos/200', 0, '[]'),
(4, 'testy2', 'test2@test.fr', '$2y$13$asxwN6wPqnwhae71FnqHie7vUCRpmOUh9.DNcBhTapNB6/L120gvm', 'https://picsum.photos/200', 0, '[]'),
(5, 'testy3', 'test3@test.fr', '$2y$13$8NWhbPKIU2wF22oOV9Q2ueClHX.HVCBsR606NUjXfQQUSY7gn2hNm', 'https://picsum.photos/200', 0, '[]'),
(6, 'testy4', 'test4@test.fr', '$2y$13$FteJyEBodJ3oPBb2wzt2YeN4AprQXhtKtQqMe.ctesoxK/gYxXePq', 'https://picsum.photos/200', 0, '[]'),
(7, 'testy5', 'test5@test.fr', '$2y$13$SWMnzotqPecQGX0tjLNM5uQQN6gCZMigul4fVZ3hpCCozaI9vtQOi', 'https://picsum.photos/200', 1, '[]'),
(8, 'testy6', 'test6@test.fr', '$2y$13$OoTCrbQ4tMjc6jTTY6G3QuWNJpsnod.2uF2otB7YdytvfR89uR1ay', 'https://picsum.photos/200', 1, '[]'),
(9, 'testy7', 'test7@test.fr', '$2y$13$CVJFQORadrOVq60Yf4bbruRe5Zdms7bidCPUEZal0Pj4oZi8SYKlK', 'https://picsum.photos/200', 1, '[]'),
(10, 'testy8', 'test8@test.fr', '$2y$13$e5sCsqgXqWeKcWwZ36FWCOux.2rHy8AyVfx5RhdcqALy2hrSpLo3K', 'https://picsum.photos/200', 1, '[]'),
(11, 'testy9', 'test9@test.fr', '$2y$13$JT/hWM8CC2mXBjamfpu6e.35kb4Znc/LeI4DkGVsaRmU5CSqrrgZW', 'https://picsum.photos/200', 0, '[]'),
(13, 'testy10', 'testy10@test.fr', '$2y$13$KmSoIKqMZ8z7QHGmCDEw8OvHAKEfZrVB5TzQJHXUEI3N6Sf4eaokK', 'https://picsum.photos/200', 0, '[]'),
(14, 'testy11', 'testy11@testy.fr', '$2y$13$XKmajQL9VwXJSSkkboPdy.jb8u0dTjR9b92RN7BognPP2iGr.tO5y', 'https://picsum.photos/200', 1, '[]'),
(15, 'toto', 'toto@toto.fr', '$2y$13$rjk0dz1cOUI.YKOuFQl4uOJclyzH2p7We/H73NxLxw1Ga18JPMVRO', 'https://picsum.photos/200', 0, '[]');

-- --------------------------------------------------------

--
-- Structure de la table `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `video`
--

INSERT INTO `video` (`id`, `article_id`, `link`, `update_at`) VALUES
(1, 1, 'https://www.youtube.com/watch?v=fbqHK8i-HdA', '2023-12-12 18:50:41'),
(2, 1, 'https://www.youtube.com/watch?v=EzGPmg4fFL8', '2023-12-12 18:52:21'),
(3, 2, 'https://www.youtube.com/watch?v=fbqHK8i-HdA', '2023-12-12 19:18:44'),
(8, 23, 'https://www.youtube.com/watch?v=vT_PNKg3v7s', '2023-12-16 08:32:09'),
(12, 18, 'https://www.youtube.com/watch?v=pG6Aa-T2S9k', '2023-12-22 09:44:38'),
(13, 17, 'https://www.youtube.com/watch?v=6nACCFseqYI', '2023-12-29 16:04:24'),
(15, 29, 'https://www.youtube.com/watch?v=wGGfoocZPAQ', '2024-01-12 21:14:06'),
(18, 30, 'https://www.youtube.com/watch?v=wGGfoocZPAQ', '2024-01-12 23:09:41');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_23A0E66A21214B7` (`categories_id`),
  ADD KEY `IDX_23A0E66F675F31B` (`author_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526C7294869C` (`article_id`),
  ADD KEY `IDX_9474526CF675F31B` (`author_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C53D045F7294869C` (`article_id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`);

--
-- Index pour la table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CC7DA2C7294869C` (`article_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_23A0E66A21214B7` FOREIGN KEY (`categories_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_23A0E66F675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C7294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `FK_9474526CF675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FK_C53D045F7294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `FK_7CC7DA2C7294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
