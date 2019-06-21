-- PROCEDIMIENTO DE REGISTRO DE USUARIO TERCERO Y CONDICIONES
USE bepartners;
DROP PROCEDURE IF EXISTS SP_UpSert_User_third;
DELIMITER //
CREATE PROCEDURE SP_UpSert_User_third(
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


END
//
DELIMITER ;

-- CALL SP_UpSert_User_third('08608929-8ed3-11e9-93b0-e4b97a57d991', '1c8a427a-8ed3-11e9-93b0-e4b97a57d991', b'1');
-- US 08608929-8ed3-11e9-93b0-e4b97a57d991
-- THIR 1c8a427a-8ed3-11e9-93b0-e4b97a57d991
-- SELECT * FROM mp_user_third;
-- SELECT * FROM mp_user_third_terms;

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

-- CALL pa_create_product('NOMBRE A', 'ABaaF', '123', 'DESCRIPCION TEST');

-- Procedimiento de registro de Tercero
USE bepartners;
DROP PROCEDURE IF EXISTS SP_UpSert_Third;
DELIMITER //
CREATE PROCEDURE SP_UpSert_Third(
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
END
//
DELIMITER ;
-- Ejemplo de llamado
-- CALL SP_UpSert_Third('', 'IDENIT', '1124320121', 'Empresa Modificada',b'0');
-- SELECT * FROM mp_third;


-- Procedimiento de registro de Tercero INFO Adicional
USE bepartners;
DROP PROCEDURE IF EXISTS SP_UpSert_Third_Basic_Info;
DELIMITER //
CREATE PROCEDURE SP_UpSert_Third_Basic_Info(
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
	
END
//
DELIMITER ;

-- Ejemplo de llamado
-- CALL SP_UpSert_Third_Basic_Info('ff919624-8eba-11e9-93b0-e4b97a57d991','AAA04', 'prueba 123456',b'1');
-- SELECT * FROM mp_third_info;



-- PROCEDIMIENTO DE REGISTRO DE USUARIO
USE bepartners;
DROP PROCEDURE IF EXISTS SP_UpSert_User;
DELIMITER //
CREATE PROCEDURE SP_UpSert_User(
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
END
//
DELIMITER ;

-- CALL SP_UpSert_User('','IDECED', '71802245411123', 'Julian gerardo','Rojas aguirre','prueba11@yopmail.com','31188878788123','profile algo mod',b'1');

-- FUNCION CONSULTA DE USUARIO POR IDENTIFICACION
-- SELECT * FROM mp_user;

-- FUNCION CONSULTA DE USUARIO POR IDENTIFICACION PUBLICA
-- SELECT * FROM mp_user WHERE 


-- PROCEDIMIENTO DE REGISTRO DE USUARIO INFO ADICIONAL
USE bepartners;
DROP PROCEDURE IF EXISTS SP_UpSert_User_Info;
DELIMITER //
CREATE PROCEDURE SP_UpSert_User_Info(
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

END
//
DELIMITER ;

-- CALL SP_UpSert_User_Info('7938f2a3-8d5f-11e9-93b0-e4b97a57d991', 'algo1', 'prueba4',b'1');



-- Procedimiento de registro de log
USE bepartnerslog;
DROP PROCEDURE IF EXISTS SP_Insert_User_Log;
DELIMITER //
CREATE PROCEDURE SP_Insert_User_Log(
	 IN v_Id_Third_Public  varchar(80) , IN v_Id_User_Public  varchar(80),  IN V_Id_Razon  varchar(80),IN V_Id_Estatus  varchar(80) )	 

BEGIN

INSERT INTO `bepartnerslog`.`mp_log_transacion_user` (`Id_Third_Public`, `Id_User_Public`, `Id_Reason_Type`, `Date_Time_Register`, `Id_Status`) 
VALUES (v_Id_Third_Public, v_Id_User_Public, V_Id_Razon, CURDATE(), V_Id_Estatus);

SELECT MAX(Id_Log_transaction_User) as Id_Log_transaction_User  FROM `bepartnerslog`.`mp_log_transacion_user`
WHERE Id_Third_Public=v_Id_Third_Public AND Id_User_Public=v_Id_User_Public;

	
END
//
DELIMITER ;

-- Ejemplo de llamado
-- CALL SP_Insert_User_Log('123', '123', 'algo', 'ok');

-- Procedimiento de catalogo adicional
USE bepartnerslog;
DROP PROCEDURE IF EXISTS SP_Insert_User_Log_Info;
DELIMITER //
CREATE PROCEDURE SP_Insert_User_Log_Info(
	 IN V_Id_Log_Transaction_User  INT , IN V_Value  VARCHAR(10000),  IN V_Transaction_Type  varchar(80))
BEGIN

INSERT INTO `bepartnerslog`.`mp_log_transaction_user_info` (`Id_Log_Transaction_User`, `Value`, `Transaction_Type`, `Create_Date`) 
VALUES (V_Id_Log_Transaction_User, V_Value, V_Transaction_Type, CURDATE());
	
END
//
DELIMITER ;

-- Ejemplo de llamado
-- CALL SP_Insert_User_Log_Info('8','AAA04', '23456');
--  SELECT * FROM mp_log_transaction_user_info;



