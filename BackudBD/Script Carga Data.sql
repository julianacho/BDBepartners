
USE bepartners;

/***********************************************************************************************
INSERCION DE BACK OFFICE
************************************************************************************************/

/**
INSERCION DE TERMINOS Y CONDICIONES
**/
DELETE  FROM bo_terms;
UPDATE bepartners.bo_terms ter SET ter.Enable=b'1'  WHERE ter.Enable=b'0' ;
COMMIT;
INSERT INTO `bepartners`.`bo_terms` (`Descripction`, `Version`, `Enable`, `Create_Date`, `Last_modify`) VALUES ('Termino 1', '1', b'0', '2019-06-07', '2019-06-07');


/***********************************************************************************************
INSERCION DE CATALOGOS
************************************************************************************************/
DELETE  FROM u_item_catalog;
DELETE  FROM u_catalog;

/**
INSERCION DE CATALOGO COMUN
**/
INSERT INTO `bepartners`.`u_catalog` (`Name`, `Description`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('Catalogo Comun', 'Se registran los items comunes de todos los modulos', b'0', '2019-05-30', '2019-05-30');
-- INSERCION DE LOS ITEMS DE ESTE CATALOGO
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('ESTEXI',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Comun') , 'Indica que la transaccion fue exitosa', b'1', '2019-05-30', '2019-05-30');

INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('ESTFAL',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Comun') , 'Indica que la transaccion fue fallida', b'1', '2019-05-30', '2019-05-30');

INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('IDECED',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Comun') , 'Tipo de identificacion Cedula', b'1', '2019-05-30', '2019-05-30');

INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('IDENIT',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Comun') , 'Tipo de identificacion NIT', b'1', '2019-05-30', '2019-05-30');


/**
INSERCION DE CATALOGO TERCERO
**/
INSERT INTO `bepartners`.`u_catalog` (`Name`, `Description`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('Catalogo Tercero', 'Catalogo Datos Basicos Tercero', b'0', '2019-05-30', '2019-05-30');
-- INSERCION DE LOS ITEMS DE ESTE CATALOGO
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('TERDIR',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Tercero') , 'Direccion', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('TERCEL',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Tercero') , 'Telefono', b'1', '2019-05-30', '2019-05-30');


/**
INSERCION DE CATALOGO USUARIO
**/
INSERT INTO `bepartners`.`u_catalog` (`Name`, `Description`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('Catalogo Usuario', 'Catalogo Datos Basicos Usuario', b'0', '2019-05-30', '2019-05-30');
-- INSERCION DE LOS ITEMS DE ESTE CATALOGO
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('USRDOM',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Usuario') , 'Direccion', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('USRIUD',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Usuario') , 'Ciudad', b'1', '2019-05-30', '2019-05-30');


/**
INSERCION DE CATALOGO PRODUCTO
**/
INSERT INTO `bepartners`.`u_catalog` (`Name`, `Description`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('Catalogo Producto', 'Catalogo Informacion de producto', b'0', '2019-05-30', '2019-05-30');
-- INSERCION DE LOS ITEMS DE ESTE CATALOGO
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PROTIT',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Producto') , 'Titulo', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PROOBS',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Producto') , 'Observaciones', b'1', '2019-05-30', '2019-05-30');



/**
INSERCION DE CATALOGO TIPOS DE PRODUCTOS
**/
INSERT INTO `bepartners`.`u_catalog` (`Name`, `Description`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('Catalogo Tipos Productos', 'Se registran los diferentes tipos de productos', b'0', '2019-05-30', '2019-05-30');
-- INSERCION DE LOS ITEMS DE ESTE CATALOGO
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PTICLI',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Tipos Productos') , 'Presta CLic', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PTIEMP',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Tipos Productos') , 'Informe Empresarial', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PTIEXP',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Tipos Productos') , 'Informe Express', b'1', '2019-05-30', '2019-05-30');



/**
INSERCION DE CATALOGO DATOS ADICIONALES DE PRODUCTO PRESTA CLIC - TRANSACCION
**/
INSERT INTO `bepartners`.`u_catalog` (`Name`, `Description`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('Catalogo Registro de transaccion  RTA PC', 'Se registran los datos adicionales para el registro de consumos de transacciones para el producto PC', b'0', '2019-05-30', '2019-05-30');
-- INSERCION DE LOS ITEMS DE ESTE CATALOGO
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PCIRIE',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Registro de transaccion  RTA PC') , 'Registra Politica de Riesgo', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PCIEST',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Registro de transaccion  RTA PC') , 'Registra la estrategia de RECAU2', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PCIAL1',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Registro de transaccion  RTA PC') , 'Registra Alerta 1', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PCIAL2',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Registro de transaccion  RTA PC') , 'Registra Alerta 2', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PCIAL3',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Registro de transaccion  RTA PC') , 'Registra Alerta 3', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PCINOM',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Registro de transaccion  RTA PC') , 'Nombre completo de la persona', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PCIGEN',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Registro de transaccion  RTA PC') , 'Genero de la persona', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PCIEXP',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Registro de transaccion  RTA PC') , 'Lugar de expedicion', b'1', '2019-05-30', '2019-05-30');




/**
INSERCION DE CATALOGO DATOS TRANSACCICN PRESTA CLIC
**/

INSERT INTO `bepartners`.`u_catalog` (`Name`, `Description`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('Catalogo Registro de transaccion  de RTA PC', 'Se registran los datos adicionales para el registro de consumos de transacciones para el producto PC', b'0', '2019-05-30', '2019-05-30');
-- INSERCION DE LOS ITEMS DE ESTE CATALOGO
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PCIRIE',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Registro de transaccion  de RTA PC') , 'Registra Politica de Riesgo', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PCIEST',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Registro de transaccion  de RTA PC') , 'Registra la estrategia de RECAU2', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PCIAL1',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Registro de transaccion  de RTA PC') , 'Registra Alerta 1', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PCIAL2',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Registro de transaccion  de RTA PC') , 'Registra Alerta 2', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PCIAL3',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Registro de transaccion  de RTA PC') , 'Registra Alerta 3', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PCINOM',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Registro de transaccion  de RTA PC') , 'Nombre completo de la persona', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PCIGEN',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Registro de transaccion  de RTA PC') , 'Genero de la persona', b'1', '2019-05-30', '2019-05-30');
INSERT INTO `bepartners`.`u_item_catalog` (`Id_Item`, `Id_Catalog`, `Item_Name`, `Enable`, `Create_Date`, `Last_Modify`) 
VALUES ('PCIEXP',(SELECT u_catalog.Id_Catalog FROM u_catalog WHERE u_catalog.NAME='Catalogo Registro de transaccion  de RTA PC') , 'Lugar de expedicion', b'1', '2019-05-30', '2019-05-30');




-- INSERCION DE CATALOGO LOGIN USER

COMMIT;