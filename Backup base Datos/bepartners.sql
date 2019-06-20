-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.17-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para bepartners
CREATE DATABASE IF NOT EXISTS `bepartners` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bepartners`;

-- Volcando estructura para tabla bepartners.bo_pc_plan
CREATE TABLE IF NOT EXISTS `bo_pc_plan` (
  `Id_Plan` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Product` int(11) NOT NULL,
  `SAP_Product_Code` varchar(45) NOT NULL,
  `Transaction_Code_RCT` varchar(45) NOT NULL,
  `Price` double NOT NULL,
  `Vigency_Days` int(11) NOT NULL,
  `Enable` int(11) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL,
  PRIMARY KEY (`Id_Plan`),
  KEY `fk_BO_Planes_BO_Product1_idx` (`Id_Product`),
  CONSTRAINT `fk_BO_Planes_BO_Product1` FOREIGN KEY (`Id_Product`) REFERENCES `bo_product` (`Id_Product`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartners.bo_product
CREATE TABLE IF NOT EXISTS `bo_product` (
  `Id_Product` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(128) NOT NULL,
  `Id_Product_Type` varchar(6) NOT NULL,
  `ProductCode` varchar(10) NOT NULL,
  `Description` varchar(1024) NOT NULL,
  `Enable` int(11) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL,
  PRIMARY KEY (`Id_Product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartners.bo_product_info
CREATE TABLE IF NOT EXISTS `bo_product_info` (
  `Id_Product_Info` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Product` int(11) NOT NULL,
  `Id_Info_Type_Product` varchar(6) NOT NULL,
  `Value` varchar(256) NOT NULL,
  `Enable` int(11) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL,
  PRIMARY KEY (`Id_Product_Info`),
  KEY `fk_BO_Product_Info_BO_Product1_idx` (`Id_Product`),
  CONSTRAINT `fk_BO_Product_Info_BO_Product1` FOREIGN KEY (`Id_Product`) REFERENCES `bo_product` (`Id_Product`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartners.bo_terms
CREATE TABLE IF NOT EXISTS `bo_terms` (
  `Id_Terms` int(11) NOT NULL AUTO_INCREMENT,
  `Url` varchar(1024) NOT NULL,
  `Version` int(11) NOT NULL,
  `Enable` int(11) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_modify` date NOT NULL,
  PRIMARY KEY (`Id_Terms`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartners.mp_pc_transaction
CREATE TABLE IF NOT EXISTS `mp_pc_transaction` (
  `Id_Transaction` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Transaction_Public` varchar(8) NOT NULL,
  `Id_Third_Plan` int(11) NOT NULL,
  `Id_Query_Transaction_Public` varchar(45) NOT NULL,
  `Is_Succces` bit(1) NOT NULL,
  `SP_Last_Name` varchar(48) NOT NULL,
  `SP_Id_Type` int(11) NOT NULL,
  `SP_Id_Number` varchar(48) NOT NULL,
  `Json_Result` varchar(1024) DEFAULT NULL,
  `Enable` int(11) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL,
  PRIMARY KEY (`Id_Transaction`),
  KEY `fk_MP_Query_Transaction_MP_Third_Product1_idx` (`Id_Third_Plan`),
  CONSTRAINT `fk_MP_Query_Transaction_MP_Third_Product1` FOREIGN KEY (`Id_Third_Plan`) REFERENCES `mp_third_pc_plan` (`Id_Third_Plan`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartners.mp_pc_transaction_info
CREATE TABLE IF NOT EXISTS `mp_pc_transaction_info` (
  `Id_Transaction_Info` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Transaction` int(11) NOT NULL,
  `Id_Info_Type_Product_Tra_PC` varchar(6) NOT NULL,
  `Value` varchar(256) NOT NULL,
  `Enbale` int(11) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL,
  PRIMARY KEY (`Id_Transaction_Info`),
  KEY `fk_MP_Item_transaction_MP_Query_Transaction1_idx` (`Id_Transaction`),
  CONSTRAINT `fk_MP_Item_transaction_MP_Query_Transaction1` FOREIGN KEY (`Id_Transaction`) REFERENCES `mp_pc_transaction` (`Id_Transaction`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartners.mp_rct_pc
CREATE TABLE IF NOT EXISTS `mp_rct_pc` (
  `Id_Rct_Pc` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Transaction` int(11) NOT NULL,
  `Transaction_Name` varchar(10) NOT NULL,
  `Executor_User_Doc_Tip` varchar(1) NOT NULL,
  `Executor_User_Id_number` varchar(20) NOT NULL,
  `Entity_Nit` varchar(20) NOT NULL,
  `Transaccion_Number` varchar(45) NOT NULL,
  `Id_Register` varchar(20) NOT NULL,
  `Calif_Facsopt` varchar(10) NOT NULL,
  `Prod_Padre` varchar(10) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL,
  PRIMARY KEY (`Id_Rct_Pc`),
  KEY `FK_PC_Transaction_RCT_idx` (`Id_Transaction`),
  CONSTRAINT `FK_PC_Transaction_RCT` FOREIGN KEY (`Id_Transaction`) REFERENCES `mp_pc_transaction` (`Id_Transaction`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartners.mp_third
CREATE TABLE IF NOT EXISTS `mp_third` (
  `Id_Third` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Third_Public` varchar(60) NOT NULL,
  `Id_Type` varchar(6) NOT NULL,
  `Identification_Number` varchar(45) NOT NULL,
  `Business_Name` varchar(1024) NOT NULL,
  `Enable` int(11) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL,
  PRIMARY KEY (`Id_Third`),
  UNIQUE KEY `index2` (`Identification_Number`,`Id_Type`),
  KEY `index3` (`Id_Third_Public`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='		';

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartners.mp_third_info
CREATE TABLE IF NOT EXISTS `mp_third_info` (
  `Id_Third_Info` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Third` int(11) NOT NULL,
  `Id_Info_Type_Third` varchar(6) NOT NULL,
  `Value` varchar(256) NOT NULL,
  `Enable` int(11) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL,
  PRIMARY KEY (`Id_Third_Info`),
  KEY `FK_MP_Third_MP_ThirdInf_idx` (`Id_Third`),
  CONSTRAINT `FK_MP_Third_MP_ThirdInf` FOREIGN KEY (`Id_Third`) REFERENCES `mp_third` (`Id_Third`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='	';

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartners.mp_third_pc_plan
CREATE TABLE IF NOT EXISTS `mp_third_pc_plan` (
  `Id_Third_Plan` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Third_Plant_Public` varchar(8) NOT NULL,
  `Id_Plan` int(11) NOT NULL,
  `Id_Third` int(11) NOT NULL,
  `Id_PAYU` varchar(45) NOT NULL,
  `Coupon` varchar(10) NOT NULL,
  `Price` double NOT NULL,
  `Sale_Value` double NOT NULL,
  `Total_Price` double NOT NULL,
  `End_Date` date NOT NULL,
  `Enable` int(11) NOT NULL,
  `Total_Queries` int(11) NOT NULL,
  `Total_Used_Queries` int(11) NOT NULL,
  `Responsable` varchar(128) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL,
  PRIMARY KEY (`Id_Third_Plan`),
  KEY `fk_MP_Third_Product_BO_Plans1_idx` (`Id_Plan`),
  KEY `fk_MP_Third_Product_MP_User_Third1_idx` (`Id_Third`),
  CONSTRAINT `fk_MP_Third_Product_BO_Plans1` FOREIGN KEY (`Id_Plan`) REFERENCES `bo_pc_plan` (`Id_Plan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MP_Third_Product_MP_User_Third1` FOREIGN KEY (`Id_Third`) REFERENCES `mp_third` (`Id_Third`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartners.mp_user
CREATE TABLE IF NOT EXISTS `mp_user` (
  `Id_User` int(11) NOT NULL AUTO_INCREMENT,
  `Id_User_Public` varchar(60) NOT NULL,
  `Id_Type` varchar(6) NOT NULL,
  `Identification_Number` varchar(45) NOT NULL,
  `Name` varchar(48) NOT NULL,
  `Last_Name` varchar(48) NOT NULL,
  `Email` varchar(128) NOT NULL,
  `Phone` varchar(24) NOT NULL,
  `Profile_Picture` varchar(124) NOT NULL,
  `Enable` int(11) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Date` date NOT NULL,
  PRIMARY KEY (`Id_User`),
  UNIQUE KEY `index2` (`Id_Type`,`Identification_Number`),
  KEY `index3` (`Id_User_Public`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartners.mp_user_info
CREATE TABLE IF NOT EXISTS `mp_user_info` (
  `Id_Use_Info` int(11) NOT NULL AUTO_INCREMENT,
  `Id_User` int(11) NOT NULL,
  `Id_Info_Type_User` varchar(6) NOT NULL,
  `Value` varchar(256) NOT NULL,
  `Enable` int(11) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL,
  PRIMARY KEY (`Id_Use_Info`),
  KEY `FK_MP_U_UserInfo_MP_U_User_idx` (`Id_User`),
  CONSTRAINT `FK_MP_U_UserInfo_MP_U_User` FOREIGN KEY (`Id_User`) REFERENCES `mp_user` (`Id_User`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartners.mp_user_third
CREATE TABLE IF NOT EXISTS `mp_user_third` (
  `Id_User_Third` int(11) NOT NULL AUTO_INCREMENT,
  `Id_User` int(11) NOT NULL,
  `Id_Third` int(11) NOT NULL,
  `Enable` int(11) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL,
  PRIMARY KEY (`Id_User_Third`),
  UNIQUE KEY `Const_User_Third` (`Id_User`,`Id_Third`),
  KEY `FK_MP_Third_MP_User_idx` (`Id_User`),
  KEY `FK_MP_Third_MP_User_idx1` (`Id_Third`),
  CONSTRAINT `FK_MP_Third_MP_User` FOREIGN KEY (`Id_Third`) REFERENCES `mp_third` (`Id_Third`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_MP_User_MP_Third` FOREIGN KEY (`Id_User`) REFERENCES `mp_user` (`Id_User`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartners.mp_user_third_terms
CREATE TABLE IF NOT EXISTS `mp_user_third_terms` (
  `Id_User_Third_Terms` int(11) NOT NULL AUTO_INCREMENT,
  `Id_User_Third` int(11) NOT NULL,
  `Id_Terms` int(11) NOT NULL,
  `Enable` int(11) DEFAULT NULL,
  `Create_Date` date DEFAULT NULL,
  `Last_Modify` date DEFAULT NULL,
  PRIMARY KEY (`Id_User_Third_Terms`),
  KEY `fk_MP_USER_THIRD_TERMS_MP_USER_THIRD1_idx` (`Id_User_Third`),
  KEY `fk_MP_USER_THIRD_TERMS_BO_TERMS1_idx` (`Id_Terms`),
  CONSTRAINT `fk_MP_USER_THIRD_TERMS_BO_TERMS1` FOREIGN KEY (`Id_Terms`) REFERENCES `bo_terms` (`Id_Terms`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MP_USER_THIRD_TERMS_MP_USER_THIRD1` FOREIGN KEY (`Id_User_Third`) REFERENCES `mp_user_third` (`Id_User_Third`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartners.u_catalog
CREATE TABLE IF NOT EXISTS `u_catalog` (
  `Id_Catalog` int(11) NOT NULL,
  `CatalogName` varchar(45) NOT NULL,
  `Description` varchar(1024) NOT NULL,
  `Enable` int(11) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL,
  PRIMARY KEY (`Id_Catalog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartners.u_category
CREATE TABLE IF NOT EXISTS `u_category` (
  `Id_Category` int(11) NOT NULL,
  `CategoryName` varchar(45) NOT NULL,
  `Id_Category_Type` varchar(6) NOT NULL,
  `Enable` bit(1) NOT NULL,
  `CreateDate` date NOT NULL,
  `LastModify` date NOT NULL,
  PRIMARY KEY (`Id_Category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartners.u_item_catalog
CREATE TABLE IF NOT EXISTS `u_item_catalog` (
  `Id_Item_Catalog` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Item` varchar(6) NOT NULL,
  `Id_Catalog` int(11) NOT NULL,
  `Item_Name` varchar(1024) NOT NULL,
  `Enable` int(11) NOT NULL,
  `Create_Date` date NOT NULL,
  `Last_Modify` date NOT NULL,
  PRIMARY KEY (`Id_Item_Catalog`),
  KEY `fk_Item_Catalog_U_Catalog_idx` (`Id_Catalog`),
  CONSTRAINT `fk_Item_Catalog_U_Catalog` FOREIGN KEY (`Id_Catalog`) REFERENCES `u_catalog` (`Id_Catalog`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartners.u_tree
CREATE TABLE IF NOT EXISTS `u_tree` (
  `Id_Tree` int(11) NOT NULL AUTO_INCREMENT,
  `TreeName` varchar(45) NOT NULL,
  `Description` varchar(128) DEFAULT NULL,
  `Enable` bit(1) NOT NULL,
  `CreateDate` date NOT NULL,
  `LastModify` date NOT NULL,
  PRIMARY KEY (`Id_Tree`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartners.u_tree_category
CREATE TABLE IF NOT EXISTS `u_tree_category` (
  `Id_Treee_Catetogy` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Tree` int(11) NOT NULL,
  `Id_ParentCategory` int(11) NOT NULL,
  `Id_ChildCategory` int(11) DEFAULT NULL,
  `Enable` bit(1) NOT NULL,
  `CreateDate` date NOT NULL,
  `LastaModify` date NOT NULL,
  PRIMARY KEY (`Id_Treee_Catetogy`),
  KEY `U_TreeCatalog_U_Tree_idx` (`Id_Tree`),
  KEY `U_Tree_ParentCategory_idx` (`Id_ParentCategory`),
  KEY `U_Tree_ChildCategory_idx` (`Id_ChildCategory`),
  CONSTRAINT `U_TreeCatalog_U_Tree` FOREIGN KEY (`Id_Tree`) REFERENCES `u_tree` (`Id_Tree`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `U_Tree_ChildCategory` FOREIGN KEY (`Id_ChildCategory`) REFERENCES `u_category` (`Id_Category`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `U_Tree_ParentCategory` FOREIGN KEY (`Id_ParentCategory`) REFERENCES `u_category` (`Id_Category`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1215 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
