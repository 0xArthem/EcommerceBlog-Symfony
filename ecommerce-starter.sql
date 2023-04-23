-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 23 avr. 2023 à 16:19
-- Version du serveur : 5.7.36
-- Version de PHP : 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecommerce-starter`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `complement` longtext COLLATE utf8mb4_unicode_ci,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_postal` int(11) DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D4E6F81A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `user_id`, `full_name`, `company`, `address`, `complement`, `phone`, `city`, `code_postal`, `country`) VALUES
(11, 1, 'La Réunion', NULL, '77 rue de la paix', 'Bâtiment C9, étape 8, porte n°6', '0601187363', 'Saint-Pierre', 97410, 'FR'),
(12, 5, 'Adresse maison metropole', NULL, '8 chemin des cathédrales, bâtiment \"La roche\", étape 2, porte 9', NULL, '0783377271', 'Lille', 59000, 'FR'),
(13, 6, 'Maison SUD', NULL, '9 rue des lilas', NULL, '0601167227', 'Marseille', 13000, 'FR');

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_23A0E6612469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `category_id`, `title`, `description`, `content`, `image`, `is_active`, `slug`, `created_at`) VALUES
(1, 1, 'Les avantages des compléments alimentaires naturels pour une meilleure santé', '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi in orci sapien. Nam dictum metus mauris, in vulputate diam porttitor vel. Aliquam in feugiat justo. Nulla lacinia nec ligula vitae euismod. Ut cursus finibus feugiat. Donec libero leo, semper non diam id, ornare lacinia elit. Donec risus metus, porta quis elit vitae, vulputate euismod sem. Aliquam lobortis ipsum arcu, ac semper lacus interdum auctor. Nam nec sem sem. Cras aliquet eu elit nec bibendum. In mollis pretium orci. Integer eget augue id nunc varius hendrerit a ac dolor. Praesent et turpis erat. Phasellus ac justo ut nunc laoreet finibus.</div>', NULL, NULL, 1, 'avantages-complements-alimentaires-naturels-meilleure-sante', '2023-04-03 06:41:00'),
(2, 1, 'Comprendre les bienfaits des plantes adaptogènes sur notre santé', '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi in orci sapien. Nam dictum metus mauris, in vulputate diam porttitor vel. Aliquam in feugiat justo. Nulla lacinia nec ligula vitae euismod. Ut cursus finibus feugiat. Donec libero leo, semper non diam id, ornare lacinia elit. Donec risus metus, porta quis elit vitae, vulputate euismod sem. Aliquam lobortis ipsum arcu, ac semper lacus interdum auctor. Nam nec sem sem. Cras aliquet eu elit nec bibendum. In mollis pretium orci. Integer eget augue id nunc varius hendrerit a ac dolor. Praesent et turpis erat. Phasellus ac justo ut nunc laoreet finibus.</div>', NULL, NULL, 1, 'comprendre-bienfaits-plantes-adaptogenes-sante', '2023-04-07 06:40:00'),
(3, 1, 'Les huiles essentielles pour soulager les maux de tête : lesquelles choisir et comment les utiliser', '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget nisl nisi. Fusce ut consectetur urna. Donec cursus nec felis non sodales. Donec aliquam nisl lorem. Nunc tempus placerat lectus, quis mattis ante viverra non. Fusce mauris lorem, vulputate a tempor sed, sodales at dolor. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis et mi eget enim pellentesque fringilla. Maecenas sagittis, lacus sit amet placerat euismod, orci libero tempor eros, quis faucibus dui neque eget odio.</div>', '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget nisl nisi. Fusce ut consectetur urna. Donec cursus nec felis non sodales. Donec aliquam nisl lorem. Nunc tempus placerat lectus, quis mattis ante viverra non. Fusce mauris lorem, vulputate a tempor sed, sodales at dolor. <strong>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis et mi eget enim pellentesque fringilla.</strong> Maecenas sagittis, lacus sit amet placerat euismod, orci libero tempor eros, quis faucibus dui neque eget odio.<br><br></div><div>Nunc vitae lorem eu elit viverra efficitur. Aliquam efficitur vel leo scelerisque efficitur. Aenean faucibus arcu sit amet sapien gravida ultricies. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer pharetra odio ut justo congue laoreet non at dolor. Curabitur eu pulvinar metus, a fermentum magna. Nam iaculis venenatis felis. In accumsan, risus non malesuada sollicitudin, velit erat blandit turpis, quis faucibus sem dolor sed arcu. Suspendisse maximus turpis quam, eget aliquam diam feugiat id. Praesent sodales nulla eu dui lacinia tempus.<br><br></div><div>Pellentesque tristique metus sit amet ex pharetra, eu ultricies ligula fringilla. Mauris vitae ligula a turpis accumsan ullamcorper. Praesent eget tellus eget diam egestas iaculis nec in justo. Ut in imperdiet metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dictum feugiat sapien, eu pretium nibh lobortis vel. Praesent ut orci felis.<br><br></div><div>Vestibulum vitae auctor mauris. Curabitur bibendum posuere ligula nec eleifend. Etiam vitae malesuada lorem, ac malesuada velit. Etiam sodales nulla et velit sodales, quis porta felis laoreet. Vestibulum aliquet diam eros, sed pellentesque risus ultricies ut. Ut non iaculis erat, ac iaculis dolor. Integer non ligula non arcu rutrum sagittis quis ac lectus. Sed eu turpis magna. Etiam dapibus ex a ante mattis, at suscipit lorem condimentum. Donec quam dui, laoreet quis pharetra fringilla, vestibulum non augue. Mauris iaculis aliquet augue nec aliquet.<br><br></div><div>Phasellus efficitur est libero, nec rhoncus libero posuere dignissim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Ut et metus condimentum, ornare urna quis, laoreet ipsum. Proin volutpat lorem risus, nec dignissim dolor viverra suscipit. Nunc interdum pretium euismod. Nunc a tempor libero, a vehicula neque. Proin enim risus, rutrum quis erat consequat, convallis efficitur leo. Maecenas dictum ante vitae turpis tempor, ut auctor orci tristique. Maecenas nibh felis, blandit vel imperdiet id, dapibus eu orci. Suspendisse potenti. Fusce at accumsan ligula, nec gravida nibh.<br><br></div>', 'mononoke.jpg', 1, 'huiles-essentielles-soulager-maux-tete', '2023-04-05 09:59:00');

