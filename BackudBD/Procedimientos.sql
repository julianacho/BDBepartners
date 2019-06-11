-- PROCEDIMIENTOS
USE bepartners;
DROP PROCEDURE IF EXISTS Pa_Create_Product;
DELIMITER //
CREATE PROCEDURE pa_create_product(
	IN V_Name  varchar(80), IN V_Id_Product_Type  varchar(80) , IN V_ProductCode  varchar(80), IN V_Description  varchar(80))
BEGIN
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SELECT 0 AS RESULTADO FROM DUAL;
 INSERT INTO `bepartners`.`bo_product` (`Name`, `Id_Product_Type`, `ProductCode`, `Description`, `Enable`, `Create_Date`, `Last_Modify`) 
	 VALUES (V_Name , V_Id_Product_Type , V_ProductCode, V_Description, b'0', CURDATE(), CURDATE());
  SELECT 1 AS RESULTADO FROM DUAL;
END
//
DELIMITER ;

-- PROCEDIMIENTO DE REGISTRO DE USUARIO
DROP PROCEDURE IF EXISTS Pa_Create_User;
DELIMITER //
CREATE PROCEDURE Pa_Create_User(
	 IN V_Id_Type  varchar(80) , IN V_Identification_Number  varchar(80), IN V_Name  varchar(80), IN V_Last_Name  varchar(80) , IN V_Email  varchar(80), IN V_Phone  varchar(80), IN V_Profile_Picture  varchar(80) )
BEGIN

DECLARE EXIT HANDLER FOR 1062 SELECT 0 COD, 'Duplicate keys error encountered' TEXT;
DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 0 COD, 'SQLException encountered' TEXT;
DECLARE EXIT HANDLER FOR SQLSTATE '23000' SELECT 0 COD, 'SQLSTATE 23000' TEXT;

INSERT INTO `bepartners`.`mp_user` (`Id_User_Public`, `Id_Type`, `Identification_Number`, `Name`, `Last_Name`, `Email`, `Phone`, `Profile_Picture`, `Enable`, `Create_Date`, `Last_Date`) 
VALUES (UUID(), V_Id_Type, V_Identification_Number, V_Name, V_Last_Name, V_Email, V_Phone, V_Profile_Picture, b'0', CURDATE(), CURDATE());

SELECT 1 COD, 'SUCCES' AS RESULTADO FROM DUAL;
END
//
DELIMITER ;

-- PROCEDIMIENTO DE REGISTRO DE USUARIO INFO ADICIONAL

USE bepartners;
DROP PROCEDURE IF EXISTS Pa_Create_User_Info;
DELIMITER //
CREATE PROCEDURE Pa_Create_User_Info(
	 IN V_Id_Type  varchar(80) , IN V_Identification_Number  varchar(80), IN V_Id_Info_Type_User  varchar(80),  IN V_Value  varchar(80))
BEGIN
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SELECT 0 AS RESULTADO FROM DUAL;
INSERT INTO `bepartners`.`mp_user_info` (`Id_User`, `Id_Info_Type_User`, `Value`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ((SELECT us.id_User FROM mp_user us  WHERE us.Id_Type=V_Id_Type AND us.Identification_Number=V_Identification_Number), V_Id_Info_Type_User, V_Value, b'0', CURDATE(), CURDATE());
SELECT 1 AS RESULTADO FROM DUAL;
END
//
DELIMITER ;


-- Procedimiento de registro de Tercero
USE bepartners;
DROP PROCEDURE IF EXISTS Pa_Create_Third;
DELIMITER //
CREATE PROCEDURE Pa_Create_Third(
	 IN V_Id_Type  varchar(80) , IN V_Identification_Number  varchar(80), IN V_Profile_Info  varchar(80) )
BEGIN
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SELECT 0 AS RESULTADO FROM DUAL;
INSERT INTO `bepartners`.`mp_third` (`Id_Third_Public`, `Id_Type`, `Identification_Number`, `Profile_Info`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES (UUID(), V_Id_Type, V_Identification_Number, V_Profile_Info, b'0', CURDATE(), CURDATE());
SELECT 1 AS RESULTADO FROM DUAL;
END
//
DELIMITER ;

-- Procedimiento de registro de Tercero INFO Adicional
USE bepartners;
DROP PROCEDURE IF EXISTS Pa_Create_Third_Info;
DELIMITER //
CREATE PROCEDURE Pa_Create_Third_Info(
	 IN V_Id_Type  varchar(80) , IN V_Identification_Number  varchar(80), IN V_Id_Info_Type_Third  varchar(80),  IN V_Value  varchar(80))
BEGIN
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SELECT 0 AS RESULTADO FROM DUAL;
INSERT INTO `bepartners`.`mp_third_info` (`Id_Third`, `Id_Info_Type_Third`, `Value`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ((SELECT th.Id_Third FROM mp_third th WHERE th.Id_Type=V_Id_Type AND th.Identification_Number=V_Identification_Number), V_Id_Info_Type_Third, V_Value, b'0', CURDATE(), CURDATE());

SELECT 1 AS RESULTADO FROM DUAL;
END
//
DELIMITER ;

-- PROCEDIMIENTO DE REGISTRO DE USUARIO TERCERO Y CONDICIONES
USE bepartners;
DROP PROCEDURE IF EXISTS Pa_Create_User_Third;
DELIMITER //
CREATE PROCEDURE Pa_Create_User_Third(
	 IN V_Id_Type_User  varchar(80) , IN V_Identification_Number_User  varchar(80),IN V_Id_Type_Third  varchar(80) , IN V_Identification_Number_Third  varchar(80) )
BEGIN
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SELECT 0 AS RESULTADO FROM DUAL;

INSERT INTO `bepartners`.`mp_user_third` (`Id_User`, `Id_Third`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES (
(SELECT us.id_User FROM mp_user us  WHERE us.Id_Type=V_Id_Type_User AND us.Identification_Number=V_Identification_Number_User), 
(SELECT th.Id_Third FROM mp_third th WHERE th.Id_Type=V_Id_Type_Third AND th.Identification_Number=V_Identification_Number_Third), b'0', CURDATE(), CURDATE());


INSERT INTO `bepartners`.`mp_user_third_terms` (`Id_User_Third`, `Id_Terms`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES (
(

SELECT usr_th.Id_User_Third FROM bepartners.mp_user_third usr_th 
JOIN mp_user us1 ON usr_th.Id_User=us1.id_User AND us1.Id_Type=V_Id_Type_User AND us1.Identification_Number=V_Identification_Number_User
JOIN mp_third th1 ON usr_th.Id_Third = th1.Id_Third AND  th1.Id_Type=V_Id_Type_Third AND th1.Identification_Number=V_Identification_Number_Third

)
, 
(SELECT tr.Id_terms FROM bo_terms tr WHERE tr.Enable=b'0')
, b'0', CURDATE(), CURDATE());

SELECT 1 AS RESULTADO FROM DUAL;
END
//
DELIMITER ;



