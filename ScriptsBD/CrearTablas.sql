SET IMPLICIT_TRANSACTIONS ON
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
	TiendaId int,	
	FechaPedido nvarchar(16) null,
	IdEstado int,
	FechaCreacion nvarchar(16),
	Periodo nvarchar(10) NULL,
	FechaUltActualizacion nvarchar(16) NULL,
	WomanQty int,
	ManQty int,
	KidQty int,
	AccQty int,
	InvType varchar(4),
	PedidoWMS int null,
	FullPed bit,
	Divert bit,
	TiendaIdDestino int,
	TotalCP int,
	WomanQtyT int,
	ManQtyT int,
	KidQtyT int,
	AccQtyT int,
	Observaciones TEXT,
	CodUserLastUpdate VARCHAR(128)
)
GO
select * from EdiDB.dbo.PedidosExternos
--ALTER TABLE EdiDB.dbo.PedidosExternos
--DROP COLUMN FechaUltActualizacion
--ALTER TABLE EdiDB.dbo.PedidosExternos
--ADD FechaUltActualizacion VARCHAR(16)
ALTER TABLE PedidosExternos
ADD CONSTRAINT PedidosExternosUnique1 UNIQUE (TiendaId, FechaPedido);   
--ALTER TABLE PedidosExternos
--ADD FullPed bit,
--	Divert bit,
--	TiendaIdDestino int
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
CREATE INDEX IndexPedidosDetExternosPedidoId ON PedidosDetExternos (PedidoId);
GO
--select * from PedidosDetExternos
IF OBJECT_ID('PAYLESS_Tiendas', 'U') IS NOT NULL 
	DROP TABLE PAYLESS_Tiendas;