-- --------------------------------------------------------

--
-- Structure de la table `article_category`
--

DROP TABLE IF EXISTS `article_category`;
CREATE TABLE IF NOT EXISTS `article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article_category`
--

INSERT INTO `article_category` (`id`, `name`, `slug`) VALUES
(1, 'Huiles essentielles', 'huiles-essentielles'),
(2, 'Compléments alimentaires', 'compléments-alimentaires'),
(3, 'Plantes médicinales', 'plantes-médicinales'),
(4, 'Soins de la peau naturels', 'soins-de-la-peau-naturels'),
(5, 'Alimentation saine', 'alimentation-saine');

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

DROP TABLE IF EXISTS `carrier`;
CREATE TABLE IF NOT EXISTS `carrier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carrier`
--

INSERT INTO `carrier` (`id`, `name`, `description`, `price`, `created_at`, `updated_at`) VALUES
(1, 'FedEx', 'Livraison en 5 jours ouvrés', 299, '2023-04-01 07:35:19', '2023-04-01 07:35:19'),
(2, 'DHL', 'Livraison en 2 jours ouvrés', 690, '2023-04-01 07:35:29', '2023-04-01 07:35:29'),
(3, 'La Poste', 'Livraison en 3 jours ouvrés', 540, '2023-04-02 15:57:10', '2023-04-02 15:57:10');

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery_address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `more_informations` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL,
  `quantity` int(11) NOT NULL,
  `sub_total_ht` double NOT NULL,
  `taxe` double NOT NULL,
  `sub_total_ttc` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AB912789A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `reference`, `full_name`, `carrier_name`, `carrier_price`, `delivery_address`, `more_informations`, `created_at`, `quantity`, `sub_total_ht`, `taxe`, `sub_total_ttc`) VALUES
