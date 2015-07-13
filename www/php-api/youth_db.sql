-- MySQL dump 10.13  Distrib 5.5.42, for osx10.6 (i386)
--
-- Host: localhost    Database: youth_db
-- ------------------------------------------------------
-- Server version	5.5.42

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
INSERT INTO `tbl_counselling_issues` VALUES (1,'Substance Abuse'),(2,'Relationship Issues'),(3,'Violence and Abuse'),(4,'Academic Difficulties'),(5,'Feeling Overwhelmed with Stress'),(6,'Depression and Suicidal Thoughts'),(7,'Grief and Loss');
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
  `applicant_age` char(2) DEFAULT NULL,
  `applicant_mobile` varchar(16) DEFAULT NULL,
  `applicant_email` varchar(45) DEFAULT NULL,
  `counselling_details` varchar(45) NOT NULL,
  PRIMARY KEY (`registration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_counselling_registration`
--

LOCK TABLES `tbl_counselling_registration` WRITE;
/*!40000 ALTER TABLE `tbl_counselling_registration` DISABLE KEYS */;
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
-- Table structure for table `tbl_school_counsellors`
--

DROP TABLE IF EXISTS `tbl_school_counsellors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_school_counsellors` (
  `counsellor_id` char(3) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_school_counsellors`
--

LOCK TABLES `tbl_school_counsellors` WRITE;
/*!40000 ALTER TABLE `tbl_school_counsellors` DISABLE KEYS */;
INSERT INTO `tbl_school_counsellors` VALUES ('001','Dorji','','Yuden','00200901755','200901755','yeadeey@gmail.com','17647436','Jakar Higher Secondary School','01','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('002','Dawa','','Dem','11410004578','','dawadem65@gmail.com','17807235','Chumey Middle Secondary School','01','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('003','Tshering','','Yangzom','10811001129','','psnamgyal@yahoo.com','17860313','Wangduecholing LSS','01','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('004','Karma','','Dorji','10711000250','','kdorji99@gmail.com','17985470','Tang Middle Secondary School','01','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('005','Kaden','','Lobzang','00200901308','200901308','kalobza@gmail.com','17650267','Kamji Middle Secondary School','02','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('006','Choeten','','Wangchuk','11514002666','','chetenwangchuk@gmail.com','17804365','Chukha Higher Secondary School','02','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('007','Pema','','Choden','11107000924','','pemadruk@gmail.com','17233577','Chapcha Middle Secondary School','02','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('008','Sonam','','Choden','11513000699','','schoden50691@yahoo.com','17826602','Pakshikha Middle Secondary School','02','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('009','Sonam','','Tshomo','00200207354','200207354','stshomo88@yahoo.com ','17755960','Phuntsholing Middle Secondary School','02','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('010','Dechen','','Wangmo','00200701641','200701641','dechent4@yahoo.com','17606701','Daga Higher Secondary School','03','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('011','Karma','','Tenzin','11905000718','','karma_tenzin@hotmail.com','17915317','Lhamoizingkha Middle Secondary School','03','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('012','Deki','','Wangmo','10207000564','','Deewang14@gmail.com','17709655','Gesarling Middle Secondary School','03','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('013','Sangay','','Jamtsho','00200701333','200701333','sangayjamtsho_10@hotmail.com','17855410','Bjishong Middle Secondary School','04','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('014','Dawa','','Draba','00200801590','200801590','drabadawa@gmail.com','17861294','Ugyen Dorji Higher Secondary School','05','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('015','Kuenley','','Zangmo','11704002345','','kuenlayzangmo@gmail.com','17439621','Chundu Middle Secondary School','05','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('016','Rinchen ','','Rinchen ','00200701361','200701361','panbang86@gmail.com','17862936','Lhuntse Higher Secondary School','06','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('017','Tashi','','Yangzom A','11107008041','','tyangsom31@gmail.com','17447488','Autsho Middle Secondary School','06','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('018','Jangchuk','','Dorji','10603002487','','daviddrukpa@yahoo.com','17697495','Menji Middle Secondary School','06','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('019','Sonam','','Zangmo','10802002085','','szangmo68@gmail.com','17993325','Tangmachu Middle Secondary School','06','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('020','Jampel','','Tenzin','0200701445','200701445','jamsonjoy2013@gmail.com','17751625','Mongar Higher Secondary School','07','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('021','Loden','','Sherab','10905000260','','loden_sherab@yahoo.com','16913823','Gyelposhing Higher Secondary School','07','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('022','Jigme ','','Jigme ','11510001973','','jigmexzen@yahoo.com','17770814','Yadi Higher Secondary School','07','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('023','Chimi','','Wangmo','10603000210','','chimiwangmo123@gmail.com','17842113',' Dramitse Middle Secondary School','07','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('024','Tshering','','Choki','00200901709','200901709','crinchoks05@gmail.com','17301388','Shaba Higher Secondary School','08','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('025','Kinley','','Wangmo','11515000583','','kingyeduen@yahoo.com','17897171','Drukgyel Higher Secondary School','08','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('026','Tashi','','Lhamo','10811002149','','tassykalmo@gmail.com','17804486','Shari Higher Secondary School','08','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('027','Tashi','','Zangmo','11407000598','','Tashi_zangmo@yahoo.com','17703673','Wanakha Middle Secondary School','08','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('028','Indra','Bhadhur','Thapa','10205004996','','ens_in@yahoo.in','17349586','Nanglam Higher Secondary School','09','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('029','Lobzang','','Jamtsho','10905003541','','ljamtsho@gmail.com','77298796','Pemagatsel Middle Secondary School','09','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('030','Tshewang','','Penjor','00200601202','200601202','tewangp@gmail.com','17814748','Nangkhor Higher Secondary School','09','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('031','Phurpa','','Dorji','12002000525','','dorjip61@yahoo.com','17576092','Yelchen Middle Secondary School','09','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('032','Norbu','','Gyeltshen','00200307359','200307359','','','Punakha Higher Secondary School','10','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('033','Lhamo','','Lhamo','10811002450','','lhamolhamo45@gmail.com','17921032','Dechentshemo Middle Secondary School','10','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('034','Pema','','Yangki','10906000324','','yoezertshogyal@gmail.com','17831452','Sonamthang Community School','10','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('035','Kezang','','Choki','10803000316','','Kezangc352@gmail.com','17650556','Tashidingkha Middle Secondary School','10','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('036','Sonam','','Tobgay','00200701522','200701522','tobgyels68@yahoo.com','17678685','S/Jongkhar Middle Secondary School','11','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('037','Tashi','','Tashi Norbu','11508000846','','tashi.bbf@gmail.com','77400800','Gomdar Middle Secondary School','11','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('038','Dechen','','Yangdon','11513003984','','ydechen@rocketmail.com','77439375','Minjiwoong Middle Secondary School','11','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('039','Karma','','Tashi','10905002280','','karmarig2014@gmail.com','17943131','Karmaling Higher Secondary School','11','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('040','Pelden','','Dema','11106000617','','pelsypelden2009@gmail.com','17650843','Orong Higher Secondary School','11','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('041','Reena','','Thapa','00200501274','200501274','tasreen2005@yahoo.com','17515323','Samtse Higher Secondary School','12','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('042','Chencho','','Wangdi','10505000092','','tshenchoongdi@gmail.com','17663240','Dorokha Middle Secondary School','12','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('043','Prakash','','Pradhan','00009607069','009607069','mailprakash_08@yahoo.com ','17655646','Sarpang Higher Secondary School','13','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('044','Raj','Bhadhur','Ghalley','00200407302','200407302','rajghalley2011@gmail.com','17587149','Gelephu Higher Secondary School','13','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('045','Tshering','','Duba','11102000411','','tsheringdubatshering@gmail.com','17741046','Pelrithang Middle Secondary School','13','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('046','Dawa','','Tshering','10202000722','','tsheringdawa630@gmail.com','17551816','Norbuling Middle Secondary School','13','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('047','Nima','','Tshering','00200901747','200901747','nixtsher48@yahoo.com','17698510','Bayling Higher Secondary School','14','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('048','Phurpa','','Phurpa','11607001985','','phurpa@rocketmail.com','17887447','Tsenkharla Middle Secondary School','14','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('049','Sangay','','Tenzin K','00200407308','200407308','druksangay2003@yahoo.com','17690413','Kanglung Middle Secondary School','15','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('050','Karma','','Gyelmo','00000000000','','karmaye@yahoo.com','17744639','Jigmesherubling Higher Secondary School','15','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('051','Penjor','','Wangchuk','11512004007','','wangchukpenjor@yahoo.com','17798452','Gongthung Middle Secondary School','15','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('052','Sonam','','Zangmo','12008002951','','luak555@yahoo.com','77318720','Rangjung Higher Secondary School','15','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('053','Ugyen','','Tenzin','11503003486','','ugyentenzin33@gmail.com','17808260','Tashitse Higher Secondary School','15','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('054','Kelzang','','Udon','11606001207','','kelzangudon@gmail.com','17467893','Thrimshing Middle Secondary School','15','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('055','Tashi','','Chephey','11505002189','','tashichephey@gmail.com','17530544','Udzorong Middle Secondary School','15','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('056','Kuenga','','Tenzin','00200601269','200601269','wealth_anevil@yahoo.com ','17752539','Loselling Middle Secondary School','16','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('057','Sangay','','Phuntsho','00200307364','200307364','p_sangay@yahoo.com ','17605403','Lungtenzampa Middle Secondary School','16','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('058','Kuenzang','','Choden','00200307357','200307357','kunza_choden@yahoo.com','17750582','Dechencholing Middle Secondary School','16','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('059','Kezang','','Dukpa','00200601179','200601179','keyans12@gmail.com','17609443','Khasadrapchu Middle Secondary School','16','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('060','Yeshey','','Lhamo','00200701330','200701330','fgcyeshey@yahoo.com','17647124','Motithang Higher Secondary School','16','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('061','Tashi','','Wangmo','00200601193','200601193','rosie_tasie@live.com','17267282','Changangkha Middle Secondary School','16','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('062','Phurba','','Zangmo','00200901731','200901731','phubzam2010@hotmail.com','17828242','Yangchenphug Higher Secondary School','16','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('063','Laja','','Wangchuk','10901001401','','lha_wangs2009@yahoo.com','17687360','Wangbama Higher Secondary School','16','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('064','Kesang','','Phuntsho','10811001006','','kesang2012@gmail.com','17610453','Taktse Higher Secondary School','17','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('065','Jigme','','Phuntsho','10103000051','','jigmsphula@gmail.com','17659330','Tshangkha Middle Secondary School','17','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('066','Yangchen','','Choden','00200903023','200903023','yangchok86@yahoo.com','17928687','Mendrelgang Middle Secondary School','18','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('067','Tashi','','Wangchuk','00200801476','200801476','Jaggu85@yahoo.com ','17667191','Bajo Higher Secondary School','19','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('068','Tandin','','Dema','00200701446','200701446','trandrol12@gmail.com','17968253','Gaselo Higher Secondary School','19','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('069','Karma','','Yoenten','10504001895','','kyoenten@yahoo.com','77209250','Phobjekha Middle Secondary School','19','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('070','Sonam','','Lhamo','10204001030','','slpinkey390@gmail.com','17419627','Samtengang Middle Secondary School','19','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('071','Kuenley','','Penjor','00200601476','200601476','penjorkinley17@yahoo.com','17683415','Zhemgang Higher Secondary School','20','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg'),('072','Sanchu','','Sanchu ','11306000163','','sanchudechen@yahoo.com','17414646','Buli Middle Secondary School','20','http://localhost/mpoweryouth/counsellor_photo/pic1.jpg');
/*!40000 ALTER TABLE `tbl_school_counsellors` ENABLE KEYS */;
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
  `talk_counsellor` enum('Y','N') DEFAULT 'Y' COMMENT 'Y-Yes\nN-No',
  `feeling_lonely` enum('Y','N') DEFAULT 'Y',
  `youth_thoughts` text,
  `location_now` varchar(45) DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL COMMENT 'M-Male\nF-Female\n',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_youth_mind_assessment`
--

LOCK TABLES `tbl_youth_mind_assessment` WRITE;
/*!40000 ALTER TABLE `tbl_youth_mind_assessment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_youth_mind_assessment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-13 14:34:05