GO
CREATE TABLE PAYLESS_Tiendas (
	Id INT PRIMARY KEY IDENTITY(1,1) not null,
	ClienteID int,
	TiendaId int,
	Distrito VARCHAR(8),
	Descr VARCHAR(256),
	Direc VARCHAR(256),
	Tel VARCHAR(32),
	Cel VARCHAR(32),
	Lider VARCHAR(128),
	BodegaId int,
	HorarioEntrega VARCHAR(128) NULL,
	RutaId int
)
GO
ALTER TABLE EdiDB.dbo.Payless_Tiendas
ADD RutaId int
--update EdiDB.dbo.Payless_Tiendas SET RutaId = 1
--SELECT * FROM [EdiDB].[dbo].[PAYLESS_Tiendas]
--select * from wms.dbo.Clientes where nombre like '%payless%' OR ClienteID = 618 order by ClienteID asc
--truncate table EdiDB.dbo.PAYLESS_Tiendas
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 8000, 'R4D', 'Payless Shoe Source - El Salvador', '', '', '', '', 81)
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7365, 'R4D', 'Payless Shoe Source - Pricesmart SPS', 'Pricesmart SPS', '2566-4946', '9986-5064', 'DINA HANDAL', 81, 'Martes y jueves a las 09:00, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7366, 'R4D', 'Payless Shoe Source - Pricesmart TGU', 'Colonia Florencia Sur contiguo a Pricesmart TGU', '2235-3034', '9761-8837', 'LESBY ORTIZ ', 82, 'Martes y jueves a las 09:00, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7367, 'R4D', 'Payless Shoe Source - Mega Mall SPS', 'Mega Mall SPS Salida hacia la Lima', '2557-0731', '3222-6879', 'DUNIA ERAZO', 81, 'Martes y jueves a las 08:00, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7368, 'R4D', 'Payless Shoe Source - Comayuguela TGU', '6 calle 4 y 5 avenida Comayaguela TGU', '2238-9286', '3345-7997', 'GLADYS VELASQUEZ', 82, 'Lunes a las 07:30, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7369, 'R4D', 'Payless Shoe Source - Uniplaza Juticalpa TGU', 'Uniplaza Juticalpa', '2785-7117', '3173-1708', 'JORGE IVAN LARA', 82, 'Martes y jueves a las 08:00, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7370, 'R4D', 'Payless Shoe Source - Mall Multiplaza SPS', 'Mall Multiplaza SPS', '2550-5588', '9977-3678', 'SACCIA GATTAS', 81, 'Martes y jueves a las 20:00, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7371, 'R4D', 'Payless Shoe Source - Blvd del Norte SPS', 'Blvd del Norte Sps', '2552-1510', '9615-6108', 'EVELYN SANABRIA', 81, 'Martes y jueves a las 09:30, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7372, 'R4D', 'Payless Shoe Source - Mall Multiplaza Hotel Intercontinental TGU', 'Colonia Payaqui fte al Hotel Intercontinental Mall Multiplaza TGU', '2231-2247', '8732-5386', 'CAROLINA CHIRINOS', 82, 'Martes y jueves a las 07:30, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7373, 'R4D', 'Payless Shoe Source - Barrio el Centro TGU', 'Barrio El Centro Calle peatonal fte a Celtel TGU', '2220-0257', '9882-7790', 'HECTOR HERNANDEZ', 82, 'Martes y jueves a las 08:00, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7374, 'R4D', 'Payless Shoe Source - 1ra calle Progreso, Yoro SPS', '1 era calle Contiguo a Farmacia Machi Progreso Yoro', '2648-1648', '9882-8148', 'RONNIE SOLIS', 81, 'Lunes y viernes a las 10:30, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7375, 'R4D', 'Payless Shoe Source - Mall Megaplaza La Ceiba SPS', 'Mall Megaplaza La Ceiba', '2441-3146', '3184-5596', 'LITZA ANTUNEZ', 81, 'Lunes, miércoles y viernes a las 06:00, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7376, 'R4D', 'Payless Shoe Source - Plaza Miraflores TGU', 'Blvd Centro America Plaza Miraflores 2do Nivel TGU', '2235-8545', '9500-1845', 'OLGA MATUTE', 82, 'Martes y jueves a las 07:00, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7377, 'R4D', 'Payless Shoe Source - 3era Avenida SPS', '3era Avenida centro SPS', '2550-9286', '3143-5605', 'YENNY PINTO', 81, 'Martes y jueves a las 06:00, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7378, 'R4D', 'Payless Shoe Source - Centro Pto Cortes SPS', '3 Y4 calle centro de Pto Cortes', '2665-3654', '9577-0771', 'OLGA RIVERA', 81, 'Martes y jueves a las 06:00, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7379, 'R4D', 'Payless Shoe Source - Siguatepeque TGU', 'Esquina Opuesta supermercado Paico Siguatepeque', '2773-5881', '9948-8465', 'FRANCISCO AGUILERA', 82, 'Martes y jueves a las 06:00, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7380, 'R4D', 'Payless Shoe Source - Calle Vicente William Choluteca TGU', 'Calle Vicente Williams contiguo a farmacia La Nueva Choluteca', '2782-7562', '9561-8770', 'JESSY LOPEZ', 82, 'Martes y jueves a las 06:30, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7381, 'R4D', 'Payless Shoe Source - Metromall TGU yBlvd Europea TGU', 'MetroMall TGU Blvd Fuerzas Armadas y Blvd Comunidad Europea TGU', '2225-5131', '9724-0057', 'BLANCA PIKE', 82, 'Martes y jueves a las 06:30, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7382, 'R4D', 'Payless Shoe Source - Mall Megaplaza Progreso Yoro SPS', 'Carretera Salida a Tela Mall MegaPlaza Progreso Yoro', '2620-1616', '3191-2148', 'KENIA ORTEGA', 81, 'Martes y jueves a las 09:30, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7383, 'R4D', 'Payless Shoe Source - Mall Premier Comayagua TGU', 'Mall Premier Comayagua', '2771-8342', '9873-3222', 'GABRIELA ELVIR', 82, 'Martes y jueves a las 09:00, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7384, 'R4D', 'Payless Shoe Source - Mall Cascadas y Blvd Kuwait TGU', 'Cascadas Mall entre Blvd Fuerzas Armadas y Blvd Kuwait TGU', '2245-9355', '9555-6911', 'ANGELICA ESPINAL', 82, 'Martes y jueves a las 08:30, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7385, 'R4D', 'Payless Shoe Source - City Mall SPS', 'City Mall SPS Avenida Circunvalacion', '2518-0775', '9585-7087/3173-9222', 'YOLANDA REYES', 81, 'Martes y jueves a las 18:00, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7386, 'R4D', 'Payless Shoe Source - Parqueo los Proceres TGU', 'Parqueo Los Proceres fte a restaurante Chillis Edif. Novacentro TGU', '2280-2969', '3176-5353', 'WENDIX SANCHEZ', 82, 'Miércoles y viernes a las 07:00, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7387, 'R4D', 'Payless Shoe Source - Mall Premier Comayaguela TGU', 'Mall Premier Comayaguela Blvd del Norte', '2201-4375', '9834-0205', 'SANDRA ESPINOZA', 82, 'Martes a las 07:00, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7388, 'R4D', 'Payless Shoe Source - City Mall TGU', 'City Mall TGU Vcolonia Las Torres TGU', '2263-0016', '9968-4983', 'CARLOS HERNANDEZ', 82, 'Miércoles y viernes a las 08:45, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7389, 'R4D', 'Payless Shoe Source - Unimall Choluteca TGU', 'Unimall Choluteca , Choluteca', '2705-3942', '9561-8770', 'NELSON ARGUETA', 82, 'Martes y jueves a las 08:00, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId, HorarioEntrega)
VALUES (1432, 7392, 'R4D', 'Payless Shoe Source - Uniplaza Santa Rosa de Copan SPS', 'Uniplaza Santa Rosa de Copan', '2662-5923', '9595-4232', 'MERCY DUBON', 81, 'Martes y jueves a las 07:30, hora militar.')
GO
INSERT INTO PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (1432, 7393, 'R4D', 'Nueva tienda Roatán SPS', '', '', '', '', 81)
GO
-------Payless El Salvador 
select * from EdiDB.dbo.PAYLESS_Tiendas
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7650, 'D1', 'Galerias', 'Centro Comercial Galerias Loal #32, Nivel 3, Paseo General Escalon #3700, San Salvador', '2223-8305', '7637-2938', 'Lisbeth Sandoval', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7651, 'D1', 'Los Heroes', 'Price Smart Los Heroes, Urbanizacion Nuevo Siglo XXI Blvd.Tuntunichapa, Local #1, San Salvador', '2261-2552', '7637-3448', 'Nubia Mazariego', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7652, 'D1', 'Santa Elena', 'Urbanización Madre Selva, Blv sur, Calle Cortéz Blanco, Av. El Pepeto contiguo a Pricesmart, Antiguo Cuscatlan, La Libertad', '2243-3012', '7637-6108', 'Copelia Cornejo', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7653, 'D1', 'San Luis', 'Centro Comercial San Luis, 2do nivel  locales 17, 18, 19, 20 21B, Calle San Antonio Abad, San Salvador', '2226-4009', '7637-9293', 'Flor Pineda', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7657, 'D1', 'Metrocentro S.S. 4a Etapa', 'Centro Comercial Metrocentro 4a. Etapa, Locales 123,124,125, Segunda Planta, San Salvador', '2261-2922', '7637-2692', 'Wendy Funes', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7658, 'D1', 'Unicentro Lourdes', 'Km 24, Autopista a Santa Ana, Locales 1B, 2B, 3B, Canton Lourdes Colon, La Libertad', '2346-5809', '7637-7788', 'Marty Castro', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7659, 'D1', 'Unicentro Altavista', 'Unicentro Altavista, Ave. Principal y Blvd. Las Pavas, Locales, 7E, 8E,9E Ilopango', '2299-7001', '7637-1805', 'Flor Pineda', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7661, 'D1', 'Metrocentro Sonsonate', 'Km 65 1/2, Carretera a Acajutla, Locales 35D, 35E, 50D, Sonsonate', '2429-0617', '7637-8966', 'Carolina Mendez', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7662, 'D1', 'Plaza Metropolis', 'Urbanizacion Metropolis Norte, Calle Zacamil Centro Comercial Plaza Metropolis Locales 16,17 y18, Mejicanos', '2232-3008', '7637-5753', 'Leticia Mejia', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7663, 'D1', 'Metrocentro Santa Ana', 'Final Avenida Independencia y Bypass Col. Loma Linda, Locales  266 D-E (2 nivel), Santa Ana', '2440-0976', '7637-9883', 'Jonathan Gonzalez', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7664, 'D1', 'Plaza Merliot', 'Centro Comercial Plaza Merliot Calle Chiltiupan 17 Ave. Norte Locales 5, 6 y 7 Primer Nivel, Nueva San Salvador, La Libertad', '2229-6356', '7637-4200', 'cristina sanchez', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7665, 'D1', 'Apopa', 'Centro Comercial Periplaza, local 1-4, Carretera troncal del norte k.m 121/2 apopa', '2214-8578', '7637-1173', 'Adela Guardado', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7666, 'D1', 'Ruben Dario', 'Calle Ruben Darío, #412 San Salvador.', '2271-5101', '7637-5178', 'Douglas Romero', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7667, 'D1', 'Metrocentro 11a Etapa', 'Blvd Los Heroes Av. Los Andes y Blvd Tutunichapa, Centro Comercial Metrocentro Etapa 11, locales 1,2 y 3, San Salvador', '2260-2333', '7637-8196', 'Mario Letona', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7668, 'D1', 'San Miguel Centro', 'Ave. Gerardo Barrios y 4a. Calle Oriente. San Miguel', '2661-9361', '7637-6337', 'Juan Carlos Rivera', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7669, 'D1', 'Metrocentro San Miguel', 'Centro Comercial Metrocentro Locales, 106 y 107,San Miguel', '2667-5832', '7637-8196', 'Alba Lemus', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7670, 'D1', 'Plaza Mundo 1ra etapa', 'KM 4 1/2, Blvd. Ejercito  Nacional, Centro Comericial Plaza Mundo, local 58, 59, 60 y 61, Soyapango', '2277-5140', '7637-3788', 'Rossy Salazar', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7671, 'D1', 'Plaza Mundo 5ta etapa', 'Local 86, nivel 2, etapa 5, Centro Comercial Plaza Mundo, Blvd. del Ejercito Nacional, km. 4 1/2 y Calle Montecarmelo, Soyapango', '2227-4636', '7862-8395', 'Delmy Olivares', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7673, 'D1', 'Santa Ana Centro', 'Entre 1ra Calle  Poniente y 2da Ave. Sur #5, Santa Ana.', '2441-2010', '7637-9556', 'Luis Menendez', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7675, 'D1', 'Zacatecoluca', 'Avenida José Simeon Cañas y 2a. Calle Poniente, Barrio El Centro, Zacatecoluca, La Paz', '2334-1830', '7637-1739', 'Douglas Montes', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7676, 'D1', 'Usulutan Centro', 'Calle Grimaldi No. 14 y 4ta Ave Sur No. 2, Usulutan', '2624-5720', '7637-7794', 'Alonso Lopez', null)
GO
INSERT INTO EdiDB.dbo.PAYLESS_Tiendas(ClienteID, TiendaId, Distrito, Descr, Direc, Tel, Cel, Lider, BodegaId)
VALUES (385, 7677, 'D1', 'Multiplaza', 'Centro Comercial Multiplaza, Locales C20, C21  y C22 Segundo Nivel, Antiguo Cuscatlan, La Libertad', '2243-5132', '7637-0655', 'Xiomara Rivas', null)
GO