(73, 6, '690CA4A5-B4BA-6D17-758F-664CA2F7E3D9-', 'Maison SUD', 'La Poste', 5.4, 'Maison SUD : 9 rue des lilas - 13000 - FR.', NULL, '2023-04-23 16:17:21', 3, 36.97, 7.39, 49.76);

-- --------------------------------------------------------

--
-- Structure de la table `cart_details`
--

DROP TABLE IF EXISTS `cart_details`;
CREATE TABLE IF NOT EXISTS `cart_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carts_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `sub_total_ht` double NOT NULL,
  `taxe` double NOT NULL,
  `sub_total_ttc` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_89FCC38DBCB5C6F5` (`carts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cart_details`
--

INSERT INTO `cart_details` (`id`, `carts_id`, `product_name`, `product_price`, `quantity`, `sub_total_ht`, `taxe`, `sub_total_ttc`) VALUES
(74, 73, 'Crème de soin', 14.99, 2, 29.98, 5.996, 35.976),
(75, 73, 'Sérum régénérant à l\'huile de rose', 6.99, 1, 6.99, 1.398, 8.388);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `slug`) VALUES
(1, 'Hydratation', NULL, NULL, 'hydratation'),
(2, 'Sport', '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec suscipit convallis sapien. Praesent neque orci, feugiat non velit nec, laoreet luctus justo.<strong> Phasellus in vehicula odio. Ut vitae nibh nec justo facilisis vulputate sit amet vel magna.</strong> Sed at convallis arcu.<br><br></div>', NULL, 'sport'),
(3, 'Visage & corps', NULL, NULL, 'visage-et-corps');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `first_name`, `last_name`, `email`, `message`, `created_at`, `is_read`) VALUES
(1, 'Justine', 'Alerz', 'justinealerz@mail.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque elementum nulla et varius sollicitudin. Nulla urna nunc, hendrerit non quam et, mollis faucibus libero. Integer in accumsan purus. Maecenas auctor orci sit amet lacus venenatis mollis. Ut auctor, leo eu feugiat dapibus, ipsum urna eleifend felis, quis auctor justo nisl in neque. Curabitur convallis felis a fringilla molestie. Vivamus et mollis nisi. Pellentesque eget finibus est. Etiam vestibulum, odio pretium vulputate facilisis, eros lectus egestas turpis, sed eleifend odio velit vitae neque. Etiam lacinia tortor arcu. Vestibulum vitae justo lobortis, dapibus lacus sit amet, sollicitudin libero. Aliquam placerat pharetra porta.', '2023-04-06 07:03:48', 1);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery_address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `more_informations` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL,
  `quantity` int(11) NOT NULL,
  `sub_total_ht` double NOT NULL,
  `taxe` double NOT NULL,
  `sub_total_ttc` double NOT NULL,
  `stripe_checkout_session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `is_is_process` tinyint(1) NOT NULL,
  `is_in_delivering` tinyint(1) NOT NULL,
  `is_delivered` tinyint(1) NOT NULL,
  `is_in_return` tinyint(1) NOT NULL,
  `is_refunded` tinyint(1) NOT NULL,
  `is_canceled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F5299398A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `user_id`, `reference`, `full_name`, `carrier_name`, `carrier_price`, `delivery_address`, `more_informations`, `created_at`, `quantity`, `sub_total_ht`, `taxe`, `sub_total_ttc`, `stripe_checkout_session_id`, `is_paid`, `is_is_process`, `is_in_delivering`, `is_delivered`, `is_in_return`, `is_refunded`, `is_canceled`) VALUES
(26, 6, '690CA4A5-B4BA-6D17-758F-664CA2F7E3D9-', 'Maison SUD', 'La Poste', 5.4, 'Maison SUD : 9 rue des lilas - 13000 - FR.', NULL, '2023-04-23 16:17:21', 3, 36.97, 7.39, 49.76, 'cs_test_b1fkokg0bsT8ltKE4rYmJZYt4eyXUzFlSCcmUus5MVY95KqkXQTHcomoSZ', 1, 1, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `sub_total_ht` double NOT NULL,
  `taxe` double NOT NULL,
  `sub_total_ttc` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_845CA2C1CFFE9AD6` (`orders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `orders_id`, `product_name`, `product_price`, `quantity`, `sub_total_ht`, `taxe`, `sub_total_ttc`) VALUES
