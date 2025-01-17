-- Create root and demo users

CREATE USER IF NOT EXISTS 'root'@'localhost' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
CREATE USER IF NOT EXISTS 'demo'@'localhost' IDENTIFIED BY 'demo';
GRANT ALL PRIVILEGES ON *.* TO 'demo'@'%';

-- Create  Database

CREATE DATABASE IF NOT EXISTS RIS;

USE RIS;


# Dump of table appointments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `appointments`;

CREATE TABLE `appointments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lname` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `accession_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `scheduled_station_aetitle` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device` tinyint(1) DEFAULT NULL,
  `calendar_id` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mrn` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_phone_full` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_mobile_phone_full` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `unix_start` int DEFAULT NULL,
  `unix_end` int DEFAULT NULL,
  `notes` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'active, cancelled, completed',
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reminder_sent` tinyint(1) NOT NULL DEFAULT '0',
  `repeat_flag` tinyint(1) DEFAULT NULL,
  `repeat_start` date DEFAULT NULL,
  `repeat_end` date DEFAULT NULL,
  `allday` tinyint(1) DEFAULT NULL,
  `repeat_interval` int DEFAULT NULL,
  `repeat_year` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repeat_month` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repeat_day` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repeat_week` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repeat_weekday` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ALTER TABLE appointments AUTO_INCREMENT = 1';



# Dump of table audit_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `audit_sessions`;

CREATE TABLE `audit_sessions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loc` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `org` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complete` tinyint(1) DEFAULT NULL,
  `bogon` tinyint(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `readme` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cookie_pp_consent` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ALTER TABLE audit_sessions AUTO_INCREMENT = 1';



# Dump of table audit_study_view
# ------------------------------------------------------------

DROP TABLE IF EXISTS `audit_study_view`;

CREATE TABLE `audit_study_view` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StudyInstanceUID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `mrn` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accession` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewed` datetime DEFAULT NULL,
  `csrf_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ALTER TABLE audit_study_view AUTO_INCREMENT = 1';



# Dump of table billing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `billing`;

CREATE TABLE `billing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `code_type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pid` bigint DEFAULT NULL,
  `provider_id` int DEFAULT NULL,
  `user` int DEFAULT NULL,
  `groupname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorized` tinyint(1) DEFAULT NULL,
  `encounter` int DEFAULT NULL,
  `code_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `billed` tinyint(1) DEFAULT NULL,
  `activity` tinyint(1) DEFAULT NULL,
  `payer_id` int DEFAULT NULL,
  `bill_process` tinyint NOT NULL DEFAULT '0',
  `bill_date` datetime DEFAULT NULL,
  `process_date` datetime DEFAULT NULL,
  `process_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modifier` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `units` int DEFAULT NULL,
  `fee` decimal(12,2) DEFAULT NULL,
  `justify` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `x12_partner_id` int DEFAULT NULL,
  `ndc_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notecodes` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `external_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pricelevel` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `revenue_code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Item revenue code',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table billing_extracharges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `billing_extracharges`;

CREATE TABLE `billing_extracharges` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `codetype` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codevalue` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codeid` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accession_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mrn` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` decimal(11,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table billing_extracodes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `billing_extracodes`;

CREATE TABLE `billing_extracodes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `codetype` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codevalue` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` decimal(11,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `billing_extracodes` WRITE;
/*!40000 ALTER TABLE `billing_extracodes` DISABLE KEYS */;

INSERT INTO `billing_extracodes` (`id`, `codetype`, `codevalue`, `description`, `fee`)
VALUES
	(1,'CPT4','99070','MATERIALS AND SUPPLIES',0.00),
	(2,'HCPCS','A9579','MRI Contrast, NOS',20.00);

/*!40000 ALTER TABLE `billing_extracodes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table calendars
# ------------------------------------------------------------

DROP TABLE IF EXISTS `calendars`;

CREATE TABLE `calendars` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `calendar_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_id` int DEFAULT NULL,
  `device` tinyint(1) DEFAULT NULL,
  `modality` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduled_station_aetitle` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MediaStorageSOPClassUID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendar_name` (`calendar_name`),
  UNIQUE KEY `device_id` (`device_id`),
  UNIQUE KEY `scheduled_station_aetitle` (`scheduled_station_aetitle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `calendars` WRITE;
/*!40000 ALTER TABLE `calendars` DISABLE KEYS */;

INSERT INTO `calendars` (`id`, `calendar_name`, `device_name`, `device_id`, `device`, `modality`, `scheduled_station_aetitle`, `MediaStorageSOPClassUID`, `active`)
VALUES
	(1,'MR-Esaote','MR-Esaote',1,1,'MR','NmrEsaote','1.2.840.10008.3.1.2.3.3',1),
	(2,'US','US',2,1,'US','AETITLE_US',NULL,0);

/*!40000 ALTER TABLE `calendars` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table claim_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `claim_types`;

CREATE TABLE `claim_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `short_code` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_order` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `claim_types` WRITE;
/*!40000 ALTER TABLE `claim_types` DISABLE KEYS */;

INSERT INTO `claim_types` (`id`, `short_code`, `description`, `display_order`)
VALUES
	(1,'11','Other Non-Federal Programs',12),
	(2,'12','Preferred Provider Organization (PPO)',3),
	(3,'13','Point of Service (POS)',20),
	(4,'14','Exclusive Provider Organization (EPO)',13),
	(5,'15','Indemnity Insurance',14),
	(6,'16','Health Maintenance Organization (HMO) Medicare Risk',5),
	(8,'AM','Automobile Medical',4),
	(9,'BL','Blue Cross Blue Shield',6),
	(10,'CH','ChampUS',9),
	(11,'CI','Commercial Insurance',1),
	(12,'DS','Disability',15),
	(14,'HM','Health Maintenance Organization / Group',2),
	(15,'LM','Liability Medical',16),
	(17,'MB','Medicare Part B',7),
	(18,'MC','Medicaid',8),
	(19,'OF',' Other Federal Program, e.g. Black Lung',11),
	(20,'TV','Title V',17),
	(21,'VA','Veterans Administration Plan',10),
	(22,'WC','Workers Compensation Health Plan',18),
	(23,'ZZ','Mutually Defined',19);

/*!40000 ALTER TABLE `claim_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table claims
# ------------------------------------------------------------

DROP TABLE IF EXISTS `claims`;

CREATE TABLE `claims` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `accession_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mrn` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_amount_paid` decimal(11,2) DEFAULT NULL,
  `ins_id` int DEFAULT NULL,
  `carrier_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table code_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `code_types`;

CREATE TABLE `code_types` (
  `ct_key` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'short alphanumeric name',
  `ct_id` int NOT NULL COMMENT 'numeric identifier',
  `ct_seq` int NOT NULL DEFAULT '0' COMMENT 'sort order',
  `ct_mod` int NOT NULL DEFAULT '0' COMMENT 'length of modifier field',
  `ct_just` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ct_key of justify type, if any',
  `ct_mask` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'formatting mask for code values',
  `ct_fee` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if fees are used',
  `ct_rel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if can relate to other code types',
  `ct_nofs` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if to be hidden in the fee sheet',
  `ct_diag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if this is a diagnosis type',
  `ct_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 if this is active',
  `ct_label` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'label of this code type',
  `ct_external` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 if stored codes in codes tables, 1 or greater if codes stored in external tables',
  `ct_claim` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if this is used in claims',
  `ct_proc` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if this is a procedure type',
  `ct_term` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if this is a clinical term',
  `ct_problem` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if this code type is used as a medical problem',
  `ct_drug` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if this code type is used as a medication',
  PRIMARY KEY (`ct_key`),
  UNIQUE KEY `ct_id` (`ct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `code_types` WRITE;
/*!40000 ALTER TABLE `code_types` DISABLE KEYS */;

INSERT INTO `code_types` (`ct_key`, `ct_id`, `ct_seq`, `ct_mod`, `ct_just`, `ct_mask`, `ct_fee`, `ct_rel`, `ct_nofs`, `ct_diag`, `ct_active`, `ct_label`, `ct_external`, `ct_claim`, `ct_proc`, `ct_term`, `ct_problem`, `ct_drug`)
VALUES
	('CPT4',1,2,12,'ICD10','',1,0,0,0,1,'CPT4 Procedure/Service',0,1,1,0,0,0),
	('CVX',100,100,0,'','',0,0,1,0,0,'CVX Immunization',0,0,0,0,0,0),
	('HCPCS',3,3,12,'ICD10','',1,0,0,0,0,'HCPCS Procedure/Service',0,1,1,0,0,0),
	('ICD10',102,102,0,'','',0,0,0,1,1,'ICD10 Diagnosis',1,1,0,0,1,0),
	('ICD10-PCS',106,106,12,'ICD10','',1,0,0,0,1,'ICD10 Procedure/Service',6,1,1,0,0,0),
	('LOINC',110,110,0,'','',0,0,1,0,0,'LOINC',0,0,0,0,0,0),
	('NCI-CONCEPT-ID',112,112,0,'','',0,0,1,0,0,'NCI CONCEPT ID',0,0,0,0,0,0),
	('PHIN Questions',111,111,0,'','',0,0,1,0,0,'PHIN Questions',0,0,0,0,0,0),
	('RXCUI',109,109,0,'','',0,0,1,0,0,'RXCUI Medication',0,0,0,0,0,1),
	('SNOMED',103,103,0,'','',0,0,0,1,0,'SNOMED Diagnosis',10,1,0,0,1,0),
	('SNOMED-CT',107,107,0,'','',0,0,1,0,0,'SNOMED Clinical Term',11,0,0,1,0,0),
	('SNOMED-PR',108,108,0,'SNOMED','',1,0,0,0,0,'SNOMED Procedure',12,1,1,0,0,0);

/*!40000 ALTER TABLE `code_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table contacts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `contacts`;

CREATE TABLE `contacts` (
  `contact_id` int unsigned NOT NULL AUTO_INCREMENT,
  `mrn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_phone_ctry` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_mobile_phone_ctry` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_mobile_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_1` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_2` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `relationship` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`contact_id`),
  UNIQUE KEY `mrn` (`mrn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table continents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `continents`;

CREATE TABLE `continents` (
  `code` char(2) NOT NULL COMMENT 'Continent code',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

LOCK TABLES `continents` WRITE;
/*!40000 ALTER TABLE `continents` DISABLE KEYS */;

INSERT INTO `continents` (`code`, `name`)
VALUES
	('AF','Africa'),
	('AN','Antarctica'),
	('AS','Asia'),
	('EU','Europe'),
	('NA','North America'),
	('OC','Oceania'),
	('SA','South America');

/*!40000 ALTER TABLE `continents` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country_iso` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `display_order` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;

INSERT INTO `countries` (`id`, `country_iso`, `country_name`, `display_order`)
VALUES
	(1,'AF','Afghanistan',1),
	(2,'AL','Albania',2),
	(3,'DZ','Algeria',3),
	(4,'DS','American Samoa',4),
	(5,'AD','Andorra',5),
	(6,'AO','Angola',6),
	(7,'AI','Anguilla',7),
	(8,'AQ','Antarctica',8),
	(9,'AG','Antigua and Barbuda',9),
	(10,'AR','Argentina',10),
	(11,'AM','Armenia',11),
	(12,'AW','Aruba',12),
	(13,'AU','Australia',13),
	(14,'AT','Austria',14),
	(15,'AZ','Azerbaijan',15),
	(16,'BS','Bahamas',16),
	(17,'BH','Bahrain',17),
	(18,'BD','Bangladesh',18),
	(19,'BB','Barbados',19),
	(20,'BY','Belarus',20),
	(21,'BE','Belgium',21),
	(22,'BZ','Belize',22),
	(23,'BJ','Benin',23),
	(24,'BM','Bermuda',24),
	(25,'BT','Bhutan',25),
	(26,'BO','Bolivia',26),
	(27,'BA','Bosnia and Herzegovina',27),
	(28,'BW','Botswana',28),
	(29,'BV','Bouvet Island',29),
	(30,'BR','Brazil',30),
	(31,'IO','British Indian Ocean Territory',31),
	(32,'BN','Brunei Darussalam',32),
	(33,'BG','Bulgaria',33),
	(34,'BF','Burkina Faso',34),
	(35,'BI','Burundi',35),
	(36,'KH','Cambodia',36),
	(37,'CM','Cameroon',37),
	(38,'CA','Canada',38),
	(39,'CV','Cape Verde',39),
	(40,'KY','Cayman Islands',0),
	(41,'CF','Central African Republic',41),
	(42,'TD','Chad',42),
	(43,'CL','Chile',43),
	(44,'CN','China',44),
	(45,'CX','Christmas Island',45),
	(46,'CC','Cocos (Keeling) Islands',46),
	(47,'CO','Colombia',47),
	(48,'KM','Comoros',48),
	(49,'CD','Democratic Republic of the Congo',49),
	(50,'CG','Republic of Congo',50),
	(51,'CK','Cook Islands',51),
	(52,'CR','Costa Rica',52),
	(53,'HR','Croatia (Hrvatska)',53),
	(54,'CU','Cuba',54),
	(55,'CY','Cyprus',55),
	(56,'CZ','Czech Republic',56),
	(57,'DK','Denmark',57),
	(58,'DJ','Djibouti',58),
	(59,'DM','Dominica',59),
	(60,'DO','Dominican Republic',60),
	(61,'TP','East Timor',61),
	(62,'EC','Ecuador',62),
	(63,'EG','Egypt',63),
	(64,'SV','El Salvador',64),
	(65,'GQ','Equatorial Guinea',65),
	(66,'ER','Eritrea',66),
	(67,'EE','Estonia',67),
	(68,'ET','Ethiopia',68),
	(69,'FK','Falkland Islands (Malvinas)',69),
	(70,'FO','Faroe Islands',70),
	(71,'FJ','Fiji',71),
	(72,'FI','Finland',72),
	(73,'FR','France',73),
	(74,'FX','France, Metropolitan',74),
	(75,'GF','French Guiana',75),
	(76,'PF','French Polynesia',76),
	(77,'TF','French Southern Territories',77),
	(78,'GA','Gabon',78),
	(79,'GM','Gambia',79),
	(80,'GE','Georgia',80),
	(81,'DE','Germany',81),
	(82,'GH','Ghana',82),
	(83,'GI','Gibraltar',83),
	(84,'GK','Guernsey',84),
	(85,'GR','Greece',85),
	(86,'GL','Greenland',86),
	(87,'GD','Grenada',87),
	(88,'GP','Guadeloupe',88),
	(89,'GU','Guam',89),
	(90,'GT','Guatemala',90),
	(91,'GN','Guinea',91),
	(92,'GW','Guinea-Bissau',92),
	(93,'GY','Guyana',93),
	(94,'HT','Haiti',94),
	(95,'HM','Heard and Mc Donald Islands',95),
	(96,'HN','Honduras',96),
	(97,'HK','Hong Kong',97),
	(98,'HU','Hungary',98),
	(99,'IS','Iceland',99),
	(100,'IN','India',100),
	(101,'IM','Isle of Man',101),
	(102,'ID','Indonesia',102),
	(103,'IR','Iran (Islamic Republic of)',103),
	(104,'IQ','Iraq',104),
	(105,'IE','Ireland',105),
	(106,'IL','Israel',106),
	(107,'IT','Italy',107),
	(108,'CI','Ivory Coast',108),
	(109,'JE','Jersey',109),
	(110,'JM','Jamaica',110),
	(111,'JP','Japan',111),
	(112,'JO','Jordan',112),
	(113,'KZ','Kazakhstan',113),
	(114,'KE','Kenya',114),
	(115,'KI','Kiribati',115),
	(116,'KP','Korea, Democratic People\'s Republic of',116),
	(117,'KR','Korea, Republic of',117),
	(118,'XK','Kosovo',118),
	(119,'KW','Kuwait',119),
	(120,'KG','Kyrgyzstan',120),
	(121,'LA','Lao People\'s Democratic Republic',121),
	(122,'LV','Latvia',122),
	(123,'LB','Lebanon',123),
	(124,'LS','Lesotho',124),
	(125,'LR','Liberia',125),
	(126,'LY','Libyan Arab Jamahiriya',126),
	(127,'LI','Liechtenstein',127),
	(128,'LT','Lithuania',128),
	(129,'LU','Luxembourg',129),
	(130,'MO','Macau',130),
	(131,'MK','North Macedonia',131),
	(132,'MG','Madagascar',132),
	(133,'MW','Malawi',133),
	(134,'MY','Malaysia',134),
	(135,'MV','Maldives',135),
	(136,'ML','Mali',136),
	(137,'MT','Malta',137),
	(138,'MH','Marshall Islands',138),
	(139,'MQ','Martinique',139),
	(140,'MR','Mauritania',140),
	(141,'MU','Mauritius',141),
	(142,'TY','Mayotte',142),
	(143,'MX','Mexico',143),
	(144,'FM','Micronesia, Federated States of',144),
	(145,'MD','Moldova, Republic of',145),
	(146,'MC','Monaco',146),
	(147,'MN','Mongolia',147),
	(148,'ME','Montenegro',148),
	(149,'MS','Montserrat',149),
	(150,'MA','Morocco',150),
	(151,'MZ','Mozambique',151),
	(152,'MM','Myanmar',152),
	(153,'NA','Namibia',153),
	(154,'NR','Nauru',154),
	(155,'NP','Nepal',155),
	(156,'NL','Netherlands',156),
	(157,'AN','Netherlands Antilles',157),
	(158,'NC','New Caledonia',158),
	(159,'NZ','New Zealand',159),
	(160,'NI','Nicaragua',160),
	(161,'NE','Niger',161),
	(162,'NG','Nigeria',162),
	(163,'NU','Niue',163),
	(164,'NF','Norfolk Island',164),
	(165,'MP','Northern Mariana Islands',165),
	(166,'NO','Norway',166),
	(167,'OM','Oman',167),
	(168,'PK','Pakistan',168),
	(169,'PW','Palau',169),
	(170,'PS','Palestine',170),
	(171,'PA','Panama',171),
	(172,'PG','Papua New Guinea',172),
	(173,'PY','Paraguay',173),
	(174,'PE','Peru',174),
	(175,'PH','Philippines',175),
	(176,'PN','Pitcairn',176),
	(177,'PL','Poland',177),
	(178,'PT','Portugal',178),
	(179,'PR','Puerto Rico',179),
	(180,'QA','Qatar',180),
	(181,'RE','Reunion',181),
	(182,'RO','Romania',182),
	(183,'RU','Russian Federation',183),
	(184,'RW','Rwanda',184),
	(185,'KN','Saint Kitts and Nevis',185),
	(186,'LC','Saint Lucia',186),
	(187,'VC','Saint Vincent and the Grenadines',187),
	(188,'WS','Samoa',188),
	(189,'SM','San Marino',189),
	(190,'ST','Sao Tome and Principe',190),
	(191,'SA','Saudi Arabia',191),
	(192,'SN','Senegal',192),
	(193,'RS','Serbia',193),
	(194,'SC','Seychelles',194),
	(195,'SL','Sierra Leone',195),
	(196,'SG','Singapore',196),
	(197,'SK','Slovakia',197),
	(198,'SI','Slovenia',198),
	(199,'SB','Solomon Islands',199),
	(200,'SO','Somalia',200),
	(201,'ZA','South Africa',201),
	(202,'GS','South Georgia South Sandwich Islands',202),
	(203,'SS','South Sudan',203),
	(204,'ES','Spain',204),
	(205,'LK','Sri Lanka',205),
	(206,'SH','St. Helena',206),
	(207,'PM','St. Pierre and Miquelon',207),
	(208,'SD','Sudan',208),
	(209,'SR','Suriname',209),
	(210,'SJ','Svalbard and Jan Mayen Islands',210),
	(211,'SZ','Swaziland',211),
	(212,'SE','Sweden',212),
	(213,'CH','Switzerland',213),
	(214,'SY','Syrian Arab Republic',214),
	(215,'TW','Taiwan',215),
	(216,'TJ','Tajikistan',216),
	(217,'TZ','Tanzania, United Republic of',217),
	(218,'TH','Thailand',218),
	(219,'TG','Togo',219),
	(220,'TK','Tokelau',220),
	(221,'TO','Tonga',221),
	(222,'TT','Trinidad and Tobago',222),
	(223,'TN','Tunisia',223),
	(224,'TR','Turkey',224),
	(225,'TM','Turkmenistan',225),
	(226,'TC','Turks and Caicos Islands',226),
	(227,'TV','Tuvalu',227),
	(228,'UG','Uganda',228),
	(229,'UA','Ukraine',229),
	(230,'AE','United Arab Emirates',230),
	(231,'GB','United Kingdom',231),
	(232,'US','United States',-1),
	(233,'UM','United States minor outlying islands',233),
	(234,'UY','Uruguay',234),
	(235,'UZ','Uzbekistan',235),
	(236,'VU','Vanuatu',236),
	(237,'VA','Vatican City State',237),
	(238,'VE','Venezuela',238),
	(239,'VN','Vietnam',239),
	(240,'VG','Virgin Islands (British)',240),
	(241,'VI','Virgin Islands (U.S.)',241),
	(242,'WF','Wallis and Futuna Islands',242),
	(243,'EH','Western Sahara',243),
	(244,'YE','Yemen',244),
	(245,'ZM','Zambia',245),
	(246,'ZW','Zimbabwe',246);

/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table countries_updated
# ------------------------------------------------------------

DROP TABLE IF EXISTS `countries_updated`;


CREATE TABLE `countries_updated` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `code` char(2) NOT NULL COMMENT 'Two-letter country code (ISO 3166-1 alpha-2)',
  `name` varchar(64) NOT NULL COMMENT 'English country name',
  `full_name` varchar(128) NOT NULL COMMENT 'Full English country name',
  `iso3` char(3) NOT NULL COMMENT 'Three-letter country code (ISO 3166-1 alpha-3)',
  `number` smallint(3) unsigned zerofill NOT NULL COMMENT 'Three-digit country number (ISO 3166-1 numeric)',
  `continent_code` char(2) NOT NULL,
  `display_order` int NOT NULL DEFAULT '900',
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `idx_code` (`code`) USING BTREE,
  KEY `idx_continent_code` (`continent_code`) USING BTREE
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

LOCK TABLES `countries_updated` WRITE;


/*!40000 ALTER TABLE `countries_updated` DISABLE KEYS */;

INSERT INTO `countries_updated` (`country_id`, `code`, `name`, `full_name`, `iso3`, `number`, `continent_code`, `display_order`)
VALUES
	(1,'AD','Andorra','Principality of Andorra','AND',020,'EU',7),
	(2,'AE','United Arab Emirates','United Arab Emirates','ARE',784,'AS',232),
	(3,'AF','Afghanistan','Islamic Republic of Afghanistan','AFG',004,'AS',3),
	(4,'AG','Antigua and Barbuda','Antigua and Barbuda','ATG',028,'NA',11),
	(5,'AI','Anguilla','Anguilla','AIA',660,'NA',9),
	(6,'AL','Albania','Republic of Albania','ALB',008,'EU',4),
	(7,'AM','Armenia','Republic of Armenia','ARM',051,'AS',13),
	(8,'AN','Netherlands Antilles','Netherlands Antilles','ANT',530,'NA',157),
	(9,'AO','Angola','Republic of Angola','AGO',024,'AF',8),
	(10,'AQ','Antarctica','Antarctica (the territory South of 60 deg S)','ATA',010,'AN',10),
	(11,'AR','Argentina','Argentine Republic','ARG',032,'SA',12),
	(12,'AS','American Samoa','American Samoa','ASM',016,'OC',6),
	(13,'AT','Austria','Republic of Austria','AUT',040,'EU',16),
	(14,'AU','Australia','Commonwealth of Australia','AUS',036,'OC',15),
	(15,'AW','Aruba','Aruba','ABW',533,'NA',14),
	(16,'AX','Åland','Åland Islands','ALA',248,'EU',246),
	(17,'AZ','Azerbaijan','Republic of Azerbaijan','AZE',031,'AS',17),
	(18,'BA','Bosnia and Herzegovina','Bosnia and Herzegovina','BIH',070,'EU',29),
	(19,'BB','Barbados','Barbados','BRB',052,'NA',21),
	(20,'BD','Bangladesh','People\'s Republic of Bangladesh','BGD',050,'AS',20),
	(21,'BE','Belgium','Kingdom of Belgium','BEL',056,'EU',23),
	(22,'BF','Burkina Faso','Burkina Faso','BFA',854,'AF',37),
	(23,'BG','Bulgaria','Republic of Bulgaria','BGR',100,'EU',36),
	(24,'BH','Bahrain','Kingdom of Bahrain','BHR',048,'AS',19),
	(25,'BI','Burundi','Republic of Burundi','BDI',108,'AF',38),
	(26,'BJ','Benin','Republic of Benin','BEN',204,'AF',25),
	(27,'BL','Saint Barthélemy','Saint Barthelemy','BLM',652,'NA',185),
	(28,'BM','Bermuda','Bermuda','BMU',060,'NA',26),
	(29,'BN','Brunei Darussalam','Brunei Darussalam','BRN',096,'AS',35),
	(30,'BO','Bolivia','Republic of Bolivia','BOL',068,'SA',28),
	(31,'BR','Brazil','Federative Republic of Brazil','BRA',076,'SA',32),
	(32,'BS','Bahamas','Commonwealth of the Bahamas','BHS',044,'NA',18),
	(33,'BT','Bhutan','Kingdom of Bhutan','BTN',064,'AS',27),
	(34,'BV','Bouvet Island','Bouvet Island (Bouvetoya)','BVT',074,'AN',31),
	(35,'BW','Botswana','Republic of Botswana','BWA',072,'AF',30),
	(36,'BY','Belarus','Republic of Belarus','BLR',112,'EU',22),
	(37,'BZ','Belize','Belize','BLZ',084,'NA',24),
	(38,'CA','Canada','Canada','CAN',124,'NA',2),
	(39,'CC','Cocos (Keeling) Islands','Cocos (Keeling) Islands','CCK',166,'AS',48),
	(40,'CD','Congo (Kinshasa)','Democratic Republic of the Congo','COD',180,'AF',51),
	(41,'CF','Central African Republic','Central African Republic','CAF',140,'AF',43),
	(42,'CG','Congo (Brazzaville)','Republic of the Congo','COG',178,'AF',52),
	(43,'CH','Switzerland','Swiss Confederation','CHE',756,'EU',214),
	(44,'CI','Côte d\'Ivoire','Republic of Cote d\'Ivoire','CIV',384,'AF',55),
	(45,'CK','Cook Islands','Cook Islands','COK',184,'OC',53),
	(46,'CL','Chile','Republic of Chile','CHL',152,'SA',45),
	(47,'CM','Cameroon','Republic of Cameroon','CMR',120,'AF',40),
	(48,'CN','China','People\'s Republic of China','CHN',156,'AS',46),
	(49,'CO','Colombia','Republic of Colombia','COL',170,'SA',49),
	(50,'CR','Costa Rica','Republic of Costa Rica','CRI',188,'NA',54),
	(51,'CU','Cuba','Republic of Cuba','CUB',192,'NA',57),
	(52,'CV','Cape Verde','Republic of Cape Verde','CPV',132,'AF',41),
	(53,'CX','Christmas Island','Christmas Island','CXR',162,'AS',47),
	(54,'CY','Cyprus','Republic of Cyprus','CYP',196,'AS',58),
	(55,'CZ','Czech Republic','Czech Republic','CZE',203,'EU',59),
	(56,'DE','Germany','Federal Republic of Germany','DEU',276,'EU',82),
	(57,'DJ','Djibouti','Republic of Djibouti','DJI',262,'AF',61),
	(58,'DK','Denmark','Kingdom of Denmark','DNK',208,'EU',60),
	(59,'DM','Dominica','Commonwealth of Dominica','DMA',212,'NA',62),
	(60,'DO','Dominican Republic','Dominican Republic','DOM',214,'NA',63),
	(61,'DZ','Algeria','People\'s Democratic Republic of Algeria','DZA',012,'AF',5),
	(62,'EC','Ecuador','Republic of Ecuador','ECU',218,'SA',64),
	(63,'EE','Estonia','Republic of Estonia','EST',233,'EU',69),
	(64,'EG','Egypt','Arab Republic of Egypt','EGY',818,'AF',65),
	(65,'EH','Western Sahara','Western Sahara','ESH',732,'AF',242),
	(66,'ER','Eritrea','State of Eritrea','ERI',232,'AF',68),
	(67,'ES','Spain','Kingdom of Spain','ESP',724,'EU',207),
	(68,'ET','Ethiopia','Federal Democratic Republic of Ethiopia','ETH',231,'AF',70),
	(69,'FI','Finland','Republic of Finland','FIN',246,'EU',74),
	(70,'FJ','Fiji','Republic of the Fiji Islands','FJI',242,'OC',73),
	(71,'FK','Falkland Islands','Falkland Islands (Malvinas)','FLK',238,'SA',71),
	(72,'FM','Micronesia','Federated States of Micronesia','FSM',583,'OC',144),
	(73,'FO','Faroe Islands','Faroe Islands','FRO',234,'EU',72),
	(74,'FR','France','French Republic','FRA',250,'EU',75),
	(75,'GA','Gabon','Gabonese Republic','GAB',266,'AF',79),
	(76,'GB','United Kingdom','United Kingdom of Great Britain & Northern Ireland','GBR',826,'EU',233),
	(77,'GD','Grenada','Grenada','GRD',308,'NA',87),
	(78,'GE','Georgia','Georgia','GEO',268,'AS',81),
	(79,'GF','French Guiana','French Guiana','GUF',254,'SA',76),
	(80,'GG','Guernsey','Bailiwick of Guernsey','GGY',831,'EU',91),
	(81,'GH','Ghana','Republic of Ghana','GHA',288,'AF',83),
	(82,'GI','Gibraltar','Gibraltar','GIB',292,'EU',84),
	(83,'GL','Greenland','Greenland','GRL',304,'NA',86),
	(84,'GM','Gambia','Republic of the Gambia','GMB',270,'AF',80),
	(85,'GN','Guinea','Republic of Guinea','GIN',324,'AF',92),
	(86,'GP','Guadeloupe','Guadeloupe','GLP',312,'NA',88),
	(87,'GQ','Equatorial Guinea','Republic of Equatorial Guinea','GNQ',226,'AF',67),
	(88,'GR','Greece','Hellenic Republic Greece','GRC',300,'EU',85),
	(89,'GS','South Georgia and South Sandwich Islands','South Georgia and the South Sandwich Islands','SGS',239,'AN',206),
	(90,'GT','Guatemala','Republic of Guatemala','GTM',320,'NA',90),
	(91,'GU','Guam','Guam','GUM',316,'OC',89),
	(92,'GW','Guinea-Bissau','Republic of Guinea-Bissau','GNB',624,'AF',93),
	(93,'GY','Guyana','Co-operative Republic of Guyana','GUY',328,'SA',94),
	(94,'HK','Hong Kong','Hong Kong Special Administrative Region of China','HKG',344,'AS',99),
	(95,'HM','Heard and McDonald Islands','Heard Island and McDonald Islands','HMD',334,'AN',96),
	(96,'HN','Honduras','Republic of Honduras','HND',340,'NA',98),
	(97,'HR','Croatia','Republic of Croatia','HRV',191,'EU',56),
	(98,'HT','Haiti','Republic of Haiti','HTI',332,'NA',95),
	(99,'HU','Hungary','Republic of Hungary','HUN',348,'EU',100),
	(100,'ID','Indonesia','Republic of Indonesia','IDN',360,'AS',103),
	(101,'IE','Ireland','Ireland','IRL',372,'EU',106),
	(102,'IL','Israel','State of Israel','ISR',376,'AS',108),
	(103,'IM','Isle of Man','Isle of Man','IMN',833,'EU',107),
	(104,'IN','India','Republic of India','IND',356,'AS',102),
	(105,'IO','British Indian Ocean Territory','British Indian Ocean Territory (Chagos Archipelago)','IOT',086,'AS',33),
	(106,'IQ','Iraq','Republic of Iraq','IRQ',368,'AS',105),
	(107,'IR','Iran','Islamic Republic of Iran','IRN',364,'AS',104),
	(108,'IS','Iceland','Republic of Iceland','ISL',352,'EU',101),
	(109,'IT','Italy','Italian Republic','ITA',380,'EU',109),
	(110,'JE','Jersey','Bailiwick of Jersey','JEY',832,'EU',112),
	(111,'JM','Jamaica','Jamaica','JAM',388,'NA',110),
	(112,'JO','Jordan','Hashemite Kingdom of Jordan','JOR',400,'AS',113),
	(113,'JP','Japan','Japan','JPN',392,'AS',111),
	(114,'KE','Kenya','Republic of Kenya','KEN',404,'AF',115),
	(115,'KG','Kyrgyzstan','Kyrgyz Republic','KGZ',417,'AS',120),
	(116,'KH','Cambodia','Kingdom of Cambodia','KHM',116,'AS',39),
	(117,'KI','Kiribati','Republic of Kiribati','KIR',296,'OC',116),
	(118,'KM','Comoros','Union of the Comoros','COM',174,'AF',50),
	(119,'KN','Saint Kitts and Nevis','Federation of Saint Kitts and Nevis','KNA',659,'NA',187),
	(120,'KP','Korea, North','Democratic People\'s Republic of Korea','PRK',408,'AS',117),
	(121,'KR','Korea, South','Republic of Korea','KOR',410,'AS',118),
	(122,'KW','Kuwait','State of Kuwait','KWT',414,'AS',119),
	(123,'KY','Cayman Islands','Cayman Islands','CYM',136,'NA',-1),
	(124,'KZ','Kazakhstan','Republic of Kazakhstan','KAZ',398,'AS',114),
	(125,'LA','Laos','Lao People\'s Democratic Republic','LAO',418,'AS',121),
	(126,'LB','Lebanon','Lebanese Republic','LBN',422,'AS',123),
	(127,'LC','Saint Lucia','Saint Lucia','LCA',662,'NA',188),
	(128,'LI','Liechtenstein','Principality of Liechtenstein','LIE',438,'EU',127),
	(129,'LK','Sri Lanka','Democratic Socialist Republic of Sri Lanka','LKA',144,'AS',208),
	(130,'LR','Liberia','Republic of Liberia','LBR',430,'AF',125),
	(131,'LS','Lesotho','Kingdom of Lesotho','LSO',426,'AF',124),
	(132,'LT','Lithuania','Republic of Lithuania','LTU',440,'EU',128),
	(133,'LU','Luxembourg','Grand Duchy of Luxembourg','LUX',442,'EU',129),
	(134,'LV','Latvia','Republic of Latvia','LVA',428,'EU',122),
	(135,'LY','Libya','Libyan Arab Jamahiriya','LBY',434,'AF',126),
	(136,'MA','Morocco','Kingdom of Morocco','MAR',504,'AF',150),
	(137,'MC','Monaco','Principality of Monaco','MCO',492,'EU',146),
	(138,'MD','Moldova','Republic of Moldova','MDA',498,'EU',145),
	(139,'ME','Montenegro','Republic of Montenegro','MNE',499,'EU',148),
	(140,'MF','Saint Martin (French part)','Saint Martin','MAF',663,'NA',189),
	(141,'MG','Madagascar','Republic of Madagascar','MDG',450,'AF',132),
	(142,'MH','Marshall Islands','Republic of the Marshall Islands','MHL',584,'OC',138),
	(143,'MK','Macedonia','Republic of Macedonia','MKD',807,'EU',131),
	(144,'ML','Mali','Republic of Mali','MLI',466,'AF',136),
	(145,'MM','Myanmar','Union of Myanmar','MMR',104,'AS',152),
	(146,'MN','Mongolia','Mongolia','MNG',496,'AS',147),
	(147,'MO','Macau','Macao Special Administrative Region of China','MAC',446,'AS',130),
	(148,'MP','Northern Mariana Islands','Commonwealth of the Northern Mariana Islands','MNP',580,'OC',165),
	(149,'MQ','Martinique','Martinique','MTQ',474,'NA',139),
	(150,'MR','Mauritania','Islamic Republic of Mauritania','MRT',478,'AF',140),
	(151,'MS','Montserrat','Montserrat','MSR',500,'NA',149),
	(152,'MT','Malta','Republic of Malta','MLT',470,'EU',137),
	(153,'MU','Mauritius','Republic of Mauritius','MUS',480,'AF',141),
	(154,'MV','Maldives','Republic of Maldives','MDV',462,'AS',135),
	(155,'MW','Malawi','Republic of Malawi','MWI',454,'AF',133),
	(156,'MX','Mexico','United Mexican States','MEX',484,'NA',143),
	(157,'MY','Malaysia','Malaysia','MYS',458,'AS',134),
	(158,'MZ','Mozambique','Republic of Mozambique','MOZ',508,'AF',151),
	(159,'NA','Namibia','Republic of Namibia','NAM',516,'AF',153),
	(160,'NC','New Caledonia','New Caledonia','NCL',540,'OC',158),
	(161,'NE','Niger','Republic of Niger','NER',562,'AF',161),
	(162,'NF','Norfolk Island','Norfolk Island','NFK',574,'OC',164),
	(163,'NG','Nigeria','Federal Republic of Nigeria','NGA',566,'AF',162),
	(164,'NI','Nicaragua','Republic of Nicaragua','NIC',558,'NA',160),
	(165,'NL','Netherlands','Kingdom of the Netherlands','NLD',528,'EU',156),
	(166,'NO','Norway','Kingdom of Norway','NOR',578,'EU',166),
	(167,'NP','Nepal','State of Nepal','NPL',524,'AS',155),
	(168,'NR','Nauru','Republic of Nauru','NRU',520,'OC',154),
	(169,'NU','Niue','Niue','NIU',570,'OC',163),
	(170,'NZ','New Zealand','New Zealand','NZL',554,'OC',159),
	(171,'OM','Oman','Sultanate of Oman','OMN',512,'AS',167),
	(172,'PA','Panama','Republic of Panama','PAN',591,'NA',171),
	(173,'PE','Peru','Republic of Peru','PER',604,'SA',174),
	(174,'PF','French Polynesia','French Polynesia','PYF',258,'OC',77),
	(175,'PG','Papua New Guinea','Independent State of Papua New Guinea','PNG',598,'OC',172),
	(176,'PH','Philippines','Republic of the Philippines','PHL',608,'AS',175),
	(177,'PK','Pakistan','Islamic Republic of Pakistan','PAK',586,'AS',168),
	(178,'PL','Poland','Republic of Poland','POL',616,'EU',177),
	(179,'PM','Saint Pierre and Miquelon','Saint Pierre and Miquelon','SPM',666,'NA',190),
	(180,'PN','Pitcairn','Pitcairn Islands','PCN',612,'OC',176),
	(181,'PR','Puerto Rico','Commonwealth of Puerto Rico','PRI',630,'NA',179),
	(182,'PS','Palestine','Occupied Palestinian Territory','PSE',275,'AS',170),
	(183,'PT','Portugal','Portuguese Republic','PRT',620,'EU',178),
	(184,'PW','Palau','Republic of Palau','PLW',585,'OC',169),
	(185,'PY','Paraguay','Republic of Paraguay','PRY',600,'SA',173),
	(186,'QA','Qatar','State of Qatar','QAT',634,'AS',180),
	(187,'RE','Reunion','Reunion','REU',638,'AF',181),
	(188,'RO','Romania','Romania','ROU',642,'EU',182),
	(189,'RS','Serbia','Republic of Serbia','SRB',688,'EU',197),
	(190,'RU','Russian Federation','Russian Federation','RUS',643,'EU',183),
	(191,'RW','Rwanda','Republic of Rwanda','RWA',646,'AF',184),
	(192,'SA','Saudi Arabia','Kingdom of Saudi Arabia','SAU',682,'AS',195),
	(193,'SB','Solomon Islands','Solomon Islands','SLB',090,'OC',203),
	(194,'SC','Seychelles','Republic of Seychelles','SYC',690,'AF',198),
	(195,'SD','Sudan','Republic of Sudan','SDN',736,'AF',209),
	(196,'SE','Sweden','Kingdom of Sweden','SWE',752,'EU',213),
	(197,'SG','Singapore','Republic of Singapore','SGP',702,'AS',200),
	(198,'SH','Saint Helena','Saint Helena','SHN',654,'AF',186),
	(199,'SI','Slovenia','Republic of Slovenia','SVN',705,'EU',202),
	(200,'SJ','Svalbard and Jan Mayen Islands','Svalbard & Jan Mayen Islands','SJM',744,'EU',211),
	(201,'SK','Slovakia','Slovakia (Slovak Republic)','SVK',703,'EU',201),
	(202,'SL','Sierra Leone','Republic of Sierra Leone','SLE',694,'AF',199),
	(203,'SM','San Marino','Republic of San Marino','SMR',674,'EU',193),
	(204,'SN','Senegal','Republic of Senegal','SEN',686,'AF',196),
	(205,'SO','Somalia','Somali Republic','SOM',706,'AF',204),
	(206,'SR','Suriname','Republic of Suriname','SUR',740,'SA',210),
	(207,'ST','Sao Tome and Principe','Democratic Republic of Sao Tome and Principe','STP',678,'AF',194),
	(208,'SV','El Salvador','Republic of El Salvador','SLV',222,'NA',66),
	(209,'SY','Syria','Syrian Arab Republic','SYR',760,'AS',215),
	(210,'SZ','Swaziland','Kingdom of Swaziland','SWZ',748,'AF',212),
	(211,'TC','Turks and Caicos Islands','Turks and Caicos Islands','TCA',796,'NA',228),
	(212,'TD','Chad','Republic of Chad','TCD',148,'AF',44),
	(213,'TF','French Southern Lands','French Southern Territories','ATF',260,'AN',78),
	(214,'TG','Togo','Togolese Republic','TGO',768,'AF',221),
	(215,'TH','Thailand','Kingdom of Thailand','THA',764,'AS',219),
	(216,'TJ','Tajikistan','Republic of Tajikistan','TJK',762,'AS',217),
	(217,'TK','Tokelau','Tokelau','TKL',772,'OC',222),
	(218,'TL','Timor-Leste','Democratic Republic of Timor-Leste','TLS',626,'AS',220),
	(219,'TM','Turkmenistan','Turkmenistan','TKM',795,'AS',227),
	(220,'TN','Tunisia','Tunisian Republic','TUN',788,'AF',225),
	(221,'TO','Tonga','Kingdom of Tonga','TON',776,'OC',223),
	(222,'TR','Turkey','Republic of Turkey','TUR',792,'AS',226),
	(223,'TT','Trinidad and Tobago','Republic of Trinidad and Tobago','TTO',780,'NA',224),
	(224,'TV','Tuvalu','Tuvalu','TUV',798,'OC',229),
	(225,'TW','Taiwan','Taiwan','TWN',158,'AS',216),
	(226,'TZ','Tanzania','United Republic of Tanzania','TZA',834,'AF',218),
	(227,'UA','Ukraine','Ukraine','UKR',804,'EU',231),
	(228,'UG','Uganda','Republic of Uganda','UGA',800,'AF',230),
	(229,'UM','United States Minor Outlying Islands','United States Minor Outlying Islands','UMI',581,'OC',234),
	(230,'US','United States of America','United States of America','USA',840,'NA',1),
	(231,'UY','Uruguay','Eastern Republic of Uruguay','URY',858,'SA',236),
	(232,'UZ','Uzbekistan','Republic of Uzbekistan','UZB',860,'AS',237),
	(233,'VA','Vatican City','Holy See (Vatican City State)','VAT',336,'EU',97),
	(234,'VC','Saint Vincent and the Grenadines','Saint Vincent and the Grenadines','VCT',670,'NA',191),
	(235,'VE','Venezuela','Bolivarian Republic of Venezuela','VEN',862,'SA',239),
	(236,'VG','Virgin Islands, British','British Virgin Islands','VGB',092,'NA',34),
	(237,'VI','Virgin Islands, U.S.','United States Virgin Islands','VIR',850,'NA',235),
	(238,'VN','Vietnam','Socialist Republic of Vietnam','VNM',704,'AS',240),
	(239,'VU','Vanuatu','Republic of Vanuatu','VUT',548,'OC',238),
	(240,'WF','Wallis and Futuna Islands','Wallis and Futuna','WLF',876,'OC',241),
	(241,'WS','Samoa','Independent State of Samoa','WSM',882,'OC',192),
	(242,'YE','Yemen','Yemen','YEM',887,'AS',243),
	(243,'YT','Mayotte','Mayotte','MYT',175,'AF',142),
	(244,'ZA','South Africa','Republic of South Africa','ZAF',710,'AF',205),
	(245,'ZM','Zambia','Republic of Zambia','ZMB',894,'AF',244),
	(246,'ZW','Zimbabwe','Republic of Zimbabwe','ZWE',716,'AF',245);

/*!40000 ALTER TABLE `countries_updated` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table country_dialing_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `country_dialing_codes`;

CREATE TABLE `country_dialing_codes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `iso` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nicename` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `iso3` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numcode` smallint DEFAULT NULL,
  `phonecode` int NOT NULL,
  `display_order` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `country_dialing_codes` WRITE;
/*!40000 ALTER TABLE `country_dialing_codes` DISABLE KEYS */;

INSERT INTO `country_dialing_codes` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`, `display_order`)
VALUES
	(1,'AF','AFGHANISTAN','Afghanistan','AFG',4,93,1),
	(2,'AL','ALBANIA','Albania','ALB',8,355,2),
	(3,'DZ','ALGERIA','Algeria','DZA',12,213,3),
	(4,'AS','AMERICAN SAMOA','American Samoa','ASM',16,1684,4),
	(5,'AD','ANDORRA','Andorra','AND',20,376,5),
	(6,'AO','ANGOLA','Angola','AGO',24,244,6),
	(7,'AI','ANGUILLA','Anguilla','AIA',660,1264,7),
	(8,'AQ','ANTARCTICA','Antarctica',NULL,NULL,0,8),
	(9,'AG','ANTIGUA AND BARBUDA','Antigua and Barbuda','ATG',28,1268,9),
	(10,'AR','ARGENTINA','Argentina','ARG',32,54,10),
	(11,'AM','ARMENIA','Armenia','ARM',51,374,11),
	(12,'AW','ARUBA','Aruba','ABW',533,297,12),
	(13,'AU','AUSTRALIA','Australia','AUS',36,61,13),
	(14,'AT','AUSTRIA','Austria','AUT',40,43,14),
	(15,'AZ','AZERBAIJAN','Azerbaijan','AZE',31,994,15),
	(16,'BS','BAHAMAS','Bahamas','BHS',44,1242,16),
	(17,'BH','BAHRAIN','Bahrain','BHR',48,973,17),
	(18,'BD','BANGLADESH','Bangladesh','BGD',50,880,18),
	(19,'BB','BARBADOS','Barbados','BRB',52,1246,19),
	(20,'BY','BELARUS','Belarus','BLR',112,375,20),
	(21,'BE','BELGIUM','Belgium','BEL',56,32,21),
	(22,'BZ','BELIZE','Belize','BLZ',84,501,22),
	(23,'BJ','BENIN','Benin','BEN',204,229,23),
	(24,'BM','BERMUDA','Bermuda','BMU',60,1441,24),
	(25,'BT','BHUTAN','Bhutan','BTN',64,975,25),
	(26,'BO','BOLIVIA','Bolivia','BOL',68,591,26),
	(27,'BA','BOSNIA AND HERZEGOVINA','Bosnia and Herzegovina','BIH',70,387,27),
	(28,'BW','BOTSWANA','Botswana','BWA',72,267,28),
	(29,'BV','BOUVET ISLAND','Bouvet Island',NULL,NULL,0,29),
	(30,'BR','BRAZIL','Brazil','BRA',76,55,30),
	(31,'IO','BRITISH INDIAN OCEAN TERRITORY','British Indian Ocean Territory',NULL,NULL,246,31),
	(32,'BN','BRUNEI DARUSSALAM','Brunei Darussalam','BRN',96,673,32),
	(33,'BG','BULGARIA','Bulgaria','BGR',100,359,33),
	(34,'BF','BURKINA FASO','Burkina Faso','BFA',854,226,34),
	(35,'BI','BURUNDI','Burundi','BDI',108,257,35),
	(36,'KH','CAMBODIA','Cambodia','KHM',116,855,36),
	(37,'CM','CAMEROON','Cameroon','CMR',120,237,37),
	(38,'CA','CANADA','Canada','CAN',124,1,38),
	(39,'CV','CAPE VERDE','Cape Verde','CPV',132,238,39),
	(40,'KY','CAYMAN ISLANDS','Cayman Islands','CYM',136,1345,0),
	(41,'CF','CENTRAL AFRICAN REPUBLIC','Central African Republic','CAF',140,236,41),
	(42,'TD','CHAD','Chad','TCD',148,235,42),
	(43,'CL','CHILE','Chile','CHL',152,56,43),
	(44,'CN','CHINA','China','CHN',156,86,44),
	(45,'CX','CHRISTMAS ISLAND','Christmas Island',NULL,NULL,61,45),
	(46,'CC','COCOS (KEELING) ISLANDS','Cocos (Keeling) Islands',NULL,NULL,672,46),
	(47,'CO','COLOMBIA','Colombia','COL',170,57,47),
	(48,'KM','COMOROS','Comoros','COM',174,269,48),
	(49,'CG','CONGO','Congo','COG',178,242,49),
	(50,'CD','CONGO, THE DEMOCRATIC REPUBLIC OF THE','Congo, the Democratic Republic of the','COD',180,242,50),
	(51,'CK','COOK ISLANDS','Cook Islands','COK',184,682,51),
	(52,'CR','COSTA RICA','Costa Rica','CRI',188,506,52),
	(53,'CI','COTE D\'IVOIRE','Cote D\'Ivoire','CIV',384,225,53),
	(54,'HR','CROATIA','Croatia','HRV',191,385,54),
	(55,'CU','CUBA','Cuba','CUB',192,53,55),
	(56,'CY','CYPRUS','Cyprus','CYP',196,357,56),
	(57,'CZ','CZECH REPUBLIC','Czech Republic','CZE',203,420,57),
	(58,'DK','DENMARK','Denmark','DNK',208,45,58),
	(59,'DJ','DJIBOUTI','Djibouti','DJI',262,253,59),
	(60,'DM','DOMINICA','Dominica','DMA',212,1767,60),
	(61,'DO','DOMINICAN REPUBLIC','Dominican Republic','DOM',214,1809,61),
	(62,'EC','ECUADOR','Ecuador','ECU',218,593,62),
	(63,'EG','EGYPT','Egypt','EGY',818,20,63),
	(64,'SV','EL SALVADOR','El Salvador','SLV',222,503,64),
	(65,'GQ','EQUATORIAL GUINEA','Equatorial Guinea','GNQ',226,240,65),
	(66,'ER','ERITREA','Eritrea','ERI',232,291,66),
	(67,'EE','ESTONIA','Estonia','EST',233,372,67),
	(68,'ET','ETHIOPIA','Ethiopia','ETH',231,251,68),
	(69,'FK','FALKLAND ISLANDS (MALVINAS)','Falkland Islands (Malvinas)','FLK',238,500,69),
	(70,'FO','FAROE ISLANDS','Faroe Islands','FRO',234,298,70),
	(71,'FJ','FIJI','Fiji','FJI',242,679,71),
	(72,'FI','FINLAND','Finland','FIN',246,358,72),
	(73,'FR','FRANCE','France','FRA',250,33,73),
	(74,'GF','FRENCH GUIANA','French Guiana','GUF',254,594,74),
	(75,'PF','FRENCH POLYNESIA','French Polynesia','PYF',258,689,75),
	(76,'TF','FRENCH SOUTHERN TERRITORIES','French Southern Territories',NULL,NULL,0,76),
	(77,'GA','GABON','Gabon','GAB',266,241,77),
	(78,'GM','GAMBIA','Gambia','GMB',270,220,78),
	(79,'GE','GEORGIA','Georgia','GEO',268,995,79),
	(80,'DE','GERMANY','Germany','DEU',276,49,80),
	(81,'GH','GHANA','Ghana','GHA',288,233,81),
	(82,'GI','GIBRALTAR','Gibraltar','GIB',292,350,82),
	(83,'GR','GREECE','Greece','GRC',300,30,83),
	(84,'GL','GREENLAND','Greenland','GRL',304,299,84),
	(85,'GD','GRENADA','Grenada','GRD',308,1473,85),
	(86,'GP','GUADELOUPE','Guadeloupe','GLP',312,590,86),
	(87,'GU','GUAM','Guam','GUM',316,1671,87),
	(88,'GT','GUATEMALA','Guatemala','GTM',320,502,88),
	(89,'GN','GUINEA','Guinea','GIN',324,224,89),
	(90,'GW','GUINEA-BISSAU','Guinea-Bissau','GNB',624,245,90),
	(91,'GY','GUYANA','Guyana','GUY',328,592,91),
	(92,'HT','HAITI','Haiti','HTI',332,509,92),
	(93,'HM','HEARD ISLAND AND MCDONALD ISLANDS','Heard Island and Mcdonald Islands',NULL,NULL,0,93),
	(94,'VA','HOLY SEE (VATICAN CITY STATE)','Holy See (Vatican City State)','VAT',336,39,94),
	(95,'HN','HONDURAS','Honduras','HND',340,504,95),
	(96,'HK','HONG KONG','Hong Kong','HKG',344,852,96),
	(97,'HU','HUNGARY','Hungary','HUN',348,36,97),
	(98,'IS','ICELAND','Iceland','ISL',352,354,98),
	(99,'IN','INDIA','India','IND',356,91,99),
	(100,'ID','INDONESIA','Indonesia','IDN',360,62,100),
	(101,'IR','IRAN, ISLAMIC REPUBLIC OF','Iran, Islamic Republic of','IRN',364,98,101),
	(102,'IQ','IRAQ','Iraq','IRQ',368,964,102),
	(103,'IE','IRELAND','Ireland','IRL',372,353,103),
	(104,'IL','ISRAEL','Israel','ISR',376,972,104),
	(105,'IT','ITALY','Italy','ITA',380,39,105),
	(106,'JM','JAMAICA','Jamaica','JAM',388,1876,106),
	(107,'JP','JAPAN','Japan','JPN',392,81,107),
	(108,'JO','JORDAN','Jordan','JOR',400,962,108),
	(109,'KZ','KAZAKHSTAN','Kazakhstan','KAZ',398,7,109),
	(110,'KE','KENYA','Kenya','KEN',404,254,110),
	(111,'KI','KIRIBATI','Kiribati','KIR',296,686,111),
	(112,'KP','KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF','Korea, Democratic People\'s Republic of','PRK',408,850,112),
	(113,'KR','KOREA, REPUBLIC OF','Korea, Republic of','KOR',410,82,113),
	(114,'KW','KUWAIT','Kuwait','KWT',414,965,114),
	(115,'KG','KYRGYZSTAN','Kyrgyzstan','KGZ',417,996,115),
	(116,'LA','LAO PEOPLE\'S DEMOCRATIC REPUBLIC','Lao People\'s Democratic Republic','LAO',418,856,116),
	(117,'LV','LATVIA','Latvia','LVA',428,371,117),
	(118,'LB','LEBANON','Lebanon','LBN',422,961,118),
	(119,'LS','LESOTHO','Lesotho','LSO',426,266,119),
	(120,'LR','LIBERIA','Liberia','LBR',430,231,120),
	(121,'LY','LIBYAN ARAB JAMAHIRIYA','Libyan Arab Jamahiriya','LBY',434,218,121),
	(122,'LI','LIECHTENSTEIN','Liechtenstein','LIE',438,423,122),
	(123,'LT','LITHUANIA','Lithuania','LTU',440,370,123),
	(124,'LU','LUXEMBOURG','Luxembourg','LUX',442,352,124),
	(125,'MO','MACAO','Macao','MAC',446,853,125),
	(126,'MK','MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF','Macedonia, the Former Yugoslav Republic of','MKD',807,389,126),
	(127,'MG','MADAGASCAR','Madagascar','MDG',450,261,127),
	(128,'MW','MALAWI','Malawi','MWI',454,265,128),
	(129,'MY','MALAYSIA','Malaysia','MYS',458,60,129),
	(130,'MV','MALDIVES','Maldives','MDV',462,960,130),
	(131,'ML','MALI','Mali','MLI',466,223,131),
	(132,'MT','MALTA','Malta','MLT',470,356,132),
	(133,'MH','MARSHALL ISLANDS','Marshall Islands','MHL',584,692,133),
	(134,'MQ','MARTINIQUE','Martinique','MTQ',474,596,134),
	(135,'MR','MAURITANIA','Mauritania','MRT',478,222,135),
	(136,'MU','MAURITIUS','Mauritius','MUS',480,230,136),
	(137,'YT','MAYOTTE','Mayotte',NULL,NULL,269,137),
	(138,'MX','MEXICO','Mexico','MEX',484,52,138),
	(139,'FM','MICRONESIA, FEDERATED STATES OF','Micronesia, Federated States of','FSM',583,691,139),
	(140,'MD','MOLDOVA, REPUBLIC OF','Moldova, Republic of','MDA',498,373,140),
	(141,'MC','MONACO','Monaco','MCO',492,377,141),
	(142,'MN','MONGOLIA','Mongolia','MNG',496,976,142),
	(143,'MS','MONTSERRAT','Montserrat','MSR',500,1664,143),
	(144,'MA','MOROCCO','Morocco','MAR',504,212,144),
	(145,'MZ','MOZAMBIQUE','Mozambique','MOZ',508,258,145),
	(146,'MM','MYANMAR','Myanmar','MMR',104,95,146),
	(147,'NA','NAMIBIA','Namibia','NAM',516,264,147),
	(148,'NR','NAURU','Nauru','NRU',520,674,148),
	(149,'NP','NEPAL','Nepal','NPL',524,977,149),
	(150,'NL','NETHERLANDS','Netherlands','NLD',528,31,150),
	(151,'AN','NETHERLANDS ANTILLES','Netherlands Antilles','ANT',530,599,151),
	(152,'NC','NEW CALEDONIA','New Caledonia','NCL',540,687,152),
	(153,'NZ','NEW ZEALAND','New Zealand','NZL',554,64,153),
	(154,'NI','NICARAGUA','Nicaragua','NIC',558,505,154),
	(155,'NE','NIGER','Niger','NER',562,227,155),
	(156,'NG','NIGERIA','Nigeria','NGA',566,234,156),
	(157,'NU','NIUE','Niue','NIU',570,683,157),
	(158,'NF','NORFOLK ISLAND','Norfolk Island','NFK',574,672,158),
	(159,'MP','NORTHERN MARIANA ISLANDS','Northern Mariana Islands','MNP',580,1670,159),
	(160,'NO','NORWAY','Norway','NOR',578,47,160),
	(161,'OM','OMAN','Oman','OMN',512,968,161),
	(162,'PK','PAKISTAN','Pakistan','PAK',586,92,162),
	(163,'PW','PALAU','Palau','PLW',585,680,163),
	(164,'PS','PALESTINIAN TERRITORY, OCCUPIED','Palestinian Territory, Occupied',NULL,NULL,970,164),
	(165,'PA','PANAMA','Panama','PAN',591,507,165),
	(166,'PG','PAPUA NEW GUINEA','Papua New Guinea','PNG',598,675,166),
	(167,'PY','PARAGUAY','Paraguay','PRY',600,595,167),
	(168,'PE','PERU','Peru','PER',604,51,168),
	(169,'PH','PHILIPPINES','Philippines','PHL',608,63,169),
	(170,'PN','PITCAIRN','Pitcairn','PCN',612,0,170),
	(171,'PL','POLAND','Poland','POL',616,48,171),
	(172,'PT','PORTUGAL','Portugal','PRT',620,351,172),
	(173,'PR','PUERTO RICO','Puerto Rico','PRI',630,1787,173),
	(174,'QA','QATAR','Qatar','QAT',634,974,174),
	(175,'RE','REUNION','Reunion','REU',638,262,175),
	(176,'RO','ROMANIA','Romania','ROM',642,40,176),
	(177,'RU','RUSSIAN FEDERATION','Russian Federation','RUS',643,70,177),
	(178,'RW','RWANDA','Rwanda','RWA',646,250,178),
	(179,'SH','SAINT HELENA','Saint Helena','SHN',654,290,179),
	(180,'KN','SAINT KITTS AND NEVIS','Saint Kitts and Nevis','KNA',659,1869,180),
	(181,'LC','SAINT LUCIA','Saint Lucia','LCA',662,1758,181),
	(182,'PM','SAINT PIERRE AND MIQUELON','Saint Pierre and Miquelon','SPM',666,508,182),
	(183,'VC','SAINT VINCENT AND THE GRENADINES','Saint Vincent and the Grenadines','VCT',670,1784,183),
	(184,'WS','SAMOA','Samoa','WSM',882,684,184),
	(185,'SM','SAN MARINO','San Marino','SMR',674,378,185),
	(186,'ST','SAO TOME AND PRINCIPE','Sao Tome and Principe','STP',678,239,186),
	(187,'SA','SAUDI ARABIA','Saudi Arabia','SAU',682,966,187),
	(188,'SN','SENEGAL','Senegal','SEN',686,221,188),
	(189,'CS','SERBIA AND MONTENEGRO','Serbia and Montenegro',NULL,NULL,381,189),
	(190,'SC','SEYCHELLES','Seychelles','SYC',690,248,190),
	(191,'SL','SIERRA LEONE','Sierra Leone','SLE',694,232,191),
	(192,'SG','SINGAPORE','Singapore','SGP',702,65,192),
	(193,'SK','SLOVAKIA','Slovakia','SVK',703,421,193),
	(194,'SI','SLOVENIA','Slovenia','SVN',705,386,194),
	(195,'SB','SOLOMON ISLANDS','Solomon Islands','SLB',90,677,195),
	(196,'SO','SOMALIA','Somalia','SOM',706,252,196),
	(197,'ZA','SOUTH AFRICA','South Africa','ZAF',710,27,197),
	(198,'GS','SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS','South Georgia and the South Sandwich Islands',NULL,NULL,0,198),
	(199,'ES','SPAIN','Spain','ESP',724,34,199),
	(200,'LK','SRI LANKA','Sri Lanka','LKA',144,94,200),
	(201,'SD','SUDAN','Sudan','SDN',736,249,201),
	(202,'SR','SURINAME','Suriname','SUR',740,597,202),
	(203,'SJ','SVALBARD AND JAN MAYEN','Svalbard and Jan Mayen','SJM',744,47,203),
	(204,'SZ','SWAZILAND','Swaziland','SWZ',748,268,204),
	(205,'SE','SWEDEN','Sweden','SWE',752,46,205),
	(206,'CH','SWITZERLAND','Switzerland','CHE',756,41,206),
	(207,'SY','SYRIAN ARAB REPUBLIC','Syrian Arab Republic','SYR',760,963,207),
	(208,'TW','TAIWAN, PROVINCE OF CHINA','Taiwan, Province of China','TWN',158,886,208),
	(209,'TJ','TAJIKISTAN','Tajikistan','TJK',762,992,209),
	(210,'TZ','TANZANIA, UNITED REPUBLIC OF','Tanzania, United Republic of','TZA',834,255,210),
	(211,'TH','THAILAND','Thailand','THA',764,66,211),
	(212,'TL','TIMOR-LESTE','Timor-Leste',NULL,NULL,670,212),
	(213,'TG','TOGO','Togo','TGO',768,228,213),
	(214,'TK','TOKELAU','Tokelau','TKL',772,690,214),
	(215,'TO','TONGA','Tonga','TON',776,676,215),
	(216,'TT','TRINIDAD AND TOBAGO','Trinidad and Tobago','TTO',780,1868,216),
	(217,'TN','TUNISIA','Tunisia','TUN',788,216,217),
	(218,'TR','TURKEY','Turkey','TUR',792,90,218),
	(219,'TM','TURKMENISTAN','Turkmenistan','TKM',795,7370,219),
	(220,'TC','TURKS AND CAICOS ISLANDS','Turks and Caicos Islands','TCA',796,1649,220),
	(221,'TV','TUVALU','Tuvalu','TUV',798,688,221),
	(222,'UG','UGANDA','Uganda','UGA',800,256,222),
	(223,'UA','UKRAINE','Ukraine','UKR',804,380,223),
	(224,'AE','UNITED ARAB EMIRATES','United Arab Emirates','ARE',784,971,224),
	(225,'GB','UNITED KINGDOM','United Kingdom','GBR',826,44,225),
	(226,'US','UNITED STATES','United States','USA',840,1,-1),
	(227,'UM','UNITED STATES MINOR OUTLYING ISLANDS','United States Minor Outlying Islands',NULL,NULL,1,227),
	(228,'UY','URUGUAY','Uruguay','URY',858,598,228),
	(229,'UZ','UZBEKISTAN','Uzbekistan','UZB',860,998,229),
	(230,'VU','VANUATU','Vanuatu','VUT',548,678,230),
	(231,'VE','VENEZUELA','Venezuela','VEN',862,58,231),
	(232,'VN','VIET NAM','Viet Nam','VNM',704,84,232),
	(233,'VG','VIRGIN ISLANDS, BRITISH','Virgin Islands, British','VGB',92,1284,233),
	(234,'VI','VIRGIN ISLANDS, U.S.','Virgin Islands, U.s.','VIR',850,1340,234),
	(235,'WF','WALLIS AND FUTUNA','Wallis and Futuna','WLF',876,681,235),
	(236,'EH','WESTERN SAHARA','Western Sahara','ESH',732,212,236),
	(237,'YE','YEMEN','Yemen','YEM',887,967,237),
	(238,'ZM','ZAMBIA','Zambia','ZMB',894,260,238),
	(239,'ZW','ZIMBABWE','Zimbabwe','ZWE',716,263,239),
	(253,'SS','SOUTH SUDAN','South Sudan','SSD',728,211,253);

/*!40000 ALTER TABLE `country_dialing_codes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table currrency
# ------------------------------------------------------------

DROP TABLE IF EXISTS `currrency`;

CREATE TABLE `currrency` (
  `id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `currrency` WRITE;
/*!40000 ALTER TABLE `currrency` DISABLE KEYS */;

INSERT INTO `currrency` (`id`, `value`)
VALUES
	('ADP','Andorran Peseta'),
	('AED','Verenigde Arabiese Emirate dirham'),
	('AFA','Afghan Afghani (1927–2002)'),
	('AFN','Afgaanse afgani'),
	('ALK','Albanian Lek (1946–1965)'),
	('ALL','Albanese lek'),
	('AMD','Armeense dram'),
	('ANG','Nederlands-Antilliaanse gulde'),
	('AOA','Angolese kwanza'),
	('AOK','Angolan Kwanza (1977–1991)'),
	('AON','Angolan New Kwanza (1990–2000)'),
	('AOR','Angolan Readjusted Kwanza (1995–1999)'),
	('ARA','Argentine Austral'),
	('ARL','Argentine Peso Ley (1970–1983)'),
	('ARM','Argentine Peso (1881–1970)'),
	('ARP','Argentine Peso (1983–1985)'),
	('ARS','Argentynse peso'),
	('ATS','Austrian Schilling'),
	('AUD','Australiese dollar'),
	('AWG','Arubaanse floryn'),
	('AZM','Azerbaijani Manat (1993–2006)'),
	('AZN','Azerbeidjaanse manat'),
	('BAD','Bosnia-Herzegovina Dinar (1992–1994)'),
	('BAM','Bosnies-Herzegowiniese omskakelbare marka'),
	('BAN','Bosnia-Herzegovina New Dinar (1994–1997)'),
	('BBD','Barbados-dollar'),
	('BDT','Bangladesjiese taka'),
	('BEC','Belgian Franc (convertible)'),
	('BEF','Belgian Franc'),
	('BEL','Belgian Franc (financial)'),
	('BGL','Bulgarian Hard Lev'),
	('BGM','Bulgarian Socialist Lev'),
	('BGN','Bulgaarse lev'),
	('BGO','Bulgarian Lev (1879–1952)'),
	('BHD','Bahreinse dinar'),
	('BIF','Burundiese frank'),
	('BMD','Bermuda-dollar'),
	('BND','Broeneise dollar'),
	('BOB','Boliviaanse boliviano'),
	('BOL','Bolivian Boliviano (1863–1963)'),
	('BOP','Bolivian Peso'),
	('BOV','Bolivian Mvdol'),
	('BRB','Brazilian New Cruzeiro (1967–1986)'),
	('BRC','Brazilian Cruzado (1986–1989)'),
	('BRE','Brazilian Cruzeiro (1990–1993)'),
	('BRL','Brasilliaanse reaal'),
	('BRN','Brazilian New Cruzado (1989–1990)'),
	('BRR','Brazilian Cruzeiro (1993–1994)'),
	('BRZ','Brazilian Cruzeiro (1942–1967)'),
	('BSD','Bahamiaanse dollar'),
	('BTN','Bhoetanese ngoeltroem'),
	('BUK','Burmese Kyat'),
	('BWP','Botswana pula'),
	('BYB','Belarusian Ruble (1994–1999)'),
	('BYN','Belo-Russiese roebel'),
	('BYR','Belo-Russiese roebel (2000–2016)'),
	('BZD','Beliziese dollar'),
	('CAD','Kanadese dollar'),
	('CDF','Kongolese frank'),
	('CHE','WIR Euro'),
	('CHF','Switserse frank'),
	('CHW','WIR Franc'),
	('CLE','Chilean Escudo'),
	('CLF','Chilean Unit of Account (UF)'),
	('CLP','Chileense peso'),
	('CNX','Chinese People’s Bank Dollar'),
	('CNY','Sjinese joean renminbi'),
	('COP','Colombiaanse peso'),
	('COU','Colombian Real Value Unit'),
	('CRC','Costa Ricaanse colón'),
	('CSD','Serbian Dinar (2002–2006)'),
	('CSK','Czechoslovak Hard Koruna'),
	('CUC','Kubaanse omskakelbare peso'),
	('CUP','Kubaanse peso'),
	('CVE','Kaap Verdiese escudo'),
	('CYP','Cypriot Pound'),
	('CZK','Tsjeggiese kroon'),
	('DDM','East German Mark'),
	('DEM','German Mark'),
	('DJF','Djiboeti frank'),
	('DKK','Deense kroon'),
	('DOP','Dominikaanse peso'),
	('DZD','Algeriese dinar'),
	('ECS','Ecuadorian Sucre'),
	('ECV','Ecuadorian Unit of Constant Value'),
	('EEK','Estonian Kroon'),
	('EGP','Egiptiese pond'),
	('ERN','Eritrese nakfa'),
	('ESA','Spanish Peseta (A account)'),
	('ESB','Spanish Peseta (convertible account)'),
	('ESP','Spanish Peseta'),
	('ETB','Etiopiese birr'),
	('EUR','Euro'),
	('FIM','Finnish Markka'),
	('FJD','Fidjiaanse dollar'),
	('FKP','Falkland-eilande pond'),
	('FRF','French Franc'),
	('GBP','Britse pond'),
	('GEK','Georgian Kupon Larit'),
	('GEL','Georgiese lari'),
	('GHC','Ghanese cedi (1979–2007)'),
	('GHS','Ghanese cedi'),
	('GIP','Gibraltarese pond'),
	('GMD','Gambiese dalasi'),
	('GNF','Guinese frank'),
	('GNS','Guinese syli'),
	('GQE','Equatorial Guinean Ekwele'),
	('GRD','Greek Drachma'),
	('GTQ','Guatemalaanse quetzal'),
	('GWE','Portuguese Guinea Escudo'),
	('GWP','Guinea-Bissau Peso'),
	('GYD','Guyanese dollar'),
	('HKD','Hong Kong dollar'),
	('HNL','Hondurese lempira'),
	('HRD','Croatian Dinar'),
	('HRK','Kroatiese kuna'),
	('HTG','Haïtiaanse gourde'),
	('HUF','Hongaarse florint'),
	('IDR','Indonesiese roepia'),
	('IEP','Irish Pound'),
	('ILP','Israeli Pound'),
	('ILR','Israeli Shekel (1980–1985)'),
	('ILS','Israeliese nuwe sikkel'),
	('INR','Indiese roepee'),
	('IQD','Irakse dinar'),
	('IRR','Iranse rial'),
	('ISJ','Icelandic Króna (1918–1981)'),
	('ISK','Yslandse kroon'),
	('ITL','Italiaanse lier'),
	('JMD','Jamaikaanse dollar'),
	('JOD','Jordaniese dinar'),
	('JPY','Japannese jen'),
	('KES','Keniaanse sjieling'),
	('KGS','Kirgisiese som'),
	('KHR','Kambodjaanse riel'),
	('KMF','Comoraanse frank'),
	('KPW','Noord-Koreaanse won'),
	('KRH','South Korean Hwan (1953–1962)'),
	('KRO','South Korean Won (1945–1953)'),
	('KRW','Suid-Koreaanse won'),
	('KWD','Koeweitse dinar'),
	('KYD','Cayman-eilande dollar'),
	('KZT','Kazakse tenge'),
	('LAK','Laosiaanse kip'),
	('LBP','Lebanese pond'),
	('LKR','Sri Lankaanse roepee'),
	('LRD','Liberiese dollar'),
	('LSL','Lesotho loti'),
	('LTL','Litause litas'),
	('LTT','Lithuanian Talonas'),
	('LUC','Luxembourgian Convertible Franc'),
	('LUF','Luxembourgian Franc'),
	('LUL','Luxembourg Financial Franc'),
	('LVL','Lettiese lats'),
	('LVR','Latvian Ruble'),
	('LYD','Libiese dinar'),
	('MAD','Marokkaanse dirham'),
	('MAF','Moroccan Franc'),
	('MCF','Monegasque Franc'),
	('MDC','Moldovan Cupon'),
	('MDL','Moldowiese leu'),
	('MGA','Malgassiese ariary'),
	('MGF','Malagasy Franc'),
	('MKD','Macedoniese denar'),
	('MKN','Macedonian Denar (1992–1993)'),
	('MLF','Malian Franc'),
	('MMK','Mianmese kyat'),
	('MNT','Mongoolse toegrik'),
	('MOP','Macaose pataca'),
	('MRO','Mauritaniese ouguiya'),
	('MTL','Maltese Lira'),
	('MTP','Maltese Pound'),
	('MUR','Mauritiaanse rupee'),
	('MVP','Maldivian Rupee (1947–1981)'),
	('MVR','Malediviese rufia'),
	('MWK','Malawiese kwacha'),
	('MXN','Meksikaanse peso'),
	('MXP','Mexican Silver Peso (1861–1992)'),
	('MXV','Mexican Investment Unit'),
	('MYR','Maleisiese ringgit'),
	('MZE','Mozambican Escudo'),
	('MZM','Mosambiekse metical (1980–2006)'),
	('MZN','Mosambiekse metical'),
	('NAD','Namibiese dollar'),
	('NGN','Nigeriese naira'),
	('NIC','Nicaraguan Córdoba (1988–1991)'),
	('NIO','Nicaraguaanse córdoba'),
	('NLG','Dutch Guilder'),
	('NOK','Noorse kroon'),
	('NPR','Nepalese roepee'),
	('NZD','Nieu-Seeland dollar'),
	('OMR','Omaanse rial'),
	('PAB','Panamese balboa'),
	('PEI','Peruvian Inti'),
	('PEN','Peruaanse sol'),
	('PES','Peruvian Sol (1863–1965)'),
	('PGK','Papoea-Nieu-Guinese kina'),
	('PHP','Filippynse peso'),
	('PKR','Pakistanse roepee'),
	('PLN','Poolse zloty'),
	('PLZ','Polish Zloty (1950–1995)'),
	('PTE','Portuguese Escudo'),
	('PYG','Paraguaanse guarani'),
	('QAR','Katarrese rial'),
	('RHD','Rhodesian Dollar'),
	('ROL','Romanian Leu (1952–2006)'),
	('RON','Roemeense leu'),
	('RSD','Serbiese dinar'),
	('RUB','Russiese roebel'),
	('RUR','Russian Ruble (1991–1998)'),
	('RWF','Rwandiese frank'),
	('SAR','Saoedi-Arabiese riyal'),
	('SBD','Salomonseilande dollar'),
	('SCR','Seychellese rupee'),
	('SDD','Sudanese Dinar (1992–2007)'),
	('SDG','Soedannese pond'),
	('SDP','Soedannese pond (1957–1998)'),
	('SEK','Sweedse kroon'),
	('SGD','Singapoer dollar'),
	('SHP','Sint Helena pond'),
	('SIT','Slovenian Tolar'),
	('SKK','Slovak Koruna'),
	('SLL','Sierra Leoniese leone'),
	('SOS','Somaliese sjieling'),
	('SRD','Surinaamse dollar'),
	('SRG','Surinamese Guilder'),
	('SSP','Suid-Soedanese pond'),
	('STD','São Tomé en Príncipe dobra'),
	('SUR','Soviet Rouble'),
	('SVC','Salvadoran Colón'),
	('SYP','Siriese pond'),
	('SZL','Swazilandse lilangeni'),
	('THB','Thaise baht'),
	('TJR','Tajikistani Ruble'),
	('TJS','Tadjikse roebel'),
	('TMM','Turkmenistani Manat (1993–2009)'),
	('TMT','Turkmeense manat'),
	('TND','Tunisiese dinar'),
	('TOP','Tongaanse pa’anga'),
	('TPE','Timorese Escudo'),
	('TRL','Turkse lier (1922–2005)'),
	('TRY','Turkse lier'),
	('TTD','Trinidad en Tobago dollar'),
	('TWD','Nuwe Taiwanese dollar'),
	('TZS','Tanzaniese sjieling'),
	('UAH','Oekraïnse hriwna'),
	('UAK','Ukrainian Karbovanets'),
	('UGS','Ugandan Shilling (1966–1987)'),
	('UGX','Ugandese sjieling'),
	('USD','Amerikaanse dollar'),
	('USN','US Dollar (Next day)'),
	('USS','US Dollar (Same day)'),
	('UYI','Uruguayan Peso (Indexed Units)'),
	('UYP','Uruguayan Peso (1975–1993)'),
	('UYU','Uruguaanse peso'),
	('UZS','Oezbekiese som'),
	('VEB','Venezuelan Bolívar (1871–2008)'),
	('VEF','Venezolaanse bolivar'),
	('VND','Viëtnamese dong'),
	('VNN','Vietnamese Dong (1978–1985)'),
	('VUV','Vanuatuse vatu'),
	('WST','Samoaanse tala'),
	('XAF','CFA frank BEAC'),
	('XCD','Oos-Karibbiese dollar'),
	('XEU','European Currency Unit'),
	('XFO','French Gold Franc'),
	('XFU','French UIC-Franc'),
	('XOF','CFA frank BCEAO'),
	('XPF','CFP-frank'),
	('XRE','RINET Funds'),
	('YDD','Yemeni Dinar'),
	('YER','Jemenitiese rial'),
	('YUD','Yugoslavian Hard Dinar (1966–1990)'),
	('YUM','Yugoslavian New Dinar (1994–2002)'),
	('YUN','Yugoslavian Convertible Dinar (1990–1992)'),
	('YUR','Yugoslavian Reformed Dinar (1992–1993)'),
	('ZAL','South African Rand (financial)'),
	('ZAR','Suid-Afrikaanse rand'),
	('ZMK','Zambiese kwacha (1968–2012)'),
	('ZMW','Zambiese kwacha'),
	('ZRN','Zairean New Zaire (1993–1998)'),
	('ZRZ','Zairean Zaire (1971–1993)'),
	('ZWD','Zimbabwiese dollar'),
	('ZWL','Zimbabwean Dollar (2009)'),
	('ZWR','Zimbabwean Dollar (2008)');

/*!40000 ALTER TABLE `currrency` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dicom_tags_maps
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dicom_tags_maps`;

CREATE TABLE `dicom_tags_maps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_name_orthanc` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `dicom_tags_maps` WRITE;
/*!40000 ALTER TABLE `dicom_tags_maps` DISABLE KEYS */;

INSERT INTO `dicom_tags_maps` (`id`, `tag`, `short_name_orthanc`)
VALUES
	(1,'0020,000d','StudyInstanceUID'),
	(2,'0008,0020','StudyDate'),
	(3,'0008,0030','StudyTime'),
	(4,'0008,0060','Modality'),
	(5,'0008,0090','ReferringPhysicianName'),
	(6,'0008,1030','StudyDescription'),
	(7,'0010,0020','PatientID'),
	(8,'0010,0010','PatientName'),
	(9,'0010,0040','PatientSex'),
	(10,'0020,1002','ImagesInAcquisition');

/*!40000 ALTER TABLE `dicom_tags_maps` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table dicom_uploads
# ------------------------------------------------------------

DROP TABLE IF EXISTS `dicom_uploads`;

CREATE TABLE `dicom_uploads` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uploader_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploader_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orthanc_uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StudyInstanceUID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `AccessionNumber` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StudyDate` date DEFAULT NULL,
  `StudyTime` time DEFAULT NULL,
  `ReferringPhysicianName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `InstitutionName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `StudyDescription` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `PatientID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `OtherPatientIDs` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `PatientName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `PatientBirthDate` date DEFAULT NULL,
  `PatientSex` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `ImagesInAcquisition` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Modality` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_datetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table employers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employers`;

CREATE TABLE `employers` (
  `employer_id` int unsigned NOT NULL AUTO_INCREMENT,
  `mrn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employer_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_lname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_fname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_phone_ctry` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_phone_suffix` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_1` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `address_2` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`employer_id`),
  UNIQUE KEY `mrn` (`mrn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exam_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exam_groups`;

CREATE TABLE `exam_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exam_groups` WRITE;
/*!40000 ALTER TABLE `exam_groups` DISABLE KEYS */;

INSERT INTO `exam_groups` (`id`, `name`)
VALUES
	(4,'General'),
	(2,'MSK'),
	(1,'Neuro'),
	(3,'Surgery');

/*!40000 ALTER TABLE `exam_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exams`;

CREATE TABLE `exams` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `requested_procedure_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exam_length` int DEFAULT NULL,
  `exam_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modality` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpt` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linked_exams` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `requested_procedure_id` (`requested_procedure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;

INSERT INTO `exams` (`id`, `requested_procedure_id`, `group_name`, `exam_length`, `exam_name`, `modality`, `code_type`, `cpt`, `linked_exams`)
VALUES
	(1,'0001','Neuro',60,'MRI BRAIN / BRAIN STEM - WITHOUT CONTRAST','MR','CPT4','70551','[\"70551\"]'),
	(2,'0002','Neuro',60,'MRI BRAIN / BRAIN STEM WITH CONTRAST','MR','CPT4','70552','[\"70552\",\"A9579\"]'),
	(3,'0003','Neuro',60,'MRI BRAIN / BRAIN STEM W/WO','MR','CPT4','70553','[\"70553\",\"A9579\"]'),
	(4,'0004','Neuro',60,'MRI C-SPINE - WITHOUT CONTRAST','MR','CPT4','72141','[\"72141\"]'),
	(5,'0005','Neuro',60,'MRI C-SPINE WITH CONTRAST','MR','CPT4','72142','[\"72142\",\"A9579\"]'),
	(6,'0006','Neuro',60,'MRI T-SPINE - WITHOUT CONTRAST','MR','CPT4','72146','[\"72146\"]'),
	(7,'0007','Neuro',60,'MRI T-SPINE WITH CONTRAST','MR','CPT4','72147','[\"72147\",\"A9579\"]'),
	(8,'0008','Neuro',60,'MRI L-SPINE - WITHOUT CONTRAST','MR','CPT4','72148','[\"72148\"]'),
	(9,'0009','Neuro',60,'MRI L-SPINE WITH CONTRAST','MR','CPT4','72149','[\"72149\",\"A9579\"]'),
	(10,'0010','Neuro',60,'MRI C-SPINE W/WO','MR','CPT4','72156','[\"72156\",\"A9579\"]'),
	(11,'0011','Neuro',60,'MRI T-SPINE W/WO','MR','CPT4','72157','[\"72157\",\"A9579\"]'),
	(12,'0012','Neuro',60,'MRI L-SPINE W/WO','MR','CPT4','72158','[\"72158\",\"A9579\"]'),
	(13,'0013','MSK',60,'MRI SHOULDER - RIGHT - WITHOUT CONTRAST','MR','CPT4','73221','[\"73221\"]'),
	(14,'0014','MSK',60,'MRI SHOULDER - LEFT - WITHOUT CONTRAST','MR','CPT4','73221','[\"73221\"]'),
	(15,'0015','MSK',60,'MRI ELBOW - RIGHT - WITHOUT CONTRAST','MR','CPT4','73221','[\"73221\"]'),
	(16,'0016','MSK',60,'MRI ELBOW - LEFT - WITHOUT CONTRAST','MR','CPT4','73221','[\"73221\"]'),
	(17,'0017','MSK',60,'MRI WRIST - RIGHT - DYNAMIC','MR','CPT4','73221','[\"73221\",\"96004\"]'),
	(18,'0018','MSK',60,'MRI WRIST - LEFT - DYNAMIC','MR','CPT4','73221','[\"73221\",\"96004\"]'),
	(19,'0019','MSK',60,'MRI HIP - RIGHT  - WITHOUT CONTRAST','MR','CPT4','73721','[\"73721\"]'),
	(20,'0020','MSK',60,'MRI HIP - LEFT - WITHOUT CONTRAST','MR','CPT4','73721','[\"73721\"]'),
	(21,'0021','MSK',60,'MRI KNEE - RIGHT - WITHOUT CONTRAST','MR','CPT4','73721','[\"73721\"]'),
	(22,'0022','MSK',60,'MRI KNEE -  LEFT - WITHOUT CONTRAST','MR','CPT4','73721','[\"73721\"]'),
	(23,'0023','MSK',60,'MRI ANKLE - RIGHT - WITHOUT CONTRAST','MR','CPT4','73721','[\"73721\"]'),
	(24,'0024','MSK',60,'MRI ANKLE - LEFT - WITHOUT CONTRAST','MR','CPT4','73721','[\"73721\"]'),
	(25,'0025','Neuro',60,'MRI ORBIT FACE, NECK - WITHOUT CONTRAST','MR','CPT4','70540','[\"70540\"]'),
	(26,'0026','Neuro',60,'MRI ORBIT FACE, NECK WITH CONTRAST ','MR','CPT4','70542','[\"70542\",\"A9579\"]'),
	(27,'0027','Neuro',60,'MRI ORBIT FACE, NECK W/WO','MR','CPT4','70543','[\"70543\",\"A9579\"]'),
	(28,'0028','MSK',60,'MRI HAND - RIGHT - W/WO','MR','CPT4','73220','[\"73220\",\"A9579\"]'),
	(29,'0029','MSK',60,'ZZZZ','MR','CPT4','73718','[\"73718\"]'),
	(30,'0030','MSK',60,'ZZZ','MR','CPT4','73720','[\"73720\",\"A9579\"]'),
	(31,'0031','MSK',60,'ZZZZ','MR','CPT4','73720','[\"73720\",\"A9579\"]'),
	(32,'0032','MSK',60,'MRI ANKLE - LEFT - W/WO','MR','CPT4','73218','[\"73723\",\"A9579\"]'),
	(33,'0033','MSK',60,'ZZZZ','MR','CPT4','73218','[\"73218\"]'),
	(34,'0034','MSK',60,'MRI ANKLE - RIGHT - W/WO','MR','CPT4','73220','[\"73723\",\"A9579\"]'),
	(35,'0035','MSK',60,'ZZZZ','MR','CPT4','73220','[\"73220\",\"A9579\"]'),
	(36,'0036','General',15,'Outside Read - Plain Film','CR','CPT4','76140','[\"76140\"]'),
	(37,'0037','Neuro',60,'MRI INTERNAL AUDITORY CANAL - NO CONTRAST','MR','CPT4','70553','[\"70551\"]'),
	(38,'0038','MSK',60,'MRI TMJ - WITHOUT CONTRAST','MR','CPT4','70336','[\"70336\"]'),
	(39,'0039','MSK',60,'MRI SHOULDER - RIGHT - ARTHROGRAM','MR','CPT4','70336','[\"73222\",\"99999\",\"A9579\"]'),
	(40,'0040','MSK',60,'MRI SHOULDER - LEFT - ARTHROGRAM','MR','CPT4','73222','[\"73222\",\"99999\",\"A9579\"]'),
	(41,'0041','General',30,'Daily QC','MR','CPT4','99000','[\"99000\"]'),
	(43,'0043','Neuro',60,'MRI INTERNAL AUDITORY CANAL - W/WO','MR','CPT4','70553','[\"70553\",\"A9579\"]'),
	(44,'0044','Neuro',60,'MRI PITUITARY - W/WO','MR','CPT4','70553','[\"70553\",\"A9579\"]'),
	(47,'0047','MSK',60,'MRI WRIST - LEFT - WITHOUT CONTRAST','MR','CPT4','73221','[\"73221\"]'),
	(48,'0048','MSK',60,'MRI FOOT - RIGHT - WITHOUT CONTRAST','MR','CPT4','73718','[\"73718\"]'),
	(49,'0049','MSK',60,'MRI FOOT - RIGHT - W/WO','MR','CPT4','73720','[\"73720\",\"A9579\"]'),
	(50,'0050','MSK',60,'MRI FOOT - LEFT - WITHOUT CONTRAST','MR','CPT4','73718','[\"73718\"]'),
	(51,'0051','MSK',60,'MRI FOOT - LEFT - W/WO','MR','CPT4','73718','[\"73720\",\"A9579\"]'),
	(52,'0052','MSK',60,'MRI HAND - RIGHT - WITHOUT CONTRAST','MR','CPT4','73218','[\"73218\"]'),
	(53,'0053','MSK',60,'MRI HAND - LEFT - WITHOUT CONTRAST','MR','CPT4','73218','[\"73218\"]'),
	(54,'0054','MSK',60,'MRI HAND - LEFT - W/WO','MR','CPT4','73220','[\"73220\",\"A9579\"]'),
	(55,'0055','General',30,'MWL Testing','MR','CPT4','73718','[\"99000\"]'),
	(56,'0056','General',45,'OFFICE OUTPATIENT NEW 45 MINUTES','MR','CPT4','99205','[\"73718\"]'),
	(57,'0057','MSK',60,'MRI UPPER ARM - RIGHT','MR','CPT4','73720','[\"73218\"]'),
	(58,'0058','MSK',60,'MRI UPPER ARM - LEFT','MR','CPT4','73720','[\"73218\"]'),
	(60,'0060','MSK',60,'ZZZ','MR','CPT4','73720','[\"73720\",\"A9579\"]'),
	(61,'0061','MSK',60,'MRI WRIST - RIGHT - WITHOUT CONTRAST','MR','CPT4','73221','[\"73221\"]');

/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table exams_copy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exams_copy`;

CREATE TABLE `exams_copy` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `requested_procedure_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exam_length` int DEFAULT NULL,
  `exam_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modality` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpt` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_fee` decimal(11,2) DEFAULT NULL,
  `technical_fee` decimal(11,2) DEFAULT NULL,
  `professional_fee` decimal(11,2) DEFAULT NULL,
  `linked_exams` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `requested_procedure_id` (`requested_procedure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table exams_cptcodes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `exams_cptcodes`;

CREATE TABLE `exams_cptcodes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modality` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpt` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_fee` decimal(11,2) DEFAULT NULL,
  `technical_fee` decimal(11,2) DEFAULT NULL,
  `professional_fee` decimal(11,2) DEFAULT NULL,
  `usefull` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `end_date` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `exams_cptcodes` WRITE;
/*!40000 ALTER TABLE `exams_cptcodes` DISABLE KEYS */;

INSERT INTO `exams_cptcodes` (`id`, `exam_name`, `modality`, `code_type`, `cpt`, `total_fee`, `technical_fee`, `professional_fee`, `usefull`, `start_date`, `end_date`)
VALUES
	(1,'MRI BRAIN','MR','CPT4','70551',1380.60,1169.28,315.00,0,'2020-01-01','2021-12-31'),
	(2,'MRI BRAIN WITH CONTRAST','MR','CPT4','70552',1575.90,1313.73,315.00,0,'2020-01-01','2021-12-31'),
	(3,'MRI BRAIN  W/WO  CONTRAST','MR','CPT4','70553',1899.00,1543.06,379.80,0,'2020-01-01','2021-12-31'),
	(4,'MRI C-SPINE','MR','CPT4','72141',1344.60,1090.97,269.10,0,'2020-01-01','2021-12-31'),
	(5,'MRI C-SPINE WITH CONTRAST','MR','CPT4','72142',1611.90,1328.48,322.20,0,'2020-01-01','2021-12-31'),
	(6,'MRI T-SPINE','MR','CPT4','72146',1468.80,1192.23,293.40,0,'2020-01-01','2021-12-31'),
	(7,'MRI T-SPINE WITH CONTRAST','MR','CPT4','72147',1611.90,1291.68,322.20,0,'2020-01-01','2021-12-31'),
	(8,'MRI L-SPINE','MR','CPT4','72148',1451.70,1193.47,290.70,0,'2020-01-01','2021-12-31'),
	(9,'MRI L-SPINE WITH CONTRAST','MR','CPT4','72149',1593.90,1324.94,318.60,0,'2020-01-01','2021-12-31'),
	(10,'MRI C-SPINE W/WO CONTRAST','MR','CPT4','72156',2248.20,1787.03,449.10,0,'2020-01-01','2021-12-31'),
	(11,'MRI T-SPINE W/WO CONTRAST','MR','CPT4','72157',2253.60,1755.53,450.90,0,'2020-01-01','2021-12-31'),
	(12,'MRI L-SPINE W/WO CONTRAST','MR','CPT4','72158',2196.00,1770.53,439.20,0,'2020-01-01','2021-12-31'),
	(13,'MRI UPPER EXTREMITY JOINT','MR','CPT4','73221',1349.10,1046.87,270.00,1,'2020-01-01','2021-12-31'),
	(14,'MRI LOWER EXTREMITY JOINT','MR','CPT4','73721',1381.27,1071.83,293.40,0,'2020-01-01','2021-12-31'),
	(15,'MRI UPPER EXTREMITY JOINT WITH CONTRAST','MR','CPT4','73222',1431.78,1230.96,200.81,0,'2020-01-01','2021-12-31'),
	(16,'MRI LOWER EXTREMITY JOINT WITH CONTRAST','MR','CPT4','73722',1430.28,1229.76,200.52,0,'2020-01-01','2021-12-31'),
	(17,'Injection of Shoulder Arthrogram','MR','CPT4','99999',177.30,0.00,0.00,1,'2020-01-01','2021-12-31'),
	(19,'MRI ORBIT FACE & NECK','MR','CPT4','70540',1377.90,1175.21,275.40,0,'2020-01-01','2021-12-31'),
	(20,'MRI ORBIT FACE & NECK WITH CONTRAST','MR','CPT4','70542',2211.94,1903.00,273.12,0,'2020-01-01','2021-12-31'),
	(21,'MRI ORBIT FACE & NECK W/WO','MR','CPT4','70543',2662.89,2389.78,273.12,0,'2020-01-01','2021-12-31'),
	(26,'MRI LOWER EXTREMITY, OTHER THAN JOINT','MR','CPT4','73718',1277.59,1100.84,176.75,0,'2020-01-01','2021-12-31'),
	(27,'MRI LOWER EXTREMITY W/WO CONTRAST, OTHER THAN JOINT','MR','CPT4','73720',1755.90,1464.84,350.10,0,'2020-01-01','2021-12-31'),
	(28,'MRI UPPER EXTREMITY, OTHER THAN JOINT','MR','CPT4','73218',1120.22,965.93,154.29,0,'2020-01-01','2021-12-31'),
	(29,'MRI UPPER EXTREMITY  W/WO CONTRAST, OTHER THAN JOINT','MR','CPT4','73220',1757.70,1463.40,351.00,0,'2020-01-01','2021-12-31'),
	(30,'Outside Read - Plain Film','CR','CPT4','76140',35.00,0.00,35.00,0,'2020-01-01','2021-12-31'),
	(31,'US RETROPERITONEAL REAL TIME W/IMAGE COMPLETE (Aorta & Renal)','US','CPT4','76770',318.12,238.77,130.50,0,'2020-01-01','2021-12-31'),
	(32,'MRI TMJ','MR','CPT4','70336',1227.60,1005.20,244.80,1,'2020-01-01','2021-12-31'),
	(33,'CT ABDOMEN W/O CONTRAST MATERIAL','CT','CPT4','74150',829.56,578.22,183.60,0,'2020-01-01','2021-12-31'),
	(34,'MRI Contrast','MR','HCPCS','A9579',10.00,0.00,0.00,1,'2020-01-01','2021-12-31'),
	(35,'QC Check MRI','MR','CPT4','99000',0.00,0.00,0.00,1,'2021-04-20','2022-12-31'),
	(39,'REVIEW AND INTERPRETATION OF DYNAMIC STUDY','MR','CPT4','96004',206.48,0.00,0.00,1,'2019-04-10','2021-12-31'),
	(40,'MRI LOWER EXTREMITY JOINT W/WO','MR','CPT4','73723',1732.45,1551.48,180.97,1,'2021-01-01','2021-12-31'),
	(41,'MRI UPPER EXTREMITY JOINT W/WO','MR','CPT4','73223',1773.84,1588.79,185.05,1,'2021-01-01','2021-12-31');

/*!40000 ALTER TABLE `exams_cptcodes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table facility
# ------------------------------------------------------------

DROP TABLE IF EXISTS `facility`;

CREATE TABLE `facility` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_1` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_2` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `country_code_3` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `postal_code` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_ctry` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax_country` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facilitylogopath` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facilitylogo_dataurl` blob,
  `google_maps_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `federal_ein` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_location` tinyint(1) NOT NULL DEFAULT '1',
  `billing_location` tinyint(1) NOT NULL DEFAULT '0',
  `facility_currency` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_interest-rate` decimal(3,2) DEFAULT NULL,
  `accepts_assignment` tinyint(1) NOT NULL DEFAULT '0',
  `pos_code` tinyint DEFAULT NULL,
  `x12_sender_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attn` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domain_identifier` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facility_npi` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facility_taxonomy` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id_type` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `primary_business_entity` int NOT NULL DEFAULT '0' COMMENT '0-Not Set as business entity 1-Set as business entity',
  `facility_code` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_validation` tinyint(1) NOT NULL DEFAULT '1',
  `mail_street` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_street2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_state` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_country` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_zip` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'HIEs CCDA and FHIR an OID is required/wanted',
  `orthanc_host` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;

INSERT INTO `facility` (`id`, `name`, `address_1`, `address_2`, `city`, `state`, `country`, `country_code_3`, `postal_code`, `phone_ctry`, `phone`, `fax_country`, `fax`, `website`, `email`, `facilitylogopath`, `facilitylogo_dataurl`, `google_maps_url`, `federal_ein`, `service_location`, `billing_location`, `facility_currency`, `billing_interest-rate`, `accepts_assignment`, `pos_code`, `x12_sender_id`, `attn`, `domain_identifier`, `facility_npi`, `facility_taxonomy`, `tax_id_type`, `color`, `primary_business_entity`, `facility_code`, `extra_validation`, `mail_street`, `mail_street2`, `mail_city`, `mail_state`, `mail_country`, `mail_zip`, `oid`, `orthanc_host`)
VALUES
	(1,'Demo Project','','','','','','','','','','','','','demo@test.com','','','','ein',1,1,'USD',NULL,0,11,'x12_sender_id','attn','domain_identifier','facility_npi','facility_taxon','EI','#99FFFF',0,'',1,'','','','','','','oid',1);

/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table icd10_dx_order_code
# ------------------------------------------------------------

DROP TABLE IF EXISTS `icd10_dx_order_code`;

CREATE TABLE `icd10_dx_order_code` (
  `dx_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `dx_code` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `formatted_dx_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_for_coding` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_desc` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_desc` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint DEFAULT '0',
  `revision` int DEFAULT '0',
  UNIQUE KEY `dx_id` (`dx_id`),
  KEY `formatted_dx_code` (`formatted_dx_code`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


# Dump of table icd10_pcs_order_code
# ------------------------------------------------------------

DROP TABLE IF EXISTS `icd10_pcs_order_code`;

CREATE TABLE `icd10_pcs_order_code` (
  `pcs_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `pcs_code` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid_for_coding` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_desc` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_desc` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint DEFAULT '0',
  `revision` int DEFAULT '0',
  UNIQUE KEY `pcs_id` (`pcs_id`),
  KEY `pcs_code` (`pcs_code`),
  KEY `active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


# Dump of table notes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notes`;

CREATE TABLE `notes` (
  `note_id` int unsigned NOT NULL AUTO_INCREMENT,
  `note_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='user notes';

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;

INSERT INTO `notes` (`note_id`, `note_text`, `user_id`)
VALUES
	(1,'test',1);

/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_bill_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_bill_status`;

CREATE TABLE `order_bill_status` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `accession_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mrn` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'NA, NOPAYMENTS, PARTIAL, PAID',
  `claim_status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accession_number` (`accession_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table order_priorities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_priorities`;

CREATE TABLE `order_priorities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `text` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hl7_code` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `order_priorities` WRITE;
/*!40000 ALTER TABLE `order_priorities` DISABLE KEYS */;

INSERT INTO `order_priorities` (`id`, `text`, `hl7_code`)
VALUES
	(1,'Routine','R'),
	(2,'Urgent','A'),
	(3,'Emergent','S'),
	(4,'Preop','P'),
	(5,'CallBack','C'),
	(6,'Specific Time','T');

/*!40000 ALTER TABLE `order_priorities` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `priority` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accession_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patientid` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ourstatus` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `requested_procedure_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coded_exam` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coding_scheme` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StudyInstanceUID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `patient_fname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_lname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_mname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_birth_date` date DEFAULT NULL,
  `patient_sex` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referring_physician` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referring_physician_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sending_facility` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modality` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scheduled_station_aetitle` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `calendar_id` int DEFAULT NULL,
  `scheduled_procedure_step_start_date` date DEFAULT NULL,
  `scheduled_procedure_step_start_time` time DEFAULT NULL,
  `indication` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exam_length` int DEFAULT NULL,
  `orderedbyuser_id` int DEFAULT NULL,
  `orderbyuser_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_employment` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_auto` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_otheraccident` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_emergency` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_drugs` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_pregnancy` date DEFAULT NULL,
  `employed` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employed_student` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employed_other` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `illness_date` date DEFAULT NULL,
  `apptid` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priorauth` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ALTER TABLE orders AUTO_INCREMENT = 1';



# Dump of table orders_requests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders_requests`;

CREATE TABLE `orders_requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `priority` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `patient_fname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_lname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_mname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_birth_date` date DEFAULT NULL,
  `patient_sex` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patientid` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_phone_ctry` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_phone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referring_physician_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referring_physician_fname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referring_physician_lname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referring_physician_phone_ctry` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referring_physician_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referring_physician_email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_type_text` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indication` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderedbyuser_id` int DEFAULT NULL,
  `orderbyuser_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `scheduled_procedure_step_start_date` date DEFAULT NULL,
  `scheduled_procedure_step_start_time` time DEFAULT NULL,
  `requested_procedure_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_employment` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_auto` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_otheraccident` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_emergency` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_drugs` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_pregnancy` date DEFAULT NULL,
  `employed` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employed_student` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employed_other` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `illness_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ALTER TABLE orders AUTO_INCREMENT = 1';



# Dump of table orthanc_hosts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orthanc_hosts`;

CREATE TABLE `orthanc_hosts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `AET` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nginx_admin_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orthanc_postgres_connect` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `MWLQueryPath` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `osimis_viewer_link` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `osimis_viewer_check` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `server_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `osimis_viewer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `domain` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stone_viewer` tinyint DEFAULT NULL,
  `stone_OrthancApiRoot` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `orthanc_hosts` WRITE;
/*!40000 ALTER TABLE `orthanc_hosts` DISABLE KEYS */;

INSERT INTO `orthanc_hosts` (`id`, `AET`, `nginx_admin_url`, `orthanc_postgres_connect`, `api_url`, `MWLQueryPath`, `osimis_viewer_link`, `osimis_viewer_check`, `server_name`, `osimis_viewer_name`, `domain`, `stone_viewer`, `stone_OrthancApiRoot`)
VALUES
	(1,'DEMO','','host=postgres_index-db port=5432 dbname=postgres user=postgres password=postgres','http://pacs:8042/','modalities/SELF/find-worklist','/pacs/osimis-viewer/app/index.html?','http://pacs:8042/tools/now-local','DEMO','DEMO','orthanc.test',0,NULL),
	(2,'DEMO','','host=postgres_index-db port=5432 dbname=postgres user=postgres password=postgres','http://pacs:8042/','modalities/SELF/find-worklist','/Studies/stone_viewer?','http://pacs:8042/tools/now-local','DEMO STONE','DEMO STONE','orthanc.test',1,'/pacs');

/*!40000 ALTER TABLE `orthanc_hosts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table patient_encounter_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `patient_encounter_types`;

CREATE TABLE `patient_encounter_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `patient_encounter_types` WRITE;
/*!40000 ALTER TABLE `patient_encounter_types` DISABLE KEYS */;

INSERT INTO `patient_encounter_types` (`id`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'Email','2021-07-02 04:04:22',NULL),
	(2,'Phone','2021-07-02 04:04:30',NULL),
	(3,'Clinic Visit','2021-07-02 04:04:58','2021-07-02 04:05:36'),
	(4,'Via Referring Physician','2021-07-02 04:05:21','2021-07-02 04:05:55'),
	(5,'Other','2021-07-02 04:06:07',NULL);

/*!40000 ALTER TABLE `patient_encounter_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table patient_encounters
# ------------------------------------------------------------

DROP TABLE IF EXISTS `patient_encounters`;

CREATE TABLE `patient_encounters` (
  `encounter_id` int unsigned NOT NULL AUTO_INCREMENT,
  `encounter_type` int DEFAULT NULL,
  `provider_identifier` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mrn` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by_userid` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`encounter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table patients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `patients`;

CREATE TABLE `patients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mrn` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icd10codes` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medications` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surgical_history` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medical_history` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medications_text` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `sex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_phone_country` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_mobile_phone_country` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allergies` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_mobile_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_1` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_2` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_notes` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `marital_status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facility_id` int DEFAULT NULL,
  `appt_reminders` tinyint(1) NOT NULL DEFAULT '0',
  `reports_notification` tinyint(1) NOT NULL DEFAULT '0',
  `send_reports` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mrn` (`mrn`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;

INSERT INTO `patients` (`id`, `mrn`, `last`, `first`, `mname`, `email`, `alt_email`, `alias`, `icd10codes`, `medications`, `surgical_history`, `medical_history`, `medications_text`, `birth_date`, `sex`, `mobile_phone_country`, `mobile_phone`, `alt_mobile_phone_country`, `allergies`, `alt_mobile_phone`, `address_1`, `address_2`, `city`, `state`, `country`, `postal`, `patient_notes`, `uuid`, `date_created`, `marital_status`, `facility_id`, `appt_reminders`, `reports_notification`, `send_reports`, `created_at`, `updated_at`)
VALUES
	(1,'0001','Patient','Test',NULL,'patient@orthanc.test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-07-07 23:06:59',NULL,NULL,0,0,0,'2021-07-07 23:04:36','2021-07-07 23:06:59');

/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table payments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mrn` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_accession` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ins_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` tinyint DEFAULT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '0 is patient, 1 is insurance, etc.',
  `coded_exam` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ALTER TABLE payments AUTO_INCREMENT = 1';



# Dump of table provider_licenses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `provider_licenses`;

CREATE TABLE `provider_licenses` (
  `license_id` int unsigned NOT NULL AUTO_INCREMENT,
  `license_provider_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_provider_identifier` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_state` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_country` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`license_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table provider_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `provider_types`;

CREATE TABLE `provider_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `degree` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `provider_types` WRITE;
/*!40000 ALTER TABLE `provider_types` DISABLE KEYS */;

INSERT INTO `provider_types` (`id`, `description`, `degree`, `prefix`)
VALUES
	(1,'Physician','M.D.','Dr.'),
	(2,'Physician','M.D., Ph.D','Dr.'),
	(3,'Physician','M.B.B.S, M.D.','Dr.'),
	(4,'Psychologist','Ph.D.','Dr.'),
	(5,'Chiropractor',NULL,'Dr.'),
	(6,'Dentist','DDS','Dr.'),
	(7,'PA',NULL,NULL),
	(8,'NP',NULL,NULL);

/*!40000 ALTER TABLE `provider_types` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table referring_physician
# ------------------------------------------------------------

DROP TABLE IF EXISTS `referring_physician`;

CREATE TABLE `referring_physician` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_phone_country` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_mobile_phone_country` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_mobile_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialty` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialtytext` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer_npi` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `main_office_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_suffix` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxonomy` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dea_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reports_notification` tinyint(1) NOT NULL DEFAULT '0',
  `send_reports` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `referring_physician` WRITE;
/*!40000 ALTER TABLE `referring_physician` DISABLE KEYS */;

INSERT INTO `referring_physician` (`id`, `identifier`, `fname`, `lname`, `mname`, `mobile_phone_country`, `mobile_phone`, `alt_mobile_phone_country`, `alt_mobile_phone`, `email`, `specialty`, `specialtytext`, `referrer_npi`, `address1`, `address2`, `city`, `state`, `postal`, `country`, `main_office_name`, `provider_type`, `provider_suffix`, `taxonomy`, `dea_number`, `tax_id`, `notes`, `reports_notification`, `send_reports`)
VALUES
	(1,'0001','Test','Doctor','','','','','','doctor@orthanc.test','30',NULL,'','','','','','','','','1',NULL,'364S00000X','DEA','TAXID','test',1,1);

/*!40000 ALTER TABLE `referring_physician` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table reminders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reminders`;

CREATE TABLE `reminders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `patientid` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referring_physician_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_address` int DEFAULT NULL,
  `appointment_id` int DEFAULT NULL,
  `report_id_notifify` int DEFAULT NULL,
  `report_id` int DEFAULT NULL,
  `accession_number` int DEFAULT NULL,
  `email_sent` tinyint(1) DEFAULT NULL,
  `sent_when` datetime DEFAULT NULL,
  `errors` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table report_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_templates`;

CREATE TABLE `report_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `modality` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `radreport_id` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body_part` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subspecialty` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `indication` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `markup_html` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `markup_xml` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `markup_xslt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `radlex_designator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='SET @newid=0;\nUPDATE report_templates SET id=(@newid:=@newid+1) ORDER BY id;';

LOCK TABLES `report_templates` WRITE;
/*!40000 ALTER TABLE `report_templates` DISABLE KEYS */;

INSERT INTO `report_templates` (`id`, `modality`, `type`, `active`, `radreport_id`, `url`, `body_part`, `subspecialty`, `indication`, `description`, `markup_html`, `markup_xml`, `markup_xslt`, `radlex_designator`)
VALUES
	(1,'ALL','html',1,'0000001','http://www.radreport.org/template/0000001','ALL','ALL','','Generic Report','<section data-section-name=\"Procedure\">\n<header>PROCEDURE</header>\n<p>\n<textarea name=\"Procedure\"></textarea>\n</p>\n</section>\n<section data-section-name=\"Technique\">\n	<header class=\"level1\">\n		Technique \n	</header>\n	<p>\n		<div data-technique></div>\n	</p>\n	<header class=\"level1\">\n		Contrast \n	</header>\n	<p>\n		<select id=\"contrast\">\n			<option value=\"None\">None</option>\n			<option value=\"MultiHance\">MultiHance</option>\n		</select>\n	</p>\n	<p>\n		<textarea data-contrast></textarea>\n	</p>\n</section>\n<section data-section-name=\"Clinical information\">\n<header>CLINICAL INFORMATION</header>\n<p>\n<textarea id=\"clinical_information\"></textarea>\n</p>\n</section>\n<section data-section-name=\"Comparison\">\n<header>COMPARISON</header>\n<p>\n<textarea name=\"Comparison\">None. </textarea>\n</p>\n</section>\n<section data-section-name=\"Findings\">\n<header>FINDINGS</header>\n<p>\n<textarea name=\"Findings\"></textarea>\n</p>\n</section>\n<section data-section-name=\"Impression\">\n<header>IMPRESSION</header>\n<p>\n<textarea name=\"Impression\">1.  </textarea>\n</p>\n</section>',NULL,NULL,'2.16.840.1.113883.6.256'),
	(2,'ALL','html',0,'0000004','http://www.radreport.org/template/0000004','brain','Neuroradiology','','CT Brain','<section data-section-name=\"Procedure\">\n<header>CT BRAIN</header>\n</section>\n<section data-section-name=\"Technique\">\n	<header class=\"level1\">\n		Technique \n	</header>\n	<p>\n		<textarea data-technique></textarea>\n	</p>\n	<header class=\"level1\">\n		Contrast \n	</header>\n	<p>\n		<select id=\"contrast\">\n			<option value=\"None\">None</option>\n			<option value=\"MultiHance\">MultiHance</option>\n		</select>\n	</p>\n	<p>\n		<textarea data-contrast></textarea>\n	</p>\n</section>\n<section data-section-name=\"Clinical information\">\n<header>CLINICAL INFORMATION</header>\n<p>\n<textarea name=\"Clinical information\"> </textarea>\n</p>\n</section>\n<section data-section-name=\"Comparison\">\n<header>COMPARISON</header>\n<p>\n<textarea name=\"Comparison\">None. </textarea>\n</p>\n</section>\n<section data-section-name=\"Findings\">\n<header>FINDINGS</header>\n<p>\n<label>Extra-axial spaces:</label>\n<input name=\"Extra-axial spaces\" value=\"Normal. \">\n</p>\n<p>\n<label>Intracranial hemorrhage:</label>\n<input name=\"Intracranial hemorrhage\" value=\"None.\">\n</p>\n<p>\n<label>Ventricular system:</label>\n<input name=\"Ventricular system\" value=\"Normal for age.\">\n</p>\n<p>\n<label>Basal cisterns:</label>\n<input name=\"Basal cisterns\" value=\"Normal.\">\n</p>\n<p>\n<label>Cerebral parenchyma:</label>\n<input name=\"Cerebral parenchyma\" value=\"Normal. \">\n</p>\n<p>\n<label>Midline shift:</label>\n<input name=\"Midline shift\" value=\"None. \">\n</p>\n<p>\n<label>Cerebellum:</label>\n<input name=\"Cerebellum\" value=\"Normal. \">\n</p>\n<p>\n<label>Brainstem</label>\n<input name=\"Brainstem\" value=\"Normal.\">\n</p>\n<p>\n<label>Calvarium</label>\n<input name=\"Calvarium\" value=\"Normal. \">\n</p>\n<p>\n<label>Vascular system:</label>\n<input name=\"Vascular system\" value=\"Normal. \">\n</p>\n<p>\n<label>Paranasal sinuses and mastoid air cells:</label>\n<input name=\"Paranasal sinuses\" value=\"Clear. \">\n</p>\n<p>\n<label>Visualized orbits:</label>\n<input name=\"Visualized orbits\" value=\"Normal. \">\n</p>\n<p>\n<label>Visualized upper cervical spine:</label>\n<input name=\"Visualized upper cervical spine\" value=\"Normal.\">\n</p>\n<p>\n<label>Sella:</label>\n<input name=\"Sella\" value=\"Normal. \">\n</p>\n<p>\n<label>Skull base:</label>\n<input name=\"Skull base\" value=\"Normal.\">\n</p>\n</section>\n<section data-section-name=\"Impression\">\n<header>IMPRESSION</header>\n<p>\n<textarea name=\"Impression\">Normal. </textarea>\n</p>\n</section>',NULL,NULL,'2.16.840.1.113883.6.256'),
	(3,'ALL','html',0,'0000005','http://www.radreport.org/template/0000005','brain','Neuroradiology','','CT Brain Perfusion','<section data-section-name=\"Procedure\">\n<header>CT BRAIN PERFUSION STUDY</header>\n<p>\n<textarea name=\"Procedure\"> </textarea>\n</p>\n<p>\n<label>Number of detectors:</label>\n<input name=\"Number of detectors\" value=\"\"> \n</p>\n<p>\n<label>Number of phases:</label>\n<input name=\"Number of phases\" value=\"\"> \n</p>\n<p>\n<label>Number of locations:</label>\n<input name=\"Number of locations\" value=\"\"> \n</p>\n<p>\n<label>Slice thickness:</label>\n<input name=\"Slice thickness\" value=\"\"> mm\n</p>\n<p>\n<label>Number of repetitions:</label>\n<input name=\"Number of repetitions\" value=\"\"> \n</p>\n<p>\n<label>Contrast media:</label>\n<input name=\"Contrast media\" value=\"\">\n</p>\n<p>\n<label>Workstation</label>\n<select name=\"Workstation\">\n<option id=\"\" name=\"Vital Images\" value=\"Vital Images\">Vital Images</option>\n<option id=\"\" name=\"Terrarecon\" value=\"Terrarecon\">Terrarecon</option>\n<option id=\"\" name=\"GE Advantage\" value=\"GE Advantage\">GE Advantage</option>\n<option id=\"\" name=\"Leonardo\" value=\"Leonardo\">Leonardo</option>\n<option id=\"\" name=\"Philips\" value=\"Philips\">Philips</option>\n</select>\n<input name=\"Workstation_text\" value=\"\">\n</p>\n</section>\n<section data-section-name=\"Clinical information\">\n<header>CLINICAL INFORMATION</header>\n<p>\n<textarea name=\"Clinical information\">Cerebral ischemia. </textarea>\n</p>\n</section>\n<section data-section-name=\"Comparison\">\n<header>COMPARISON</header>\n<p>\n<textarea name=\"Comparison\">None. </textarea>\n</p>\n</section>\n<section data-section-name=\"Findings\">\n<header>FINDINGS</header>\n<section data-section-name=\"Technical parameters\">\n<header>TECHNICAL PARAMETERS</header>\n<p>\n<label>Image quality:</label>\n<input name=\"Image quality\" value=\"Satisfactory. \">\n</p>\n<p>\n<label>Arterial input function ROI:</label>\n<select name=\"Arterial input function ROI\">\n<option id=\"\" name=\"ACA\" value=\"ACA\">ACA</option>\n<option id=\"\" name=\"MCA\" value=\"MCA\">MCA</option>\n<option id=\"\" name=\"ICA\" value=\"ICA\">ICA</option>\n</select>\n</p>\n<p>\n<label>Venous outflow function ROI:</label>\n<select name=\"Venous outflow function ROI\">\n<option id=\"\" name=\"Torcula\" value=\"Torcula\">Torcula</option>\n<option id=\"\" name=\"Straight sinus\" value=\"Straight sinus\">Straight sinus</option>\n<option id=\"\" name=\"ICV\" value=\"ICV\">ICV</option>\n<option id=\"\" name=\"Sagittal sinus\" value=\"Sagittal sinus\">Sagittal sinus</option>\n</select>\n</p>\n<p>\n<label>Site of normal perfusion:</label>\n<select name=\"Site of normal perfusion\">\n<option id=\"\" name=\"Right anterior territory\" value=\"Right anterior territory\">Right anterior territory</option>\n<option id=\"\" name=\"Left anterior territory\" value=\"Left anterior territory\">Left anterior territory</option>\n<option id=\"\" name=\"Posterior territory\" value=\"Posterior territory\">Posterior territory</option>\n</select>\n</p>\n<p>\n<label>Parametric maps</label>\n<input name=\"Parametric maps\" value=\"\">\n</p>\n</section>\n\n<section data-section-name=\"Parametric maps\">\n<header>PARAMETRIC MAPS, CTP CHARACTERISTICS {FOR AREA OF INTEREST}:</header>\n<p>\n<label>Cerebral blood flow (CBF):</label>\n<select name=\"CBF\">\n<option id=\"\" name=\"Symmetric\" value=\"Symmetric\" selected=\"\">Symmetric</option>\n<option id=\"\" name=\"Increased\" value=\"Increased\">Increased</option>\n<option id=\"\" name=\"Decreased\" value=\"Decreased\">Decreased</option>\n</select>\n</p>\n<p>\n<label>Mean transit time (MTT):</label>\n<select name=\"MTT\">\n<option id=\"\" name=\"Symmetric\" value=\"Symmetric\" selected=\"\">Symmetric</option>\n<option id=\"\" name=\"Increased\" value=\"Increased\">Increased</option>\n<option id=\"\" name=\"Decreased\" value=\"Decreased\">Decreased</option>\n</select>\n</p>\n<p>\n<label>Cerebral blood volume (CBV):</label>\n<select name=\"CBV\">\n<option id=\"\" name=\"Symmetric\" value=\"Symmetric\" selected=\"\">Symmetric</option>\n<option id=\"\" name=\"Increased\" value=\"Increased\">Increased</option>\n<option id=\"\" name=\"Decreased\" value=\"Decreased\">Decreased</option>\n</select>\n</p>\n<p>\n<label>Vascular territory involved:</label>\n<select name=\"Vascular territory involved\">\n<option id=\"\" name=\"None\" value=\"None\">None</option>\n<option id=\"\" name=\"ACA\" value=\"ACA\">ACA</option>\n<option id=\"\" name=\"MCA\" value=\"MCA\">MCA</option>\n<option id=\"\" name=\"PCA\" value=\"PCA\">PCA</option>\n</select>\n</p><p>\n<label>Tissue involved:</label>\n<input name=\"Tissue involved\" value=\"None\">\n</p>\n<p>\n<label>Percent of normal vascular territory involved:</label>\n<input name=\"normal vascular territory involved\" value=\"\">\n</p>\n<p>\n<label>Percent of abnormality representing ischemic core {CBV &lt; 2 ml/100gm}:</label>\n<input name=\"abnormality representing ischemic core\" value=\"\">\n</p>\n<p>\n<label>Percent of abnormality representing ischemic penumbra {MTT &gt; 150% normal}:</label>\n<input name=\"abnormality representing ischemic penumbra\" value=\"\">\n</p>\n<p>\n<label>Ischemic core or penumbra ratio:</label>\n<input name=\"Ischemic core or penumbra ratio\" value=\"\">\n</p>\n</section>\n</section>\n<section data-section-name=\"Impression\">\n<header>IMPRESSION</header>\n<p>\n<select name=\"Impression\">\n<option id=\"\" name=\"Symmetric perfusion indices\" value=\"Symmetric perfusion indices\">Symmetric perfusion indices</option>\n<option id=\"\" name=\"Compensated oligemia\" value=\"Compensated oligemia\">Compensated oligemia</option>\n<option id=\"\" name=\"Non-compensated oligemia\" value=\"Non-compensated oligemia\">Non-compensated oligemia</option>\n<option id=\"\" name=\"Central infarct\" value=\"Central infarct\">Central infarct</option>\n</select>\n</p>\n<p>\n<textarea name=\"Impression text\">1.   </textarea>\n</p>\n</section>',NULL,NULL,'2.16.840.1.113883.6.256'),
	(4,'ALL','html',0,'0000006','http://www.radreport.org/template/0000006','appendix','ALL','','CT Appendicitis','<section data-section-name=\"Procedure\">\n<header>CT APPENDICITIS</header>\n<p>\n<textarea name=\"Procedure\"> </textarea>\n</p>\n<p>\n<label>IV contrast:</label>\n<input name=\"T6_3\" value=\"None.\">\n</p>\n<p>\n<label>Oral contrast:</label>\n<input name=\"T6_5\" value=\"None.\">\n</p>\n</section>\n<section data-section-name=\"Clinical information\">\n<header>CLINICAL INFORMATION</header>\n<p>\n<textarea name=\"Clinical information\"> </textarea>\n</p>\n</section>\n<section data-section-name=\"Comparison\">\n<header>COMPARISON</header>\n<p>\n<textarea name=\"Comparison\">None. </textarea>\n</p>\n</section>\n<section data-section-name=\"Findings\">\n<header>FINDINGS</header>\n<section data-section-name=\"Appendix\">\n<header>APPENDIX</header>\n<p>\n<label>Diameter:</label>\n<input name=\"T6_17\" value=\"\"> mm\n</p>\n<p>\n<label>Wall thickness:</label>\n<input name=\"T6_18\" value=\"\"> mm\n</p>\n<p>\n<label>Peri-appendiceal stranding:</label>\n<input name=\"T6_19\" value=\"None.\">\n</p>\n<p>\n<label>Peri-appendiceal fluid:</label>\n<input name=\"T6_21\" value=\"None.\">\n</p>\n<p>\n<label>Peri-appendiceal abscess:</label>\n<input name=\"T6_23\" value=\"None.\">\n</p>\n<p>\n<label>Adjacent bowel wall thickening:</label>\n<input name=\"T6_25\" value=\"None.\">\n</p>\n<p>\n<label>Appendicolith:</label>\n<input name=\"T6_27\" value=\"None.\">\n</p>\n</section>\n<section data-section-name=\"Other findings\">\n<header>OTHER FINDINGS</header>\n<p>\n<label>Mesenteric lymph node enlargement:</label>\n<input name=\"T6_29\" value=\"None.\">\n</p>\n<p>\n<label>Small bowel and colon:</label>\n<input name=\"T6_31\" value=\"Normal in caliber without appreciable wall thickening.\">\n</p>\n<p>\n<label>Gallbladder and biliary system:</label>\n<input name=\"T6_33\" value=\"No evidence of gallstones or biliary ductal dilatation.\">\n</p>\n<p>\n<label>Spleen:</label>\n<input name=\"T6_39\" value=\"Normal.\">\n</p>\n<p>\n<label>Pancreas:</label>\n<input name=\"T6_41\" value=\"Normal.\">\n</p>\n<p>\n<label>Adrenals:</label>\n<input name=\"T6_43\" value=\"Normal.\">\n</p>\n<p>\n<label>Kidneys and ureters:</label>\n<input name=\"T6_45\" value=\"Normal.\">\n</p>\n<p>\n<label>Abdominal aorta and major branches:</label>\n<input name=\"T6_47\" value=\"Normal.\">\n</p>\n<p>\n<label>Adenopathy:</label>\n<input name=\"T6_49\" value=\"None.\">\n</p>\n<p>\n<label>Lung bases:</label>\n<input name=\"T6_53\" value=\"Normal.\">\n</p>\n<p>\n<label>Reproductive organs:</label>\n<input name=\"T6_55\" value=\"Normal.\">\n</p>\n<p>\n<label>Bones:</label>\n<input name=\"T6_57\" value=\"Normal.\">\n</p>\n</section>\n</section>\n<section data-section-name=\"Impression\">\n<header>IMPRESSION</header>\n<textarea name=\"Impression\"> </textarea>\n</section>','',NULL,'2.16.840.1.113883.6.256'),
	(5,'ALL','html',0,'0000010','http://www.radreport.org/template/0000010','intestine','Body Imaging','','CT Enterography','<section data-section-name=\"Procedure\">\n<header class=\"level1\">CT Enterography</header>\n<p>\n<label for=\"T10_3\">IV contrast:</label>\n<input type=\"text\" id=\"T10_3\" name=\"IV contrast\" value=\"None. \"/>\n</p>\n<p>\n<label for=\"T10_5\">Oral contrast:</label>\n<input type=\"text\" id=\"T10_5\" name=\"Oral contrast\" value=\"None. \"/>\n</p>\n</section>\n<section data-section-name=\"Clinical information\">\n<header class=\"level1\">Clinical information</header>\n<p>\n<textarea id=\"T10_7\" name=\"Clinical information\">Abdominal pain. </textarea>\n</p>\n</section>\n<section data-section-name=\"Comparison\">\n<header class=\"level1\">Comparison</header>\n<p>\n<textarea id=\"T10_11\" name=\"Comparison\">None. </textarea>\n</p>\n</section>\n<section data-section-name=\"Findings\">\n<header class=\"level1\">Findings</header>\n<section data-section-name=\"Technical quality\">\n<header class=\"level2\">Technical quality</header>\n<p>\n<label for=\"T10_14\">Image quality:</label>\n<input type=\"text\" id=\"T10_14\" name=\"Image quality\" value=\"Satisfactory. \"/>\n</p>\n<p>\n<label for=\"T10_17\">Small bowel distension:</label>\n<input type=\"text\" id=\"T10_17\" name=\"Small bowel distension\" value=\"Adequate. \"/>\n</p>\n</section>\n<section data-section-name=\"Bowel\">\n<header class=\"level2\">Bowel</header>\n<p>\n<label for=\"T10_21\">Peristalsis:</label>\n<input type=\"text\" id=\"T10_21\" name=\"Peristalsis\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T10_24\">Bowel wall thickening:</label>\n<input type=\"text\" id=\"T10_24\" name=\"Bowel wall thickening\" value=\"Absent. \"/>\n</p>\n<p>\n<label for=\"T10_27\">Skip lesions:</label>\n<input type=\"text\" id=\"T10_27\" name=\"Skip lesions\" value=\"None. \"/>\n</p>\n<p>\n<label for=\"T10_30\">Vascularity:</label>\n<input type=\"text\" id=\"T10_30\" name=\"Vascularity\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T10_32\">Enhancement:</label>\n<input type=\"text\" id=\"T10_32\" name=\"Enhancement\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T10_38\">Fistula:</label>\n<input type=\"text\" id=\"T10_38\" name=\"Fistula\" value=\"None. \"/>\n</p>\n<p>\n<label for=\"T10_41\">Abscess:</label>\n<input type=\"text\" id=\"T10_41\" name=\"Abscess\" value=\"None. \"/>\n</p>\n</section>\n<section data-section-name=\"Other findings\">\n<header class=\"level2\">Other findings</header>\n<p>\n<label for=\"T10_44\">Lymph nodes:</label>\n<input type=\"text\" id=\"T10_44\" name=\"Lymph nodes\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T10_47\">Stomach:</label>\n<input type=\"text\" id=\"T10_47\" name=\"Stomach\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T10_49\">Duodenum:</label>\n<input type=\"text\" id=\"T10_49\" name=\"Duodenum\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T10_51\">Colon:</label>\n<input type=\"text\" id=\"T10_51\" name=\"Colon\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T10_53\">Liver:</label>\n<input type=\"text\" id=\"T10_53\" name=\"Liver\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T10_55\">Gallbladder:</label>\n<input type=\"text\" id=\"T10_55\" name=\"Gallbladder\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T10_57\">Pancreas:</label>\n<input type=\"text\" id=\"T10_57\" name=\"Pancreas\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T10_59\">Spleen:</label>\n<input type=\"text\" id=\"T10_59\" name=\"Spleen\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T10_61\">Adrenals glands:</label>\n<input type=\"text\" id=\"T10_61\" name=\"Adrenals glands\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T10_63\">Kidneys:</label>\n<input type=\"text\" id=\"T10_63\" name=\"Kidneys\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T10_65\">Lung bases:</label>\n<input type=\"text\" id=\"T10_65\" name=\"Lung bases\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T10_67\">Bones:</label>\n<input type=\"text\" id=\"T10_67\" name=\"Bones\" value=\"Normal. \"/>\n</p>\n</section>\n</section>\n<section data-section-name=\"Impression\">\n<header class=\"level1\">Impression</header>\n<p>\n<textarea id=\"T10_70\" name=\"Impression\">Normal CT enterography. </textarea>\n</p>\n</section>',NULL,NULL,'2.16.840.1.113883.6.256'),
	(6,'ALL','html',0,'0000011','http://www.radreport.org/template/0000011','liver','Body Imaging','','CT Liver Surveillance','<section data-section-name=\"Procedure\">\n<header class=\"level1\">CT Liver Surveillance</header>\n<p>\n<label for=\"T11_4\">IV contrast: </label>\n<input type=\"text\" id=\"T11_4\" name=\"IV contrast\" value=\"\"/>\n</p>\n</section>\n<section data-section-name=\"Clinical information\">\n<header class=\"level1\">Clinical information</header>\n<p>\n<textarea id=\"T11_8\" name=\"Clinical information\">Surveillance for hepatocellular carcinoma. </textarea>\n</p>\n</section>\n<section data-section-name=\"Comparison\">\n<header class=\"level1\">Comparison</header>\n<p>\n<textarea id=\"T11_13\" name=\"Comparison\">None. </textarea>\n</p>\n</section>\n<section data-section-name=\"Findings\">\n<header class=\"level1\">Findings</header>\n<p>\n<label for=\"T11_24\">Liver morphology: </label>\n<input type=\"text\" id=\"T11_24\" name=\"Liver morphology\" value=\"Normal. No evidence of cirrhosis, nodular regeneration, or lobar or segmental atrophy. \"/>\n</p>\n<p>\n<label for=\"T11_40\">Liver lesions: </label>\n<input type=\"text\" id=\"T11_40\" name=\"Liver lesions\" value=\"None. \"/>\n</p>\n\n<p>\n<label for=\"T11_42\">Portal hypertension: </label>\n<input type=\"text\" id=\"T11_42\" name=\"Portal hypertension\" value=\"\"/>\n</p>\n<p>\n<label for=\"T11_43\">Spleen: </label>\n<input type=\"text\" id=\"T11_43\" name=\"Spleen\" value=\"\"/>\n</p>\n<p>\n<label for=\"T11_44\">Spleen size: </label>\n<input type=\"number\" id=\"T11_44\" name=\"Spleen size\" data-field-units=\"cm\" min=\"\" max=\"\"/> <label for=\"T11_44\">cm</label>\n</p>\n<p>\n<label for=\"T11_53\">Ascites: </label>\n<input type=\"text\" id=\"T11_53\" name=\"Ascites\" value=\"None. \"/>\n</p>\n<p>\n<label for=\"T11_59\">Collateral veins: </label>\n<input type=\"text\" id=\"T11_59\" name=\"Collateral veins\" value=\"None. \"/>\n</p>\n<p>\n<label for=\"T11_64\">Spontaneous shunt: </label>\n<input type=\"text\" id=\"T11_64\" name=\"Spontaneous shunt\" value=\"None. \"/>\n</p>\n<p>\n<label for=\"T11_109\">Gallbladder:</label>\n<input type=\"text\" id=\"T11_109\" name=\"Gallbladder\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T11_111\">Biliary system:</label>\n<input type=\"text\" id=\"T11_111\" name=\"Biliary system\" value=\"Normal.\"/>\n</p>\n<p>\n<label for=\"T11_113\">Pancreas:</label>\n<input type=\"text\" id=\"T11_113\" name=\"Pancreas\" value=\"Normal\"/>\n</p>\n<p>\n<label for=\"T11_115\">Kidneys</label>\n<input type=\"text\" id=\"T11_115\" name=\"Kidneys\" value=\"Normal.\"/>\n</p>\n<p>\n<label for=\"T11_117\">Urinary tract:</label>\n<input type=\"text\" id=\"T11_117\" name=\"Urinary tract\" value=\"Normal.\"/>\n</p>\n<p>\n<label for=\"T11_128\">Adrenal glands:</label>\n<input type=\"text\" id=\"T11_128\" name=\"Adrenal glands\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T11_130\">GI tract:</label>\n<input type=\"text\" id=\"T11_130\" name=\"GI tract\" value=\"Normal.\"/>\n</p>\n<p>\n<label for=\"T11_132\">Peritoneum or retroperitoneum:</label>\n<input type=\"text\" id=\"T11_132\" name=\"Peritoneum or retroperitoneum\" value=\"Normal.\"/>\n</p>\n<p>\n<label for=\"T11_134\">Pelvic structures:</label>\n<input type=\"text\" id=\"T11_134\" name=\"Pelvic structures\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T11_136\">Bladder:</label>\n<input type=\"text\" id=\"T11_136\" name=\"Bladder\" value=\"Normal.\"/>\n</p>\n<p>\n<label for=\"T11_138\">Pelvic structures:</label>\n<input type=\"text\" id=\"T11_138\" name=\"Pelvic structures\" value=\"Normal.\"/>\n</p>\n<p>\n<label for=\"T11_153\">Musculoskeletal:</label>\n<input type=\"text\" id=\"T11_153\" name=\"Musculoskeletal\" value=\"Normal/\"/>\n</p>\n<p>\n<label for=\"T11_155\">Visualized lower thorax:</label>\n<input type=\"text\" id=\"T11_155\" name=\"Visualized lower thorax\" value=\"Normal.\"/>\n</p>\n</section>\n<section data-section-name=\"Impression\">\n<header class=\"level1\">Impression</header>\n<p>\n<textarea id=\"T11_272\" name=\"Impression\">1.  </textarea>\n</p>\n<p>\n<label for=\"T11_279\">Recommendation:</label>\n<input type=\"text\" id=\"T11_279\" name=\"Recommendation\" value=\"\"/>\n</p>\n</section>',NULL,NULL,'2.16.840.1.113883.6.256'),
	(7,'ALL','html',0,'0000012','http://www.radreport.org/template/0000012','lung','Thoracic Radiology','','CT Lung Nodule','<section data-section-name=\"Procedure\">\n<header class=\"level1\">CT Lung Nodule</header>\n<p>\n<label for=\"T12_3\">IV Contrast:</label>\n<input type=\"text\" id=\"T12_3\" name=\"IV Contrast\" value=\"None. \"/>\n</p>\n<p>\n<label for=\"T12_5\">Slice thickness:</label>\n<input type=\"number\" id=\"T12_5\" name=\"Slice thickness\" data-field-units=\"mm\" min=\"\" max=\"\"/> <label for=\"T12_5\">mm</label>\n</p>\n</section>\n<section data-section-name=\"Clinical information\">\n<header class=\"level1\">Clinical information</header>\n<p>\n<textarea id=\"T12_100\" name=\"Clinical information\">Follow up lung nodule(s).</textarea>\n</p>\n<p>\n<label for=\"T12_8\">High risk:</label>\n<select id=\"T12_8\" name=\"High risk\">\n<option id=\"T12_8_9\" name=\"Yes\" value=\"Yes\">Yes</option>\n<option id=\"T12_8_10\" name=\"No\" value=\"No\">No</option>\n</select>\n</p>\n<p>\n<label for=\"T12_11\">History of smoking:</label>\n<select id=\"T12_11\" name=\"History of smoking\">\n<option id=\"T12_11_12\" name=\"Yes\" value=\"Yes\">Yes</option>\n<option id=\"T12_11_13\" name=\"No\" value=\"No\">No</option>\n</select>\n</p>\n<p>\n<label for=\"T12_14\">History of lung cancer:</label>\n<select id=\"T12_14\" name=\"History of lung cancer\">\n<option id=\"T12_14_15\" name=\"Yes\" value=\"Yes\">Yes</option>\n<option id=\"T12_14_16\" name=\"No\" value=\"No\">No</option>\n</select>\n</p>\n</section>\n<section data-section-name=\"Comparison\">\n<header class=\"level1\">Comparison</header>\n<p>\n<textarea id=\"T12_17\" name=\"Comparison\">None. </textarea>\n</p>\n</section>\n<section data-section-name=\"Findings\">\n<header class=\"level1\">Findings</header>\n<p>\n<label for=\"T12_20\">Nodules:</label>\n<input type=\"text\" id=\"T12_20\" name=\"Nodules\" value=\"None.\"/>\n</p>\n<p>\n<label for=\"T12_48\">Airway:</label>\n<input type=\"text\" id=\"T12_48\" name=\"Airway\" value=\"Normal\"/>\n</p>\n<p>\n<label for=\"T12_50\">Pleura:</label>\n<input type=\"text\" id=\"T12_50\" name=\"Pleura\" value=\"No pleural effusion, thickening, or pneumothorax.\"/>\n</p>\n<p>\n<label for=\"T12_52\">Thoracic aorta:</label>\n<input type=\"text\" id=\"T12_52\" name=\"Thoracic aorta\" value=\"Normal\"/>\n</p>\n<p>\n<label for=\"T12_54\">Pulmonary arteries:</label>\n<input type=\"text\" id=\"T12_54\" name=\"Pulmonary arteries\" value=\"Normal\"/>\n</p>\n<p>\n<label for=\"T12_56\">Heart:</label>\n<input type=\"text\" id=\"T12_56\" name=\"Heart\" value=\"Normal\"/>\n</p>\n<p>\n<label for=\"T12_59\">Lymph nodes:</label>\n<input type=\"text\" id=\"T12_59\" name=\"Lymph nodes\" value=\"No mediastinal, hilar, or axillary adenopathy.\"/>\n</p>\n<p>\n<label for=\"T12_60\">Thoracic spine:</label>\n<input type=\"text\" id=\"T12_60\" name=\"Thoracic spine\" value=\"Normal\"/>\n</p>\n<p>\n<label for=\"T12_62\">Chest wall:</label>\n<input type=\"text\" id=\"T12_62\" name=\"Chest wall\" value=\"Normal\"/>\n</p>\n<p>\n<label for=\"T12_64\">Visualized upper abdomen:</label>\n<input type=\"text\" id=\"T12_64\" name=\"Visualized upper abdomen\" value=\"Normal\"/>\n</p>\n</section>\n<section data-section-name=\"Impression\">\n<header class=\"level1\">Impression</header>\n<p>\n<textarea id=\"T12_66\" name=\"Impression\"> </textarea>\n</p>\n\n<section data-section-name=\"Fleischner \">\n<header class=\"level1\">Fleischner Society Guidelines</header>\n<p>\nFleischner Society guidelines for follow-up and management of incidental pulmonary nodule (Radiology 2005; 237:395-400):</p>\n\n<select name=\"Nodule\">\n<option name=\"4\" value=\"4\">Nodule <= 4 mm:  LOW-RISK patient (minimal or absent history of smoking and other known risk factors):  No follow-up needed.  HIGH-RISK patient (history of smoking or other known risk factors):  Follow-up CT at 12 months; if unchanged, no further follow-up.</option>\n<option name=\"6\" value=\"6\">Nodule 5 - 6 mm:  LOW-RISK patient (minimal or absent history of smoking and other known risk factors):  Follow-up CT at 12 months; if unchanged, no further follow-up.  HIGH-RISK patient (history of smoking or other known risk factors):  Initial follow-up CT at 6-12 months, then at 18-24 months if no change.</option>\n<option name=\"8\" value=\"8\">Nodule 7 - 8 mm:  LOW-RISK patient (minimal or absent history of smoking and other known risk factors):  Initial follow-up CT at 6-12 months then at 18-24 months if no change.  HIGH-RISK patient (history of smoking or other known risk factors):  Initial follow-up CT at 3-6 months, then at 9-12 months and 24 months if no change.\n<option name=\"big\" value=\"big\">Nodule > 8 mm:  ALL patients:  Follow-up CT at around 3, 9, and 24 months, dynamic contrast-enhanced CT, PET, and/or biopsy.</option>\n</select>\n</p>\n</section>\n</section>\n</section>',NULL,NULL,'2.16.840.1.113883.6.256'),
	(8,'ALL','html',0,'0000013','http://www.radreport.org/template/0000013','neck','Neuroradiology','','CT Neck','<section data-section-name=\"Procedure\">\n<header class=\"level1\">CT Neck</header>\n<p>\n<textarea id=\"T13_2\" name=\"Procedure\"> </textarea>\n</p>\n</section>\n<section data-section-name=\"Clinical information\">\n<header class=\"level1\">Clinical information</header>\n<p>\n<textarea id=\"T13_3\" name=\"Clinical information\"> </textarea>\n</p>\n</section>\n<section data-section-name=\"Comparison\">\n<header class=\"level1\">Comparison</header>\n<p>\n<textarea id=\"T13_4\" name=\"Comparison\">None. </textarea>\n</p>\n</section>\n<section data-section-name=\"Findings\">\n<header class=\"level1\">Findings</header>\n<p>\n<label for=\"T13_7\">Orbits, paranasal sinuses, and skull base: </label>\n<input type=\"text\" id=\"T13_7\" name=\"Orbits paranasal sinuses skull base\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T13_13\">Nasopharynx: </label>\n<input type=\"text\" id=\"T13_13\" name=\"Nasopharynx\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T13_15\">Suprahyoid neck: </label>\n<input type=\"text\" id=\"T13_15\" name=\"Suprahyoid neck\" value=\"Normal oropharynx, oral cavity, parapharyngeal space, and retropharyngeal space. \"/>\n</p>\n<p>\n<label for=\"T13_25\">Infrahyoid neck: </label>\n<input type=\"text\" id=\"T13_25\" name=\"Infrahyoid neck\" value=\"Normal larynx, hypopharynx, and supraglottis. \"/>\n</p>\n<p>\n<label for=\"T13_33\">Thyroid: </label>\n<input type=\"text\" id=\"T13_33\" name=\"Thyroid\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T13_35\">Thoracic inlet: </label>\n<input type=\"text\" id=\"T13_35\" name=\"Thoracic inlet\" value=\"Normal lung apices and brachial plexus.\"/>\n</p>\n<p>\n<label for=\"T13_41\">Lymph nodes</label>\n<input type=\"text\" id=\"T13_41\" name=\"Lymph nodes\" value=\"Normal. No lymphadenopathy. \"/>\n</p>\n<p>\n<label for=\"T13_43\">Vascular structures: </label>\n<input type=\"text\" id=\"T13_43\" name=\"Vascular structures\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T13_44\">Other findings: </label>\n<input type=\"text\" id=\"T13_44\" name=\"Other findings\" value=\"None. \"/>\n</p>\n</section>\n<section data-section-name=\"Impression\">\n<header class=\"level1\">Impression</header>\n<p>\n<textarea id=\"T13_45\" name=\"Impression\">Normal examination. </textarea>\n</p>\n</section>',NULL,NULL,'2.16.840.1.113883.6.256'),
	(9,'ALL','html',0,'0000116','http://www.radreport.org/template/0000116','lungs','Thoracic Radiology','','CT Chest Pulmonary Embolism','<section data-section-name=\"Procedure\">\n<header class=\"level1\">CT Chest Pulmonary Embolism</header>\n<p>\n<label for=\"T116_3\">Intravenous contrast (agent and volume): </label>\n<input type=\"text\" id=\"T116_3\" name=\"Intravenous contrast\" value=\"\"/>\n</p>\n</section>\n<section data-section-name=\"Clinical information\">\n<header class=\"level1\">Clinical information</header>\n<p>\n<textarea id=\"T116_5\" name=\"Clinical information\"></textarea>\n</p>\n</section>\n<section data-section-name=\"Comparison\">\n<header class=\"level1\">Comparison</header>\n<p>\n<textarea id=\"T116_10\" name=\"Comparison\">None. </textarea>\n</p>\n</section>\n<section data-section-name=\"Findings\">\n<header class=\"level1\">Findings</header>\n<p>\n<label for=\"T116_13\">Diagnostic quality: </label>\n<select id=\"T116_13\" name=\"Diagnostic quality\">\n<option id=\"T116_14\" name=\"Adequate\" value=\"Adequate\">Adequate</option>\n<option id=\"T116_15\" name=\"Suboptimal\" value=\"Suboptimal\">Suboptimal</option>\n<option id=\"T116_16\" name=\"Nondiagnostic\" value=\"Nondiagnostic\">Nondiagnostic</option>\n</select>\n</p>\n<p>\n<label for=\"T116_18\">Pulmonary embolism:</label>\n<input type=\"text\" id=\"T116_18\" name=\"Pulmonary embolism\" value=\"None. \"/>\n</p>\n<p>\n<label for=\"T116_101\">Right heart strain:</label>\n<input type=\"text\" id=\"T116_101\" name=\"Right heart strain\" value=\"None. \"/>\n</p>\n<p>\n<label for=\"T116_100\">Pulmonary arteries:</label>\n<input type=\"text\" id=\"T116_100\" name=\"Pulmonary arteries\" value=\"Normal in caliber. \"/>\n</p>\n<p>\n<label for=\"T116_21\">Lung parenchyma: </label>\n<input type=\"text\" id=\"T116_21\" name=\"Lung parenchyma\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T116_23\">Pleural effusion: </label>\n<input type=\"text\" id=\"T116_23\" name=\"Pleural effusion\" value=\"None. \"/>\n</p>\n<p>\n<label for=\"T116_25\">Central airways: </label>\n<input type=\"text\" id=\"T116_25\" name=\"Central airways\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T116_27\">Adenopathy: </label>\n<input type=\"text\" id=\"T116_27\" name=\"Adenopathy\" value=\"None. \"/>\n</p>\n<p>\n<label for=\"T116_29\">Heart and great vessels: </label>\n<input type=\"text\" id=\"T116_29\" name=\"Heart\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T116_31\">Upper abdomen: </label>\n<input type=\"text\" id=\"T116_31\" name=\"Upper abdomen\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T116_33\">Bones: </label>\n<input type=\"text\" id=\"T116_33\" name=\"Bones\" value=\"Normal. \"/>\n</p>\n</section>\n<section data-section-name=\"Impression\">\n<header class=\"level1\">Impression</header>\n<p>\n<textarea id=\"T116_35\" name=\"Impression\">No acute or chronic pulmonary embolism. </textarea>\n</p>\n</section>',NULL,NULL,'2.16.840.1.113883.6.256'),
	(10,'ALL','html',1,'0000045WO','http://www.radreport.org/template/0000045','brain','Neuroradiology','','MRI Brain without','<section data-section-name=\"Procedure\">\n<header class=\"level1\">MR Brain without contrast</header>\n</section>\n\n<section data-section-name=\"Technique\">\n	<header class=\"level1\">\n		Technique \n	</header>\n	<p>\n		<div data-technique></div>\n	</p>\n</section>\n\n<section data-section-name=\"Clinical information\">\n<header class=\"level1\">Clinical information</header>\n<p>\n<textarea id=\"clinical_information\"></textarea>\n</p>\n</section>\n<section data-section-name=\"Comparison\">\n<header class=\"level1\">Comparison</header>\n<p>\n<textarea id=\"T45_17\" name=\"Comparison\">None. </textarea>\n</p>\n</section>\n<section data-section-name=\"Findings\">\n<header class=\"level1\">Findings</header>\n<p>\n<label for=\"T45_22\">Extra-axial spaces:</label>\n<input type=\"text\" id=\"T45_22\" name=\"Extra-axial spaces\" value=\"Normal in size and morphology for the patient\'s age.\"/>\n</p>\n<p>\n<label for=\"T45_25\">Intracranial hemorrhage: </label>\n<input type=\"text\" id=\"T45_25\" name=\"Intracranial hemorrhage\" value=\"None\"/>\n</p>\n<p>\n<label for=\"T45_32\">Ventricular system:</label>\n<input type=\"text\" id=\"T45_32\" name=\"Ventricular system\" value=\"Normal in size and morphology for the patient\'s age.\"/>\n</p>\n<p>\n<label for=\"T45_36\">Basal cisterns:</label>\n<input type=\"text\" id=\"T45_36\" name=\"Basal cisterns\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T45_40\">Cerebral parenchyma:</label>\n<input type=\"text\" id=\"T45_40\" name=\"Cerebral parenchyma\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T45_47\">Midline shift:</label>\n<input type=\"text\" id=\"T45_47\" name=\"Midline shift\" value=\"None.\"/>\n<p>\n<label for=\"T45_51\">Cerebellum:</label>\n<input type=\"text\" id=\"T45_51\" name=\"Cerebellum\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T45_53\">Brainstem:</label>\n<input type=\"text\" id=\"T45_53\" name=\"Brainstem\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T45_55\">Calvarium:</label>\n<input type=\"text\" id=\"T45_55\" name=\"Calvarium\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T45_59\">Vascular system:</label>\n<input type=\"text\" id=\"T45_59\" name=\"Vascular system\" value=\"Normal flow voids, without atheroma, occlusion, or dissection.\"/>\n</p>\n<p>\n<label for=\"T45_64\">Paranasal sinuses and mastoid air cells:</label>\n<input type=\"text\" id=\"T45_64\" name=\"Paranasal sinuses and mastoid air cells\" value=\"Clear.\"/>\n</p>\n<p>\n<label for=\"T45_67\">Visualized orbits:</label>\n<input type=\"text\" id=\"T45_67\" name=\"Visualized orbits\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T45_69\">Visualized upper cervical spine:</label>\n<input type=\"text\" id=\"T45_69\" name=\"Visualized upper cervical spine\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T45_71\">Sella:</label>\n<input type=\"text\" id=\"T45_71\" name=\"Sella\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T45_73\">Skull base:</label>\n<input type=\"text\" id=\"T45_73\" name=\"Skull base\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T45_75\">Marrow:</label>\n<input type=\"text\" id=\"T45_75\" name=\"Marrow\" value=\"Normal. \"/>\n</p>\n</section>\n<section data-section-name=\"Impression\">\n<header class=\"level1\">Impression</header>\n<p>\n<textarea id=\"T45_140\" name=\"Impression\">1.  Normal MRI Brain. </textarea>\n</p>\n</section>',NULL,NULL,'2.16.840.1.113883.6.256'),
	(11,'ALL','html',1,'0000045WC','http://www.radreport.org/template/0000045','brain','Neuroradiology','','MRI Brain with','<section data-section-name=\"Procedure\">\n<header class=\"level1\">MR Brain with Contrast</header>\n</section>\n<section data-section-name=\"Technique\">\n	<header class=\"level1\">\n		Technique \n	</header>\n	<p>\n		<div data-technique></div>\n	</p>\n	<header class=\"level1\">\n		Contrast \n	</header>\n	<p>\n		<select id=\"contrast\">\n			<option value=\"None\">None</option>\n			<option value=\"MultiHance\">MultiHance</option>\n		</select>\n	</p>\n	<p>\n		<textarea data-contrast></textarea>\n	</p>\n</section>\n<section data-section-name=\"Clinical information\">\n<header class=\"level1\">Clinical information</header>\n<p>\n<textarea id=\"clinical_information\"></textarea>\n</p>\n</section>\n<section data-section-name=\"Comparison\">\n<header class=\"level1\">Comparison</header>\n<p>\n<textarea id=\"T45_17\" name=\"Comparison\">None. </textarea>\n</p>\n</section>\n<section data-section-name=\"Findings\">\n<header class=\"level1\">Findings</header>\n<p>\n<label for=\"T45_22\">Extra-axial spaces:</label>\n<input type=\"text\" id=\"T45_22\" name=\"Extra-axial spaces\" value=\"Normal in size and morphology for the patient\'s age.\"/>\n</p>\n<p>\n<label for=\"T45_25\">Intracranial hemorrhage: </label>\n<input type=\"text\" id=\"T45_25\" name=\"Intracranial hemorrhage\" value=\"None\"/>\n</p>\n<p>\n<label for=\"T45_32\">Ventricular system:</label>\n<input type=\"text\" id=\"T45_32\" name=\"Ventricular system\" value=\"Normal in size and morphology for the patient\'s age.\"/>\n</p>\n<p>\n<label for=\"T45_36\">Basal cisterns:</label>\n<input type=\"text\" id=\"T45_36\" name=\"Basal cisterns\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T45_40\">Cerebral parenchyma:</label>\n<input type=\"text\" id=\"T45_40\" name=\"Cerebral parenchyma\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T45_47\">Midline shift:</label>\n<input type=\"text\" id=\"T45_47\" name=\"Midline shift\" value=\"None.\"/>\n<p>\n<label for=\"T45_51\">Cerebellum:</label>\n<input type=\"text\" id=\"T45_51\" name=\"Cerebellum\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T45_53\">Brainstem:</label>\n<input type=\"text\" id=\"T45_53\" name=\"Brainstem\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T45_55\">Calvarium:</label>\n<input type=\"text\" id=\"T45_55\" name=\"Calvarium\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T45_59\">Vascular system:</label>\n<input type=\"text\" id=\"T45_59\" name=\"Vascular system\" value=\"Normal flow voids, without atheroma, occlusion, or dissection.\"/>\n</p>\n<p>\n<label for=\"T45_64\">Paranasal sinuses and mastoid air cells:</label>\n<input type=\"text\" id=\"T45_64\" name=\"Paranasal sinuses and mastoid air cells\" value=\"Clear.\"/>\n</p>\n<p>\n<label for=\"T45_67\">Visualized orbits:</label>\n<input type=\"text\" id=\"T45_67\" name=\"Visualized orbits\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T45_69\">Visualized upper cervical spine:</label>\n<input type=\"text\" id=\"T45_69\" name=\"Visualized upper cervical spine\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T45_71\">Sella:</label>\n<input type=\"text\" id=\"T45_71\" name=\"Sella\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T45_73\">Skull base:</label>\n<input type=\"text\" id=\"T45_73\" name=\"Skull base\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T45_75\">Marrow:</label>\n<input type=\"text\" id=\"T45_75\" name=\"Marrow\" value=\"Normal. \"/>\n</p>\n</section>\n<section data-section-name=\"Impression\">\n<header class=\"level1\">Impression</header>\n<p>\n<textarea id=\"T45_140\" name=\"Impression\">1.  </textarea>\n</p>\n</section>',NULL,NULL,'2.16.840.1.113883.6.256'),
	(12,'ALL','html',1,'0000303','http://www.radreport.org/template/0000303','knee','MSK','','MRI Knee','<section data-section-name=\"Procedure\">\n<header class=\"level1\">MR <select id=\"rightleft\" name = \"rightleft\">\n<option value=\"Right Knee\">Right Knee</option>\n<option value=\"Left Knee\">Left Knee</option>\n</select>\n</section>\n\n<section data-section-name=\"Technique\">\n	<header class=\"level1\">\n		Technique \n	</header>\n	<p>\n		<div data-technique></div>\n	</p>\n	<header class=\"level1\">\n		Contrast \n	</header>\n	<p>\n		<select id=\"contrast\">\n			<option value=\"None\">None</option>\n			<option value=\"MultiHance\">MultiHance</option>\n		</select>\n	</p>\n	<p>\n		<textarea data-contrast></textarea>\n	</p>\n</section>\n\n<section data-section-name=\"Clinical information\">\n<header class=\"level1\">Clinical information</header>\n<p>\n<textarea id=\"clinical_information\"></textarea>\n</p>\n</section>\n<section data-section-name=\"Comparison\">\n<header class=\"level1\">Comparison</header>\n<p>\n<textarea id=\"T303_003\" name=\"Comparison\">None. </textarea>\n</p>\n</section>\n<section data-section-name=\"Findings\">\n<header class=\"level1\">Findings</header>\n<section data-section-name=\"MENISCI\">\n<header class=\"level2\">MENISCI</header>\n<p>\n<label for=\"T303_004\">Medial meniscus:</label>\n<input type=\"text\" id=\"T303_004\" name=\"Medial meniscus\" value=\"Intact.\"/>\n</p>\n<p>\n<label for=\"T303_005\">Lateral meniscus:</label>\n<input type=\"text\" id=\"T303_005\" name=\"Lateral meniscus\" value=\"Intact.\"/>\n</p>\n</section>\n<section data-section-name=\"LIGAMENTS\">\n<header class=\"level2\">LIGAMENTS</header>\n<p>\n<label for=\"T303_006\">Cruciate ligaments:</label>\n<input type=\"text\" id=\"T303_006\" name=\"Cruciate ligaments\" value=\"Intact.\"/></p>\n<p>\n<label for=\"T303_007\">Medial collateral ligament:</label>\n<input type=\"text\" id=\"T303_007\" name=\"MCL\" value=\"Superficial and deep components intact. No periligamentous edema.\"/></p>\n<p>\n<label for=\"T303_008\">Lateral collateral ligament:</label>\n<input type=\"text\" id=\"T303_008\" name=\"LCL\" value=\"Intact.\"/></p>\n<p>\n<label for=\"T303_009\">Posterolateral corner structures:</label>\n<input type=\"text\" id=\"T303_009\" name=\"Posterolateral corner structures\" value=\"Intact.\"/></p>\n</section>\n<section data-section-name=\"EXTENSOR MECHANISM\">\n<header class=\"level2\">EXTENSOR MECHANISM</header>\n<p>\n<textarea id=\"T303_010\" name=\"Extensor mechanism\">The distal quadriceps and patellar tendons are intact. The patella is normally positioned within the femoral groove. There is no retinacular disruption.</textarea>\n</p>\n</section>\n<section data-section-name=\"FLUID\">\n<header class=\"level2\">FLUID</header>\n<p>\n<textarea id=\"T303_011\" name=\"Fluid\">No joint effusion. No Baker\'s cyst.</textarea>\n</p>\n</section>\n<section data-section-name=\"OSSEOUS and ARTICULAR STRUCTURES\">\n<header class=\"level2\">OSSEOUS and ARTICULAR STRUCTURES</header>\n<p>\n<label for=\"T303_012\">Bones:</label>\n<input type=\"text\" id=\"T303_012\" name=\"Bones\" value=\"No fracture, stress reaction, or osseous lesion is seen.\"/>\n</p>\n<p>\n<label for=\"T303_013\">Patellofemoral compartment:</label>\n<input type=\"text\" id=\"T303_013\" name=\"Patellofemoral compartment\" value=\"No hyaline cartilage disease.\"/>\n</p>\n<p>\n<label for=\"T303_014\">Medial compartment:</label>\n<input type=\"text\" id=\"T303_014\" name=\"Medial compartment\" value=\"No hyaline cartilage disease.\"/>\n</p>\n<p>\n<label for=\"T303_015\">Lateral compartment:</label>\n<input type=\"text\" id=\"T303_015\" name=\"Lateral compartment\" value=\"No hyaline cartilage disease.\"/>\n</p>\n</section>\n</section>\n<section data-section-name=\"Impression\">\n<header class=\"level1\">Impression</header>\n<textarea id=\"T302_012\" name=\"Impression\">1. Normal menisci.&#13;&#10;2. No cruciate or collateral ligament tears.&#13;&#10;3. No osseous or cartilaginous abnormality.</textarea>\n</section>',NULL,NULL,'2.16.840.1.113883.6.256'),
	(13,'ALL','html',1,'0000299','http://www.radreport.org/template/0000299','hip','MSK','','MRI Hip','<section data-section-name=\"Procedure\">\n<header class=\"level1\">MR <select id=\"rightleft\" name = \"rightleft\">\n<option value=\"Right Hip\">Right Hip</option>\n<option value=\"Left Hip\">Left Hip</option>\n</select>\n</header>\n</section>\n\n<section data-section-name=\"Technique\">\n	<header class=\"level1\">\n		Technique \n	</header>\n	<p>\n		<div data-technique></div>\n	</p>\n	<header class=\"level1\">\n		Contrast \n	</header>\n	<p>\n		<select id=\"contrast\">\n			<option value=\"None\">None</option>\n			<option value=\"MultiHance\">MultiHance</option>\n		</select>\n	</p>\n	<p>\n		<textarea data-contrast></textarea>\n	</p>\n</section>\n<section data-section-name=\"Clinical information\">\n<header class=\"level1\">Clinical information</header>\n<p>\n<textarea id=\"clinical_information\"></textarea>\n</p>\n</section>\n<section data-section-name=\"Comparison\">\n<header class=\"level1\">Comparison</header>\n<p>\n<textarea id=\"T299_003\" name=\"Comparison\">None. </textarea>\n</p>\n</section>\n<section data-section-name=\"Findings\">\n<header class=\"level1\">Findings</header>\n<section data-section-name=\"Osseous structures\">\n<header class=\"level2\">Osseous structures</header>\n<p>\n<textarea id=\"T299_004\" name=\"Osseous structures\">No fracture, stress reaction, avascular necrosis, or focal osseous lesion is seen.</textarea>\n</p>\n</section>\n<section data-section-name=\"Articular cartilage/Labrum\">\n<header class=\"level2\">Articular cartilage and labrum</header>\n<p>\n<textarea id=\"T299_005\" name=\"Articular cartilage\">There is no joint space narrowing or cartilage disease.</textarea>\n</p>\n<p>\n<textarea id=\"T299_006\" name=\"Labrum\">No labral tear or paralabral cyst is identified. The ligamentum teres is normal.</textarea>\n</p>\n<p>\n<label>The alpha angle measures </label>\n<input type=\"text\" id=\"T299_007\" name=\"Alpha angle\" value=\"\"/>.\n</p>\n</section>\n<section data-section-name=\"Joint or bursal effusion\">\n<header class=\"level2\">Joint or bursal effusion</header>\n<p>\n<textarea id=\"T299_008\" name=\"Joint effusion\">There is no joint effusion.</textarea>\n</p>\n<p>\n<textarea id=\"T299_009\" name=\"Bursal effusion\">No iliopsoas or trochanteric bursal effusion is present.</textarea>\n</p>\n</section>\n<section data-section-name=\"Muscles and tendons\">\n<header class=\"level2\">Muscles and tendons</header>\n<p>\n<textarea id=\"T299_010\" name=\"Muscles and tendons\">The rectus femoris, iliopsoas, proximal hamstrings, quadratus femoris, and hip abductors are intact.</textarea>\n</p>\n</section>\n<section data-section-name=\"Other findings\">\n<header class=\"level2\">Other findings</header>\n<p>\n<textarea id=\"T299_011\" name=\"Miscellaneous\">None.</textarea>\n</p>\n</section>\n</section>\n<section data-section-name=\"Impression\">\n<header class=\"level1\">Impression</header>\n<textarea id=\"T299_012\" name=\"Impression\">1. Normal MR of the left hip.&#13;&#10;2. No osseous, articular, or musculotendinous abnormalities.</textarea>\n</section>',NULL,NULL,'2.16.840.1.113883.6.256'),
	(14,'ALL','html',1,'0000304','http://www.radreport.org/template/0000304','shoulder','MSK','','MRI Shoulder','<section data-section-name=\"Procedure\">\n<header class=\"level1\">MR <select>\n<option value=\"Right Shoulder\">Right Shoulder</option>\n<option value=\"Right Shoulder Arthrogram with US guidance\">Right Shoulder Arthrogram</option>\n<option value=\"Left Shoulder\">Left Shoulder</option>\n<option value=\"Left Shoulder Arthrogram with US guidance\">Left Shoulder Arthrogram</option>\n</select>\n</header>\n</section>\n\n<section data-section-name=\"Technique\">\n	<header class=\"level1\">\n		Technique \n	</header>\n	<p>\n		<div data-technique></div>\n	</p>\n	<header class=\"level1\">\n		Contrast \n	</header>\n	<p>\n		<select id=\"contrast\">\n			<option value=\"None\">None</option>\n			<option value=\"MultiHance\">MultiHance</option>\n		</select>\n	</p>\n	<p>\n		<textarea data-contrast></textarea>\n	</p>\n</section>\n\n<section data-section-name=\"Clinical information\">\n<header class=\"level1\">Clinical information</header>\n<p>\n<textarea id=\"clinical_information\"></textarea>\n</p>\n</section>\n<section data-section-name=\"Comparison\">\n<header class=\"level1\">Comparison</header>\n<p>\n<textarea id=\"T304_009\" name=\"Comparison\">None. </textarea>\n</p>\n</section>\n<section data-section-name=\"Findings\">\n<header class=\"level1\">Findings</header>\n<section data-section-name=\"ROTATOR CUFF and ASSOCIATED STRUCTURES\">\n<header class=\"level2\">ROTATOR CUFF and ASSOCIATED STRUCTURES</header>\n<section data-section-name=\"Rotator cuff\">\n<header class=\"level3\">Rotator cuff</header>\n<p>      <textarea id=\"T304_010\" name=\"rotator cuff\">There is no complete or bursal/articular sided partial rotator cuff tear. The subscapularis constituent of the rotator cuff is intact.</textarea></p>\n</section>\n<section data-section-name=\"Bursa\">\n<header class=\"level3\">Bursa</header>\n<p>\n<textarea id=\"T304_011\" name=\"bursa\">No bursal effusion or thickening is seen.</textarea>\n</p>\n</section>\n<section data-section-name=\"Musculature\">\n<header class=\"level3\">Musculature</header>\n<p>\n<textarea id=\"T304_012\" name=\"musculature\">There is no muscular tear, contusion, or atrophy.</textarea>\n</p>\n</section>\n<section data-section-name=\"Acromioclavicular joint\">\n<header class=\"level3\">Acromioclavicular joint</header>\n<p>\n<textarea id=\"T304_013\" name=\"A.C. joint\">There are mild degenerative changes of the acromioclavicular joint. A type 2 acromion configuration is noted. There is no anterior or lateral acromial downsloping.</textarea>\n</p>\n</section>\n</section>\n<section data-section-name=\"OSSEOUS STRUCTURES\">\n<header class=\"level2\">OSSEOUS STRUCTURES</header>\n<p>\n<textarea id=\"T304_014\" name=\"bones\">There are no fractures or regions of abnormal bone marrow signal intensity.</textarea>\n</p>\n</section>\n<section data-section-name=\"LONG BICIPITAL TENDON\">\n<header class=\"level2\">LONG BICIPITAL TENDON</header>\n<p>\n<textarea id=\"T304_015\" name=\"biceps tendon\">The biceps tendon is normally situated within the bicipital groove. No complete or partial biceps tendon tear is present.</textarea>\n</p>\n</section>\n<section data-section-name=\"GLENOHUMERAL JOINT\">\n<header class=\"level2\">GLENOHUMERAL JOINT</header>\n</section>\n<section data-section-name=\"Joint fluid\">\n<header class=\"level3\">Joint fluid</header>\n<p>\n<textarea id=\"T304_016\" name=\"Joint fluid\">There is no glenohumeral joint effusion.</textarea>\n</p>\n</section>\n<section data-section-name=\"Cartilage and Bone\">\n<header class=\"level3\">Cartilage and Bone</header>\n<p>\n<textarea id=\"T304_017\" name=\"Cartilage and bone\">No focal hyaline cartilage defects are noted. No Hill-Sachs, reverse Hill-Sachs, or bony Bankart lesions are seen.</textarea>\n</p>\n</section>\n<section data-section-name=\"Labrum\">\n<header class=\"level3\">Labrum</header>\n<p>\n<textarea id=\"T304_018\" name=\"Labrum\">There are no SLAP or soft tissue Bankart lesions. No paralabral cysts are seen.</textarea>\n</p>\n</section>\n<section data-section-name=\"Other support structures\">\n<header class=\"level3\">Other support structures</header>\n<p>\n<textarea id=\"T304_019\" name=\"Support structures\">No capsular or ligamentous abnormality is seen.</textarea>\n</p>\n</section>\n<section data-section-name=\"OTHER FINDINGS\">\n<header class=\"level2\">OTHER FINDINGS</header>\n<p>\n<textarea id=\"T304_020\" name=\"Other findings\">None.</textarea>\n</p>\n</section>\n</section>\n<section data-section-name=\"Impression\">\n<header class=\"level1\">Impression</header>\n<textarea id=\"T302_012\" name=\"Impression\">1. Normal rotator cuff.&#13;&#10;2. No biceps tendon tear or subluxation.&#13;&#10;3. Normal support structures.</textarea>\n</section>',NULL,NULL,'2.16.840.1.113883.6.256'),
	(15,'ALL','html',1,'0000305','http://www.radreport.org/template/0000305','wrist','MSK','','MRI Wrist','<section data-section-name=\"Procedure\">\n<header class=\"level1\">MR <select id=\"rightleft\" name = \"rightleft\">\n<option value=\"Right Wrist\">Right Wrist</option>\n<option value=\"Left Wrist\">Left Wrist</option>\n</select>\n</header>\n</section>\n\n<section data-section-name=\"Technique\">\n	<header class=\"level1\">\n		Technique \n	</header>\n	<p>\n		<div data-technique></div>\n	</p>\n	<header class=\"level1\">\n		Contrast \n	</header>\n	<p>\n		<select id=\"contrast\">\n			<option value=\"None\">None</option>\n			<option value=\"MultiHance\">MultiHance</option>\n		</select>\n	</p>\n	<p>\n		<textarea data-contrast></textarea>\n	</p>\n</section>\n\n<section data-section-name=\"Clinical information\">\n<header class=\"level1\">Clinical information</header>\n<p>\n<textarea id=\"clinical_information\"></textarea>\n</p>\n</section>\n<section data-section-name=\"Comparison\">\n<header class=\"level1\">Comparison</header>\n<p>\n<textarea id=\"T305_3\" name=\"Comparison\">None. </textarea>\n</p>\n</section>\n<section data-section-name=\"Findings\">\n<header class=\"level1\">Findings</header>\n<section data-section-name=\"Triangular fibrocartilage\">\n<header class=\"level2\">Triangular fibrocartilage</header>\n<p>  \n<textarea id=\"T305_4\" name=\"Triangular fibrocartilage\">No radial, central, or ulnar-sided triangular fibrocartilage perforation.</textarea></p>\n</section>\n<section data-section-name=\"Interosseous ligaments\">\n<header class=\"level2\">Interosseous ligaments</header>\n<p>\n<label for=\"T305_10\">Scapholunate ligament:</label>\n<input type=\"text\" id=\"T305_10\" name=\"Scapholunate\" value=\"Intact.\" />\n</p>\n<p>\n<label for=\"T305_11\">Lunotriquetral ligament:</label>\n<input type=\"text\" id=\"T305_11\" name=\"Lunotriquetral\" value=\"Intact.\" />\n</p>\n<p>\n<label for=\"T305_12\">Carpal alignment:</label>\n<input type=\"text\" id=\"T305_12\" name=\"Carpal alignment\" value=\"Normal.\" />\n</p>\n</section>\n<section data-section-name=\"Bones\">\n<header class=\"level2\">Bones</header>\n<p>\n<textarea id=\"T305_13\" name=\"Bones\">No fracture, stress reaction, or osseous lesion.</textarea>\n</p>\n</section>\n<section data-section-name=\"Articulations\">\n<header class=\"level2\">Articulations</header>\n<p>\n<label for=\"T305_14\">Joint effusion:</label>\n<input type=\"text\" id=\"T305_14\" name=\"Joint effusion\" value=\"None.\" />\n</p>\n<p>\n<label for=\"T305_15\">Cartilage:</label>\n<input type=\"text\" id=\"T305_15\" name=\"Cartilage\" value=\"No hyaline cartilage defects.\" />\n</p>\n<p>\n<label for=\"T305_16\">Synovium:</label>\n<input type=\"text\" id=\"T305_16\" name=\"Synovium\" value=\"No synovial thickening.\" />\n</p>\n</section>\n<section data-section-name=\"Tendons\">\n<header class=\"level2\">Tendons</header>\n<p>\n<label for=\"T305_17\">Flexor tendons:</label>\n<input type=\"text\" id=\"T305_17\" name=\"Flexor tendons\" value=\"Normal. No tear or tendon sheath effusion.\" />\n</p>\n<p>\n<label for=\"T305_18\">Extensor tendons:</label>\n<input type=\"text\" id=\"T305_18\" name=\"Extensor tendons\" value=\"Normal. No tear or tendon sheath effusion.\" />\n</p>\n<p>\n<label for=\"T305_19\">Extensor carpi ulnaris:</label>\n<input type=\"text\" id=\"T305_19\" name=\"Extensor carpi ulnaris\" value=\"Intact and normally situated in the ulnar groove.\" />\n</p>\n</section>\n<section data-section-name=\"Miscellaneous soft tissues\">\n<header class=\"level2\">Miscellaneous soft tissues</header>\n<p>\n<textarea id=\"T305_20\" name=\"Miscellaneous soft tissues\">No volar or dorsal ganglion cysts.</textarea>\n</p>\n</section>\n</section>\n<section data-section-name=\"Impression\">\n<header class=\"level1\">Impression</header>\n<p>1. <input type=\"text\" id=\"T305_21\" name=\"TFC\" value=\"Intact triangular fibrocartilage and interosseous ligaments.\" /></p>\n<p>2. <input type=\"text\" id=\"T305_22\" name=\"Bone and cartilage\" value=\"No osseous or articular abnormalities.\" /></p>\n<p>3. <input type=\"text\" id=\"T305_23\" name=\"Tendons\" value=\"Intact flexor and extensor tendons.\" /></p>\n<p>4. <input type=\"text\" id=\"T305_24\" name=\"Ganglion cyst\" value=\"No ganglion cyst.\" /></p>\n</section>',NULL,NULL,'2.16.840.1.113883.6.256'),
	(16,'ALL','html',1,'0000041','http://www.radreport.org/template/0000041','ankle','MSK','','MRI Ankle','<section data-section-name=\"Procedure\">\n<header class=\"level1\">MR <select id=\"rightleft\" name = \"rightleft\">\n<option value=\"Right Ankle\">Right Ankle</option>\n<option value=\"Left Ankle\">Left Ankle</option>\n</select>\n</header>\n</section>\n\n<section data-section-name=\"Technique\">\n	<header class=\"level1\">\n		Technique \n	</header>\n	<p>\n		<div data-technique></div>\n	</p>\n	<header class=\"level1\">\n		Contrast \n	</header>\n	<p>\n		<select id=\"contrast\">\n			<option value=\"None\">None</option>\n			<option value=\"MultiHance\">MultiHance</option>\n		</select>\n	</p>\n	<p>\n		<textarea data-contrast></textarea>\n	</p>\n</section>\n\n<section>\n<header class=\"level1\">Clinical information</header>\n<p>\n<textarea id=\"clinical_information\"></textarea>\n</p>\n</section>\n<section data-section-name=\"Comparison\">\n<header class=\"level1\">Comparison</header>\n<p>\n<textarea id=\"T41_8\" name=\"Comparison\">None. </textarea>\n</p>\n</section>\n<section data-section-name=\"Findings\">\n<header class=\"level1\">Findings</header>\n<p>\n<label for= \"fluid\">FLUID:</label>\n<textarea id = \"fluid\">There is no elbow effusion. There is no osteochondral defect of the capitellum. There is no intraarticular loose fragment or body.</textarea>\n</p>\n<p>\n<label for= \"cartilage\">CARTILAGE:</label>\n<input id = \"fluid\" type=\"text\" value=\"Intact.\"/>\n</p>\n<section data-section-name=\"LIGAMENTS\">\n<header class=\"level2\">LIGAMENTS:</header>\n<p>\n<label for=\"medialligaments\">Medial:</label>\n<input type=\"text\" id=\"medialligaments\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"lateralligaments\">Lateral:</label>\n<input type=\"text\" id=\"lateralligaments\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_33\">Flexor digitorum longus tendon:</label>\n<input type=\"text\" id=\"T41_33\" name=\"T41_33\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_45\">Deltoid ligament complex (superficial):</label>\n<input type=\"text\" id=\"T41_45\" name=\"T41_45\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_53\">Deltoid ligament complex (deep):</label>\n<input type=\"text\" id=\"T41_53\" name=\"T41_53\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_60\">Spring ligament:</label>\n<input type=\"text\" id=\"T41_60\" name=\"T41_60\" value=\"Normal. \"/>\n</p>\n</section>\n<section data-section-name=\"Lateral compartment\">\n<header class=\"level2\">Lateral compartment</header>\n<p>\n<label for=\"T41_68\">Lateral malleolus:</label>\n<input type=\"text\" id=\"T41_68\" name=\"T41_68\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_71\">Retromalleolar groove:</label>\n<select id=\"T41_71\" name=\"T41_71\">\n<option id=\"T41_71_72\" name=\"T41_71_72\" value=\"Flat\">Flat</option>\n<option id=\"T41_71_73\" name=\"T41_71_73\" value=\"Concave\">Concave</option>\n<option id=\"T41_71_74\" name=\"T41_71_74\" value=\"Convex\">Convex</option>\n</select>\n</p>\n<p>\n<label for=\"T41_76\">Peroneus longus tendon:</label>\n<input type=\"text\" id=\"T41_76\" name=\"T41_76\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_87\">Peroneus brevis tendon:</label>\n<input type=\"text\" id=\"T41_87\" name=\"T41_87\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_98\">Peroneal retinaculum:</label>\n<input type=\"text\" id=\"T41_98\" name=\"T41_98\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_109\">Peroneus quartus:</label>\n<input type=\"text\" id=\"T41_109\" name=\"T41_109\" value=\"Absent. \"/>\n</p>\n<p>\n<label for=\"T41_112\">Anterior inferior tibiofibular ligament:</label>\n<input type=\"text\" id=\"T41_112\" name=\"T41_112\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_119\">Posterior inferior tibiofibular ligament:</label>\n<input type=\"text\" id=\"T41_119\" name=\"T41_119\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_126\">Anterior talofibular ligament:</label>\n<input type=\"text\" id=\"T41_126\" name=\"T41_126\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_133\">Calcaneofibular ligament:</label>\n<input type=\"text\" id=\"T41_133\" name=\"T41_133\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_140\">Posterior talofibular ligament</label>\n<input type=\"text\" id=\"T41_140\" name=\"T41_140\" value=\"Normal. \"/>\n</p>\n</section>\n<section data-section-name=\"Posterior compartment\">\n<header class=\"level2\">Posterior compartment</header>\n<p>\n<label for=\"T41_148\">Posterior talus:</label>\n<input type=\"text\" id=\"T41_148\" name=\"T41_148\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_153\">Flexor hallucis longus:</label>\n<input type=\"text\" id=\"T41_153\" name=\"T41_153\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_164\">Intermalleolar ligament:</label>\n<input type=\"text\" id=\"T41_164\" name=\"T41_164\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_171\">Achilles tendon:</label>\n<input type=\"text\" id=\"T41_171\" name=\"T41_171\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_182\">Plantar fascia:</label>\n<input type=\"text\" id=\"T41_182\" name=\"T41_182\" value=\"Normal. \"/>\n</p>\n</section>\n<section data-section-name=\"Articulations\">\n<header class=\"level2\">Articulations</header>\n<p>\n<label for=\"T41_194\">Tibiotalar joint:</label>\n<input type=\"text\" id=\"T41_194\" name=\"T41_194\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_209\">Subtalar joint:</label>\n<input type=\"text\" id=\"T41_209\" name=\"T41_209\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_221\">Tarsal joints:</label>\n<input type=\"text\" id=\"T41_221\" name=\"T41_221\" value=\"Normal. \"/>\n</p>\n</section>\n<section data-section-name=\"Anterior compartment\">\n<header class=\"level2\">Anterior compartment</header>\n<p>\n<label for=\"T41_224\">Anterior tibial tendon:</label>\n<input type=\"text\" id=\"T41_224\" name=\"T41_224\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_235\">Extensor hallucis longus:</label>\n<input type=\"text\" id=\"T41_235\" name=\"T41_235\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_246\">Extensor digitorum longus:</label>\n<input type=\"text\" id=\"T41_246\" name=\"T41_246\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_257\">Peroneus tertius:</label>\n<input type=\"text\" id=\"T41_257\" name=\"T41_257\" value=\"Absent. \"/>\n</p>\n</section>\n<section data-section-name=\"General findings\">\n<header class=\"level2\">General findings</header>\n<p>\n<label for=\"T41_258\">Bones:</label>\n<input type=\"text\" id=\"T41_258\" name=\"T41_258\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_260\">Muscles:</label>\n<input type=\"text\" id=\"T41_260\" name=\"T41_260\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_262\">Tarsal tunnel:</label>\n<input type=\"text\" id=\"T41_262\" name=\"T41_262\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T41_264\">Sinus tarsi:</label>\n<input type=\"text\" id=\"T41_264\" name=\"T41_264\" value=\"Normal. \"/>\n</p>\n</section>\n<section data-section-name=\"Impression\">\n<header class=\"level1\">Impression</header>\n<p>\n<textarea id=\"T41_549\" name=\"Impression\">1.  </textarea>\n</p>\n</section>',NULL,NULL,'2.16.840.1.113883.6.256'),
	(17,'ALL','html',1,'0000065','http://www.radreport.org/template/0000065','orbits','Neuroradiology','','MRI Orbits','<section data-section-name=\"Procedure\">\n<header class=\"level1\">MR Orbits</header>\n</section>\n\n<section data-section-name=\"Technique\">\n	<header class=\"level1\">\n		Technique \n	</header>\n	<p>\n		<div data-technique></div>\n	</p>\n	<header class=\"level1\">\n		Contrast \n	</header>\n	<p>\n		<select id=\"contrast\">\n			<option value=\"None\">None</option>\n			<option value=\"MultiHance\">MultiHance</option>\n		</select>\n	</p>\n	<p>\n		<textarea data-contrast></textarea>\n	</p>\n</section>\n\n<section data-section-name=\"Clinical information\">\n<header class=\"level1\">Clinical information</header>\n<p>\n<textarea id=\"clinical_information\"></textarea>\n</p>\n</section>\n<section data-section-name=\"Comparison\">\n<header class=\"level1\">Comparison</header>\n<p>\n<textarea id=\"T65_6\" name=\"Comparison\">None. </textarea>\n</p>\n</section>\n<section data-section-name=\"Findings\">\n<header class=\"level1\">Findings</header>\n<section data-section-name=\"Right orbit\">\n<header class=\"level2\">Right orbit</header>\n<p>\n<label for=\"T65_14\">Mass:</label>\n<input type=\"text\" id=\"T65_14\" name=\"Mass\" value=\"None.\"/>\n</p>\n<p>\n<label for=\"T65_16\">Globe:</label>\n<input type=\"text\" id=\"T65_16\" name=\"Globe\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T65_18\">Bony orbit:</label>\n<input type=\"text\" id=\"T65_18\" name=\"Bony orbit\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T65_20\">Pre-septal soft tissues:</label>\n<input type=\"text\" id=\"T65_20\" name=\"Pre-septal soft tissues\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T65_22\">Optic nerves and complex:</label>\n<input type=\"text\" id=\"T65_22\" name=\"Optic nerves and complex\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T65_24\">Extraocular muscles:</label>\n<input type=\"text\" id=\"T65_24\" name=\"Extraocular muscles\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T65_26\">Lacrimal apparatus:</label>\n<input type=\"text\" id=\"T65_26\" name=\"Lacrimal apparatus\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T65_28\">Orbital apex:</label>\n<input type=\"text\" id=\"T65_28\" name=\"Orbital apex\" value=\"Normal. \"/>\n</p>\n</section>\n\n<section data-section-name=\"Left orbit\">\n<header class=\"level2\">Left orbit</header>\n<p>\n<label for=\"T65_32\">Mass:</label>\n<input type=\"text\" id=\"T65_32\" name=\"Mass\" value=\"None\"/>\n</p>\n<p>\n<label for=\"T65_34\">Globe:</label>\n<input type=\"text\" id=\"T65_34\" name=\"Globe\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T65_36\">Bony orbit:</label>\n<input type=\"text\" id=\"T65_36\" name=\"Bony orbit\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T65_38\">Pre-septal soft tissues:</label>\n<input type=\"text\" id=\"T65_38\" name=\"Pre-septal soft tissues\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T65_40\">Optic nerves and complex:</label>\n<input type=\"text\" id=\"T65_40\" name=\"Optic nerves and complex\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T65_42\">Extraocular muscles:</label>\n<input type=\"text\" id=\"T65_42\" name=\"Extraocular muscles\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T65_44\">Lacrimal apparatus:</label>\n<input type=\"text\" id=\"T65_44\" name=\"Lacrimal apparatus\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T65_46\">Orbital apex:</label>\n<input type=\"text\" id=\"T65_46\" name=\"Orbital apex\" value=\"Normal. \"/>\n</p>\n</section>\n<section data-section-name=\"Other findings\">\n<header class=\"level2\">Other findings</header>\n<p>\n<label for=\"T65_48\">Brain:</label>\n<input type=\"text\" id=\"T65_48\" name=\"Brain\" value=\"Normal. \"/>\n</p>\n<p>\n<label for=\"T65_50\">Cavernous sinuses:</label>\n<input type=\"text\" id=\"T65_50\" name=\"Cavernous sinuses\" value=\"Normal. \"/>\n</p>\n</section>\n</section>\n<section data-section-name=\"Impression\">\n<header class=\"level1\">Impression</header>\n<p>\n<textarea id=\"T65_52\" name=\"Impression\">Normal. </textarea>\n</p>\n</section>',NULL,NULL,'2.16.840.1.113883.6.256'),
	(18,'ALL','html',1,'mrcspine','','cspine','Neuroradiology','','MRI C-spine','<section data-section-name=\"Procedure\">\n<header class=\"level1\">MR Cervical Spine</header>\n</section>\n\n<section data-section-name=\"Technique\">\n	<header class=\"level1\">\n		Technique \n	</header>\n	<p>\n		<div data-technique></div>\n	</p>\n	<header class=\"level1\">\n		Contrast \n	</header>\n	<p>\n		<select id=\"contrast\">\n			<option value=\"None\">None</option>\n			<option value=\"MultiHance\">MultiHance</option>\n		</select>\n	</p>\n	<p>\n		<textarea data-contrast></textarea>\n	</p>\n</section>\n\n<section data-section-name=\"Clinical information\">\n<header class=\"level1\">Clinical information</header>\n<p>\n<textarea id=\"clinical_information\"></textarea>\n</p>\n</section>\n\n<section data-section-name=\"Comparison\">\n<header class=\"level1\">Comparison</header>\n<p>\n<textarea id=\"Comparison\" name=\"Comparison\">None.</textarea>\n</p>\n</section>\n\n<section data-section-name=\"Findings\">\n\n<header class=\"level1\">Findings</header>\n\n<section data-section-name=\"Skull Base\">\n\n<header class=\"level2\">Cerebellum</header>\n<p>\n<textarea id=\"OBS_1\" name=\"OBS_1\">Normal, tonsils normally positioned.  Cerebellum, brainstem normal in appearance.</textarea>\n</p>\n\n<header class=\"level2\">Skull Base</header>\n<p>\n<textarea id=\"OBS_2\" name=\"OBS_2\">Normal marrow signal.  Sinuses Normal.</textarea>\n</p>\n\n</section>\n\n<section data-section-name=\"Osseous structures\">\n\n<header class=\"level2\">Osseous structure alignment / Skull base to T1</header>\n<p>\n<textarea id=\"OBS_3\" name=\"OBS_3\">Normal alignment.</textarea>\n</p>\n\n<header class=\"level2\">Marrow signal</header>\n<p>\n<textarea id=\"OBS_4\" name=\"OBS_4\">Normal marrow signal.</textarea>\n</p>\n\n</section>\n\n<section data-section-name=\"Spinal Cord\">\n\n<header class=\"level2\">Spinal Cord</header>\n<p>\n<textarea id=\"OBS_5\" name=\"OBS_5\">No cord compression.  No extradural, intradural masses.</textarea>\n</p>\n\n</section>\n\n\n<section data-section-name=\"Intervertebral Discs\">\n<header class=\"level2\">Intervertebral Discs</header>\n<p>\n<textarea id=\"OBS_6\" name=\"OBS_6\">Summary of disc status.</textarea>\n</p>\n</section>\n\n<section data-section-name=\"Level By Level\">\n<header class=\"level2\">Level By Level Findings</header>\n<p>\n<textarea id=\"OBS_7\" name=\"OBS_7\">C2-C3:  </textarea>\n</p>\n<p>\n<textarea id=\"OBS_8\" name=\"OBS_8\">C3-C4:  </textarea>\n</p>\n<p>\n<textarea id=\"OBS_9\" name=\"OBS_9\">C4-C5:  </textarea>\n</p>\n<p>\n<textarea id=\"OBS_10\" name=\"OBS_10\">C5-C6:  </textarea>\n</p>\n<p>\n<textarea id=\"OBS_11\" name=\"OBS_11\">C6-C7:  </textarea>\n</p>\n<p>\n<textarea id=\"OBS_12\" name=\"OBS_12\">C7-T1:  </textarea>\n</p>\n<p>\n<textarea id=\"OBS_13\" name=\"OBS_13\">Other:  </textarea>\n</p>\n</section>\n\n\n<section data-section-name=\"Other findings\">\n<header class=\"level2\">Other findings</header>\n<p>\n<textarea id=\"OBS_14\" name=\"OBS_14\">None.</textarea>\n</p>\n</section>\n\n</section>\n<section data-section-name=\"Impression\">\n<header class=\"level1\">Impression</header>\n<textarea id=\"Impression\" name=\"Impression\">1. </textarea>\n</section>',NULL,NULL,''),
	(19,'ALL','html',1,'mrtspine','','tspine','Neuroradiology','','MRI T-spine','<section data-section-name=\"Procedure\">\n<header class=\"level1\">MR Thoracic Spine</header>\n</section>\n\n<section data-section-name=\"Technique\">\n	<header class=\"level1\">\n		Technique \n	</header>\n	<p>\n		<div data-technique></div>\n	</p>\n	<header class=\"level1\">\n		Contrast \n	</header>\n	<p>\n		<select id=\"contrast\">\n			<option value=\"None\">None</option>\n			<option value=\"MultiHance\">MultiHance</option>\n		</select>\n	</p>\n	<p>\n		<textarea data-contrast></textarea>\n	</p>\n</section>\n\n<section data-section-name=\"Clinical information\">\n<header class=\"level1\">Clinical information</header>\n<p>\n<textarea id=\"clinical_information\"></textarea>\n</p>\n</section>\n\n<section data-section-name=\"Comparison\">\n<header class=\"level1\">Comparison</header>\n<p>\n<textarea id=\"Comparison\" name=\"Comparison\">None.</textarea>\n</p>\n</section>\n\n<section data-section-name=\"Findings\">\n\n<header class=\"level1\">Findings</header>\n\n\n<section data-section-name=\"Osseous structures\">\n\n<header class=\"level2\">Osseous structure alignment</header>\n<p>\n<textarea id=\"OBS_1\" name=\"OBS_1\">Normal alignment.</textarea>\n</p>\n\n<header class=\"level2\">Marrow signal</header>\n<p>\n<textarea id=\"OBS_2\" name=\"OBS_2\">Normal marrow signal.</textarea>\n</p>\n\n</section>\n\n<section data-section-name=\"Spinal Cord\">\n\n<header class=\"level2\">Spinal Cord</header>\n<p>\n<textarea id=\"OBS_3\" name=\"OBS_3\">No cord compression.  No extradural, intradural masses.</textarea>\n</p>\n\n</section>\n\n\n<section data-section-name=\"Intervertebral Discs\">\n<header class=\"level2\">Intervertebral Discs</header>\n<p>\n<textarea id=\"OBS_6\" name=\"OBS_6\">Summary of disc status.</textarea>\n</p>\n</section>\n\n<section data-section-name=\"Level By Level\">\n<header class=\"level2\">Notable findings by vertebral level:</header>\n<p>\n<textarea id=\"OBS_7\" name=\"OBS_7\"></textarea>\n</p>\n\n</section>\n\n\n<section data-section-name=\"Other findings\">\n<header class=\"level2\">Other findings</header>\n<p>\n<textarea id=\"OBS_8\" name=\"OBS_8\">None.</textarea>\n</p>\n</section>\n\n</section>\n<section data-section-name=\"Impression\">\n<header class=\"level1\">Impression</header>\n<textarea id=\"Impression\" name=\"Impression\">1.  </textarea>\n</section>',NULL,NULL,''),
	(20,'ALL','html',1,'mrlspine','','lspine','Neuroradiology','','MRI L-spine','<section data-section-name=\"Procedure\">\n<header class=\"level1\">MR Lumbar Spine</header>\n</section>\n\n<section data-section-name=\"Technique\">\n	<header class=\"level1\">\n		Technique \n	</header>\n	<p>\n		<div data-technique></div>\n	</p>\n	<header class=\"level1\">\n		Contrast \n	</header>\n	<p>\n		<select id=\"contrast\">\n			<option value=\"None\">None</option>\n			<option value=\"MultiHance\">MultiHance</option>\n		</select>\n	</p>\n	<p>\n		<textarea data-contrast></textarea>\n	</p>\n</section>\n\n<section data-section-name=\"Clinical information\">\n<header class=\"level1\">Clinical information</header>\n<p>\n<textarea id=\"clinical_information\"></textarea>\n</p>\n</section>\n\n<section data-section-name=\"Comparison\">\n<header class=\"level1\">Comparison</header>\n<p>\n<textarea id=\"Comparison\" name=\"Comparison\">None.</textarea>\n</p>\n</section>\n\n<section data-section-name=\"Findings\">\n\n<header class=\"level1\">Findings</header>\n\n\n<section data-section-name=\"Osseous structures\">\n\n<header class=\"level2\">Osseous structure alignment</header>\n<p>\n<textarea id=\"OBS_1\" name=\"OBS_1\">Normal alignment.</textarea>\n</p>\n\n<header class=\"level2\">Marrow signal</header>\n<p>\n<textarea id=\"OBS_2\" name=\"OBS_2\">Normal marrow signal.</textarea>\n</p>\n\n</section>\n\n<section data-section-name=\"Spinal Cord\">\n\n<header class=\"level2\">Spinal Cord</header>\n<p>\n<textarea id=\"OBS_3\" name=\"OBS_3\">No cord compression.  No extradural, intradural masses.</textarea>\n</p>\n\n</section>\n\n\n<section data-section-name=\"Intervertebral Discs\">\n<header class=\"level2\">Intervertebral Discs</header>\n<p>\n<textarea id=\"OBS_6\" name=\"OBS_6\">Summary of disc status.</textarea>\n</p>\n</section>\n\n<section data-section-name=\"Level By Level\">\n<header class=\"level2\">Level By Level Findings</header>\n<p>\n<textarea id=\"OBS_7\" name=\"OBS_7\">T12-L1:  </textarea>\n</p>\n<p>\n<textarea id=\"OBS_8\" name=\"OBS_8\">L1-L2:  </textarea>\n</p>\n<p>\n<textarea id=\"OBS_9\" name=\"OBS_9\">L2-L3:  </textarea>\n</p>\n<p>\n<textarea id=\"OBS_10\" name=\"OBS_10\">L3-L4:  </textarea>\n</p>\n<p>\n<textarea id=\"OBS_11\" name=\"OBS_11\">L4-L5:  </textarea>\n</p>\n<p>\n<textarea id=\"OBS_12\" name=\"OBS_12\">L5-S1:  </textarea>\n</p>\n<p>\n<textarea id=\"OBS_13\" name=\"OBS_13\">Other:  </textarea>\n</p>\n</section>\n\n\n<section data-section-name=\"Other findings\">\n<header class=\"level2\">Other findings</header>\n<p>\n<textarea id=\"OBS_14\" name=\"OBS_14\">None.</textarea>\n</p>\n</section>\n\n</section>\n<section data-section-name=\"Impression\">\n<header class=\"level1\">Impression</header>\n<textarea id=\"Impression\" name=\"Impression\">1.  </textarea>\n</section>',NULL,NULL,''),
	(21,'ALL','html',1,'50655','','brain','Neuroradiology','','IAC Screening','<section data-section-name=\"MRI BRAIN WITHOUT CONTRAST\">\n    <header>MRI BRAIN WITHOUT CONTRAST</header>\n    <p><label>HISTORY:</label><input name=\"Patient Age\" value=\"Patient Age\"></p>\n    <p><label> old </label><input name=\"Patient Gender\" value=\"Patient Gender\"></p>\n    <p><label>, </label><input name=\"history\" value=\"hearing loss.\"></p>\n</section>\n\n<section data-section-name=\"Technique\">\n	<header class=\"level1\">\n		Technique \n	</header>\n	<p>\n		<div data-technique></div>\n	</p>\n	<header class=\"level1\">\n		Contrast \n	</header>\n	<p>\n		<select id=\"contrast\">\n			<option value=\"None\">None</option>\n			<option value=\"MultiHance\">MultiHance</option>\n		</select>\n	</p>\n	<p>\n		<textarea data-contrast></textarea>\n	</p>\n</section>\n\n<section data-section-name=\"FINDINGS:\">\n    <header>FINDINGS:</header>\n    <p><label>INTERNAL AUDITORY CANALS AND CEREBELLOPONTINE ANGLES: </label><input name=\"IAC\" value=\"No mass.\"></p>\n    <p><label> </label><input name=\"CN7/8\" value=\"Seventh and eighth cranial nerves are normal.\"></p>\n    <p><label>COCHLEA, VESTIBULE, SEMICIRCULAR CANALS: </label><input name=\"inner ear\" value=\"Normal signal and morphology.\"></p>\n    <p><label>BRAINSTEM AND CEREBELLUM: </label><input name=\"brainstem/cerebellum\" value=\"Normal.\"></p>\n    <p><label>REMAINING BRAIN PARENCHYMA: </label><input name=\"infarct-hemorrhage\" value=\"No acute infarct or hemorrhage. No mass effect or herniation.\"></p>\n    <p><label> </label><select name=\"white matter\">\n            <option name=\"Normal\" value=\"Normal\" selected=\"\" id=\"\">Signal intensities are within normal limits for age.</option>\n            <option name=\"Mild\" value=\"Mild\" id=\"\">Mild white matter chronic small vessel ischemic changes.</option>\n            <option name=\"Moderate\" value=\"Moderate\" id=\"\">Moderate white matter chronic small vessel ischemic changes.</option>\n            <option name=\"Severe\" value=\"Severe\" id=\"\">Severe white matter chronic small vessel ischemic changes.</option>\n        </select></p>\n    <p><label>VENTRICLES/EXTRA-AXIAL SPACES: </label><input name=\"ventricles-extra-axial\" value=\"No hydrocephalus or extra-axial fluid collections.\"></p>\n    <p><label>OTHER: </label><input name=\"other\" value=\"None.\"></p>\n</section>\n<section data-section-name=\"IMPRESSION:\">\n    <header>IMPRESSION:</header>\n    <p><textarea name=\"impression\">No vestibular schwannoma or other retrocochlear abnormality.</textarea></p>\n</section>',NULL,NULL,'2.16.840.1.113883.6.256'),
	(22,'ALL','html',1,'NA','','elbow','MSK','','MRI Elbow','<section data-section-name=\"Procedure\">\n	<header class=\"level1\">\n		MR \n		<select>\n			<option value=\"Right Elbow\">Right Elbow </option>\n			<option value=\"Left Elbow\">Left Elbow </option>\n		</select>\n	</header>\n</section>\n\n<section data-section-name=\"Technique\">\n	<header class=\"level1\">\n		Technique \n	</header>\n	<p>\n		<div data-technique></div>\n	</p>\n	<header class=\"level1\">\n		Contrast \n	</header>\n		<p>\n		<select id=\"contrast\">\n			<option value=\"None\">None</option>\n			<option value=\"MultiHance\">MultiHance</option>\n		</select>\n		</p>\n	<p>\n		<textarea data-contrast></textarea>\n	</p>\n</section>\n\n<section>\n	<header class=\"level1\">\n		Clinical information \n	</header>\n	<p>\n		<textarea id=\"clinical_information\"></textarea>\n	</p>\n</section>\n<section data-section-name=\"Comparison\">\n	<header class=\"level1\">\n		Comparison \n	</header>\n	<p>\n		<textarea id=\"T41_8\" name=\"Comparison\">None. </textarea>\n	</p>\n</section>\n<section data-section-name=\"Findings\">\n	<header class=\"level1\">\n		Findings \n	</header>\n	<p>\n		<label for=\"fluid\">FLUID:</label> <textarea id=\"fluid\">There is no elbow effusion. There is no osteochondral defect of the capitellum. There is no intraarticular loose fragment or body.</textarea>\n	</p>\n	<p>\n		<label for=\"cartilage\">CARTILAGE:</label> \n		<input id=\"fluid\" type=\"text\" value=\"Intact.\" />\n	</p>\n	<section data-section-name=\"LIGAMENTS\">\n		<header class=\"level2\">\n			LIGAMENTS: \n		</header>\n		<p>\n			<label for=\"medialligaments\">Medial:</label> \n			<input type=\"text\" id=\"medialligaments\" value=\"Normal. \" />\n		</p>\n		<p>\n			<label for=\"lateralligaments\">Lateral:</label> \n			<input type=\"text\" id=\"lateralligaments\" value=\"Normal. \" />\n		</p>\n	</section>\n	<section data-section-name=\"TENDONS\">\n		<header class=\"level2\">\n			TENDONS: \n		</header>\n		<p>\n			<label for=\"extensor\">Common extensor origin:</label> \n			<input type=\"text\" id=\"extensor\" value=\"Normal. \" />\n		</p>\n		<p>\n			<label for=\"flexor\">Common flexor origin:</label> \n			<input type=\"text\" id=\"flexor\" value=\"Normal. \" />\n		</p>\n		<p>\n			<label for=\"anterior\">Anterior (biceps, brachialis, supinator):</label> \n			<input type=\"text\" id=\"anterior\" value=\"Normal. \" />\n		</p>\n		<p>\n			<label for=\"posterior\">Posterior (triceps, anconeus:</label> \n			<input type=\"text\" id=\"posterior\" value=\"Normal. \" />\n		</p>\n	</section>\n	<section data-section-name=\"NERVES\">\n		<header class=\"level2\">\n			NERVES: \n		</header>\n		<label for=\"nerves\"></label> <textarea id=\"nerves\">Ulnar, Radial Nerve description.</textarea>\n	</section>\n	<section data-section-name=\"MUSCULATURE\">\n		<header class=\"level2\">\n			MUSCULATURE: \n		</header>\n		<label for=\"muscles\"></label> <textarea id=\"muscles\">Intact.</textarea>\n	</section>\n	<section data-section-name=\"MUSCULATURE\">\n		<header class=\"level2\">\n			BONE MARROW:: \n		</header>\n		<label for=\"marrow\"></label> <textarea id=\"marrow\">Normal.</textarea>\n	</section>\n</section>\n\n<section data-section-name=\"Impression\">\n<header class=\"level1\">\nImpression: \n</header>\n<p>\n<textarea>\n1.  Test.&#13;\n2.  Test.&#13;\n3.  Test.\n</textarea>\n</p>\n</section>\n',NULL,NULL,NULL),
	(23,'ALL','html',1,'RPT50663','https://radreport.org/home/50663/','sella','Neuroradiology','','MRI Sella','<section>\n<header class=\"level1\">MRI SELLA WITHOUT AND WITH CONTRAST</header>\n</section>\n<section data-section-name=\"Technique\">\n	<header>\n		Technique \n	</header>\n	<p>\n		<div data-technique></div>\n	</p>\n	<header>\n		Contrast \n	</header>\n	<p>\n		<select id=\"contrast\">\n			<option value=\"None\">None</option>\n			<option value=\"MultiHance\">MultiHance</option>\n		</select>\n	</p>\n	<p>\n		<textarea data-contrast></textarea>\n	</p>\n</section>\n\n<section data-section-name=\"Clinical information\">\n<header class=\"level1\">Clinical information</header>\n<p>\n<textarea id=\"clinical_information\"></textarea>\n</p>\n</section>\n\n<section data-section-name=\"Comparison\">\n<header>Comparison</header>\n<p>\n<textarea>None.</textarea>\n</p>\n</section>\n\n<section>\n	<header>\n		FINDINGS:\n	</header>\n	<p>\n		<label>LESION: </label>\n		<input type=\"text\" value=\"None.\">\n	</p>\n	<p>\n		<label>Cavernous Sinus Invasion: </label>\n		<select>\n			<option>None.</option>\n			<option>Present.</option>\n		</select>\n	</p>\n	<p>\n		<label>NATIVE GLAND: </label>\n		<select>\n			<option>Normal.</option>\n			<option>Not identified.</option>\n			<option>Identifiable within the [right/left/posterior/anterior] aspect of the sella.</option>\n		</select>\n	</p>\n	<p>\n		<label>Neurohypophysis: </label>\n		<select>\n			<option>Normal intrinsic T1 signal.</option>\n			<option>Not present.</option>\n		</select>\n	</p>\n	<p>\n		<label>PITUITARY INFUNDIBULUM: </label>\n		<select>\n			<option>Midline.</option>\n			<option>Rightward deviated.</option>\n			<option>Leftward deviated.</option>\n		</select>\n	</p>\n	<p>\n		<label>Infundibulum thickness: </label>\n		<input type=\"text\" value=\"Normal.\">\n	</p>\n	<p>\n		<label>OPTIC CHIASM: </label>\n		<select>\n			<option>Normal position.</option>\n			<option>Prefixed over tuberculum sellae.</option>\n			<option>Postfixed over dorsum sellae.</option>\n		</select>\n	</p>\n	<p>\n		<label>Chiasm signal: </label>\n		<input type=\"text\" value=\"Normal.\">\n	</p>\n	<p>\n		<label>VASCULATURE: </label>\n		<select>\n			<option>Normal caliber</option>\n			<option>Markedly ectatic.</option>\n		</select>\n	</p>\n	<p>\n		<label>Aberrant Vasculature: </label>\n		<select>\n			<option>No aberrant vasculature.</option>\n			<option>persistent trigeminal artery</option>\n		</select>\n	</p>\n	<p>\n		<label>Intercarotid Distance </label>\n		<input type=\"number\" value=\"\">\n		<label>mm (normal 12-30 mm).</label>\n	</p>\n	<p>\n		<label>SPHENOID SINUS PNEUMATIZATION: </label>\n		<select>\n			<option>Present anterior and inferior to the sella (most common).</option>\n			<option>Decreased (solely anterior).</option>\n			<option>Absent (conchal).</option>\n		</select>\n	</p>\n	<p>\n		<label>Intersphenoid Septum: </label>\n		<select>\n			<option>Midline.</option>\n			<option>Rightward.</option>\n			<option>Leftward.</option>\n			<option>Absent.</option>\n		</select>\n	</p>\n	<p>\n		<label>OTHER: </label>\n		<input type=\"text\" value=\"None.\">\n	</p>\n</section>\n<section>\n	<header>\n		IMPRESSION:\n	</header>\n	<p>\n		<textarea>Normal MRI of the sella.</textarea>\n	</p>\n</section>',NULL,NULL,NULL);

/*!40000 ALTER TABLE `report_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table reports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reports`;

CREATE TABLE `reports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `HL7_message` varchar(8192) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orthanc_uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `report_uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mrn` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accession_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telerad_contract` int DEFAULT NULL,
  `reader_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OperatorsName` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `newstatus` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oldstatus` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `htmlreport` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `template_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json_request_orthanc_add_pdf` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `updated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table RXNCONSO
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RXNCONSO`;

CREATE TABLE `RXNCONSO` (
  `RXCUI` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `LAT` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ENG',
  `TS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LUI` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STT` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SUI` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ISPREF` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RXAUI` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `SAUI` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SCUI` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SDUI` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SAB` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `TTY` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CODE` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `STR` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `SRL` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SUPPRESS` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CVF` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


# Dump of table shared_studies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shared_studies`;

CREATE TABLE `shared_studies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `shared_by` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shared_with` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `share_note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `StudyInstanceUID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `study_date` date DEFAULT NULL,
  `study_time` time DEFAULT NULL,
  `study_description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `patientid` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_birth_date` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_sex` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `accession_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referring_physician` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `institution` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indication` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `share_date` datetime DEFAULT NULL,
  `modalities` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagecount` smallint DEFAULT NULL,
  `RETIRED_OtherPatientIDs` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table specialties
# ------------------------------------------------------------

DROP TABLE IF EXISTS `specialties`;

CREATE TABLE `specialties` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `specialty` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cmscode` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `specialty` (`specialty`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `specialties` WRITE;
/*!40000 ALTER TABLE `specialties` DISABLE KEYS */;

INSERT INTO `specialties` (`id`, `specialty`, `cmscode`)
VALUES
	(1,'General practice','1'),
	(2,'General surgery','2'),
	(3,'Allergy/immunology','3'),
	(4,'Otolaryngology','4'),
	(5,'Anesthesiology','5'),
	(6,'Cardiology','6'),
	(7,'Dermatology','7'),
	(8,'Family practice','8'),
	(9,'Interventional pain management','9'),
	(10,'Gastroenterology','10'),
	(11,'Internal medicine','11'),
	(12,'Osteopathic manipulative medicine','12'),
	(13,'Neurology','13'),
	(14,'Neurosurgery','14'),
	(15,'Speech language pathologist in private practice','15'),
	(16,'Obstetrics/gynecology','16'),
	(17,'Hospice and palliative care','17'),
	(18,'Ophthalmology','18'),
	(19,'Oral surgery (dentists only)','19'),
	(20,'Orthopedic surgery','20'),
	(21,'Cardiac electrophysiology','21'),
	(22,'Pathology','22'),
	(23,'Sports medicine','23'),
	(24,'Plastic and reconstructive surgery','24'),
	(25,'Physical medicine and rehabilitation','25'),
	(26,'Psychiatry','26'),
	(27,'Geriatric psychiatry','27'),
	(28,'Colorectal surgery (formerly proctology)','28'),
	(29,'Pulmonary disease','29'),
	(30,'Diagnostic radiology','30'),
	(31,'Intensive cardiac rehabilitation','31'),
	(32,'Anesthesiologist assistant','32'),
	(33,'Thoracic surgery','33'),
	(34,'Urology','34'),
	(35,'Chiropractic','35'),
	(36,'Nuclear medicine','36'),
	(37,'Pediatric medicine','37'),
	(38,'Geriatric medicine','38'),
	(39,'Nephrology','39'),
	(40,'Hand surgery','40'),
	(41,'Optometry','41'),
	(42,'Certified nurse midwife','42'),
	(43,'Certified registered nurse anesthetist (CRNA) ','43'),
	(44,'Infectious disease','44'),
	(45,'Mammography screening center','45'),
	(46,'Endocrinology','46'),
	(47,'Independent diagnostic testing facility','47'),
	(48,'Podiatry','48'),
	(49,'Ambulatory surgical center','49'),
	(50,'Nurse practitioner','50'),
	(51,'Medical supply company with certified orthotist','51'),
	(52,'Medical supply company with certified prosthetist','52'),
	(53,'Medical supply company with certified prosthetist-orthotist','53'),
	(54,'Medical supply company not included in specialties 51-53','54'),
	(55,'Individual orthotic personnel certified by an accrediting organization','55'),
	(56,'Individual prosthetic personnel certified by an accrediting organization','56'),
	(57,'Individual prosthetic/orthotic personnel certified by an accrediting organization','57'),
	(58,'Medical supply company with registered pharmacist','58'),
	(59,'Ambulance service (private) ','59'),
	(60,'Public health or welfare agencies (federal, state, and local)','60'),
	(61,'Voluntary health or charitable agencies (e.g., National Cancer Society, National Heart Association, Catholic Charities)','61'),
	(62,'Psychologist (billing independently)','62'),
	(63,'Portable x-ray supplier (billing independently)','63'),
	(64,'Audiologist (billing independently)','64'),
	(65,'Physical therapist in private practice','65'),
	(66,'Rheumatology','66'),
	(67,'Occupational therapist in private practice','67'),
	(68,'Clinical psychologist ','68'),
	(69,'Clinical laboratory (billing independently)','69'),
	(70,'Single or Multi-specialty clinic or group practice (PA Group)','70'),
	(71,'Registered dietician/nutrition professional','71'),
	(72,'Pain management','72'),
	(73,'Mass immunization roster biller','73'),
	(74,'Radiation therapy center','74'),
	(76,'Peripheral vascular disease','76'),
	(77,'Vascular surgery','77'),
	(78,'Cardiac surgery','78'),
	(79,'Addiction medicine','79'),
	(80,'Licensed clinical social worker','80'),
	(81,'Critical care (intensivists)','81'),
	(82,'Hematology','82'),
	(83,'Hematology/oncology','83'),
	(84,'Preventive medicine','84'),
	(85,'Maxillofacial surgery','85'),
	(86,'Neuropsychiatry','86'),
	(87,'All other suppliers, e.g., drug stores','87'),
	(88,'Unknown provider','88'),
	(89,'Certified clinical nurse specialist','89'),
	(90,'Medical oncology','90'),
	(91,'Surgical oncology','91'),
	(92,'Radiation oncology','92'),
	(93,'Emergency medicine','93'),
	(94,'Interventional radiology','94'),
	(95,'Unknown supplier','95'),
	(96,'Optician','96'),
	(97,'Physician assistant','97'),
	(98,'Gynecological/oncology','98'),
	(99,'Unknown physician specialty','99'),
	(100,'Hospital','A0'),
	(101,'Skilled nursing facility','A1'),
	(102,'Intermediate care nursing facility','A2'),
	(103,'Nursing facility, other','A3'),
	(104,'Home health agency','A4'),
	(105,'Pharmacy','A5'),
	(106,'Medical supply company with respiratory therapist','A6'),
	(107,'Department store','A7'),
	(108,'Grocery store','A8'),
	(109,'Oxygen/Oxygen Related Equipment','B1'),
	(110,'Pedorthic personnel','B2'),
	(111,'Medical supply company with pedorthic personnel','B3'),
	(112,'Rehabilitation agency','B4'),
	(113,'Ocularist','B5'),
	(114,'Sleep medicine','C0'),
	(115,'Centralized flu','C1'),
	(116,'Indirect payment procedure','C2'),
	(117,'Interventional cardiology','C3'),
	(118,'Restricted use','C4'),
	(119,'Dentist','C5'),
	(120,'Hospitalist','C6'),
	(121,'Advanced heart failure and transplant cardiology','C7'),
	(122,'Medical toxicology','C8'),
	(123,'Hematopoietic cell transplantation and cellular therapy','C9'),
	(124,'Medicare Diabetes Prevention Program','D1'),
	(125,'Medical genetics and genomics','D3'),
	(126,'Undersea and Hyperbaric Medicine','D4'),
	(127,'Opioid Treatment Program','D5'),
	(128,'Home Infusion Therapy Services (effective October 1, 2020)','D6'),
	(129,'Micrographic Dermatologic Surgery (MDS) (effective October 1, 2020)','D7'),
	(130,'Adult Congenital Heart Disease (ACHD) (effective October 1, 2020)','D8');

/*!40000 ALTER TABLE `specialties` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table states
# ------------------------------------------------------------

DROP TABLE IF EXISTS `states`;

CREATE TABLE `states` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;

INSERT INTO `states` (`id`, `state`, `name`)
VALUES
	(1,'OS','Outside USA'),
	(2,'AL','Alabama'),
	(3,'AK','Alaska'),
	(4,'AZ','Arizona'),
	(5,'AR','Arkansas'),
	(6,'CA','California'),
	(7,'CO','Colorado'),
	(8,'CT','Connecticut'),
	(9,'DE','Delaware'),
	(10,'DC','District of Columbia'),
	(11,'FL','Florida'),
	(12,'GA','Georgia'),
	(13,'HI','Hawaii'),
	(14,'ID','Idaho'),
	(15,'IL','Illinois'),
	(16,'IN','Indiana'),
	(17,'IA','Iowa'),
	(18,'KS','Kansas'),
	(19,'KY','Kentucky'),
	(20,'LA','Louisiana'),
	(21,'ME','Maine'),
	(22,'MD','Maryland'),
	(23,'MA','Massachusetts'),
	(24,'MI','Michigan'),
	(25,'MN','Minnesota'),
	(26,'MS','Mississippi'),
	(27,'MO','Missouri'),
	(28,'MT','Montana'),
	(29,'NE','Nebraska'),
	(30,'NV','Nevada'),
	(31,'NH','New Hampshire'),
	(32,'NJ','New Jersey'),
	(33,'NM','New Mexico'),
	(34,'NY','New York'),
	(35,'NC','North Carolina'),
	(36,'ND','North Dakota'),
	(37,'OH','Ohio'),
	(38,'OK','Oklahoma'),
	(39,'OR','Oregon'),
	(40,'PA','Pennsylvania'),
	(41,'RI','Rhode Island'),
	(42,'SC','South Carolina'),
	(43,'SD','South Dakota'),
	(44,'TN','Tennessee'),
	(45,'TX','Texas'),
	(46,'UT','Utah'),
	(47,'VT','Vermont'),
	(48,'VA','Virginia'),
	(49,'WA','Washington'),
	(50,'WV','West Virginia'),
	(51,'WI','Wisconsin'),
	(52,'WY','Wyoming');

/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table study_locks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `study_locks`;

CREATE TABLE `study_locks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid_key` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table taxonomy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `taxonomy`;

CREATE TABLE `taxonomy` (
  `Code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Grouping` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Classification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Specialization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Definition` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `taxonomy` WRITE;
/*!40000 ALTER TABLE `taxonomy` DISABLE KEYS */;

INSERT INTO `taxonomy` (`Code`, `Grouping`, `Classification`, `Specialization`, `Definition`, `Notes`)
VALUES
	('101Y00000X','Behavioral Health & Social Service Providers','Counselor','','A provider who is trained and educated in the performance of behavior health services through interpersonal communications and analysis. Training and education at the specialty level usually requires a master\'s degree and clinical experience and supervision for licensure or certification.','Sources: Abridged from definitions provided by the National Board of Certified Counselors and the American Association of Pastoral Counselors.'),
	('101YA0400X','Behavioral Health & Social Service Providers','Counselor','Addiction (Substance Use Disorder)','Definition to come...',''),
	('101YM0800X','Behavioral Health & Social Service Providers','Counselor','Mental Health','Definition to come...',''),
	('101YP1600X','Behavioral Health & Social Service Providers','Counselor','Pastoral','Definition to come...',''),
	('101YP2500X','Behavioral Health & Social Service Providers','Counselor','Professional','Definition to come...',''),
	('101YS0200X','Behavioral Health & Social Service Providers','Counselor','School','Definition to come…',''),
	('102L00000X','Behavioral Health & Social Service Providers','Psychoanalyst','','\"Psychoanalysis is a comprehensive','theoretical framework which'),
	('102X00000X','Behavioral Health & Social Service Providers','Poetry Therapist','','\"A medical or mental health professional who has attained credentials after satisfactorily completing a poetry therapy training program approved by the National Federation for Biblio/Poetry Therapy (NFBPT). Training includes didactic work','peer group experience'),
	('103G00000X','Behavioral Health & Social Service Providers','Clinical Neuropsychologist','','A clinical psychologist who applies principles of assessment and intervention based upon the scientific study of human behavior as it relates to normal and abnormal functioning of the central nervous system. The specialty is dedicated to enhancing the understanding of brain-behavior relationships and the application of such knowledge to human problems.','\"Source:  American Psychological Association'),
	('103GC0700X','Behavioral Health & Social Service Providers','Clinical Neuropsychologist','Clinical','','\"[1/1/2007: marked inactive'),
	('103K00000X','Behavioral Health & Social Service Providers','Behavior Analyst','','\"A behavior analyst is qualified by at least a master\'s degree and Behavior Analyst Certification Board certification and/or a state-issued credential (such as a license) to practice behavior analysis independently. Behavior analysts provide the required supervision to assistant behavior analysts and behavior technicians. A behavior analyst delivers services consistent with the dimensions of applied behavior analysis. Common services may include','but are not limited to'),
	('103T00000X','Behavioral Health & Social Service Providers','Psychologist','','\"A psychologist is an individual who is licensed to practice psychology which is defined as the observation','description'),
	('103TA0400X','Behavioral Health & Social Service Providers','Psychologist','Addiction (Substance Use Disorder)','\"A psychologist with a proficiency that involves the application of psychological treatment of addiction stemming from the use of alcohol and other psychoactive substances (e.g.','nicotine'),
	('103TA0700X','Behavioral Health & Social Service Providers','Psychologist','Adult Development & Aging','\"A psychologist who specializes in geropsychology','which applies the knowledge and methods of psychology to understanding and helping older persons and their families to maintain well-being'),
	('103TB0200X','Behavioral Health & Social Service Providers','Psychologist','Cognitive & Behavioral','A psychologist who reflects an experimental-clinical approach distinguished by use of principles of human learning and development and theories of cognitive processing to promote meaningful change in maladaptive human behavior and thinking.','\"Source:  American Psychological Association'),
	('103TC0700X','Behavioral Health & Social Service Providers','Psychologist','Clinical','\"A psychologist who provides continuing and comprehensive mental and behavioral health care for individuals and families; consultation to agencies and communities; training','education and supervision; and research-based practice. It is a specialty in breadth -- one that is broadly inclusive of severe psychopathology -- and marked by comprehensiveness and integration of knowledge and skill from a broad array of disciplines within and outside of psychology proper. The scope of clinical psychology encompasses all ages'),
	('103TC1900X','Behavioral Health & Social Service Providers','Psychologist','Counseling','\"A psychologist who specializes in general practice and health service. It focuses on how people function both personally and in their relationships at all ages. Counseling psychology addresses the emotional','social'),
	('103TC2200X','Behavioral Health & Social Service Providers','Psychologist','Clinical Child & Adolescent','\"A psychologist who develops and applies scientific knowledge to the delivery of psychological services to infants','toddlers'),
	('103TE1000X','Behavioral Health & Social Service Providers','Psychologist','Educational','','[1/1/2007: marked inactive]'),
	('103TE1100X','Behavioral Health & Social Service Providers','Psychologist','Exercise & Sports','\"A psychologist with a proficiency in sports psychology that uses psychological knowledge and skills to address optimal performance and well-being of athletes','developmental and social aspects of sports participation'),
	('103TF0000X','Behavioral Health & Social Service Providers','Psychologist','Family','\"A psychologist whose specialty is founded on principles of systems theory with the interpersonal system of the family the focus of assessment','intervention and research.\"'),
	('103TF0200X','Behavioral Health & Social Service Providers','Psychologist','Forensic','A psychologist whose specialty is characterized by activities primarily intended to provide professional psychological expertise within the judicial and legal systems.','\"Source:  American Psychological Association'),
	('103TH0004X','Behavioral Health & Social Service Providers','Psychologist','Health','\"A psychologist who specializes in clinical health psychology that investigates and implements clinical services across diverse populations and settings to promote health and well-being and to prevent','treat'),
	('103TH0100X','Behavioral Health & Social Service Providers','Psychologist','Health Service','\"A psychologist','certified/licensed at the independent practice level in his/her state'),
	('103TM1700X','Behavioral Health & Social Service Providers','Psychologist','Men & Masculinity','','[1/1/2007: marked inactive]'),
	('103TM1800X','Behavioral Health & Social Service Providers','Psychologist','Mental Retardation & Developmental Disabilities','Definition to come...',''),
	('103TP0016X','Behavioral Health & Social Service Providers','Psychologist','Prescribing (Medical)','\"A licensed','doctoral-level psychologist authorized to prescribe and has undergone specialized education and training in preparation for prescriptive practice and has passed an examination accepted by the state board of psychology relevant to establishing competence for prescribing'),
	('103TP0814X','Behavioral Health & Social Service Providers','Psychologist','Psychoanalysis','\"A psychologist whose specialty is distinguished from other specialties by its body of knowledge and its intensive treatment approaches. It aims at structural changes and modifications of a person\'s personality. Psychoanalysis promotes awareness of unconscious','maladaptive and habitually recurrent patterns of emotion and behavior'),
	('103TP2700X','Behavioral Health & Social Service Providers','Psychologist','Psychotherapy','','[1/1/2007: marked inactive]'),
	('103TP2701X','Behavioral Health & Social Service Providers','Psychologist','Group Psychotherapy','\"A psychologist who specializes in group psychology and group psychotherapy that is an evidenced-based specialty that prepares group leaders to identify and capitalize on developmental and healing possibilities embedded in the interpersonal/intrapersonal functioning of individual group members as well as collectively for the group.  Emphasis is placed on the use of group dynamics to assist and treat individual group members.  The specialty is applicable to all age groups','children'),
	('103TR0400X','Behavioral Health & Social Service Providers','Psychologist','Rehabilitation','\"A psychologist who specializes in the study and application of psychological principles on behalf of persons who have disability due to injury or illness. Rehabilitation psychologists','often within teams'),
	('103TS0200X','Behavioral Health & Social Service Providers','Psychologist','School','\"A psychologist whose specialty is concerned with the science and practice of psychology with children','youth'),
	('103TW0100X','Behavioral Health & Social Service Providers','Psychologist','Women','','[1/1/2007: marked inactive]'),
	('104100000X','Behavioral Health & Social Service Providers','Social Worker','','\"A social worker is a person who is qualified by a Social Work degree','and licensed'),
	('1041C0700X','Behavioral Health & Social Service Providers','Social Worker','Clinical','\"A social worker who holds a master\'s or doctoral degree in social work from an accredited school of social work in addition to at least two years of post-master\'s supervised experience in a clinical setting. The social worker must be licensed','certified'),
	('1041S0200X','Behavioral Health & Social Service Providers','Social Worker','School','Definition to come…',''),
	('106E00000X','Behavioral Health & Social Service Providers','Assistant Behavior Analyst','','\"An assistant behavior analyst is qualified by Behavior Analyst Certification Board certification and/or a state-issued license or credential in behavior analysis to practice under the supervision of an appropriately credentialed professional behavior analyst. An assistant behavior analyst delivers services consistent with the dimensions of applied behavior analysis and supervision requirements defined in state laws or regulations and/or national certification standards. Common services may include','but are not limited to'),
	('106H00000X','Behavioral Health & Social Service Providers','Marriage & Family Therapist','','\"A marriage and family therapist is a person with a master\'s degree in marriage and family therapy','or a master\'s or doctoral degree in a related mental health field with substantially equivalent coursework in marriage and family therapy'),
	('106S00000X','Behavioral Health & Social Service Providers','Behavior Technician','','\"The behavior technician is a paraprofessional who practices under the close','ongoing supervision of a behavior analyst or assistant behavior analyst certified by the Behavior Analyst Certification Board and/or credentialed by a state (such as through licensure). The behavior technician is primarily responsible for the implementation of components of behavior-analytic treatment plans developed by the supervisor. That may include collecting data on treatment targets and conducting certain types of behavioral assessments (e.g.'),
	('111N00000X','Chiropractic Providers','Chiropractor','','\"A provider qualified by a Doctor of Chiropractic (D.C.)','licensed by the State and who practices chiropractic medicine -that discipline within the healing arts which deals with the nervous system and its relationship to the spinal column and its interrelationship with other body systems.\"'),
	('111NI0013X','Chiropractic Providers','Chiropractor','Independent Medical Examiner','\"A special evaluator not involved with the medical care of the individual examinee that impartially evaluates the care being provided by other practitioners to clarify clinical','disability'),
	('111NI0900X','Chiropractic Providers','Chiropractor','Internist','\"The chiropractic internist may serve as a primary care physician or may see patients referred from other providers for evaluation and co-management. Evaluation is focused on the early detection of functional','nutritional'),
	('111NN0400X','Chiropractic Providers','Chiropractor','Neurology','\"Chiropractic Neurology is defined as the field of functional neurology that engages the internal - and external environment of the individual in a structured and targeted approach to affect positive changes in the nervous system and consequently the physiology and behavior of an individual. Chiropractic Neurologists are board-certified specialists in non-drug','non-surgical care for those with neurologically based health problems. There are many conditions people suffer from that are in this broad category: learning and attention disorders'),
	('111NN1001X','Chiropractic Providers','Chiropractor','Nutrition','\"Chiropractic Nutrition is that specialty within the chiropractic profession that deals with the overall factors that affect the patient\'s ability to maintain the manipulative correction and thus sustain better neurological integrity. The Chiropractic Nutrition Specialist will perform extensive research on the patient\'s previous health history','ethnicity'),
	('111NP0017X','Chiropractic Providers','Chiropractor','Pediatric Chiropractor','\"The Pediatric Chiropractor is a chiropractor with specialized','advanced training and certification in the evaluation'),
	('111NR0200X','Chiropractic Providers','Chiropractor','Radiology','\"Chiropractic radiology is a referral specialty that provides consultation services at the request of other qualified doctors. Chiropractic radiologists provide consultation in health care facilities (private offices','hospitals and teaching institutions) to meet the needs of referring doctors and their patients. The quality of the consultative services by the chiropractic radiologist in independent practice is reflected by the quality of their professional credentials. Chiropractic radiologists recommend'),
	('111NR0400X','Chiropractic Providers','Chiropractor','Rehabilitation','\"Rehabilitation is the discipline focused on restoring a patient\'s functional abilities to pre-injury or pre-disease status. Functional abilities are defined as those activities in one\'s daily life','work'),
	('111NS0005X','Chiropractic Providers','Chiropractor','Sports Physician','\"A sports chiropractor is uniquely trained to provide care and treatment of injuries or illness resulting from sports and physical fitness activities.  Doctors of Chiropractic with the Diplomate American Chiropractic Board of Sports Physicians (DACBSP) or the Certified Chiropractic Sports Physician (CCSP)','sport specialty certifications from the American Chiropractic Board of Sports Physicians'),
	('111NT0100X','Chiropractic Providers','Chiropractor','Thermography','Definition to come...',''),
	('111NX0100X','Chiropractic Providers','Chiropractor','Occupational Health','\"Occupational Health is that specialty within the chiropractic profession that deals with the prevention and management of work related injuries. It also considers and assists clients with State and Federal Compliance assistance. Occupational Health goes much farther than simply treating injured workers however. This may mean working with clients to promote optimum safety and ergonomic principles','interacting with the injured worker to promote safety and prevent future injuries'),
	('111NX0800X','Chiropractic Providers','Chiropractor','Orthopedic','\"Chiropractic Orthopedics is defined as that branch of chiropractic medicine that includes the continued acquisition of knowledge relative to both normal functions and diseases of the human body as they relate to the bones','joints'),
	('122300000X','Dental Providers','Dentist','','\"A dentist is a person qualified by a doctorate in dental surgery (D.D.S.) or dental medicine (D.M.D.)','licensed by the state to practice dentistry'),
	('1223D0001X','Dental Providers','Dentist','Dental Public Health','\"The science and art of preventing and controlling dental diseases and promoting dental health through organized community efforts.  It is that form of dental practice that serves the community as a patient rather than the individual.  It is concerned with the dental health education of the public','with applied dental research'),
	('1223D0004X','Dental Providers','Dentist','Dentist Anesthesiologist','\"A dentist who has successfully completed an accredited postdoctoral anesthesiology residency training program for dentists of two or more years duration','in accord with Commission on Dental Accreditation\'s Standards for Dental Anesthesiology Residency Programs'),
	('1223E0200X','Dental Providers','Dentist','Endodontics','\"The branch of dentistry that is concerned with the morphology','physiology and pathology of the human dental pulp and periradicular tissues.  Its study and practice encompass the basic and clinical sciences including biology of the normal pulp'),
	('1223G0001X','Dental Providers','Dentist','General Practice','\"A general dentist is the primary dental care provider for patients of all ages. The general dentist is responsible for the diagnosis','treatment'),
	('1223P0106X','Dental Providers','Dentist','Oral and Maxillofacial Pathology','\"The specialty of dentistry and discipline of pathology that deals with the nature','identification'),
	('1223P0221X','Dental Providers','Dentist','Pediatric Dentistry','\"An age-defined specialty that provides both primary and comprehensive preventive and therapeutic oral health care for infants and children through adolescence','including those with special health care needs.\"'),
	('1223P0300X','Dental Providers','Dentist','Periodontics','\"That specialty of dentistry which encompasses the prevention','diagnosis and treatment of diseases of the supporting and surrounding tissues of the teeth or their substitutes and the maintenance of the health'),
	('1223P0700X','Dental Providers','Dentist','Prosthodontics','\"That branch of dentistry pertaining to the restoration and maintenance of oral functions','comfort'),
	('1223S0112X','Dental Providers','Dentist','Oral and Maxillofacial Surgery','\"The specialty of dentistry which includes the diagnosis','surgical and adjunctive treatment of diseases'),
	('1223X0008X','Dental Providers','Dentist','Oral and Maxillofacial Radiology','\"The specialty of dentistry and discipline of radiology concerned with the production and interpretation of images and data produced by all modalities of radiant energy that are used for the diagnosis and management of diseases','disorders and conditions of the oral and maxillofacial region.\"'),
	('1223X0400X','Dental Providers','Dentist','Orthodontics and Dentofacial Orthopedics','\"That area of dentistry concerned with the supervision','guidance and correction of the growing or mature dentofacial structures'),
	('1223X2210X','Dental Providers','Dentist','Orofacial Pain','\"A dentist who assesses','diagnoses'),
	('122400000X','Dental Providers','Denturist','','Definition to come.',''),
	('124Q00000X','Dental Providers','Dental Hygienist','','\"An individual who has completed an accredited dental hygiene education program','and an individual who has been licensed by a state board of dental examiners to provide preventive care services under the supervision of a dentist.  Functions that may be legally delegated to the dental hygienist vary based on the needs of the dentist'),
	('125J00000X','Dental Providers','Dental Therapist','','\"A Dental Therapist is an individual who has completed an accredited or non-accredited dental therapy program and who has been authorized by the relevant state board or a tribal entity to provide services within the scope of their practice under the supervision of a dentist. Functions that may be delegated to the dental therapist vary based on the needs of the dentist','the educational preparation of the dental therapist and state dental practice acts and regulations.\"'),
	('125K00000X','Dental Providers','Advanced Practice Dental Therapist','','\"An Advanced Practice Dental Therapist is:<br/>(1) A dental therapist who has completed additional training beyond basic dental therapy education and provides dental services in accordance with state advanced practice dental therapist laws or statutes; or<br/>(2) A dental hygienist with a graduate degree in advanced dental therapy prepared for independent and interdependent decision making and direct accountability for clinical judgment across the dental health care continuum.<br/><br/>The individual has been authorized by the relevant state board or a tribal entity to provide services under the remote supervision of a dentist. The functions of the advanced practice dental therapist vary based on the needs of the dentist','the educational preparation of the advanced practice dental therapist and state dental practice acts and regulations.\"'),
	('125Q00000X','Dental Providers','Oral Medicinist','','\"A dentist with advanced training specializing in the recognition and treatment of oral conditions resulting from the interrelationship between oral disease and systemic health. The Oral Medicinist manages clinical and non-surgical treatment of non-dental pathologies affecting the oral and maxillofacial region','such as cancer'),
	('126800000X','Dental Providers','Dental Assistant','','\"An individual who may or may not have completed an accredited dental assisting education program and who aids the dentist in providing patient care services and performs other nonclinical duties in the dental office or other patient care facility.  The scope of the patient care functions that may be legally delegated to the dental assistant varies based on the needs of the dentist the educational preparation of the dental assistant and state dental practice acts and regulations.  Patient care services are provided under the supervision of a dentist.  To avoid misleading the public','no occupational title other than dental assistant should be used to describe this dental auxiliary.\"'),
	('126900000X','Dental Providers','Dental Laboratory Technician','','\"An individual who has the skill and knowledge in the fabrication of dental appliances','prostheses and devices in accordance with a dentist\'s laboratory work authorization.  To avoid misleading the public'),
	('132700000X','Dietary & Nutritional Service Providers','Dietary Manager','','\"A dietary manager is a trained food services professional who is charged with maintaining cost/profit objectives','purchasing foods and services for the department and supervising staff.. Dietary managers are trained to understand the basic nutritional needs of clients and work in partnership with dietitians'),
	('133N00000X','Dietary & Nutritional Service Providers','Nutritionist','','\"A specialist in adapting and applying food and nutrient knowledge to the solution of food and nutritional problems','the control of disease'),
	('133NN1002X','Dietary & Nutritional Service Providers','Nutritionist','\"Nutrition','Education\"','Definition to come...'),
	('133V00000X','Dietary & Nutritional Service Providers','\"Dietitian','Registered\"','','\"A Registered Dietitian (RD)/Registered Dietitian Nutritionist (RDN) is an individual uniquely trained in the science of nutrition and practice of dietetics to design and provide medical nutrition therapy (MNT) and other evidence-based applications of the Nutrition Care Process (NCP) that exemplify the profession\'s systematic approach to providing high quality nutrition care. Registered dietitians provide MNT for the purpose of disease prevention or management'),
	('133VN1004X','Dietary & Nutritional Service Providers','\"Dietitian','Registered\"','\"Nutrition','Pediatric\"'),
	('133VN1005X','Dietary & Nutritional Service Providers','\"Dietitian','Registered\"','\"Nutrition','Renal\"'),
	('133VN1006X','Dietary & Nutritional Service Providers','\"Dietitian','Registered\"','\"Nutrition','Metabolic\"'),
	('133VN1101X','Dietary & Nutritional Service Providers','\"Dietitian','Registered\"','\"Nutrition','Gerontological\"'),
	('133VN1201X','Dietary & Nutritional Service Providers','\"Dietitian','Registered\"','\"Nutrition','Obesity and Weight Management\"'),
	('133VN1301X','Dietary & Nutritional Service Providers','\"Dietitian','Registered\"','\"Nutrition','Oncology\"'),
	('133VN1401X','Dietary & Nutritional Service Providers','\"Dietitian','Registered\"','\"Nutrition','Pediatric Critical Care\"'),
	('133VN1501X','Dietary & Nutritional Service Providers','\"Dietitian','Registered\"','\"Nutrition','Sports Dietetics\"'),
	('136A00000X','Dietary & Nutritional Service Providers','\"Dietetic Technician','Registered\"','','\"A Dietetic Technician'),
	('146D00000X','Emergency Medical Service Providers','Personal Emergency Response Attendant','','\"Individuals that are specially trained to assist patients living at home with urgent/emergent situations.  These individuals must be able to perform CPR and basic first aid and have sufficient counseling skills to allay fears and assist in working through processes necessary to resolve the crisis.  Functions may include transportation to various facilities and businesses','contacting agencies to initiate remediation service or providing reassurance.\"'),
	('146L00000X','Emergency Medical Service Providers','\"Emergency Medical Technician','Paramedic\"','','\"An EMT'),
	('146M00000X','Emergency Medical Service Providers','\"Emergency Medical Technician','Intermediate\"','','An Intermediate EMT is an individual trained and certified to perform intermediate life support treatment in medical emergencies based on individual state boards.'),
	('146N00000X','Emergency Medical Service Providers','\"Emergency Medical Technician','Basic\"','','A Basic EMT is an individual trained and certified to perform basic life support treatment in medical emergencies based on individual state boards.'),
	('152W00000X','Eye and Vision Services Providers','Optometrist','','\"Doctors of optometry (ODs) are the primary health care professionals for the eye.  Optometrists examine','diagnose'),
	('152WC0802X','Eye and Vision Services Providers','Optometrist','Corneal and Contact Management','\"The professional activities performed by an Optometrist related to the fitting of contact lenses to an eye','ongoing evaluation of the cornea\'s ability to sustain successful contact lens wear'),
	('152WL0500X','Eye and Vision Services Providers','Optometrist','Low Vision Rehabilitation','\"Optometrists who specialize in low-vision care having training to assess visual function','prescribe low-vision devices'),
	('152WP0200X','Eye and Vision Services Providers','Optometrist','Pediatrics','\"Optometrists who work in Pediatrics are concerned with the prevention','development'),
	('152WS0006X','Eye and Vision Services Providers','Optometrist','Sports Vision','\"An optometrist who offers services designed to care for unique vision care needs of athletes','which may include one of more of the following services:  corrective vision care unique to a specific sporting environment; protective eyewear for the prevention of sports-related injuries; vision enhancement - which may include vision therapy and techniques to improve visual skills specific to the athlete\'s sport.\"'),
	('152WV0400X','Eye and Vision Services Providers','Optometrist','Vision Therapy','\"Optometrists who specialize in vision therapy as a treatment process used to improve vision function. It includes a broad range of developmental and rehabilitative treatment programs individually prescribed to remediate specific sensory','motor and/or visual perceptual dysfunctions.\"'),
	('152WX0102X','Eye and Vision Services Providers','Optometrist','Occupational Vision','\"Optometrists who work in Occupational Vision','the branch of environmental optometry'),
	('156F00000X','Eye and Vision Services Providers','Technician/Technologist','','A broad category grouping different kinds of technologists and technicians. See individual definitions.',''),
	('156FC0800X','Eye and Vision Services Providers','Technician/Technologist','Contact Lens','\"An optician or other ancillary support staff person who','where authorized by state law and trained or certified to do so'),
	('156FC0801X','Eye and Vision Services Providers','Technician/Technologist','Contact Lens Fitter','\"An optician or other ancillary support staff person who','where authorized by state law and trained or certified to do so'),
	('156FX1100X','Eye and Vision Services Providers','Technician/Technologist','Ophthalmic','Definition to come...',''),
	('156FX1101X','Eye and Vision Services Providers','Technician/Technologist','Ophthalmic Assistant','Definition to come...',''),
	('156FX1201X','Eye and Vision Services Providers','Technician/Technologist','Optometric Assistant','Definition to come...',''),
	('156FX1202X','Eye and Vision Services Providers','Technician/Technologist','Optometric Technician','Definition to come...',''),
	('156FX1700X','Eye and Vision Services Providers','Technician/Technologist','Ocularist','Definition to come...',''),
	('156FX1800X','Eye and Vision Services Providers','Technician/Technologist','Optician','Definition to come...',''),
	('156FX1900X','Eye and Vision Services Providers','Technician/Technologist','Orthoptist','Definition to come...',''),
	('163W00000X','Nursing Service Providers','Registered Nurse','','\"(1) A registered nurse is a person qualified by graduation from an accredited nursing school (depending upon schooling','a registered nurse may receive either a diploma from a hospital program'),
	('163WA0400X','Nursing Service Providers','Registered Nurse','Addiction (Substance Use Disorder)','Definition to come...',''),
	('163WA2000X','Nursing Service Providers','Registered Nurse','Administrator','Definition to come...',''),
	('163WC0200X','Nursing Service Providers','Registered Nurse','Critical Care Medicine','Definition to come...',''),
	('163WC0400X','Nursing Service Providers','Registered Nurse','Case Management','Definition to come...',''),
	('163WC1400X','Nursing Service Providers','Registered Nurse','College Health','Definition to come...',''),
	('163WC1500X','Nursing Service Providers','Registered Nurse','Community Health','Definition to come...',''),
	('163WC1600X','Nursing Service Providers','Registered Nurse','Continuing Education/Staff Development','Definition to come...',''),
	('163WC2100X','Nursing Service Providers','Registered Nurse','Continence Care','Definition to come...',''),
	('163WC3500X','Nursing Service Providers','Registered Nurse','Cardiac Rehabilitation','Definition to come...',''),
	('163WD0400X','Nursing Service Providers','Registered Nurse','Diabetes Educator','Definition to come...',''),
	('163WD1100X','Nursing Service Providers','Registered Nurse','\"Dialysis','Peritoneal\"','Definition to come...'),
	('163WE0003X','Nursing Service Providers','Registered Nurse','Emergency','Definition to come...',''),
	('163WE0900X','Nursing Service Providers','Registered Nurse','Enterostomal Therapy','Definition to come...',''),
	('163WF0300X','Nursing Service Providers','Registered Nurse','Flight','Definition to come...',''),
	('163WG0000X','Nursing Service Providers','Registered Nurse','General Practice','Definition to come...',''),
	('163WG0100X','Nursing Service Providers','Registered Nurse','Gastroenterology','Definition to come...',''),
	('163WG0600X','Nursing Service Providers','Registered Nurse','Gerontology','Definition to come...',''),
	('163WH0200X','Nursing Service Providers','Registered Nurse','Home Health','Definition to come...',''),
	('163WH0500X','Nursing Service Providers','Registered Nurse','Hemodialysis','Definition to come...',''),
	('163WH1000X','Nursing Service Providers','Registered Nurse','Hospice','Definition to come...',''),
	('163WI0500X','Nursing Service Providers','Registered Nurse','Infusion Therapy','Definition to come...',''),
	('163WI0600X','Nursing Service Providers','Registered Nurse','Infection Control','Definition to come...',''),
	('163WL0100X','Nursing Service Providers','Registered Nurse','Lactation Consultant','Definition to come...',''),
	('163WM0102X','Nursing Service Providers','Registered Nurse','Maternal Newborn','Definition to come...',''),
	('163WM0705X','Nursing Service Providers','Registered Nurse','Medical-Surgical','Definition to come...',''),
	('163WM1400X','Nursing Service Providers','Registered Nurse','Nurse Massage Therapist (NMT)','Definition to come...',''),
	('163WN0002X','Nursing Service Providers','Registered Nurse','Neonatal Intensive Care','Definition to come...',''),
	('163WN0003X','Nursing Service Providers','Registered Nurse','\"Neonatal','Low-Risk\"','Definition to come...'),
	('163WN0300X','Nursing Service Providers','Registered Nurse','Nephrology','Definition to come...',''),
	('163WN0800X','Nursing Service Providers','Registered Nurse','Neuroscience','Definition to come...',''),
	('163WN1003X','Nursing Service Providers','Registered Nurse','Nutrition Support','Definition to come...',''),
	('163WP0000X','Nursing Service Providers','Registered Nurse','Pain Management','Definition to come...',''),
	('163WP0200X','Nursing Service Providers','Registered Nurse','Pediatrics','Definition to come...',''),
	('163WP0218X','Nursing Service Providers','Registered Nurse','Pediatric Oncology','Definition to come...',''),
	('163WP0807X','Nursing Service Providers','Registered Nurse','\"Psychiatric/Mental Health','Child & Adolescent\"','Definition to come...'),
	('163WP0808X','Nursing Service Providers','Registered Nurse','Psychiatric/Mental Health','Definition to come...',''),
	('163WP0809X','Nursing Service Providers','Registered Nurse','\"Psychiatric/Mental Health','Adult\"','Definition to come...'),
	('163WP1700X','Nursing Service Providers','Registered Nurse','Perinatal','Definition to come...',''),
	('163WP2201X','Nursing Service Providers','Registered Nurse','Ambulatory Care','Definition to come...',''),
	('163WR0006X','Nursing Service Providers','Registered Nurse','Registered Nurse First Assistant','\"A perioperative registered nurse who works in collaboration with the surgeon and other health care team members to achieve optimal outcomes.  The RNFA has acquired the necessary knowledge','judgment'),
	('163WR0400X','Nursing Service Providers','Registered Nurse','Rehabilitation','Definition to come…',''),
	('163WR1000X','Nursing Service Providers','Registered Nurse','Reproductive Endocrinology/Infertility','Definition to come...',''),
	('163WS0121X','Nursing Service Providers','Registered Nurse','Plastic Surgery','Definition to come...',''),
	('163WS0200X','Nursing Service Providers','Registered Nurse','School','Definition to come…',''),
	('163WU0100X','Nursing Service Providers','Registered Nurse','Urology','Definition to come...',''),
	('163WW0000X','Nursing Service Providers','Registered Nurse','Wound Care','Definition to come...',''),
	('163WW0101X','Nursing Service Providers','Registered Nurse','\"Women\'s Health Care','Ambulatory\"','Definition to come...'),
	('163WX0002X','Nursing Service Providers','Registered Nurse','\"Obstetric','High-Risk\"','Definition to come...'),
	('163WX0003X','Nursing Service Providers','Registered Nurse','\"Obstetric','Inpatient\"','Definition to come...'),
	('163WX0106X','Nursing Service Providers','Registered Nurse','Occupational Health','Definition to come...',''),
	('163WX0200X','Nursing Service Providers','Registered Nurse','Oncology','Definition to come...',''),
	('163WX0601X','Nursing Service Providers','Registered Nurse','Otorhinolaryngology & Head-Neck','Definition to come...',''),
	('163WX0800X','Nursing Service Providers','Registered Nurse','Orthopedic','Definition to come...',''),
	('163WX1100X','Nursing Service Providers','Registered Nurse','Ophthalmic','Definition to come...',''),
	('163WX1500X','Nursing Service Providers','Registered Nurse','Ostomy Care','Definition to come...',''),
	('164W00000X','Nursing Service Providers','Licensed Practical Nurse','','\"An individual with post-high school vocational training and practical experience in the provision of nursing care at a level less than that required for certification as a Registered Nurse. Requirements for education','experience'),
	('164X00000X','Nursing Service Providers','Licensed Vocational Nurse','','\"An individual with post-high school vocational training and practical experience in the provision of nursing care at a level less than that required for certification as a Registered Nurse. [An alternate term for licensed practical nurse arising from difference in occupational titles between states and post-high school training programs and institutions.] Requirements for education','experience'),
	('167G00000X','Nursing Service Providers','Licensed Psychiatric Technician','','\"An individual licensed by the state board as a Psychiatric Technician based upon completion of a prescribed course of theory and clinical practice','with two thirds of the clinical practice time focused on mental and developmental disorders.  The psychiatric technician practices under the direct supervision of a physician'),
	('170100000X','Other Service Providers','\"Medical Genetics','Ph.D. Medical Genetics\"','','\"A medical geneticist works in association with a medical specialist'),
	('170300000X','Other Service Providers','\"Genetic Counselor','MS\"','','\"A masters trained health care provider who collects and interprets genetic family histories; assesses the risk of disease occurrence or recurrence; identifies interventions to manage or ameliorate disease risk; educates about inheritance'),
	('171000000X','Other Service Providers','Military Health Care Provider','','\"Active duty military health care providers not otherwise classified who need to be separately identified for operational','clinical'),
	('1710I1002X','Other Service Providers','Military Health Care Provider','Independent Duty Corpsman','A Navy Independent Duty Corpsman (IDC) is an active duty Sailor who has successfully completed one of the Navy\'s specific IDC training programs.  IDCs are formally trained and educated to perform primary medical care and minor surgical services in a variety of health care and non-health care settings worldwide under indirect physician supervision.  IDCs provide care to Department of Defense operational forces and other supporting forces such as contractors and foreign nationals.','\"Source:  Bureau of Medicine and Surgery'),
	('1710I1003X','Other Service Providers','Military Health Care Provider','Independent Duty Medical Technicians','\"An Independent Duty Medical Technician (IDMT) is specially trained and educated to perform primary medical care','minor surgical services'),
	('171100000X','Other Service Providers','Acupuncturist','','\"An acupuncturist is a person who performs ancient therapy for alleviation of pain','anesthesia and treatment of some diseases. Acupuncturists use long'),
	('171M00000X','Other Service Providers','Case Manager/Care Coordinator','','\"A person who provides case management services and assists an individual in gaining access to needed medical','social'),
	('171R00000X','Other Service Providers','Interpreter','','An Interpreter is a person who translates oral communication between two or more people.  This includes translating from one language to another or interpreting sign language.  An interpreter is necessary for medical care when the patient does not speak the language of the health care provider or when the patient has a disability involving spoken language.','Source:  National Medicaid EDI HIPAA NPI Sub Work Group [7/1/2006: new]'),
	('171W00000X','Other Service Providers','Contractor','','\"A person who contracts to supply certain materials or do certain work for a stipulated sum; esp.','one whose business is contracting work in any of the building trades. For purposes of the taxonomy'),
	('171WH0202X','Other Service Providers','Contractor','Home Modifications','Definition to come...',''),
	('171WV0202X','Other Service Providers','Contractor','Vehicle Modifications','A contractor who makes modifications to private vehicles to accommodate a health condition.',''),
	('172A00000X','Other Service Providers','Driver','','A person employed to operate a motor vehicle as a carrier of persons or property.',''),
	('172M00000X','Other Service Providers','Mechanotherapist','','\"A practitioner of mechanotherapy examines patients by verbal inquiry','examination of the musculoskeletal system by hand'),
	('172P00000X','Other Service Providers','Naprapath','','Naprapathy means a branch of medicine that focuses on the evaluation and treatment of neuron-muscular conditions.  Doctors of naprapathy are connective tissue specialists.  Education and training are defined through individual states\' licensing/certification requirements.','Source:  National Uniform Claim Committee [1/1/2007: new]'),
	('172V00000X','Other Service Providers','Community Health Worker','','\"Community health workers (CHW) are lay members of communities who work either for pay or as volunteers in association with the local health care system in both urban and rural environments and usually share ethnicity','language'),
	('173000000X','Other Service Providers','Legal Medicine','','\"The specialty areas of medicine concerned with matters of','and relations with'),
	('173C00000X','Other Service Providers','Reflexologist','','\"Reflexologists perform a non-invasive complementary modality involving thumb and finger techniques to apply alternating pressure to the reflexes within the reflex maps of the body located on the feet','hands'),
	('173F00000X','Other Service Providers','\"Sleep Specialist','PhD\"','','\"Sleep medicine is a clinical specialty with a focus on clinical problems that require accurate diagnosis and treatment. The knowledge base of sleep medicine is derived from many disciplines including neuroanatomy'),
	('174200000X','Other Service Providers','Meals','','A public or privately owned facility providing meals to individuals traveling long distances or receiving prolonged outpatient medical services away from home.','Source:  SD DSS Non-Emergency Medical Transportation program Transportation Services [7/1/2010: new]'),
	('174400000X','Other Service Providers','Specialist','','An individual educated and trained in an applied knowledge discipline used in the performance of work at a level requiring knowledge and skills beyond or apart from that provided by a general education or liberal arts degree.','\"Source: Expanded from Webster\'s II New Riverside University Dictionary'),
	('1744G0900X','Other Service Providers','Specialist','Graphics Designer','Definition to come...',''),
	('1744P3200X','Other Service Providers','Specialist','Prosthetics Case Management','Definition to come...',''),
	('1744R1102X','Other Service Providers','Specialist','Research Study','Definition to come...',''),
	('1744R1103X','Other Service Providers','Specialist','Research Data Abstracter/Coder','Definition to come...',''),
	('174H00000X','Other Service Providers','Health Educator','','\"Health educators work in a variety of settings providing education to individuals or groups of individuals on healthy behaviors','wellness'),
	('174M00000X','Other Service Providers','Veterinarian','','\"A doctor of veterinary medicine','trained and authorized to practice veterinarian medicine and surgery.\"'),
	('174MM1900X','Other Service Providers','Veterinarian','Medical Research','Definition to come...',''),
	('174N00000X','Other Service Providers','\"Lactation Consultant','Non-RN\"','','An individual trained to provide breastfeeding assistance services to both mothers and infants. Lactation Consultants are not required to be nurses and are trained through specific courses of education. The Lactation Consultant may have additional certification through a national or international organization.'),
	('174V00000X','Other Service Providers','Clinical Ethicist','','\"A clinical ethicist has been trained in bioethics and ethics case consultation.  The clinical ethicist addresses medical-ethical dilemmas arising in clinical practice','such as end-of-life care'),
	('175F00000X','Other Service Providers','Naturopath','','\"Diagnoses','treats'),
	('175L00000X','Other Service Providers','Homeopath','','A provider who is educated and trained in a system of therapeutics in which diseases are treated by drugs which are capable of producing in healthy persons symptoms like those of the disease to be treated. Treatment requires administering a drug in minute doses.','\"Source: Dorland\'s Illustrated Medical Dictionary. 26th edition. Philadelphia: W.B. Saunders Company'),
	('175M00000X','Other Service Providers','\"Midwife','Lay\"','','\"A person qualified by experience and limited specialized training to provide obstetric and neo-natal care in the management of women having normal pregnancy'),
	('175T00000X','Other Service Providers','Peer Specialist','','\"Individuals certified to perform peer support services through a training process defined by a government agency','such as the Department of Veterans Affairs or a state mental health department/certification/licensing authority.\"'),
	('176B00000X','Other Service Providers','Midwife','','\"A Midwife is a trained professional with special expertise in supporting women to maintain a healthy pregnancy birth','offering expert individualized care'),
	('176P00000X','Other Service Providers','Funeral Director','','\"A person','usually an embalmer'),
	('177F00000X','Other Service Providers','Lodging','','A public or privately owned facility providing overnight lodging to individuals traveling long distances or receiving prolonged outpatient medical services away from home.',''),
	('183500000X','Pharmacy Service Providers','Pharmacist','','\"An individual licensed by the appropriate state regulatory agency to engage in the practice of pharmacy.  The practice of pharmacy includes','but is not limited to'),
	('1835C0205X','Pharmacy Service Providers','Pharmacist','Critical Care','\"A licensed pharmacist who has demonstrated specialized knowledge and skill in the delivery of patient care services by pharmacists','as integral members of interprofessional teams'),
	('1835G0000X','Pharmacy Service Providers','Pharmacist','General Practice','','\"[1/1/2006: marked inactive'),
	('1835G0303X','Pharmacy Service Providers','Pharmacist','Geriatric','\"A pharmacist who is certified in geriatric pharmacy practice is designated as a \"\"Certified Geriatric Pharmacist\"\" (CGP).  To become certified','candidates are expected to be knowledgeable about principles of geriatric pharmacotherapy and the provision of pharmaceutical care to the elderly.\"'),
	('1835N0905X','Pharmacy Service Providers','Pharmacist','Nuclear','\"A licensed pharmacist who has demonstrated specialized knowledge and skill in procurement','compounding'),
	('1835N1003X','Pharmacy Service Providers','Pharmacist','Nutrition Support','\"A licensed pharmacist who has demonstrated specialized knowledge and skill in maintenance and/or restoration of optimal nutritional status','designing and modifying treatment according to patient needs.\"'),
	('1835P0018X','Pharmacy Service Providers','Pharmacist','Pharmacist Clinician (PhC)/ Clinical Pharmacy Specialist','\"Pharmacist Clinician/Clinical Pharmacy Specialist is a pharmacist with additional training and an expanded scope of practice that may include prescriptive authority','therapeutic management'),
	('1835P0200X','Pharmacy Service Providers','Pharmacist','Pediatrics','A licensed pharmacist who has demonstrated specialized knowledge and skill in the delivery of patient care services by pharmacists that ensures the safe and effective use of medications for all children from neonates through adolescents.','\"Source: Board of Pharmacy Specialties'),
	('1835P1200X','Pharmacy Service Providers','Pharmacist','Pharmacotherapy','\"A licensed pharmacist who has demonstrated specialized knowledge and skill in optimizing pharmacotherapeutic care of patients','by developing'),
	('1835P1300X','Pharmacy Service Providers','Pharmacist','Psychiatric','\"A licensed pharmacist who has demonstrated specialized knowledge and skill in optimizing care of patients with psychiatric illness by assessing and monitoring patients','recognizing drug-induced problems'),
	('1835P2201X','Pharmacy Service Providers','Pharmacist','Ambulatory Care','\"A licensed pharmacist who has demonstrated specialized knowledge and skill in the provision of integrated','accessible health care services by pharmacists and is accountable for addressing medication needs'),
	('1835X0200X','Pharmacy Service Providers','Pharmacist','Oncology','\"A licensed pharmacist who has demonstrated specialized knowledge and skill in developing','recommending'),
	('183700000X','Pharmacy Service Providers','Pharmacy Technician','','A person who works under the direct supervision of a licensed pharmacist and performs many pharmacy-related functions that do not require the professional judgment of a pharmacist.','\"Source: Pharmacy Technician Certification Board'),
	('193200000X','Group','Multi-Specialty','','\"A business group of one or more individual practitioners','who practice with different areas of specialization.\"'),
	('193400000X','Group','Single Specialty','','\"A business group of one or more individual practitioners','all of who practice with the same area of specialization.\"'),
	('202C00000X','Allopathic & Osteopathic Physicians','Independent Medical Examiner','','\"A special evaluator not involved with the medical care of the individual examinee that impartially evaluates the care being provided by other practitioners to clarify clinical','disability'),
	('202K00000X','Allopathic & Osteopathic Physicians','Phlebology','','\"Phlebology is the medical discipline that involves the diagnosis and treatment of venous disorders','including spider veins'),
	('204C00000X','Allopathic & Osteopathic Physicians','\"Neuromusculoskeletal Medicine','Sports Medicine\"','','Definition to come.'),
	('204D00000X','Allopathic & Osteopathic Physicians','Neuromusculoskeletal Medicine & OMM','','\"The Neuromusculoskeletal Medicine and Osteopathic Manipulative Medicine physician directs special attention to the neuromusculoskeletal system and its interaction with other body systems. Neuromusculoskeletal Medicine and Osteopathic Manipulative Medicine encompasses increased knowledge and understanding of osteopathic principles and practice and heightened technical skills of osteopathic manipulative medicine','and integrates each of these into the management of pediatric'),
	('204E00000X','Allopathic & Osteopathic Physicians','Oral & Maxillofacial Surgery','','\"Oral and maxillofacial surgeons are trained to recognize and treat a wide spectrum of diseases','injuries and defects in the head'),
	('204F00000X','Allopathic & Osteopathic Physicians','Transplant Surgery','','Definition to come.',''),
	('204R00000X','Allopathic & Osteopathic Physicians','Electrodiagnostic Medicine','','\"Electrodiagnostic medicine is the medical subspecialty that applies neurophysiologic techniques to diagnose','evaluate'),
	('207K00000X','Allopathic & Osteopathic Physicians','Allergy & Immunology','','\"An allergist-immunologist is trained in evaluation','physical and laboratory diagnosis'),
	('207KA0200X','Allopathic & Osteopathic Physicians','Allergy & Immunology','Allergy','Definition to come...',''),
	('207KI0005X','Allopathic & Osteopathic Physicians','Allergy & Immunology','Clinical & Laboratory Immunology','Definition to come...',''),
	('207L00000X','Allopathic & Osteopathic Physicians','Anesthesiology','','\"An anesthesiologist is trained to provide pain relief and maintenance','or restoration'),
	('207LA0401X','Allopathic & Osteopathic Physicians','Anesthesiology','Addiction Medicine','An anesthesiologist who specializes in the diagnosis and treatment of addictions.','\"Source: National Uniform Claim Committee'),
	('207LC0200X','Allopathic & Osteopathic Physicians','Anesthesiology','Critical Care Medicine','\"An anesthesiologist','who specializes in critical care medicine diagnoses'),
	('207LH0002X','Allopathic & Osteopathic Physicians','Anesthesiology','Hospice and Palliative Medicine','\"An anesthesiologist with special knowledge and skills to prevent and relieve the suffering experienced by patients with life-limiting illnesses. This specialist works with an interdisciplinary hospice or palliative care team to maximize quality of life while addressing physical','psychological'),
	('207LP2900X','Allopathic & Osteopathic Physicians','Anesthesiology','Pain Medicine','\"An anesthesiologist who provides a high level of care','either as a primary physician or consultant'),
	('207LP3000X','Allopathic & Osteopathic Physicians','Anesthesiology','Pediatric Anesthesiology','\"An anesthesiologist who has had additional skill and experience in and is primarily concerned with the anesthesia','sedation'),
	('207N00000X','Allopathic & Osteopathic Physicians','Dermatology','','\"A dermatologist is trained to diagnose and treat pediatric and adult patients with benign and malignant disorders of the skin','mouth'),
	('207ND0101X','Allopathic & Osteopathic Physicians','Dermatology','MOHS-Micrographic Surgery','\"The highly-trained surgeons that perform Mohs Micrographic Surgery are specialists both in dermatology and pathology. With their extensive knowledge of the skin and unique pathological skills','they are able to remove only diseased tissue'),
	('207ND0900X','Allopathic & Osteopathic Physicians','Dermatology','Dermatopathology','\"A dermatopathologist has the expertise to diagnose and monitor diseases of the skin including infectious','immunologic'),
	('207NI0002X','Allopathic & Osteopathic Physicians','Dermatology','Clinical & Laboratory Dermatological Immunology','A dermatologist who utilizes various specialized laboratory procedures to diagnose disorders characterized by defective responses of the body\'s immune system. Immunodermatologists also may provide consultation in the management of these disorders and administer specialized forms of therapy for these diseases.','\"Source: American Board of Medical Specialties'),
	('207NP0225X','Allopathic & Osteopathic Physicians','Dermatology','Pediatric Dermatology','\"A pediatric dermatologist has','through additional special training'),
	('207NS0135X','Allopathic & Osteopathic Physicians','Dermatology','Procedural Dermatology','\"Procedural Dermatology','a subspecialty of Dermatology'),
	('207P00000X','Allopathic & Osteopathic Physicians','Emergency Medicine','','\"An emergency physician focuses on the immediate decision making and action necessary to prevent death or any further disability both in the pre-hospital setting by directing emergency medical technicians and in the emergency department. The emergency physician provides immediate recognition','evaluation'),
	('207PE0004X','Allopathic & Osteopathic Physicians','Emergency Medicine','Emergency Medical Services','\"An emergency medicine physician who specializes in non-hospital based emergency medical services (e.g.','disaster site'),
	('207PE0005X','Allopathic & Osteopathic Physicians','Emergency Medicine','Undersea and Hyperbaric Medicine','\"A specialist who treats decompression illness and diving accident cases and uses hyperbaric oxygen therapy to treat such conditions as carbon monoxide poisoning','gas gangrene'),
	('207PH0002X','Allopathic & Osteopathic Physicians','Emergency Medicine','Hospice and Palliative Medicine','\"An emergency medicine physician with special knowledge and skills to prevent and relieve the suffering experienced by patients with life-limiting illnesses. This specialist works with an interdisciplinary hospice or palliative care team to maximize quality of life while addressing physical','psychological'),
	('207PP0204X','Allopathic & Osteopathic Physicians','Emergency Medicine','Pediatric Emergency Medicine','Pediatric Emergency Medicine is a clinical subspecialty that focuses on the care of the acutely ill or injured child in the setting of an emergency department.','\"Source: American Board of Medical Specialties'),
	('207PS0010X','Allopathic & Osteopathic Physicians','Emergency Medicine','Sports Medicine','\"An emergency physician with special knowledge in sports medicine is responsible for continuous care in the field of sports medicine','not only for the enhancement of health and fitness'),
	('207PT0002X','Allopathic & Osteopathic Physicians','Emergency Medicine','Medical Toxicology','\"Medical toxicologists are physicians who specialize in the prevention','evaluation'),
	('207Q00000X','Allopathic & Osteopathic Physicians','Family Medicine','','\"Family Medicine is the medical specialty which is concerned with the total health care of the individual and the family. It is the specialty in breadth which integrates the biological','clinical'),
	('207QA0000X','Allopathic & Osteopathic Physicians','Family Medicine','Adolescent Medicine','\"A family medicine physician with multidisciplinary training in the unique physical','psychological and social characteristics of adolescents and their health care problems and needs.\"'),
	('207QA0401X','Allopathic & Osteopathic Physicians','Family Medicine','Addiction Medicine','A family medicine physician who specializes in the diagnosis and treatment of addictions.','\"Source: National Uniform Claim Committee'),
	('207QA0505X','Allopathic & Osteopathic Physicians','Family Medicine','Adult Medicine','Definition to come.',''),
	('207QB0002X','Allopathic & Osteopathic Physicians','Family Medicine','Obesity Medicine','\"A physician who specializes in the treatment of obesity demonstrates competency in and a thorough understanding of the treatment of obesity and the genetic','biologic'),
	('207QG0300X','Allopathic & Osteopathic Physicians','Family Medicine','Geriatric Medicine','\"A family medicine physician with special knowledge of the aging process and special skills in the diagnostic','therapeutic'),
	('207QH0002X','Allopathic & Osteopathic Physicians','Family Medicine','Hospice and Palliative Medicine','\"A family medicine physician with special knowledge and skills to prevent and relieve the suffering experienced by patients with life-limiting illnesses. This specialist works with an interdisciplinary hospice or palliative care team to maximize quality of life while addressing physical','psychological'),
	('207QS0010X','Allopathic & Osteopathic Physicians','Family Medicine','Sports Medicine','\"A family medicine physician that is trained to be responsible for continuous care in the field of sports medicine','not only for the enhancement of health and fitness'),
	('207QS1201X','Allopathic & Osteopathic Physicians','Family Medicine','Sleep Medicine','\"A Family Medicine Physician who practices Sleep Medicine is certified in the subspecialty of sleep medicine and specializes in the clinical assessment','physiologic testing'),
	('207R00000X','Allopathic & Osteopathic Physicians','Internal Medicine','','\"A physician who provides long-term','comprehensive care in the office and the hospital'),
	('207RA0000X','Allopathic & Osteopathic Physicians','Internal Medicine','Adolescent Medicine','\"An internist who specializes in adolescent medicine is a multi-disciplinary healthcare specialist trained in the unique physical','psychological and social characteristics of adolescents'),
	('207RA0001X','Allopathic & Osteopathic Physicians','Internal Medicine','Advanced Heart Failure and Transplant Cardiology','\"Specialists in Advanced Heart Failure and Transplant Cardiology would participate in the inpatient and outpatient management of patients with advanced heart failure across the spectrum from consideration for high-risk cardiac surgery','cardiac transplantation'),
	('207RA0002X','Allopathic & Osteopathic Physicians','Internal Medicine','Adult Congenital Heart Disease','\"A physician who specializes in the care and treatment of adults with congenital heart disease. Adult congenital heart disease (ACHD) physicians are trained to understand the complexities of congenital heart disease','anatomy'),
	('207RA0201X','Allopathic & Osteopathic Physicians','Internal Medicine','Allergy & Immunology','An internist doctor of osteopathy that specializes in the treatment of allergy and immunologic disorders.  A doctor of osteopathy that is board eligible/certified by the American Osteopathic Board of Internal Medicine can obtain a Certificate of Special Qualifications in the field of Allergy & Immunology.','\"Source: American Osteopathic Board of Internal Medicine'),
	('207RA0401X','Allopathic & Osteopathic Physicians','Internal Medicine','Addiction Medicine','An internist doctor of osteopathy that specializes in the treatment of addiction disorders.  A doctor of osteopathy that is board eligible/certified by the American Osteopathic Board of Internal Medicine can obtain a Certificate of Added Qualifications in the field of Addiction Medicine.','\"Source: American Osteopathic Board of Internal Medicine'),
	('207RB0002X','Allopathic & Osteopathic Physicians','Internal Medicine','Obesity Medicine','\"A physician who specializes in the treatment of obesity demonstrates competency in and a thorough understanding of the treatment of obesity and the genetic','biologic'),
	('207RC0000X','Allopathic & Osteopathic Physicians','Internal Medicine','Cardiovascular Disease','\"An internist who specializes in diseases of the heart and blood vessels and manages complex cardiac conditions such as heart attacks and life-threatening','abnormal heartbeat rhythms.\"'),
	('207RC0001X','Allopathic & Osteopathic Physicians','Internal Medicine','Clinical Cardiac Electrophysiology','\"A field of special interest within the subspecialty of cardiovascular disease','specialty of Internal Medicine'),
	('207RC0200X','Allopathic & Osteopathic Physicians','Internal Medicine','Critical Care Medicine','\"An internist who diagnoses','treats and supports patients with multiple organ dysfunction. This specialist may have administrative responsibilities for intensive care units and may also facilitate and coordinate patient care among the primary physician'),
	('207RE0101X','Allopathic & Osteopathic Physicians','Internal Medicine','\"Endocrinology','Diabetes & Metabolism\"','\"An internist who concentrates on disorders of the internal (endocrine) glands such as the thyroid and adrenal glands. This specialist also deals with disorders such as diabetes'),
	('207RG0100X','Allopathic & Osteopathic Physicians','Internal Medicine','Gastroenterology','\"An internist who specializes in diagnosis and treatment of diseases of the digestive organs including the stomach','bowels'),
	('207RG0300X','Allopathic & Osteopathic Physicians','Internal Medicine','Geriatric Medicine','\"An internist who has special knowledge of the aging process and special skills in the diagnostic','therapeutic'),
	('207RH0000X','Allopathic & Osteopathic Physicians','Internal Medicine','Hematology','\"An internist with additional training who specializes in diseases of the blood','spleen and lymph. This specialist treats conditions such as anemia'),
	('207RH0002X','Allopathic & Osteopathic Physicians','Internal Medicine','Hospice and Palliative Medicine','\"An internal medicine physician with special knowledge and skills to prevent and relieve the suffering experienced by patients with life-limiting illnesses. This specialist works with an interdisciplinary hospice or palliative care team to maximize quality of life while addressing physical','psychological'),
	('207RH0003X','Allopathic & Osteopathic Physicians','Internal Medicine','Hematology & Oncology','An internist doctor of osteopathy that specializes in the treatment of the combination of hematology and oncology disorders.  A doctor of osteopathy that is board eligible/certified by the American Osteopathic Board of Internal Medicine WAS able to obtain a Certificate of Special Qualifications in the field of Hematology and Oncology.  The Certificate is NO longer offered.','\"Source: American Osteopathic Board of Internal Medicine'),
	('207RH0005X','Allopathic & Osteopathic Physicians','Internal Medicine','Hypertension Specialist','A Hypertension Specialist is a physician who concentrates on all aspects of the diagnosis and treatment of hypertension.','\"Source:  American Society of Hypertension'),
	('207RI0001X','Allopathic & Osteopathic Physicians','Internal Medicine','Clinical & Laboratory Immunology','An internal medicine physician who specializes in clinical and laboratory immunology disease management.','\"Source: National Uniform Claim Committee'),
	('207RI0008X','Allopathic & Osteopathic Physicians','Internal Medicine','Hepatology','\"The discipline of Hepatology encompasses the structure','function'),
	('207RI0011X','Allopathic & Osteopathic Physicians','Internal Medicine','Interventional Cardiology','\"An area of medicine within the subspecialty of cardiology','which uses specialized imaging and other diagnostic techniques to evaluate blood flow and pressure in the coronary arteries and chambers of the heart and uses technical procedures and medications to treat abnormalities that impair the function of the cardiovascular system.\"'),
	('207RI0200X','Allopathic & Osteopathic Physicians','Internal Medicine','Infectious Disease','An internist who deals with infectious diseases of all types and in all organ systems. Conditions requiring selective use of antibiotics call for this special skill. This physician often diagnoses and treats AIDS patients and patients with fevers which have not been explained. Infectious disease specialists may also have expertise in preventive medicine and travel medicine.','\"Source: American Board of Medical Specialties'),
	('207RM1200X','Allopathic & Osteopathic Physicians','Internal Medicine','Magnetic Resonance Imaging (MRI)','Definition to come.',''),
	('207RN0300X','Allopathic & Osteopathic Physicians','Internal Medicine','Nephrology','\"An internist who treats disorders of the kidney','high blood pressure'),
	('207RP1001X','Allopathic & Osteopathic Physicians','Internal Medicine','Pulmonary Disease','\"An internist who treats diseases of the lungs and airways. The pulmonologist diagnoses and treats cancer','pneumonia'),
	('207RR0500X','Allopathic & Osteopathic Physicians','Internal Medicine','Rheumatology','\"An internist who treats diseases of joints','muscle'),
	('207RS0010X','Allopathic & Osteopathic Physicians','Internal Medicine','Sports Medicine','\"An internist trained to be responsible for continuous care in the field of sports medicine','not only for the enhancement of health and fitness'),
	('207RS0012X','Allopathic & Osteopathic Physicians','Internal Medicine','Sleep Medicine','\"An Internist who practices Sleep Medicine is certified in the subspecialty of sleep medicine and specializes in the clinical assessment','physiologic testing'),
	('207RT0003X','Allopathic & Osteopathic Physicians','Internal Medicine','Transplant Hepatology','An internist with special knowledge and the skill required of a gastroenterologist to care for patients prior to and following hepatic transplantation that spans all phases of liver transplantation. Selection of appropriate recipients requires assessment by a team having experience in evaluating the severity and prognosis of patients with liver disease.','\"Source: American Board of Medical Specialties'),
	('207RX0202X','Allopathic & Osteopathic Physicians','Internal Medicine','Medical Oncology','An internist who specializes in the diagnosis and treatment of all types of cancer and other benign and malignant tumors. This specialist decides on and administers therapy for these malignancies as well as consults with surgeons and radiotherapists on other treatments for cancer.','\"Source: American Board of Medical Specialties'),
	('207SC0300X','Allopathic & Osteopathic Physicians','Medical Genetics','Clinical Cytogenetics','\"A clinical cytogeneticist demonstrates competence in providing laboratory diagnostic and clinical interpretive services dealing with cellular components','particularly chromosomes'),
	('207SG0201X','Allopathic & Osteopathic Physicians','Medical Genetics','Clinical Genetics (M.D.)','\"A clinical geneticist demonstrates competence in providing comprehensive diagnostic','management and counseling services for genetic disorders.\"'),
	('207SG0202X','Allopathic & Osteopathic Physicians','Medical Genetics','Clinical Biochemical Genetics','A clinical biochemical geneticist demonstrates competence in performing and interpreting biochemical analyses relevant to the diagnosis and management of human genetic diseases and is a consultant regarding laboratory diagnosis of a broad range of inherited disorders.','\"Source: American Board of Medical Specialties'),
	('207SG0203X','Allopathic & Osteopathic Physicians','Medical Genetics','Clinical Molecular Genetics','A clinical molecular geneticist demonstrates competence in performing and interpreting molecular analyses relevant to the diagnosis and management of human genetic diseases and is a consultant regarding laboratory diagnosis of a broad range of inherited disorders.','\"Source: American Board of Medical Specialties'),
	('207SG0205X','Allopathic & Osteopathic Physicians','Medical Genetics','Ph.D. Medical Genetics','\"A medical geneticist works in association with a medical specialist','is affiliated with a clinical genetics program and serves as a consultant to medical and dental specialists.\"'),
	('207SM0001X','Allopathic & Osteopathic Physicians','Medical Genetics','Molecular Genetic Pathology','\"A board certified subspecialty','the molecular genetic pathologist is expert in the principles'),
	('207T00000X','Allopathic & Osteopathic Physicians','Neurological Surgery','','\"A neurological surgeon provides the operative and non-operative management (i.e.','prevention'),
	('207U00000X','Allopathic & Osteopathic Physicians','Nuclear Medicine','','\"A nuclear medicine specialist employs the properties of radioactive atoms and molecules in the diagnosis and treatment of disease and in research. Radiation detection and imaging instrument systems are used to detect disease as it changes the function and metabolism of normal cells','tissues and organs. A wide variety of diseases can be found in this way'),
	('207UN0901X','Allopathic & Osteopathic Physicians','Nuclear Medicine','Nuclear Cardiology','A nuclear medicine physician who specializes in nuclear cardiology.','\"Source: National Uniform Claim Committee'),
	('207UN0902X','Allopathic & Osteopathic Physicians','Nuclear Medicine','Nuclear Imaging & Therapy','A nuclear medicine physician who specializes in nuclear imaging and therapy.','\"Source: National Uniform Claim Committee'),
	('207UN0903X','Allopathic & Osteopathic Physicians','Nuclear Medicine','In Vivo & In Vitro Nuclear Medicine','A nuclear medicine physician who specializes in in vivo and in vitro nuclear medicine.','\"Source: National Uniform Claim Committee'),
	('207V00000X','Allopathic & Osteopathic Physicians','Obstetrics & Gynecology','','\"An obstetrician/gynecologist possesses special knowledge','skills and professional capability in the medical and surgical care of the female reproductive system and associated disorders. This physician serves as a consultant to other physicians and as a primary physician for women.\"'),
	('207VB0002X','Allopathic & Osteopathic Physicians','Obstetrics & Gynecology','Obesity Medicine','\"A physician who specializes in the treatment of obesity demonstrates competency in and a thorough understanding of the treatment of obesity and the genetic','biologic'),
	('207VC0200X','Allopathic & Osteopathic Physicians','Obstetrics & Gynecology','Critical Care Medicine','\"An obstetrician/gynecologist','who specializes in critical care medicine diagnoses'),
	('207VE0102X','Allopathic & Osteopathic Physicians','Obstetrics & Gynecology','Reproductive Endocrinology','An obstetrician/gynecologist who is capable of managing complex problems relating to reproductive endocrinology and infertility.','\"Source: American Board of Medical Specialties'),
	('207VF0040X','Allopathic & Osteopathic Physicians','Obstetrics & Gynecology','Female Pelvic Medicine and Reconstructive Surgery','\"A subspecialist in Female Pelvic Medicine and Reconstructive Surgery is a physician in Urology or Obstetrics and Gynecology who','by virtue of education and training'),
	('207VG0400X','Allopathic & Osteopathic Physicians','Obstetrics & Gynecology','Gynecology','Definition to come...',''),
	('207VH0002X','Allopathic & Osteopathic Physicians','Obstetrics & Gynecology','Hospice and Palliative Medicine','\"An obstetrician/gynecologist with special knowledge and skills to prevent and relieve the suffering experienced by patients with life-limiting illnesses. This specialist works with an interdisciplinary hospice or palliative care team to maximize quality of life while addressing physical','psychological'),
	('207VM0101X','Allopathic & Osteopathic Physicians','Obstetrics & Gynecology','Maternal & Fetal Medicine','\"An obstetrician/gynecologist who cares for','or provides consultation on'),
	('207VX0000X','Allopathic & Osteopathic Physicians','Obstetrics & Gynecology','Obstetrics','Definition to come...',''),
	('207VX0201X','Allopathic & Osteopathic Physicians','Obstetrics & Gynecology','Gynecologic Oncology','\"An obstetrician/gynecologist who provides consultation and comprehensive management of patients with gynecologic cancer','including those diagnostic and therapeutic procedures necessary for the total care of the patient with gynecologic cancer and resulting complications.\"'),
	('207W00000X','Allopathic & Osteopathic Physicians','Ophthalmology','','\"An ophthalmologist has the knowledge and professional skills needed to provide comprehensive eye and vision care. Ophthalmologists are medically trained to diagnose','monitor and medically or surgically treat all ocular and visual disorders. This includes problems affecting the eye and its component structures'),
	('207WX0009X','Allopathic & Osteopathic Physicians','Ophthalmology','Glaucoma Specialist','An ophthalmologist who specializes in the treatment of glaucoma and other disorders related to increased intraocular pressure and optic nerve damage.  This specialty involves the medical and surgical treatment of these conditions.','\"Source: American Academy of Ophthalmology'),
	('207WX0107X','Allopathic & Osteopathic Physicians','Ophthalmology','Retina Specialist','An ophthalmologist who specializes in the diagnosis and treatment of vitreoretinal diseases.','\"Source: American Society of Retina Specialists'),
	('207WX0108X','Allopathic & Osteopathic Physicians','Ophthalmology','Uveitis and Ocular Inflammatory Disease','\"An ophthalmologist who specializes in the treatment of intraocular inflammation','scleritis'),
	('207WX0109X','Allopathic & Osteopathic Physicians','Ophthalmology','Neuro-ophthalmology','\"A neuro-ophthalmologist is a subspecialist of ophthalmology.  This physician evaluates','treats'),
	('207WX0110X','Allopathic & Osteopathic Physicians','Ophthalmology','Pediatric Ophthalmology and Strabismus Specialist','\"An ophthalmologist who specializes in pediatric ophthalmology and strabismus management. The subspecialty includes the medical and surgical management of eye disorders found in children. Some of the more common disorders include amblyopia','strabismus'),
	('207WX0120X','Allopathic & Osteopathic Physicians','Ophthalmology','Cornea and External Diseases Specialist','\"An ophthalmologist who specializes in diseases of the cornea','sclera'),
	('207WX0200X','Allopathic & Osteopathic Physicians','Ophthalmology','Ophthalmic Plastic and Reconstructive Surgery','\"A physician who specializes in oculofacial plastic and reconstructive surgery. This subspecialty combines orbital and periocular surgery with facial plastic surgery','and includes aesthetic and reconstructive surgery of the face'),
	('207X00000X','Allopathic & Osteopathic Physicians','Orthopaedic Surgery','','\"An orthopaedic surgeon is trained in the preservation','investigation and restoration of the form and function of the extremities'),
	('207XP3100X','Allopathic & Osteopathic Physicians','Orthopaedic Surgery','Pediatric Orthopaedic Surgery','\"An orthopedic surgeon who has additional training and experience in diagnosing','treating and managing musculoskeletal problems in infants'),
	('207XS0106X','Allopathic & Osteopathic Physicians','Orthopaedic Surgery','Hand Surgery','\"An orthopaedic surgeon trained in the investigation','preservation and restoration by medical'),
	('207XS0114X','Allopathic & Osteopathic Physicians','Orthopaedic Surgery','Adult Reconstructive Orthopaedic Surgery','\"Recognized by several state medical boards as a fellowship subspecialty program of orthopaedic surgery','adult reconstructive orthopaedic surgeons deal with reconstructive procedures such as joint arthroplasty (i.e.'),
	('207XS0117X','Allopathic & Osteopathic Physicians','Orthopaedic Surgery','Orthopaedic Surgery of the Spine','\"Recognized by several state medical boards as a fellowship subspecialty program of orthopaedic surgery','orthopaedic surgeons of the spine deal with the evaluation and nonoperative and operative treatment of the full spectrum of primary spinal disorders including trauma'),
	('207XX0004X','Allopathic & Osteopathic Physicians','Orthopaedic Surgery','Foot and Ankle Surgery','\"Recognized by several state medical boards as a fellowship subspecialty program of orthopaedic surgery','foot and ankle surgeons deal with adult reconstructive foot and ankle surgery'),
	('207XX0005X','Allopathic & Osteopathic Physicians','Orthopaedic Surgery','Sports Medicine','\"An orthopaedic surgeon trained in sports medicine provides appropriate care for all structures of the musculoskeletal system directly affected by participation in sporting activity. This specialist is proficient in areas including conditioning','training and fitness'),
	('207XX0801X','Allopathic & Osteopathic Physicians','Orthopaedic Surgery','Orthopaedic Trauma','\"Recognized by several state medical boards as a fellowship subspecialty program of orthopaedic surgery','orthopaedic trauma surgeons deal with the evaluation and management of acute orthopaedic injuries'),
	('207Y00000X','Allopathic & Osteopathic Physicians','Otolaryngology','','\"An otolaryngologist-head and neck surgeon provides comprehensive medical and surgical care for patients with diseases and disorders that affect the ears','nose'),
	('207YP0228X','Allopathic & Osteopathic Physicians','Otolaryngology','Pediatric Otolaryngology','\"A pediatric otolaryngologist has special expertise in the management of infants and children with disorders that include congenital and acquired conditions involving the aerodigestive tract','nose and paranasal sinuses'),
	('207YS0012X','Allopathic & Osteopathic Physicians','Otolaryngology','Sleep Medicine','\"An Otolaryngologist who practices Sleep Medicine is certified in the subspecialty of sleep medicine and specializes in the clinical assessment','physiologic testing'),
	('207YS0123X','Allopathic & Osteopathic Physicians','Otolaryngology','Facial Plastic Surgery','An otolaryngologist who specializes in facial plastic surgery.','\"Source: National Uniform Claim Committee'),
	('207YX0007X','Allopathic & Osteopathic Physicians','Otolaryngology','Plastic Surgery within the Head & Neck','\"An otolaryngologist with additional training in plastic and reconstructive procedures within the head','face'),
	('207YX0602X','Allopathic & Osteopathic Physicians','Otolaryngology','Otolaryngic Allergy','An otolaryngologist who specializes in the diagnosis and treatment of otolaryngic allergies and other allergic diseases.','\"Source: National Uniform Claim Committee'),
	('207YX0901X','Allopathic & Osteopathic Physicians','Otolaryngology','Otology & Neurotology','\"An otolaryngologist who treats diseases of the ear and temporal bone','including disorders of hearing and balance. The additional training in otology and neurotology emphasizes the study of embryology'),
	('207YX0905X','Allopathic & Osteopathic Physicians','Otolaryngology','Otolaryngology/Facial Plastic Surgery','An otolaryngologist who specializes in the diagnosis and surgical treatment of head and neck conditions.','\"Source: National Uniform Claim Committee'),
	('207ZB0001X','Allopathic & Osteopathic Physicians','Pathology','Blood Banking & Transfusion Medicine','\"A physician who specializes in blood banking/transfusion medicine is responsible for the maintenance of an adequate blood supply','blood donor and patient-recipient safety and appropriate blood utilization. Pre-transfusion compatibility testing and antibody testing assure that blood transfusions'),
	('207ZC0006X','Allopathic & Osteopathic Physicians','Pathology','Clinical Pathology','\"A pathologist deals with the causes and nature of disease and contributes to diagnosis','prognosis and treatment through knowledge gained by the laboratory application of the biologic'),
	('207ZC0008X','Allopathic & Osteopathic Physicians','Pathology','Clinical Informatics','\"Physicians who practice Clinical Informatics collaborate with other health care and information technology professionals to analyze','design'),
	('207ZC0500X','Allopathic & Osteopathic Physicians','Pathology','Cytopathology','\"A cytopathologist is an anatomic pathologist trained in the diagnosis of human disease by means of the study of cells obtained from body secretions and fluids','by scraping'),
	('207ZD0900X','Allopathic & Osteopathic Physicians','Pathology','Dermatopathology','\"A dermatopathologist is an expert in diagnosing and monitoring diseases of the skin including infectious','immunologic'),
	('207ZF0201X','Allopathic & Osteopathic Physicians','Pathology','Forensic Pathology','\"A forensic pathologist is expert in investigating and evaluating cases of sudden','unexpected'),
	('207ZH0000X','Allopathic & Osteopathic Physicians','Pathology','Hematology','\"A hematopathologist is expert in diseases that affect blood cells','blood clotting mechanisms'),
	('207ZI0100X','Allopathic & Osteopathic Physicians','Pathology','Immunopathology','A pathologist who specializes in the diagnosis of immunologic diseases.','\"Source: National Uniform Claim Committee'),
	('207ZM0300X','Allopathic & Osteopathic Physicians','Pathology','Medical Microbiology','\"A medical microbiologist is expert in the isolation and identification of microbial agents that cause infectious disease. Viruses','bacteria and fungi'),
	('207ZN0500X','Allopathic & Osteopathic Physicians','Pathology','Neuropathology','\"A neuropathologist is expert in the diagnosis of diseases of the nervous system and skeletal muscles and functions as a consultant primarily to neurologists and neurosurgeons. The neuropathologist is knowledgeable in the infirmities of humans as they affect the nervous and neuromuscular systems','be they degenerative'),
	('207ZP0007X','Allopathic & Osteopathic Physicians','Pathology','Molecular Genetic Pathology','\"A molecular genetic pathologist is expert in the principles','theory and technologies of molecular biology and molecular genetics. This expertise is used to make or confirm diagnoses of Mendelian genetic disorders'),
	('207ZP0101X','Allopathic & Osteopathic Physicians','Pathology','Anatomic Pathology','\"A pathologist deals with the causes and nature of disease and contributes to diagnosis','prognosis and treatment through knowledge gained by the laboratory application of the biologic'),
	('207ZP0102X','Allopathic & Osteopathic Physicians','Pathology','Anatomic Pathology & Clinical Pathology','\"A pathologist deals with the causes and nature of disease and contributes to diagnosis','prognosis and treatment through knowledge gained by the laboratory application of the biologic'),
	('207ZP0104X','Allopathic & Osteopathic Physicians','Pathology','Chemical Pathology','\"A chemical pathologist has expertise in the biochemistry of the human body as it applies to the understanding of the cause and progress of disease. This physician functions as a clinical consultant in the diagnosis and treatment of human disease. Chemical pathology entails the application of biochemical data to the detection','confirmation or monitoring of disease.\"'),
	('207ZP0105X','Allopathic & Osteopathic Physicians','Pathology','Clinical Pathology/Laboratory Medicine','\"A pathologist deals with the causes and nature of disease and contributes to diagnosis','prognosis and treatment through knowledge gained by the laboratory application of the biologic'),
	('207ZP0213X','Allopathic & Osteopathic Physicians','Pathology','Pediatric Pathology','\"A pediatric pathologist is expert in the laboratory diagnosis of diseases that occur during fetal growth','infancy and child development. The practice requires a strong foundation in general pathology and substantial understanding of normal growth and development'),
	('208000000X','Allopathic & Osteopathic Physicians','Pediatrics','','\"A pediatrician is concerned with the physical','emotional and social health of children from birth to young adulthood. Care encompasses a broad spectrum of health services ranging from preventive healthcare to the diagnosis and treatment of acute and chronic diseases. A pediatrician deals with biological'),
	('2080A0000X','Allopathic & Osteopathic Physicians','Pediatrics','Adolescent Medicine','\"A pediatrician who specializes in adolescent medicine is a multi-disciplinary healthcare specialist trained in the unique physical','psychological and social characteristics of adolescents'),
	('2080B0002X','Allopathic & Osteopathic Physicians','Pediatrics','Obesity Medicine','\"A physician who specializes in the treatment of obesity demonstrates competency in and a thorough understanding of the treatment of obesity and the genetic','biologic'),
	('2080C0008X','Allopathic & Osteopathic Physicians','Pediatrics','Child Abuse Pediatrics','\"A Child Abuse Pediatrician serves as a resource to children','families and communities by accurately diagnosing abuse; consulting with community agencies on child safety; providing expertise in courts of law; treating consequences of abuse and neglect; directing child abuse and neglect prevention programs and participating on multidisciplinary teams investigating; and managing child abuse cases. \"'),
	('2080H0002X','Allopathic & Osteopathic Physicians','Pediatrics','Hospice and Palliative Medicine','\"A pediatrician with special knowledge and skills to prevent and relieve the suffering experienced by patients with life-limiting illnesses. This specialist works with an interdisciplinary hospice or palliative care team to maximize quality of life while addressing physical','psychological'),
	('2080I0007X','Allopathic & Osteopathic Physicians','Pediatrics','Clinical & Laboratory Immunology','A pediatrician who specializes in clinical and laboratory immunology disease management.','\"Source: National Uniform Claim Committee'),
	('2080N0001X','Allopathic & Osteopathic Physicians','Pediatrics','Neonatal-Perinatal Medicine','A pediatrician who is the principal care provider for sick newborn infants. Clinical expertise is used for direct patient care and for consulting with obstetrical colleagues to plan for the care of mothers who have high-risk pregnancies.','\"Source: American Board of Medical Specialties'),
	('2080P0006X','Allopathic & Osteopathic Physicians','Pediatrics','Developmental - Behavioral Pediatrics','\"A developmental-behavioral specialist is a pediatrician with special training and experience who aims to foster understanding and promotion of optimal development of children and families through research','education'),
	('2080P0008X','Allopathic & Osteopathic Physicians','Pediatrics','Neurodevelopmental Disabilities','\"A pediatrician who treats children having developmental delays or learning disorders including those associated with visual and hearing impairment','mental retardation'),
	('2080P0201X','Allopathic & Osteopathic Physicians','Pediatrics','Pediatric Allergy/Immunology','\"A pediatrician who specializes in the diagnosis and treatment of allergies','allergic reactions'),
	('2080P0202X','Allopathic & Osteopathic Physicians','Pediatrics','Pediatric Cardiology','\"A pediatric cardiologist provides comprehensive care to patients with cardiovascular problems. This specialist is skilled in selecting','performing and evaluating the structural and functional assessment of the heart and blood vessels'),
	('2080P0203X','Allopathic & Osteopathic Physicians','Pediatrics','Pediatric Critical Care Medicine','A pediatrician expert in advanced life support for children from the term or near-term neonate to the adolescent. This competence extends to the critical care management of life-threatening organ system failure from any cause in both medical and surgical patients and to the support of vital physiological functions. This specialist may have administrative responsibilities for intensive care units and also facilitates patient care among other specialists.','\"Source: American Board of Medical Specialties'),
	('2080P0204X','Allopathic & Osteopathic Physicians','Pediatrics','Pediatric Emergency Medicine','A pediatrician who has special qualifications to manage emergencies in infants and children.','\"Source: American Board of Medical Specialties'),
	('2080P0205X','Allopathic & Osteopathic Physicians','Pediatrics','Pediatric Endocrinology','\"A pediatrician who provides expert care to infants','children and adolescents who have diseases that result from an abnormality in the endocrine glands (glands which secrete hormones). These diseases include diabetes mellitus'),
	('2080P0206X','Allopathic & Osteopathic Physicians','Pediatrics','Pediatric Gastroenterology','\"A pediatrician who specializes in the diagnosis and treatment of diseases of the digestive systems of infants','children and adolescents. This specialist treats conditions such as abdominal pain'),
	('2080P0207X','Allopathic & Osteopathic Physicians','Pediatrics','Pediatric Hematology-Oncology','\"A pediatrician trained in the combination of pediatrics','hematology and oncology to recognize and manage pediatric blood disorders and cancerous diseases.\"'),
	('2080P0208X','Allopathic & Osteopathic Physicians','Pediatrics','Pediatric Infectious Diseases','\"A pediatrician trained to care for children in the diagnosis','treatment and prevention of infectious diseases. This specialist can apply specific knowledge to affect a better outcome for pediatric infections with complicated courses'),
	('2080P0210X','Allopathic & Osteopathic Physicians','Pediatrics','Pediatric Nephrology','\"A pediatrician who deals with the normal and abnormal development and maturation of the kidney and urinary tract','the mechanisms by which the kidney can be damaged'),
	('2080P0214X','Allopathic & Osteopathic Physicians','Pediatrics','Pediatric Pulmonology','\"A pediatrician dedicated to the prevention and treatment of all respiratory diseases affecting infants','children and young adults. This specialist is knowledgeable about the growth and development of the lung'),
	('2080P0216X','Allopathic & Osteopathic Physicians','Pediatrics','Pediatric Rheumatology','\"A pediatrician who treats diseases of joints','muscle'),
	('2080S0010X','Allopathic & Osteopathic Physicians','Pediatrics','Sports Medicine','\"A pediatrician who is responsible for continuous care in the field of sports medicine','not only for the enhancement of health and fitness'),
	('2080S0012X','Allopathic & Osteopathic Physicians','Pediatrics','Sleep Medicine','\"A Pediatrician who practices Sleep Medicine is certified in the subspecialty of sleep medicine and specializes in the clinical assessment','physiologic testing'),
	('2080T0002X','Allopathic & Osteopathic Physicians','Pediatrics','Medical Toxicology','\"Medical toxicologists are physicians that specialize in the prevention','evaluation'),
	('2080T0004X','Allopathic & Osteopathic Physicians','Pediatrics','Pediatric Transplant Hepatology','A pediatrician with expertise in transplant hepatology encompasses the special knowledge and skill required of pediatric gastroenterologists to care for patients prior to and following hepatic transplantation; it spans all phases of liver transplantation.','\"Source: American Board of Medical Specialties'),
	('208100000X','Allopathic & Osteopathic Physicians','Physical Medicine & Rehabilitation','','\"Physical medicine and rehabilitation','also referred to as rehabilitation medicine'),
	('2081H0002X','Allopathic & Osteopathic Physicians','Physical Medicine & Rehabilitation','Hospice and Palliative Medicine','\"A physical medicine and rehabilitation physician with special knowledge and skills to prevent and relieve the suffering experienced by patients with life-limiting illnesses. This specialist works with an interdisciplinary hospice or palliative care team to maximize quality of life while addressing physical','psychological'),
	('2081N0008X','Allopathic & Osteopathic Physicians','Physical Medicine & Rehabilitation','Neuromuscular Medicine','\"A physician who specializes in neuromuscular medicine possesses specialized knowledge in the science','clinical evaluation and management of these disorders. This encompasses the knowledge of the pathology'),
	('2081P0004X','Allopathic & Osteopathic Physicians','Physical Medicine & Rehabilitation','Spinal Cord Injury Medicine','\"A physician who addresses the prevention','diagnosis'),
	('2081P0010X','Allopathic & Osteopathic Physicians','Physical Medicine & Rehabilitation','Pediatric Rehabilitation Medicine','\"A physiatrist who utilizes an interdisciplinary approach and addresses the prevention','diagnosis'),
	('2081P0301X','Allopathic & Osteopathic Physicians','Physical Medicine & Rehabilitation','Brain Injury Medicine','\"A Brain Injury Medicine physician specializes in disorders of brain function due to injury and disease.  These disorders encompass a range of medical','physical'),
	('2081P2900X','Allopathic & Osteopathic Physicians','Physical Medicine & Rehabilitation','Pain Medicine','\"A physician who provides a high level of care','either as a primary physician or consultant'),
	('2081S0010X','Allopathic & Osteopathic Physicians','Physical Medicine & Rehabilitation','Sports Medicine','\"A physician who specializes in Sports Medicine is responsible for continuous care related to the enhancement of health and fitness as well as the prevention of injury and illness. The specialist possesses knowledge and experience in the promotion of wellness and the prevention of injury from many areas of medicine such as exercise physiology','biomechanics'),
	('208200000X','Allopathic & Osteopathic Physicians','Plastic Surgery','','\"A plastic surgeon deals with the repair','reconstruction or replacement of physical defects of form or function involving the skin'),
	('2082S0099X','Allopathic & Osteopathic Physicians','Plastic Surgery','Plastic Surgery Within the Head and Neck','\"A plastic surgeon with additional training in plastic and reconstructive procedures within the head','face'),
	('2082S0105X','Allopathic & Osteopathic Physicians','Plastic Surgery','Surgery of the Hand','\"A plastic surgeon with additional training in the investigation','preservation'),
	('2083A0100X','Allopathic & Osteopathic Physicians','Preventive Medicine','Aerospace Medicine','\"Aerospace medicine focuses on the clinical care','research'),
	('2083A0300X','Allopathic & Osteopathic Physicians','Preventive Medicine','Addiction Medicine','\"A physician engaged in the subspecialty practice of Addiction Medicine who specializes in the prevention','evaluation'),
	('2083B0002X','Allopathic & Osteopathic Physicians','Preventive Medicine','Obesity Medicine','\"A physician who specializes in the treatment of obesity demonstrates competency in and a thorough understanding of the treatment of obesity and the genetic','biologic'),
	('2083C0008X','Allopathic & Osteopathic Physicians','Preventive Medicine','Clinical Informatics','\"Physicians who practice Clinical Informatics collaborate with other health care and information technology professionals to analyze','design'),
	('2083P0011X','Allopathic & Osteopathic Physicians','Preventive Medicine','Undersea and Hyperbaric Medicine','\"A specialist who treats decompression illness and diving accident cases and uses hyperbaric oxygen therapy to treat such conditions as carbon monoxide poisoning','gas gangrene'),
	('2083P0500X','Allopathic & Osteopathic Physicians','Preventive Medicine','Preventive Medicine/Occupational Environmental Medicine','\"A preventive medicine physician who specializes in preventive medicine/occupational-environmental medicine','which is focused on protecting the population from occupational and environmental conditions.\"'),
	('2083P0901X','Allopathic & Osteopathic Physicians','Preventive Medicine','Public Health & General Preventive Medicine','\"Public health and general preventive medicine focuses on promoting health','preventing disease'),
	('2083S0010X','Allopathic & Osteopathic Physicians','Preventive Medicine','Sports Medicine','A preventive medicine physician who specializes in the diagnosis and treatment of sports related conditions and injuries.','\"Source: National Uniform Claim Committee'),
	('2083T0002X','Allopathic & Osteopathic Physicians','Preventive Medicine','Medical Toxicology','\"Medical toxicologists are physicians who specialize in the prevention','evaluation'),
	('2083X0100X','Allopathic & Osteopathic Physicians','Preventive Medicine','Occupational Medicine','\"Occupational medicine focuses on the health of workers','including the ability to perform work; the physical'),
	('2084A0401X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Addiction Medicine','A doctor of osteopathy board eligible/certified in the field of Psychiatry by the American Osteopathic Board of Neurology and Psychiatry is able to obtain a Certificate of Added Qualifications in the field of Addiction Medicine','\"Source: American Osteopathic Board of Neurology and Psychiatry'),
	('2084A2900X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Neurocritical Care','\"The medical subspecialty of Neurocritical Care is devoted to the comprehensive','multisystem care of the critically-ill neurological patient. Like other intensivists'),
	('2084B0002X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Obesity Medicine','\"A physician who specializes in the treatment of obesity demonstrates competency in and a thorough understanding of the treatment of obesity and the genetic','biologic'),
	('2084B0040X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Behavioral Neurology & Neuropsychiatry','Behavioral Neurology & Neuropsychiatry is a medical subspecialty involving the diagnosis and treatment of neurologically based behavioral issues.','\"Source: National Uniform Claim Committee. [1/1/2012: new]  Additional Resources:  American Academy of Neurology'),
	('2084D0003X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Diagnostic Neuroimaging','\"A licensed physician','who has completed a residency program in Neurology'),
	('2084F0202X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Forensic Psychiatry','\"Forensic Psychiatry is a subspecialty with psychiatric focus on interrelationships with civil','criminal and administrative law'),
	('2084H0002X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Hospice and Palliative Medicine','\"A psychiatrist or neurologist with special knowledge and skills to prevent and relieve the suffering experienced by patients with life-limiting illnesses. This specialist works with an interdisciplinary hospice or palliative care team to maximize quality of life while addressing physical','psychological'),
	('2084N0008X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Neuromuscular Medicine','\"A neurologist or child neurologist who specializes in the diagnosis and management of disorders of nerve','muscle or neuromuscular junction'),
	('2084N0400X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Neurology','\"A Neurologist specializes in the diagnosis and treatment of diseases or impaired function of the brain','spinal cord'),
	('2084N0402X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Neurology with Special Qualifications in Child Neurology','\"A Child Neurologist specializes in neurology with special skills in diagnosis and treatment of neurologic disorders of the neonatal period','infancy'),
	('2084N0600X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Clinical Neurophysiology','\"Clinical Neurophysiology is a subspecialty with psychiatric or neurologic expertise in the diagnosis and management of central','peripheral'),
	('2084P0005X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Neurodevelopmental Disabilities','\"A pediatrician or neurologist who specializes in the diagnosis and management of chronic conditions that affect the developing and mature nervous system such as cerebral palsy','mental retardation and chronic behavioral syndromes'),
	('2084P0015X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Psychosomatic Medicine','\"Psychosomatic Medicine is subspecialty in the diagnosis and treatment of psychiatric disorders and symptoms in complex medically ill patients. This subspecialty includes treatment of patients with acute or chronic medical','neurological'),
	('2084P0301X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Brain Injury Medicine','\"A Brain Injury Medicine physician specializes in disorders of brain function due to injury and disease.  These disorders encompass a range of medical','physical'),
	('2084P0800X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Psychiatry','\"A Psychiatrist specializes in the prevention','diagnosis'),
	('2084P0802X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Addiction Psychiatry','\"Addiction Psychiatry is a subspecialty of psychiatry that focuses on evaluation and treatment of individuals with alcohol','drug'),
	('2084P0804X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Child & Adolescent Psychiatry','\"Child & Adolescent Psychiatry is a subspecialty of psychiatry with additional skills and training in the diagnosis and treatment of developmental','behavioral'),
	('2084P0805X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Geriatric Psychiatry','\"Geriatric Psychiatry is a subspecialty with psychiatric expertise in prevention','evaluation'),
	('2084P2900X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Pain Medicine','\"A neurologist','child neurologists or psychiatrist who provides a high level of care'),
	('2084S0010X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Sports Medicine','A psychiatrist or neurologist who specializes in the diagnosis and treatment of sports related conditions and injuries.','\"Source: National Uniform Claim Committee'),
	('2084S0012X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Sleep Medicine','\"A Psychiatrist or Neurologist who practices Sleep Medicine is certified in the subspecialty of sleep medicine and specializes in the clinical assessment','physiologic testing'),
	('2084V0102X','Allopathic & Osteopathic Physicians','Psychiatry & Neurology','Vascular Neurology','\"Vascular Neurology is a subspecialty in the evaluation','prevention'),
	('2085B0100X','Allopathic & Osteopathic Physicians','Radiology','Body Imaging','A Radiology doctor of Osteopathy that specializes in Body Imaging.','\"Source: National Uniform Claim Committee'),
	('2085D0003X','Allopathic & Osteopathic Physicians','Radiology','Diagnostic Neuroimaging','\"A licensed physician','who has completed a residency program in Neurology'),
	('2085H0002X','Allopathic & Osteopathic Physicians','Radiology','Hospice and Palliative Medicine','\"A radiologist with special knowledge and skills to prevent and relieve the suffering experienced by patients with life-limiting illnesses. This specialist works with an interdisciplinary hospice or palliative care team to maximize quality of life while addressing physical','psychological'),
	('2085N0700X','Allopathic & Osteopathic Physicians','Radiology','Neuroradiology','\"A radiologist who diagnoses and treats diseases utilizing imaging procedures as they relate to the brain','spine and spinal cord'),
	('2085N0904X','Allopathic & Osteopathic Physicians','Radiology','Nuclear Radiology','A radiologist who is involved in the analysis and imaging of radionuclides and radiolabeled substances in vitro and in vivo for diagnosis and the administration of radionuclides and radiolabeled substances for the treatment of disease.','\"Source: American Board of Medical Specialties'),
	('2085P0229X','Allopathic & Osteopathic Physicians','Radiology','Pediatric Radiology','\"A radiologist who is proficient in all forms of diagnostic imaging as it pertains to the treatment of diseases in the newborn','infant'),
	('2085R0001X','Allopathic & Osteopathic Physicians','Radiology','Radiation Oncology','\"A radiologist who deals with the therapeutic applications of radiant energy and its modifiers and the study and management of disease','especially malignant tumors.\"'),
	('2085R0202X','Allopathic & Osteopathic Physicians','Radiology','Diagnostic Radiology','\"A radiologist who utilizes x-ray','radionuclides'),
	('2085R0203X','Allopathic & Osteopathic Physicians','Radiology','Therapeutic Radiology','Definition to come...',''),
	('2085R0204X','Allopathic & Osteopathic Physicians','Radiology','Vascular & Interventional Radiology','\"A radiologist who diagnoses and treats diseases by various radiologic imaging modalities. These include fluoroscopy','digital radiography'),
	('2085R0205X','Allopathic & Osteopathic Physicians','Radiology','Radiological Physics','\"A radiological physicist deals with the diagnostic and therapeutic applications of roentgen rays','gamma rays from sealed sources'),
	('2085U0001X','Allopathic & Osteopathic Physicians','Radiology','Diagnostic Ultrasound','A Radiology doctor of Osteopathy that specializes in Diagnostic Ultrasound.','\"Source: National Uniform Claim Committee'),
	('208600000X','Allopathic & Osteopathic Physicians','Surgery','','\"A general surgeon has expertise related to the diagnosis - preoperative','operative and postoperative management - and management of complications of surgical conditions in the following areas: alimentary tract; abdomen; breast'),
	('2086H0002X','Allopathic & Osteopathic Physicians','Surgery','Hospice and Palliative Medicine','\"A surgeon with special knowledge and skills to prevent and relieve the suffering experienced by patients with life-limiting illnesses. This specialist works with an interdisciplinary hospice or palliative care team to maximize quality of life while addressing physical','psychological'),
	('2086S0102X','Allopathic & Osteopathic Physicians','Surgery','Surgical Critical Care','\"A surgeon with expertise in the management of the critically ill and postoperative patient','particularly the trauma victim'),
	('2086S0105X','Allopathic & Osteopathic Physicians','Surgery','Surgery of the Hand','\"A surgeon with expertise in the investigation','preservation and restoration by medical'),
	('2086S0120X','Allopathic & Osteopathic Physicians','Surgery','Pediatric Surgery','\"A surgeon with expertise in the management of surgical conditions in premature and newborn infants','children and adolescents.\"'),
	('2086S0122X','Allopathic & Osteopathic Physicians','Surgery','Plastic and Reconstructive Surgery','A surgeon who specializes in plastic and reconstructive surgery.','\"Source: National Uniform Claim Committee'),
	('2086S0127X','Allopathic & Osteopathic Physicians','Surgery','Trauma Surgery','\"Trauma surgery is a recognized subspecialty of general surgery. Trauma surgeons are physicians who have completed a five-year general surgery residency and usually continue with a one to two year fellowship in trauma and/or surgical critical care','typically leading to additional board certification in surgical critical care. There is no trauma surgery board certification at this point. To obtain board certification in surgical critical care'),
	('2086S0129X','Allopathic & Osteopathic Physicians','Surgery','Vascular Surgery','\"A surgeon with expertise in the management of surgical disorders of the blood vessels','excluding the intracranial vessels or the heart.\"'),
	('2086X0206X','Allopathic & Osteopathic Physicians','Surgery','Surgical Oncology','\"A surgical oncologist is a well-qualified surgeon who has obtained additional training and experience in the multidisciplinary approach to the prevention','diagnosis'),
	('208800000X','Allopathic & Osteopathic Physicians','Urology','','\"A urologist manages benign and malignant medical and surgical disorders of the genitourinary system and the adrenal gland. This specialist has comprehensive knowledge of and skills in endoscopic','percutaneous and open surgery of congenital and acquired conditions of the urinary and reproductive systems and their contiguous structures.\"'),
	('2088F0040X','Allopathic & Osteopathic Physicians','Urology','Female Pelvic Medicine and Reconstructive Surgery','\"A subspecialist in Female Pelvic Medicine and Reconstructive Surgery is a physician in Urology or Obstetrics and Gynecology who','by virtue of education and training'),
	('2088P0231X','Allopathic & Osteopathic Physicians','Urology','Pediatric Urology','\"Surgeons who can diagnose','treat'),
	('208C00000X','Allopathic & Osteopathic Physicians','Colon & Rectal Surgery','','\"A colon and rectal surgeon is trained to diagnose and treat various diseases of the intestinal tract','colon'),
	('208D00000X','Allopathic & Osteopathic Physicians','General Practice','','Definition to come...',''),
	('208G00000X','Allopathic & Osteopathic Physicians','Thoracic Surgery (Cardiothoracic Vascular Surgery)','','\"A thoracic surgeon provides the operative','perioperative and critical care of patients with pathologic conditions within the chest. Included is the surgical care of coronary artery disease'),
	('208M00000X','Allopathic & Osteopathic Physicians','Hospitalist','','\"Hospitalists are physicians whose primary professional focus is the general medical care of hospitalized patients. Their activities include patient care','teaching'),
	('208U00000X','Allopathic & Osteopathic Physicians','Clinical Pharmacology','','\"Clinical pharmacology encompasses the spectrum of activities related to the discovery','development'),
	('208VP0000X','Allopathic & Osteopathic Physicians','Pain Medicine','Pain Medicine','\"Pain Medicine is a primary medical specialty based on a distinct body of knowledge and a well-defined scope of clinical practice that is founded on science','research and education.  It is concerned with the study of pain'),
	('208VP0014X','Allopathic & Osteopathic Physicians','Pain Medicine','Interventional Pain Medicine','\"Interventional Pain Medicine is the discipline of medicine devoted to the diagnosis and treatment of pain and related disorders principally with the application of interventional techniques in managing subacute','chronic'),
	('209800000X','Allopathic & Osteopathic Physicians','Legal Medicine','','\"Legal Medicine is a special field of medicine that focuses on various aspects of medicine and law. Historically','the practice of legal medicine made contributions to medicine as a scientific instrument to solve criminal perplexities. Since World War II'),
	('211D00000X','Podiatric Medicine & Surgery Service Providers','\"Assistant','Podiatric\"','','\"An individual who assists a podiatrist in tasks'),
	('213E00000X','Podiatric Medicine & Surgery Service Providers','Podiatrist','','\"A podiatrist is a person qualified by a Doctor of Podiatric Medicine (D.P.M.) degree','licensed by the state'),
	('213EG0000X','Podiatric Medicine & Surgery Service Providers','Podiatrist','General Practice','','\"[7/1/2006: marked inactive'),
	('213EP0504X','Podiatric Medicine & Surgery Service Providers','Podiatrist','Public Medicine','Definition to come...',''),
	('213EP1101X','Podiatric Medicine & Surgery Service Providers','Podiatrist','Primary Podiatric Medicine','Definition to come...',''),
	('213ER0200X','Podiatric Medicine & Surgery Service Providers','Podiatrist','Radiology','Definition to come...',''),
	('213ES0000X','Podiatric Medicine & Surgery Service Providers','Podiatrist','Sports Medicine','Definition to come...',''),
	('213ES0103X','Podiatric Medicine & Surgery Service Providers','Podiatrist','Foot & Ankle Surgery','Definition to come...',''),
	('213ES0131X','Podiatric Medicine & Surgery Service Providers','Podiatrist','Foot Surgery','Definition to come...',''),
	('221700000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Art Therapist',''),
	('222Q00000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Developmental Therapist',''),
	('222Z00000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Orthotist',''),
	('224900000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Mastectomy Fitter',''),
	('224L00000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Pedorthist',''),
	('224P00000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Prosthetist',''),
	('224Y00000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Clinical Exercise Physiologist',''),
	('224Z00000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Occupational Therapy Assistant',''),
	('224ZE0001X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Occupational Therapy Assistant','Environmental Modification'),
	('224ZF0002X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Occupational Therapy Assistant','\"Feeding'),
	('224ZL0004X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Occupational Therapy Assistant','Low Vision'),
	('224ZR0403X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Occupational Therapy Assistant','Driving and Community Mobility'),
	('225000000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Orthotic Fitter',''),
	('225100000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Physical Therapist',''),
	('2251C2600X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Physical Therapist','Cardiopulmonary'),
	('2251E1200X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Physical Therapist','Ergonomics'),
	('2251E1300X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Physical Therapist','\"Electrophysiology'),
	('2251G0304X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Physical Therapist','Geriatrics'),
	('2251H1200X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Physical Therapist','Hand'),
	('2251H1300X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Physical Therapist','Human Factors'),
	('2251N0400X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Physical Therapist','Neurology'),
	('2251P0200X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Physical Therapist','Pediatrics'),
	('2251S0007X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Physical Therapist','Sports'),
	('2251X0800X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Physical Therapist','Orthopedic'),
	('225200000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Physical Therapy Assistant',''),
	('225400000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Rehabilitation Practitioner',''),
	('225500000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Specialist/Technologist',''),
	('2255A2300X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Specialist/Technologist','Athletic Trainer'),
	('2255R0406X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Specialist/Technologist','\"Rehabilitation'),
	('225600000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Dance Therapist',''),
	('225700000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Massage Therapist',''),
	('225800000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Recreation Therapist',''),
	('225A00000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Music Therapist',''),
	('225B00000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Pulmonary Function Technologist',''),
	('225C00000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Rehabilitation Counselor',''),
	('225CA2400X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Rehabilitation Counselor','Assistive Technology Practitioner'),
	('225CA2500X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Rehabilitation Counselor','Assistive Technology Supplier'),
	('225CX0006X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Rehabilitation Counselor','Orientation and Mobility Training Provider'),
	('225X00000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Occupational Therapist',''),
	('225XE0001X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Occupational Therapist','Environmental Modification'),
	('225XE1200X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Occupational Therapist','Ergonomics'),
	('225XF0002X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Occupational Therapist','\"Feeding'),
	('225XG0600X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Occupational Therapist','Gerontology'),
	('225XH1200X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Occupational Therapist','Hand'),
	('225XH1300X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Occupational Therapist','Human Factors'),
	('225XL0004X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Occupational Therapist','Low Vision'),
	('225XM0800X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Occupational Therapist','Mental Health'),
	('225XN1300X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Occupational Therapist','Neurorehabilitation'),
	('225XP0019X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Occupational Therapist','Physical Rehabilitation'),
	('225XP0200X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Occupational Therapist','Pediatrics'),
	('225XR0403X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Occupational Therapist','Driving and Community Mobility'),
	('226000000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Recreational Therapist Assistant',''),
	('226300000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Kinesiotherapist',''),
	('227800000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Certified\"'),
	('2278C0205X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Certified\"'),
	('2278E0002X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Certified\"'),
	('2278E1000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Certified\"'),
	('2278G0305X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Certified\"'),
	('2278G1100X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Certified\"'),
	('2278H0200X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Certified\"'),
	('2278P1004X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Certified\"'),
	('2278P1005X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Certified\"'),
	('2278P1006X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Certified\"'),
	('2278P3800X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Certified\"'),
	('2278P3900X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Certified\"'),
	('2278P4000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Certified\"'),
	('2278S1500X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Certified\"'),
	('227900000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Registered\"'),
	('2279C0205X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Registered\"'),
	('2279E0002X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Registered\"'),
	('2279E1000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Registered\"'),
	('2279G0305X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Registered\"'),
	('2279G1100X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Registered\"'),
	('2279H0200X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Registered\"'),
	('2279P1004X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Registered\"'),
	('2279P1005X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Registered\"'),
	('2279P1006X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Registered\"'),
	('2279P3800X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Registered\"'),
	('2279P3900X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Registered\"'),
	('2279P4000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Registered\"'),
	('2279S1500X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','\"Respiratory Therapist','Registered\"'),
	('229N00000X','\"Respiratory','Developmental','Rehabilitative and Restorative Service Providers\"','Anaplastologist',''),
	('231H00000X','\"Speech','Language and Hearing Service Providers\"','Audiologist','','\"(1) A specialist in evaluation'),
	('231HA2400X','\"Speech','Language and Hearing Service Providers\"','Audiologist','Assistive Technology Practitioner','Definition to come...'),
	('231HA2500X','\"Speech','Language and Hearing Service Providers\"','Audiologist','Assistive Technology Supplier','Definition to come...'),
	('235500000X','\"Speech','Language and Hearing Service Providers\"','Specialist/Technologist','','General classification identifying individuals who are trained on a specific piece of equipment or technical procedure.'),
	('2355A2700X','\"Speech','Language and Hearing Service Providers\"','Specialist/Technologist','Audiology Assistant','Definition to come...'),
	('2355S0801X','\"Speech','Language and Hearing Service Providers\"','Specialist/Technologist','Speech-Language Assistant','Definition to come...'),
	('235Z00000X','\"Speech','Language and Hearing Service Providers\"','Speech-Language Pathologist','','\"The speech-language pathologist is the professional who engages in clinical services'),
	('237600000X','\"Speech','Language and Hearing Service Providers\"','Audiologist-Hearing Aid Fitter','','\"An audiologist/hearing aid fitter is the professional who specializes in evaluating and treating people with hearing loss'),
	('237700000X','\"Speech','Language and Hearing Service Providers\"','Hearing Instrument Specialist','','\"Individuals who test hearing for the selection'),
	('242T00000X','\"Technologists','Technicians & Other Technical Service Providers\"','Perfusionist','','\"A perfusionist operates extracorporeal circulation and autotransfusion equipment during any medical situation where it is necessary to support or temporarily replace the patient\'s circulatory or respiratory function. The perfusionist is knowledgeable concerning the variety of equipment available to perform extracorporeal circulation functions and is responsible'),
	('243U00000X','\"Technologists','Technicians & Other Technical Service Providers\"','Radiology Practitioner Assistant','','\"A Radiology Practitioner Assistant (RPA) is a health professional certified as a registered radiographer with the American Registry of Radiologic Technologists (ARRT) and'),
	('246Q00000X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Pathology\"',''),
	('246QB0000X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Pathology\"','Blood Banking'),
	('246QC1000X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Pathology\"','Chemistry'),
	('246QC2700X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Pathology\"','Cytotechnology'),
	('246QH0000X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Pathology\"','Hematology'),
	('246QH0401X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Pathology\"','Hemapheresis Practitioner'),
	('246QH0600X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Pathology\"','Histology'),
	('246QI0000X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Pathology\"','Immunology'),
	('246QL0900X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Pathology\"','Laboratory Management'),
	('246QL0901X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Pathology\"','\"Laboratory Management'),
	('246QM0706X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Pathology\"','Medical Technologist'),
	('246QM0900X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Pathology\"','Microbiology'),
	('246R00000X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Technician','Pathology\"',''),
	('246RH0600X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Technician','Pathology\"','Histology'),
	('246RM2200X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Technician','Pathology\"','Medical Laboratory'),
	('246RP1900X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Technician','Pathology\"','Phlebotomy'),
	('246W00000X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Technician','Cardiology\"',''),
	('246X00000X','\"Technologists','Technicians & Other Technical Service Providers\"','Specialist/Technologist Cardiovascular','','\"An allied health professional who performs diagnostic examinations at the request or direction of a physician in one or more of the following three areas: invasive cardiology'),
	('246XC2901X','\"Technologists','Technicians & Other Technical Service Providers\"','Specialist/Technologist Cardiovascular','Cardiovascular Invasive Specialist','Definition to come...'),
	('246XC2903X','\"Technologists','Technicians & Other Technical Service Providers\"','Specialist/Technologist Cardiovascular','Vascular Specialist','Definition to come...'),
	('246XS1301X','\"Technologists','Technicians & Other Technical Service Providers\"','Specialist/Technologist Cardiovascular','Sonography','Definition to come...'),
	('246Y00000X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Health Information\"',''),
	('246YC3301X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Health Information\"','\"Coding Specialist'),
	('246YC3302X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Health Information\"','\"Coding Specialist'),
	('246YR1600X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Health Information\"','Registered Record Administrator'),
	('246Z00000X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Other\"',''),
	('246ZA2600X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Other\"','\"Art'),
	('246ZB0301X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Other\"','Biomedical Engineering'),
	('246ZB0302X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Other\"','Biomedical Photographer'),
	('246ZB0500X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Other\"','Biochemist'),
	('246ZB0600X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Other\"','Biostatistician'),
	('246ZC0007X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Other\"','Surgical Assistant'),
	('246ZE0500X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Other\"','EEG'),
	('246ZE0600X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Other\"','Electroneurodiagnostic'),
	('246ZG0701X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Other\"','Graphics Methods'),
	('246ZG1000X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Other\"','\"Geneticist'),
	('246ZI1000X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Other\"','\"Illustration'),
	('246ZN0300X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Other\"','Nephrology'),
	('246ZS0410X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Other\"','Surgical Technologist'),
	('246ZX2200X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Specialist/Technologist','Other\"','Orthopedic Assistant'),
	('247000000X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Technician','Health Information\"',''),
	('2470A2800X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Technician','Health Information\"','Assistant Record Technician'),
	('247100000X','\"Technologists','Technicians & Other Technical Service Providers\"','Radiologic Technologist','','\"An individual who is trained and qualified in the art and science of both ionizing and non-ionizing radiation for the purposes of diagnostic medical imaging'),
	('2471B0102X','\"Technologists','Technicians & Other Technical Service Providers\"','Radiologic Technologist','Bone Densitometry','Definition to come.'),
	('2471C1101X','\"Technologists','Technicians & Other Technical Service Providers\"','Radiologic Technologist','Cardiovascular-Interventional Technology','Definition to come...'),
	('2471C1106X','\"Technologists','Technicians & Other Technical Service Providers\"','Radiologic Technologist','Cardiac-Interventional Technology','Definition to come.'),
	('2471C3401X','\"Technologists','Technicians & Other Technical Service Providers\"','Radiologic Technologist','Computed Tomography','Definition to come...'),
	('2471C3402X','\"Technologists','Technicians & Other Technical Service Providers\"','Radiologic Technologist','Radiography','Definition to come...'),
	('2471M1202X','\"Technologists','Technicians & Other Technical Service Providers\"','Radiologic Technologist','Magnetic Resonance Imaging','Definition to come...'),
	('2471M2300X','\"Technologists','Technicians & Other Technical Service Providers\"','Radiologic Technologist','Mammography','Definition to come...'),
	('2471N0900X','\"Technologists','Technicians & Other Technical Service Providers\"','Radiologic Technologist','Nuclear Medicine Technology','Definition to come.'),
	('2471Q0001X','\"Technologists','Technicians & Other Technical Service Providers\"','Radiologic Technologist','Quality Management','Definition to come...'),
	('2471R0002X','\"Technologists','Technicians & Other Technical Service Providers\"','Radiologic Technologist','Radiation Therapy','Definition to come...'),
	('2471S1302X','\"Technologists','Technicians & Other Technical Service Providers\"','Radiologic Technologist','Sonography','Definition to come...'),
	('2471V0105X','\"Technologists','Technicians & Other Technical Service Providers\"','Radiologic Technologist','Vascular Sonography','Definition to come.'),
	('2471V0106X','\"Technologists','Technicians & Other Technical Service Providers\"','Radiologic Technologist','Vascular-Interventional Technology','Definition to come.'),
	('247200000X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Technician','Other\"',''),
	('2472B0301X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Technician','Other\"','Biomedical Engineering'),
	('2472D0500X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Technician','Other\"','Darkroom'),
	('2472E0500X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Technician','Other\"','EEG'),
	('2472R0900X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Technician','Other\"','Renal Dialysis'),
	('2472V0600X','\"Technologists','Technicians & Other Technical Service Providers\"','\"Technician','Other\"','Veterinary'),
	('247ZC0005X','\"Technologists','Technicians & Other Technical Service Providers\"','Pathology','\"Clinical Laboratory Director','Non-physician\"'),
	('251300000X','Agencies','Local Education Agency (LEA)','','\"The term local education agency means a public board of education or other public authority legally constituted within a State to either provide administrative control or direction of','or perform a service function for public schools serving individuals ages 0 - 21 in a state'),
	('251B00000X','Agencies','Case Management','','\"An organization that is responsible for providing case management services.  The agency provides services which assist an individual in gaining access to needed medical','social'),
	('251C00000X','Agencies','\"Day Training','Developmentally Disabled Services\"','','\"These agencies are authorized to provide day habilitation services to developmentally disabled individuals who live in their homes.  The function of day habilitation is to assist an individual to acquire and maintain those life skills that enable the individual to cope more effectively with the demands of independent living.  Also to raise the level of the individual\'s physical'),
	('251E00000X','Agencies','Home Health','','\"A public agency or private organization','or a subdivision of such an agency or organization'),
	('251F00000X','Agencies','Home Infusion','','Definition to come...',''),
	('251G00000X','Agencies','\"Hospice Care','Community Based\"','','Definition to come...'),
	('251J00000X','Agencies','Nursing Care','','\"A Nursing Care Agency is an entity that provides skilled nursing care through the services of a Registered Nurse (RN) or a Licensed Practical Nurse (LPN)','by employees'),
	('251K00000X','Agencies','Public Health or Welfare','','Definition to come...',''),
	('251S00000X','Agencies','Community/Behavioral Health','','\"A private or public agency usually under local government jurisdiction','responsible for assuring the delivery of community based mental health'),
	('251T00000X','Agencies','Program of All-Inclusive Care for the Elderly (PACE) Provider Organization','','A PACE provider organization is a not-for-profit private or public entity that is primarily engaged in providing PACE services(unique capitated managed care benefits for the frail elderly which include comprehensive medical and social services).  The following characteristics also apply to a PACE organization.  It must:  have a governing board that includes community representation; be able to provide complete PACE services regardless of frequency or duration of services; have a physical site to provide adult day services; have a defined service area; have safeguards against conflict of interest; have demonstrated fiscal soundness and have a formal Participant Bill of Rights.','\"Source:  Centers for Medicare and Medicaid'),
	('251V00000X','Agencies','Voluntary or Charitable','','Definition to come...',''),
	('251X00000X','Agencies','Supports Brokerage','','\"A provider of service/function that assists participating individuals to make informed decisions about what will work best for them is consistent with their needs and reflects their individual circumstances. Serving as the agent of the individual','the service is available to assist in identifying immediate and long-term needs'),
	('252Y00000X','Agencies','Early Intervention Provider Agency','','\"Early intervention services are an effective way to address the needs of infants and toddlers who have developmental delays or disabilities. The services are made available through a federal law known as the Individuals with Disabilities Education Act (IDEA). IDEA provides states and territories with specific requirements for providing early intervention services to infants and toddlers with special needs. In turn','each state and territory develops its own policies for carrying out IDEA and its requirements. Broadly speaking'),
	('253J00000X','Agencies','Foster Care Agency','','\"A Foster Care Agency is an agency that provides foster care as defined in the Code of Federal Regulations (CFR) as \"\"24-hour substitute care for children outside their own homes.\"\" Foster care settings include','but are not limited to'),
	('253Z00000X','Agencies','In Home Supportive Care','','\"An In Home Supportive Care Agency provides services in the patient\'s home with the goal of enabling the patient to remain at home.  The services provided may include personal care services such as hands-on assistance with activities of daily living (ADLs)','e.g.'),
	('261Q00000X','Ambulatory Health Care Facilities','Clinic/Center','','\"A facility or distinct part of one used for the diagnosis and treatment of outpatients. \"\"Clinic/Center\"\" is irregularly defined','sometimes being limited to organizations serving specialized treatment requirements or distinct patient/client groups (e.g.'),
	('261QA0005X','Ambulatory Health Care Facilities','Clinic/Center','Ambulatory Family Planning Facility','\"An abortion/family planning facility where services are provided at a fixed specific location.  An Ambulatory Family Planning Facility does not provide overnight accommodations. The following procedures may be performed at an Ambulatory Family Planning Facility: abortions','laproscopy'),
	('261QA0006X','Ambulatory Health Care Facilities','Clinic/Center','Ambulatory Fertility Facility','\"A fertility facility','which may be licensed'),
	('261QA0600X','Ambulatory Health Care Facilities','Clinic/Center','Adult Day Care','Definition to come...',''),
	('261QA0900X','Ambulatory Health Care Facilities','Clinic/Center','Amputee','\"An entity','facility'),
	('261QA1903X','Ambulatory Health Care Facilities','Clinic/Center','Ambulatory Surgical','Definition to come...',''),
	('261QA3000X','Ambulatory Health Care Facilities','Clinic/Center','Augmentative Communication','\"An entity','facility'),
	('261QB0400X','Ambulatory Health Care Facilities','Clinic/Center','Birthing','\"A freestanding birth center is a health facility other than a hospital where childbirth is planned to occur away from the pregnant woman\'s residence','and that provides prenatal'),
	('261QC0050X','Ambulatory Health Care Facilities','Clinic/Center','Critical Access Hospital','\"An outpatient entity','facility'),
	('261QC1500X','Ambulatory Health Care Facilities','Clinic/Center','Community Health','Definition to come...',''),
	('261QC1800X','Ambulatory Health Care Facilities','Clinic/Center','Corporate Health','Definition to come...',''),
	('261QD0000X','Ambulatory Health Care Facilities','Clinic/Center','Dental','Definition to come...',''),
	('261QD1600X','Ambulatory Health Care Facilities','Clinic/Center','Developmental Disabilities','\"An entity','facility'),
	('261QE0002X','Ambulatory Health Care Facilities','Clinic/Center','Emergency Care','Definition to come...',''),
	('261QE0700X','Ambulatory Health Care Facilities','Clinic/Center','End-Stage Renal Disease (ESRD) Treatment','Definition to come...',''),
	('261QE0800X','Ambulatory Health Care Facilities','Clinic/Center','Endoscopy','Definition to come...',''),
	('261QF0050X','Ambulatory Health Care Facilities','Clinic/Center','\"Family Planning','Non-Surgical\"','\"An entity'),
	('261QF0400X','Ambulatory Health Care Facilities','Clinic/Center','Federally Qualified Health Center (FQHC)','Definition to come...',''),
	('261QG0250X','Ambulatory Health Care Facilities','Clinic/Center','Genetics','\"An entity','facility'),
	('261QH0100X','Ambulatory Health Care Facilities','Clinic/Center','Health Service','Definition to come...','[7/1/2006: modified title]'),
	('261QH0700X','Ambulatory Health Care Facilities','Clinic/Center','Hearing and Speech','\"An entity','facility'),
	('261QI0500X','Ambulatory Health Care Facilities','Clinic/Center','Infusion Therapy','Definition to come...',''),
	('261QL0400X','Ambulatory Health Care Facilities','Clinic/Center','Lithotripsy','Definition to come...',''),
	('261QM0801X','Ambulatory Health Care Facilities','Clinic/Center','Mental Health (Including Community Mental Health Center)','Definition to come...',''),
	('261QM0850X','Ambulatory Health Care Facilities','Clinic/Center','Adult Mental Health','\"An entity','facility'),
	('261QM0855X','Ambulatory Health Care Facilities','Clinic/Center','Adolescent and Children Mental Health','\"An entity','facility'),
	('261QM1000X','Ambulatory Health Care Facilities','Clinic/Center','Migrant Health','Definition to come...',''),
	('261QM1100X','Ambulatory Health Care Facilities','Clinic/Center','Military/U.S. Coast Guard Outpatient','\"The Defense Health Program or U.S. Coast Guard funded \"\"fixed\"\" facilities or distinct parts of a facility','providing outpatient medical and dental services'),
	('261QM1101X','Ambulatory Health Care Facilities','Clinic/Center','Military and U.S. Coast Guard Ambulatory Procedure','\"That part of a \"\"fixed\"\" (non-temporary','non-deployed) DoD or Coast Guard entity furnishing surgical procedures requiring medically supervised recovery.  Similar to a civilian ambulatory surgical center.  May be in shared resources with a DoD or Coast Guard Clinic or a DoD Hospital.  Does not include items issued directly to a patient from an outpatient pharmacy or patient transport.  Includes initial \"\"take home\"\" pharmaceuticals.\"'),
	('261QM1102X','Ambulatory Health Care Facilities','Clinic/Center','Military Outpatient Operational (Transportable) Component','\"\"\"Non-fixed\"\" facilities or distinct parts of a \"\"non-fixed\"\" facility','providing outpatient medical and dental services'),
	('261QM1103X','Ambulatory Health Care Facilities','Clinic/Center','Military Ambulatory Procedure Visits Operational (Transportable)','\"\"\"Non-fixed\"\" facilities or distinct parts of a \"\"non-fixed\"\" facility','providing outpatient surgical procedures requiring medically supervised recovery. Does not include items issued directly to a patient from an outpatient pharmacy or patient transport. Includes initial \"\"take home\"\" pharmaceuticals.\"'),
	('261QM1200X','Ambulatory Health Care Facilities','Clinic/Center','Magnetic Resonance Imaging (MRI)','Definition to come...',''),
	('261QM1300X','Ambulatory Health Care Facilities','Clinic/Center','Multi-Specialty','Definition to come...',''),
	('261QM2500X','Ambulatory Health Care Facilities','Clinic/Center','Medical Specialty','\"An entity','facility'),
	('261QM2800X','Ambulatory Health Care Facilities','Clinic/Center','Methadone','\"An entity','facility'),
	('261QM3000X','Ambulatory Health Care Facilities','Clinic/Center','Medically Fragile Infants and Children Day Care','\"An entity','facility'),
	('261QP0904X','Ambulatory Health Care Facilities','Clinic/Center','\"Public Health','Federal\"','Definition to come...'),
	('261QP0905X','Ambulatory Health Care Facilities','Clinic/Center','\"Public Health','State or Local\"','Definition to come...'),
	('261QP1100X','Ambulatory Health Care Facilities','Clinic/Center','Podiatric','Definition to come...',''),
	('261QP2000X','Ambulatory Health Care Facilities','Clinic/Center','Physical Therapy','Definition to come...',''),
	('261QP2300X','Ambulatory Health Care Facilities','Clinic/Center','Primary Care','Definition to come...',''),
	('261QP2400X','Ambulatory Health Care Facilities','Clinic/Center','Prison Health','Definition to come...',''),
	('261QP3300X','Ambulatory Health Care Facilities','Clinic/Center','Pain','Definition to come...',''),
	('261QR0200X','Ambulatory Health Care Facilities','Clinic/Center','Radiology','Definition to come...',''),
	('261QR0206X','Ambulatory Health Care Facilities','Clinic/Center','\"Radiology','Mammography\"','Definition to come...'),
	('261QR0207X','Ambulatory Health Care Facilities','Clinic/Center','\"Radiology','Mobile Mammography\"','Definition to come...'),
	('261QR0208X','Ambulatory Health Care Facilities','Clinic/Center','\"Radiology','Mobile\"','Definition to come...'),
	('261QR0400X','Ambulatory Health Care Facilities','Clinic/Center','Rehabilitation','Definition to come…',''),
	('261QR0401X','Ambulatory Health Care Facilities','Clinic/Center','\"Rehabilitation','Comprehensive Outpatient Rehabilitation Facility (CORF)\"','Definition to come...'),
	('261QR0404X','Ambulatory Health Care Facilities','Clinic/Center','\"Rehabilitation','Cardiac Facilities\"','Definition to come...'),
	('261QR0405X','Ambulatory Health Care Facilities','Clinic/Center','\"Rehabilitation','Substance Use Disorder\"','Definition to come...'),
	('261QR0800X','Ambulatory Health Care Facilities','Clinic/Center','Recovery Care','Definition to come...',''),
	('261QR1100X','Ambulatory Health Care Facilities','Clinic/Center','Research','Definition to come...',''),
	('261QR1300X','Ambulatory Health Care Facilities','Clinic/Center','Rural Health','Definition to come...',''),
	('261QS0112X','Ambulatory Health Care Facilities','Clinic/Center','Oral and Maxillofacial Surgery','\"The specialty of dentistry which includes the diagnosis','surgical and adjunctive treatment of diseases'),
	('261QS0132X','Ambulatory Health Care Facilities','Clinic/Center','Ophthalmologic Surgery','Definition to come...',''),
	('261QS1000X','Ambulatory Health Care Facilities','Clinic/Center','Student Health','Definition to come...',''),
	('261QS1200X','Ambulatory Health Care Facilities','Clinic/Center','Sleep Disorder Diagnostic','Definition to come...',''),
	('261QU0200X','Ambulatory Health Care Facilities','Clinic/Center','Urgent Care','Definition to come...',''),
	('261QV0200X','Ambulatory Health Care Facilities','Clinic/Center','VA','Definition to come...',''),
	('261QX0100X','Ambulatory Health Care Facilities','Clinic/Center','Occupational Medicine','Definition to come...',''),
	('261QX0200X','Ambulatory Health Care Facilities','Clinic/Center','Oncology','\"An entity','facility'),
	('261QX0203X','Ambulatory Health Care Facilities','Clinic/Center','\"Oncology','Radiation\"','Definition to come...'),
	('273100000X','Hospital Units','Epilepsy Unit','','\"An Epilepsy Unit is a distinct unit of a hospital that provides services that may include observation','urgent care'),
	('273R00000X','Hospital Units','Psychiatric Unit','','\"In general','a distinct unit of a hospital that provides acute or long-term care to emotionally disturbed patients'),
	('273Y00000X','Hospital Units','Rehabilitation Unit','','\"In general','a distinct unit of a general acute care hospital that provides care encompassing a comprehensive array of restoration services for the disabled and all support services necessary to help patients attain their maximum functional capacity. Source: AHA Annual Survey p. A10 1996 AHA Guide. For Medicare'),
	('275N00000X','Hospital Units','Medicare Defined Swing Bed Unit','','A unit of a hospital that has a Medicare provider agreement and has been granted approval from HCFA to provide post-hospital extended care services and be reimbursed as a swing-bed unit.','\"Source: Code of Federal Regulations #42'),
	('276400000X','Hospital Units','\"Rehabilitation','Substance Use Disorder Unit\"','','\"A distinct part of a hospital that provides medically monitored'),
	('281P00000X','Hospitals','Chronic Disease Hospital','','\"(1) A hospital including a physical plant and personnel that provides multidisciplinary diagnosis and treatment for diseases that have one or more of the following characteristics: is permanent; leaves residual disability; is caused by nonreversible pathological alteration; requires special training of the patient for rehabilitation; and/or may be expected to require a long period of supervision or care. In addition','patients require the safety'),
	('281PC2000X','Hospitals','Chronic Disease Hospital','Children','Definition to come...',''),
	('282E00000X','Hospitals','Long Term Care Hospital','','Long-term care hospitals (LTCHs) furnish extended medical and rehabilitative care to individuals who are clinically complex and have multiple acute or chronic conditions.','Source:  American Hospital Association [7/1/2006: new]'),
	('282J00000X','Hospitals','Religious Nonmedical Health Care Institution','','\"Furnishes only nonmedical nursing items and services to patients who choose to rely solely upon a religious method of healing','and for whom the acceptance of medical services would be inconsistent with their religious beliefs.  Furnishes nonmedical items and services exclusively through nonmedical nursing personnel who are experienced in caring for the physical needs of nonmedical patients.  For example'),
	('282N00000X','Hospitals','General Acute Care Hospital','','\"An acute general hospital is an institution whose primary function is to provide inpatient diagnostic and therapeutic services for a variety of medical conditions','both surgical and non-surgical'),
	('282NC0060X','Hospitals','General Acute Care Hospital','Critical Access','Definition to come.','[7/1/2003: new]'),
	('282NC2000X','Hospitals','General Acute Care Hospital','Children','Definition to come...',''),
	('282NR1301X','Hospitals','General Acute Care Hospital','Rural','Definition to come...',''),
	('282NW0100X','Hospitals','General Acute Care Hospital','Women','Definition to come...',''),
	('283Q00000X','Hospitals','Psychiatric Hospital','','\"An organization including a physical plant and personnel that provides multidisciplinary diagnostic and treatment mental health services to patients requiring the safety','security'),
	('283X00000X','Hospitals','Rehabilitation Hospital','','\"A hospital or facility that provides health-related','social and/or vocational services to disabled persons to help them attain their maximum functional capacity.\"'),
	('283XC2000X','Hospitals','Rehabilitation Hospital','Children','Definition to come...',''),
	('284300000X','Hospitals','Special Hospital','','\"A designation by the AHA of a hospital whose primary function of the institution is to provide diagnostic and treatment services for patients who have specified medical conditions','both surgical and nonsurgical.\"'),
	('286500000X','Hospitals','Military Hospital','','A health care facility operated by the Department of Defense.',''),
	('2865C1500X','Hospitals','Military Hospital','Community Health','','[1/1/2005: marked inactive]'),
	('2865M2000X','Hospitals','Military Hospital','Military General Acute Care Hospital','\"A Department of Defense (DoD) health care organization furnishing inpatient care 24 hours per day in \"\"fixed\"\" facilities','primarily for DoD beneficiaries. Entity is Defense Health Program (DHP) funded. A \"\"fixed\"\" facility is a non-temporary'),
	('2865X1600X','Hospitals','Military Hospital','Military General Acute Care Hospital. Operational (Transportable)','\"A Department of Defense (DoD) health care organization furnishing inpatient care 24 hours per day in \"\"non-fixed\"\" or deployed facilities. Entity is not Defense Health Program funded. Services are primarily intended for DoD active duty though some services may be furnished for non-DoD active duty. \"\"Non-fixed\"\" facilities are generally deployed DoD health care activities','not providing services on or in association with a DoD fort or base. \"\"Non-fixed\"\" facilities include hospital ships.\"'),
	('287300000X','Hospitals','Christian Science Sanitorium','','\"Inactive','use 282J00000X\"'),
	('291900000X','Laboratories','Military Clinical Medical Laboratory','','A Department of Defense (DoD) medical clinical reference laboratory not associated with a DoD Hospital or DoD Clinic. An example is the Armed Forces Institute of Pathology.','[1/1/2005: new]'),
	('291U00000X','Laboratories','Clinical Medical Laboratory','','\"(1) A clinical laboratory is a facility for the biological','microbiological'),
	('292200000X','Laboratories','Dental Laboratory','','\"A commercial laboratory specializing in the construction of dental appliances that conform to a dentist\'s specifications including the construction of dentures (complete or partial)','orthodontic appliances'),
	('293D00000X','Laboratories','Physiological Laboratory','','\"A laboratory that operates independently of a hospital and physician\'s office to furnish physiological diagnostic services (e.g. EEG\'s ','EKG\'s'),
	('302F00000X','Managed Care Organizations','Exclusive Provider Organization','','\"(1) An EPO is a form of PPO','in which patients must visit a caregiver that is specified on its panel of providers (is a participating provider). If a visit to an outside(not participating) provider is made the EPO offers very limited or no coverage for the medical service; (2) While similar to a PPO in that an EPO allows patients to go outside the network for care'),
	('302R00000X','Managed Care Organizations','Health Maintenance Organization','','\"(1) A form of health insurance in which its members prepay a premium for the HMO\'s health services which generally include inpatient and ambulatory care. For the patient','an HMO means reduced out-of-pocket costs (i.e. no deductible)'),
	('305R00000X','Managed Care Organizations','Preferred Provider Organization','','\"A group of physicians and/or hospitals who contract with an employer to provide services to their employees. In a PPO','the patient may got to the physician of his/her choice'),
	('305S00000X','Managed Care Organizations','Point of Service','','This product may also be called an open-ended HMO and offers a transition product incorporating features of both HMOs and PPOs. Beneficiaries are enrolled in an HMO but have the option to go outside the networks for an additional cost.','\"Source: \"\"Glossary of terms used in managed care\"\" Developed by the Managed Care Assembly (MCA) of Medical Group Management Association (MGMA)'),
	('310400000X','Nursing & Custodial Care Facilities','Assisted Living Facility','','\"A facility providing supportive services to individuals who can function independently in most areas of activity','but need assistance and/or monitoring to assure safety and well being.\"'),
	('3104A0625X','Nursing & Custodial Care Facilities','Assisted Living Facility','\"Assisted Living','Mental Illness\"','\"A facility providing supportive services to individuals who can function independently in most areas of activity'),
	('3104A0630X','Nursing & Custodial Care Facilities','Assisted Living Facility','\"Assisted Living','Behavioral Disturbances\"','\"A facility providing supportive services to individuals who can function independently in most areas of activity'),
	('310500000X','Nursing & Custodial Care Facilities','\"Intermediate Care Facility','Mental Illness\"','','A nursing facility that provides an intermediate level of nursing care to individuals whose functional abilities are significantly compromise by mental illness.'),
	('311500000X','Nursing & Custodial Care Facilities','Alzheimer Center (Dementia Center)','','\"A freestanding facility or special care unit of a long term care facility focusing on patient care of individuals diagnosed with dementia or Alzheimer\'s Disease or their related diseases. Six elements of the facility/unit set it apart from other (the rest of the) facilities(y):  Admission of residents with dementia (including those with Alzheimer\'s disease);  Staff who are specially selected','trained'),
	('311Z00000X','Nursing & Custodial Care Facilities','Custodial Care Facility','','\"A facility providing care that serves to assist an individual in the activities of daily living','such as assistance in walking'),
	('311ZA0620X','Nursing & Custodial Care Facilities','Custodial Care Facility','Adult Care Home','A custodial care facility providing supportive and personal care services to disabled and/or elderly individuals who cannot function independently in most areas of activity and need assistance and monitoring to enable them to remain in a home like environment.','[7/1/2003: new]'),
	('313M00000X','Nursing & Custodial Care Facilities','Nursing Facility/Intermediate Care Facility','','\"An institution (or a distinct part of an institution) which- (1) is primarily engaged in providing to residents- (A) skilled nursing care and related services for residents who require medical or nursing care','(B) rehabilitation services for the rehabilitation of injured'),
	('314000000X','Nursing & Custodial Care Facilities','Skilled Nursing Facility','','\"(1) A skilled nursing facility is a facility or distinct part of an institution whose primary function is to provide medical','continuous nursing'),
	('3140N1450X','Nursing & Custodial Care Facilities','Skilled Nursing Facility','\"Nursing Care','Pediatric\"','\"A nursing care facility designed and staffed for the provision of nursing care and appropriate educational and habilitative/rehabilitative services to children with multiple'),
	('315D00000X','Nursing & Custodial Care Facilities','\"Hospice','Inpatient\"','','\"A provider organization'),
	('315P00000X','Nursing & Custodial Care Facilities','\"Intermediate Care Facility','Mentally Retarded\"','','(1) A public institution for care of the mentally retarded or people with related conditions. (2) An institution giving active treatment to mentally retarded or developmentally disabled persons or persons with related conditions. The primary purpose of the institution is to provide health or rehabilitative services to such individuals.'),
	('317400000X','Nursing & Custodial Care Facilities','Christian Science Facility','','\"Inactive','use 282J00000X\"'),
	('320600000X','Residential Treatment Facilities','\"Residential Treatment Facility','Mental Retardation and/or Developmental Disabilities\"','','A residential facility that provides habilitation services and other care and treatment to adults or children diagnosed with developmental disabilities and/or mental retardation and are not able to live independently.'),
	('320700000X','Residential Treatment Facilities','\"Residential Treatment Facility','Physical Disabilities\"','','A residential facility that provides habilitation services and other care and treatment to adults or children diagnosed with developmental disabilities and/or mental retardation and are not able to live independently.'),
	('320800000X','Residential Treatment Facilities','\"Community Based Residential Treatment Facility','Mental Illness\"','','A home-like residential facility providing psychiatric treatment and psycho/social rehabilitative services to individuals diagnosed with mental illness.'),
	('320900000X','Residential Treatment Facilities','\"Community Based Residential Treatment Facility','Mental Retardation and/or Developmental Disabilities\"','','\"A home-like residential facility providing habilitation'),
	('322D00000X','Residential Treatment Facilities','\"Residential Treatment Facility','Emotionally Disturbed Children\"','','\"A provider facility or distinct part of the organization which renders an interdisciplinary program of mental health treatment to individuals under 21 years of age who have persistent dysfunction in major life areas. The dysfunction is of an extent and pervasiveness that requires a protected and highly structured therapeutic environment. These organizations'),
	('323P00000X','Residential Treatment Facilities','Psychiatric Residential Treatment Facility','','\"A residential treatment facility (RTF) is a facility or distinct part of a facility that provides to children and adolescents','a total'),
	('324500000X','Residential Treatment Facilities','Substance Abuse Rehabilitation Facility','','\"A facility or distinct part of a facility that provides a 24 hr therapeutically planned living and rehabilitative intervention environment for the treatment of individuals with disorders in the abuse of drugs','alcohol'),
	('3245S0500X','Residential Treatment Facilities','Substance Abuse Rehabilitation Facility','\"Substance Abuse Treatment','Children\"','\"A facility or distinct part of a facility that provides a 24 hr therapeutically planned living and rehabilitative intervention environment for the treatment of children with disorders in the use of drugs'),
	('331L00000X','Suppliers','Blood Bank','','\"An institution (organization or distinct part thereof) that performs','or is responsible for the performance of'),
	('332000000X','Suppliers','Military/U.S. Coast Guard Pharmacy','','\"A Department of Defense (DoD) or U.S. Coast Guard entity whose primary function is to store','prepare and dispense pharmaceuticals and other associated items to Uniformed Services beneficiaries.  These pharmacies may be associated with a DoD or U.S. Coast Guard clinic'),
	('332100000X','Suppliers','Department of Veterans Affairs (VA) Pharmacy','','\"Department of Veterans Affairs (VA) Pharmacy means any place under VA jurisdiction where drugs are dispensed and Pharmaceutical Care is provided to enrolled Veterans','by licensed pharmacists. The Pharmacy is reviewed by JCAHO'),
	('332800000X','Suppliers','Indian Health Service/Tribal/Urban Indian Health (I/T/U) Pharmacy','','\"An Indian Health Service/Tribal/Urban Indian Health (I/T/U) Pharmacy means a pharmacy operated by the Indian Health Service','an Indian tribe or tribal organization'),
	('332900000X','Suppliers','Non-Pharmacy Dispensing Site','','\"A site other than a pharmacy that dispenses medicinal preparations under the supervision of a physician to patients for self-administration. (e.g. physician offices','ER'),
	('332B00000X','Suppliers','Durable Medical Equipment & Medical Supplies','','\"A supplier of medical equipment such as respirators','wheelchairs'),
	('332BC3200X','Suppliers','Durable Medical Equipment & Medical Supplies','Customized Equipment','Definition to come...',''),
	('332BD1200X','Suppliers','Durable Medical Equipment & Medical Supplies','Dialysis Equipment & Supplies','Definition to come...',''),
	('332BN1400X','Suppliers','Durable Medical Equipment & Medical Supplies','Nursing Facility Supplies','Definition to come...',''),
	('332BP3500X','Suppliers','Durable Medical Equipment & Medical Supplies','Parenteral & Enteral Nutrition','Definition to come...',''),
	('332BX2000X','Suppliers','Durable Medical Equipment & Medical Supplies','Oxygen Equipment & Supplies','Definition to come...',''),
	('332G00000X','Suppliers','Eye Bank','','\"An eye bank procures and distributes eyes for transplant','education and research. To promote patient safety'),
	('332H00000X','Suppliers','Eyewear Supplier','','\"An organization that provides spectacles','contact lenses'),
	('332S00000X','Suppliers','Hearing Aid Equipment','','\"The manufacture and/or sale of electronic hearing aids','their component parts'),
	('332U00000X','Suppliers','Home Delivered Meals','','\"Home-delivered meals are those services or activities designed to prepare and deliver one or more meals a day to an individual\'s residence in order to prevent institutionalization','malnutrition'),
	('333300000X','Suppliers','Emergency Response System Companies','','\"A supplier of a personal emergency response system (PERS)','which is an electronic device that enables a patient to receive emergency assistance when needed. The PERS is one of two different methodologies of notification: (1) where the patient summons emergency assistance themselves directly through the device or (2) emergency assistance is summoned through secure activation by the caretaker/guardian'),
	('333600000X','Suppliers','Pharmacy','','\"A facility used by pharmacists for the compounding and dispensing of medicinal preparations and other associated professional and administrative services. A pharmacy is a facility whose primary function is to store','prepare and legally dispense prescription drugs under the professional supervision of a licensed pharmacist. It meets any licensing or certification standards set forth by the jurisdiction where it is located.\"'),
	('3336C0002X','Suppliers','Pharmacy','Clinic Pharmacy','\"A pharmacy in a clinic','emergency room or hospital (outpatient) that dispenses medications to patients for self-administration under the supervision of a pharmacist.\"'),
	('3336C0003X','Suppliers','Pharmacy','Community/Retail Pharmacy','\"A pharmacy where pharmacists store','prepare'),
	('3336C0004X','Suppliers','Pharmacy','Compounding Pharmacy','A pharmacy that specializes in the preparation of components into a drug preparation as the result of a Practitioner\'s Prescription Drug Order or initiative based on the Practitioner/Patient/Pharmacist relationship in the course of professional practice.  A compounding pharmacy utilizes specialized equipment and specially designed facilities necessary to meet the legal and quality requirements of its scope of compounding practice.','\"Sources:  NABP Model Practice Act'),
	('3336H0001X','Suppliers','Pharmacy','Home Infusion Therapy Pharmacy','\"Pharmacy-based','decentralized patient care organization with expertise in USP 797-compliant sterile drug compounding that provides care to patients with acute or chronic conditions generally pertaining to parenteral administration of drugs'),
	('3336I0012X','Suppliers','Pharmacy','Institutional Pharmacy','\"A pharmacy in a hospital (inpatient) or institution used by pharmacists for the compounding and delivery of medicinal preparations to be administered to the patient by nursing or other authorized personnel. Institutional Pharmacies also counsel patients and caregivers; administer vaccinations; and provide other professional services associated with pharmaceutical care such as health screenings','consultative services with other health care providers'),
	('3336L0003X','Suppliers','Pharmacy','Long Term Care Pharmacy','\"A pharmacy that dispenses medicinal preparations delivered to patients residing within an intermediate or skilled nursing facility','including intermediate care facilities for mentally retarded'),
	('3336M0002X','Suppliers','Pharmacy','Mail Order Pharmacy','\"A pharmacy where pharmacists compound or dispense prescriptions or other medications in accordance with federal and state law','using common carriers to deliver the medications to patient or their caregivers. Mail order pharmacies counsel patients and caregivers (sometimes independent of the dispensing process) through telephone or email contact and provide other professional services associated with pharmaceutical care appropriate to the setting. Mail order pharmacies are licensed as a Mail Order Pharmacy in the state where they are located and may also be licensed or registered as nonresident pharmacies in other states.\"'),
	('3336M0003X','Suppliers','Pharmacy','Managed Care Organization Pharmacy','A pharmacy owned by a managed care organization (MCO) used by pharmacists for the compounding and dispensing of medicinal preparations to that MCO\'s covered members only.','\"Source: Developed by National Council for Prescription Drug Programs (NCPDP)'),
	('3336N0007X','Suppliers','Pharmacy','Nuclear Pharmacy','A pharmacy dedicated to the compounding and dispensing of radioactive materials for use in nuclear imaging and nuclear medical procedures.','\"Source: Developed by National Council for Prescription Drug Programs (NCPDP)'),
	('3336S0011X','Suppliers','Pharmacy','Specialty Pharmacy','\"A pharmacy that dispenses generally low volume and high cost medicinal preparations to patients who are undergoing intensive therapies for illnesses that are generally chronic','complex and potentially life threatening. Often these therapies require specialized delivery and administration.\"'),
	('335E00000X','Suppliers','Prosthetic/Orthotic Supplier','','\"An organization that provides prosthetic and orthotic care which may include','but is not limited to'),
	('335G00000X','Suppliers','Medical Foods Supplier','','\"A supplier of special replacement foods for clients with errors of metabolism that prohibit them from eating a regular diet.   Medical foods are lacking in the compounds which cause complications of the metabolic disorder','and are not generally available in grocery stores'),
	('335U00000X','Suppliers','Organ Procurement Organization','','A federally designated organization that works with hospital personnel in retrieval of organs for transplantation. The federal government designates an OPO\'s service area and the hospitals with which an OPO is to establish working relationships.',''),
	('335V00000X','Suppliers','Portable X-ray and/or Other Portable Diagnostic Imaging Supplier','','\"A supplier that provides one or more of the following portable services','including but not limited to'),
	('341600000X','Transportation Services','Ambulance','','\"An emergency vehicle used for transporting patients to a health care facility after injury or illness. Types of ambulances used in the United States include ground (surface) ambulance','rotor-wing (helicopter)'),
	('3416A0800X','Transportation Services','Ambulance','Air Transport','Definition to come...','[1/1/2005: title modified]'),
	('3416L0300X','Transportation Services','Ambulance','Land Transport','Definition to come...','[1/1/2005: title modified]'),
	('3416S0300X','Transportation Services','Ambulance','Water Transport','Definition to come...','[1/1/2005: title modified]'),
	('341800000X','Transportation Services','Military/U.S. Coast Guard Transport','','Definition to come...','[1/1/2005: new; 7/1/2006 title modified]'),
	('3418M1110X','Transportation Services','Military/U.S. Coast Guard Transport','\"Military or U.S. Coast Guard Ambulance','Ground Transport\"','Vehicle and staff for patient emergency or non-emergency ground transport. Includes traditional ambulances as well as ambulance buses.'),
	('3418M1120X','Transportation Services','Military/U.S. Coast Guard Transport','\"Military or U.S. Coast Guard Ambulance','Air Transport\"','Vehicle and staff for patient emergency or non-emergency air transport.'),
	('3418M1130X','Transportation Services','Military/U.S. Coast Guard Transport','\"Military or U.S. Coast Guard Ambulance','Water Transport\"','Vehicle and staff for patient emergency or non-emergency sea/water transport'),
	('343800000X','Transportation Services','Secured Medical Transport (VAN)','','\"A public or privately owned transportation service with vehicles','specially equipped to provide enhanced safety'),
	('343900000X','Transportation Services','Non-emergency Medical Transport (VAN)','','\"A land vehicle with a capacity to meet special height','clearance'),
	('344600000X','Transportation Services','Taxi','','\"A land commercial vehicle used for the transporting of persons in non-emergency situations. The vehicle meets local','county or state regulations set forth by the jurisdictions where it is located.\"'),
	('344800000X','Transportation Services','Air Carrier','','\"An air company that the Federal Aviation Administration','the certificate-holding district office (CHDO)'),
	('347B00000X','Transportation Services','Bus','','A public or private organization or business licensed to provide bus services.',''),
	('347C00000X','Transportation Services','Private Vehicle','','An individual paid to provide non-emergency transportation using their privately owned/leased vehicle.',''),
	('347D00000X','Transportation Services','Train','','\"An organization or business licensed to provide passenger train service','including light rail'),
	('347E00000X','Transportation Services','Transportation Broker','','\"A public or private organization or business contracted to arrange non-emergency medical transportation services','including appropriate ancillary services'),
	('363A00000X','Physician Assistants & Advanced Practice Nursing Providers','Physician Assistant','','\"A physician assistant is a person who has successfully completed an accredited education program for physician assistant','is licensed by the state and is practicing within the scope of that license. Physician assistants are formally trained to perform many of the routine'),
	('363AM0700X','Physician Assistants & Advanced Practice Nursing Providers','Physician Assistant','Medical','Definition to come...',''),
	('363AS0400X','Physician Assistants & Advanced Practice Nursing Providers','Physician Assistant','Surgical','Definition to come...',''),
	('363L00000X','Physician Assistants & Advanced Practice Nursing Providers','Nurse Practitioner','','\"(1) A registered nurse provider with a graduate degree in nursing prepared for advanced practice involving independent and interdependent decision making and direct accountability for clinical judgment across the health care continuum or in a certified specialty. (2) A registered nurse who has completed additional training beyond basic nursing education and who provides primary health care services in accordance with state nurse practice laws or statutes. Tasks performed by nurse practitioners vary with practice requirements mandated by geographic','political'),
	('363LA2100X','Physician Assistants & Advanced Practice Nursing Providers','Nurse Practitioner','Acute Care','Definition to come...',''),
	('363LA2200X','Physician Assistants & Advanced Practice Nursing Providers','Nurse Practitioner','Adult Health','Definition to come...',''),
	('363LC0200X','Physician Assistants & Advanced Practice Nursing Providers','Nurse Practitioner','Critical Care Medicine','Definition to come...',''),
	('363LC1500X','Physician Assistants & Advanced Practice Nursing Providers','Nurse Practitioner','Community Health','Definition to come...',''),
	('363LF0000X','Physician Assistants & Advanced Practice Nursing Providers','Nurse Practitioner','Family','Definition to come…',''),
	('363LG0600X','Physician Assistants & Advanced Practice Nursing Providers','Nurse Practitioner','Gerontology','Definition to come...',''),
	('363LN0000X','Physician Assistants & Advanced Practice Nursing Providers','Nurse Practitioner','Neonatal','Definition to come...',''),
	('363LN0005X','Physician Assistants & Advanced Practice Nursing Providers','Nurse Practitioner','\"Neonatal','Critical Care\"','Definition to come...'),
	('363LP0200X','Physician Assistants & Advanced Practice Nursing Providers','Nurse Practitioner','Pediatrics','Definition to come...',''),
	('363LP0222X','Physician Assistants & Advanced Practice Nursing Providers','Nurse Practitioner','\"Pediatrics','Critical Care\"','Definition to come...'),
	('363LP0808X','Physician Assistants & Advanced Practice Nursing Providers','Nurse Practitioner','Psychiatric/Mental Health','Definition to come...',''),
	('363LP1700X','Physician Assistants & Advanced Practice Nursing Providers','Nurse Practitioner','Perinatal','Definition to come...',''),
	('363LP2300X','Physician Assistants & Advanced Practice Nursing Providers','Nurse Practitioner','Primary Care','Definition to come...',''),
	('363LS0200X','Physician Assistants & Advanced Practice Nursing Providers','Nurse Practitioner','School','Definition to come…',''),
	('363LW0102X','Physician Assistants & Advanced Practice Nursing Providers','Nurse Practitioner','Women\'s Health','Definition to come...',''),
	('363LX0001X','Physician Assistants & Advanced Practice Nursing Providers','Nurse Practitioner','Obstetrics & Gynecology','Definition to come...',''),
	('363LX0106X','Physician Assistants & Advanced Practice Nursing Providers','Nurse Practitioner','Occupational Health','Definition to come...',''),
	('364S00000X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','','\"A registered nurse who','through a graduate degree program in nursing'),
	('364SA2100X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Acute Care','Definition to come...',''),
	('364SA2200X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Adult Health','Definition to come...',''),
	('364SC0200X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Critical Care Medicine','Definition to come...',''),
	('364SC1501X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Community Health/Public Health','Definition to come...',''),
	('364SC2300X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Chronic Care','Definition to come...',''),
	('364SE0003X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Emergency','Definition to come...',''),
	('364SE1400X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Ethics','Definition to come...',''),
	('364SF0001X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Family Health','Definition to come...',''),
	('364SG0600X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Gerontology','Definition to come...',''),
	('364SH0200X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Home Health','Definition to come...',''),
	('364SH1100X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Holistic','Definition to come...',''),
	('364SI0800X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Informatics','Definition to come...',''),
	('364SL0600X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Long-Term Care','Definition to come...',''),
	('364SM0705X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Medical-Surgical','Definition to come...',''),
	('364SN0000X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Neonatal','Definition to come...',''),
	('364SN0800X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Neuroscience','Definition to come...',''),
	('364SP0200X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Pediatrics','Definition to come...',''),
	('364SP0807X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','\"Psychiatric/Mental Health','Child & Adolescent\"','Definition to come...'),
	('364SP0808X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Psychiatric/Mental Health','Definition to come...',''),
	('364SP0809X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','\"Psychiatric/Mental Health','Adult\"','Definition to come...'),
	('364SP0810X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','\"Psychiatric/Mental Health','Child & Family\"','Definition to come...'),
	('364SP0811X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','\"Psychiatric/Mental Health','Chronically Ill\"','Definition to come...'),
	('364SP0812X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','\"Psychiatric/Mental Health','Community\"','Definition to come...'),
	('364SP0813X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','\"Psychiatric/Mental Health','Geropsychiatric\"','Definition to come...'),
	('364SP1700X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Perinatal','Definition to come...',''),
	('364SP2800X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Perioperative','Definition to come...',''),
	('364SR0400X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Rehabilitation','Definition to come…',''),
	('364SS0200X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','School','Definition to come…',''),
	('364ST0500X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Transplantation','Definition to come...',''),
	('364SW0102X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Women\'s Health','Definition to come...',''),
	('364SX0106X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Occupational Health','Definition to come...',''),
	('364SX0200X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','Oncology','Definition to come...',''),
	('364SX0204X','Physician Assistants & Advanced Practice Nursing Providers','Clinical Nurse Specialist','\"Oncology','Pediatrics\"','Definition to come...'),
	('367500000X','Physician Assistants & Advanced Practice Nursing Providers','\"Nurse Anesthetist','Certified Registered\"','','\"(1) A licensed registered nurse with advanced specialty education in anesthesia who'),
	('367A00000X','Physician Assistants & Advanced Practice Nursing Providers','Advanced Practice Midwife','','\"Midwifery practice as conducted by certified nurse-midwives (CNMs) and certified midwives (CMs) is the independent management of women\'s health care','focusing particularly on pregnancy'),
	('367H00000X','Physician Assistants & Advanced Practice Nursing Providers','Anesthesiologist Assistant','','\"An individual certified by the state to perform anesthesia services under the direct supervision of an anesthesiologist.  Anesthesiologist Assistants are required to have a bachelor\'s degree with a premed curriculum prior to entering a two-year anesthesiology assistant program','which is focused upon the delivery and maintenance of anesthesia care as well as advanced patient monitoring techniques.  An Anesthesiologist Assistant must work as a member of the anesthesia care team under the direction of a qualified Anesthesiologist.\"'),
	('372500000X','Nursing Service Related Providers','Chore Provider','','\"An individual who provides home maintenance services required to sustain a safe','sanitary living environment for individuals who because of age or disabilities is unable to perform the activities.  These services include heavy household chores such as washing floors'),
	('372600000X','Nursing Service Related Providers','Adult Companion','','\"An individual who provides supervision','socialization'),
	('373H00000X','Nursing Service Related Providers','Day Training/Habilitation Specialist','','Individuals experienced or trained in working with developmentally disabled individuals who need assistance in acquiring and maintaining life skills that enable them to cope more effectively with the demands of independent living.',''),
	('374700000X','Nursing Service Related Providers','Technician','','\"(1) A person with specialized training in a narrow field of expertise whose occupation requires training and is skilled in specific technical processes and procedures. (2) An individual having special skill or practical knowledge in an area','such as operation and maintenance of equipment or performance of laboratory procedures involving biochemical analyses. Special technical qualifications are normally required'),
	('3747A0650X','Nursing Service Related Providers','Technician','Attendant Care Provider','\"An individual who provides hands-on care','of both a supportive and health related nature'),
	('3747P1801X','Nursing Service Related Providers','Technician','Personal Care Attendant','\"An individual who provides assistance with eating','bathing'),
	('374J00000X','Nursing Service Related Providers','Doula','','\"Doulas work in a variety of settings and have been trained to provide physical','emotional'),
	('374K00000X','Nursing Service Related Providers','Religious Nonmedical Practitioner','','\"A religious nonmedical practitioner offers spiritually-based care.  Services may be rendered in an office','home'),
	('374T00000X','Nursing Service Related Providers','Religious Nonmedical Nursing Personnel','','\"Religious nonmedical nursing personnel are experienced in caring for the physical needs of nonmedical patients.  For example','caring for the physical needs such as assistance with activities of daily living; assistance with moving'),
	('374U00000X','Nursing Service Related Providers','Home Health Aide','','\"A person trained to assist public health nurses','home health nurses'),
	('376G00000X','Nursing Service Related Providers','Nursing Home Administrator','','\"An individual','often licensed by the state'),
	('376J00000X','Nursing Service Related Providers','Homemaker','','\"An individual who provides general household activities such as meal preparation','laundry'),
	('376K00000X','Nursing Service Related Providers','Nurse\'s Aide','','\"(1) An unlicensed individual who is trained to function in an assistive role to the licensed nurse in the provision of patient/client activities as delegated by the nurse; (2) An individual trained (either on-the-job or through a formal course generally of less than one year) and experienced in performing patient or client-care nursing tasks that do not require the skills of a specialist','technician'),
	('385H00000X','Respite Care Facility','Respite Care','','Definition to come.',''),
	('385HR2050X','Respite Care Facility','Respite Care','Respite Care Camp','\"A camping facility that provides specialized respite care to individuals requiring enhanced services to enable them to remain in the community','(e.g.'),
	('385HR2055X','Respite Care Facility','Respite Care','\"Respite Care','Mental Illness','Child\"'),
	('385HR2060X','Respite Care Facility','Respite Care','\"Respite Care','Mental Retardation and/or Developmental Disabilities\"','\"A facility or distinct part of a facility that provides short term'),
	('385HR2065X','Respite Care Facility','Respite Care','\"Respite Care','Physical Disabilities','Child\"'),
	('390200000X','\"Student','Health Care\"','Student in an Organized Health Care Education/Training Program','','\"An individual who is enrolled in an organized health care education/training program leading to a degree'),
	('405300000X','Other Service Providers','Prevention Professional','','\"Prevention Professionals work in programs aimed to address specific patient needs','such as suicide prevention');

/*!40000 ALTER TABLE `taxonomy` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table telerad_contracts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `telerad_contracts`;

CREATE TABLE `telerad_contracts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reader_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reader_gateway_destination` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sender_gateway_destination` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `reports_email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specialty` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_firstname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_lastname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_middlename` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_suffix` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_address1` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_address2` char(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_city` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_country` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_postal` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_npi` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_license_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_license_country` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssn` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_phone_country` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_phone_number` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `providertype` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dea` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `taxonomy` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orthanc_server_ids` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='ALTER TABLE telerad_contracts AUTO_INCREMENT = 2';

LOCK TABLES `telerad_contracts` WRITE;
/*!40000 ALTER TABLE `telerad_contracts` DISABLE KEYS */;

INSERT INTO `telerad_contracts` (`id`, `reader_id`, `reader_gateway_destination`, `sender_gateway_destination`, `reports_email`, `specialty`, `doc_firstname`, `doc_lastname`, `doc_middlename`, `doc_suffix`, `doc_address1`, `doc_address2`, `doc_city`, `doc_state`, `doc_country`, `doc_postal`, `doc_npi`, `doc_license_id`, `doc_license_country`, `tax_id`, `ssn`, `doc_phone_country`, `doc_phone_number`, `providertype`, `dea`, `taxonomy`, `notes`, `orthanc_server_ids`)
VALUES
	(1,'0001','1','1','reader@orthanc.test','Diagnostic radiology','Test','Reader','','M.D.','','','','','','','','LICENSE','','ein','','','','1','dea','2085R0202X','test\n				\n\n				\n\n				','[1,2]');

/*!40000 ALTER TABLE `telerad_contracts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'user''s name, unique',
  `user_email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'user''s email, unique',
  `user_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'user''s activation status',
  `user_password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'user''s password in salted and hashed format',
  `user_roles` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[]' COMMENT 'user''s account type (basic, premium, etc)',
  `session_id` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores session cookie id to prevent session concurrency',
  `fname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `patientid` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doctor_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reader_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'user''s deletion status',
  `avatar_storage` tinyint(1) DEFAULT '0' COMMENT '1 if user has a local avatar, 0 if not',
  `user_has_avatar` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 if user has a local avatar, 0 if not',
  `avatar` mediumblob,
  `avatar_mime` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_size` int DEFAULT NULL,
  `user_remember_me_token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'user''s remember-me cookie token',
  `user_creation_timestamp` bigint DEFAULT NULL COMMENT 'timestamp of the creation of user''s account',
  `user_suspension_timestamp` bigint DEFAULT NULL COMMENT 'Timestamp till the end of a user suspension',
  `user_suspended` tinyint(1) NOT NULL DEFAULT '0',
  `user_last_login_timestamp` bigint DEFAULT NULL COMMENT 'timestamp of user''s last login',
  `user_failed_logins` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'user''s failed login attempts',
  `user_last_failed_login` int DEFAULT NULL COMMENT 'unix timestamp of last failed login attempt',
  `user_activation_hash` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'user''s email verification hash string',
  `user_password_reset_hash` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'user''s password reset code',
  `user_password_reset_timestamp` bigint DEFAULT NULL COMMENT 'timestamp of the password reset request',
  `reminders` tinyint(1) NOT NULL DEFAULT '0',
  `reports` tinyint(1) NOT NULL DEFAULT '0',
  `otp_secret` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email` (`user_email`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='user data';

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_active`, `user_password_hash`, `user_roles`, `session_id`, `fname`, `lname`, `mname`, `dob`, `patientid`, `doctor_id`, `reader_id`, `user_deleted`, `avatar_storage`, `user_has_avatar`, `avatar`, `avatar_mime`, `avatar_name`, `avatar_size`, `user_remember_me_token`, `user_creation_timestamp`, `user_suspension_timestamp`, `user_suspended`, `user_last_login_timestamp`, `user_failed_logins`, `user_last_failed_login`, `user_activation_hash`, `user_password_reset_hash`, `user_password_reset_timestamp`, `reminders`, `reports`, `otp_secret`, `otp`)
VALUES
	(1,'allprofiles','allprofiles@orthanc.test',1,'$2y$10$6.Hf971XE9R9P39wM86Qcul5lhs1RAIlmBdUpd6rLCdMgo/BAfqrC','[1,2,3,4,5,6,7,8]',NULL,'Test','User','',NULL,'0001','0001','0001',0,1,1,NULL,'image/png','1.png',1672923,NULL,1422205178,NULL,0,1625257138,0,NULL,'b0026c7491232c2bc1aa7dd28aafa0cf89521315','e643a14cecf446e63528f38fc16835692ce4b92d',1608566868,0,0,'',0);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table x12_partners
# ------------------------------------------------------------

DROP TABLE IF EXISTS `x12_partners`;

CREATE TABLE `x12_partners` (
  `id` int NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `x12_sender_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `x12_receiver_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `processing_format` enum('standard','medi-cal','cms','proxymed','oa_eligibility','availity_eligibility') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `x12_isa01` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00' COMMENT 'User logon Required Indicator',
  `x12_isa02` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '          ' COMMENT 'User Logon',
  `x12_isa03` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00' COMMENT 'User password required Indicator',
  `x12_isa04` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '          ' COMMENT 'User Password',
  `x12_isa05` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ZZ',
  `x12_isa07` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ZZ',
  `x12_isa14` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `x12_isa15` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'P',
  `x12_gs02` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `x12_per06` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `x12_dtp03` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'A',
  `x12_gs03` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
