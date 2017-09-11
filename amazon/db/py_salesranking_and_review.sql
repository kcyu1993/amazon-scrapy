/*
SQLyog v10.2 
MySQL - 5.7.18-log : Database - ipricejot
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ipricejot` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `amazon_best_seller`;

/*Table structure for table `py_review_detail` */

DROP TABLE IF EXISTS `py_review_detail`;

CREATE TABLE `py_review_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `asin` varchar(11) CHARACTER SET utf8 NOT NULL COMMENT 'asin id',
  `review_id` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT 'review id',
  `reviewer` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'reviewer',
  `review_url` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT 'review link',
  `star` varchar(4) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT 'rating star',
  `date` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'comment date',
  `title` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'comment title',
  `content` text CHARACTER SET utf8 COMMENT 'comment content',
  PRIMARY KEY (`id`),
  UNIQUE KEY `asin_review_id_unique` (`asin`,`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2706 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Table structure for table `py_review_profile` */

DROP TABLE IF EXISTS `py_review_profile`;

CREATE TABLE `py_review_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `asin` varchar(11) NOT NULL COMMENT 'asin id',
  `product` varchar(500) NOT NULL COMMENT 'product name',
  `brand` varchar(255) NOT NULL COMMENT 'product brand',
  `seller` varchar(255) DEFAULT NULL COMMENT 'product seller',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT 'image urls?',
  `review_total` int(11) NOT NULL DEFAULT '0' COMMENT 'review total',
  `review_rate` varchar(4) NOT NULL DEFAULT '0' COMMENT 'review average rating',
  `pct_five` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'percentage 5 star',
  `pct_four` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'percentage 4 star',
  `pct_three` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'percentage 3 star',
  `pct_two` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'percentage 2 star',
  `pct_one` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'percentage 1 star',
  `latest_total` int(11) DEFAULT NULL COMMENT 'last comment total number',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_asin` (`asin`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Table structure for table `py_salesranking_keywords` */

DROP TABLE IF EXISTS `py_salesranking_keywords`;

CREATE TABLE `py_salesranking_keywords` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `skwd_id` int(11) NOT NULL COMMENT 'salesranking_keyword_id',
  `rank` int(11) NOT NULL COMMENT '排名',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'scrapped time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `py_salesrankings` */

DROP TABLE IF EXISTS `py_salesrankings`;

CREATE TABLE `py_salesrankings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sk_id` int(11) NOT NULL COMMENT 'salesranking_id',
  `rank` int(11) NOT NULL COMMENT 'sale ranking',
  `classify` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'category',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'scrapy time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `salesranking_keywords` */

DROP TABLE IF EXISTS `salesranking_keywords`;

CREATE TABLE `salesranking_keywords` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sk_id` int(11) NOT NULL COMMENT 'saleranking_id',
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'keywords',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Status of scrapping 0-inprogress 1-success 2-failure',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT 'current ranking',
  `last_rank` int(11) NOT NULL DEFAULT '0' COMMENT 'previous ranking',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `salesranking_keywords_sk_id_keyword_unique` (`sk_id`,`keyword`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `salesrankings` */

DROP TABLE IF EXISTS `salesrankings`;

CREATE TABLE `salesrankings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL COMMENT 'seller_uid',
  `asin` varchar(11) COLLATE utf8_unicode_ci NOT NULL COMMENT 'asin',
  `title` varchar(500) COLLATE utf8_unicode_ci NOT NULL COMMENT 'item title',
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'item image',
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'amazon links',
  `classify` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'item category',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Status of scrapping 0-inprogress 1-success 2-failure',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT 'current ranking',
  `last_rank` int(11) NOT NULL DEFAULT '0' COMMENT 'previous ranking',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `salesrankings_sid_asin_unique` (`sid`,`asin`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