SELECT * FROM EdiDB.dbo.PAYLESS_Tiendas
GO
--delete from EdiDB.dbo.PAYLESS_Tiendas where TiendaId = 8000
IF OBJECT_ID('PAYLESS_Reportes', 'U') IS NOT NULL 
	DROP TABLE PAYLESS_Reportes
GO
CREATE TABLE PAYLESS_Reportes(
	Id int IDENTITY(1,1) PRIMARY KEY,
	Periodo NVARCHAR(10),
	PeriodoF NVARCHAR(10),
	FechaGen NVARCHAR(20),
	Tipo NVARCHAR(1),
	MailEnviado bit,
	ClienteId int
)
GO
--ALTER TABLE PAYLESS_Reportes
--ADD ClienteId int
IF OBJECT_ID('PAYLESS_ReportesDet', 'U') IS NOT NULL 
	DROP TABLE PAYLESS_ReportesDet
GO
CREATE TABLE PAYLESS_ReportesDet(
	Id int IDENTITY(1,1) PRIMARY KEY,
	IdM int,
	TiendaId int,
	TotalWomanQty int,
	TotalManQty int,
	TotalKidQty int,
	TotalAccQty int,
	Total int,
	Fecha1 VARCHAR(20),
	Cant1 int,
	Fecha2 VARCHAR(20),
	Cant2 int,
	Fecha3 VARCHAR(20),
	Cant3 int,
	Fecha4 VARCHAR(20),
	Cant4 int,
	Fecha5 VARCHAR(20),
	Cant5 int,
	Fecha6 VARCHAR(20),
	Cant6 int,
	RutaId int
)
GO
IF OBJECT_ID('PAYLESS_ReportesMails', 'U') IS NOT NULL 
	DROP TABLE PAYLESS_ReportesMails
