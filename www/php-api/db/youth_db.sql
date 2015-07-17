-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: youth_db
-- ------------------------------------------------------
-- Server version	5.1.73

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_counselling_issues`
--

DROP TABLE IF EXISTS `tbl_counselling_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_counselling_issues` (
  `issue_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `issue_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`issue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_counselling_issues`
--

LOCK TABLES `tbl_counselling_issues` WRITE;
/*!40000 ALTER TABLE `tbl_counselling_issues` DISABLE KEYS */;
INSERT INTO `tbl_counselling_issues` VALUES (1,'Substance Abuse'),(2,'Relationship Issues'),(3,'Violence and Abuse'),(4,'Academic Difficulties'),(5,'Feeling Overwhelmed with stress'),(6,'Depression and Suicidal Thoughts'),(7,'Grief and Loss');
/*!40000 ALTER TABLE `tbl_counselling_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_counselling_registration`
--

DROP TABLE IF EXISTS `tbl_counselling_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_counselling_registration` (
  `registration_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `applicant_name` varchar(72) DEFAULT NULL,
  `gender` enum('M','F') NOT NULL,
  `applicant_age` char(2) NOT NULL,
  `applicant_mobile` char(8) NOT NULL,
  `applicant_email` varchar(45) DEFAULT NULL,
  `dzongkhag_id` char(2) NOT NULL,
  `dzongkhag_area` varchar(45) DEFAULT NULL,
  `issue_id` smallint(5) unsigned NOT NULL,
  `counselling_details` varchar(45) NOT NULL,
  `date_registered` datetime NOT NULL,
  PRIMARY KEY (`registration_id`),
  KEY `fk1_dzongkhag_id_idx` (`dzongkhag_id`),
  KEY `fk2_issue_id_idx` (`issue_id`),
  CONSTRAINT `fk1_dzongkhag_id` FOREIGN KEY (`dzongkhag_id`) REFERENCES `tbl_dzongkhags` (`dzongkhag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk2_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `tbl_counselling_issues` (`issue_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_counselling_registration`
--

LOCK TABLES `tbl_counselling_registration` WRITE;
/*!40000 ALTER TABLE `tbl_counselling_registration` DISABLE KEYS */;
INSERT INTO `tbl_counselling_registration` VALUES (3,'Tashi Daw','M','31','77609377','dawtashi8@gmail.com','16','Chubachu',4,'Test counselling required!','2015-07-16 08:44:01'),(4,'Kinga Pem','F','30','77292929','kinga@yahoo.com','16','Motithang',5,'Test for counselling...','2015-07-16 08:52:41');
/*!40000 ALTER TABLE `tbl_counselling_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_dzongkhags`
--

DROP TABLE IF EXISTS `tbl_dzongkhags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_dzongkhags` (
  `dzongkhag_id` char(2) NOT NULL,
  `dzongkhag_name` varchar(45) NOT NULL,
  PRIMARY KEY (`dzongkhag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_dzongkhags`
--

LOCK TABLES `tbl_dzongkhags` WRITE;
/*!40000 ALTER TABLE `tbl_dzongkhags` DISABLE KEYS */;
INSERT INTO `tbl_dzongkhags` VALUES ('01','Bumthang'),('02','Chukha'),('03','Dagana'),('04','Gasa'),('05','Haa'),('06','Lhuntse'),('07','Mongar'),('08','Paro'),('09','Pemagatsel'),('10','Punakha'),('11','Samdrupjongkhar'),('12','Samtse'),('13','Sarpang'),('14','Trashiyangtse'),('15','Tashigang'),('16','Thimphu'),('17','Trongsa'),('18','Tsirang'),('19','Wangduephodrang'),('20','Zhemgang');
/*!40000 ALTER TABLE `tbl_dzongkhags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_login`
--

DROP TABLE IF EXISTS `tbl_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_login`
--

LOCK TABLES `tbl_login` WRITE;
/*!40000 ALTER TABLE `tbl_login` DISABLE KEYS */;
INSERT INTO `tbl_login` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3');
/*!40000 ALTER TABLE `tbl_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_school_counsellors`
--

DROP TABLE IF EXISTS `tbl_school_counsellors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_school_counsellors` (
  `counsellor_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `citizenship_id` char(11) NOT NULL,
  `employee_id` char(11) DEFAULT NULL,
  `email_address` varchar(45) DEFAULT NULL,
  `contact_numbers` varchar(16) DEFAULT NULL,
  `school_name` varchar(64) NOT NULL,
  `dzongkhag_id` char(2) NOT NULL,
  `counsellor_photo` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`counsellor_id`),
  UNIQUE KEY `cid_UNIQUE` (`citizenship_id`),
  KEY `fk_tbl_school_counsellors_dzongkhag_id_idx` (`dzongkhag_id`),
  CONSTRAINT `fk_tbl_school_counsellors_dzongkhag_id` FOREIGN KEY (`dzongkhag_id`) REFERENCES `tbl_dzongkhags` (`dzongkhag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_school_counsellors`
--

LOCK TABLES `tbl_school_counsellors` WRITE;
/*!40000 ALTER TABLE `tbl_school_counsellors` DISABLE KEYS */;
INSERT INTO `tbl_school_counsellors` VALUES (32,'Norbu','','Gyeltshen','200307359','200307359','','','Punakha Higher Secondary School','10','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(33,'Lhamo','','Lhamo','10811002450','','lhamolhamo45@gmail.com','17921032','Dechentshemo Middle Secondary School','10','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(34,'Pema','','Yangki','10906000324','','yoezertshogyal@gmail.com','17831452','Sonamthang Community School','10','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(35,'Kezang','','Choki','10803000316','','Kezangc352@gmail.com','17650556','Tashidingkha Middle Secondary School','10','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(36,'Sonam','','Tobgay','200701522','200701522','tobgyels68@yahoo.com','17678685','S/Jongkhar Middle Secondary School','11','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(37,'Tashi','','Tashi Norbu','11508000846','','tashi.bbf@gmail.com','77400800','Gomdar Middle Secondary School','11','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(38,'Dechen','','Yangdon','11513003984','','ydechen@rocketmail.com','77439375','Minjiwoong Middle Secondary School','11','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(39,'Karma','','Tashi','10905002280','','karmarig2014@gmail.com','17943131','Karmaling Higher Secondary School','11','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(40,'Pelden','','Dema','11106000617','','pelsypelden2009@gmail.com','17650843','Orong Higher Secondary School','11','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(41,'Reena','','Thapa','200501274','200501274','tasreen2005@yahoo.com','17515323','Samtse Higher Secondary School','12','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(42,'Chencho','','Wangdi','10505000092','','tshenchoongdi@gmail.com','17663240','Dorokha Middle Secondary School','12','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(43,'Prakash','','Pradhan','9607069','9607069','mailprakash_08@yahoo.com ','17655646','Sarpang Higher Secondary School','13','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(44,'Raj','Bhadhur','Ghalley','200407302','200407302','rajghalley2011@gmail.com','17587149','Gelephu Higher Secondary School','13','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(45,'Tshering','','Duba','11102000411','','tsheringdubatshering@gmail.com','17741046','Pelrithang Middle Secondary School','13','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(46,'Dawa','','Tshering','10202000722','','tsheringdawa630@gmail.com','17551816','Norbuling Middle Secondary School','13','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(47,'Nima','','Tshering','200901747','200901747','nixtsher48@yahoo.com','17698510','Bayling Higher Secondary School','14','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(48,'Phurpa','','Phurpa','11607001985','','phurpa@rocketmail.com','17887447','Tsenkharla Middle Secondary School','14','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(49,'Sangay','','Tenzin K','200407308','200407308','druksangay2003@yahoo.com','17690413','Kanglung Middle Secondary School','15','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(50,'Karma','','Gyelmo','0','','karmaye@yahoo.com','17744639','Jigmesherubling Higher Secondary School','15','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(51,'Penjor','','Wangchuk','11512004007','','wangchukpenjor@yahoo.com','17798452','Gongthung Middle Secondary School','15','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(52,'Sonam','','Zangmo','12008002951','','luak555@yahoo.com','77318720','Rangjung Higher Secondary School','15','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(53,'Ugyen','','Tenzin','11503003486','','ugyentenzin33@gmail.com','17808260','Tashitse Higher Secondary School','15','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(54,'Kelzang','','Udon','11606001207','','kelzangudon@gmail.com','17467893','Thrimshing Middle Secondary School','15','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(55,'Tashi','','Chephey','11505002189','','tashichephey@gmail.com','17530544','Udzorong Middle Secondary School','15','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(56,'Kuenga','','Tenzin','200601269','200601269','wealth_anevil@yahoo.com ','17752539','Loselling Middle Secondary School','16','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(57,'Sangay','','Phuntsho','200307364','200307364','p_sangay@yahoo.com ','17605403','Lungtenzampa Middle Secondary School','16','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(58,'Kuenzang','','Choden','200307357','200307357','kunza_choden@yahoo.com','17750582','Dechencholing Middle Secondary School','16','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(59,'Kezang','','Dukpa','200601179','200601179','keyans12@gmail.com','17609443','Khasadrapchu Middle Secondary School','16','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(60,'Yeshey','','Lhamo','200701330','200701330','fgcyeshey@yahoo.com','17647124','Motithang Higher Secondary School','16','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(61,'Tashi','','Wangmo','200601193','200601193','rosie_tasie@live.com','17267282','Changangkha Middle Secondary School','16','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(62,'Phurba','','Zangmo','200901731','200901731','phubzam2010@hotmail.com','17828242','Yangchenphug Higher Secondary School','16','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(63,'Laja','','Wangchuk','10901001401','','lha_wangs2009@yahoo.com','17687360','Wangbama Higher Secondary School','16','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(64,'Kesang','','Phuntsho','10811001006','','kesang2012@gmail.com','17610453','Taktse Higher Secondary School','17','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(65,'Jigme','','Phuntsho','10103000051','','jigmsphula@gmail.com','17659330','Tshangkha Middle Secondary School','17','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(66,'Yangchen','','Choden','200903023','200903023','yangchok86@yahoo.com','17928687','Mendrelgang Middle Secondary School','18','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(67,'Tashi','','Wangchuk','200801476','200801476','Jaggu85@yahoo.com ','17667191','Bajo Higher Secondary School','19','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(68,'Tandin','','Dema','200701446','200701446','trandrol12@gmail.com','17968253','Gaselo Higher Secondary School','19','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(69,'Karma','','Yoenten','10504001895','','kyoenten@yahoo.com','77209250','Phobjekha Middle Secondary School','19','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(70,'Sonam','','Lhamo','10204001030','','slpinkey390@gmail.com','17419627','Samtengang Middle Secondary School','19','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(71,'Kuenley','','Penjor','200601476','200601476','penjorkinley17@yahoo.com','17683415','Zhemgang Higher Secondary School','20','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),(72,'Sanchu','','Sanchu ','11306000163','','sanchudechen@yahoo.com','17414646','Buli Middle Secondary School','20','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg');
/*!40000 ALTER TABLE `tbl_school_counsellors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_youth_center_facilities`
--

DROP TABLE IF EXISTS `tbl_youth_center_facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_youth_center_facilities` (
  `facility_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `facility_name` varchar(45) NOT NULL,
  PRIMARY KEY (`facility_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_youth_center_facilities`
--

LOCK TABLES `tbl_youth_center_facilities` WRITE;
/*!40000 ALTER TABLE `tbl_youth_center_facilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_youth_center_facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_youth_center_types`
--

DROP TABLE IF EXISTS `tbl_youth_center_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_youth_center_types` (
  `center_type_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `center_type_name` varchar(32) NOT NULL,
  PRIMARY KEY (`center_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_youth_center_types`
--

LOCK TABLES `tbl_youth_center_types` WRITE;
/*!40000 ALTER TABLE `tbl_youth_center_types` DISABLE KEYS */;
INSERT INTO `tbl_youth_center_types` VALUES (1,'Youth Centers'),(2,'Drop In Centers'),(3,'Detoxification Centers'),(4,'Rehab Centers');
/*!40000 ALTER TABLE `tbl_youth_center_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_youth_centers`
--

DROP TABLE IF EXISTS `tbl_youth_centers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_youth_centers` (
  `center_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `center_name` varchar(45) NOT NULL,
  `dzongkhag_id` char(2) NOT NULL,
  `center_area` varchar(45) NOT NULL,
  `telephone` varchar(12) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `center_type_id` tinyint(3) unsigned NOT NULL,
  `stakeholder_id` smallint(3) unsigned NOT NULL,
  PRIMARY KEY (`center_id`),
  KEY `fk_tbl_youth_centers_tbl_youth_center_types1_idx` (`center_type_id`),
  KEY `fk_tbl_youth_centers_tbl_youth_stakeholders1_idx` (`stakeholder_id`),
  KEY `fk_tbl_youth_centers_tbl_dzongkhags1_idx` (`dzongkhag_id`),
  CONSTRAINT `fk_tbl_youth_centers_tbl_youth_center_types1` FOREIGN KEY (`center_type_id`) REFERENCES `tbl_youth_center_types` (`center_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_youth_centers_tbl_youth_stakeholders1` FOREIGN KEY (`stakeholder_id`) REFERENCES `tbl_youth_stakeholders` (`stakeholder_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_youth_centers_tbl_dzongkhags1` FOREIGN KEY (`dzongkhag_id`) REFERENCES `tbl_dzongkhags` (`dzongkhag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_youth_centers`
--

LOCK TABLES `tbl_youth_centers` WRITE;
/*!40000 ALTER TABLE `tbl_youth_centers` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_youth_centers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_youth_centers_has_tbl_youth_center_facilities`
--

DROP TABLE IF EXISTS `tbl_youth_centers_has_tbl_youth_center_facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_youth_centers_has_tbl_youth_center_facilities` (
  `facility_id` int(10) unsigned NOT NULL,
  `center_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`facility_id`,`center_id`),
  KEY `fk_tbl_youth_center_facilities_has_tbl_youth_centers_tbl_yo_idx` (`center_id`),
  KEY `fk_tbl_youth_center_facilities_has_tbl_youth_centers_tbl_yo_idx1` (`facility_id`),
  CONSTRAINT `fk_tbl_youth_center_facilities_has_tbl_youth_centers_tbl_yout1` FOREIGN KEY (`facility_id`) REFERENCES `tbl_youth_center_facilities` (`facility_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_youth_center_facilities_has_tbl_youth_centers_tbl_yout2` FOREIGN KEY (`center_id`) REFERENCES `tbl_youth_centers` (`center_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_youth_centers_has_tbl_youth_center_facilities`
--

LOCK TABLES `tbl_youth_centers_has_tbl_youth_center_facilities` WRITE;
/*!40000 ALTER TABLE `tbl_youth_centers_has_tbl_youth_center_facilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_youth_centers_has_tbl_youth_center_facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_youth_feedbacks`
--

DROP TABLE IF EXISTS `tbl_youth_feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_youth_feedbacks` (
  `feedback_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `youth_name` varchar(72) DEFAULT NULL,
  `youth_phone` varchar(16) DEFAULT NULL,
  `youth_email` varchar(45) DEFAULT NULL,
  `feedback_details` text NOT NULL,
  `feedback_date` datetime NOT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_youth_feedbacks`
--

LOCK TABLES `tbl_youth_feedbacks` WRITE;
/*!40000 ALTER TABLE `tbl_youth_feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_youth_feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_youth_mind_assessment`
--

DROP TABLE IF EXISTS `tbl_youth_mind_assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_youth_mind_assessment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(72) DEFAULT NULL,
  `gender` enum('M','F') NOT NULL COMMENT 'M-Male\nF-Female\n',
  `mobile` char(8) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `dzongkhag_area` varchar(45) NOT NULL,
  `talk_counsellor` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT 'Y-Yes\nN-No',
  `feeling` varchar(45) NOT NULL,
  `your_thoughts` text NOT NULL,
  `dzongkhag_id` char(2) NOT NULL,
  `assessment_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbl_youth_mind_assessment_tbl_dzongkhags1_idx` (`dzongkhag_id`),
  CONSTRAINT `fk_tbl_youth_mind_assessment_tbl_dzongkhags1` FOREIGN KEY (`dzongkhag_id`) REFERENCES `tbl_dzongkhags` (`dzongkhag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_youth_mind_assessment`
--

LOCK TABLES `tbl_youth_mind_assessment` WRITE;
/*!40000 ALTER TABLE `tbl_youth_mind_assessment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_youth_mind_assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_youth_stakeholders`
--

DROP TABLE IF EXISTS `tbl_youth_stakeholders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_youth_stakeholders` (
  `stakeholder_id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `stakeholder_name` varchar(45) NOT NULL,
  PRIMARY KEY (`stakeholder_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_youth_stakeholders`
--

LOCK TABLES `tbl_youth_stakeholders` WRITE;
/*!40000 ALTER TABLE `tbl_youth_stakeholders` DISABLE KEYS */;
INSERT INTO `tbl_youth_stakeholders` VALUES (1,'Department of Youth and Sports (DYS)'),(2,'Bhutan Narcotics Control Authority (BNCA)'),(3,'Youth Development Fund (YDF)'),(4,'Department of Employment'),(5,'RENEW'),(6,'Chigdhuen Phendhey'),(7,'JDWNRH');
/*!40000 ALTER TABLE `tbl_youth_stakeholders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-16  9:00:34
