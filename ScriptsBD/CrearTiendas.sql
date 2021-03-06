USE EdiDB
GO
IF OBJECT_ID('UsuariosExternos', 'U') IS NOT NULL 
	DROP TABLE UsuariosExternos
GO
CREATE TABLE UsuariosExternos(
	Id int IDENTITY(1,1) PRIMARY KEY,
	CodUsr NVARCHAR(128),
	NomUsr NVARCHAR(128),
	UsrPassword NVARCHAR(256),
	ClienteID int, 
	HashId NVARCHAR(128)
)
GO
INSERT INTO UsuariosExternos(CodUsr, NomUsr, UsrPassword, ClienteID)
VALUES('hcampos', 'Hilmer', 'Pass123456', 1345)
GO
SELECT * FROM UsuariosExternos
GO
IF OBJECT_ID('PedidosEstadosExternos', 'U') IS NOT NULL 
	DROP TABLE PedidosEstadosExternos
GO
CREATE TABLE PedidosEstadosExternos(
	Id int PRIMARY KEY,
	Descripcion nvarchar(64)
)
GO
INSERT INTO PedidosEstadosExternos(Id, Descripcion)
VALUES(1, 'Guardado')
GO
INSERT INTO PedidosEstadosExternos(Id, Descripcion)
VALUES(2, 'Enviado')
GO
INSERT INTO PedidosEstadosExternos(Id, Descripcion)
VALUES(3, 'Despachado')
GO
IF OBJECT_ID('PedidosExternos', 'U') IS NOT NULL 
	DROP TABLE PedidosExternos
GO
CREATE TABLE PedidosExternos(
	Id int IDENTITY(1,1) PRIMARY KEY,
	ClienteID int,	
	FechaPedido nvarchar(16) null,
	IdEstado int,
	FechaCreacion nvarchar(16),
	[Periodo] [nvarchar](10) NULL,
	[FechaUltActualizacion] [nvarchar](10) NULL
)
GO
IF OBJECT_ID('PedidosDetExternos', 'U') IS NOT NULL 
	DROP TABLE PedidosDetExternos
GO
CREATE TABLE PedidosDetExternos(
	Id int IDENTITY(1,1) PRIMARY KEY,
	PedidoId int,
	CodProducto nvarchar(50),
	Producto nvarchar(1),
	CantPedir float
)
GO
CREATE INDEX PedidosDetExternosIdxCodProducto ON PedidosDetExternos (CodProducto);
GO
--select * from PedidosDetExternos
--select * from PedidosExternos
IF OBJECT_ID('PAYLESS_Tiendas', 'U') IS NOT NULL 
	DROP TABLE PAYLESS_Tiendas;