GO
CREATE TABLE PAYLESS_ReportesMails(
	Id int IDENTITY(1,1) PRIMARY KEY,
	MailDir VARCHAR(256) UNIQUE,
	Typ INT
)
GO
--alter table payless_reportesmails
--drop constraint UQ__PAYLESS___7E7D34CC76B698BF
--ALTER TABLE PAYLESS_ReportesMails
--ADD Typ INT
--GO
--update EdiDB.dbo.PAYLESS_ReportesMails SET Typ = 1
--select * from EdiDB.dbo.PAYLESS_ReportesMails
--ROLLBACK
--commit
INSERT INTO PAYLESS_ReportesMails(MailDir, Typ) VALUES ('Hilmer.Campos@GlcAmerica.com', 1)
GO
INSERT INTO PAYLESS_ReportesMails(MailDir, Typ) VALUES ('ingrid.murcia@glcamerica.com', 1)
GO
INSERT INTO PAYLESS_ReportesMails(MailDir, Typ) VALUES ('keyfireone@gmail.com', 1)
GO
INSERT INTO PAYLESS_ReportesMails(MailDir, Typ) VALUES ('lucrecia.calderon@payless.com', 1)
GO
INSERT INTO PAYLESS_ReportesMails(MailDir, Typ) VALUES ('eluany.garcia@payless.com', 1)
GO
INSERT INTO PAYLESS_ReportesMails(MailDir, Typ) VALUES ('JuanJose.Garcia@Payless.com', 1)
GO
INSERT INTO PAYLESS_ReportesMails(MailDir, Typ) VALUES ('Ronnie.Solis@Payless.com', 1)
GO
--Alertas al borrar un pedido
INSERT INTO PAYLESS_ReportesMails(MailDir, Typ) VALUES ('Hilmer.Campos@GlcAmerica.com', 2)
GO
INSERT INTO PAYLESS_ReportesMails(MailDir, Typ) VALUES ('keyfireone@gmail.com', 2)
GO
INSERT INTO PAYLESS_ReportesMails(MailDir, Typ) VALUES ('ingrid.murcia@glcamerica.com', 2)
GO
--INSERT INTO PAYLESS_ReportesMails(MailDir) VALUES ('ó')
--GO
--insert into PAYLESS_Reportes(Periodo, FechaGen, Tipo) VALUES('13/05/2019', '02/05/2019 08:49', '0')
--go
select * from EdiDB.dbo.PAYLESS_Transporte
IF OBJECT_ID('PAYLESS_Transporte', 'U') IS NOT NULL 
	DROP TABLE PAYLESS_Transporte
