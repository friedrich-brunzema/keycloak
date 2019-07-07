-- MySQL dump 10.16  Distrib 10.1.21-MariaDB, for Linux (x86_64)
--
-- Host: rhsso.cluster-ccvivcvyryh2.us-east-1.rds.amazonaws.com    Database: rhsso.cluster-ccvivcvyryh2.us-east-1.rds.amazonaws.com
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` varchar(2550) DEFAULT NULL,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `FK_FRSR5S213XCX4WNKOG82SSRFY` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AUTH_EXEC_REALM` (`REALM_ID`),
  KEY `FK_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('0042ddb0-99c9-4850-99ae-aa22f722dc10',NULL,'client-jwt','SciexCloud','5cf12eff-5f91-4fff-b72e-348dee4a2a6e',2,20,'\0',NULL,NULL),('0740b0c8-d9e3-4c15-b21d-8fa2587414e7',NULL,'reset-password','SciexCloud','d77a6150-1a74-4a15-9eef-d7ba25923514',0,30,'\0',NULL,NULL),('089799c3-ae06-443b-9096-6bc55cd6fe0d',NULL,'idp-username-password-form','master','9f46f067-fe0c-4ac1-9cc1-bef837af6af4',0,10,'\0',NULL,NULL),('0d2828b3-7534-47f3-9b55-36bbbd5e39db',NULL,'auth-otp-form','master','9f46f067-fe0c-4ac1-9cc1-bef837af6af4',1,20,'\0',NULL,NULL),('11ea106d-daaa-4ba8-acb5-570d57fc9bcc',NULL,'idp-review-profile','SciexCloud','d8f34c05-fa4c-4435-ae90-804b7031f451',0,10,'\0',NULL,'a075e741-d9a3-4a87-a25f-1eec76947e27'),('1633fb9e-fcd7-4083-a7bb-b4dc9a00bd4a',NULL,'idp-create-user-if-unique','SciexCloud','d8f34c05-fa4c-4435-ae90-804b7031f451',2,20,'\0',NULL,'1fea0fd6-eab6-4d43-a293-12cfb3d5d5df'),('1b5e9659-a3e7-4343-afa0-e5fa96dd4b85',NULL,'reset-otp','SciexCloud','d77a6150-1a74-4a15-9eef-d7ba25923514',1,40,'\0',NULL,NULL),('2613bbd6-944b-493a-96e6-5ca2123da4d1',NULL,'reset-password','master','99b92906-c2b0-4165-8c3c-2ac8e912e4ac',0,30,'\0',NULL,NULL),('2f1f63e4-b916-4472-859f-b1ffb5fc8e58',NULL,'reset-credentials-choose-user','SciexCloud','d77a6150-1a74-4a15-9eef-d7ba25923514',0,10,'\0',NULL,NULL),('33f73203-c330-43ba-bc03-1f0ec4486b89',NULL,'http-basic-authenticator','SciexCloud','bd594e96-70de-4a79-9f88-d07bd92862cc',0,10,'\0',NULL,NULL),('3609ede4-5871-402d-8e60-f98546f22a33',NULL,'auth-cookie','SciexCloud','9665021d-8f08-4f52-999f-32d81d99288a',2,10,'\0',NULL,NULL),('3ea83c87-3f70-46e5-a0f1-757590dbbe80',NULL,'reset-credential-email','master','99b92906-c2b0-4165-8c3c-2ac8e912e4ac',0,20,'\0',NULL,NULL),('4495da97-531c-4b36-af82-986d29174700',NULL,'direct-grant-validate-otp','master','21372e19-83d1-4f7d-befa-02bfdb86405f',1,30,'\0',NULL,NULL),('4967c440-6a35-4430-aa66-f8d14ae06925',NULL,'auth-otp-form','master','748f98ce-a6a6-45e1-bcbc-4944a16b8818',1,20,'\0',NULL,NULL),('4980648f-ded9-4307-b7b3-88bb418ee430',NULL,NULL,'SciexCloud','40676a70-fb5c-4995-b3da-28e61308c155',2,30,'','7e334533-7d74-4c0c-9ba6-40fca00a29a2',NULL),('4b76ddef-181f-4d37-9c2c-be71f5882f1d',NULL,NULL,'SciexCloud','9665021d-8f08-4f52-999f-32d81d99288a',2,30,'','d45708c7-1e1c-46a7-a17c-fced2a96832d',NULL),('602120a9-6097-4130-9658-6dad9287b273',NULL,'direct-grant-validate-otp','SciexCloud','9aaeb6c0-571e-4390-a806-85f63c388c7e',1,30,'\0',NULL,NULL),('6131badc-6936-4964-8a20-36a63ed93935',NULL,'direct-grant-validate-username','master','21372e19-83d1-4f7d-befa-02bfdb86405f',0,10,'\0',NULL,NULL),('65ffaebb-1845-41e5-8a70-bbed7ad2dad9',NULL,'reset-otp','master','99b92906-c2b0-4165-8c3c-2ac8e912e4ac',1,40,'\0',NULL,NULL),('72b9144e-d556-4fc3-ac45-5fa10c6b49c7',NULL,'registration-page-form','SciexCloud','fcc548e6-0585-45e2-84ab-9fcc35cabc30',0,10,'','d1787392-e178-4843-89c9-86aeebf71c71',NULL),('759075c0-10d8-45c0-a410-35032942e005',NULL,'registration-page-form','master','10c79319-5cfe-4a19-9abc-7cf4b24a4f83',0,10,'','66440956-f3cf-46f5-b8aa-538b7e5606f0',NULL),('7a3360a3-5131-4256-9d1e-c0425c4f8004',NULL,NULL,'master','8d8520e2-199e-4478-84a4-cd8ec7c90b07',2,30,'','9f46f067-fe0c-4ac1-9cc1-bef837af6af4',NULL),('7e636361-4819-4033-9d65-356a6c5a4a14',NULL,'idp-confirm-link','master','8d8520e2-199e-4478-84a4-cd8ec7c90b07',0,10,'\0',NULL,NULL),('83d6da27-c7aa-4097-b377-cf8defab152b',NULL,NULL,'master','d3806bb4-9335-4ffb-a91d-72ce876b45bb',2,30,'','748f98ce-a6a6-45e1-bcbc-4944a16b8818',NULL),('8cabb45f-e35f-4377-8250-6da071754a8e',NULL,'direct-grant-validate-password','SciexCloud','9aaeb6c0-571e-4390-a806-85f63c388c7e',0,20,'\0',NULL,NULL),('8f9d370c-ba0c-47f6-a4e7-6e7caf5d9d89',NULL,'idp-email-verification','master','8d8520e2-199e-4478-84a4-cd8ec7c90b07',2,20,'\0',NULL,NULL),('93cb7653-2a6d-4b43-940e-fff88db8099e',NULL,'direct-grant-validate-password','master','21372e19-83d1-4f7d-befa-02bfdb86405f',0,20,'\0',NULL,NULL),('9415d769-f1d1-46f7-8cae-32ba288016a7',NULL,'auth-username-password-form','master','748f98ce-a6a6-45e1-bcbc-4944a16b8818',0,10,'\0',NULL,NULL),('9a9e172c-384f-4be1-ae0d-1cdf3f87658b',NULL,'registration-user-creation','SciexCloud','d1787392-e178-4843-89c9-86aeebf71c71',0,20,'\0',NULL,NULL),('9b85e0ea-b047-4289-b139-7d263d7ca59c',NULL,'idp-email-verification','SciexCloud','40676a70-fb5c-4995-b3da-28e61308c155',2,20,'\0',NULL,NULL),('9f485d5e-f423-4fcf-9f40-50ed508c2a79',NULL,'identity-provider-redirector','SciexCloud','9665021d-8f08-4f52-999f-32d81d99288a',2,25,'\0',NULL,NULL),('a251e213-e52a-48fe-a6e1-7a87b842bebc',NULL,'identity-provider-redirector','master','d3806bb4-9335-4ffb-a91d-72ce876b45bb',2,25,'\0',NULL,NULL),('a6e7db7f-f6a5-4eb5-bb3a-2af37642aa9d',NULL,'client-jwt','master','bf08c66d-70f5-4b3b-82a9-6fc39d99819d',2,20,'\0',NULL,NULL),('b12b7dce-80a1-4d48-b7e9-d300945a2a44',NULL,'registration-password-action','SciexCloud','d1787392-e178-4843-89c9-86aeebf71c71',0,50,'\0',NULL,NULL),('ba1b4b38-d59e-4289-bb21-228e6324ee1a',NULL,'auth-username-password-form','SciexCloud','d45708c7-1e1c-46a7-a17c-fced2a96832d',0,10,'\0',NULL,NULL),('bda7a690-f2b5-4b4f-b1a3-7d76d30d1d24',NULL,NULL,'SciexCloud','d8f34c05-fa4c-4435-ae90-804b7031f451',2,30,'','40676a70-fb5c-4995-b3da-28e61308c155',NULL),('bdaa44c7-f8d4-4256-96e2-419e802fc926',NULL,'idp-username-password-form','SciexCloud','7e334533-7d74-4c0c-9ba6-40fca00a29a2',0,10,'\0',NULL,NULL),('c2025039-81fe-44e7-a473-f4d836246070',NULL,'registration-user-creation','master','66440956-f3cf-46f5-b8aa-538b7e5606f0',0,20,'\0',NULL,NULL),('c2779354-9cdd-41fb-8956-68a5b8dd0d16',NULL,'registration-recaptcha-action','master','66440956-f3cf-46f5-b8aa-538b7e5606f0',3,60,'\0',NULL,NULL),('c2aadd26-8524-4534-a5be-03c5469a83a5',NULL,'reset-credentials-choose-user','master','99b92906-c2b0-4165-8c3c-2ac8e912e4ac',0,10,'\0',NULL,NULL),('c9f84ca3-81fa-4c66-a586-d9923b8dedaf',NULL,'reset-credential-email','SciexCloud','d77a6150-1a74-4a15-9eef-d7ba25923514',0,20,'\0',NULL,NULL),('cbf5b248-5c31-4d3e-94e9-35e623a5a7db',NULL,'registration-profile-action','SciexCloud','d1787392-e178-4843-89c9-86aeebf71c71',0,40,'\0',NULL,NULL),('cc9c76c6-5221-49aa-801e-130301043b35',NULL,NULL,'master','23b1b835-78e8-4cd8-9951-30a159f320c5',2,30,'','8d8520e2-199e-4478-84a4-cd8ec7c90b07',NULL),('d73b8732-0bfe-4393-8053-baeb364a7cb9',NULL,'client-secret','master','bf08c66d-70f5-4b3b-82a9-6fc39d99819d',2,10,'\0',NULL,NULL),('d9c7ff18-5ac8-4aee-ad2e-2fde6b04ae0d',NULL,'registration-password-action','master','66440956-f3cf-46f5-b8aa-538b7e5606f0',0,50,'\0',NULL,NULL),('db1d9bc6-6d39-4bf2-8413-07a7ecf9c123',NULL,'client-secret','SciexCloud','5cf12eff-5f91-4fff-b72e-348dee4a2a6e',2,10,'\0',NULL,NULL),('dc54cb10-f5a7-4aeb-b06a-103c482d6cfb',NULL,'registration-recaptcha-action','SciexCloud','d1787392-e178-4843-89c9-86aeebf71c71',3,60,'\0',NULL,NULL),('dc6cbd2b-48fc-4bb0-bb17-5f69f81025cc',NULL,'auth-cookie','master','d3806bb4-9335-4ffb-a91d-72ce876b45bb',2,10,'\0',NULL,NULL),('dddcc358-2ddb-40a7-b636-aaf036143732',NULL,'idp-confirm-link','SciexCloud','40676a70-fb5c-4995-b3da-28e61308c155',0,10,'\0',NULL,NULL),('de071546-23f7-4339-a4ba-9968b3f7642c',NULL,'auth-otp-form','SciexCloud','7e334533-7d74-4c0c-9ba6-40fca00a29a2',1,20,'\0',NULL,NULL),('e173cc67-bb47-4a8b-a97a-c40b793e1623',NULL,'auth-spnego','SciexCloud','9665021d-8f08-4f52-999f-32d81d99288a',3,20,'\0',NULL,NULL),('e2ab6737-0aca-486e-b3f7-3e37aed92dd7',NULL,'auth-spnego','master','d3806bb4-9335-4ffb-a91d-72ce876b45bb',3,20,'\0',NULL,NULL),('e84b6ed8-4e98-430b-a7de-d69436e96aec',NULL,'http-basic-authenticator','master','944b161e-2c68-48f5-a8ee-9a150c1ac876',0,10,'\0',NULL,NULL),('ea87f685-79c8-45e5-a473-3a01b77eb24f',NULL,'idp-create-user-if-unique','master','23b1b835-78e8-4cd8-9951-30a159f320c5',2,20,'\0',NULL,'2eab5ad8-67fe-4625-b4b6-0233e0914758'),('eabfe766-48c1-4204-b394-a2285040e129',NULL,'direct-grant-validate-username','SciexCloud','9aaeb6c0-571e-4390-a806-85f63c388c7e',0,10,'\0',NULL,NULL),('eddf1788-fc90-4eb9-b796-257c7e0bdef0',NULL,'idp-review-profile','master','23b1b835-78e8-4cd8-9951-30a159f320c5',0,10,'\0',NULL,'fa11d41b-df5f-4c48-8660-743b8b28ada9'),('ee2ecd41-46d3-4877-8e51-4dd05eec0430',NULL,'registration-profile-action','master','66440956-f3cf-46f5-b8aa-538b7e5606f0',0,40,'\0',NULL,NULL),('f96f1074-d866-4f20-aedf-ede2ee18a47d',NULL,'auth-otp-form','SciexCloud','d45708c7-1e1c-46a7-a17c-fced2a96832d',1,20,'\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `FK_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('10c79319-5cfe-4a19-9abc-7cf4b24a4f83','registration','registration flow','master','basic-flow','',''),('21372e19-83d1-4f7d-befa-02bfdb86405f','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow','',''),('23b1b835-78e8-4cd8-9951-30a159f320c5','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow','',''),('40676a70-fb5c-4995-b3da-28e61308c155','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','SciexCloud','basic-flow','\0',''),('5cf12eff-5f91-4fff-b72e-348dee4a2a6e','clients','Base authentication for clients','SciexCloud','client-flow','',''),('66440956-f3cf-46f5-b8aa-538b7e5606f0','registration form','registration form','master','form-flow','\0',''),('748f98ce-a6a6-45e1-bcbc-4944a16b8818','forms','Username, password, otp and other auth forms.','master','basic-flow','\0',''),('7e334533-7d74-4c0c-9ba6-40fca00a29a2','Verify Existing Account by Re-authentication','Reauthentication of existing account','SciexCloud','basic-flow','\0',''),('8d8520e2-199e-4478-84a4-cd8ec7c90b07','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow','\0',''),('944b161e-2c68-48f5-a8ee-9a150c1ac876','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow','',''),('9665021d-8f08-4f52-999f-32d81d99288a','browser','browser based authentication','SciexCloud','basic-flow','',''),('99b92906-c2b0-4165-8c3c-2ac8e912e4ac','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow','',''),('9aaeb6c0-571e-4390-a806-85f63c388c7e','direct grant','OpenID Connect Resource Owner Grant','SciexCloud','basic-flow','',''),('9f46f067-fe0c-4ac1-9cc1-bef837af6af4','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow','\0',''),('bd594e96-70de-4a79-9f88-d07bd92862cc','saml ecp','SAML ECP Profile Authentication Flow','SciexCloud','basic-flow','',''),('bf08c66d-70f5-4b3b-82a9-6fc39d99819d','clients','Base authentication for clients','master','client-flow','',''),('d1787392-e178-4843-89c9-86aeebf71c71','registration form','registration form','SciexCloud','form-flow','\0',''),('d3806bb4-9335-4ffb-a91d-72ce876b45bb','browser','browser based authentication','master','basic-flow','',''),('d45708c7-1e1c-46a7-a17c-fced2a96832d','forms','Username, password, otp and other auth forms.','SciexCloud','basic-flow','\0',''),('d77a6150-1a74-4a15-9eef-d7ba25923514','reset credentials','Reset credentials for a user if they forgot their password or something','SciexCloud','basic-flow','',''),('d8f34c05-fa4c-4435-ae90-804b7031f451','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','SciexCloud','basic-flow','',''),('fcc548e6-0585-45e2-84ab-9fcc35cabc30','registration','registration flow','SciexCloud','basic-flow','','');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AUTH_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('1fea0fd6-eab6-4d43-a293-12cfb3d5d5df','create unique user config','SciexCloud'),('2eab5ad8-67fe-4625-b4b6-0233e0914758','create unique user config','master'),('a075e741-d9a3-4a87-a25f-1eec76947e27','review profile config','SciexCloud'),('fa11d41b-df5f-4c48-8660-743b8b28ada9','review profile config','master');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('1fea0fd6-eab6-4d43-a293-12cfb3d5d5df','false','require.password.update.after.registration'),('2eab5ad8-67fe-4625-b4b6-0233e0914758','false','require.password.update.after.registration'),('a075e741-d9a3-4a87-a25f-1eec76947e27','missing','update.profile.on.first.login'),('fa11d41b-df5f-4c48-8660-743b8b28ada9','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int(11) DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_TEMPLATE_ID` varchar(36) DEFAULT NULL,
  `USE_TEMPLATE_CONFIG` bit(1) NOT NULL DEFAULT b'0',
  `USE_TEMPLATE_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  `USE_TEMPLATE_MAPPERS` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `FK_CLI_TMPLT_CLIENT` (`CLIENT_TEMPLATE_ID`),
  CONSTRAINT `FK_CLI_TMPLT_CLIENT` FOREIGN KEY (`CLIENT_TEMPLATE_ID`) REFERENCES `CLIENT_TEMPLATE` (`ID`),
  CONSTRAINT `FK_P56CTINXXB9GSK57FO49F9TAC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('1477fe3c-84cc-4391-b301-657e96341eac','','','master-realm',0,'\0','2b37635b-00b6-41fb-b92c-17374f28e242',NULL,'',NULL,'\0','master',NULL,0,'\0','\0','master Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0',NULL,'\0','\0','\0'),('37c2ff0f-144f-486f-ae37-df5ea128c546','','\0','account',0,'\0','b7c9427f-709b-42d2-ae49-45d07f6131a0','/auth/realms/SciexCloud/account','\0',NULL,'\0','SciexCloud',NULL,0,'\0','\0','${client_account}','\0','client-secret',NULL,NULL,NULL,'','\0','\0',NULL,'\0','\0','\0'),('77d19141-15d1-418b-b021-4dbc2c313fe0','','\0','admin-cli',0,'','a10657f5-ae41-426d-95a1-7302fc38949a',NULL,'\0',NULL,'\0','master',NULL,0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0','',NULL,'\0','\0','\0'),('7e01eff7-e65f-4cc9-b2a4-4dae501bf1ef','','\0','admin-cli',0,'','0bc79a63-7439-4289-a3de-59df01b0f9b6',NULL,'\0',NULL,'\0','SciexCloud',NULL,0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0','',NULL,'\0','\0','\0'),('90c8a4c7-a490-4a48-bef8-bdf65a132b55','','\0','broker',0,'\0','b2366a3c-e992-487a-8a92-876d9a9a4423',NULL,'\0',NULL,'\0','SciexCloud',NULL,0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0',NULL,'\0','\0','\0'),('a98a77f0-c663-48b9-b4f0-363325780740','','\0','broker',0,'\0','0edb2b98-9021-4206-9519-43ba9ac719e5',NULL,'\0',NULL,'\0','master',NULL,0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0',NULL,'\0','\0','\0'),('b2167446-c272-4ac8-a63a-6ad73a286c3c','','\0','security-admin-console',0,'','eb5e4790-a161-4432-a030-e3311e04f1cb','/auth/admin/master/console/index.html','\0',NULL,'\0','master',NULL,0,'\0','\0','${client_security-admin-console}','\0','client-secret',NULL,NULL,NULL,'','\0','\0',NULL,'\0','\0','\0'),('e109ff77-de62-4914-a584-b92d3d684253','','\0','security-admin-console',0,'','e84c7170-bb4b-4d2f-b6e8-20395e61ff79','/auth/admin/SciexCloud/console/index.html','\0',NULL,'\0','SciexCloud',NULL,0,'\0','\0','${client_security-admin-console}','\0','client-secret',NULL,NULL,NULL,'','\0','\0',NULL,'\0','\0','\0'),('ed91dee2-3a98-430d-89bc-4f315307a392','','','SciexCloud-realm',0,'\0','19e9736d-8af4-462e-a4a3-44479adee8fe',NULL,'',NULL,'\0','master',NULL,0,'\0','\0','SciexCloud Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0',NULL,'\0','\0','\0'),('f4f2fc8b-20e0-4df4-8904-43c5154a5fe3','','\0','realm-management',0,'\0','a710ea42-0628-4a4e-889c-19078991a12a',NULL,'',NULL,'\0','SciexCloud',NULL,0,'\0','\0','${client_realm-management}','\0','client-secret',NULL,NULL,NULL,'','\0','\0',NULL,'\0','\0','\0'),('f92da4a2-83e0-47e2-868b-5d71cd347730','','\0','account',0,'\0','695495a9-8643-45f3-8330-6f495ec07795','/auth/realms/master/account','\0',NULL,'\0','master',NULL,0,'\0','\0','${client_account}','\0','client-secret',NULL,NULL,NULL,'','\0','\0',NULL,'\0','\0','\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `CLIENT_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_DEFAULT_ROLES` (
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  UNIQUE KEY `UK_8AELWNIBJI49AVXSRTUF6XJOW` (`ROLE_ID`),
  KEY `FK_NUILTS7KLWQW2H8M2B5JOYTKY` (`CLIENT_ID`),
  CONSTRAINT `FK_NUILTS7KLWQW2H8M2B5JOYTKY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_8AELWNIBJI49AVXSRTUF6XJOW` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_DEFAULT_ROLES`
--

LOCK TABLES `CLIENT_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `CLIENT_DEFAULT_ROLES` VALUES ('37c2ff0f-144f-486f-ae37-df5ea128c546','37201ab9-5647-40cb-970d-4859fedc1a93'),('37c2ff0f-144f-486f-ae37-df5ea128c546','7cfa0201-12a3-4097-9cbd-43e87677cad3'),('f92da4a2-83e0-47e2-868b-5d71cd347730','23571462-0d2a-492f-bd55-95a0ba379abc'),('f92da4a2-83e0-47e2-868b-5d71cd347730','9ca0be12-6437-4c78-92b2-b03cd56e171d');
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_IDENTITY_PROV_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_IDENTITY_PROV_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_IDENTITY_PROV_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `RETRIEVE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  UNIQUE KEY `UK_7CAELWNIBJI49AVXSRTUF6XJ12` (`IDENTITY_PROVIDER_ID`,`CLIENT_ID`),
  KEY `FK_56ELWNIBJI49AVXSRTUF6XJ23` (`CLIENT_ID`),
  CONSTRAINT `FK_56ELWNIBJI49AVXSRTUF6XJ23` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_7CELWNIBJI49AVXSRTUF6XJ12` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_IDENTITY_PROV_MAPPING`
--

LOCK TABLES `CLIENT_IDENTITY_PROV_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_IDENTITY_PROV_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_IDENTITY_PROV_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL DEFAULT '',
  `VALUE` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_B4AO2VCVAT6UKAU74WBWTFQO1` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_TEMPLATE`
--

DROP TABLE IF EXISTS `CLIENT_TEMPLATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_TEMPLATE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_TEMPLATE` (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_REALM_CLI_TMPLT` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_TEMPLATE`
--

LOCK TABLES `CLIENT_TEMPLATE` WRITE;
/*!40000 ALTER TABLE `CLIENT_TEMPLATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_TEMPLATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_TEMPLATE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_TEMPLATE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_TEMPLATE_ATTRIBUTES` (
  `TEMPLATE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`TEMPLATE_ID`,`NAME`),
  CONSTRAINT `FK_CL_TEMPL_ATTR_TEMPL` FOREIGN KEY (`TEMPLATE_ID`) REFERENCES `CLIENT_TEMPLATE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_TEMPLATE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_TEMPLATE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_TEMPLATE_ATTRIBUTES` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_TEMPLATE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_COMPONENT_REALM` (`REALM_ID`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('05b9a047-8f2c-4c12-adaf-4e3d580ae281','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('0726e9b2-1d3a-4ce3-89de-a5ed4524a7df','Consent Required','SciexCloud','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','SciexCloud','anonymous'),('0b4d7d73-23bd-4e62-9257-29ea53fb52e4','Trusted Hosts','SciexCloud','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','SciexCloud','anonymous'),('2a48efec-2dde-49b1-bcbf-6bd1ec7a1455','Allowed Client Templates','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('3e83cfb0-7aed-4d48-bfe7-3899448bca81','hmac-generated','SciexCloud','hmac-generated','org.keycloak.keys.KeyProvider','SciexCloud',NULL),('50fe6fb0-0efb-42c0-b421-928c0577fefc','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('6a1fa8ad-d53d-450e-b6f2-c57b69350829','Allowed Protocol Mapper Types','SciexCloud','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','SciexCloud','authenticated'),('6cbf5e7f-7459-4d69-9e78-24149ead70b7','Allowed Client Templates','SciexCloud','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','SciexCloud','authenticated'),('739ffbd0-b753-4c46-b052-d795b9d58557','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('8312c429-d38a-49a7-8020-196898807d03','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('85a4b0f1-7770-46f7-b489-48d685072db7','rsa-generated','SciexCloud','rsa-generated','org.keycloak.keys.KeyProvider','SciexCloud',NULL),('87d623bb-7276-4d66-9b8f-bf3e59a7b12f','Full Scope Disabled','SciexCloud','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','SciexCloud','anonymous'),('93e13846-382f-4873-9435-b0126606e09f','Max Clients Limit','SciexCloud','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','SciexCloud','anonymous'),('9c32e524-7334-4cda-b872-63c8795dfee0','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('b9963e23-91af-4370-8e34-f559fd62647a','Allowed Protocol Mapper Types','SciexCloud','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','SciexCloud','anonymous'),('c6a48607-6f7a-4701-9daf-75913b193ad6','Allowed Client Templates','SciexCloud','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','SciexCloud','anonymous'),('c9967956-e66d-40de-aceb-a58d6e533489','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('e5593052-cbab-4dd3-9200-29e8ad155438','Allowed Client Templates','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('fc6548d5-f728-4c51-afb1-ec86d001eaf4','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('fd55b738-0c69-475f-906c-9240ddc2d1f0','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_COMPONENT_CONFIG` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('03ab4c27-063b-460b-ab22-bf510a286d3e','8312c429-d38a-49a7-8020-196898807d03','priority','100'),('07411cd7-3179-477c-9bae-ce513c350453','6a1fa8ad-d53d-450e-b6f2-c57b69350829','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('0934d90b-0c8c-4f79-8c39-b3058d155589','3e83cfb0-7aed-4d48-bfe7-3899448bca81','kid','5941e73e-6542-4d78-841b-849d30263e3c'),('162eafc1-cd5d-44b6-8b80-e3f8f46c8270','05b9a047-8f2c-4c12-adaf-4e3d580ae281','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('16a120f2-f95a-466f-9504-090846b66702','739ffbd0-b753-4c46-b052-d795b9d58557','allowed-protocol-mapper-types','oidc-address-mapper'),('18a986ba-34b2-4464-b019-6609c6ef05cc','b9963e23-91af-4370-8e34-f559fd62647a','allowed-protocol-mapper-types','oidc-full-name-mapper'),('1c87ac21-8497-4585-8534-d399658ba842','6a1fa8ad-d53d-450e-b6f2-c57b69350829','consent-required-for-all-mappers','true'),('1d00d608-a3fb-4fc1-a220-b136c8990bcd','6a1fa8ad-d53d-450e-b6f2-c57b69350829','allowed-protocol-mapper-types','oidc-full-name-mapper'),('24f95b7e-ab13-4d97-86c7-3cc6e121adf8','b9963e23-91af-4370-8e34-f559fd62647a','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('25cd9217-9d06-4e8e-91c2-2e5984fce621','6a1fa8ad-d53d-450e-b6f2-c57b69350829','allowed-protocol-mapper-types','oidc-address-mapper'),('29347065-fb7b-4cc7-83cf-3062f9503419','6a1fa8ad-d53d-450e-b6f2-c57b69350829','allowed-protocol-mapper-types','saml-user-property-mapper'),('30441f39-3bf1-49e3-898e-adca250c7cc4','6a1fa8ad-d53d-450e-b6f2-c57b69350829','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('389cbc2f-2f48-4d60-a2fc-1d8c62bf5a64','fc6548d5-f728-4c51-afb1-ec86d001eaf4','client-uris-must-match','true'),('3db45490-3c37-466e-b844-52f3a6bd2c47','b9963e23-91af-4370-8e34-f559fd62647a','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('42870eaa-1392-408e-9b29-dff735fac58a','05b9a047-8f2c-4c12-adaf-4e3d580ae281','allowed-protocol-mapper-types','saml-user-property-mapper'),('48391044-600f-4d26-bf94-d2e37086c040','8312c429-d38a-49a7-8020-196898807d03','privateKey','MIIEpAIBAAKCAQEAvHdHmHUq537681h9LZq4E3Y1sI8FNI0W8KjPCXwigCvcL8+0S2AcwWIbB2FxCPR7Tc0VSVGEfFeVX48JcrnCFQsuArqiE0LIG5RlHXikW+FcSIlLldutJCC1dZjwt3A+U23/sXotbG6D20MBESFCSFiz1p3kVee1VZXERIEgZb6LBRZxcGp8zYvZuc7xDnT2xwBlBgXzoTkDBc6CR39Lec+O4d6sZoAjJ4mwIP32RQyxKcxE+Mnxj6Ypxr+ZLWPYNt2JN0VRv6QAKw0cokPxU7s/h/6IKXjWNFQp/aFVfNGOq0+TXs82nHxApkiM3mroyZ+5FYVka8Hx//aRTK3ufQIDAQABAoIBAQCsrOTuLLwIqnEnMLZQaGerfS0n/YIZagPQr/oxiIjbwlPVgoqAXSk7jbWSB5dXSxkGaZbNPGEUw/JaQWW4tbW7LikT2wfQeel6S3ZxkC2W+V5iH1kfjsyOQ2G+w0gZ6j9QlYImi/i+Vmt9I2EA3uYp/wuW4cdpZgjgx32x/lU+oceFaDaXOFpnKmw3vIu3FTopVtWNFZDWq3vw+wx4sb3bCJM+HoKEiA20qZp8N8PFSS/7VUHcC87rFInSLObhVs+8f882CdUKJk62971494SvV/y2nb4f5GMOPCzMwW8k6z8vggQTj2XK1qmjrpcHVAzg7HSl5jgs/dqcwDfJwmKBAoGBAPNO+gJgIDxgxbdpzYZ40xujdXKx0XhyC2s9Kf/iSHuxjdGS2ht6QRhqktSC8k5uB6ctLnl0Md/M1vxSoevBE52ic4zzmRPlIGNFKSaiCedsHYe1/ebOzEvcO6qe7AzK6OiIL5x6FgQFmu8Ae8vKmJfZcecEvR16NjHkqPA97VmRAoGBAMZL9k1RJjxvuICXtm8dItXmpg7Z9cizTKdGZD7HapNS700eX5781BSvlIWgGXO4O96TG+sUHlQE19ZBaZqjNdEW0yObjdbIH+WXj7bdj6HU3w8DRLJQx91gGwrqYEWxKCFqFphiXjX/xC5LSXJxk91ydnZQ0spT6TBRFAURijAtAoGABcfJjsbj3StbZykfVeOG+HAguTHaTSdAeDLCza59lFq6iNEZV2/HHiJiDKRzx0M78U/Ue9Qz3yJJtULtT+GNasBSSHX9HAjkhRc+jAlrfNEHvpKnTpV5KxA3Zq1R5FfpwqSBpRENdtj/PlBfoI7WozzqRNfK+mlN4k+RZ+vAuNECgYBM713xY4G1QxdPdQ1IEQLaALH+4xvUMZSU9d+g59f2rt+/iQBKfAeAuxqhuZsGZb18vpC/ZT/bE0H2k8x4Pch8hiGHGCww39ZYSrRsm4vFmwSsG3WExYi14Dq9wm91uqU6SaHYn5mz07b2yykE6QIYkfdaMkOGUoYPw/VDfimiRQKBgQDd51q5ZbnHvSwbvF8MvDuLXnJbuyqNCg02Yyzk9CfiSDRlAApdtCoIHJ10fny7GQ/UVJZZI8Td2z50pZue4euzoMVhHD+0244ktPlboOEs5E777nXVb+2tTWtZ1O+WHH86huhwo7U75bJAHxs/14XCN1CiwlDkQ2DMMsH43J/GCw=='),('48d20114-dcdb-49c6-91bf-a7f871ee6a3c','739ffbd0-b753-4c46-b052-d795b9d58557','allowed-protocol-mapper-types','saml-user-property-mapper'),('4c3249c8-34b3-437d-9e7c-bd5ebe4a27bf','05b9a047-8f2c-4c12-adaf-4e3d580ae281','allowed-protocol-mapper-types','oidc-address-mapper'),('5031207a-0c4b-4a33-b5f9-b74a3cecb2d4','3e83cfb0-7aed-4d48-bfe7-3899448bca81','secret','KfpSLUoDiwDM8VTBgsYPYR6mbT8SzCaQ1vAkJq1Bgf8'),('5189cf10-da4f-473e-8480-5178d34f1c3b','0b4d7d73-23bd-4e62-9257-29ea53fb52e4','client-uris-must-match','true'),('591d062b-474c-43be-9ae0-ce5718da9e4e','85a4b0f1-7770-46f7-b489-48d685072db7','certificate','MIICozCCAYsCBgFdHWotWzANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApTY2lleENsb3VkMB4XDTE3MDcwNzE0MTYyNFoXDTI3MDcwNzE0MTgwNFowFTETMBEGA1UEAwwKU2NpZXhDbG91ZDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAIEAAOtm2cAGb7gJtokVQSK5rkAcNw/sfsZtwaMyv5MXoXAiuA6wJTtKUJraed9N02rK5aNkoQKcm/Y3lR0r0dvhQ+meYZT9oM5AVa3wmRxEOI0uTpJRLcHWyNu7MCMx0HaFQGA4460BLytMh/4b919+c/gVZnkrzl4sjKvwWRpvdhhKN9XrpFuOPAxUABbaoj/HUnDjtQeVnBHicbDnZLMrZK88X0sd7PKPTFIDbV52OJkoM9Pg7Z4tYY9oWc+ynpmrgniZY3/g8RI9r5Tlmn4UhS7LMokKD2DZlHOHAMKhHnd3SGBGfhuuiMedvw5H1s+BF/II32PtN4suT7m0bysCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAYItnIJ/nV7wmGEAHlUXqps6PA8yMO7ha7PvDv+hsojwOBJLnw0gKZE6K4sBjC+Mcnw8W3m0YYzemWmt7AobROOD7bwqoY9oOPMdtalqRIMciC2PqH9QqVvUzMkm16jGWQ4Rk/fA9F+OTQm0Ay5MQr5op6E+kH3D45BWa+Wxz2bTi0vfDM7ig4CzEXmJlCgdMy1GxK7ffFZFtA2/XHP4cC5HNKdLcNgbrBCGshGEEEpMORzsXO3NV2YjwZZ0udfLu2nVB2OXnSo9T384VHZm1SRXgm+h0EfaZ6NsyGmJJ9OGiZlijk971BZXuycF1ztMisgBCJjFLxOYZMYkAjKn8ow=='),('5a7656b4-d60e-46a0-aac6-00c6fad42cf9','05b9a047-8f2c-4c12-adaf-4e3d580ae281','allowed-protocol-mapper-types','saml-role-list-mapper'),('5c0cf0b5-c310-4469-a720-b8766f059673','b9963e23-91af-4370-8e34-f559fd62647a','allowed-protocol-mapper-types','oidc-address-mapper'),('5cbbe79d-6f82-491f-a445-57d39e7deacb','6a1fa8ad-d53d-450e-b6f2-c57b69350829','allowed-protocol-mapper-types','saml-role-list-mapper'),('5d2d0ce1-2386-47d3-ac42-f3095a698a85','05b9a047-8f2c-4c12-adaf-4e3d580ae281','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('5f4ac718-91a4-4842-8fbf-9fc334177282','739ffbd0-b753-4c46-b052-d795b9d58557','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('63aa0476-15f0-471b-b71e-44f198c12cac','b9963e23-91af-4370-8e34-f559fd62647a','consent-required-for-all-mappers','true'),('6c432bbf-d88c-416e-9f0d-b39181e6183d','8312c429-d38a-49a7-8020-196898807d03','certificate','MIICmzCCAYMCBgFc/yVoGzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMTcwNzAxMTcxMjQwWhcNMjcwNzAxMTcxNDIwWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC8d0eYdSrnfvrzWH0tmrgTdjWwjwU0jRbwqM8JfCKAK9wvz7RLYBzBYhsHYXEI9HtNzRVJUYR8V5VfjwlyucIVCy4CuqITQsgblGUdeKRb4VxIiUuV260kILV1mPC3cD5Tbf+xei1sboPbQwERIUJIWLPWneRV57VVlcREgSBlvosFFnFwanzNi9m5zvEOdPbHAGUGBfOhOQMFzoJHf0t5z47h3qxmgCMnibAg/fZFDLEpzET4yfGPpinGv5ktY9g23Yk3RVG/pAArDRyiQ/FTuz+H/ogpeNY0VCn9oVV80Y6rT5NezzacfECmSIzeaujJn7kVhWRrwfH/9pFMre59AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAD3LvwE+BbfHUYZ6jQ+sqECdomMBPXHzIPh7+7zwkShKEn3zWtFnNJII31+uAT0BqRztqWKncuf59tWSuJT5aklkPb1FZTCd9+/b4bt21qJqZJDXV8ykQV849JbxhkYntFMB+S4YF0Z90VPgkWGDR9PBsYLoM6yIrYSTaSoZKrX4wAgMwQB1D8zXaDw6XFI02khlgkmE5VtR5dO6i774h7jDb1ZIwaxSlXUJitc3imJTtQun42sRQBI1ta51ErlgMJuxXx+2TL4Mp3QH7ZVb2E+Tor6nLpfy2qFmG53skbUIcFlxt+hkzVzkMb7QbXKyVWKtG46BW2qhKCocZHDbMf8='),('6d733807-ae80-4e0e-99cf-214c550d16cb','85a4b0f1-7770-46f7-b489-48d685072db7','privateKey','MIIEowIBAAKCAQEAgQAA62bZwAZvuAm2iRVBIrmuQBw3D+x+xm3BozK/kxehcCK4DrAlO0pQmtp5303Tasrlo2ShApyb9jeVHSvR2+FD6Z5hlP2gzkBVrfCZHEQ4jS5OklEtwdbI27swIzHQdoVAYDjjrQEvK0yH/hv3X35z+BVmeSvOXiyMq/BZGm92GEo31eukW448DFQAFtqiP8dScOO1B5WcEeJxsOdksytkrzxfSx3s8o9MUgNtXnY4mSgz0+Dtni1hj2hZz7KemauCeJljf+DxEj2vlOWafhSFLssyiQoPYNmUc4cAwqEed3dIYEZ+G66Ix52/DkfWz4EX8gjfY+03iy5PubRvKwIDAQABAoIBAAzlizH9nldsTU8A6Zba4SAvoBQYvgiBhEsiPfGq6SwzeJhVYEFXquE6lMRmgzin9zL+BedH8DDqp0z+UZIRB3IMG1YH14mlsaXtGKPDIguJZn322zQVmZV/e6U8GZvrJwQyXjVAesKZE7YoeJAXC6woYD+1JAGJN6CCo62s4buatLy62qfDV/Ue2eUuNVLrCc+KgrEajYn/72W5cjA10fPadpSLg+iEKLMJIz6/HGLIuHI2F5RTl8oVQrEINxRQwE90jMpt4m141JFycotQqZz4RhaQ95QaTkCAypCuHpNuSceewdAZzaYzsUtja5yk8uxUUSj4Ar+C3DPJowIYeYECgYEAveXjoxJxLRjptgWPwsG5Vink5TP+vo4U4YGN1HD9rCELRIL+Hfx0Vw2tVYM5nXBNIF532Mx0vjt4wVeVm6WJyqxAn/CsCzvnq17oNJq44Obv/Mz1X5hVEmipQ3U5Yf8fdQQJaBqkM3TOpM9AJoLZv5dr1Cx0lBvrUan06SBlAFMCgYEAredl+t+wPWpi68TPFPdX0DRZHlPR8tvAII4cCpYvB0ZPOsfTBhKlKXYorGtMCL7DEYz0HVthtZJVGoCKOISAKyDNfjvd1rpQFrmft7RYSwfothBKLMOfVBGLeAIHAcoxcFTGl3yBjxsZvJ8Y3j8jtuVHsAd8tKNfhpjKe7VOWskCgYAiw9l+2zt5BByVRENjZk/l5FmRVImInT5ZYnxyrhTi1FHZwxl+p98sqMZY52M+3XZhPKo4OIYO5Zhf3Qb4rb+iKRLTtR3qGJd7Gi7son7CPcUlxOgPDjZU3nBOd0GAHVLG+2w1cNsqyHGkXoTiCAaROsl02IanLs1P8At0OogDHQKBgEmovLJRcwXgfPveRdRcm+5Nbf4BhOj4GV3ws4HscQkEx+Re5UwqM5jnOn0liXQe0OMrL+8LWMyeqbtq/KDJxrv9zeyNEP61tdyaTUNzeP524CPVrIVfaqoiME/pk+w3J0+sKN3bV8k0smcJgHAKkGcUoJO36CNfG8QYDZPujLy5AoGBAJbrmYMt3ZHjW0ildz67/oHmXOqDthsZxarc5OdUppJXFEElgqqMZ2dUDHPUZ6HD7I6Cr2aRB3E4HxT7rGDbdYOt2pDTJBVVfFbAZCiBqM8lxHDofj+r2lsuP2lL1r3YGSPjipcdhweJR6l/GT1cKPIk75huQ0GvsRbJmyXYeclz'),('6e65b9da-8a61-46c9-9042-e98bee88c61e','c9967956-e66d-40de-aceb-a58d6e533489','priority','100'),('776c6b1b-dc7b-4030-a429-3c610426fc9a','739ffbd0-b753-4c46-b052-d795b9d58557','allowed-protocol-mapper-types','saml-role-list-mapper'),('7d9bcfeb-6537-4b68-9d84-7017b1579524','b9963e23-91af-4370-8e34-f559fd62647a','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('825b9570-8369-4cc4-9ada-4aeb951af1e0','6a1fa8ad-d53d-450e-b6f2-c57b69350829','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('8404f784-5f72-4ff4-b62b-ecb7619ff2e1','b9963e23-91af-4370-8e34-f559fd62647a','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('8f386534-3cb6-4d7e-bb37-c74674c4f281','05b9a047-8f2c-4c12-adaf-4e3d580ae281','consent-required-for-all-mappers','true'),('9229eb91-91b6-4ee9-b100-6cf73f1060dc','93e13846-382f-4873-9435-b0126606e09f','max-clients','200'),('9d7cfdc4-743d-4543-869e-b6e79650f476','85a4b0f1-7770-46f7-b489-48d685072db7','priority','100'),('9fd6ddba-3177-4c9c-9862-a13346861903','739ffbd0-b753-4c46-b052-d795b9d58557','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('a0243b16-1962-412a-8e90-ede8c71a82ce','c9967956-e66d-40de-aceb-a58d6e533489','kid','f35df551-c171-4abf-8f88-7452d0f440f8'),('a320b10a-b803-42ea-addb-b82107da750a','c9967956-e66d-40de-aceb-a58d6e533489','secret','al__Be_Ekeev46Eqq-xTy4EXBEzeasVB-TD5XbW9U1M'),('a6f69855-5c79-492e-9a03-13caaa30fe3e','6a1fa8ad-d53d-450e-b6f2-c57b69350829','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('b02e68af-93e3-4309-900a-8b05d64a63e4','b9963e23-91af-4370-8e34-f559fd62647a','allowed-protocol-mapper-types','saml-role-list-mapper'),('b7a86bc8-d1b4-4b5b-8029-5b242ceb7371','05b9a047-8f2c-4c12-adaf-4e3d580ae281','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('bf0b199b-49e4-420e-808c-f67f7e9f6ec1','9c32e524-7334-4cda-b872-63c8795dfee0','max-clients','200'),('c0af228b-3128-4979-91e2-173c05a2740e','b9963e23-91af-4370-8e34-f559fd62647a','allowed-protocol-mapper-types','saml-user-property-mapper'),('ccc9e8a7-4037-4878-848f-a3d6b30ebd26','fc6548d5-f728-4c51-afb1-ec86d001eaf4','host-sending-registration-request-must-match','true'),('d2e856c4-4c10-41f9-a3dc-ffcfebe3ef28','739ffbd0-b753-4c46-b052-d795b9d58557','allowed-protocol-mapper-types','oidc-full-name-mapper'),('d40789ea-a26d-4cb4-94cb-535b73b89ccf','739ffbd0-b753-4c46-b052-d795b9d58557','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('d92c3982-979d-4f69-a1a7-28f11d69d964','739ffbd0-b753-4c46-b052-d795b9d58557','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('e2e3c932-b631-4243-9910-7262e2e6cae4','0b4d7d73-23bd-4e62-9257-29ea53fb52e4','host-sending-registration-request-must-match','true'),('e4d22d3f-ea08-4cf5-a5e7-f8e5043f0377','739ffbd0-b753-4c46-b052-d795b9d58557','consent-required-for-all-mappers','true'),('ee1dd722-a2bb-48cd-90b6-413f30d30d39','05b9a047-8f2c-4c12-adaf-4e3d580ae281','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('fb78ff6d-5084-4160-a737-f10246f47a1d','3e83cfb0-7aed-4d48-bfe7-3899448bca81','priority','100'),('fe1c1764-668e-47c2-acdb-24be04ca1d9b','05b9a047-8f2c-4c12-adaf-4e3d580ae281','allowed-protocol-mapper-types','oidc-full-name-mapper');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  KEY `FK_A63WVEKFTU8JO1PNJ81E7MCE2` (`COMPOSITE`),
  KEY `FK_GR7THLLB9LU8Q4VQA4524JJY8` (`CHILD_ROLE`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('d94c5820-4281-49b9-9615-eced17528397','dd8a0f51-5999-4206-9014-f02ce20b8cdf'),('d94c5820-4281-49b9-9615-eced17528397','b30ac777-bcfc-4dbf-9da4-c2df324cfedd'),('d94c5820-4281-49b9-9615-eced17528397','cdcda281-1e98-4037-91bf-fa04307f1ead'),('d94c5820-4281-49b9-9615-eced17528397','e89c4fa0-eda1-4f84-b836-2f67dfcd3bff'),('d94c5820-4281-49b9-9615-eced17528397','4f5893d7-e5ab-45ac-98a9-a710886ddae6'),('d94c5820-4281-49b9-9615-eced17528397','af01777a-c1f1-4ade-ac04-ff7fadf0e2cc'),('d94c5820-4281-49b9-9615-eced17528397','59cea391-2925-438a-9de1-5a41f8c0fef6'),('d94c5820-4281-49b9-9615-eced17528397','c7d7c772-a646-4b37-a97e-ae7f54de9157'),('d94c5820-4281-49b9-9615-eced17528397','4f1b6424-f460-4f71-b006-1899ab2bcb1e'),('d94c5820-4281-49b9-9615-eced17528397','ade4ee4a-1fee-4263-88d3-bbe5d4cd9a32'),('d94c5820-4281-49b9-9615-eced17528397','3e3ed5bf-5cd5-4d48-914e-f8f4b1a71f07'),('d94c5820-4281-49b9-9615-eced17528397','08d438e4-ef7d-4523-bf88-a6b7326ec298'),('d94c5820-4281-49b9-9615-eced17528397','94cafee5-840d-4800-8259-e4797536aff0'),('d94c5820-4281-49b9-9615-eced17528397','940c3f97-12f9-4766-8e9e-f5da2b0e5b59'),('d94c5820-4281-49b9-9615-eced17528397','38fc513a-dc2b-4b18-a75b-ecda412a73bc'),('d94c5820-4281-49b9-9615-eced17528397','a548e535-e53c-410b-ae50-936105cd6a1e'),('d94c5820-4281-49b9-9615-eced17528397','9334c1ed-eeda-442f-b302-1f6c035f7cfa'),('d94c5820-4281-49b9-9615-eced17528397','0ca97319-5e16-4273-8a74-268bd17f5fc4'),('d94c5820-4281-49b9-9615-eced17528397','c57d8b80-da17-4ce5-9859-1c5826e479ca'),('d94c5820-4281-49b9-9615-eced17528397','89785bff-5fe1-4556-91cd-8b904b5feeb1'),('d94c5820-4281-49b9-9615-eced17528397','84997238-7cd2-47df-8392-695933c636cc'),('d94c5820-4281-49b9-9615-eced17528397','f2fd43b5-8e19-4799-bb9e-4fa06cf78b81'),('d94c5820-4281-49b9-9615-eced17528397','027fb821-0e3e-49b0-adcc-5ce2734ab101'),('d94c5820-4281-49b9-9615-eced17528397','8b674188-7ad8-4f72-a2e9-cd8a2706771b'),('d94c5820-4281-49b9-9615-eced17528397','031590ba-106b-4f77-8f19-e0c681a524e1'),('d94c5820-4281-49b9-9615-eced17528397','a199b434-00dc-40df-b134-24e44c8009bd'),('d94c5820-4281-49b9-9615-eced17528397','f02f055f-72c6-4cf8-a539-70f98e93069f'),('d94c5820-4281-49b9-9615-eced17528397','175b3469-bf06-417e-93f6-4bfb3b085d16'),('d94c5820-4281-49b9-9615-eced17528397','1906cd0a-7fd0-4d25-bb80-afb182566c4f'),('071c955f-a95b-41f7-b162-76f9af18cff1','c3c5c01e-24a9-4c2e-9b95-d78acce78453'),('071c955f-a95b-41f7-b162-76f9af18cff1','94921bd7-aa53-4516-9514-f226ce07046e'),('071c955f-a95b-41f7-b162-76f9af18cff1','32914cfb-d84a-481c-94f6-289d156dd332'),('071c955f-a95b-41f7-b162-76f9af18cff1','0789b2bd-db8e-4763-b6f3-eafea528ba42'),('071c955f-a95b-41f7-b162-76f9af18cff1','a18049d4-3520-4be5-bc93-67a68204262c'),('071c955f-a95b-41f7-b162-76f9af18cff1','073b6c4e-a0d6-4442-918a-37e97d322b35'),('071c955f-a95b-41f7-b162-76f9af18cff1','148923e9-9f64-4d33-ae3b-4ee8eea2fe95'),('071c955f-a95b-41f7-b162-76f9af18cff1','0371d3f3-10ca-4ccb-ad3a-d157a660587c'),('071c955f-a95b-41f7-b162-76f9af18cff1','d8c757a2-28ce-4768-a974-6546739689c8'),('071c955f-a95b-41f7-b162-76f9af18cff1','ff17c9f7-3d63-4fd7-8bcb-14ea7d4a455d'),('071c955f-a95b-41f7-b162-76f9af18cff1','4e4420aa-a1d1-4c9d-a189-bd2b87b69f2f'),('071c955f-a95b-41f7-b162-76f9af18cff1','aa31a615-8474-4932-999e-e8af62b0f031'),('071c955f-a95b-41f7-b162-76f9af18cff1','1dd07988-f58b-4836-b8ad-b20a2aed957a'),('071c955f-a95b-41f7-b162-76f9af18cff1','97791ac9-0245-4c95-8c48-cffbf833cc21');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `DEVICE` varchar(255) DEFAULT NULL,
  `HASH_ITERATIONS` int(11) DEFAULT NULL,
  `SALT` blob,
  `TYPE` varchar(255) DEFAULT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `COUNTER` int(11) DEFAULT '0',
  `DIGITS` int(11) DEFAULT '6',
  `PERIOD` int(11) DEFAULT '30',
  `ALGORITHM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('419c0b9b-361b-4747-bddf-6d9726528013',NULL,20000,'ÿ»d¾VåùDJ0ï½ž!','password','Rh4qnNxyRBxgrJEc87BD3lu86efIfCmNahYKH7HQbu5OESwRaXTq41AL1VYoORJZr2JL5ZAkpkIxl0jAO7zKvA==','9bf91d4d-459a-4dc5-9675-265d9838b344',NULL,0,0,0,'pbkdf2'),('94556e2f-fa6e-4c80-bb70-3b6378dec025',NULL,20000,'@Ü\n‡½UæPn!!Ÿ{|','password-history','6LHAy8tRFFSsqQgd2FrSbsTYJzC8t/ejYpzEcMm/3qnta2dZQAnDuACsr3XgaSCmbmQlzXA1DjmJCqyg2xyLOA==','bf5ac7f9-a518-4b3d-9078-d7f088483f48',1499437436586,0,0,0,'pbkdf2'),('f7ad9d5d-66dd-4821-8ba5-59278ace5f57',NULL,20000,'ªTl8s€\0t>”¹«Š','password','hEJ1XEUPFo29RJkZGqh1SCxlmSLvTve+U6D6k5rQ3NLDosBKC8GoZpp67Q0IH68D1Z0Mf4Lhai8/GXEnuMLF5Q==','bf5ac7f9-a518-4b3d-9078-d7f088483f48',1499449817289,0,0,0,'pbkdf2');
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL_ATTRIBUTE`
--

DROP TABLE IF EXISTS `CREDENTIAL_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CREDENTIAL_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `CREDENTIAL_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  KEY `FK_CRED_ATTR` (`CREDENTIAL_ID`),
  CONSTRAINT `FK_CRED_ATTR` FOREIGN KEY (`CREDENTIAL_ID`) REFERENCES `CREDENTIAL` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL_ATTRIBUTE`
--

LOCK TABLES `CREDENTIAL_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CREDENTIAL_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2017-07-01 17:13:50',1,'EXECUTED','7:00a57f7a6fb456639b34e62972e0ec02','createTable (x29), addPrimaryKey (x21), addUniqueConstraint (x9), addForeignKeyConstraint (x32)','',NULL,'3.4.1',NULL,NULL),('1.0.0.Final','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2017-07-01 17:13:50',2,'MARK_RAN','7:f061c3934594ee60a9b2343f5100ae4e','createTable (x29), addPrimaryKey (x21), addUniqueConstraint (x6), addForeignKeyConstraint (x30)','',NULL,'3.4.1',NULL,NULL),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2017-07-01 17:13:51',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete (x3), createTable (x3), addColumn (x5), addPrimaryKey (x3), addForeignKeyConstraint (x3), customChange','',NULL,'3.4.1',NULL,NULL),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2017-07-01 17:13:51',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn','',NULL,'3.4.1',NULL,NULL),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2017-07-01 17:13:53',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete (x4), createTable (x8), addColumn (x2), addPrimaryKey (x6), addForeignKeyConstraint (x9), addUniqueConstraint (x2), addColumn, dropForeignKeyConstraint (x2), dropUniqueConstraint, renameColumn (x3), addUniqueConstraint, addForeignKeyConstra...','',NULL,'3.4.1',NULL,NULL),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2017-07-01 17:13:53',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete (x4), createTable (x8), addColumn (x2), addPrimaryKey (x6), addForeignKeyConstraint (x9), addUniqueConstraint (x2), addColumn, dropForeignKeyConstraint (x2), dropUniqueConstraint, renameColumn (x3), customChange, dropForeignKeyConstraint, d...','',NULL,'3.4.1',NULL,NULL),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2017-07-01 17:13:56',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete (x5), createTable (x3), addColumn, createTable (x4), addPrimaryKey (x7), addForeignKeyConstraint (x6), renameColumn, addColumn (x2), update, dropColumn, dropForeignKeyConstraint, renameColumn, addForeignKeyConstraint, dropForeignKeyConstrai...','',NULL,'3.4.1',NULL,NULL),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2017-07-01 17:13:56',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete (x5), createTable (x3), addColumn, createTable (x4), addPrimaryKey (x7), addForeignKeyConstraint (x6), renameColumn, addUniqueConstraint, addColumn (x2), update, dropColumn, dropForeignKeyConstraint, renameColumn, addForeignKeyConstraint, r...','',NULL,'3.4.1',NULL,NULL),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2017-07-01 17:13:56',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update (x3)','',NULL,'3.4.1',NULL,NULL),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2017-07-01 17:13:58',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete (x6), createTable (x7), addColumn, createTable, addColumn (x2), update, dropDefaultValue, dropColumn, addColumn, update (x4), addPrimaryKey (x4), dropPrimaryKey, dropColumn, addPrimaryKey (x4), addForeignKeyConstraint (x8), dropDefaultValue...','',NULL,'3.4.1',NULL,NULL),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2017-07-01 17:14:00',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete (x7), addColumn (x5), dropColumn, renameTable (x2), update (x10), createTable (x3), customChange, dropPrimaryKey, addPrimaryKey (x4), addForeignKeyConstraint (x2), dropColumn, addColumn','',NULL,'3.4.1',NULL,NULL),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2017-07-01 17:14:00',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete (x7), addColumn (x5), dropColumn, renameTable, dropForeignKeyConstraint, renameTable, addForeignKeyConstraint, update (x10), createTable (x3), customChange, dropPrimaryKey, addPrimaryKey (x4), addForeignKeyConstraint (x2), dropColumn, addCo...','',NULL,'3.4.1',NULL,NULL),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2017-07-01 17:14:00',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete (x7), dropDefaultValue, dropColumn, addColumn (x3)','',NULL,'3.4.1',NULL,NULL),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2017-07-01 17:14:01',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn (x3), createTable (x2), addPrimaryKey (x2)','',NULL,'3.4.1',NULL,NULL),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2017-07-01 17:14:01',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete (x2)','',NULL,'3.4.1',NULL,NULL),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2017-07-01 17:14:01',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey (x2), addColumn, update, dropColumn, addColumn, update, dropColumn, addPrimaryKey (x2)','',NULL,'3.4.1',NULL,NULL),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2017-07-01 17:14:02',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','Empty','',NULL,'3.4.1',NULL,NULL),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2017-07-01 17:14:03',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable (x5), addColumn (x2), dropDefaultValue, dropColumn, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint (x2), addUniqueConstrain...','',NULL,'3.4.1',NULL,NULL),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2017-07-01 17:14:05',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn, createTable (x3), dropNotNullConstraint, addColumn (x2), createTable, addPrimaryKey, addUniqueConstraint, addForeignKeyConstraint (x5), addPrimaryKey, addForeignKeyConstraint (x2), addPrimaryKey, addForeignKeyConstraint, update','',NULL,'3.4.1',NULL,NULL),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2017-07-01 17:14:05',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue, update','',NULL,'3.4.1',NULL,NULL),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2017-07-01 17:14:05',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn, createTable (x3), dropNotNullConstraint, addColumn (x2), createTable, addPrimaryKey, addUniqueConstraint, addForeignKeyConstraint (x5), addPrimaryKey, addForeignKeyConstraint (x2), addPrimaryKey, addForeignKeyConstraint, update','',NULL,'3.4.1',NULL,NULL),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2017-07-01 17:14:05',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue, update','',NULL,'3.4.1',NULL,NULL),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2017-07-01 17:14:05',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update (x9), customChange, dropForeignKeyConstraint (x2), dropUniqueConstraint, dropTable, dropForeignKeyConstraint (x2), dropTable, dropForeignKeyConstraint (x2), dropUniqueConstraint, dropTable, createIndex','',NULL,'3.4.1',NULL,NULL),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2017-07-01 17:14:06',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType (x3)','',NULL,'3.4.1',NULL,NULL),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2017-07-01 17:14:06',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType (x2)','',NULL,'3.4.1',NULL,NULL),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2017-07-01 17:14:06',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex (x11)','',NULL,'3.4.1',NULL,NULL),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2017-07-01 17:14:09',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable, addPrimaryKey, addUniqueConstraint, createTable, addPrimaryKey, addForeignKeyConstraint, addUniqueConstraint, createTable, addPrimaryKey, addForeignKeyConstraint, addUniqueConstraint, createTable, addPrimaryKey, addForeignKeyConstrain...','',NULL,'3.4.1',NULL,NULL),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2017-07-01 17:14:09',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update','',NULL,'3.4.1',NULL,NULL),('2.1.0','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2017-07-01 17:14:10',29,'EXECUTED','7:e01599a82bf8d6dc22a9da506e22e868','createTable (x11), addPrimaryKey (x11), addForeignKeyConstraint (x2)','',NULL,'3.4.1',NULL,NULL),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2017-07-01 17:14:10',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn, createTable (x2), modifyDataType, addForeignKeyConstraint (x2)','',NULL,'3.4.1',NULL,NULL),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2017-07-01 17:14:11',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable, addPrimaryKey, dropDefaultValue, dropColumn, addColumn (x2), customChange, dropColumn (x4), addColumn','',NULL,'3.4.1',NULL,NULL),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2017-07-01 17:14:11',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.4.1',NULL,NULL),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2017-07-01 17:14:11',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange, modifyDataType','',NULL,'3.4.1',NULL,NULL),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2017-07-01 17:14:11',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType (x13), addColumn, sql, dropColumn, renameColumn, modifyDataType (x2)','',NULL,'3.4.1',NULL,NULL),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2017-07-01 17:14:13',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType (x5), dropUniqueConstraint, modifyDataType (x3), addUniqueConstraint, dropPrimaryKey, modifyDataType, addNotNullConstraint, addPrimaryKey, modifyDataType (x5), dropUniqueConstraint, modifyDataType, addUniqueConstraint, modifyDataType','',NULL,'3.4.1',NULL,NULL),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2017-07-01 17:14:13',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn','',NULL,'3.4.1',NULL,NULL),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2017-07-01 17:14:13',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint','',NULL,'3.4.1',NULL,NULL),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2017-07-01 17:14:13',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn','',NULL,'3.4.1',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` varchar(2550) DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint(20) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_CREDENTIAL_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_CREDENTIAL_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_CREDENTIAL_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `CREDENTIAL_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  KEY `FK_FED_CRED_ATTR` (`CREDENTIAL_ID`),
  CONSTRAINT `FK_FED_CRED_ATTR` FOREIGN KEY (`CREDENTIAL_ID`) REFERENCES `FED_USER_CREDENTIAL` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_CREDENTIAL_ATTRIBUTE`
--

LOCK TABLES `FED_CREDENTIAL_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_CREDENTIAL_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_CREDENTIAL_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` varchar(2024) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_PROT_MAPPER`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CONSENT_PROT_MAPPER` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`PROTOCOL_MAPPER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_PROT_MAPPER`
--

LOCK TABLES `FED_USER_CONSENT_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_ROLE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CONSENT_ROLE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_ROLE`
--

LOCK TABLES `FED_USER_CONSENT_ROLE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `DEVICE` varchar(255) DEFAULT NULL,
  `HASH_ITERATIONS` int(11) DEFAULT NULL,
  `SALT` blob,
  `TYPE` varchar(255) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `COUNTER` int(11) DEFAULT '0',
  `DIGITS` int(11) DEFAULT '6',
  `PERIOD` int(11) DEFAULT '30',
  `ALGORITHM` varchar(36) DEFAULT 'HmacSHA1',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_GROUP_ATTRIBUTE_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `FK_GROUP_ROLE_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `FK2B4EBC52AE5C3B34` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_IDPM_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PARENT_GROUP` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`),
  CONSTRAINT `FK_GROUP_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(36) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  `SCOPE_PARAM_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` (`REALM`),
  KEY `FK_KJHO5LE2C0RAL09FL8CM9WFW9` (`CLIENT`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_KJHO5LE2C0RAL09FL8CM9WFW9` FOREIGN KEY (`CLIENT`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('027fb821-0e3e-49b0-adcc-5ce2734ab101','ed91dee2-3a98-430d-89bc-4f315307a392','','${role_manage-realm}','manage-realm','master','ed91dee2-3a98-430d-89bc-4f315307a392',NULL,'\0'),('031590ba-106b-4f77-8f19-e0c681a524e1','ed91dee2-3a98-430d-89bc-4f315307a392','','${role_manage-clients}','manage-clients','master','ed91dee2-3a98-430d-89bc-4f315307a392',NULL,'\0'),('0371d3f3-10ca-4ccb-ad3a-d157a660587c','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3','','${role_manage-realm}','manage-realm','SciexCloud','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL,'\0'),('069e86fe-1e23-4394-9b50-09614fe3828c','90c8a4c7-a490-4a48-bef8-bdf65a132b55','','${role_read-token}','read-token','SciexCloud','90c8a4c7-a490-4a48-bef8-bdf65a132b55',NULL,'\0'),('071c955f-a95b-41f7-b162-76f9af18cff1','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3','','${role_realm-admin}','realm-admin','SciexCloud','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL,'\0'),('073b6c4e-a0d6-4442-918a-37e97d322b35','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3','','${role_view-identity-providers}','view-identity-providers','SciexCloud','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL,'\0'),('0789b2bd-db8e-4763-b6f3-eafea528ba42','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3','','${role_view-clients}','view-clients','SciexCloud','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL,'\0'),('08d438e4-ef7d-4523-bf88-a6b7326ec298','1477fe3c-84cc-4391-b301-657e96341eac','','${role_manage-events}','manage-events','master','1477fe3c-84cc-4391-b301-657e96341eac',NULL,'\0'),('0ca97319-5e16-4273-8a74-268bd17f5fc4','ed91dee2-3a98-430d-89bc-4f315307a392','','${role_view-users}','view-users','master','ed91dee2-3a98-430d-89bc-4f315307a392',NULL,'\0'),('148923e9-9f64-4d33-ae3b-4ee8eea2fe95','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3','','${role_view-authorization}','view-authorization','SciexCloud','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL,'\0'),('175b3469-bf06-417e-93f6-4bfb3b085d16','ed91dee2-3a98-430d-89bc-4f315307a392','','${role_manage-authorization}','manage-authorization','master','ed91dee2-3a98-430d-89bc-4f315307a392',NULL,'\0'),('1906cd0a-7fd0-4d25-bb80-afb182566c4f','ed91dee2-3a98-430d-89bc-4f315307a392','','${role_impersonation}','impersonation','master','ed91dee2-3a98-430d-89bc-4f315307a392',NULL,'\0'),('1dd07988-f58b-4836-b8ad-b20a2aed957a','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3','','${role_manage-authorization}','manage-authorization','SciexCloud','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL,'\0'),('1eeb498c-e851-4031-9ae7-56a4b2c4434d','SciexCloud','\0','${role_uma_authorization}','uma_authorization','SciexCloud',NULL,'SciexCloud','\0'),('23571462-0d2a-492f-bd55-95a0ba379abc','f92da4a2-83e0-47e2-868b-5d71cd347730','','${role_view-profile}','view-profile','master','f92da4a2-83e0-47e2-868b-5d71cd347730',NULL,'\0'),('28065f8a-fe5f-458b-80de-b2170f119e11','a98a77f0-c663-48b9-b4f0-363325780740','','${role_read-token}','read-token','master','a98a77f0-c663-48b9-b4f0-363325780740',NULL,'\0'),('32914cfb-d84a-481c-94f6-289d156dd332','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3','','${role_view-users}','view-users','SciexCloud','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL,'\0'),('37201ab9-5647-40cb-970d-4859fedc1a93','37c2ff0f-144f-486f-ae37-df5ea128c546','','${role_manage-account}','manage-account','SciexCloud','37c2ff0f-144f-486f-ae37-df5ea128c546',NULL,'\0'),('38fc513a-dc2b-4b18-a75b-ecda412a73bc','1477fe3c-84cc-4391-b301-657e96341eac','','${role_impersonation}','impersonation','master','1477fe3c-84cc-4391-b301-657e96341eac',NULL,'\0'),('3e3ed5bf-5cd5-4d48-914e-f8f4b1a71f07','1477fe3c-84cc-4391-b301-657e96341eac','','${role_manage-clients}','manage-clients','master','1477fe3c-84cc-4391-b301-657e96341eac',NULL,'\0'),('4e4420aa-a1d1-4c9d-a189-bd2b87b69f2f','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3','','${role_manage-events}','manage-events','SciexCloud','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL,'\0'),('4f1b6424-f460-4f71-b006-1899ab2bcb1e','1477fe3c-84cc-4391-b301-657e96341eac','','${role_manage-realm}','manage-realm','master','1477fe3c-84cc-4391-b301-657e96341eac',NULL,'\0'),('4f5893d7-e5ab-45ac-98a9-a710886ddae6','1477fe3c-84cc-4391-b301-657e96341eac','','${role_view-clients}','view-clients','master','1477fe3c-84cc-4391-b301-657e96341eac',NULL,'\0'),('59cea391-2925-438a-9de1-5a41f8c0fef6','1477fe3c-84cc-4391-b301-657e96341eac','','${role_view-identity-providers}','view-identity-providers','master','1477fe3c-84cc-4391-b301-657e96341eac',NULL,'\0'),('7cfa0201-12a3-4097-9cbd-43e87677cad3','37c2ff0f-144f-486f-ae37-df5ea128c546','','${role_view-profile}','view-profile','SciexCloud','37c2ff0f-144f-486f-ae37-df5ea128c546',NULL,'\0'),('84997238-7cd2-47df-8392-695933c636cc','ed91dee2-3a98-430d-89bc-4f315307a392','','${role_view-identity-providers}','view-identity-providers','master','ed91dee2-3a98-430d-89bc-4f315307a392',NULL,'\0'),('89785bff-5fe1-4556-91cd-8b904b5feeb1','ed91dee2-3a98-430d-89bc-4f315307a392','','${role_view-events}','view-events','master','ed91dee2-3a98-430d-89bc-4f315307a392',NULL,'\0'),('8b674188-7ad8-4f72-a2e9-cd8a2706771b','ed91dee2-3a98-430d-89bc-4f315307a392','','${role_manage-users}','manage-users','master','ed91dee2-3a98-430d-89bc-4f315307a392',NULL,'\0'),('9213e882-5935-4afb-8a34-179dd44c3396','master','\0','${role_uma_authorization}','uma_authorization','master',NULL,'master','\0'),('9334c1ed-eeda-442f-b302-1f6c035f7cfa','ed91dee2-3a98-430d-89bc-4f315307a392','','${role_view-realm}','view-realm','master','ed91dee2-3a98-430d-89bc-4f315307a392',NULL,'\0'),('940c3f97-12f9-4766-8e9e-f5da2b0e5b59','1477fe3c-84cc-4391-b301-657e96341eac','','${role_manage-authorization}','manage-authorization','master','1477fe3c-84cc-4391-b301-657e96341eac',NULL,'\0'),('94921bd7-aa53-4516-9514-f226ce07046e','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3','','${role_view-realm}','view-realm','SciexCloud','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL,'\0'),('94cafee5-840d-4800-8259-e4797536aff0','1477fe3c-84cc-4391-b301-657e96341eac','','${role_manage-identity-providers}','manage-identity-providers','master','1477fe3c-84cc-4391-b301-657e96341eac',NULL,'\0'),('97791ac9-0245-4c95-8c48-cffbf833cc21','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3','','${role_impersonation}','impersonation','SciexCloud','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL,'\0'),('9ca0be12-6437-4c78-92b2-b03cd56e171d','f92da4a2-83e0-47e2-868b-5d71cd347730','','${role_manage-account}','manage-account','master','f92da4a2-83e0-47e2-868b-5d71cd347730',NULL,'\0'),('a18049d4-3520-4be5-bc93-67a68204262c','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3','','${role_view-events}','view-events','SciexCloud','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL,'\0'),('a199b434-00dc-40df-b134-24e44c8009bd','ed91dee2-3a98-430d-89bc-4f315307a392','','${role_manage-events}','manage-events','master','ed91dee2-3a98-430d-89bc-4f315307a392',NULL,'\0'),('a548e535-e53c-410b-ae50-936105cd6a1e','ed91dee2-3a98-430d-89bc-4f315307a392','','${role_create-client}','create-client','master','ed91dee2-3a98-430d-89bc-4f315307a392',NULL,'\0'),('aa31a615-8474-4932-999e-e8af62b0f031','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3','','${role_manage-identity-providers}','manage-identity-providers','SciexCloud','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL,'\0'),('ade4ee4a-1fee-4263-88d3-bbe5d4cd9a32','1477fe3c-84cc-4391-b301-657e96341eac','','${role_manage-users}','manage-users','master','1477fe3c-84cc-4391-b301-657e96341eac',NULL,'\0'),('af01777a-c1f1-4ade-ac04-ff7fadf0e2cc','1477fe3c-84cc-4391-b301-657e96341eac','','${role_view-events}','view-events','master','1477fe3c-84cc-4391-b301-657e96341eac',NULL,'\0'),('b30ac777-bcfc-4dbf-9da4-c2df324cfedd','1477fe3c-84cc-4391-b301-657e96341eac','','${role_create-client}','create-client','master','1477fe3c-84cc-4391-b301-657e96341eac',NULL,'\0'),('ba9e8d04-4628-434a-b8c8-160bdd671774','master','\0','${role_offline-access}','offline_access','master',NULL,'master',''),('c3c5c01e-24a9-4c2e-9b95-d78acce78453','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3','','${role_create-client}','create-client','SciexCloud','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL,'\0'),('c57d8b80-da17-4ce5-9859-1c5826e479ca','ed91dee2-3a98-430d-89bc-4f315307a392','','${role_view-clients}','view-clients','master','ed91dee2-3a98-430d-89bc-4f315307a392',NULL,'\0'),('c7d7c772-a646-4b37-a97e-ae7f54de9157','1477fe3c-84cc-4391-b301-657e96341eac','','${role_view-authorization}','view-authorization','master','1477fe3c-84cc-4391-b301-657e96341eac',NULL,'\0'),('cdcda281-1e98-4037-91bf-fa04307f1ead','1477fe3c-84cc-4391-b301-657e96341eac','','${role_view-realm}','view-realm','master','1477fe3c-84cc-4391-b301-657e96341eac',NULL,'\0'),('d8c757a2-28ce-4768-a974-6546739689c8','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3','','${role_manage-users}','manage-users','SciexCloud','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL,'\0'),('d94c5820-4281-49b9-9615-eced17528397','master','\0','${role_admin}','admin','master',NULL,'master','\0'),('dd8a0f51-5999-4206-9014-f02ce20b8cdf','master','\0','${role_create-realm}','create-realm','master',NULL,'master','\0'),('e4e63b4c-c471-4110-a6db-3ea11dd506be','SciexCloud','\0','${role_offline-access}','offline_access','SciexCloud',NULL,'SciexCloud',''),('e89c4fa0-eda1-4f84-b836-2f67dfcd3bff','1477fe3c-84cc-4391-b301-657e96341eac','','${role_view-users}','view-users','master','1477fe3c-84cc-4391-b301-657e96341eac',NULL,'\0'),('f02f055f-72c6-4cf8-a539-70f98e93069f','ed91dee2-3a98-430d-89bc-4f315307a392','','${role_manage-identity-providers}','manage-identity-providers','master','ed91dee2-3a98-430d-89bc-4f315307a392',NULL,'\0'),('f2fd43b5-8e19-4799-bb9e-4fa06cf78b81','ed91dee2-3a98-430d-89bc-4f315307a392','','${role_view-authorization}','view-authorization','master','ed91dee2-3a98-430d-89bc-4f315307a392',NULL,'\0'),('ff17c9f7-3d63-4fd7-8bcb-14ea7d4a455d','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3','','${role_manage-clients}','manage-clients','SciexCloud','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL,'\0');
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('SINGLETON','2.5.0');
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `CLIENT_SESSION_ID` varchar(36) NOT NULL,
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `DATA` longtext,
  PRIMARY KEY (`CLIENT_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_TEXT` varchar(255) DEFAULT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_TEMPLATE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PCM_REALM` (`CLIENT_ID`),
  KEY `FK_CLI_TMPLT_MAPPER` (`CLIENT_TEMPLATE_ID`),
  CONSTRAINT `FK_CLI_TMPLT_MAPPER` FOREIGN KEY (`CLIENT_TEMPLATE_ID`) REFERENCES `CLIENT_TEMPLATE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('02556223-fecf-44e9-8648-a35b8d480dd3','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','a98a77f0-c663-48b9-b4f0-363325780740',NULL),('052e5ae8-56d7-453c-91f4-fdd687f50ad6','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','37c2ff0f-144f-486f-ae37-df5ea128c546',NULL),('0e5c78ff-2110-444b-8c5e-00df68463757','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','b2167446-c272-4ac8-a63a-6ad73a286c3c',NULL),('0feed391-4e6b-47f9-86fd-c5dce9d7422d','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','1477fe3c-84cc-4391-b301-657e96341eac',NULL),('1952c370-bec1-4602-b975-348177e6976d','email','openid-connect','oidc-usermodel-property-mapper','','${email}','7e01eff7-e65f-4cc9-b2a4-4dae501bf1ef',NULL),('1a4e5a95-09b2-45d4-a30a-c2d553de6470','username','openid-connect','oidc-usermodel-property-mapper','','${username}','a98a77f0-c663-48b9-b4f0-363325780740',NULL),('1d52df5a-3239-4641-98cd-14082571073c','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','7e01eff7-e65f-4cc9-b2a4-4dae501bf1ef',NULL),('1fbafee9-d167-4301-97af-45b1e6af477c','role list','saml','saml-role-list-mapper','\0',NULL,'f92da4a2-83e0-47e2-868b-5d71cd347730',NULL),('206880af-10b8-4225-9a52-52d7fda320f2','username','openid-connect','oidc-usermodel-property-mapper','','${username}','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL),('2088aafa-e9f6-4863-841e-de6886ca74af','username','openid-connect','oidc-usermodel-property-mapper','','${username}','f92da4a2-83e0-47e2-868b-5d71cd347730',NULL),('22cb16b8-8b22-4f8c-80cc-36ac386a6ee2','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','77d19141-15d1-418b-b021-4dbc2c313fe0',NULL),('236de83f-e573-454b-b49b-2ae3b5e7c427','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL),('255fab8a-ded2-4b74-823b-9833635ea1bf','email','openid-connect','oidc-usermodel-property-mapper','','${email}','90c8a4c7-a490-4a48-bef8-bdf65a132b55',NULL),('26e74ac3-2fe9-4aca-8872-b2ccc6f19122','role list','saml','saml-role-list-mapper','\0',NULL,'90c8a4c7-a490-4a48-bef8-bdf65a132b55',NULL),('2bae365e-cd4c-46db-b6b7-b890366939bb','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','90c8a4c7-a490-4a48-bef8-bdf65a132b55',NULL),('30247e9b-9fc0-4a95-a6f4-5caced4ac687','username','openid-connect','oidc-usermodel-property-mapper','','${username}','ed91dee2-3a98-430d-89bc-4f315307a392',NULL),('3039b785-f37e-4db6-834f-fc3d1d9b7244','username','openid-connect','oidc-usermodel-property-mapper','','${username}','37c2ff0f-144f-486f-ae37-df5ea128c546',NULL),('38296a8c-1c2d-47fe-bc79-a4ab3fba1d72','email','openid-connect','oidc-usermodel-property-mapper','','${email}','77d19141-15d1-418b-b021-4dbc2c313fe0',NULL),('3831a8d7-2826-414c-bdc6-1020ad3c2cb8','username','openid-connect','oidc-usermodel-property-mapper','','${username}','e109ff77-de62-4914-a584-b92d3d684253',NULL),('3d17bfe4-00c4-4ae4-9d0d-6256a85d7517','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','77d19141-15d1-418b-b021-4dbc2c313fe0',NULL),('3f50fa95-dd0e-4fce-98d0-5048a57fdcbd','username','openid-connect','oidc-usermodel-property-mapper','','${username}','1477fe3c-84cc-4391-b301-657e96341eac',NULL),('3fee7745-ec09-4c2c-b037-a4fa2c0da141','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','f92da4a2-83e0-47e2-868b-5d71cd347730',NULL),('422c948d-1141-4b39-914a-127d9558e466','full name','openid-connect','oidc-full-name-mapper','','${fullName}','e109ff77-de62-4914-a584-b92d3d684253',NULL),('45ad5a96-c5f4-4552-b6ce-5d76f1ba9312','full name','openid-connect','oidc-full-name-mapper','','${fullName}','f92da4a2-83e0-47e2-868b-5d71cd347730',NULL),('4881f6e8-c29a-4ca9-88d0-dea089a1d59f','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','1477fe3c-84cc-4391-b301-657e96341eac',NULL),('4c2f5c0c-4e20-467a-bf28-b3700ce3a772','full name','openid-connect','oidc-full-name-mapper','','${fullName}','37c2ff0f-144f-486f-ae37-df5ea128c546',NULL),('4c44386f-cec1-41a2-ab2e-99c4b08c662e','email','openid-connect','oidc-usermodel-property-mapper','','${email}','37c2ff0f-144f-486f-ae37-df5ea128c546',NULL),('4d6e794c-4f3f-4480-82f0-9b76580fc772','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','b2167446-c272-4ac8-a63a-6ad73a286c3c',NULL),('6648e42f-0f02-4e69-9ddb-1f33e868b27c','full name','openid-connect','oidc-full-name-mapper','','${fullName}','ed91dee2-3a98-430d-89bc-4f315307a392',NULL),('69442ec1-5650-4541-94af-f40efea01e19','full name','openid-connect','oidc-full-name-mapper','','${fullName}','90c8a4c7-a490-4a48-bef8-bdf65a132b55',NULL),('69b72987-0f44-4cd6-918e-15ae5fa125e9','full name','openid-connect','oidc-full-name-mapper','','${fullName}','b2167446-c272-4ac8-a63a-6ad73a286c3c',NULL),('6a5922cb-1716-4dd9-8314-ea5efc958801','role list','saml','saml-role-list-mapper','\0',NULL,'b2167446-c272-4ac8-a63a-6ad73a286c3c',NULL),('70e6cc6f-692d-4258-af44-676fbb53e7ac','role list','saml','saml-role-list-mapper','\0',NULL,'1477fe3c-84cc-4391-b301-657e96341eac',NULL),('7e178d0a-2871-4f51-824d-7444d016c1d3','full name','openid-connect','oidc-full-name-mapper','','${fullName}','a98a77f0-c663-48b9-b4f0-363325780740',NULL),('7ff6157f-76e7-47ba-8a27-dcf08d64c6e4','role list','saml','saml-role-list-mapper','\0',NULL,'f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL),('84132b9b-a3b5-4c4b-8822-ec409d478c20','username','openid-connect','oidc-usermodel-property-mapper','','${username}','77d19141-15d1-418b-b021-4dbc2c313fe0',NULL),('8526a1cc-ebd4-434c-9ecb-b7f58b79f93f','role list','saml','saml-role-list-mapper','\0',NULL,'7e01eff7-e65f-4cc9-b2a4-4dae501bf1ef',NULL),('8a19b96b-97fb-48ba-b815-39e67a6f368e','username','openid-connect','oidc-usermodel-property-mapper','','${username}','7e01eff7-e65f-4cc9-b2a4-4dae501bf1ef',NULL),('8b037a65-51eb-4c38-82be-e85990c1ac6d','role list','saml','saml-role-list-mapper','\0',NULL,'e109ff77-de62-4914-a584-b92d3d684253',NULL),('8e30ea92-be0c-4565-bb79-a91d9b8f037a','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','90c8a4c7-a490-4a48-bef8-bdf65a132b55',NULL),('8f1dbb9f-7a05-4f5d-9b99-78a4193ccaef','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL),('918a7600-1c72-419e-be40-401325dc2183','full name','openid-connect','oidc-full-name-mapper','','${fullName}','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL),('9ee23000-36ef-4d30-8816-3f1718af28c3','username','openid-connect','oidc-usermodel-property-mapper','','${username}','b2167446-c272-4ac8-a63a-6ad73a286c3c',NULL),('a2dbce4d-d960-4d6a-9845-60b36ec69f33','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','ed91dee2-3a98-430d-89bc-4f315307a392',NULL),('a33c06e7-ee2b-429b-a212-7d3f873fad42','locale','openid-connect','oidc-usermodel-attribute-mapper','\0','${locale}','e109ff77-de62-4914-a584-b92d3d684253',NULL),('a7881636-965d-4115-96d7-9a9eb22dac77','full name','openid-connect','oidc-full-name-mapper','','${fullName}','7e01eff7-e65f-4cc9-b2a4-4dae501bf1ef',NULL),('a8dd24ac-f949-4376-a018-eecc25053cc1','username','openid-connect','oidc-usermodel-property-mapper','','${username}','90c8a4c7-a490-4a48-bef8-bdf65a132b55',NULL),('acc4cc4c-e47e-4046-ac1c-9ee2a0bb26f4','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','7e01eff7-e65f-4cc9-b2a4-4dae501bf1ef',NULL),('ad2d511d-8f5f-4dbf-8a13-3c6557691291','full name','openid-connect','oidc-full-name-mapper','','${fullName}','1477fe3c-84cc-4391-b301-657e96341eac',NULL),('af39c286-0f1e-4bef-bc3e-e6bed9857b7c','role list','saml','saml-role-list-mapper','\0',NULL,'37c2ff0f-144f-486f-ae37-df5ea128c546',NULL),('b8924b54-5bda-4d09-a8e0-7abc709362e9','role list','saml','saml-role-list-mapper','\0',NULL,'ed91dee2-3a98-430d-89bc-4f315307a392',NULL),('b91f4af3-ad1a-4761-95ca-4c15211e7771','email','openid-connect','oidc-usermodel-property-mapper','','${email}','1477fe3c-84cc-4391-b301-657e96341eac',NULL),('b9bc97bc-5743-4b9a-bc37-bf783aa48547','email','openid-connect','oidc-usermodel-property-mapper','','${email}','b2167446-c272-4ac8-a63a-6ad73a286c3c',NULL),('c0155392-3f65-47d8-9160-522b4008df74','email','openid-connect','oidc-usermodel-property-mapper','','${email}','ed91dee2-3a98-430d-89bc-4f315307a392',NULL),('c4cbe3fe-b155-49b8-b314-b7f11a1485c4','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','37c2ff0f-144f-486f-ae37-df5ea128c546',NULL),('ca6e1829-4512-4c5c-ae1d-9a79e36b856d','email','openid-connect','oidc-usermodel-property-mapper','','${email}','f4f2fc8b-20e0-4df4-8904-43c5154a5fe3',NULL),('cac32b38-5d01-4723-b5de-42e61766c065','role list','saml','saml-role-list-mapper','\0',NULL,'77d19141-15d1-418b-b021-4dbc2c313fe0',NULL),('cefdfe69-6ef0-4338-8ab7-04613da38c85','email','openid-connect','oidc-usermodel-property-mapper','','${email}','e109ff77-de62-4914-a584-b92d3d684253',NULL),('d320e914-2d6b-46a3-bacc-f1cf42594d57','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','ed91dee2-3a98-430d-89bc-4f315307a392',NULL),('d9c40b4e-85a2-4abb-8405-9dfa979cefde','full name','openid-connect','oidc-full-name-mapper','','${fullName}','77d19141-15d1-418b-b021-4dbc2c313fe0',NULL),('d9e6bbe4-3c90-47e5-8fea-534a9cab076c','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','f92da4a2-83e0-47e2-868b-5d71cd347730',NULL),('db2498fa-1878-45c3-bc86-2973232fc881','locale','openid-connect','oidc-usermodel-attribute-mapper','\0','${locale}','b2167446-c272-4ac8-a63a-6ad73a286c3c',NULL),('dd8f02e6-15f1-423b-bd8b-1622ebf31215','role list','saml','saml-role-list-mapper','\0',NULL,'a98a77f0-c663-48b9-b4f0-363325780740',NULL),('de7ad342-aba3-45a0-b8c1-102d489c49a4','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','e109ff77-de62-4914-a584-b92d3d684253',NULL),('e8d3651f-9910-477e-bf92-ec90dbcb3303','email','openid-connect','oidc-usermodel-property-mapper','','${email}','a98a77f0-c663-48b9-b4f0-363325780740',NULL),('e98b6d7e-51f6-4922-a5c7-4c33003ab730','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','e109ff77-de62-4914-a584-b92d3d684253',NULL),('f2954b94-216f-4255-b600-b368235c32bb','email','openid-connect','oidc-usermodel-property-mapper','','${email}','f92da4a2-83e0-47e2-868b-5d71cd347730',NULL),('faec66b1-ce6d-4c88-83a6-c2e0f4f539ae','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','a98a77f0-c663-48b9-b4f0-363325780740',NULL);
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('02556223-fecf-44e9-8648-a35b8d480dd3','true','access.token.claim'),('02556223-fecf-44e9-8648-a35b8d480dd3','family_name','claim.name'),('02556223-fecf-44e9-8648-a35b8d480dd3','true','id.token.claim'),('02556223-fecf-44e9-8648-a35b8d480dd3','String','jsonType.label'),('02556223-fecf-44e9-8648-a35b8d480dd3','lastName','user.attribute'),('02556223-fecf-44e9-8648-a35b8d480dd3','true','userinfo.token.claim'),('052e5ae8-56d7-453c-91f4-fdd687f50ad6','true','access.token.claim'),('052e5ae8-56d7-453c-91f4-fdd687f50ad6','given_name','claim.name'),('052e5ae8-56d7-453c-91f4-fdd687f50ad6','true','id.token.claim'),('052e5ae8-56d7-453c-91f4-fdd687f50ad6','String','jsonType.label'),('052e5ae8-56d7-453c-91f4-fdd687f50ad6','firstName','user.attribute'),('052e5ae8-56d7-453c-91f4-fdd687f50ad6','true','userinfo.token.claim'),('0e5c78ff-2110-444b-8c5e-00df68463757','true','access.token.claim'),('0e5c78ff-2110-444b-8c5e-00df68463757','family_name','claim.name'),('0e5c78ff-2110-444b-8c5e-00df68463757','true','id.token.claim'),('0e5c78ff-2110-444b-8c5e-00df68463757','String','jsonType.label'),('0e5c78ff-2110-444b-8c5e-00df68463757','lastName','user.attribute'),('0e5c78ff-2110-444b-8c5e-00df68463757','true','userinfo.token.claim'),('0feed391-4e6b-47f9-86fd-c5dce9d7422d','true','access.token.claim'),('0feed391-4e6b-47f9-86fd-c5dce9d7422d','family_name','claim.name'),('0feed391-4e6b-47f9-86fd-c5dce9d7422d','true','id.token.claim'),('0feed391-4e6b-47f9-86fd-c5dce9d7422d','String','jsonType.label'),('0feed391-4e6b-47f9-86fd-c5dce9d7422d','lastName','user.attribute'),('0feed391-4e6b-47f9-86fd-c5dce9d7422d','true','userinfo.token.claim'),('1952c370-bec1-4602-b975-348177e6976d','true','access.token.claim'),('1952c370-bec1-4602-b975-348177e6976d','email','claim.name'),('1952c370-bec1-4602-b975-348177e6976d','true','id.token.claim'),('1952c370-bec1-4602-b975-348177e6976d','String','jsonType.label'),('1952c370-bec1-4602-b975-348177e6976d','email','user.attribute'),('1952c370-bec1-4602-b975-348177e6976d','true','userinfo.token.claim'),('1a4e5a95-09b2-45d4-a30a-c2d553de6470','true','access.token.claim'),('1a4e5a95-09b2-45d4-a30a-c2d553de6470','preferred_username','claim.name'),('1a4e5a95-09b2-45d4-a30a-c2d553de6470','true','id.token.claim'),('1a4e5a95-09b2-45d4-a30a-c2d553de6470','String','jsonType.label'),('1a4e5a95-09b2-45d4-a30a-c2d553de6470','username','user.attribute'),('1a4e5a95-09b2-45d4-a30a-c2d553de6470','true','userinfo.token.claim'),('1d52df5a-3239-4641-98cd-14082571073c','true','access.token.claim'),('1d52df5a-3239-4641-98cd-14082571073c','family_name','claim.name'),('1d52df5a-3239-4641-98cd-14082571073c','true','id.token.claim'),('1d52df5a-3239-4641-98cd-14082571073c','String','jsonType.label'),('1d52df5a-3239-4641-98cd-14082571073c','lastName','user.attribute'),('1d52df5a-3239-4641-98cd-14082571073c','true','userinfo.token.claim'),('1fbafee9-d167-4301-97af-45b1e6af477c','Role','attribute.name'),('1fbafee9-d167-4301-97af-45b1e6af477c','Basic','attribute.nameformat'),('1fbafee9-d167-4301-97af-45b1e6af477c','false','single'),('206880af-10b8-4225-9a52-52d7fda320f2','true','access.token.claim'),('206880af-10b8-4225-9a52-52d7fda320f2','preferred_username','claim.name'),('206880af-10b8-4225-9a52-52d7fda320f2','true','id.token.claim'),('206880af-10b8-4225-9a52-52d7fda320f2','String','jsonType.label'),('206880af-10b8-4225-9a52-52d7fda320f2','username','user.attribute'),('206880af-10b8-4225-9a52-52d7fda320f2','true','userinfo.token.claim'),('2088aafa-e9f6-4863-841e-de6886ca74af','true','access.token.claim'),('2088aafa-e9f6-4863-841e-de6886ca74af','preferred_username','claim.name'),('2088aafa-e9f6-4863-841e-de6886ca74af','true','id.token.claim'),('2088aafa-e9f6-4863-841e-de6886ca74af','String','jsonType.label'),('2088aafa-e9f6-4863-841e-de6886ca74af','username','user.attribute'),('2088aafa-e9f6-4863-841e-de6886ca74af','true','userinfo.token.claim'),('22cb16b8-8b22-4f8c-80cc-36ac386a6ee2','true','access.token.claim'),('22cb16b8-8b22-4f8c-80cc-36ac386a6ee2','family_name','claim.name'),('22cb16b8-8b22-4f8c-80cc-36ac386a6ee2','true','id.token.claim'),('22cb16b8-8b22-4f8c-80cc-36ac386a6ee2','String','jsonType.label'),('22cb16b8-8b22-4f8c-80cc-36ac386a6ee2','lastName','user.attribute'),('22cb16b8-8b22-4f8c-80cc-36ac386a6ee2','true','userinfo.token.claim'),('236de83f-e573-454b-b49b-2ae3b5e7c427','true','access.token.claim'),('236de83f-e573-454b-b49b-2ae3b5e7c427','given_name','claim.name'),('236de83f-e573-454b-b49b-2ae3b5e7c427','true','id.token.claim'),('236de83f-e573-454b-b49b-2ae3b5e7c427','String','jsonType.label'),('236de83f-e573-454b-b49b-2ae3b5e7c427','firstName','user.attribute'),('236de83f-e573-454b-b49b-2ae3b5e7c427','true','userinfo.token.claim'),('255fab8a-ded2-4b74-823b-9833635ea1bf','true','access.token.claim'),('255fab8a-ded2-4b74-823b-9833635ea1bf','email','claim.name'),('255fab8a-ded2-4b74-823b-9833635ea1bf','true','id.token.claim'),('255fab8a-ded2-4b74-823b-9833635ea1bf','String','jsonType.label'),('255fab8a-ded2-4b74-823b-9833635ea1bf','email','user.attribute'),('255fab8a-ded2-4b74-823b-9833635ea1bf','true','userinfo.token.claim'),('26e74ac3-2fe9-4aca-8872-b2ccc6f19122','Role','attribute.name'),('26e74ac3-2fe9-4aca-8872-b2ccc6f19122','Basic','attribute.nameformat'),('26e74ac3-2fe9-4aca-8872-b2ccc6f19122','false','single'),('2bae365e-cd4c-46db-b6b7-b890366939bb','true','access.token.claim'),('2bae365e-cd4c-46db-b6b7-b890366939bb','family_name','claim.name'),('2bae365e-cd4c-46db-b6b7-b890366939bb','true','id.token.claim'),('2bae365e-cd4c-46db-b6b7-b890366939bb','String','jsonType.label'),('2bae365e-cd4c-46db-b6b7-b890366939bb','lastName','user.attribute'),('2bae365e-cd4c-46db-b6b7-b890366939bb','true','userinfo.token.claim'),('30247e9b-9fc0-4a95-a6f4-5caced4ac687','true','access.token.claim'),('30247e9b-9fc0-4a95-a6f4-5caced4ac687','preferred_username','claim.name'),('30247e9b-9fc0-4a95-a6f4-5caced4ac687','true','id.token.claim'),('30247e9b-9fc0-4a95-a6f4-5caced4ac687','String','jsonType.label'),('30247e9b-9fc0-4a95-a6f4-5caced4ac687','username','user.attribute'),('30247e9b-9fc0-4a95-a6f4-5caced4ac687','true','userinfo.token.claim'),('3039b785-f37e-4db6-834f-fc3d1d9b7244','true','access.token.claim'),('3039b785-f37e-4db6-834f-fc3d1d9b7244','preferred_username','claim.name'),('3039b785-f37e-4db6-834f-fc3d1d9b7244','true','id.token.claim'),('3039b785-f37e-4db6-834f-fc3d1d9b7244','String','jsonType.label'),('3039b785-f37e-4db6-834f-fc3d1d9b7244','username','user.attribute'),('3039b785-f37e-4db6-834f-fc3d1d9b7244','true','userinfo.token.claim'),('38296a8c-1c2d-47fe-bc79-a4ab3fba1d72','true','access.token.claim'),('38296a8c-1c2d-47fe-bc79-a4ab3fba1d72','email','claim.name'),('38296a8c-1c2d-47fe-bc79-a4ab3fba1d72','true','id.token.claim'),('38296a8c-1c2d-47fe-bc79-a4ab3fba1d72','String','jsonType.label'),('38296a8c-1c2d-47fe-bc79-a4ab3fba1d72','email','user.attribute'),('38296a8c-1c2d-47fe-bc79-a4ab3fba1d72','true','userinfo.token.claim'),('3831a8d7-2826-414c-bdc6-1020ad3c2cb8','true','access.token.claim'),('3831a8d7-2826-414c-bdc6-1020ad3c2cb8','preferred_username','claim.name'),('3831a8d7-2826-414c-bdc6-1020ad3c2cb8','true','id.token.claim'),('3831a8d7-2826-414c-bdc6-1020ad3c2cb8','String','jsonType.label'),('3831a8d7-2826-414c-bdc6-1020ad3c2cb8','username','user.attribute'),('3831a8d7-2826-414c-bdc6-1020ad3c2cb8','true','userinfo.token.claim'),('3d17bfe4-00c4-4ae4-9d0d-6256a85d7517','true','access.token.claim'),('3d17bfe4-00c4-4ae4-9d0d-6256a85d7517','given_name','claim.name'),('3d17bfe4-00c4-4ae4-9d0d-6256a85d7517','true','id.token.claim'),('3d17bfe4-00c4-4ae4-9d0d-6256a85d7517','String','jsonType.label'),('3d17bfe4-00c4-4ae4-9d0d-6256a85d7517','firstName','user.attribute'),('3d17bfe4-00c4-4ae4-9d0d-6256a85d7517','true','userinfo.token.claim'),('3f50fa95-dd0e-4fce-98d0-5048a57fdcbd','true','access.token.claim'),('3f50fa95-dd0e-4fce-98d0-5048a57fdcbd','preferred_username','claim.name'),('3f50fa95-dd0e-4fce-98d0-5048a57fdcbd','true','id.token.claim'),('3f50fa95-dd0e-4fce-98d0-5048a57fdcbd','String','jsonType.label'),('3f50fa95-dd0e-4fce-98d0-5048a57fdcbd','username','user.attribute'),('3f50fa95-dd0e-4fce-98d0-5048a57fdcbd','true','userinfo.token.claim'),('3fee7745-ec09-4c2c-b037-a4fa2c0da141','true','access.token.claim'),('3fee7745-ec09-4c2c-b037-a4fa2c0da141','given_name','claim.name'),('3fee7745-ec09-4c2c-b037-a4fa2c0da141','true','id.token.claim'),('3fee7745-ec09-4c2c-b037-a4fa2c0da141','String','jsonType.label'),('3fee7745-ec09-4c2c-b037-a4fa2c0da141','firstName','user.attribute'),('3fee7745-ec09-4c2c-b037-a4fa2c0da141','true','userinfo.token.claim'),('422c948d-1141-4b39-914a-127d9558e466','true','access.token.claim'),('422c948d-1141-4b39-914a-127d9558e466','true','id.token.claim'),('45ad5a96-c5f4-4552-b6ce-5d76f1ba9312','true','access.token.claim'),('45ad5a96-c5f4-4552-b6ce-5d76f1ba9312','true','id.token.claim'),('4881f6e8-c29a-4ca9-88d0-dea089a1d59f','true','access.token.claim'),('4881f6e8-c29a-4ca9-88d0-dea089a1d59f','given_name','claim.name'),('4881f6e8-c29a-4ca9-88d0-dea089a1d59f','true','id.token.claim'),('4881f6e8-c29a-4ca9-88d0-dea089a1d59f','String','jsonType.label'),('4881f6e8-c29a-4ca9-88d0-dea089a1d59f','firstName','user.attribute'),('4881f6e8-c29a-4ca9-88d0-dea089a1d59f','true','userinfo.token.claim'),('4c2f5c0c-4e20-467a-bf28-b3700ce3a772','true','access.token.claim'),('4c2f5c0c-4e20-467a-bf28-b3700ce3a772','true','id.token.claim'),('4c44386f-cec1-41a2-ab2e-99c4b08c662e','true','access.token.claim'),('4c44386f-cec1-41a2-ab2e-99c4b08c662e','email','claim.name'),('4c44386f-cec1-41a2-ab2e-99c4b08c662e','true','id.token.claim'),('4c44386f-cec1-41a2-ab2e-99c4b08c662e','String','jsonType.label'),('4c44386f-cec1-41a2-ab2e-99c4b08c662e','email','user.attribute'),('4c44386f-cec1-41a2-ab2e-99c4b08c662e','true','userinfo.token.claim'),('4d6e794c-4f3f-4480-82f0-9b76580fc772','true','access.token.claim'),('4d6e794c-4f3f-4480-82f0-9b76580fc772','given_name','claim.name'),('4d6e794c-4f3f-4480-82f0-9b76580fc772','true','id.token.claim'),('4d6e794c-4f3f-4480-82f0-9b76580fc772','String','jsonType.label'),('4d6e794c-4f3f-4480-82f0-9b76580fc772','firstName','user.attribute'),('4d6e794c-4f3f-4480-82f0-9b76580fc772','true','userinfo.token.claim'),('6648e42f-0f02-4e69-9ddb-1f33e868b27c','true','access.token.claim'),('6648e42f-0f02-4e69-9ddb-1f33e868b27c','true','id.token.claim'),('69442ec1-5650-4541-94af-f40efea01e19','true','access.token.claim'),('69442ec1-5650-4541-94af-f40efea01e19','true','id.token.claim'),('69b72987-0f44-4cd6-918e-15ae5fa125e9','true','access.token.claim'),('69b72987-0f44-4cd6-918e-15ae5fa125e9','true','id.token.claim'),('6a5922cb-1716-4dd9-8314-ea5efc958801','Role','attribute.name'),('6a5922cb-1716-4dd9-8314-ea5efc958801','Basic','attribute.nameformat'),('6a5922cb-1716-4dd9-8314-ea5efc958801','false','single'),('70e6cc6f-692d-4258-af44-676fbb53e7ac','Role','attribute.name'),('70e6cc6f-692d-4258-af44-676fbb53e7ac','Basic','attribute.nameformat'),('70e6cc6f-692d-4258-af44-676fbb53e7ac','false','single'),('7e178d0a-2871-4f51-824d-7444d016c1d3','true','access.token.claim'),('7e178d0a-2871-4f51-824d-7444d016c1d3','true','id.token.claim'),('7ff6157f-76e7-47ba-8a27-dcf08d64c6e4','Role','attribute.name'),('7ff6157f-76e7-47ba-8a27-dcf08d64c6e4','Basic','attribute.nameformat'),('7ff6157f-76e7-47ba-8a27-dcf08d64c6e4','false','single'),('84132b9b-a3b5-4c4b-8822-ec409d478c20','true','access.token.claim'),('84132b9b-a3b5-4c4b-8822-ec409d478c20','preferred_username','claim.name'),('84132b9b-a3b5-4c4b-8822-ec409d478c20','true','id.token.claim'),('84132b9b-a3b5-4c4b-8822-ec409d478c20','String','jsonType.label'),('84132b9b-a3b5-4c4b-8822-ec409d478c20','username','user.attribute'),('84132b9b-a3b5-4c4b-8822-ec409d478c20','true','userinfo.token.claim'),('8526a1cc-ebd4-434c-9ecb-b7f58b79f93f','Role','attribute.name'),('8526a1cc-ebd4-434c-9ecb-b7f58b79f93f','Basic','attribute.nameformat'),('8526a1cc-ebd4-434c-9ecb-b7f58b79f93f','false','single'),('8a19b96b-97fb-48ba-b815-39e67a6f368e','true','access.token.claim'),('8a19b96b-97fb-48ba-b815-39e67a6f368e','preferred_username','claim.name'),('8a19b96b-97fb-48ba-b815-39e67a6f368e','true','id.token.claim'),('8a19b96b-97fb-48ba-b815-39e67a6f368e','String','jsonType.label'),('8a19b96b-97fb-48ba-b815-39e67a6f368e','username','user.attribute'),('8a19b96b-97fb-48ba-b815-39e67a6f368e','true','userinfo.token.claim'),('8b037a65-51eb-4c38-82be-e85990c1ac6d','Role','attribute.name'),('8b037a65-51eb-4c38-82be-e85990c1ac6d','Basic','attribute.nameformat'),('8b037a65-51eb-4c38-82be-e85990c1ac6d','false','single'),('8e30ea92-be0c-4565-bb79-a91d9b8f037a','true','access.token.claim'),('8e30ea92-be0c-4565-bb79-a91d9b8f037a','given_name','claim.name'),('8e30ea92-be0c-4565-bb79-a91d9b8f037a','true','id.token.claim'),('8e30ea92-be0c-4565-bb79-a91d9b8f037a','String','jsonType.label'),('8e30ea92-be0c-4565-bb79-a91d9b8f037a','firstName','user.attribute'),('8e30ea92-be0c-4565-bb79-a91d9b8f037a','true','userinfo.token.claim'),('8f1dbb9f-7a05-4f5d-9b99-78a4193ccaef','true','access.token.claim'),('8f1dbb9f-7a05-4f5d-9b99-78a4193ccaef','family_name','claim.name'),('8f1dbb9f-7a05-4f5d-9b99-78a4193ccaef','true','id.token.claim'),('8f1dbb9f-7a05-4f5d-9b99-78a4193ccaef','String','jsonType.label'),('8f1dbb9f-7a05-4f5d-9b99-78a4193ccaef','lastName','user.attribute'),('8f1dbb9f-7a05-4f5d-9b99-78a4193ccaef','true','userinfo.token.claim'),('918a7600-1c72-419e-be40-401325dc2183','true','access.token.claim'),('918a7600-1c72-419e-be40-401325dc2183','true','id.token.claim'),('9ee23000-36ef-4d30-8816-3f1718af28c3','true','access.token.claim'),('9ee23000-36ef-4d30-8816-3f1718af28c3','preferred_username','claim.name'),('9ee23000-36ef-4d30-8816-3f1718af28c3','true','id.token.claim'),('9ee23000-36ef-4d30-8816-3f1718af28c3','String','jsonType.label'),('9ee23000-36ef-4d30-8816-3f1718af28c3','username','user.attribute'),('9ee23000-36ef-4d30-8816-3f1718af28c3','true','userinfo.token.claim'),('a2dbce4d-d960-4d6a-9845-60b36ec69f33','true','access.token.claim'),('a2dbce4d-d960-4d6a-9845-60b36ec69f33','given_name','claim.name'),('a2dbce4d-d960-4d6a-9845-60b36ec69f33','true','id.token.claim'),('a2dbce4d-d960-4d6a-9845-60b36ec69f33','String','jsonType.label'),('a2dbce4d-d960-4d6a-9845-60b36ec69f33','firstName','user.attribute'),('a2dbce4d-d960-4d6a-9845-60b36ec69f33','true','userinfo.token.claim'),('a33c06e7-ee2b-429b-a212-7d3f873fad42','true','access.token.claim'),('a33c06e7-ee2b-429b-a212-7d3f873fad42','locale','claim.name'),('a33c06e7-ee2b-429b-a212-7d3f873fad42','true','id.token.claim'),('a33c06e7-ee2b-429b-a212-7d3f873fad42','String','jsonType.label'),('a33c06e7-ee2b-429b-a212-7d3f873fad42','locale','user.attribute'),('a33c06e7-ee2b-429b-a212-7d3f873fad42','true','userinfo.token.claim'),('a7881636-965d-4115-96d7-9a9eb22dac77','true','access.token.claim'),('a7881636-965d-4115-96d7-9a9eb22dac77','true','id.token.claim'),('a8dd24ac-f949-4376-a018-eecc25053cc1','true','access.token.claim'),('a8dd24ac-f949-4376-a018-eecc25053cc1','preferred_username','claim.name'),('a8dd24ac-f949-4376-a018-eecc25053cc1','true','id.token.claim'),('a8dd24ac-f949-4376-a018-eecc25053cc1','String','jsonType.label'),('a8dd24ac-f949-4376-a018-eecc25053cc1','username','user.attribute'),('a8dd24ac-f949-4376-a018-eecc25053cc1','true','userinfo.token.claim'),('acc4cc4c-e47e-4046-ac1c-9ee2a0bb26f4','true','access.token.claim'),('acc4cc4c-e47e-4046-ac1c-9ee2a0bb26f4','given_name','claim.name'),('acc4cc4c-e47e-4046-ac1c-9ee2a0bb26f4','true','id.token.claim'),('acc4cc4c-e47e-4046-ac1c-9ee2a0bb26f4','String','jsonType.label'),('acc4cc4c-e47e-4046-ac1c-9ee2a0bb26f4','firstName','user.attribute'),('acc4cc4c-e47e-4046-ac1c-9ee2a0bb26f4','true','userinfo.token.claim'),('ad2d511d-8f5f-4dbf-8a13-3c6557691291','true','access.token.claim'),('ad2d511d-8f5f-4dbf-8a13-3c6557691291','true','id.token.claim'),('af39c286-0f1e-4bef-bc3e-e6bed9857b7c','Role','attribute.name'),('af39c286-0f1e-4bef-bc3e-e6bed9857b7c','Basic','attribute.nameformat'),('af39c286-0f1e-4bef-bc3e-e6bed9857b7c','false','single'),('b8924b54-5bda-4d09-a8e0-7abc709362e9','Role','attribute.name'),('b8924b54-5bda-4d09-a8e0-7abc709362e9','Basic','attribute.nameformat'),('b8924b54-5bda-4d09-a8e0-7abc709362e9','false','single'),('b91f4af3-ad1a-4761-95ca-4c15211e7771','true','access.token.claim'),('b91f4af3-ad1a-4761-95ca-4c15211e7771','email','claim.name'),('b91f4af3-ad1a-4761-95ca-4c15211e7771','true','id.token.claim'),('b91f4af3-ad1a-4761-95ca-4c15211e7771','String','jsonType.label'),('b91f4af3-ad1a-4761-95ca-4c15211e7771','email','user.attribute'),('b91f4af3-ad1a-4761-95ca-4c15211e7771','true','userinfo.token.claim'),('b9bc97bc-5743-4b9a-bc37-bf783aa48547','true','access.token.claim'),('b9bc97bc-5743-4b9a-bc37-bf783aa48547','email','claim.name'),('b9bc97bc-5743-4b9a-bc37-bf783aa48547','true','id.token.claim'),('b9bc97bc-5743-4b9a-bc37-bf783aa48547','String','jsonType.label'),('b9bc97bc-5743-4b9a-bc37-bf783aa48547','email','user.attribute'),('b9bc97bc-5743-4b9a-bc37-bf783aa48547','true','userinfo.token.claim'),('c0155392-3f65-47d8-9160-522b4008df74','true','access.token.claim'),('c0155392-3f65-47d8-9160-522b4008df74','email','claim.name'),('c0155392-3f65-47d8-9160-522b4008df74','true','id.token.claim'),('c0155392-3f65-47d8-9160-522b4008df74','String','jsonType.label'),('c0155392-3f65-47d8-9160-522b4008df74','email','user.attribute'),('c0155392-3f65-47d8-9160-522b4008df74','true','userinfo.token.claim'),('c4cbe3fe-b155-49b8-b314-b7f11a1485c4','true','access.token.claim'),('c4cbe3fe-b155-49b8-b314-b7f11a1485c4','family_name','claim.name'),('c4cbe3fe-b155-49b8-b314-b7f11a1485c4','true','id.token.claim'),('c4cbe3fe-b155-49b8-b314-b7f11a1485c4','String','jsonType.label'),('c4cbe3fe-b155-49b8-b314-b7f11a1485c4','lastName','user.attribute'),('c4cbe3fe-b155-49b8-b314-b7f11a1485c4','true','userinfo.token.claim'),('ca6e1829-4512-4c5c-ae1d-9a79e36b856d','true','access.token.claim'),('ca6e1829-4512-4c5c-ae1d-9a79e36b856d','email','claim.name'),('ca6e1829-4512-4c5c-ae1d-9a79e36b856d','true','id.token.claim'),('ca6e1829-4512-4c5c-ae1d-9a79e36b856d','String','jsonType.label'),('ca6e1829-4512-4c5c-ae1d-9a79e36b856d','email','user.attribute'),('ca6e1829-4512-4c5c-ae1d-9a79e36b856d','true','userinfo.token.claim'),('cac32b38-5d01-4723-b5de-42e61766c065','Role','attribute.name'),('cac32b38-5d01-4723-b5de-42e61766c065','Basic','attribute.nameformat'),('cac32b38-5d01-4723-b5de-42e61766c065','false','single'),('cefdfe69-6ef0-4338-8ab7-04613da38c85','true','access.token.claim'),('cefdfe69-6ef0-4338-8ab7-04613da38c85','email','claim.name'),('cefdfe69-6ef0-4338-8ab7-04613da38c85','true','id.token.claim'),('cefdfe69-6ef0-4338-8ab7-04613da38c85','String','jsonType.label'),('cefdfe69-6ef0-4338-8ab7-04613da38c85','email','user.attribute'),('cefdfe69-6ef0-4338-8ab7-04613da38c85','true','userinfo.token.claim'),('d320e914-2d6b-46a3-bacc-f1cf42594d57','true','access.token.claim'),('d320e914-2d6b-46a3-bacc-f1cf42594d57','family_name','claim.name'),('d320e914-2d6b-46a3-bacc-f1cf42594d57','true','id.token.claim'),('d320e914-2d6b-46a3-bacc-f1cf42594d57','String','jsonType.label'),('d320e914-2d6b-46a3-bacc-f1cf42594d57','lastName','user.attribute'),('d320e914-2d6b-46a3-bacc-f1cf42594d57','true','userinfo.token.claim'),('d9c40b4e-85a2-4abb-8405-9dfa979cefde','true','access.token.claim'),('d9c40b4e-85a2-4abb-8405-9dfa979cefde','true','id.token.claim'),('d9e6bbe4-3c90-47e5-8fea-534a9cab076c','true','access.token.claim'),('d9e6bbe4-3c90-47e5-8fea-534a9cab076c','family_name','claim.name'),('d9e6bbe4-3c90-47e5-8fea-534a9cab076c','true','id.token.claim'),('d9e6bbe4-3c90-47e5-8fea-534a9cab076c','String','jsonType.label'),('d9e6bbe4-3c90-47e5-8fea-534a9cab076c','lastName','user.attribute'),('d9e6bbe4-3c90-47e5-8fea-534a9cab076c','true','userinfo.token.claim'),('db2498fa-1878-45c3-bc86-2973232fc881','true','access.token.claim'),('db2498fa-1878-45c3-bc86-2973232fc881','locale','claim.name'),('db2498fa-1878-45c3-bc86-2973232fc881','true','id.token.claim'),('db2498fa-1878-45c3-bc86-2973232fc881','String','jsonType.label'),('db2498fa-1878-45c3-bc86-2973232fc881','locale','user.attribute'),('db2498fa-1878-45c3-bc86-2973232fc881','true','userinfo.token.claim'),('dd8f02e6-15f1-423b-bd8b-1622ebf31215','Role','attribute.name'),('dd8f02e6-15f1-423b-bd8b-1622ebf31215','Basic','attribute.nameformat'),('dd8f02e6-15f1-423b-bd8b-1622ebf31215','false','single'),('de7ad342-aba3-45a0-b8c1-102d489c49a4','true','access.token.claim'),('de7ad342-aba3-45a0-b8c1-102d489c49a4','family_name','claim.name'),('de7ad342-aba3-45a0-b8c1-102d489c49a4','true','id.token.claim'),('de7ad342-aba3-45a0-b8c1-102d489c49a4','String','jsonType.label'),('de7ad342-aba3-45a0-b8c1-102d489c49a4','lastName','user.attribute'),('de7ad342-aba3-45a0-b8c1-102d489c49a4','true','userinfo.token.claim'),('e8d3651f-9910-477e-bf92-ec90dbcb3303','true','access.token.claim'),('e8d3651f-9910-477e-bf92-ec90dbcb3303','email','claim.name'),('e8d3651f-9910-477e-bf92-ec90dbcb3303','true','id.token.claim'),('e8d3651f-9910-477e-bf92-ec90dbcb3303','String','jsonType.label'),('e8d3651f-9910-477e-bf92-ec90dbcb3303','email','user.attribute'),('e8d3651f-9910-477e-bf92-ec90dbcb3303','true','userinfo.token.claim'),('e98b6d7e-51f6-4922-a5c7-4c33003ab730','true','access.token.claim'),('e98b6d7e-51f6-4922-a5c7-4c33003ab730','given_name','claim.name'),('e98b6d7e-51f6-4922-a5c7-4c33003ab730','true','id.token.claim'),('e98b6d7e-51f6-4922-a5c7-4c33003ab730','String','jsonType.label'),('e98b6d7e-51f6-4922-a5c7-4c33003ab730','firstName','user.attribute'),('e98b6d7e-51f6-4922-a5c7-4c33003ab730','true','userinfo.token.claim'),('f2954b94-216f-4255-b600-b368235c32bb','true','access.token.claim'),('f2954b94-216f-4255-b600-b368235c32bb','email','claim.name'),('f2954b94-216f-4255-b600-b368235c32bb','true','id.token.claim'),('f2954b94-216f-4255-b600-b368235c32bb','String','jsonType.label'),('f2954b94-216f-4255-b600-b368235c32bb','email','user.attribute'),('f2954b94-216f-4255-b600-b368235c32bb','true','userinfo.token.claim'),('faec66b1-ce6d-4c88-83a6-c2e0f4f539ae','true','access.token.claim'),('faec66b1-ce6d-4c88-83a6-c2e0f4f539ae','given_name','claim.name'),('faec66b1-ce6d-4c88-83a6-c2e0f4f539ae','true','id.token.claim'),('faec66b1-ce6d-4c88-83a6-c2e0f4f539ae','String','jsonType.label'),('faec66b1-ce6d-4c88-83a6-c2e0f4f539ae','firstName','user.attribute'),('faec66b1-ce6d-4c88-83a6-c2e0f4f539ae','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PASSWORD_POLICY` varchar(2550) DEFAULT NULL,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int(11) DEFAULT '0',
  `OTP_POLICY_WINDOW` int(11) DEFAULT '1',
  `OTP_POLICY_PERIOD` int(11) DEFAULT '30',
  `OTP_POLICY_DIGITS` int(11) DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `FK_TRAF444KK6QRKMS7N56AIWQ5Y` (`MASTER_ADMIN_CLIENT`),
  CONSTRAINT `FK_TRAF444KK6QRKMS7N56AIWQ5Y` FOREIGN KEY (`MASTER_ADMIN_CLIENT`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('master',60,300,60,NULL,NULL,NULL,'','\0',0,NULL,'master',0,'hashIterations(20000)','\0','\0','\0','\0','EXTERNAL',1800,36000,'\0','\0','1477fe3c-84cc-4391-b301-657e96341eac',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','d3806bb4-9335-4ffb-a91d-72ce876b45bb','10c79319-5cfe-4a19-9abc-7cf4b24a4f83','21372e19-83d1-4f7d-befa-02bfdb86405f','99b92906-c2b0-4165-8c3c-2ac8e912e4ac','bf08c66d-70f5-4b3b-82a9-6fc39d99819d',2592000,'\0',900,'','\0'),('SciexCloud',60,300,300,NULL,NULL,NULL,'','\0',0,NULL,'SciexCloud',0,'hashIterations and upperCase and lowerCase and length and digits and passwordHistory(5) and hashAlgorithm','\0','\0','\0','\0','EXTERNAL',1800,36000,'\0','\0','ed91dee2-3a98-430d-89bc-4f315307a392',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','9665021d-8f08-4f52-999f-32d81d99288a','fcc548e6-0585-45e2-84ab-9fcc35cabc30','9aaeb6c0-571e-4390-a806-85f63c388c7e','d77a6150-1a74-4a15-9eef-d7ba25923514','5cf12eff-5f91-4fff-b72e-348dee4a2a6e',2592000,'\0',900,'','\0');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `FK_8SHXD6L3E9ATQUKACXGPFFPTW` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('bruteForceProtected','false','master'),('bruteForceProtected','true','SciexCloud'),('displayName','rh-sso','master'),('displayNameHtml','<strong>Red Hat</strong><sup>Â®</sup> Single Sign On','master'),('failureFactor','30','master'),('failureFactor','7','SciexCloud'),('maxDeltaTimeSeconds','43200','master'),('maxDeltaTimeSeconds','3600','SciexCloud'),('maxFailureWaitSeconds','900','master'),('maxFailureWaitSeconds','900','SciexCloud'),('minimumQuickLoginWaitSeconds','60','master'),('minimumQuickLoginWaitSeconds','60','SciexCloud'),('quickLoginCheckMilliSeconds','1000','master'),('quickLoginCheckMilliSeconds','1000','SciexCloud'),('waitIncrementSeconds','60','master'),('waitIncrementSeconds','900','SciexCloud'),('_browser_header.contentSecurityPolicy','frame-src \'self\'','master'),('_browser_header.contentSecurityPolicy','frame-src \'self\'','SciexCloud'),('_browser_header.xContentTypeOptions','nosniff','master'),('_browser_header.xContentTypeOptions','nosniff','SciexCloud'),('_browser_header.xFrameOptions','SAMEORIGIN','master'),('_browser_header.xFrameOptions','SAMEORIGIN','SciexCloud');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `FK_DEF_GROUPS_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_DEFAULT_ROLES` (
  `REALM_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  UNIQUE KEY `UK_H4WPD7W4HSOOLNI3H0SW7BTJE` (`ROLE_ID`),
  KEY `FK_EVUDB1PPW84OXFAX2DRS03ICC` (`REALM_ID`),
  CONSTRAINT `FK_H4WPD7W4HSOOLNI3H0SW7BTJE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_EVUDB1PPW84OXFAX2DRS03ICC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_ROLES`
--

LOCK TABLES `REALM_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `REALM_DEFAULT_ROLES` VALUES ('master','9213e882-5935-4afb-8a34-179dd44c3396'),('master','ba9e8d04-4628-434a-b8c8-160bdd671774'),('SciexCloud','1eeb498c-e851-4031-9ae7-56a4b2c4434d'),('SciexCloud','e4e63b4c-c471-4110-a6db-3ea11dd506be');
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  KEY `FK_H846O4H0W8EPX5NWEDRF5Y69J` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  KEY `FK_H846O4H0W8EPX5NXEV9F5Y69J` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('master','jboss-logging'),('SciexCloud','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password','','','master'),('password','password','','','SciexCloud');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  KEY `FK_SUPPORTED_LOCALES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  KEY `FK_1BURS8PB4OUJ97H5WUPPAHV9F` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('f92da4a2-83e0-47e2-868b-5d71cd347730','/auth/realms/master/account/*'),('b2167446-c272-4ac8-a63a-6ad73a286c3c','/auth/admin/master/console/*'),('37c2ff0f-144f-486f-ae37-df5ea128c546','/auth/realms/SciexCloud/account/*'),('e109ff77-de62-4914-a584-b92d3d684253','/auth/admin/SciexCloud/console/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_REQ_ACT_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('0336a98d-4e24-4641-9f27-fe825071104c','VERIFY_EMAIL','Verify Email','SciexCloud','','\0','VERIFY_EMAIL'),('09de1a96-1379-431b-8385-29ee8b516928','UPDATE_PASSWORD','Update Password','master','','\0','UPDATE_PASSWORD'),('226a915c-2951-48ed-a01d-779498000115','UPDATE_PASSWORD','Update Password','SciexCloud','','\0','UPDATE_PASSWORD'),('58dda139-159c-4cd4-b050-104fc4e2cfbe','UPDATE_PROFILE','Update Profile','master','','\0','UPDATE_PROFILE'),('62927d79-2cb8-46e2-a3ef-1ca7268c35c7','CONFIGURE_TOTP','Configure OTP','SciexCloud','','\0','CONFIGURE_TOTP'),('9bd63fc3-8650-46eb-b33d-ffd5f3e77900','terms_and_conditions','Terms and Conditions','master','\0','\0','terms_and_conditions'),('ad9f77e3-df72-423d-a10b-61bf7ad84644','UPDATE_PROFILE','Update Profile','SciexCloud','','\0','UPDATE_PROFILE'),('dabdb7c8-48c7-4c9d-b73b-b1183d9772e1','VERIFY_EMAIL','Verify Email','master','','\0','VERIFY_EMAIL'),('ed1f88d9-9404-4941-b4d1-c4ec86682691','CONFIGURE_TOTP','Configure OTP','master','','\0','CONFIGURE_TOTP'),('f2ad4bbf-23f2-4563-a51a-9d5496674fe2','terms_and_conditions','Terms and Conditions','SciexCloud','\0','\0','terms_and_conditions');
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `FK_FRSRPP213XCX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRPS213XCX4WNKOG82SSRFY` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_AU8TT6T700S9V50BU18WS5HA6` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRPO213XCX4WNKOG82SSRFY` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `URI` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(36) NOT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSRFY` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRSO213XCX4WNKOG82SSRFY` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `FK_P3RH9GRKU11KQFRS4FLTT7RNQ` (`ROLE_ID`),
  CONSTRAINT `FK_P3RH9GRKU11KQFRS4FLTT7RNQ` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('7e01eff7-e65f-4cc9-b2a4-4dae501bf1ef','071c955f-a95b-41f7-b162-76f9af18cff1'),('e109ff77-de62-4914-a584-b92d3d684253','071c955f-a95b-41f7-b162-76f9af18cff1'),('77d19141-15d1-418b-b021-4dbc2c313fe0','d94c5820-4281-49b9-9615-eced17528397'),('b2167446-c272-4ac8-a63a-6ad73a286c3c','d94c5820-4281-49b9-9615-eced17528397');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `FK_FRSRASP13XCX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEMPLATE_SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `TEMPLATE_SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TEMPLATE_SCOPE_MAPPING` (
  `TEMPLATE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`TEMPLATE_ID`,`ROLE_ID`),
  KEY `FK_TEMPL_SCOPE_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_TEMPL_SCOPE_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_TEMPL_SCOPE_TEMPL` FOREIGN KEY (`TEMPLATE_ID`) REFERENCES `CLIENT_TEMPLATE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEMPLATE_SCOPE_MAPPING`
--

LOCK TABLES `TEMPLATE_SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `TEMPLATE_SCOPE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `TEMPLATE_SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
  `LAST_FAILURE` bigint(20) DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int(11) DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_PROT_MAPPER`
--

DROP TABLE IF EXISTS `USER_CONSENT_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT_PROT_MAPPER` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`PROTOCOL_MAPPER_ID`),
  KEY `IDX_CONSENT_PROTMAPPER` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_PRM_GR` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_PROT_MAPPER`
--

LOCK TABLES `USER_CONSENT_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_ROLE`
--

DROP TABLE IF EXISTS `USER_CONSENT_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_CONSENT_ROLE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`ROLE_ID`),
  KEY `IDX_CONSENT_ROLE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_ROLE_GR` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_ROLE`
--

LOCK TABLES `USER_CONSENT_ROLE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('1c921a8e-0b16-4696-92ab-2048cc45cab6','brightspark-api@sciex.com','brightspark-api@sciex.com','\0','',NULL,'Bright','Spark','SciexCloud','brightspark',1499715958664,NULL),('9bf91d4d-459a-4dc5-9675-265d9838b344',NULL,'60e0759b-cecb-47ba-bbf8-8f03be7e1377','\0','',NULL,NULL,NULL,'master','admin',1498929261561,NULL),('bf5ac7f9-a518-4b3d-9078-d7f088483f48','brightspark@sciex.com','brightspark@sciex.com','\0','',NULL,'Bright','Spark','SciexCloud','sciexadmin',1499437425000,NULL);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_FEDMAPPERPM_REALM` (`REALM_ID`),
  KEY `FK_FEDMAPPERPM_FEDPRV` (`FEDERATION_PROVIDER_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
  `LAST_SYNC` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_1FJ32F6PTOLW2QY60CD8N01E8` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('1eeb498c-e851-4031-9ae7-56a4b2c4434d','1c921a8e-0b16-4696-92ab-2048cc45cab6'),('37201ab9-5647-40cb-970d-4859fedc1a93','1c921a8e-0b16-4696-92ab-2048cc45cab6'),('7cfa0201-12a3-4097-9cbd-43e87677cad3','1c921a8e-0b16-4696-92ab-2048cc45cab6'),('e4e63b4c-c471-4110-a6db-3ea11dd506be','1c921a8e-0b16-4696-92ab-2048cc45cab6'),('23571462-0d2a-492f-bd55-95a0ba379abc','9bf91d4d-459a-4dc5-9675-265d9838b344'),('9213e882-5935-4afb-8a34-179dd44c3396','9bf91d4d-459a-4dc5-9675-265d9838b344'),('9ca0be12-6437-4c78-92b2-b03cd56e171d','9bf91d4d-459a-4dc5-9675-265d9838b344'),('ba9e8d04-4628-434a-b8c8-160bdd671774','9bf91d4d-459a-4dc5-9675-265d9838b344'),('d94c5820-4281-49b9-9615-eced17528397','9bf91d4d-459a-4dc5-9675-265d9838b344'),('071c955f-a95b-41f7-b162-76f9af18cff1','bf5ac7f9-a518-4b3d-9078-d7f088483f48'),('1eeb498c-e851-4031-9ae7-56a4b2c4434d','bf5ac7f9-a518-4b3d-9078-d7f088483f48'),('37201ab9-5647-40cb-970d-4859fedc1a93','bf5ac7f9-a518-4b3d-9078-d7f088483f48'),('7cfa0201-12a3-4097-9cbd-43e87677cad3','bf5ac7f9-a518-4b3d-9078-d7f088483f48'),('e4e63b4c-c471-4110-a6db-3ea11dd506be','bf5ac7f9-a518-4b3d-9078-d7f088483f48');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int(11) DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  KEY `FK_LOJPHO213XCX4WNKOG82SSRFY` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-11 11:09:22
