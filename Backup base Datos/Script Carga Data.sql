USE bepartners;


/**
INSERCION DE TERMINOS Y CONDICIONES
**/
DELETE  FROM bepartners.mp_user_third_terms;
DELETE  FROM bo_terms;
UPDATE bepartners.bo_terms ter SET ter.Enable=b'1'  WHERE ter.Enable=b'0' ;
COMMIT;
INSERT INTO `bepartners`.`bo_terms` (`Url`, `Version`, `Enable`, `Create_Date`, `Last_modify`) VALUES ('URL Termino 1', '1', b'0', '2019-06-07', '2019-06-07');


/***********************************************************************************************
INSERCION DE CATALOGOS
************************************************************************************************/
DELETE  FROM u_item_catalog;
DELETE  FROM u_catalog;

/**
INSERCION DE CATALOGO DOCUMENT TIP TIP
**/
INSERT INTO `bepartners`.`u_catalog` (`Id_Catalog`, `CatalogName`, `Description`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('101', 'Catalog Documents Tip', 'Se registran los tipos de documento', b'1', '2019-06-12', '2019-06-12');

-- INSERCION DE LOS ITEMS DE ESTE CATALOGO
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('101001','101' , 'Cedula', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('101002','101' , 'Nit', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('101003','101' , 'Cedula Extrangeria', b'1', '2019-05-30', '2019-05-30');

/*
INSERCION DE CATALOGO RESPUESTA LISTAS
**/
INSERT INTO `bepartners`.`u_catalog` (`Id_Catalog`, `CatalogName`, `Description`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('102', 'Catalog Respinse List', 'Se registran las posibles respuestas de listas restrictivas', b'1', '2019-06-12', '2019-06-12');
-- INSERCION DE LOS ITEMS DE ESTE CATALOGO
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('102001','102' , 'Reportado', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('102002','102' , 'No Reportado', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('102003','102' , 'Error consulta Listas', b'1', '2019-05-30', '2019-05-30');

/*
INSERCION DE CATALOGO RESPUESTA EVIDENTE
**/
INSERT INTO `bepartners`.`u_catalog` (`Id_Catalog`, `CatalogName`, `Description`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('103', 'Catalog Respinse List', 'Se registran las posibles respuestas de listas restrictivas', b'1', '2019-06-12', '2019-06-12');
-- INSERCION DE LOS ITEMS DE ESTE CATALOGO
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('103001','103' , 'Aprobado', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('103002','103' , 'Rechazado', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('103003','103' , 'No existe identificacion', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('103005','103' , 'No Coinciden Datos', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('103006','103' , 'Valido con documento no vigente', b'1', '2019-05-30', '2019-05-30');

/*
INSERCION DE CATALOGO TIPOS DE CATEGORIAS PARA EL ARBOL
**/
INSERT INTO `bepartners`.`u_catalog` (`Id_Catalog`, `CatalogName`, `Description`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('104', 'Catalog Tipos Categorias', 'Se registran los tipos de categorias para el arbol de catalogos', b'1', '2019-06-12', '2019-06-12');
-- INSERCION DE LOS ITEMS DE ESTE CATALOGO
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('104001','104' , 'Pais', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('104002','104' , 'Departamento', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('104003','104' , 'Ciudad', b'1', '2019-05-30', '2019-05-30');

/**
INSERCION DE CATALOGO RESPUESTA RUES
**/
INSERT INTO `bepartners`.`u_catalog` (`Id_Catalog`, `CatalogName`, `Description`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('105', 'Catalog Respinse RUES', 'Se registran las posibles respuestas de Rues', b'1', '2019-06-12', '2019-06-12');
-- INSERCION DE LOS ITEMS DE ESTE CATALOGO
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('105001','105' , 'Aprobado', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('105002','105' , 'Rechazado', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('105003','105' , 'Error consulta', b'1', '2019-05-30', '2019-05-30');


/*
INSERCION DE CATALOGO INFO ADICIONAL USUARIO
**/
INSERT INTO `bepartners`.`u_catalog` (`Id_Catalog`, `CatalogName`, `Description`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('201', 'Catalog Info Basic User', 'Se registra la informacion basica de usuario', b'1', '2019-06-12', '2019-06-12');
-- INSERCION DE LOS ITEMS DE ESTE CATALOGO
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('201001','201' , 'Validate List', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('201002','201' , 'Validate Evidente', b'1', '2019-05-30', '2019-05-30');

/*
INSERCION DE CATALOGO INFO ADICIONAL THIRD
**/
INSERT INTO `bepartners`.`u_catalog` (`Id_Catalog`, `CatalogName`, `Description`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('301', 'Catalog Info Third', 'Se registran los datos adicionales de Third', b'1', '2019-06-12', '2019-06-12');
-- INSERCION DE LOS ITEMS DE ESTE CATALOGO
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('301001','301' , 'Razon social', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('301002','301' , 'Mail Facturacion', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('301003','301' , 'Direccion Correspondencia', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('301004','301' , 'Ciudad', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('301005','301' , 'Departamento', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('301006','301' , 'Validate_List', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('301007','301' , 'Validate_Rues', b'1', '2019-05-30', '2019-05-30');

/***
INSERCION RAZONES DE LOGS
**/
INSERT INTO `bepartners`.`u_catalog` (`Id_Catalog`, `CatalogName`, `Description`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('401', 'Catalog Razones Logs', 'Se registran las razones de los logs', b'1', '2019-06-12', '2019-06-12');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('401001','401' , 'Registro', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('401002','401' , 'Consulta RUES', b'1', '2019-05-30', '2019-05-30');

/***
INSERCION ESTATUS  DE LOGS
**/
INSERT INTO `bepartners`.`u_catalog` (`Id_Catalog`, `CatalogName`, `Description`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('402', 'Catalog Razones Logs', 'Se registran las razones de los logs', b'1', '2019-06-12', '2019-06-12');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('402001','402' , 'Exito', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('402002','402' , 'Error', b'1', '2019-05-30', '2019-05-30');

/**
INSERCION INFORMACION ADICIONAL REGISTRO EN EL LOG
**/
INSERT INTO `bepartners`.`u_catalog` (`Id_Catalog`, `CatalogName`, `Description`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('403', 'Informacion Adicional Registro en Logs', 'Se registra la informacion adicioanal en el registro', b'1', '2019-06-12', '2019-06-12');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('403001','403' , 'Peticion_JSON', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('403002','403' , 'Error_JSON', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('403003','403' , 'Identificacion_Usuario', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('403004','403' , 'Tip_Identificacion_Usuario', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('403005','403' , 'Identificacion_Tercero', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('403006','403' , 'Tip_Identificacion_Tercero', b'1', '2019-05-30', '2019-05-30');

COMMIT;






