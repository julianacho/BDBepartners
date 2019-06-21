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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='		';

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='	';

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para procedimiento bepartners.pa_create_product
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_create_product`(
	IN V_Name  varchar(80), IN V_Id_Product_Type  varchar(80) , IN V_ProductCode  varchar(80), IN V_Description  varchar(80))
BEGIN
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SELECT 0 AS RESULTADO FROM DUAL;
 INSERT INTO `bepartners`.`bo_product` (`Name`, `Id_Product_Type`, `ProductCode`, `Description`, `Enable`, `Create_Date`, `Last_Modify`) 
	 VALUES (V_Name , V_Id_Product_Type , V_ProductCode, V_Description, b'0', CURDATE(), CURDATE());
  SELECT 1 AS RESULTADO FROM DUAL;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bepartners.SP_UpSert_Third
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UpSert_Third`(
   IN v_Id_Third_Public varchar(80), IN V_Id_Type  varchar(80) , IN V_Identification_Number  varchar(80), IN V_Business_Name  varchar(80), IN V_Enable  varchar(1) )
BEGIN
IF V_Id_Third_Public = '' THEN
		INSERT INTO `bepartners`.`mp_third` 
		(`Id_Third_Public`
		, `Id_Type`
		, `Identification_Number`
		, `Business_Name`
		, `Enable`
		, `Create_Date`
		, `Last_Modify`) 
		VALUES (UUID(), V_Id_Type, V_Identification_Number, V_Business_Name, V_Enable, CURDATE(), CURDATE());
ELSE
		UPDATE `bepartners`.`mp_third` 
		SET `Business_Name`=V_Business_Name, `Enable`=V_Enable, `Last_Modify`=CURDATE()  WHERE  `Id_Third_Public`=v_Id_Third_Public;
END IF;
		COMMIT;
		SELECT * FROM `bepartners`.`mp_third` WHERE  Identification_Number=V_Identification_Number AND Id_Type=V_Id_Type;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bepartners.SP_UpSert_Third_Basic_Info
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UpSert_Third_Basic_Info`(
	 IN V_Id_Third_Public  varchar(80) , IN V_Id_Info_Type_Third  varchar(80),  IN V_Value  varchar(80),IN V_Enable  varchar(1) )
BEGIN

DECLARE V_Id_Third_Infio INT;


SELECT inf.Id_Third_Info INTO V_Id_Third_Infio
FROM mp_third_info inf
JOIN mp_third thr ON thr.Id_Third=inf.Id_Third
WHERE thr.Id_Third_Public=V_Id_Third_Public
AND inf.Id_Info_Type_Third=V_Id_Info_Type_Third;

IF V_Id_Third_Infio > 0 THEN
	UPDATE `bepartners`.`mp_third_info` 
	SET `Value`=V_Value, `Enable`=V_Enable, `Last_Modify`=CURDATE()
	WHERE  `Id_Third_Info`=V_Id_Third_Infio AND `Id_Info_Type_Third`=V_Id_Info_Type_Third;		
ELSE	
	INSERT INTO `bepartners`.`mp_third_info` (`Id_Third`, `Id_Info_Type_Third`, `Value`, `Enable`, `Create_Date`, `Last_Modify`) 
	VALUES ((SELECT th.Id_Third FROM mp_third th WHERE th.Id_Third_Public=V_Id_Third_Public), V_Id_Info_Type_Third, V_Value, V_Enable, CURDATE(), CURDATE());		
END IF;

SELECT inf.*
FROM mp_third_info inf 
JOIN mp_third thr ON thr.Id_Third=inf.Id_Third
WHERE thr.Id_Third_Public=V_Id_Third_Public AND inf.Id_Info_Type_Third=V_Id_Info_Type_Third;
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento bepartners.SP_UpSert_User
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UpSert_User`(
	IN V_Id_User_Public  varchar(80) , IN V_Id_Type  varchar(80) , IN V_Identification_Number  varchar(80), IN V_Name  varchar(80), IN V_Last_Name  varchar(80) , IN V_Email  varchar(80), IN V_Phone  varchar(80), IN V_Profile_Picture  varchar(80),IN V_Enable  varchar(1) )
BEGIN

IF V_Id_User_Public = '' THEN
		INSERT INTO `bepartners`.`mp_user` (`Id_User_Public`, `Id_Type`, `Identification_Number`, `Name`, `Last_Name`, `Email`, `Phone`, `Profile_Picture`, `Enable`, `Create_Date`, `Last_Date`) 
		VALUES (UUID()
		, V_Id_Type, 
		V_Identification_Number, 
		V_Name, 
		V_Last_Name, 
		V_Email, 
		V_Phone, 
		V_Profile_Picture, 
		V_Enable, 
		CURDATE(), 
		CURDATE());
