-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 26, 2019 at 06:59 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `craft_the-box`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_assetindexdata`
--

CREATE TABLE `tb_assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_assets`
--

CREATE TABLE `tb_assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_assettransformindex`
--

CREATE TABLE `tb_assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_assettransforms`
--

CREATE TABLE `tb_assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_categories`
--

CREATE TABLE `tb_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_categorygroups`
--

CREATE TABLE `tb_categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_categorygroups_sites`
--

CREATE TABLE `tb_categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_content`
--

CREATE TABLE `tb_content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_content`
--

INSERT INTO `tb_content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, '2019-03-26 23:48:50', '2019-03-26 23:48:50', '3c909e9b-1d69-44ae-8617-7f567d9403a8');

-- --------------------------------------------------------

--
-- Table structure for table `tb_craftidtokens`
--

CREATE TABLE `tb_craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_deprecationerrors`
--

CREATE TABLE `tb_deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_elementindexsettings`
--

CREATE TABLE `tb_elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_elements`
--

CREATE TABLE `tb_elements` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_elements`
--

INSERT INTO `tb_elements` (`id`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, 'craft\\elements\\User', 1, 0, '2019-03-26 23:48:50', '2019-03-26 23:48:50', NULL, 'fa15e35a-bf57-4cc0-8888-95ad9f24e665');

-- --------------------------------------------------------

--
-- Table structure for table `tb_elements_sites`
--

CREATE TABLE `tb_elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_elements_sites`
--

INSERT INTO `tb_elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2019-03-26 23:48:50', '2019-03-26 23:48:50', '62803efc-580b-479f-bfb8-26ce0c6e32d6');

-- --------------------------------------------------------

--
-- Table structure for table `tb_entries`
--

CREATE TABLE `tb_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_entrydrafts`
--

CREATE TABLE `tb_entrydrafts` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_entrytypes`
--

CREATE TABLE `tb_entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_entryversions`
--

CREATE TABLE `tb_entryversions` (
  `id` int(11) NOT NULL,
  `entryId` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `siteId` int(11) NOT NULL,
  `num` smallint(6) UNSIGNED NOT NULL,
  `notes` text,
  `data` mediumtext NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_fieldgroups`
--

CREATE TABLE `tb_fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_fieldgroups`
--

INSERT INTO `tb_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Common', '2019-03-26 23:48:50', '2019-03-26 23:48:50', '95a08367-fb87-4b1a-b522-7d495b0ff6f9');

-- --------------------------------------------------------

--
-- Table structure for table `tb_fieldlayoutfields`
--

CREATE TABLE `tb_fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_fieldlayouts`
--

CREATE TABLE `tb_fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_fieldlayouttabs`
--

CREATE TABLE `tb_fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_fields`
--

CREATE TABLE `tb_fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_globalsets`
--

CREATE TABLE `tb_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_info`
--

CREATE TABLE `tb_info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `config` mediumtext,
  `configMap` mediumtext,
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_info`
--

INSERT INTO `tb_info` (`id`, `version`, `schemaVersion`, `maintenance`, `config`, `configMap`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.1.19', '3.1.25', 0, 'a:7:{s:11:\"fieldGroups\";a:1:{s:36:\"95a08367-fb87-4b1a-b522-7d495b0ff6f9\";a:1:{s:4:\"name\";s:6:\"Common\";}}s:10:\"siteGroups\";a:1:{s:36:\"320dbaef-a3c8-41d0-9ef6-f50b94891b6e\";a:1:{s:4:\"name\";s:7:\"Default\";}}s:5:\"sites\";a:1:{s:36:\"19bcec29-0fe8-40ec-ab48-7caaaff62a9a\";a:8:{s:9:\"siteGroup\";s:36:\"320dbaef-a3c8-41d0-9ef6-f50b94891b6e\";s:4:\"name\";s:7:\"Default\";s:6:\"handle\";s:7:\"default\";s:8:\"language\";s:5:\"en-US\";s:7:\"hasUrls\";b:1;s:7:\"baseUrl\";s:17:\"$DEFAULT_SITE_URL\";s:9:\"sortOrder\";i:1;s:7:\"primary\";b:1;}}s:5:\"email\";a:5:{s:9:\"fromEmail\";s:21:\"$SYSTEM_EMAIL_ADDRESS\";s:8:\"fromName\";s:18:\"$SYSTEM_EMAIL_NAME\";s:8:\"template\";N;s:13:\"transportType\";s:37:\"craft\\mail\\transportadapters\\Sendmail\";s:17:\"transportSettings\";N;}s:6:\"system\";a:5:{s:7:\"edition\";s:4:\"solo\";s:4:\"name\";s:12:\"$SYSTEM_NAME\";s:4:\"live\";b:1;s:13:\"schemaVersion\";s:6:\"3.1.25\";s:8:\"timeZone\";s:16:\"America/New_York\";}s:5:\"users\";a:5:{s:24:\"requireEmailVerification\";b:1;s:23:\"allowPublicRegistration\";b:0;s:12:\"defaultGroup\";N;s:14:\"photoVolumeUid\";N;s:12:\"photoSubpath\";s:0:\"\";}s:12:\"dateModified\";i:1553644744;}', '[]', 'HajuNN3Xg4qX', '2019-03-26 23:48:50', '2019-03-26 23:59:04', '15862080-d0fe-43ab-9ae3-bf4e6deec281');

-- --------------------------------------------------------

--
-- Table structure for table `tb_matrixblocks`
--

CREATE TABLE `tb_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `ownerSiteId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_matrixblocktypes`
--

CREATE TABLE `tb_matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_migrations`
--

