USE EDIDB
GO
IF OBJECT_ID('IEnetUsers', 'U') IS NOT NULL 
	DROP TABLE IEnetUsers; 
CREATE TABLE IEnetUsers (
	Id INT PRIMARY KEY IDENTITY(1,1) not null,
	IdIEnetGroup INT not null,
	CodUsr NVARCHAR(128) not null,
	NomUsr NVARCHAR(128) not null,
	UsrPassword NVARCHAR(128) not null,
	ClienteID INT null,
	HashId NVARCHAR(128) null
)
GO
--select * from EdiDb.dbo.IEnetUsers
IF OBJECT_ID('IEnetGroups', 'U') IS NOT NULL 
	DROP TABLE IEnetGroups; 
GO
CREATE TABLE IEnetGroups (
	Id INT PRIMARY KEY IDENTITY(1,1) not null,
	Descr NVARCHAR(128)
)
GO
--select * from EdiDb.dbo.IEnetGroups
IF OBJECT_ID('IEnetAccesses', 'U') IS NOT NULL 
	DROP TABLE IEnetAccesses; 
GO
CREATE TABLE IEnetAccesses (
	Id INT PRIMARY KEY IDENTITY(1,1) not null,
	Descr NVARCHAR(128)
)
GO
--select * from EdiDb.dbo.IEnetAccesses
IF OBJECT_ID('IEnetGroupsAccesses', 'U') IS NOT NULL 
	DROP TABLE IEnetGroupsAccesses; 