ELSE
		UPDATE `bepartners`.`mp_user` 
		SET `Last_Name`=V_Last_Name,
		`Email`=V_Email,
		`Phone`=V_Phone,
		`Profile_Picture`=V_Profile_Picture,
		 `Enable`=V_Enable, 
		 `Last_Date`=CURDATE()  
		 WHERE  `Id_User_Public`=V_Id_User_Public;
END IF;
COMMIT;
SELECT * FROM bepartners.mp_user WHERE Id_Type=V_Id_Type AND Identification_Number=V_Identification_Number;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bepartners.SP_UpSert_User_Info
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UpSert_User_Info`(
	 IN V_Id_User_Public  varchar(80) , IN V_Id_Info_Type_User  varchar(80),  IN V_Value  varchar(80), IN V_Enable  varchar(1) )
BEGIN

DECLARE V_Id_Use_Infio INT;

SELECT inf.Id_Use_Info INTO V_Id_Use_Infio
FROM mp_user_info inf 
JOIN mp_user us ON us.Id_User=inf.Id_User
WHERE us.Id_User_Public=V_Id_User_Public
AND inf.Id_Info_Type_User=V_Id_Info_Type_User;

IF V_Id_Use_Infio > 0 THEN
	UPDATE `bepartners`.`mp_user_info` 
	SET `Value`=V_Value, `Enable`=V_Enable, `Last_Modify`=CURDATE()
	WHERE  `Id_Use_Info`=V_Id_Use_Infio AND `Id_Info_Type_User`=V_Id_Info_Type_User;	
ELSE
	INSERT INTO `bepartners`.`mp_user_info` (`Id_User`, `Id_Info_Type_User`, `Value`, `Enable`, `Create_Date`, `Last_Modify`) 
	VALUES ((SELECT us.id_User FROM mp_user us  WHERE us.Id_User_Public=V_Id_User_Public), V_Id_Info_Type_User, V_Value, V_Enable, CURDATE(), CURDATE());
END IF;

COMMIT;

SELECT inf.*
FROM mp_user_info inf 
JOIN mp_user us ON us.Id_User=inf.Id_User
WHERE us.Id_User_Public=V_Id_User_Public
AND inf.Id_Info_Type_User=V_Id_Info_Type_User;

END//
DELIMITER ;

-- Volcando estructura para procedimiento bepartners.SP_UpSert_User_third
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UpSert_User_third`(
	 IN V_Id_User_Public  varchar(80) , IN V_Id_Third_Public  varchar(80), IN V_Enable  char(1) )
BEGIN

DECLARE V_Id_User_Third INT;
		SELECT ust.Id_User_Third INTO V_Id_User_Third
		FROM mp_user_third  ust
		JOIN mp_user us ON ust.Id_User=us.Id_User
		JOIN mp_third th ON ust.Id_Third=th.Id_Third
		WHERE us.Id_User_Public=V_Id_User_Public
		AND th.Id_Third_Public=V_Id_Third_Public;
		
IF V_Id_User_Third > 0 THEN
   UPDATE `bepartners`.`mp_user_third` 
	SET  `Enable`=V_Enable, `Last_Modify`=CURDATE()
	WHERE  `Id_User_Third`=V_Id_User_Third;

ELSE

	INSERT INTO `bepartners`.`mp_user_third` (`Id_User`, `Id_Third`, `Enable`, `Create_Date`, `Last_Modify`) 
	VALUES (
	(SELECT us.id_User FROM mp_user us  WHERE us.Id_User_Public=V_Id_User_Public), 
	(SELECT th.Id_Third FROM mp_third th WHERE th.Id_Third_Public=V_Id_Third_Public), b'0', CURDATE(), CURDATE());


	INSERT INTO `bepartners`.`mp_user_third_terms` (`Id_User_Third`, `Id_Terms`, `Enable`, `Create_Date`, `Last_Modify`) 
	VALUES (
	(

	SELECT usr_th.Id_User_Third FROM bepartners.mp_user_third usr_th 
	JOIN mp_user us1 ON usr_th.Id_User=us1.id_User AND us1.Id_User_Public=V_Id_User_Public
	JOIN mp_third th1 ON usr_th.Id_Third = th1.Id_Third AND  th1.Id_Third_Public=V_Id_Third_Public

	)
	, 
	(SELECT tr.Id_terms FROM bo_terms tr WHERE tr.Enable=b'0')
	, V_Enable, CURDATE(), CURDATE());

END IF;

	SELECT ust.Id_User_Third FROM mp_user_third  ust
	JOIN mp_user us ON ust.Id_User=us.Id_User
	JOIN mp_third th ON ust.Id_Third=th.Id_Third
	WHERE us.Id_User_Public=V_Id_User_Public
	AND th.Id_Third_Public=V_Id_Third_Public;


END//
DELIMITER ;

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
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

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