GO
CREATE TABLE PAYLESS_Transporte(
	Id int IDENTITY(1,1) PRIMARY KEY,
	Transporte [nvarchar](128),
	ClienteId int
)
GO
--ALTER TABLE PAYLESS_Transporte
--ADD ClienteId int
--update EdiDB.dbo.PAYLESS_Transporte
--Set ClienteId = 385
--WHERE id = 46
GO
IF OBJECT_ID('PAYLESS_PeriodoTransporte', 'U') IS NOT NULL 
	DROP TABLE PAYLESS_PeriodoTransporte
GO
CREATE TABLE PAYLESS_PeriodoTransporte(
	Id int IDENTITY(1,1) PRIMARY KEY,
	Periodo [nvarchar](10),
	IdTransporte int
)
GO
--select * from AsyncStates
IF OBJECT_ID('AsyncStates', 'U') IS NOT NULL 
	DROP TABLE AsyncStates
GO
CREATE TABLE AsyncStates(
	Id int IDENTITY(1,1) PRIMARY KEY,
	Typ int,
	Val int,
	Maximum int,
	Mess varchar(4096),
	Fecha varchar(24),
	CodUser VARCHAR(128)
)
GO
--select * from ProductoUbicacion
IF OBJECT_ID('ProductoUbicacion', 'U') IS NOT NULL 
	DROP TABLE ProductoUbicacion