CREATE TABLE `tb_migrations` (
  `id` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_migrations`
--

INSERT INTO `tb_migrations` (`id`, `pluginId`, `type`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'app', 'Install', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '4ffb175f-a1ef-4d35-bc1e-f9f42c2ed5ec'),
(2, NULL, 'app', 'm150403_183908_migrations_table_changes', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'bf4904e8-d51d-48ca-84a2-5f2b2052e7c7'),
(3, NULL, 'app', 'm150403_184247_plugins_table_changes', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '604751eb-a1c1-46ad-863a-dbbcfd114e86'),
(4, NULL, 'app', 'm150403_184533_field_version', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '4bcecc09-3447-4aa6-b55d-632ba8f17759'),
(5, NULL, 'app', 'm150403_184729_type_columns', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '980cc2f7-8dcd-4dd5-a2c4-85d512e6557b'),
(6, NULL, 'app', 'm150403_185142_volumes', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '11504921-63f4-4e08-a2eb-d2871663b433'),
(7, NULL, 'app', 'm150428_231346_userpreferences', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '1b3f13a4-0d38-4012-8793-1958d033ed94'),
(8, NULL, 'app', 'm150519_150900_fieldversion_conversion', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'b4ce936e-20fa-470c-a4ff-62032d36af35'),
(9, NULL, 'app', 'm150617_213829_update_email_settings', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '79d6ecd3-37aa-46ff-9620-8d892644d794'),
(10, NULL, 'app', 'm150721_124739_templatecachequeries', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '21a90d35-ab68-4a20-b5f2-6af1633c00fe'),
(11, NULL, 'app', 'm150724_140822_adjust_quality_settings', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '489e7dee-1aa2-4681-93dc-7ba6a0a22e2b'),
(12, NULL, 'app', 'm150815_133521_last_login_attempt_ip', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'c6c77e84-69c7-42ed-91f3-005dcd923d73'),
(13, NULL, 'app', 'm151002_095935_volume_cache_settings', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '25790d12-007c-4435-8e3e-2555b44f0a84'),
(14, NULL, 'app', 'm151005_142750_volume_s3_storage_settings', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '595ad6d4-0386-4c32-af74-012c4ca1fe14'),
(15, NULL, 'app', 'm151016_133600_delete_asset_thumbnails', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'f0540c64-b890-4558-8b26-caa6ef436068'),
(16, NULL, 'app', 'm151209_000000_move_logo', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '225be921-3e3c-4367-8e02-06f0054bccee'),
(17, NULL, 'app', 'm151211_000000_rename_fileId_to_assetId', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '9fa2857a-6c37-4d53-8f39-aa4e37d814dc'),
(18, NULL, 'app', 'm151215_000000_rename_asset_permissions', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'c9ca83cb-e792-4990-b36b-110155a2ce14'),
(19, NULL, 'app', 'm160707_000001_rename_richtext_assetsource_setting', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'c369b99a-1e7b-4470-8a3a-4b614d6f9a5a'),
(20, NULL, 'app', 'm160708_185142_volume_hasUrls_setting', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '7ba42280-083c-4a45-9ae9-dc4f35cb15c4'),
(21, NULL, 'app', 'm160714_000000_increase_max_asset_filesize', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'a2c022c5-4da7-46b0-8bc0-e340535311b3'),
(22, NULL, 'app', 'm160727_194637_column_cleanup', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'df09b309-46e1-4564-ab23-0754bc49f223'),
(23, NULL, 'app', 'm160804_110002_userphotos_to_assets', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '91d8c39c-de5c-49ef-a747-72ab27c75d48'),
(24, NULL, 'app', 'm160807_144858_sites', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '4e25a0f3-24cd-4607-a194-989a1dbb3c03'),
(25, NULL, 'app', 'm160829_000000_pending_user_content_cleanup', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '5e726f7a-8139-4aca-adda-a51af06ca51f'),
(26, NULL, 'app', 'm160830_000000_asset_index_uri_increase', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'b3f938a5-f0b4-499e-9348-5afaadb6a89b'),
(27, NULL, 'app', 'm160912_230520_require_entry_type_id', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'cb665b8a-84b5-4f4d-a6a1-834ad8896839'),
(28, NULL, 'app', 'm160913_134730_require_matrix_block_type_id', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'e98701d9-360b-4568-bbeb-c59469f4b9aa'),
(29, NULL, 'app', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'fee338eb-976a-4a88-a1ac-2d63d7ce2cb5'),
(30, NULL, 'app', 'm160920_231045_usergroup_handle_title_unique', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'e05e6729-ec94-4f14-9366-05eefaf07dc3'),
(31, NULL, 'app', 'm160925_113941_route_uri_parts', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '647c4395-4c96-4b14-bb7f-caad164b9ba2'),
(32, NULL, 'app', 'm161006_205918_schemaVersion_not_null', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '77549da4-3b2b-483a-afae-45a487021b70'),
(33, NULL, 'app', 'm161007_130653_update_email_settings', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'b008d75b-2ff7-46a7-89ac-59720f0c0e68'),
(34, NULL, 'app', 'm161013_175052_newParentId', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2b598e05-82d7-43f4-82c4-634e59a61bd6'),
(35, NULL, 'app', 'm161021_102916_fix_recent_entries_widgets', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2ad78b5f-9cd1-485f-9000-0e03b1ec793e'),
(36, NULL, 'app', 'm161021_182140_rename_get_help_widget', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '918a6cc2-4c19-4a92-96b5-5891a1807a6b'),
(37, NULL, 'app', 'm161025_000000_fix_char_columns', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'ef5f4d13-7042-455b-803a-fa7eb414af77'),
(38, NULL, 'app', 'm161029_124145_email_message_languages', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '57c5103b-7ae0-4169-9423-6e8cdea14a0f'),
(39, NULL, 'app', 'm161108_000000_new_version_format', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '10fb3fdf-2e84-4c9a-be14-96c3dd7ceea5'),
(40, NULL, 'app', 'm161109_000000_index_shuffle', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '3f9a7984-f580-43f0-ae3e-e0510ef38357'),
(41, NULL, 'app', 'm161122_185500_no_craft_app', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '744ce13e-a1df-4266-9eb7-31316ef34d12'),
(42, NULL, 'app', 'm161125_150752_clear_urlmanager_cache', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '1f853ed0-7c16-46fa-a455-07f6dc8ab7d7'),
(43, NULL, 'app', 'm161220_000000_volumes_hasurl_notnull', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '184579e9-4cdd-4d7e-b788-4d1485c89f84'),
(44, NULL, 'app', 'm170114_161144_udates_permission', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'bd3f7ac2-a0c7-4281-8eea-c0f07479c04d'),
(45, NULL, 'app', 'm170120_000000_schema_cleanup', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '15a48d60-b0e6-46ca-9034-c6ae5ef04faa'),
(46, NULL, 'app', 'm170126_000000_assets_focal_point', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '25fb4504-5872-40ec-ab62-9d2a43aa9c35'),
(47, NULL, 'app', 'm170206_142126_system_name', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'c5936f30-3fcb-4165-b73f-829ce376b07e'),
(48, NULL, 'app', 'm170217_044740_category_branch_limits', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '073a0b0d-33b6-47ce-95c1-43cffbddc1b2'),
(49, NULL, 'app', 'm170217_120224_asset_indexing_columns', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'cf2bbe95-0fa3-438b-90ff-b3649e3b0a91'),
(50, NULL, 'app', 'm170223_224012_plain_text_settings', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '461cf9d5-4aa1-422a-99fc-b0e5bdfb8d55'),
(51, NULL, 'app', 'm170227_120814_focal_point_percentage', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '8de1d898-aba3-454c-ab65-c344cdc3b1c9'),
(52, NULL, 'app', 'm170228_171113_system_messages', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'f626b6cc-741f-4efc-a745-f229b9c52b08'),
(53, NULL, 'app', 'm170303_140500_asset_field_source_settings', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '5b05ddb2-71b8-453f-ba4d-199f62a1306d'),
(54, NULL, 'app', 'm170306_150500_asset_temporary_uploads', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '8f502f78-0bc9-4987-b780-ac26a23e2dee'),
(55, NULL, 'app', 'm170523_190652_element_field_layout_ids', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '04b3bf6b-0ef4-4533-a2b1-dc7cb55bfb51'),
(56, NULL, 'app', 'm170612_000000_route_index_shuffle', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '21e25674-553f-444a-b9b4-ddcfee5bc4cf'),
(57, NULL, 'app', 'm170621_195237_format_plugin_handles', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '9ec22ed5-786a-4cec-bff9-f18f92f4a0c5'),
(58, NULL, 'app', 'm170630_161027_deprecation_line_nullable', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '658a5922-dced-4128-b552-a0043f0859d4'),
(59, NULL, 'app', 'm170630_161028_deprecation_changes', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'c70e298b-a408-4137-a1b2-af1f50a45b35'),
(60, NULL, 'app', 'm170703_181539_plugins_table_tweaks', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '4f10c644-ef8d-4e19-a6ec-78ce8b709f63'),
(61, NULL, 'app', 'm170704_134916_sites_tables', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'bc51bda4-8be9-429b-ae8e-8455a9a94599'),
(62, NULL, 'app', 'm170706_183216_rename_sequences', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '0f0c80cb-f935-4e9c-b671-6c178899f644'),
(63, NULL, 'app', 'm170707_094758_delete_compiled_traits', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '375c8c17-1932-4421-a4c8-796e83ade58c'),
(64, NULL, 'app', 'm170731_190138_drop_asset_packagist', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '3240f46e-db36-4b3f-af9b-b7c2292c2f36'),
(65, NULL, 'app', 'm170810_201318_create_queue_table', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'b2662128-d94b-4e6b-9176-331f8f1fcac5'),
(66, NULL, 'app', 'm170816_133741_delete_compiled_behaviors', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '3743887e-7b86-4492-afda-c3cd19057097'),
(67, NULL, 'app', 'm170903_192801_longblob_for_queue_jobs', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '26a49160-5a8d-403f-9bf4-f7a273e22fd3'),
(68, NULL, 'app', 'm170914_204621_asset_cache_shuffle', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'b27663b9-cdc5-4a13-89b7-edba7c8adfb9'),
(69, NULL, 'app', 'm171011_214115_site_groups', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2fff354a-7b01-48fa-95ac-71edf080a36c'),
(70, NULL, 'app', 'm171012_151440_primary_site', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '276e5186-68a5-400e-82a1-5456a0f03e94'),
(71, NULL, 'app', 'm171013_142500_transform_interlace', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '871bd447-efe1-468b-9b79-17a3f89cfc19'),
(72, NULL, 'app', 'm171016_092553_drop_position_select', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '1ad53dc7-57b4-40cc-aa7d-67431da924b1'),
(73, NULL, 'app', 'm171016_221244_less_strict_translation_method', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '69a2fceb-6618-4b47-87bf-1aa4128d4ff1'),
(74, NULL, 'app', 'm171107_000000_assign_group_permissions', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '81fe2d72-57db-4971-a03d-973ee91067d4'),
(75, NULL, 'app', 'm171117_000001_templatecache_index_tune', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'e4c48ad1-2e73-4798-88d6-a481c3099f20'),
(76, NULL, 'app', 'm171126_105927_disabled_plugins', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '5fce66aa-d97d-4699-96a9-6278f702b879'),
(77, NULL, 'app', 'm171130_214407_craftidtokens_table', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '5334240d-a9dc-493d-a4e3-ac93c9e0706e'),
(78, NULL, 'app', 'm171202_004225_update_email_settings', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '112c728a-b3e6-48ac-b92f-ab19a81b4170'),
(79, NULL, 'app', 'm171204_000001_templatecache_index_tune_deux', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'b58502c8-924e-4533-975f-044f1bbfc576'),
(80, NULL, 'app', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '87d0de61-370a-4170-b6f8-8e0e595dc01f'),
(81, NULL, 'app', 'm171218_143135_longtext_query_column', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2096b16e-a4e4-4ee7-8d51-1b5d9e582a69'),
(82, NULL, 'app', 'm171231_055546_environment_variables_to_aliases', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '36b0492f-fd8f-4428-ab84-8735368f6f32'),
(83, NULL, 'app', 'm180113_153740_drop_users_archived_column', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '63566afa-349f-46fd-bb63-f516646372a1'),
(84, NULL, 'app', 'm180122_213433_propagate_entries_setting', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'cad57be2-6eb7-4f9b-9049-59c0e934d721'),
(85, NULL, 'app', 'm180124_230459_fix_propagate_entries_values', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'd5df89a4-6cd7-4e6b-b374-29f4e42221f0'),
(86, NULL, 'app', 'm180128_235202_set_tag_slugs', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '05518374-b3c7-4bea-87c3-bade9be23464'),
(87, NULL, 'app', 'm180202_185551_fix_focal_points', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '3e37a1b1-4279-42af-9d5d-90019ad58477'),
(88, NULL, 'app', 'm180217_172123_tiny_ints', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '219cea1a-27c5-4db8-a343-99d138232a3d'),
(89, NULL, 'app', 'm180321_233505_small_ints', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '6ce8ce43-16bb-4162-b079-2d5b0dabe3fd'),
(90, NULL, 'app', 'm180328_115523_new_license_key_statuses', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'a2a073de-790e-4f83-9a65-ef41dfcfd8e8'),
(91, NULL, 'app', 'm180404_182320_edition_changes', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '4ea0797d-5b37-442d-a574-d2c3c48f3acc'),
(92, NULL, 'app', 'm180411_102218_fix_db_routes', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '03c3240d-32cc-40a0-9b62-c31bbf143287'),
(93, NULL, 'app', 'm180416_205628_resourcepaths_table', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'ba3d31e9-14cf-4fa4-afde-ca8697c6544f'),
(94, NULL, 'app', 'm180418_205713_widget_cleanup', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'a1132890-4847-40c1-93e6-8978bac3bb56'),
(95, NULL, 'app', 'm180425_203349_searchable_fields', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '77ae6c05-bc80-4ba9-af81-6fc14ac92c21'),
(96, NULL, 'app', 'm180516_153000_uids_in_field_settings', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '554e6b10-b608-482c-85ea-67a23b37856b'),
(97, NULL, 'app', 'm180517_173000_user_photo_volume_to_uid', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '62c66948-96ea-4f43-9909-520a8e3e6d6d'),
(98, NULL, 'app', 'm180518_173000_permissions_to_uid', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '3735c2ad-26c9-4976-8c77-d64ffc12f7ff'),
(99, NULL, 'app', 'm180520_173000_matrix_context_to_uids', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '4c2f7888-c56d-4dcc-8af3-46ab5bdabb9f'),
(100, NULL, 'app', 'm180521_173000_initial_yml_and_snapshot', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '9b25c844-6e0a-4d57-bdc1-e98426590789'),
(101, NULL, 'app', 'm180731_162030_soft_delete_sites', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '33fbaeee-d5cc-4ea1-8681-2e5317c9ef82'),
(102, NULL, 'app', 'm180810_214427_soft_delete_field_layouts', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'b6a76482-2748-4bdc-ac42-811bf6907c23'),
(103, NULL, 'app', 'm180810_214439_soft_delete_elements', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '38594e92-a3e3-4713-9c4d-a04ffc7a7c72'),
(104, NULL, 'app', 'm180824_193422_case_sensitivity_fixes', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '5b80d736-1434-4869-a7a7-0a42dc2966bb'),
(105, NULL, 'app', 'm180901_151639_fix_matrixcontent_tables', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '4d78651d-e47c-45ea-ae97-9dd83872cbd9'),
(106, NULL, 'app', 'm180904_112109_permission_changes', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '22baea2a-da40-4c74-9388-5c369ed43c86'),
(107, NULL, 'app', 'm180910_142030_soft_delete_sitegroups', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'a1137722-c6e4-4a61-b60e-6d49ad638922'),
(108, NULL, 'app', 'm181011_160000_soft_delete_asset_support', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '4585fd8b-ede6-43c9-9561-85850869a1c0'),
(109, NULL, 'app', 'm181016_183648_set_default_user_settings', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '0c14eb79-4152-4d3c-82a8-6b41d5526f72'),
(110, NULL, 'app', 'm181017_225222_system_config_settings', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '58ff373c-c08e-4f7c-ada0-7d8dcffd98a7'),
(111, NULL, 'app', 'm181018_222343_drop_userpermissions_from_config', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '4637f3b2-92b0-4b84-8b24-c7b79b192302'),
(112, NULL, 'app', 'm181029_130000_add_transforms_routes_to_config', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '1541db8e-4706-42a3-8684-969676e676cd'),
(113, NULL, 'app', 'm181112_203955_sequences_table', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'd9b16809-54d3-45a5-a138-31919bfdc96f'),
(114, NULL, 'app', 'm181121_001712_cleanup_field_configs', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '5b79bdd1-20d5-4cf3-b5b0-31271788b2f3'),
(115, NULL, 'app', 'm181128_193942_fix_project_config', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '8e9ea8bf-d267-4b3c-9fd2-0016530a48f0'),
(116, NULL, 'app', 'm181130_143040_fix_schema_version', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '24a074cd-d210-4af6-994c-44adf3a187b0'),
(117, NULL, 'app', 'm181211_143040_fix_entry_type_uids', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'b80f46b7-b458-47b8-b855-801add2555a2'),
(118, NULL, 'app', 'm181213_102500_config_map_aliases', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '7813bacb-704c-4cf4-8151-0c147b55148d'),
(119, NULL, 'app', 'm181217_153000_fix_structure_uids', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '784921da-540f-4171-8710-bd0a7d3d2451'),
(120, NULL, 'app', 'm190104_152725_store_licensed_plugin_editions', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '03fd59c1-b202-4439-86ba-e897dd357a20'),
(121, NULL, 'app', 'm190108_110000_cleanup_project_config', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'e3b26df2-f21f-48d8-b137-3a5e55432270'),
(122, NULL, 'app', 'm190108_113000_asset_field_setting_change', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '3f7d165b-1159-48ec-83e1-27ccd0d8ae9f'),
(123, NULL, 'app', 'm190109_172845_fix_colspan', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'ae629879-02c0-4020-ac9c-cad675b74461'),
(124, NULL, 'app', 'm190110_150000_prune_nonexisting_sites', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '0a562720-4865-444c-ac45-020d621c7276'),
(125, NULL, 'app', 'm190110_214819_soft_delete_volumes', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '63cfd87b-8152-4547-b580-9b33688fd481'),
(126, NULL, 'app', 'm190112_124737_fix_user_settings', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '7c6825f0-3843-470b-a0f0-0f37358c8aaa'),
(127, NULL, 'app', 'm190112_131225_fix_field_layouts', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '1ac1e4f2-bdce-4619-ba7c-5394645af291'),
(128, NULL, 'app', 'm190112_201010_more_soft_deletes', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'bb131806-300b-474a-8b09-41f0c78722ff'),
(129, NULL, 'app', 'm190114_143000_more_asset_field_setting_changes', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'e5aa33f1-f02c-432d-bc9a-9771f9452e73'),
(130, NULL, 'app', 'm190121_120000_rich_text_config_setting', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '346687e3-0147-4dd6-a0cc-2a7252fa328a'),
(131, NULL, 'app', 'm190125_191628_fix_email_transport_password', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'e5ffee3f-849f-41f1-b08b-e6733339842b'),
(132, NULL, 'app', 'm190128_181422_cleanup_volume_folders', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'be07a0f4-e0af-43e7-aa48-729dcca53338'),
(133, NULL, 'app', 'm190205_140000_fix_asset_soft_delete_index', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', 'cba9cb29-5f60-4823-9e07-6e75789a63da'),
(134, NULL, 'app', 'm190208_140000_reset_project_config_mapping', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '395cdd19-120c-4f47-8267-05ccdbb90f7b'),
(135, NULL, 'app', 'm190218_143000_element_index_settings_uid', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:51', '8b6128b5-2964-4cac-a111-e49c05c7a1e2');

-- --------------------------------------------------------

--
-- Table structure for table `tb_plugins`
--

CREATE TABLE `tb_plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_queue`
--

CREATE TABLE `tb_queue` (
  `id` int(11) NOT NULL,
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_relations`
--

CREATE TABLE `tb_relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_resourcepaths`
--

CREATE TABLE `tb_resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_resourcepaths`
--

INSERT INTO `tb_resourcepaths` (`hash`, `path`) VALUES
('10131915', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\element-resize-detector'),
('14e7a7dd', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\src\\web\\assets\\dashboard\\dist'),
('18fe946', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\jquery.payment'),
('1b008292', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\src\\web\\assets\\dashboard\\dist'),
('1b270ee9', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\src\\web\\assets\\updates\\dist'),
('1ff43c5a', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\element-resize-detector'),
('3423dafb', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\src\\web\\assets\\recententries\\dist'),
('3624c656', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\src\\web\\assets\\cp\\dist'),
('39c3e319', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\src\\web\\assets\\cp\\dist'),
('3bc4ffb4', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\src\\web\\assets\\recententries\\dist'),
('3f91a71', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\velocity'),
('49f6a9c4', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\src\\web\\assets\\plugins\\dist'),
('5312b43', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\jquery-touch-events'),
('57ebdda', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\src\\web\\assets\\updateswidget\\dist'),
('606081a1', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\picturefill'),
('6f87a4ee', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\picturefill'),
('70f61460', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\jquery-ui'),
('724a8a89', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\src\\web\\assets\\craftsupport\\dist'),
('767aac45', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\fabric'),
('77a394c1', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\fileupload'),
('7844b18e', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\fileupload'),
('799d890a', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\fabric'),
('7dadafc6', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\src\\web\\assets\\craftsupport\\dist'),
('7f11312f', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\jquery-ui'),
('847f7725', '@bower/jquery/dist'),
('85d7854a', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\d3'),
('8a30a005', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\d3'),
('8b98526a', '@bower/jquery/dist'),
('918556a7', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\garnishjs'),
('9e6273e8', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\garnishjs'),
('a4a32cac', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\src\\web\\assets\\edituser\\dist'),
('a7a3756e', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\src\\web\\assets\\feed\\dist'),
('a8445021', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\src\\web\\assets\\feed\\dist'),
('a999895', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\src\\web\\assets\\updateswidget\\dist'),
('ad60e0c', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\jquery-touch-events'),
('b129feaf', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\xregexp'),
('b591ab00', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\src\\web\\assets\\utilities\\dist'),
('ba768e4f', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\src\\web\\assets\\utilities\\dist'),
('bc55b6dd', '@lib'),
('becedbe0', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\xregexp'),
('c1e3f3e', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\velocity'),
('e68cc09', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\jquery.payment'),
('f1816d84', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\src\\web\\assets\\generalsettings\\dist'),
('f2737b16', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\src\\web\\assets\\sites\\dist'),
('f70469bb', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\selectize'),
('f8e34cf4', 'C:\\Users\\andre\\Desktop\\projects\\the-box\\vendor\\craftcms\\cms\\lib\\selectize');

-- --------------------------------------------------------

--
-- Table structure for table `tb_searchindex`
--

CREATE TABLE `tb_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_searchindex`
--

INSERT INTO `tb_searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' no email example com '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' no email example com '),
(1, 'slug', 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_sections`
--

CREATE TABLE `tb_sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagateEntries` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_sections_sites`
--

CREATE TABLE `tb_sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_sequences`
--

CREATE TABLE `tb_sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_sessions`
--

CREATE TABLE `tb_sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_sessions`
--

INSERT INTO `tb_sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'oOckLGOKdqMIh2Y7Lea0cWUcQf3LoOl-CIwk-rArRA8-TP-D3WLSbzi87nUDbKpb8CwiS8TkSDXry1nNN0XA1p0BDpkgqBG1RlII', '2019-03-26 23:48:51', '2019-03-26 23:59:10', 'cf47a73f-c8a6-4c1a-8962-435656169647');

-- --------------------------------------------------------

--
-- Table structure for table `tb_shunnedmessages`
--

CREATE TABLE `tb_shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_sitegroups`
--

CREATE TABLE `tb_sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_sitegroups`
--

INSERT INTO `tb_sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Default', '2019-03-26 23:48:50', '2019-03-26 23:59:04', NULL, '320dbaef-a3c8-41d0-9ef6-f50b94891b6e');

-- --------------------------------------------------------

--
-- Table structure for table `tb_sites`
--

CREATE TABLE `tb_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_sites`
--

INSERT INTO `tb_sites` (`id`, `groupId`, `primary`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'Default', 'default', 'en-US', 1, '$DEFAULT_SITE_URL', 1, '2019-03-26 23:48:50', '2019-03-26 23:58:55', NULL, '19bcec29-0fe8-40ec-ab48-7caaaff62a9a');

-- --------------------------------------------------------

--
-- Table structure for table `tb_structureelements`
--

CREATE TABLE `tb_structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_structures`
--

CREATE TABLE `tb_structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_systemmessages`
--

CREATE TABLE `tb_systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_taggroups`
--

CREATE TABLE `tb_taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_tags`
--

CREATE TABLE `tb_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_templatecacheelements`
--

CREATE TABLE `tb_templatecacheelements` (
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_templatecachequeries`
--

CREATE TABLE `tb_templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_templatecaches`
--

CREATE TABLE `tb_templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_tokens`
--

CREATE TABLE `tb_tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_usergroups`
--

CREATE TABLE `tb_usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_usergroups_users`
--

CREATE TABLE `tb_usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_userpermissions`
--

CREATE TABLE `tb_userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_userpermissions_usergroups`
--

CREATE TABLE `tb_userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_userpermissions_users`
--

CREATE TABLE `tb_userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_userpreferences`
--

CREATE TABLE `tb_userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_userpreferences`
--

INSERT INTO `tb_userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'no-email@example.com', NULL, NULL, NULL, 'no-email@example.com', '$2y$13$AN/quVm.twko3IeRJk0nAeBA2Fk2Y2UP7qHgzii0o89X3mYgyQQZ2', 1, 0, 0, 0, '2019-03-26 23:48:51', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2019-03-26 23:48:51', '2019-03-26 23:48:51', '2019-03-26 23:48:52', '8c98474c-231f-4c53-a8b5-3ac33691f2c2');

-- --------------------------------------------------------

--
-- Table structure for table `tb_volumefolders`
--

CREATE TABLE `tb_volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_volumes`
--

CREATE TABLE `tb_volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tb_widgets`
--

CREATE TABLE `tb_widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tb_widgets`
--

INSERT INTO `tb_widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}', 1, '2019-03-26 23:48:52', '2019-03-26 23:48:52', '5448b29f-7eb1-4997-bfd0-1fab2902d6cd'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2019-03-26 23:48:52', '2019-03-26 23:48:52', 'a6e68690-4ab1-4e76-ba48-40b00841298e'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2019-03-26 23:48:52', '2019-03-26 23:48:52', 'fb4a196d-b1e5-45c9-add8-4888937bcd2c'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2019-03-26 23:48:52', '2019-03-26 23:48:52', '8373a815-b6b4-414d-a894-90db783ae023');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_assetindexdata`
--
ALTER TABLE `tb_assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  ADD KEY `tb_assetindexdata_volumeId_idx` (`volumeId`);

--
-- Indexes for table `tb_assets`
--
ALTER TABLE `tb_assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_assets_filename_folderId_idx` (`filename`,`folderId`),
  ADD KEY `tb_assets_folderId_idx` (`folderId`),
  ADD KEY `tb_assets_volumeId_idx` (`volumeId`);

--
-- Indexes for table `tb_assettransformindex`
--
ALTER TABLE `tb_assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `tb_assettransforms`
--
ALTER TABLE `tb_assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_assettransforms_name_unq_idx` (`name`),
  ADD UNIQUE KEY `tb_assettransforms_handle_unq_idx` (`handle`);

--
-- Indexes for table `tb_categories`
--
ALTER TABLE `tb_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_categories_groupId_idx` (`groupId`),
  ADD KEY `tb_categories_parentId_fk` (`parentId`);

--
-- Indexes for table `tb_categorygroups`
--
ALTER TABLE `tb_categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_categorygroups_name_idx` (`name`),
  ADD KEY `tb_categorygroups_handle_idx` (`handle`),
  ADD KEY `tb_categorygroups_structureId_idx` (`structureId`),
  ADD KEY `tb_categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `tb_categorygroups_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `tb_categorygroups_sites`
--
ALTER TABLE `tb_categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  ADD KEY `tb_categorygroups_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `tb_content`
--
ALTER TABLE `tb_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `tb_content_siteId_idx` (`siteId`),
  ADD KEY `tb_content_title_idx` (`title`);

--
-- Indexes for table `tb_craftidtokens`
--
ALTER TABLE `tb_craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_craftidtokens_userId_fk` (`userId`);

--
-- Indexes for table `tb_deprecationerrors`
--
ALTER TABLE `tb_deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indexes for table `tb_elementindexsettings`
--
ALTER TABLE `tb_elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_elementindexsettings_type_unq_idx` (`type`);

--
-- Indexes for table `tb_elements`
--
ALTER TABLE `tb_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_elements_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `tb_elements_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `tb_elements_type_idx` (`type`),
  ADD KEY `tb_elements_enabled_idx` (`enabled`),
  ADD KEY `tb_elements_archived_dateCreated_idx` (`archived`,`dateCreated`);

--
-- Indexes for table `tb_elements_sites`
--
ALTER TABLE `tb_elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `tb_elements_sites_siteId_idx` (`siteId`),
  ADD KEY `tb_elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  ADD KEY `tb_elements_sites_enabled_idx` (`enabled`),
  ADD KEY `tb_elements_sites_uri_siteId_idx` (`uri`,`siteId`);

--
-- Indexes for table `tb_entries`
--
ALTER TABLE `tb_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_entries_postDate_idx` (`postDate`),
  ADD KEY `tb_entries_expiryDate_idx` (`expiryDate`),
  ADD KEY `tb_entries_authorId_idx` (`authorId`),
  ADD KEY `tb_entries_sectionId_idx` (`sectionId`),
  ADD KEY `tb_entries_typeId_idx` (`typeId`),
  ADD KEY `tb_entries_parentId_fk` (`parentId`);

--
-- Indexes for table `tb_entrydrafts`
--
ALTER TABLE `tb_entrydrafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_entrydrafts_sectionId_idx` (`sectionId`),
  ADD KEY `tb_entrydrafts_entryId_siteId_idx` (`entryId`,`siteId`),
  ADD KEY `tb_entrydrafts_siteId_idx` (`siteId`),
  ADD KEY `tb_entrydrafts_creatorId_idx` (`creatorId`);

--
-- Indexes for table `tb_entrytypes`
--
ALTER TABLE `tb_entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  ADD KEY `tb_entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  ADD KEY `tb_entrytypes_sectionId_idx` (`sectionId`),
  ADD KEY `tb_entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `tb_entrytypes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `tb_entryversions`
--
ALTER TABLE `tb_entryversions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_entryversions_sectionId_idx` (`sectionId`),
  ADD KEY `tb_entryversions_entryId_siteId_idx` (`entryId`,`siteId`),
  ADD KEY `tb_entryversions_siteId_idx` (`siteId`),
  ADD KEY `tb_entryversions_creatorId_idx` (`creatorId`);

--
-- Indexes for table `tb_fieldgroups`
--
ALTER TABLE `tb_fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_fieldgroups_name_unq_idx` (`name`);

--
-- Indexes for table `tb_fieldlayoutfields`
--
ALTER TABLE `tb_fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `tb_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `tb_fieldlayoutfields_tabId_idx` (`tabId`),
  ADD KEY `tb_fieldlayoutfields_fieldId_idx` (`fieldId`);

--
-- Indexes for table `tb_fieldlayouts`
--
ALTER TABLE `tb_fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `tb_fieldlayouts_type_idx` (`type`);

--
-- Indexes for table `tb_fieldlayouttabs`
--
ALTER TABLE `tb_fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `tb_fieldlayouttabs_layoutId_idx` (`layoutId`);

--
-- Indexes for table `tb_fields`
--
ALTER TABLE `tb_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_fields_handle_context_unq_idx` (`handle`,`context`),
  ADD KEY `tb_fields_groupId_idx` (`groupId`),
  ADD KEY `tb_fields_context_idx` (`context`);

--
-- Indexes for table `tb_globalsets`
--
ALTER TABLE `tb_globalsets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_globalsets_name_unq_idx` (`name`),
  ADD UNIQUE KEY `tb_globalsets_handle_unq_idx` (`handle`),
  ADD KEY `tb_globalsets_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `tb_info`
--
ALTER TABLE `tb_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_matrixblocks`
--
ALTER TABLE `tb_matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `tb_matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `tb_matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `tb_matrixblocks_sortOrder_idx` (`sortOrder`),
  ADD KEY `tb_matrixblocks_ownerSiteId_idx` (`ownerSiteId`);

--
-- Indexes for table `tb_matrixblocktypes`
--
ALTER TABLE `tb_matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  ADD UNIQUE KEY `tb_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  ADD KEY `tb_matrixblocktypes_fieldId_idx` (`fieldId`),
  ADD KEY `tb_matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `tb_migrations`
--
ALTER TABLE `tb_migrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_migrations_pluginId_idx` (`pluginId`),
  ADD KEY `tb_migrations_type_pluginId_idx` (`type`,`pluginId`);

--
-- Indexes for table `tb_plugins`
--
ALTER TABLE `tb_plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_plugins_handle_unq_idx` (`handle`);

--
-- Indexes for table `tb_queue`
--
ALTER TABLE `tb_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_queue_fail_timeUpdated_timePushed_idx` (`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `tb_queue_fail_timeUpdated_delay_idx` (`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `tb_relations`
--
ALTER TABLE `tb_relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `tb_relations_sourceId_idx` (`sourceId`),
  ADD KEY `tb_relations_targetId_idx` (`targetId`),
  ADD KEY `tb_relations_sourceSiteId_idx` (`sourceSiteId`);

--
-- Indexes for table `tb_resourcepaths`
--
ALTER TABLE `tb_resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `tb_searchindex`
--
ALTER TABLE `tb_searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `tb_searchindex` ADD FULLTEXT KEY `tb_searchindex_keywords_idx` (`keywords`);

--
-- Indexes for table `tb_sections`
--
ALTER TABLE `tb_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_sections_handle_idx` (`handle`),
  ADD KEY `tb_sections_name_idx` (`name`),
  ADD KEY `tb_sections_structureId_idx` (`structureId`),
  ADD KEY `tb_sections_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `tb_sections_sites`
--
ALTER TABLE `tb_sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  ADD KEY `tb_sections_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `tb_sequences`
--
ALTER TABLE `tb_sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `tb_sessions`
--
ALTER TABLE `tb_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_sessions_uid_idx` (`uid`),
  ADD KEY `tb_sessions_token_idx` (`token`),
  ADD KEY `tb_sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `tb_sessions_userId_idx` (`userId`);

--
-- Indexes for table `tb_shunnedmessages`
--
ALTER TABLE `tb_shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indexes for table `tb_sitegroups`
--
ALTER TABLE `tb_sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_sitegroups_name_idx` (`name`);

--
-- Indexes for table `tb_sites`
--
ALTER TABLE `tb_sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_sites_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `tb_sites_handle_idx` (`handle`),
  ADD KEY `tb_sites_sortOrder_idx` (`sortOrder`),
  ADD KEY `tb_sites_groupId_fk` (`groupId`);

--
-- Indexes for table `tb_structureelements`
--
ALTER TABLE `tb_structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  ADD KEY `tb_structureelements_root_idx` (`root`),
  ADD KEY `tb_structureelements_lft_idx` (`lft`),
  ADD KEY `tb_structureelements_rgt_idx` (`rgt`),
  ADD KEY `tb_structureelements_level_idx` (`level`),
  ADD KEY `tb_structureelements_elementId_idx` (`elementId`);

--
-- Indexes for table `tb_structures`
--
ALTER TABLE `tb_structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_structures_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `tb_systemmessages`
--
ALTER TABLE `tb_systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_systemmessages_key_language_unq_idx` (`key`,`language`),
  ADD KEY `tb_systemmessages_language_idx` (`language`);

--
-- Indexes for table `tb_taggroups`
--
ALTER TABLE `tb_taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_taggroups_name_idx` (`name`),
  ADD KEY `tb_taggroups_handle_idx` (`handle`),
  ADD KEY `tb_taggroups_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `tb_taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `tb_tags`
--
ALTER TABLE `tb_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_tags_groupId_idx` (`groupId`);

--
-- Indexes for table `tb_templatecacheelements`
--
ALTER TABLE `tb_templatecacheelements`
  ADD KEY `tb_templatecacheelements_cacheId_idx` (`cacheId`),
  ADD KEY `tb_templatecacheelements_elementId_idx` (`elementId`);

--
-- Indexes for table `tb_templatecachequeries`
--
ALTER TABLE `tb_templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_templatecachequeries_cacheId_idx` (`cacheId`),
  ADD KEY `tb_templatecachequeries_type_idx` (`type`);

--
-- Indexes for table `tb_templatecaches`
--
ALTER TABLE `tb_templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `tb_templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `tb_templatecaches_siteId_idx` (`siteId`);

--
-- Indexes for table `tb_tokens`
--
ALTER TABLE `tb_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_tokens_token_unq_idx` (`token`),
  ADD KEY `tb_tokens_expiryDate_idx` (`expiryDate`);

--
-- Indexes for table `tb_usergroups`
--
ALTER TABLE `tb_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_usergroups_handle_unq_idx` (`handle`),
  ADD UNIQUE KEY `tb_usergroups_name_unq_idx` (`name`);

--
-- Indexes for table `tb_usergroups_users`
--
ALTER TABLE `tb_usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `tb_usergroups_users_userId_idx` (`userId`);

--
-- Indexes for table `tb_userpermissions`
--
ALTER TABLE `tb_userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_userpermissions_name_unq_idx` (`name`);

--
-- Indexes for table `tb_userpermissions_usergroups`
--
ALTER TABLE `tb_userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `tb_userpermissions_usergroups_groupId_idx` (`groupId`);

--
-- Indexes for table `tb_userpermissions_users`
--
ALTER TABLE `tb_userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `tb_userpermissions_users_userId_idx` (`userId`);

--
-- Indexes for table `tb_userpreferences`
--
ALTER TABLE `tb_userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_users_uid_idx` (`uid`),
  ADD KEY `tb_users_verificationCode_idx` (`verificationCode`),
  ADD KEY `tb_users_email_idx` (`email`),
  ADD KEY `tb_users_username_idx` (`username`),
  ADD KEY `tb_users_photoId_fk` (`photoId`);

--
-- Indexes for table `tb_volumefolders`
--
ALTER TABLE `tb_volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tb_volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  ADD KEY `tb_volumefolders_parentId_idx` (`parentId`),
  ADD KEY `tb_volumefolders_volumeId_idx` (`volumeId`);

--
-- Indexes for table `tb_volumes`
--
ALTER TABLE `tb_volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_volumes_name_idx` (`name`),
  ADD KEY `tb_volumes_handle_idx` (`handle`),
  ADD KEY `tb_volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `tb_volumes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `tb_widgets`
--
ALTER TABLE `tb_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_widgets_userId_idx` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_assetindexdata`
--
ALTER TABLE `tb_assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_assettransformindex`
--
ALTER TABLE `tb_assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_assettransforms`
--
ALTER TABLE `tb_assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_categorygroups`
--
ALTER TABLE `tb_categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_categorygroups_sites`
--
ALTER TABLE `tb_categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_content`
--
ALTER TABLE `tb_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_craftidtokens`
--
ALTER TABLE `tb_craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_deprecationerrors`
--
ALTER TABLE `tb_deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_elementindexsettings`
--
ALTER TABLE `tb_elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_elements`
--
ALTER TABLE `tb_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_elements_sites`
--
ALTER TABLE `tb_elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_entrydrafts`
--
ALTER TABLE `tb_entrydrafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_entrytypes`
--
ALTER TABLE `tb_entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_entryversions`
--
ALTER TABLE `tb_entryversions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_fieldgroups`
--
ALTER TABLE `tb_fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_fieldlayoutfields`
--
ALTER TABLE `tb_fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_fieldlayouts`
--
ALTER TABLE `tb_fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_fieldlayouttabs`
--
ALTER TABLE `tb_fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_fields`
--
ALTER TABLE `tb_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_globalsets`
--
ALTER TABLE `tb_globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_info`
--
ALTER TABLE `tb_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_matrixblocktypes`
--
ALTER TABLE `tb_matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_migrations`
--
ALTER TABLE `tb_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;
--
-- AUTO_INCREMENT for table `tb_plugins`
--
ALTER TABLE `tb_plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_queue`
--
ALTER TABLE `tb_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_relations`
--
ALTER TABLE `tb_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_sections`
--
ALTER TABLE `tb_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_sections_sites`
--
ALTER TABLE `tb_sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_sessions`
--
ALTER TABLE `tb_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_shunnedmessages`
--
ALTER TABLE `tb_shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_sitegroups`
--
ALTER TABLE `tb_sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_sites`
--
ALTER TABLE `tb_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_structureelements`
--
ALTER TABLE `tb_structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_structures`
--
ALTER TABLE `tb_structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_systemmessages`
--
ALTER TABLE `tb_systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_taggroups`
--
ALTER TABLE `tb_taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_templatecachequeries`
--
ALTER TABLE `tb_templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_templatecaches`
--
ALTER TABLE `tb_templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_tokens`
--
ALTER TABLE `tb_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_usergroups`
--
ALTER TABLE `tb_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_usergroups_users`
--
ALTER TABLE `tb_usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_userpermissions`
--
ALTER TABLE `tb_userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_userpermissions_usergroups`
--
ALTER TABLE `tb_userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_userpermissions_users`
--
ALTER TABLE `tb_userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_userpreferences`
--
ALTER TABLE `tb_userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tb_volumefolders`
--
ALTER TABLE `tb_volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_volumes`
--
ALTER TABLE `tb_volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_widgets`
--
ALTER TABLE `tb_widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_assetindexdata`
--
ALTER TABLE `tb_assetindexdata`
  ADD CONSTRAINT `tb_assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `tb_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_assets`
--
ALTER TABLE `tb_assets`
  ADD CONSTRAINT `tb_assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `tb_volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_assets_id_fk` FOREIGN KEY (`id`) REFERENCES `tb_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `tb_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_categories`
--
ALTER TABLE `tb_categories`
  ADD CONSTRAINT `tb_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `tb_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `tb_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `tb_categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tb_categorygroups`
--
ALTER TABLE `tb_categorygroups`
  ADD CONSTRAINT `tb_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `tb_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tb_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `tb_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_categorygroups_sites`
--
ALTER TABLE `tb_categorygroups_sites`
  ADD CONSTRAINT `tb_categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `tb_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `tb_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_content`
--
ALTER TABLE `tb_content`
  ADD CONSTRAINT `tb_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `tb_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `tb_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_craftidtokens`
--
ALTER TABLE `tb_craftidtokens`
  ADD CONSTRAINT `tb_craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `tb_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_elements`
--
ALTER TABLE `tb_elements`
  ADD CONSTRAINT `tb_elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `tb_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tb_elements_sites`
--
ALTER TABLE `tb_elements_sites`
  ADD CONSTRAINT `tb_elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `tb_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `tb_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_entries`
--
ALTER TABLE `tb_entries`
  ADD CONSTRAINT `tb_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `tb_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `tb_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `tb_entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tb_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `tb_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `tb_entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_entrydrafts`
--
ALTER TABLE `tb_entrydrafts`
  ADD CONSTRAINT `tb_entrydrafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `tb_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_entrydrafts_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `tb_entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_entrydrafts_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `tb_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_entrydrafts_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `tb_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_entrytypes`
--
ALTER TABLE `tb_entrytypes`
  ADD CONSTRAINT `tb_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `tb_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tb_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `tb_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_entryversions`
--
ALTER TABLE `tb_entryversions`
  ADD CONSTRAINT `tb_entryversions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `tb_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tb_entryversions_entryId_fk` FOREIGN KEY (`entryId`) REFERENCES `tb_entries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_entryversions_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `tb_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_entryversions_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `tb_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_fieldlayoutfields`
--
ALTER TABLE `tb_fieldlayoutfields`
  ADD CONSTRAINT `tb_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `tb_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `tb_fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `tb_fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_fieldlayouttabs`
--
ALTER TABLE `tb_fieldlayouttabs`
  ADD CONSTRAINT `tb_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `tb_fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_fields`
--
ALTER TABLE `tb_fields`
  ADD CONSTRAINT `tb_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `tb_fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_globalsets`
--
ALTER TABLE `tb_globalsets`
  ADD CONSTRAINT `tb_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `tb_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tb_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `tb_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_matrixblocks`
--
ALTER TABLE `tb_matrixblocks`
  ADD CONSTRAINT `tb_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `tb_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `tb_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `tb_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_matrixblocks_ownerSiteId_fk` FOREIGN KEY (`ownerSiteId`) REFERENCES `tb_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `tb_matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_matrixblocktypes`
--
ALTER TABLE `tb_matrixblocktypes`
  ADD CONSTRAINT `tb_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `tb_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `tb_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tb_migrations`
--
ALTER TABLE `tb_migrations`
  ADD CONSTRAINT `tb_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `tb_plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_relations`
--
ALTER TABLE `tb_relations`
  ADD CONSTRAINT `tb_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `tb_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `tb_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `tb_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `tb_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_sections`
--
ALTER TABLE `tb_sections`
  ADD CONSTRAINT `tb_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `tb_structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tb_sections_sites`
--
ALTER TABLE `tb_sections_sites`
  ADD CONSTRAINT `tb_sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `tb_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `tb_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_sessions`
--
ALTER TABLE `tb_sessions`
  ADD CONSTRAINT `tb_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `tb_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_shunnedmessages`
--
ALTER TABLE `tb_shunnedmessages`
  ADD CONSTRAINT `tb_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `tb_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_sites`
--
ALTER TABLE `tb_sites`
  ADD CONSTRAINT `tb_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `tb_sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_structureelements`
--
ALTER TABLE `tb_structureelements`
  ADD CONSTRAINT `tb_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `tb_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `tb_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_taggroups`
--
ALTER TABLE `tb_taggroups`
  ADD CONSTRAINT `tb_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `tb_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tb_tags`
--
ALTER TABLE `tb_tags`
  ADD CONSTRAINT `tb_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `tb_taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `tb_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_templatecacheelements`
--
ALTER TABLE `tb_templatecacheelements`
  ADD CONSTRAINT `tb_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `tb_templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `tb_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_templatecachequeries`
--
ALTER TABLE `tb_templatecachequeries`
  ADD CONSTRAINT `tb_templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `tb_templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_templatecaches`
--
ALTER TABLE `tb_templatecaches`
  ADD CONSTRAINT `tb_templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `tb_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_usergroups_users`
--
ALTER TABLE `tb_usergroups_users`
  ADD CONSTRAINT `tb_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `tb_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `tb_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_userpermissions_usergroups`
--
ALTER TABLE `tb_userpermissions_usergroups`
  ADD CONSTRAINT `tb_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `tb_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `tb_userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_userpermissions_users`
--
ALTER TABLE `tb_userpermissions_users`
  ADD CONSTRAINT `tb_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `tb_userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `tb_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_userpreferences`
--
ALTER TABLE `tb_userpreferences`
  ADD CONSTRAINT `tb_userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `tb_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD CONSTRAINT `tb_users_id_fk` FOREIGN KEY (`id`) REFERENCES `tb_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `tb_assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tb_volumefolders`
--
ALTER TABLE `tb_volumefolders`
  ADD CONSTRAINT `tb_volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `tb_volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tb_volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `tb_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tb_volumes`
--
ALTER TABLE `tb_volumes`
  ADD CONSTRAINT `tb_volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `tb_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tb_widgets`
--
ALTER TABLE `tb_widgets`
  ADD CONSTRAINT `tb_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `tb_users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