(27, 26, 'Crème de soin', 14.99, 2, 29.98, 5.996, 35.976),
(28, 26, 'Sérum régénérant à l\'huile de rose', 6.99, 1, 6.99, 1.398, 8.388);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `more_informations` longtext COLLATE utf8mb4_unicode_ci,
  `price` double DEFAULT NULL,
  `is_best_seller` tinyint(1) DEFAULT NULL,
  `is_new_arrival` tinyint(1) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT NULL,
  `is_special_offer` tinyint(1) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `last_price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `more_informations`, `price`, `is_best_seller`, `is_new_arrival`, `is_featured`, `is_special_offer`, `image`, `slug`, `is_active`, `last_price`) VALUES
(4, 'Sérum régénérant à l\'huile de rose', '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec semper nunc. Etiam semper tellus lorem, vitae fringilla ante rutrum a. <strong>Curabitur pharetra, nisl nec tempor facilisis, nunc augue condimentum nulla, in elementum nunc odio ultrices neque.</strong></div>', '<div>Etiam aliquam risus id mauris sagittis, laoreet tincidunt libero rhoncus. Ut placerat mauris enim, a gravida nunc maximus quis. Integer vehicula rhoncus massa vitae consectetur. Suspendisse vulputate purus quis risus volutpat facilisis. Praesent dapibus nec nisi nec malesuada. Praesent convallis a diam vel dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent enim ante, accumsan vitae lacus vel, blandit aliquet enim. Phasellus commodo sapien nec elementum dapibus. Integer non tempor est. Donec volutpat nulla ut ex pretium, sed suscipit ex pretium.<br><br></div><div><br><br></div>', 6.99, 1, 0, 0, 0, 'lilli-p-VnvPz_QDSeU-unsplash.jpg', 'serum-regenerant-a-l-huile-de-rose', 1, 0),
(5, 'Essence de bois de santal', '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec semper nunc. Etiam semper tellus lorem, vitae fringilla ante rutrum a. Curabitur pharetra, nisl nec tempor facilisis, nunc augue condimentum nulla, in elementum nunc odio ultrices neque.</div>', '<div>Donec egestas sed velit ut interdum. Duis lectus est, feugiat et dapibus eu, sollicitudin et sapien. Sed vestibulum ex risus, a tincidunt tortor facilisis nec. Phasellus sem mauris, luctus eget erat nec, facilisis venenatis nunc. Integer porta quam vitae orci vestibulum convallis.</div>', 15, 1, 0, 0, 0, 'viva-luna-studios-KiQt6CC0BvY-unsplash.jpg', 'essence-de-bois-de-santal', 1, 0),
(6, 'Baume de massage à l\'eucalyptus', '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec semper nunc. Etiam semper tellus lorem, vitae fringilla ante rutrum a. <strong>Curabitur pharetra, nisl nec tempor facilisis</strong>, nunc augue condimentum nulla, in elementum nunc odio ultrices neque.</div>', '<div>Nam ut interdum ipsum. Nunc molestie tellus sapien. Duis venenatis mi sed iaculis suscipit. Donec at ullamcorper elit, id placerat erat. Integer at ligula nibh. Donec placerat varius nunc vitae aliquam. Pellentesque commodo arcu libero<del>, nec scelerisque justo fringilla eu</del>. Pellentesque vitae sagittis neque, ac tincidunt eros. Nulla at rutrum justo. Mauris accumsan tincidunt dui, id vestibulum sapien porttitor id. Nam malesuada ipsum id orci egestas lobortis. Nunc non scelerisque neque. Duis placerat, sem quis ornare vehicula, erat metus tempus mi, sed maximus arcu neque placerat quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Morbi mattis felis sit amet sem eleifend laoreet.</div>', 15.75, 0, 0, 1, 1, 'mariia-shalabaieva-VoGDjcQ3exU-unsplash.jpg', 'baume-de-massage-a-l-eucalyptus', 1, 24.99),
(7, 'Baume du tigre', '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec semper nunc. Etiam semper tellus lorem, vitae fringilla ante rutrum a. <strong>Curabitur pharetra, nisl</strong>.</div>', '<ul><li>Mauris maximus tempor gravida. Nullam malesuada eros<del> id ligula lobortis dapibus</del>.</li><li>Phasellus dapibus vehicula hendrerit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li><li>Cras leo ex, pulvinar a lorem non, condimentum semper arcu. Nam ullamcorper elit ac ante tempus vehicula. Vivamus sed dolor ut metus finibus tristique sed vitae augue.</li></ul><div><br>In imperdiet, turpis eu molestie luctus, nisl felis finibus risus, quis convallis felis est nec mi. Pellentesque bibendum erat at dictum efficitur. <strong>Mauris nec diam a turpis gravida porta et ut elit.</strong> Phasellus vitae mauris nibh.</div>', 7.99, 1, 0, 0, 0, 'pmv-chamara-1HM2H47xB9Y-unsplash.jpg', 'baume-du-tigre', 1, 11.99),
(8, 'Huile essentielle de lavande', '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec semper nunc. Etiam semper tellus lorem, vitae fringilla ante rutrum a. <strong>Curabitur pharetra, nisl nec tempor facilisis</strong>, nunc augue condimentum nulla, in elementum nunc odio ultrices neque.</div>', '<div>Fusce at felis odio. Quisque eu finibus odio. In eget justo ultrices, blandit lectus mattis, consectetur ante. Vivamus lacinia non urna vel feugiat. Etiam aliquet eget massa in bibendum. Aliquam molestie metus nec mauris egestas, vel mattis justo malesuada. <strong>Praesent luctus justo quis ipsum semper dignissim. </strong>Duis at congue leo. Vestibulum volutpat nisi eget lobortis tincidunt.</div>', 9.99, 0, 1, 0, 1, 'pmv-chamara-owI1UoCNsIY-unsplash.jpg', 'lavande', 1, NULL),
(9, 'Crème de soin', '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec semper nunc. Etiam semper tellus lorem, vitae fringilla ante rutrum a. Curabitur pharetra, nisl nec tempor facilisis, nunc augue condimentum nulla, in elementum nunc odio ultrices neque.</div>', '<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at est quam. Curabitur eu sapien vitae lacus convallis porttitor sed ut nibh. Donec nec elementum tellus. Sed malesuada mollis neque, non efficitur est consequat et. Donec sodales, leo eget faucibus imperdiet, est erat consequat felis, eu congue metus lorem nec nisl. <em>Cras id sapien sed leo vulputate scelerisque.</em> Sed placerat, felis nec scelerisque imperdiet, lectus tellus laoreet urna, non facilisis lacus metus et odio. Duis lacinia nibh odio, ut ultrices nunc bibendum nec. Curabitur bibendum varius velit. Sed et metus id elit lacinia scelerisque et sit amet leo. <strong>Morbi pellentesque tempor erat at consequat. Sed tempus urna ipsum, id vestibulum mi cursus vitae.</strong> Nulla sed neque ut nisi pharetra cursus eget sed purus. Integer varius, nibh ullamcorper auctor luctus, augue lectus porta nisi, sit amet pellentesque tortor felis nec lorem. In finibus sed quam a blandit.</div>', 14.99, 1, 1, 0, 1, 'pmv-chamara-QgXnwGyrVDs-unsplash.jpg', 'creme-de-soin', 1, 21.99);

-- --------------------------------------------------------

--
-- Structure de la table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE IF NOT EXISTS `product_categories` (
  `product_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`categories_id`),
  KEY `IDX_A99419434584665A` (`product_id`),
  KEY `IDX_A9941943A21214B7` (`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product_categories`
--

INSERT INTO `product_categories` (`product_id`, `categories_id`) VALUES
(4, 2),
(5, 1),
(6, 2),
(7, 2),
(7, 3),
(8, 3),
(9, 1);

-- --------------------------------------------------------

--
-- Structure de la table `promo`
--

DROP TABLE IF EXISTS `promo`;
CREATE TABLE IF NOT EXISTS `promo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reduction` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `promo`
--

INSERT INTO `promo` (`id`, `code`, `reduction`) VALUES
(1, 'HEY', 50);

-- --------------------------------------------------------

--
-- Structure de la table `related_product`
--

DROP TABLE IF EXISTS `related_product`;
CREATE TABLE IF NOT EXISTS `related_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EC53CE084584665A` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reviews_product`
--

DROP TABLE IF EXISTS `reviews_product`;
CREATE TABLE IF NOT EXISTS `reviews_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `note` int(11) NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E0851D6CA76ED395` (`user_id`),
  KEY `IDX_E0851D6C4584665A` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reviews_product`
--

INSERT INTO `reviews_product` (`id`, `user_id`, `product_id`, `note`, `comment`, `is_active`) VALUES
(6, 1, 7, 4, 'Ut ornare magna ligula, sed sagittis massa vehicula sit amet. Orci varius natoque penatibus et magnis dis parturient montes.', 1);

-- --------------------------------------------------------

--
-- Structure de la table `tags_product`
--

DROP TABLE IF EXISTS `tags_product`;
CREATE TABLE IF NOT EXISTS `tags_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tags_product_product`
--

DROP TABLE IF EXISTS `tags_product_product`;
CREATE TABLE IF NOT EXISTS `tags_product_product` (
  `tags_product_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`tags_product_id`,`product_id`),
  KEY `IDX_90ACD5EF273D7ABB` (`tags_product_id`),
  KEY `IDX_90ACD5EF4584665A` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `username`, `firstname`, `lastname`) VALUES
(1, 'test@mail.fr', '[\"ROLE_ADMIN\"]', '$2y$13$L1UBd614ZSay/cFAy0XVTOj9ZqnWorMhRkJ8RFwebfGq9kJmYpQmq', 'kais', 'Matheo', 'Lasoj'),
(3, 'test2@mail.fr', '[]', '$2y$13$1bZVOYTg0YJYEy2kcFgomuIxB6zQ/DYpN6tuRfYAtlgp.jawbTFu.', 'adminC', 'Marc', 'Lamojul'),
(4, 'test3@mail.fr', '[]', '$2y$13$01hlFsjlt7gOPHAbUS1LtOCGm1hXVuA0W/eLB/kTZFwZCLGKb.hHu', 'adminC', 'Quentin', 'Lamojul'),
(5, 'test4@mail.fr', '[]', '$2y$13$Tc6rXIW28MWOSIsl60z3devhI1TLH1J8HDcFeVs15a8kj3Wzsvzu6', 'Cathy', 'Catherine', 'AlAroun'),
(6, 'jonas@mail.fr', '[\"ROLE_ADMIN\"]', '$2y$13$bZ9BFMLiwjqEebigigFysu4547OAeVOqUYlD7oFT2qWtxq5iiuG5y', 'Jonas', 'Jonas', 'Silva');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_D4E6F81A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_23A0E6612469DE2` FOREIGN KEY (`category_id`) REFERENCES `article_category` (`id`);

--
-- Contraintes pour la table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_AB912789A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `cart_details`
--
ALTER TABLE `cart_details`
  ADD CONSTRAINT `FK_89FCC38DBCB5C6F5` FOREIGN KEY (`carts_id`) REFERENCES `cart` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_845CA2C1CFFE9AD6` FOREIGN KEY (`orders_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `FK_A99419434584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A9941943A21214B7` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `related_product`
--
ALTER TABLE `related_product`
  ADD CONSTRAINT `FK_EC53CE084584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `reviews_product`
--
ALTER TABLE `reviews_product`
  ADD CONSTRAINT `FK_E0851D6C4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_E0851D6CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `tags_product_product`
--
ALTER TABLE `tags_product_product`
  ADD CONSTRAINT `FK_90ACD5EF273D7ABB` FOREIGN KEY (`tags_product_id`) REFERENCES `tags_product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_90ACD5EF4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