GO
CREATE TABLE ProductoUbicacion (
	Id int IDENTITY(1,1) PRIMARY KEY,
	Typ int,
	CodProducto VARCHAR(50),
	NomBodega VARCHAR(150),
	Rack int,
	NombreRack VARCHAR(150),
	Departamento VARCHAR(16),
	CodUser VARCHAR(128)
)
GO
--alter table ProductoUbicacion
--ADD CodUser VARCHAR(128)
--select * from WmsProductoExistencia
IF OBJECT_ID('WmsProductoExistencia', 'U') IS NOT NULL 
	DROP TABLE WmsProductoExistencia
GO
CREATE TABLE WmsProductoExistencia (
	Id int IDENTITY(1,1) PRIMARY KEY,
	BodegaId int,
	CodProducto VARCHAR(50),
	Existencia int,
	CodUser VARCHAR(128)
)
GO
CREATE INDEX IndexWmsProductoExistenciaCodProducto ON WmsProductoExistencia (CodProducto);
GO
CREATE INDEX IndexWmsProductoExistenciaCodUser ON WmsProductoExistencia (CodUser);
GO
--SELECT * FROM EdiDB.dbo.PaylessPedidosCpT
IF OBJECT_ID('PaylessPedidosCpT', 'U') IS NOT NULL 
	DROP TABLE PaylessPedidosCpT
GO
CREATE TABLE PaylessPedidosCpT (
	Id int IDENTITY(1,1) PRIMARY KEY,
	Producto VARCHAR(16),
	Talla VARCHAR(8),
	Lote VARCHAR(8),
	Categoria VARCHAR(256),
	Departamento VARCHAR(16),
	Cp VARCHAR(8)
)
GO
INSERT INTO EdiDB.dbo.PaylessPedidosCpT(Cp) VALUES ('A')
GO
INSERT INTO EdiDB.dbo.PaylessPedidosCpT(Departamento) VALUES ('9')
GO
INSERT INTO EdiDB.dbo.PaylessPedidosCpT(Departamento) VALUES ('10')
GO
INSERT INTO EdiDB.dbo.PaylessPedidosCpT(Departamento) VALUES ('11')
GO
IF OBJECT_ID('PaylessEncuestaResM', 'U') IS NOT NULL 
	DROP TABLE PaylessEncuestaResM
GO
--update PaylessEncuestaResM SET ClienteId = 385 where Id = 4
--select * from PaylessEncuestaResM
CREATE TABLE PaylessEncuestaResM (
	Id int IDENTITY(1,1) PRIMARY KEY,
	TiendaId VARCHAR(4),
	Pedido VARCHAR(50),
	Sdr VARCHAR(128),	
	CodUser VARCHAR(128),
	FechaCreacion VARCHAR(16),
	Typ int,
	Nombre VARCHAR(2048),
	ClienteId INT
)
GO
--ALTER TABLE PaylessEncuestaResM
--ADD ClienteId INT
GO
IF OBJECT_ID('PaylessEncuestaResDet', 'U') IS NOT NULL 
	DROP TABLE PaylessEncuestaResDet
GO
CREATE TABLE PaylessEncuestaResDet (
	Id int IDENTITY(1,1) PRIMARY KEY,
	IdM int,
	preg0 VARCHAR(32),
	preg2 bit,
	preg2a VARCHAR(128),
	preg2b VARCHAR(8),
	preg2c VARCHAR(8),
	preg3 bit,
	preg3a VARCHAR(128),
	preg4 bit,
	preg4a VARCHAR(128),
	preg5 bit,
	preg5a VARCHAR(128),
	preg6 bit,
	preg6a VARCHAR(128),
	preg7 bit,
	preg7a VARCHAR(128),
	preg8 bit,
	preg8a VARCHAR(128),
	preg9 bit,
	preg9a VARCHAR(128),
	preg10 bit,
	preg11 bit,
	preg12 bit,
	preg13 bit,
	preg14 bit,
	preg15 bit,
	preg16 bit,
	preg17 bit,
	preg17a VARCHAR(2028),
	preg18 VARCHAR(2028),
	preg19 bit
)
GO
--IF OBJECT_ID('PaylessEncuestaRepM', 'U') IS NOT NULL 
--	DROP TABLE PaylessEncuestaRepM
--GO
IF OBJECT_ID('PaylessEncuestaRepMM', 'U') IS NOT NULL 
	DROP TABLE PaylessEncuestaRepMM
