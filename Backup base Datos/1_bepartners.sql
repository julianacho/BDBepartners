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


-- Volcando estructura de base de datos para bepartnerslog
CREATE DATABASE IF NOT EXISTS `bepartnerslog` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bepartnerslog`;

-- Volcando estructura para tabla bepartnerslog.mp_log_transacion_user
CREATE TABLE IF NOT EXISTS `mp_log_transacion_user` (
  `Id_Log_Transaction_User` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Third_Public` varchar(60) DEFAULT NULL,
  `Id_User_Public` varchar(60) DEFAULT NULL,
  `Id_Reason_Type` varchar(6) NOT NULL,
  `Date_Time_Register` datetime NOT NULL,
  `Id_Status` varchar(6) NOT NULL,
  `Id_Log_Transaction_WS` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Log_Transaction_User`),
  KEY `fk_MP_LOG_TRANSACION_USER_MP_LOG_TRANSACTION_WS1_idx` (`Id_Log_Transaction_WS`),
  CONSTRAINT `fk_MP_LOG_TRANSACION_USER_MP_LOG_TRANSACTION_WS1` FOREIGN KEY (`Id_Log_Transaction_WS`) REFERENCES `mp_log_transaction_ws` (`Id_Log_Transaction_WS`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartnerslog.mp_log_transaction_user_info
CREATE TABLE IF NOT EXISTS `mp_log_transaction_user_info` (
  `Id_Log_Transaction_User_Info` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Log_Transaction_User` int(11) NOT NULL,
  `Value` varchar(10000) NOT NULL,
  `Transaction_Type` varchar(6) NOT NULL,
  `Create_Date` date NOT NULL,
  PRIMARY KEY (`Id_Log_Transaction_User_Info`),
  KEY `fk_MP_LOG_TRANSACTION_USER_INFO_MP_LOG_TRANSACION_USER_idx` (`Id_Log_Transaction_User`),
  CONSTRAINT `fk_MP_LOG_TRANSACTION_USER_INFO_MP_LOG_TRANSACION_USER` FOREIGN KEY (`Id_Log_Transaction_User`) REFERENCES `mp_log_transacion_user` (`Id_Log_Transaction_User`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartnerslog.mp_log_transaction_ws
CREATE TABLE IF NOT EXISTS `mp_log_transaction_ws` (
  `Id_Log_Transaction_WS` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Transaction_MP` int(11) NOT NULL,
  `Id_Estatus` varchar(6) NOT NULL,
  `Response` varchar(1024) NOT NULL,
  `Request` varchar(1024) NOT NULL,
  `Info_Type_WS` varchar(6) NOT NULL,
  `Date_Time_Execution` datetime NOT NULL,
  PRIMARY KEY (`Id_Log_Transaction_WS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartnerslog.mp_log_transaction_ws_info
CREATE TABLE IF NOT EXISTS `mp_log_transaction_ws_info` (
  `Id_Log_Transaction_Ws_Info` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Log_Transaction_WS` int(11) NOT NULL,
  `Enable` int(11) NOT NULL,
  `Value` varchar(1028) NOT NULL,
  `Transaction_WS_Type` varchar(6) NOT NULL,
  `Create_Date` date NOT NULL,
  PRIMARY KEY (`Id_Log_Transaction_Ws_Info`),
  KEY `fk_MP_LOG_TRANSACTION_WS_INFO_MP_LOG_TRANSACTION_WS1_idx` (`Id_Log_Transaction_WS`),
  CONSTRAINT `fk_MP_LOG_TRANSACTION_WS_INFO_MP_LOG_TRANSACTION_WS1` FOREIGN KEY (`Id_Log_Transaction_WS`) REFERENCES `mp_log_transaction_ws` (`Id_Log_Transaction_WS`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartnerslog.mp_user_thir_monitor
CREATE TABLE IF NOT EXISTS `mp_user_thir_monitor` (
  `Id_User_Thir_Monitor` int(11) NOT NULL AUTO_INCREMENT,
  `Id_User_Third` int(11) NOT NULL,
  `Id_Reason_Type` varchar(6) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Id_Doc_Type` varchar(6) NOT NULL,
  `IdentificationNumber` varchar(45) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Enable` int(11) NOT NULL,
  `Date_Time_Execution` datetime NOT NULL,
  `Id_Log_Transaction_WS` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_User_Thir_Monitor`),
  KEY `fk_MP_USER_THIR_MONITOR_MP_LOG_TRANSACTION_WS1_idx` (`Id_Log_Transaction_WS`),
  CONSTRAINT `fk_MP_USER_THIR_MONITOR_MP_LOG_TRANSACTION_WS1` FOREIGN KEY (`Id_Log_Transaction_WS`) REFERENCES `mp_log_transaction_ws` (`Id_Log_Transaction_WS`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartnerslog.mp_user_thir_monitor_info
CREATE TABLE IF NOT EXISTS `mp_user_thir_monitor_info` (
  `Id_User_Thir_Monitor_Info` int(11) NOT NULL AUTO_INCREMENT,
  `Id_User_Thir_Monitor` int(11) NOT NULL,
  `Id_User_Thir_Monitor_Info_Type` varchar(6) NOT NULL,
  `Value` varchar(1028) NOT NULL,
  `Enable` int(11) NOT NULL,
  `Create_Date` date NOT NULL,
  PRIMARY KEY (`Id_User_Thir_Monitor_Info`),
  KEY `fk_MP_USER_THIR_MONITOR_INFO_MP_USER_THIR_MONITOR1_idx` (`Id_User_Thir_Monitor`),
  CONSTRAINT `fk_MP_USER_THIR_MONITOR_INFO_MP_USER_THIR_MONITOR1` FOREIGN KEY (`Id_User_Thir_Monitor`) REFERENCES `mp_user_thir_monitor` (`Id_User_Thir_Monitor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para procedimiento bepartnerslog.SP_Insert_User_Log
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Insert_User_Log`(
	 IN v_Id_Third_Public  varchar(80) , IN v_Id_User_Public  varchar(80),  IN V_Id_Razon  varchar(80),IN V_Id_Estatus  varchar(80) )
BEGIN

INSERT INTO `bepartnerslog`.`mp_log_transacion_user` (`Id_Third_Public`, `Id_User_Public`, `Id_Reason_Type`, `Date_Time_Register`, `Id_Status`) 
VALUES (v_Id_Third_Public, v_Id_User_Public, V_Id_Razon, CURDATE(), V_Id_Estatus);

SELECT MAX(Id_Log_transaction_User) as Id_Log_transaction_User  FROM `bepartnerslog`.`mp_log_transacion_user`
WHERE Id_Third_Public=v_Id_Third_Public AND Id_User_Public=v_Id_User_Public;

	
END//
DELIMITER ;

-- Volcando estructura para procedimiento bepartnerslog.SP_Insert_User_Log_Info
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Insert_User_Log_Info`(
	 IN V_Id_Log_Transaction_User  INT , IN V_Value  VARCHAR(10000),  IN V_Transaction_Type  varchar(80))
BEGIN

INSERT INTO `bepartnerslog`.`mp_log_transaction_user_info` (`Id_Log_Transaction_User`, `Value`, `Transaction_Type`, `Create_Date`) 
VALUES (V_Id_Log_Transaction_User, V_Value, V_Transaction_Type, CURDATE());
	
END//
DELIMITER ;

-- Volcando estructura para tabla bepartnerslog.user_login
CREATE TABLE IF NOT EXISTS `user_login` (
  `Id_User_Login` int(11) NOT NULL AUTO_INCREMENT,
  `Id_User` int(11) NOT NULL,
  `Date_Time_Execution` datetime NOT NULL,
  PRIMARY KEY (`Id_User_Login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla bepartnerslog.user_login_info
CREATE TABLE IF NOT EXISTS `user_login_info` (
  `Id_User_Login_Info` int(11) NOT NULL AUTO_INCREMENT,
  `Id_User_Login` int(11) NOT NULL,
  `Enable` int(11) NOT NULL,
  `Value` varchar(1028) NOT NULL,
  `User_Login_Type` varchar(6) NOT NULL,
  `CreateDate` date NOT NULL,
  PRIMARY KEY (`Id_User_Login_Info`),
  KEY `fk_USER_LOGIN_INFO_USER_LOGIN1_idx` (`Id_User_Login`),
  CONSTRAINT `fk_USER_LOGIN_INFO_USER_LOGIN1` FOREIGN KEY (`Id_User_Login`) REFERENCES `user_login` (`Id_User_Login`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
