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
  `counselling_details` mediumtext NOT NULL,
  `date_registered` datetime NOT NULL,
  PRIMARY KEY (`registration_id`),
  KEY `fk1_dzongkhag_id_idx` (`dzongkhag_id`),
  KEY `fk2_issue_id_idx` (`issue_id`),
  CONSTRAINT `fk1_dzongkhag_id` FOREIGN KEY (`dzongkhag_id`) REFERENCES `tbl_dzongkhags` (`dzongkhag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk2_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `tbl_counselling_issues` (`issue_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_counselling_registration`
--

LOCK TABLES `tbl_counselling_registration` WRITE;
/*!40000 ALTER TABLE `tbl_counselling_registration` DISABLE KEYS */;
INSERT INTO `tbl_counselling_registration` VALUES (3,'Tashi Daw','M','31','77609377','dawtashi8@gmail.com','16','Chubachu',4,'Test counselling required!','2015-07-16 08:44:01'),(4,'Kinga Pem','F','30','77292929','kinga@yahoo.com','16','Motithang',5,'attribute to set the position of the tooltip on top, bottom, left or the right side of the element. attribute to set the position of the tooltip on top, bottom, left or the right side of the element','2015-07-16 08:52:41'),(5,'Sonam','M','12','17693333','sonam@gmail.com','05','Haa Bazaar',7,'testing counselling','2015-07-16 10:51:33');
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
INSERT INTO `tbl_school_counsellors` VALUES (1,'Dorji','','Yuden','200901755','200901755','yeadeey@gmail.com','17647436','Jakar Higher Secondary School','01','http://119.2.120.36/mpoweryouthApi/counsellor_photo/images.jpeg'),(2,'Dawa','','Dem','11410004578','','dawadem65@gmail.com','17807235','Chumey Middle Secondary School','01',''),(3,'Tshering','','Yangzom','10811001129','','psnamgyal@yahoo.com','17860313','Wangduecholing LSS','01',''),(4,'Karma','','Dorji','10711000250','','kdorji99@gmail.com','17985470','Tang Middle Secondary School','01',''),(5,'Kaden','','Lobzang','200901308','200901308','kalobza@gmail.com','17650267','Kamji Middle Secondary School','02',''),(6,'Choeten','','Wangchuk','11514002666','','chetenwangchuk@gmail.com','17804365','Chukha Higher Secondary School','02',''),(7,'Pema','','Choden','11107000924','','pemadruk@gmail.com','17233577','Chapcha Middle Secondary School','02',''),(8,'Sonam','','Choden','11513000699','','schoden50691@yahoo.com','17826602','Pakshikha Middle Secondary School','02',''),(9,'Sonam','','Tshomo','200207354','200207354','stshomo88@yahoo.com ','17755960','Phuntsholing Middle Secondary School','02',''),(10,'Dechen','','Wangmo','200701641','200701641','dechent4@yahoo.com','17606701','Daga Higher Secondary School','03',''),(11,'Karma','','Tenzin','11905000718','','karma_tenzin@hotmail.com','17915317','Lhamoizingkha Middle Secondary School','03',''),(12,'Deki','','Wangmo','10207000564','','Deewang14@gmail.com','17709655','Gesarling Middle Secondary School','03',''),(13,'Sangay','','Jamtsho','200701333','200701333','sangayjamtsho_10@hotmail.com','17855410','Bjishong Middle Secondary School','04',''),(14,'Dawa','','Draba','200801590','200801590','drabadawa@gmail.com','17861294','Ugyen Dorji Higher Secondary School','05',''),(15,'Kuenley','','Zangmo','11704002345','','kuenlayzangmo@gmail.com','17439621','Chundu Middle Secondary School','05',''),(16,'Rinchen ','','Rinchen ','200701361','200701361','panbang86@gmail.com','17862936','Lhuntse Higher Secondary School','06',''),(17,'Tashi','','Yangzom A','11107008041','','tyangsom31@gmail.com','17447488','Autsho Middle Secondary School','06',''),(18,'Jangchuk','','Dorji','10603002487','','daviddrukpa@yahoo.com','17697495','Menji Middle Secondary School','06',''),(19,'Sonam','','Zangmo','10802002085','','szangmo68@gmail.com','17993325','Tangmachu Middle Secondary School','06',''),(20,'Jampel','','Tenzin','200701445','200701445','jamsonjoy2013@gmail.com','17751625','Mongar Higher Secondary School','07',''),(21,'Loden','','Sherab','10905000260','','loden_sherab@yahoo.com','16913823','Gyelposhing Higher Secondary School','07',''),(22,'Jigme ','','Jigme ','11510001973','','jigmexzen@yahoo.com','17770814','Yadi Higher Secondary School','07',''),(23,'Chimi','','Wangmo','10603000210','','chimiwangmo123@gmail.com','17842113',' Dramitse Middle Secondary School','07',''),(24,'Tshering','','Choki','200901709','200901709','crinchoks05@gmail.com','17301388','Shaba Higher Secondary School','08',''),(25,'Kinley','','Wangmo','11515000583','','kingyeduen@yahoo.com','17897171','Drukgyel Higher Secondary School','08',''),(26,'Tashi','','Lhamo','10811002149','','tassykalmo@gmail.com','17804486','Shari Higher Secondary School','08',''),(27,'Tashi','','Zangmo','11407000598','','Tashi_zangmo@yahoo.com','17703673','Wanakha Middle Secondary School','08',''),(28,'Indra','Bhadhur','Thapa','10205004996','','ens_in@yahoo.in','17349586','Nanglam Higher Secondary School','09',''),(29,'Lobzang','','Jamtsho','10905003541','','ljamtsho@gmail.com','77298796','Pemagatsel Middle Secondary School','09',''),(30,'Tshewang','','Penjor','200601202','200601202','tewangp@gmail.com','17814748','Nangkhor Higher Secondary School','09',''),(31,'Phurpa','','Dorji','12002000525','','dorjip61@yahoo.com','17576092','Yelchen Middle Secondary School','09',''),(32,'Norbu','','Gyeltshen','200307359','200307359','sample@gmail.com','17111111','Punakha Higher Secondary School','10',''),(33,'Lhamo','','Lhamo','10811002450','','lhamolhamo45@gmail.com','17921032','Dechentshemo Middle Secondary School','10',''),(34,'Pema','','Yangki','10906000324','','yoezertshogyal@gmail.com','17831452','Sonamthang Community School','10',''),(35,'Kezang','','Choki','10803000316','','Kezangc352@gmail.com','17650556','Tashidingkha Middle Secondary School','10',''),(36,'Sonam','','Tobgay','200701522','200701522','tobgyels68@yahoo.com','17678685','S/Jongkhar Middle Secondary School','11',''),(37,'Tashi','','Tashi Norbu','11508000846','','tashi.bbf@gmail.com','77400800','Gomdar Middle Secondary School','11',''),(38,'Dechen','','Yangdon','11513003984','','ydechen@rocketmail.com','77439375','Minjiwoong Middle Secondary School','11',''),(39,'Karma','','Tashi','10905002280','','karmarig2014@gmail.com','17943131','Karmaling Higher Secondary School','11',''),(40,'Pelden','','Dema','11106000617','','pelsypelden2009@gmail.com','17650843','Orong Higher Secondary School','11',''),(41,'Reena','','Thapa','200501274','200501274','tasreen2005@yahoo.com','17515323','Samtse Higher Secondary School','12',''),(42,'Chencho','','Wangdi','10505000092','','tshenchoongdi@gmail.com','17663240','Dorokha Middle Secondary School','12',''),(43,'Prakash','','Pradhan','9607069','9607069','mailprakash_08@yahoo.com ','17655646','Sarpang Higher Secondary School','13',''),(44,'Raj','Bhadhur','Ghalley','200407302','200407302','rajghalley2011@gmail.com','17587149','Gelephu Higher Secondary School','13',''),(45,'Tshering','','Duba','11102000411','','tsheringdubatshering@gmail.com','17741046','Pelrithang Middle Secondary School','13',''),(46,'Dawa','','Tshering','10202000722','','tsheringdawa630@gmail.com','17551816','Norbuling Middle Secondary School','13',''),(47,'Nima','','Tshering','200901747','200901747','nixtsher48@yahoo.com','17698510','Bayling Higher Secondary School','14',''),(48,'Phurpa','','Phurpa','11607001985','','phurpa@rocketmail.com','17887447','Tsenkharla Middle Secondary School','14',''),(49,'Sangay','','Tenzin K','200407308','200407308','druksangay2003@yahoo.com','17690413','Kanglung Middle Secondary School','15',''),(50,'Karma','','Gyelmo','0','','karmaye@yahoo.com','17744639','Jigmesherubling Higher Secondary School','15',''),(51,'Penjor','','Wangchuk','11512004007','','wangchukpenjor@yahoo.com','17798452','Gongthung Middle Secondary School','15',''),(52,'Sonam','','Zangmo','12008002951','','luak555@yahoo.com','77318720','Rangjung Higher Secondary School','15',''),(53,'Ugyen','','Tenzin','11503003486','','ugyentenzin33@gmail.com','17808260','Tashitse Higher Secondary School','15',''),(54,'Kelzang','','Udon','11606001207','','kelzangudon@gmail.com','17467893','Thrimshing Middle Secondary School','15',''),(55,'Tashi','','Chephey','11505002189','','tashichephey@gmail.com','17530544','Udzorong Middle Secondary School','15',''),(56,'Kuenga','','Tenzin','200601269','200601269','wealth_anevil@yahoo.com ','17752539','Loselling Middle Secondary School','16',''),(57,'Sangay','','Phuntsho','200307364','200307364','p_sangay@yahoo.com ','17605403','Lungtenzampa Middle Secondary School','16',''),(58,'Kuenzang','','Choden','200307357','200307357','kunza_choden@yahoo.com','17750582','Dechencholing Middle Secondary School','16',''),(59,'Kezang','','Dukpa','200601179','200601179','keyans12@gmail.com','17609443','Khasadrapchu Middle Secondary School','16',''),(60,'Yeshey','','Lhamo','200701330','200701330','fgcyeshey@yahoo.com','17647124','Motithang Higher Secondary School','16',''),(61,'Tashi','','Wangmo','200601193','200601193','rosie_tasie@live.com','17267282','Changangkha Middle Secondary School','16',''),(62,'Phurba','','Zangmo','200901731','200901731','phubzam2010@hotmail.com','17828242','Yangchenphug Higher Secondary School','16',''),(63,'Laja','','Wangchuk','10901001401','','lha_wangs2009@yahoo.com','17687360','Wangbama Higher Secondary School','16',''),(64,'Kesang','','Phuntsho','10811001006','','kesang2012@gmail.com','17610453','Taktse Higher Secondary School','17',''),(65,'Jigme','','Phuntsho','10103000051','','jigmsphula@gmail.com','17659330','Tshangkha Middle Secondary School','17',''),(66,'Yangchen','','Choden','200903023','200903023','yangchok86@yahoo.com','17928687','Mendrelgang Middle Secondary School','18',''),(67,'Tashi','','Wangchuk','200801476','200801476','Jaggu85@yahoo.com ','17667191','Bajo Higher Secondary School','19',''),(68,'Tandin','','Dema','200701446','200701446','trandrol12@gmail.com','17968253','Gaselo Higher Secondary School','19',''),(69,'Karma','','Yoenten','10504001895','','kyoenten@yahoo.com','77209250','Phobjekha Middle Secondary School','19',''),(70,'Sonam','','Lhamo','10204001030','','slpinkey390@gmail.com','17419627','Samtengang Middle Secondary School','19',''),(71,'Kuenley','','Penjor','200601476','200601476','penjorkinley17@yahoo.com','17683415','Zhemgang Higher Secondary School','20',''),(72,'Sanchu','','Sanchu ','11306000163','','sanchudechen@yahoo.com','17414646','Buli Middle Secondary School','20','');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_youth_center_facilities`
--

LOCK TABLES `tbl_youth_center_facilities` WRITE;
/*!40000 ALTER TABLE `tbl_youth_center_facilities` DISABLE KEYS */;
INSERT INTO `tbl_youth_center_facilities` VALUES (1,'Monthly basic computer course'),(2,'Library services'),(3,'Printing'),(4,'Lamination'),(5,'Spiral Binding'),(6,'Photocopying'),(7,'Indoor games'),(8,'Outdoor games'),(9,'Counselling and referrals'),(10,'Arts and crafts sessions'),(11,'Tutorials'),(12,'Internet cafe'),(13,'Television');
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
INSERT INTO `tbl_youth_center_types` VALUES (1,'Regional Youth Centers'),(2,'Drop In Centers'),(3,'Detoxification Centers'),(4,'Rehab Centers');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_youth_centers`
--

LOCK TABLES `tbl_youth_centers` WRITE;
/*!40000 ALTER TABLE `tbl_youth_centers` DISABLE KEYS */;
INSERT INTO `tbl_youth_centers` VALUES (1,'Paro Youth Center','08','Nyemizampa','08-272167','',1,1),(2,'Phuentsholing Youth Center','02','PSA ground','05-251831','',1,1),(3,'Gelephu Youth Center','13','Near Gelephu Thromde Office','06-25183','',1,1),(4,'Zhemgang Youth Center','20','Below Dzong','03-741250','',1,1),(5,'Trashigang Youth Center','15','Old Education Central Store','04-521115','',1,1),(6,'Chang Jiji Youth Center','16','In front of Trowa Theatre','02-335710','',1,1),(7,'Mongar Youth Center','07','Opposite Vegetable Market','04-641399','',1,1),(8,'Bajothang Youth Center','19','Bajothang main town','02-481424','',1,1),(9,'Samdrup Jongkhar Youth Center','11','Near Truck Parking','07-251251','',1,1);
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
INSERT INTO `tbl_youth_centers_has_tbl_youth_center_facilities` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(11,3),(12,3),(13,3),(1,4),(2,4),(3,4),(4,4),(5,4),(6,4),(7,4),(8,4),(9,4),(10,4),(11,4),(12,4),(13,4),(1,5),(2,5),(3,5),(4,5),(5,5),(6,5),(7,5),(8,5),(9,5),(10,5),(11,5),(12,5),(13,5),(1,6),(2,6),(3,6),(4,6),(5,6),(6,6),(7,6),(8,6),(9,6),(10,6),(11,6),(12,6),(13,6),(1,7),(2,7),(3,7),(4,7),(5,7),(6,7),(7,7),(8,7),(9,7),(10,7),(11,7),(12,7),(13,7),(1,8),(2,8),(3,8),(4,8),(5,8),(6,8),(7,8),(8,8),(9,8),(10,8),(11,8),(12,8),(13,8),(1,9),(2,9),(3,9),(4,9),(5,9),(6,9),(7,9),(8,9),(9,9),(10,9),(11,9),(12,9),(13,9);
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

-- Dump completed on 2015-07-16 21:20:00