GO
--select * from EdiDB.dbo.PaylessEncuestaRepMM order by Anio, Mes, WeekOfYear
CREATE TABLE PaylessEncuestaRepMM (
	Id int IDENTITY(1,1) PRIMARY KEY,
	Anio int,
	Mes int,	
	WeekOfYear int,	
	FechaI VARCHAR(16),
	FechaF VARCHAR(16),
	CantPedidos int,
	CantEncuestas int,
	CodUser VARCHAR(128),
	FechaCreacion VARCHAR(16),
	ClienteId INT
)
GO
--ALTER TABLE PaylessEncuestaRepMM
--ADD ClienteId INT
CREATE INDEX PaylessEncuestaRepMMAnio ON PaylessEncuestaRepMM (Anio);
CREATE INDEX PaylessEncuestaRepMMMes ON PaylessEncuestaRepMM (Mes);
GO
IF OBJECT_ID('PaylessEncuestaRepDet1', 'U') IS NOT NULL 
	DROP TABLE PaylessEncuestaRepDet1
GO
--select * from PaylessEncuestaRepM
CREATE TABLE PaylessEncuestaRepDet1 (
	Id int IDENTITY(1,1) PRIMARY KEY,
	IdM int,	
	TiendaId VARCHAR(4)
)
GO
CREATE INDEX PaylessEncuestaRepDet1IdM ON PaylessEncuestaRepDet1 (IdM);
GO
IF OBJECT_ID('PaylessEncuestaRepDet2', 'U') IS NOT NULL 
	DROP TABLE PaylessEncuestaRepDet2
GO
--select * from PaylessEncuestaRepM
CREATE TABLE PaylessEncuestaRepDet2 (
	Id int IDENTITY(1,1) PRIMARY KEY,
	IdM int,
	c0 bit,
	c1 bit,
	c2 bit,
	c3 bit,
	c4 bit,
	c5 bit,
	c6 bit,
	c7 bit,
	c8 bit,
	c9 bit,
	c10 bit,
	c11 bit,
	c12 bit,
	c13 bit,
	c14 bit,
	c15 bit,
	c16 bit,
	c17 bit,
	c18 bit
)
GO
CREATE INDEX PaylessEncuestaRepDet2IdM ON PaylessEncuestaRepDet2 (IdM);
GO
--select * from EdiDB.dbo.PaylessInvSnapshotM
IF OBJECT_ID('PaylessInvSnapshotM', 'U') IS NOT NULL 
	DROP TABLE PaylessInvSnapshotM
GO
CREATE TABLE PaylessInvSnapshotM (
	Id int IDENTITY(1,1) PRIMARY KEY,
	ClienteId int,
	Periodo VARCHAR(16),
	Cp VARCHAR(64),
	TotalWoman int,
	TotalMan int,
	TotalKids int,
	TotalAcc int,
	TotalSinCp int,
	TotalCp int,
	Total int,
	TotalSolicitado int,
	TotalDisponible int,
	AvaWomanQty int,
	AvaManQty int,
	AvaKidsQty int,
	AvaAccQty int
)
GO
ALTER TABLE EdiDB.dbo.PaylessInvSnapshotM
ADD AvaWomanQty int,
	AvaManQty int,
	AvaKidsQty int,
	AvaAccQty int
--alter table PaylessInvSnapshotM
--add ClienteId int
IF OBJECT_ID('PaylessInvSnapshotDet', 'U') IS NOT NULL 
	DROP TABLE PaylessInvSnapshotDet
GO
CREATE TABLE PaylessInvSnapshotDet (
	Id int IDENTITY(1,1) PRIMARY KEY,
	IdM int,
	BodegaId int,
	Bodega VARCHAR(150),
	TiendaId int,
	Tienda VARCHAR(256),
	WomanQty int,
	ManQty int,
	KidsQty int,
	AccQty int,	
	TotalSinCp int,
	TotalCp int,
	Total int,
	TotalSolicitado int,
	TotalDisponible int,
	AvaWomanQty int,
	AvaManQty int,
	AvaKidsQty int,
	AvaAccQty int
)
GO
ALTER TABLE EdiDB.dbo.PaylessInvSnapshotDet
ADD AvaWomanQty int,
	AvaManQty int,
	AvaKidsQty int,
	AvaAccQty int