GO
CREATE TABLE PAYLESS_Tiendas (
	Id INT PRIMARY KEY IDENTITY(1,1) not null,
	ClienteID int,
	TiendaId int,
	Distrito NVARCHAR(8),
	Descr NVARCHAR(256),
	Direc NVARCHAR(256),
	Tel NVARCHAR(32),
	Cel NVARCHAR(32),
	Lider NVARCHAR(128),
)
GO
--select * from wms.dbo.Clientes where nombre like '%payless%' OR ClienteID = 618 order by ClienteID asc
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (385, 7365, 'R4D', 'Payless Shoe Source - El Salvador', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (618, 7365, 'R4D', 'LEAR', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1397, 7365, 'R4D', 'Payless Shoe Source - Pricesmart SPS - 7365', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1398, 7367, 'R4D', 'Payless Shoe Source - Mega Mall SPS Salida hacia la Lima - 7367', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1399, 7370, 'R4D', 'Payless Shoe Source - Mall Multiplaza SPS - 7370', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1400, 7371, 'R4D', 'Payless Shoe Source - Blvd del Norte Sps - 7371', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1401, 7374, 'R4D', 'Payless Shoe Source - 1 era calle Contiguo a Farmacia Machi Progreso Yoro - 7374', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1402, 7375, 'R4D', 'Payless Shoe Source - Mall Megaplaza La Ceiba - 7375', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1403, 7377, 'R4D', 'Payless Shoe Source - 3era Avenida centro SPS - 7377', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1404, 7378, 'R4D', 'Payless Shoe Source - 3 Y4 calle centro de Pto Cortes - 7378', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1405, 7379, 'R4D', 'Payless Shoe Source - Esquina Opuesta supermercado Paico Siguatepeque - 7379', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1406, 7382, 'R4D', 'Payless Shoe Source - Carretera Salida a Tela Mall MegaPlaza Progreso Yoro - 7382', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1407, 7383, 'R4D', 'Payless Shoe Source - Mall Premier Comayagua - 7383', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1408, 7385, 'R4D', 'Payless Shoe Source - City Mall SPS Avenida Circunvalacion - 7385', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1409, 7385, 'R4D', 'Payless Shoe Source - Uniplaza Santa Rosa de Copan - 7392', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1410, 7385, 'R4D', 'Payless Shoe Source - Colonia Florencia Sur contiguo a Pricesmart TGU - 7366', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1411, 7368, 'R4D', 'Payless Shoe Source - 6 calle 4 y 5 avenida Comayaguela TGU - 7368', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1412, 7369, 'R4D', 'Payless Shoe Source - Uniplaza Juticalpa - 7369', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1413, 7372, 'R4D', 'Payless Shoe Source - Colonia Payaqui fte al Hotel Intercontinental Mall Multiplaza TGU - 7372', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1414, 7373, 'R4D', 'Payless Shoe Source - Barrio El Centro Calle peatonal fte a Celtel TGU - 7373', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1415, 7376, 'R4D', 'Payless Shoe Source - Blvd Centro America Plaza Miraflores 2do Nivel TGU - 7376', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1416, 7380, 'R4D', 'Payless Shoe Source - Calle Vicente Williams contiguo a farmacia La Nueva Choluteca - 7380', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1417, 7381, 'R4D', 'Payless Shoe Source - MetroMall TGU Blvd Fuerzas Armadas y Blvd Comunidad Europea TGU - 7381', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1418, 7384, 'R4D', 'Payless Shoe Source - Cascadas Mall entre Blvd Fuerzas Armadas y Blvd Kuwait TGU - 7384', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1419, 7387, 'R4D', 'Payless Shoe Source - Mall Premier Comayaguela Blvd del Norte - 7387', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1420, 7388, 'R4D', 'Payless Shoe Source - City Mall TGU Vcolonia Las Torres TGU - 7388', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1421, 7389, 'R4D', 'Payless Shoe Source - Unimall Choluteca , Choluteca - 7389', '', '', '', '')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider)
VALUES (1422, 7386, 'R4D', 'Payless Shoe Source - Parqueo Los Proceres fte a restaurante Chillis Edif. Novacentro TGU - 7386', '', '', '', '')
GO
SELECT * FROM PAYLESS_Tiendas
GO
IF OBJECT_ID('PAYLESS_Reportes', 'U') IS NOT NULL 
	DROP TABLE PAYLESS_Reportes
GO
CREATE TABLE PAYLESS_Reportes(
	Id int IDENTITY(1,1) PRIMARY KEY,
	Periodo NVARCHAR(10),
	FechaGen NVARCHAR(20),
	Tipo NVARCHAR(1)
)
GO
--insert into PAYLESS_Reportes(Periodo, FechaGen, Tipo) VALUES('29/04/2019', '02/05/2019 08:49', '0')
--go
IF OBJECT_ID('PAYLESS_Transporte', 'U') IS NOT NULL 
	DROP TABLE PAYLESS_Transporte
GO
CREATE TABLE PAYLESS_Transporte(
	Id int IDENTITY(1,1) PRIMARY KEY,
	Transporte [nvarchar](64)
)
GO