GO
CREATE TABLE IEnetGroupsAccesses (
	Id INT PRIMARY KEY IDENTITY(1,1) not null,
	IdIEnetGroup INT not null,
	IdIEnetAccess INT not null
)
GO
--select * from EdiDb.dbo.IEnetGroupsAccesses
INSERT INTO IEnetGroups(Descr) VALUES ('Admins')
GO
INSERT INTO IEnetGroups(Descr) VALUES ('Bodega')
GO
INSERT INTO IEnetGroups(Descr) VALUES ('Lear')
GO
INSERT INTO IEnetGroups(Descr) VALUES ('Payless_Manager')
GO
INSERT INTO IEnetGroups(Descr) VALUES ('Payless_User')
GO
--select * from EdiDb.dbo.IEnetUsers
INSERT INTO EdiDb.dbo.IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(1, 'admin', 'Administrador total', 'Admin23', '1', 1432)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(2, 'RPERDOMO', 'RAMON PERDOMO', 'PERDOMO', '1', 1432)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(3, 'lear', 'LEAR', 'Lear123456', '1', 618)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(1, 'ingrid', 'Ingrid', 'ingrid123456', '1', 1432, 7374)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(4, 'Lucrecia.Calderon', 'Lucrecia Calderon', 'LCalderon198', '1', 1432)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(4, 'Eluany.Garcia', 'Eluany Garcia', 'EluanyGar515', '1', 1432)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(4, 'JuanJose.Garcia', 'Juan Jose Garcia', 'JuanJose.Garcia987', '1', 1432)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7365', '7365', 'Payless Shoe Source - Pricesmart SPS - 7365', '1', 1397)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7367', '7367', 'Payless Shoe Source - Mega Mall SPS Salida hacia la Lima - 7367', '1', 1398)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7370', '7370', 'Payless Shoe Source - Mall Multiplaza SPS - 7370', '1', 1399)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7370', '7371', 'Payless Shoe Source - Blvd del Norte Sps - 7371', '1', 1400)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7374', '7374', 'Payless Shoe Source - 1 era calle Contiguo a Farmacia Machi Progreso Yoro - 7374', '1', 1401)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7375', '7375', 'Payless Shoe Source - Mall Megaplaza La Ceiba - 7375', '1', 1402)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7377', '7377', 'Payless Shoe Source - 3era Avenida centro SPS - 7377', '1', 1403)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7378', '7378', 'Payless Shoe Source - 3 Y4 calle centro de Pto Cortes - 7378', '1', 1404)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7379', '7379', 'Payless Shoe Source - Esquina Opuesta supermercado Paico Siguatepeque - 7379', '1', 1405)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7382', '7382', 'Payless Shoe Source - Carretera Salida a Tela Mall MegaPlaza Progreso Yoro - 7382', '1', 1406)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7383', '7383', 'Payless Shoe Source - Mall Premier Comayagua - 7383', '1', 1407)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7385', '7385', 'Payless Shoe Source - City Mall SPS Avenida Circunvalacion - 7385', '1', 1408)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7392', '7392', 'Payless Shoe Source - Uniplaza Santa Rosa de Copan - 7392', '1', 1409)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7366', '7366', 'Payless Shoe Source - Colonia Florencia Sur contiguo a Pricesmart TGU - 7366', '1', 1410)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7368', '7368', 'Payless Shoe Source - 6 calle 4 y 5 avenida Comayaguela TGU - 7368', '1', 1411)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7369', '7369', 'Payless Shoe Source - Uniplaza Juticalpa - 7369', '1', 1412)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7372', '7372', 'Payless Shoe Source - Colonia Payaqui fte al Hotel Intercontinental Mall Multiplaza TGU - 7372', '1', 1413)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7373', '7373', 'Payless Shoe Source - Barrio El Centro Calle peatonal fte a Celtel TGU - 7373', '1', 1414)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7376', '7376', 'Payless Shoe Source - Blvd Centro America Plaza Miraflores 2do Nivel TGU - 7376', '1', 1415)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7380', '7380', 'Payless Shoe Source - Calle Vicente Williams contiguo a farmacia La Nueva Choluteca - 7380', '1', 1416)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7381', '7381', 'Payless Shoe Source - MetroMall TGU Blvd Fuerzas Armadas y Blvd Comunidad Europea TGU - 7381', '1', 1417)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7384', '7384', 'Payless Shoe Source - Cascadas Mall entre Blvd Fuerzas Armadas y Blvd Kuwait TGU - 7384', '1', 1418)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7387', '7387', 'Payless Shoe Source - Mall Premier Comayaguela Blvd del Norte - 7387', '1', 1419)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7388', '7388', 'Payless Shoe Source - City Mall TGU Vcolonia Las Torres TGU - 7388', '1', 1420)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7389', '7389', 'Payless Shoe Source - Unimall Choluteca , Choluteca - 7389', '1', 1421)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID) VALUES(5, '7386', '7386', 'Payless Shoe Source - Parqueo Los Proceres fte a restaurante Chillis Edif. Novacentro TGU - 7386', '1', 1422)
GO
--select * from EdiDB.dbo.IEnetUsers
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID, TiendaId) VALUES(5, '7393', '7393 - Payless', '-187', '1', 1432, 7393)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID, TiendaId) VALUES(5, '7650', '7650 - Payless', '-167', '1', 1432, 7650)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID, TiendaId) VALUES(1, 'adminFr', 'Administrador total', 'AdminFr504', '1', 1432, 7374)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID, TiendaId) VALUES(1, 'JosueQu', 'Administrador total', 'JosueQ246', '1', 1432, 7378)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID, TiendaId) VALUES(1, 'PERDOMO', 'Administrador total', 'RPERDOMO46', '1', 1432, 7378)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID, TiendaId) VALUES(1, 'Alice', 'Administrador total', 'Alice1405', '1', 1432, 7378)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID, TiendaId) VALUES(1, 'Belinda', 'Administrador total', 'Belu63', '1', 1432, 7378)
GO
INSERT INTO IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID, TiendaId) VALUES(1, 'ruben.calix', 'Administrador total', 'ruben.calix.64', '1', 1432, 7378)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID, TiendaId) VALUES(1, 'Ricardo.Galeano', 'Administrador total', 'Ricardo.Galeano.64', '1', 1432, 7378)
GO
---503
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID, TiendaId) VALUES(1, 'Salvador.Romero', 'Administrador total', 'Salvador.Romero.2315', '1', 385, 7665)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID, TiendaId) VALUES(1, 'Erick.Palacios', 'Administrador total', 'Erick.Palacios.2145', '1', 385, 7665)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID, TiendaId) VALUES(1, 'Porfirio.Viera', 'Administrador total', 'Porfirio.Viera.$', '1', 385, 7665)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID, TiendaId) VALUES(1, 'Manuel.Berrios', 'Administrador total', 'Manuel.Berrios.842', '1', 385, 7665)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID, TiendaId) VALUES(1, 'Marco.Urbina', 'Administrador total', 'Marco.Urbina.1583', '1', 385, 7665)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, NomUsr, UsrPassword, HashId, ClienteID, TiendaId) VALUES(1, 'Eduardo.Oviedo', 'Administrador total', 'Eduardo.Oviedo.6835', '1', 385, 7665)
GO 
-------503
select * from EdiDB.dbo.IEnetUsers where ClienteID = 385
select * from EdiDB.dbo.IEnetUsers order by id desc
--delete from EdiDB.dbo.IEnetUsers where ClienteId = 385
--delete from EdiDB.dbo.IEnetUsers where id > 86
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7650', '-456', 'Payless Shoe Source - Galerias - 7650', 385, '1', 7650)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7651', '547', 'Payless Shoe Source - Los Heroes - 7651', 385, '1', 7651)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7652', '789', 'Payless Shoe Source - Santa Elena - 7652', 385, '1', 7652)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7653', '426', 'Payless Shoe Source - San Luis - 7653', 385, '1', 7653)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7657', '186', 'Payless Shoe Source - Metrocentro S.S. 4a Etapa - 7657', 385, '1', 7657)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7658', '742', 'Payless Shoe Source - Unicentro Lourdes - 7658', 385, '1', 7658)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7659', '167', 'Payless Shoe Source - Unicentro Altavista - 7659', 385, '1', 7659)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7661', '127', 'Payless Shoe Source - Metrocentro Sonsonate - 7661', 385, '1', 7661)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7662', '345', 'Payless Shoe Source - Plaza Metropolis - 7662', 385, '1', 7662)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7663', '975', 'Payless Shoe Source - Metrocentro Santa Ana - 7663', 385, '1', 7663)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7664', '-125', 'Payless Shoe Source - Plaza Merliot - 7664', 385, '1', 7664)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7665', '-148', 'Payless Shoe Source - Apopa - 7665', 385, '1', 7665)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7666', '984', 'Payless Shoe Source - Ruben Dario - 7666', 385, '1', 7666)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7667', '651', 'Payless Shoe Source - Metrocentro 11a Etapa - 7667', 385, '1', 7667)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7668', '872', 'Payless Shoe Source - San Miguel Centro - 7668', 385, '1', 7668)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7669', '235', 'Payless Shoe Source - Metrocentro San Miguel - 7669', 385, '1', 7669)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7670', '458', 'Payless Shoe Source - Plaza Mundo 1ra etapa - 7670', 385, '1', 7670)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7671', '658', 'Payless Shoe Source - Plaza Mundo 5ta etapa - 7671', 385, '1', 7671)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7673', '812', 'Payless Shoe Source - Santa Ana Centro - 7673', 385, '1', 7673)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7675', '972', 'Payless Shoe Source - Zacatecoluca - 7675', 385, '1', 7675)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7676', '184', 'Payless Shoe Source - Usulutan Centro - 7676', 385, '1', 7676)
GO
INSERT INTO EdiDB.dbo.IEnetUsers(IdIEnetGroup, CodUsr, UsrPassword, NomUsr, ClienteID, HashId, TiendaId) 
VALUES(5, '7677', '647', 'Payless Shoe Source - Multiplaza - 7677', 385, '1', 7677)
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Login')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Admin_Usuarios')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Admin_Grupos')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Admin_Permisos')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Admin_Grupos_Permisos')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Logs')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Admin_Pedidos_Lear')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Admin_Pedidos_Payless')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Admin_Confirmacion_Lear')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Admin_Confirmacion_Lear_Enviar_NotificaciónEdi')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Admin_CargaExcel_Payless')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Admin_ExcelConsolidado_Payless')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Admin_Payless_Divert')
GO
--------------------------
INSERT INTO IEnetAccesses(Descr) VALUES ('Usuario_CargaEscaners_Payless')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Usuario_HacerPedidos_Payless')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Usuario_Ordenes_Payless')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Usuario_Pedidos_WMS')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Usuario_ReportesSemanales_Payless')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Usuario_Ayuda_Lear')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Usuario_Inv_Payless_Tiendas')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Admin_Payless_Temporadas')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Usuario_Payless_Encuesta')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Admin_Payless_ReporteEncuestasRes')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Admin_Payless_SnapshotInvPayless')
GO
INSERT INTO IEnetAccesses(Descr) VALUES ('Usuario_Payless_EncuestaConductor')
GO
--update EdiDB.dbo.IEnetAccesses SET Descr = 'Admin_Payless_SnapshotInvPayless' where Id = 24
--select * from EdiDB.dbo.IEnetAccesses
delete from IEnetAccesses where id = 24
INSERT INTO IEnetGroupsAccesses(IdIEnetGroup, IdIEnetAccess)
SELECT 1, Id FROM IEnetAccesses
GO
--SELECT * FROM EdiDb.dbo.IEnetAccesses
--INSERT INTO IEnetGroupsAccesses(IdIEnetGroup, IdIEnetAccess)
--SELECT 2, Id FROM IEnetAccesses WHERE Id > 11
--union 
--SELECT 2, Id FROM IEnetAccesses WHERE Id  = 1
--GO