GO
ALTER TABLE EdiDB.dbo.PaylessInvSnapshotDet
drop column AvaWomanQty,
	AvaManQty,
	AvaKidsQty,
	AvaAccQty
select * from EdiDb.dbo.PedidosExternosDel
IF OBJECT_ID('PedidosExternosDel', 'U') IS NOT NULL 
	DROP TABLE PedidosExternosDel
GO
CREATE TABLE PedidosExternosDel(
	Id int PRIMARY KEY,
	ClienteID int,	
	TiendaId int,	
	FechaPedido nvarchar(16) null,
	IdEstado int,
	FechaCreacion nvarchar(16),
	Periodo nvarchar(10) NULL,
	FechaUltActualizacion nvarchar(10) NULL,
	WomanQty int,
	ManQty int,
	KidQty int,
	AccQty int,
	WomanQtyT int,
	ManQtyT int,
	KidQtyT int,
	AccQtyT int,
	InvType varchar(4),
	FullPed bit,
	Divert bit,
	TiendaIdDestino int,
	TotalCP int,
	FechaBorrado nvarchar(16) null,
	CodUser VARCHAR(128),
	Observaciones TEXT
)
ALTER TABLE EdiDB.dbo.PedidosExternosDel
ADD Observaciones TEXT
alter table EdiDB.dbo.PedidosExternosDel
Add CodUser VARCHAR(128)
GO
--select * from PedidosDetExternosDel
IF OBJECT_ID('PedidosDetExternosDel', 'U') IS NOT NULL 
	DROP TABLE PedidosDetExternosDel
GO
CREATE TABLE PedidosDetExternosDel(
	Id int PRIMARY KEY,
	PedidoId int,
	CodProducto nvarchar(50),
	Producto nvarchar(1),
	CantPedir float
)
GO
IF OBJECT_ID('WmsInOut', 'U') IS NOT NULL 
	DROP TABLE WmsInOut
GO
--select * from EdiDB.dbo.WmsInOut
CREATE TABLE EdiDB.dbo.WmsInOut(
	Id int IDENTITY(1,1) PRIMARY KEY,
	TransaccionID int NOT NULL,
	NoTransaccion varchar(25) NULL,
	FechaTransaccion datetime NULL,
	IdTipoTransaccion varchar(3) NULL,
	TipoTransaccion varchar(7) NULL,
	PedidoId int NULL,
	BodegaId int NULL,
	NomBodega varchar(150) NULL,
	RegimenId int NULL,
	Regimen varchar(150) NULL,
	ClienteId int NULL,
	Nombre varchar(150) NULL,
	TipoIngreso varchar(3) NULL,
	Observacion varchar(max) NULL,
	EstatusId int NULL,
	Estatus varchar(100) NULL,
	CantEnt int NULL,
	CantSal int NULL,
	INFORME_ALMACEN varchar(100) NULL
)
GO
CREATE INDEX WmsInOutIdCliente ON WmsInOut (ClienteId);
CREATE INDEX WmsInOutBodegaId ON WmsInOut (BodegaId);
CREATE INDEX WmsInOutRegimenId ON WmsInOut (RegimenId);
GO
--select * from EdiDb.dbo.PaylessRutas
IF OBJECT_ID('PaylessRutas', 'U') IS NOT NULL 
	DROP TABLE PaylessRutas
GO
CREATE TABLE PaylessRutas(
	Id int IDENTITY(1,1) PRIMARY KEY,
	NumRuta int,
	Horario TEXT,
	ClienteID int,
	CambioHorario bit
)
G
--select * from EdiDb.dbo.Notificaciones
IF OBJECT_ID('Notificaciones', 'U') IS NOT NULL 
	DROP TABLE Notificaciones
GO
CREATE TABLE Notificaciones(
	Id int IDENTITY(1,1) PRIMARY KEY,
	CodUsr varchar(128),
	Mensaje TEXT
)
GO
--select * from EdiDb.dbo.TransaccionesTraslados
IF OBJECT_ID('TransaccionesTraslados', 'U') IS NOT NULL 
	DROP TABLE TransaccionesTraslados
GO
CREATE TABLE TransaccionesTraslados(
	Id int IDENTITY(1,1) PRIMARY KEY,
	TransaccionId int
)
GO
--select * from EdiDB.dbo.TransaccionesTraslados