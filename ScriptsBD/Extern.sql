.trans
saddasdasd
select * from wms_test_29_01_2019.dbo.Paises where NomPais like'%pana%'
--487	TIENDAS CARRION, S.A. DE C.V.(TRANSITO A GUATEMAL)
select * from wms.dbo.Clientes with(nolock) where nombre like '%payl%' OR ClienteID = 7667 order by ClienteID asc
select * from edidb.dbo.IEnetUsers where Id > 4 order by Id desc
select * from edidb.dbo.IEnetUsers where ClienteId = 1432 order by Id desc
select * from edidb.dbo.IEnetUsers order by CodUsr
select * from edidb.dbo.IEnetUsers where HashId like '%250920%' order by HashId desc
select * from edidb.dbo.IEnetGroupsAccesses	
select * from edidb.dbo.IEnetGroups
select * from wms.dbo.paises where nompais like'%mex%'
select * from edidb.dbo.IEnetAccesses
--delete from edidb.dbo.IEnetUsers where Id = 45
--delete from edidb.dbo.IEnetAccesses where Id = 24
--delete from edidb.dbo.IEnetGroupsAccesses where Id = 46
select * from edidb.dbo.IEnetGroupsAccesses
select * from EdiDb.dbo.PaylessPedidosCpT
--insert into EdiDb.dbo.PaylessPedidosCpT(Producto, Talla, Lote, Categoria, Departamento, Cp)
--select Producto, Talla, Lote, Categoria, Departamento, Cp from EdiDb.dbo.PaylessPedidosCpT2
--delete from EdiDb.dbo.PaylessPedidosCpT where CP is null
select * from EdiDB.dbo.PaylessInvSnapshotM order by Id Desc
select * from EdiDB.dbo.PaylessInvSnapshotM where ClienteId = 385 order by Id Desc
--delete from EdiDB.dbo.PaylessInvSnapshotM where Id > 202
--delete from EdiDB.dbo.PaylessInvSnapshotDet where IdM > 202
select * from EdiDB.dbo.PaylessInvSnapshotDet where AvaWomanQty is not null order by TiendaId, BodegaId
select * from EdiDB.dbo.PaylessInvSnapshotDet where IdM = 219 and TiendaId = 7650
select * from EdiDB.dbo.PaylessInvSnapshotDet where IdM = 223
select * from EdiDB.dbo.PaylessInvSnapshotDet where BodegaId in(9)
--delete from EdiDB.dbo.PaylessInvSnapshotDet where BodegaId = 9

select * from EdiDB.dbo.PedidosExternos  order by id desc
select * from EdiDB.dbo.PedidosExternos where id = 817
select * from EdiDB.dbo.PedidosExternosDel order by id desc
select * from EdiDB.dbo.PedidosExternosDel where ClienteId = 385 order by id desc
--delete from EdiDB.dbo.PedidosExternosDel where ClienteId = 385
select * from EdiDB.dbo.PedidosDetExternos where PedidoId = 822
--delete from EdiDB.dbo.PedidosExternos where Id in (814, 824)
--delete from EdiDB.dbo.PedidosDetExternos where PedidoId in (814, 824)
select * from EdiDB.dbo.PedidosExternos where PedidoWMS = '128771'
select * from EdiDB.dbo.PedidosDetExternos  order by id desc
--update EdiDB.dbo.PedidosExternos SET FechaPedido = '21/10/2019 10:00' where Id in (724)
select sum(P.AccQty) from EdiDB.dbo.PedidosExternos P where P.ClienteId = 1432 AND P.PedidoWMS IS NULL and TiendaId = 7365
select sum(P.WomanQty) Tw, sum(P.ManQty) Tm, sum(P.KidQty) Tk, sum(P.AccQty) Ta from EdiDB.dbo.PedidosExternos P where P.ClienteId = 1432 AND P.PedidoWMS IS NULL and TiendaId = 7372
select * from EdiDB.dbo.PedidosExternos P where P.ClienteId = 1432 AND P.PedidoWMS IS NULL and TiendaId = 7372
--94	25	81	0
select sum(P.WomanQty) + sum(P.ManQty) + sum(P.KidQty) + sum(P.AccQty) from EdiDB.dbo.PedidosExternos P where P.ClienteId = 1432 AND P.PedidoWMS IS NULL and TiendaId = 7372
-- W 1, M 2, K 3, A 4
select sum(P.WomanQty) + sum(P.ManQty) + sum(P.KidQty) + sum(P.AccQty) from EdiDB.dbo.PedidosExternos P where P.ClienteId = 1432 AND P.PedidoWMS IS NULL and TiendaIdDestino = 7372

--select CONVERT(DATETIME, '2019-08-29', 108)
select Pe.* FROM EdiDB.dbo.PedidosExternos Pe, EdiDB.dbo.PedidosDetExternos Pde where Pde.PedidoId = Pe.Id AND Pe.ClienteID = 1432 AND Pe.PedidoWMS IS NULL 

select * from wms.dbo.Regimen
select * from wms.dbo.Bodegas b where BodegaId in (81, 82, 77, 4, 9, 4)
delete from EdiDB.dbo.PaylessInvSnapshotM  where Id = 22
delete from EdiDB.dbo.PaylessInvSnapshotDet  where IdM = 22
--update EdiDB.dbo.PaylessInvSnapshotDet
--SET Bodega = 'GLC-TGU' where BodegaId = 82
--update EdiDB.dbo.PaylessInvSnapshotM SET ClienteId = 1432
--truncate table EdiDB.dbo.PaylessInvSnapshotDet

select * from wms.[dbo].[DocumentosxTransaccion] order by IdDocxTransaccion DESC
select * from wms.[dbo].[DocumentoxTipoTransaccion]
select * from wms.[dbo].Estatus
--delete from edidb.dbo.IEnetGroupsAccesses where Id = 40
--37	4	19
--Hbbb2fdd1866c4212a9f99a0d040620190936
--PAYLESS SHOE SOURCE, HONDURAS
--SAN PEDRO SULA, HONDURAS
--select max(ClienteID) + 1 from wms_test.dbo.Clientes
--INSERT INTO wms_test.dbo.Clientes(ClienteID, Nombre, NIT, NRC, Direccion, Telefono, correo, DiasPago, Comentario, EstatusID, Contacto, TelefonoContacto, EmailContacto, orderEmailNotifica)
--VALUES(1432, 'PAYLESS SHOE SOURCE, HONDURAS', 'S/N', 'S/N', 'SAN PEDRO SULA, HONDURAS', 'S/N', 'S/N', '', '', 6, 'Lucrecia Calderon', 'S/N', null, null)
--GLOBAL COMMUNICATIONS EL SALVADOR			CALLE SAN ANTONIO ABAD #3540
select * from wms.dbo.Clientes where ClienteID between 273 and 274
select * from wms_test.dbo.Inventario where ClienteID = 610
--618 es LEAR
-- >= 1397 es Payless
-- 2 4 92
select * from wms.dbo.usrsystem where CodUsr in (2, 4, 92)
select * from wms.dbo.usrsystem where idusr like'%ainventariot%' or nomusr like'%ainventariot%'
select * from wms.dbo.Producto where CodProducto like '7650826017%' and ClienteID = 385

select * from wms.dbo.Producto P, EdiDB.dbo.PAYLESS_ProdPrioriArchDet D
where P.CodProducto = D.barcode
and ClienteId not in (385, 1432)

select * from wms.dbo.Producto P, EdiDB.dbo.PAYLESS_ProdPrioriArchDet D
where P.CodProducto = D.barcode
and ClienteId in (1432)
and P.CodProducto like '7%'

select distinct P.CodProducto from wms.dbo.Producto P
where P.CodProducto not in (select distinct D.barcode 
from EdiDB.dbo.PAYLESS_ProdPrioriArchDet D,
EdiDB.dbo.PAYLESS_ProdPrioriArchM M
where M.Id = D.IdM
and M.ClienteId = 1432)
and P.ClienteId = 1432
and P.CodProducto like '73%'

select count(*) from wms.dbo.ItemInventario Ii, 
wms.dbo.DetalleTransacciones Dt,
wms.dbo.Transacciones T
--EdiDB.dbo.PAYLESS_ProdPrioriArchDet D, 
--EdiDB.dbo.PAYLESS_ProdPrioriArchM M
where 
--Ii.CodProducto = D.barcode
Dt.InventarioID = Ii.InventarioID
and T.TransaccionID = Dt.TransaccionID
and T.IDTipoTransaccion IN ('IN')
--and M.Id = D.IdM
and T.ClienteId = 1432
and Ii.CodProducto like '7%'
and Ii.Existencia > 0
--94.884



select count(*) from EdiDb.dbo.temp123 
delete from EdiDb.dbo.temp123 where v in (
	select distinct CodProducto from wms.dbo.SysTempSalidas where CodProducto like '76%'
)
select distinct v from EdiDb.dbo.temp123 where v not in (
select distinct codproducto from wms.dbo.Producto where ClienteID = 385 and CodProducto like'76%')

select * from wms.dbo.Inventario where InventarioId in (1987708, 1987848)
select * from wms.dbo.ItemInventario where CodProducto = '7651800391'
select distinct * from wms.dbo.ItemInventario where CodProducto like '7659855387%' and Existencia > 0
select * from wms.dbo.DetalleTransacciones dt where dt.InventarioID in (2015293)
select * from wms.dbo.Transacciones where TransaccionID in (131622)
select * from wms.dbo.SysTempSalidas where CodProducto like '7651800391%' order by TransaccionID desc
--7665876174
--7665876295
--7665876328
--7665876345
--7665876396
--7665876453
--7665876622
--7665876635
select * from wms.dbo.Producto p
JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet d
	ON d.Barcode = p.CodProducto
where
p.CodProducto like '7665%' and ClienteID = 385
AND p.CodProducto NOT IN (select s.CodProducto from wms.dbo.SysTempSalidas s where s.CodProducto like '7665%')
select top 1000000 * from wms.dbo.Producto P where ClienteID = 385
select * from wms.dbo.ItemInventario where CodProducto like '7675870426' and color  = 'DRYU 961708-5'
select * from wms.dbo.Inventario where InventarioId in (1987708, 1987848)
--Did: 52004, Cd 1902347
select * from EdiDB.dbo.WmsProductoExistencia where BodegaId = 81
SELECT * FROM EdiDB.dbo.ProductoUbicacion
select * from EdiDB.dbo.PAYLESS_ReportesMails order by Id
select * from EdiDB.dbo.AsyncStates
select * from EdiDB.dbo.WmsInOut
--delete from EdiDB.dbo.AsyncStates where Id = 29
select * from EdiDB.dbo.PAYLESS_Reportes order by id desc
select * from EdiDB.dbo.PAYLESS_ReportesDet where IdM = 104
--update EdiDB.dbo.PAYLESS_Reportes SET ClienteId =  1432
--delete from EdiDB.dbo.PAYLESS_Reportes where id in (96, 100)
--delete from EdiDB.dbo.PAYLESS_ReportesDet where idm in (96, 100)
--update EdiDB.dbo.PAYLESS_Reportes SET FechaGen = '21/07/2019 07:02' WHERE Id = 72
select * from EdiDB.dbo.PaylessEncuestaResM
select * from EdiDB.dbo.PaylessEncuestaResDet
--delete from EdiDB.dbo.PaylessEncuestaResDet where IdM = 1
SELECT DATEPART(wk, GETDATE())
SELECT DATEPART(wk, '2019-01-01')
--truncate table EdiDB.dbo.PaylessEncuestaRepMm
--truncate table EdiDB.dbo.PaylessEncuestaRepDet1
--truncate table EdiDB.dbo.PaylessEncuestaRepDet2
select * from EdiDB.dbo.PaylessEncuestaRepMm order by Anio, Mes, WeekOfYear
select * from EdiDB.dbo.PaylessEncuestaRepMm where id = 3
select * from EdiDB.dbo.PaylessEncuestaRepDet1
select * from EdiDB.dbo.PaylessEncuestaRepDet2
--delete from EdiDB.dbo.PaylessEncuestaRepDet2 where IdM = 3
select * from EdiDB.dbo.PAYLESS_Reportes where Periodo = '09/06/2019'
select * from EdiDB.dbo.PAYLESS_ReportesDet where IdM = 59 order by Id
SELECT * FROM EdiDB.dbo.PedidosExternos order by FechaCreacion DESC
SELECT * FROM EdiDB.dbo.PedidosExternos order by id DESC --7382
SELECT * FROM EdiDB.dbo.PedidosExternos where IdEstado = 4
SELECT * FROM EdiDB.dbo.PedidosExternos where id in (433)
SELECT * FROM EdiDB.dbo.PedidosExternos where TiendaId in (7371) order by id desc
update EdiDB.dbo.PedidosExternos SET IdEstado = 4 where Id = 306
--update EdiDB.dbo.PedidosExternos SET FechaPedido = '26/08/2019 07:30' where id = 433
--delete from EdiDB.dbo.PedidosDetExternos WHERE PedidoId = 371
SELECT * FROM EdiDB.dbo.PedidosExternos order by FechaPedido DESC
SELECT * FROM EdiDB.dbo.PedidosExternos where PedidoWms = 73470 -- H 23, N 40
SELECT * FROM EdiDB.dbo.PedidosDetExternos where PedidoId = 265
SELECT * FROM EdiDB.dbo.PedidosExternos where TiendaId = 7389

SELECT * FROM EdiDB.dbo.PedidosExternos where TiendaId = 7389
SELECT * FROM EdiDb.dbo.PedidosExternos_Bkp where TiendaId = 7372 AND SUBSTRING(FechaPedido, 1, 10) = '02/07/2019'
SELECT * FROM EdiDb.dbo.PedidosExternos where TiendaId = 7382 AND SUBSTRING(FechaPedido, 1, 10) = '04/07/2019'
SELECT * INTO EdiDb.dbo.PedidosExternos_Bkp FROM EdiDB.dbo.PedidosExternos 
SELECT * FROM EdiDB.dbo.PedidosExternos where TiendaId = 7368 AND Id = 122
SELECT * FROM EdiDB.dbo.PedidosExternos where FullPed = 
SELECT * FROM EdiDB.dbo.PedidosExternos order by id desc
SELECT * FROM EdiDB.dbo.PedidosExternos where SUBSTRING(FechaPedido, 1, 10) = '02/07/2019'
SELECT * FROM EdiDB.dbo.PedidosDetExternos where PedidoId = 277
select * from EdiDb.dbo.PedidosExternosDel
select * from EdiDb.dbo.PedidosDetExternosDel
--truncate table EdiDb.dbo.PedidosExternosDel
--truncate table EdiDb.dbo.PedidosDetExternosDel

SELECT * FROM EdiDB.dbo.WmsProductoExistencia
where CodUser = 'FailCon'
AND CodProducto NOT IN (
SELECT CodProducto FROM EdiDB.dbo.PedidosDetExternos where PedidoId = 235
)
SELECT * FROM EdiDB.dbo.PAYLESS_ProdPrioriM where Periodo = '06/09/2019'
SELECT * FROM EdiDB.dbo.PAYLESS_ProdPrioriM where ClienteId = 385
--delete FROM EdiDB.dbo.PAYLESS_ProdPrioriM where ClienteId = 385
SELECT * FROM EdiDB.dbo.PAYLESS_ProdPrioriM order by id desc
SELECT * FROM EdiDB.dbo.PAYLESS_ProdPrioriDet WHERE IdPAYLESS_ProdPrioriM = 62
--delete FROM EdiDB.dbo.PAYLESS_ProdPrioriDet WHERE IdPAYLESS_ProdPrioriM > 63
SELECT * FROM EdiDB.dbo.PAYLESS_ProdPrioriM 
SELECT distinct Barcode, Categoria FROM EdiDB.dbo.PAYLESS_ProdPrioriDet where Barcode like '7650%' order by Categoria
SELECT distinct Barcode FROM EdiDB.dbo.PAYLESS_ProdPrioriDet where Barcode like '7650%' order by Barcode
--update EdiDb.dbo.PAYLESS_ProdPrioriDet SET Categoria = 'DAMAS' WHERE Categoria = 'WOMEN'
--delete from EdiDB.dbo.PAYLESS_ProdPrioriDet where IdPAYLESS_ProdPrioriM = 29
--delete from EdiDB.dbo.PAYLESS_ProdPrioriM where ClienteId = 385
SELECT distinct CodProducto FROM wms.dbo.Producto WHERE CodProducto like '7650%'
SELECT * FROM wms.dbo.Producto WHERE CodProducto like '7651800391%'
SELECT * FROM wms.dbo.ItemInventario WHERE CodProducto like '7650%'
SELECT * FROM wms.dbo.ItemInventario WHERE CodProducto like '7650%' and Existencia > 0
select * from EdiDB.dbo.PAYLESS_Tiendas
--update  EdiDB.dbo.PAYLESS_Tiendas SET BodegaId = null where ClienteId = 385
---
--DELETE FROM EdiDB.dbo.PedidosExternos where Id in (411, 413)
--DELETE FROM EdiDB.dbo.PedidosDetExternos where PedidoId in (411, 413)
--7373 265
--delete from EdiDB.dbo.PedidosExternos where Id in (205, 206)
--delete from EdiDB.dbo.PedidosDetExternos where PedidoId in (205, 206)
SELECT Ped.*, D.* 
FROM EdiDB.dbo.PedidosDetExternos Ped
JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D
	ON D.Barcode = Ped.CodProducto
where Ped.PedidoId = 265
select * from EdiDB.dbo.PAYLESS_ProdPrioriDet D where D.Barcode like '7659855387'
select * from EdiDB.dbo.WmsProductoExistencia where CodUser = 'Admin'
SELECT Wpe.*, D.* 
FROM EdiDB.dbo.WmsProductoExistencia Wpe
JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D
	ON D.Barcode = Wpe.CodProducto
where Wpe.CodUser = 'Admin'
and D.BarCode like'7650825973%'

EXEC EdiDb.dbo.SP_GetSetExistenciasByCliente 1432, 'Admin'
select distinct
SUBSTRING(Barcode, 1, 4) Tienda,
BarCode,
Categoria,
CP,
Departamento
from EdiDB.dbo.PAYLESS_ProdPrioriDet D 
JOIN EdiDB.dbo.WmsProductoExistencia Pe
	ON Pe.CodProducto = D.Barcode
where (D.CP = 'A'
OR D.Departamento in ('9', '10', '11'))

--update EdiDB.dbo.PedidosExternos SET FechaPedido = '28/06/2019 07:00' where Id = 122
--truncate table EdiDB.dbo.PAYLESS_Reportes
--truncate table EdiDB.dbo.PAYLESS_ReportesDet
--delete from EdiDB.dbo.AsyncStates where Id = 2
--delete from EdiDB.dbo.PAYLESS_Reportes where Id in (70)
--delete from EdiDB.dbo.PAYLESS_ReportesDet where IdM in (70)
select * from EdiDB.dbo.EdiComs order by Id DESC

select * from wms_test_29_01_2019.dbo.Transacciones where pais_orig = 90
select * from wms_test_29_01_2019.dbo.usrsystem
SELECT *  FROM [EdiDB].[dbo].[UsuariosExternos]
select * from edidb.dbo.IEnetUsers where Id > 4
select @@servicename
--update edidb.dbo.IEnetUsers SET ClienteID = 385, NomUsr = 'EL Salv.' where Id = 3
--UPDATE [UsuariosExternos] SET CodUsr = 'paylesstest'
-- 385
--63232
--1967856447
exec SP_GetExistenciasExtern 618

SELECT * FROM EdiDB.dbo.PedidosExternos order by ID DESC
SELECT * FROM EdiDB.dbo.PedidosExternos order by TiendaId, FechaPedido
SELECT * FROM EdiDB.dbo.PedidosExternos where Id = 202
SELECT * FROM EdiDB.dbo.PedidosDetExternos where PedidoId = 174
--update EdiDB.dbo.PedidosExternos SET FullPed = 1 where Id = 151
select * from edidb.dbo.IEnetUsers where Id > 4
--16	1432	7384	04/06/2019 08:00	2	31/05/2019 11:45	NULL	NULL	100	19	0	0	fifo
SELECT FechaPedido, REPLACE(FechaPedido, '03/06', '04/06') FROM EdiDB.dbo.PedidosExternos
SELECT * FROM EdiDB.dbo.PedidosExternos where SUBSTRING(FechaPedido, 1, 10) = '03/06/2019'
--update EdiDB.dbo.PedidosExternos SET FechaPedido = '08/07/2019 07:30' where Id = 202
--delete from EdiDB.dbo.PedidosExternos where id in (210)
--delete from EdiDB.dbo.PedidosDetExternos where PedidoId in (210)
--update PedidosExternos SET FechaPedido = '08/05/2019 16:00', IdEstado = 2 where Id = 1
--delete from EdiDB.dbo.PedidosExternos where Id > 15
--truncate table EdiDB.dbo.PedidosExternos
--truncate table EdiDB.dbo.PedidosDetExternos

--SELECT * INTO PedidosDetExternos2 from EdiDb.dbo.PedidosDetExternos
SELECT * FROM EdiDB.dbo.PedidosDetExternos where PedidoId = 12
SELECT * FROM EdiDB.dbo.PedidosDetExternos where CodProducto like '7650%'
order by CodProducto, CantPedir
select * from EdiDB.dbo.PAYLESS_ProdPrioriDet where Categoria = 'ACCESORIOS' and departamento in ('9', '10', '11')
select * from EdiDB.dbo.PAYLESS_ProdPrioriDet where SUBSTRING(Barcode, 1, 4) = '7393' and cp = 'A' and departamento in ('9', '10', '11')
select distinct barcode from EdiDB.dbo.PAYLESS_ProdPrioriDet where SUBSTRING(Barcode, 1, 4) = '7393' and cp != 'A' and departamento in ('9', '10', '11') AND Categoria = 'DAMAS'
select * from EdiDB.dbo.PAYLESS_ProdPrioriM
select * from EdiDB.[dbo].[PAYLESS_PeriodoTransporte] order by id desc
select * from EdiDB.[dbo].[PAYLESS_PeriodoTransporte] where IdTransporte = 102
--delete from EdiDB.[dbo].[PAYLESS_PeriodoTransporte]  where Id = 109
--UPDATE EdiDB.[dbo].[PAYLESS_PeriodoTransporte] SET Periodo = '06/07/2019' where id = 36
--use edidb
--create table temp123(
--	v varchar(16)
--)
--insert into temp123(v) values('');
select * from EdiDB.dbo.temp123
select * from wms.dbo.exportador where nombrexp like'%payle%'
select * from EdiDB.dbo.PAYLESS_ProdPrioriDet Ppd where Ppd.[IdPAYLESS_ProdPrioriM] = 16
select * from EdiDB.dbo.PAYLESS_Transporte order by id desc
select * from EdiDB.dbo.PAYLESS_Transporte where ClienteId = 385 order by Transporte desc
--delete from EdiDB.dbo.PAYLESS_Transporte where ClienteId = 385
select * from EdiDB.dbo.PAYLESS_ProdPrioriM order by id desc
select * from EdiDB.dbo.PAYLESS_ProdPrioriM where ClienteId = 385
select * from EdiDB.dbo.PAYLESS_ProdPrioriM where ClienteId = 385 order by id desc
select * from EdiDB.dbo.PAYLESS_ProdPrioriDet where lote like '569862'
select * from EdiDB.dbo.PAYLESS_ProdPrioriDet where barcode like '7393804732%'
select * from EdiDB.dbo.PAYLESS_ProdPrioriDet where IdTransporte = 79
select * from EdiDB.dbo.PAYLESS_ProdPrioriDet where IdPAYLESS_ProdPrioriM = 84
select count(*) from (select distinct barcode from EdiDB.dbo.PAYLESS_ProdPrioriDet where IdPAYLESS_ProdPrioriM > 64) a
--delete from EdiDB.dbo.PAYLESS_ProdPrioriDet where Barcode Like '76%' --3703
--delete from EdiDB.dbo.PAYLESS_ProdPrioriDet where IdPAYLESS_ProdPrioriM in (61)
--delete from EdiDB.dbo.PAYLESS_ProdPrioriM where Id in (61)
select * from EdiDB.dbo.PAYLESS_ProdPrioriArchM order by Id desc
select * from EdiDB.dbo.PAYLESS_ProdPrioriArchM where Id = 46
select * from EdiDB.dbo.PAYLESS_ProdPrioriArchM where ClienteId = 385
--delete from EdiDB.dbo.PAYLESS_ProdPrioriArchM where ClienteId = 385
select * from EdiDB.dbo.PAYLESS_ProdPrioriArchM where ClienteId = 1432 order by id desc
select * from EdiDB.dbo.PAYLESS_ProdPrioriArchDet where IdM = 110
select * from EdiDB.dbo.PAYLESS_ProdPrioriArchDet where Barcode = '7653854583'
select * from EdiDB.dbo.PAYLESS_ProdPrioriArchDet
select * from EdiDB.dbo.PAYLESS_ProdPrioriArchDet where IdM = 139
delete from EdiDB.dbo.PAYLESS_ProdPrioriArchDet where IdM > 110
select * from EdiDB.dbo.PAYLESS_ProdPrioriArchDet where Barcode like '%7651800143%' order by IdM
7664828212
--delete from EdiDB.dbo.PAYLESS_ProdPrioriArchDet where IdM in (117)
--delete from EdiDB.dbo.PAYLESS_ProdPrioriArchM where Id in (117)
--delete from EdiDB.dbo.PAYLESS_ProdPrioriArchDet where IdM > 115
--delete from EdiDB.dbo.PAYLESS_ProdPrioriArchM where Id > 97
--delete from EdiDB.dbo.PAYLESS_ProdPrioriDet where IdPAYLESS_ProdPrioriM = 42
--delete from EdiDB.dbo.PAYLESS_ProdPrioriM where Id = 42
select * from EdiDB.dbo.PAYLESS_ProdPrioriArchDet where IdM = 48 and barcode like '%7665876998%'
--update EdiDB.dbo.PAYLESS_ProdPrioriArchDet SET Barcode = 'Hilmer1409' where Id = 137801
--update EdiDB.dbo.PAYLESS_ProdPrioriArchM SET PorcValidez = null where Id = 64
--delete from EdiDB.dbo.PAYLESS_ProdPrioriArchM WHERE Id = 65
--delete from EdiDB.dbo.PAYLESS_ProdPrioriArchDet WHERE IdM = 65
--where Periodo = '31/08/2019'
--update EdiDB.dbo.PAYLESS_ProdPrioriArchM SET Periodo = '31/07/2019' where Periodo = '31/08/2019'
select * from EdiDB.dbo.PAYLESS_ProdPrioriArchDet where barcode = '7373824407'
select DISTINCT Talla, Producto from EdiDB.dbo.PAYLESS_ProdPrioriDet order by 2
select DISTINCT Talla, Producto from EdiDB.dbo.PAYLESS_ProdPrioriDet order by 2
--7372854892
--7377821116
--7379885086
--7385876677
--7368865732
--7378888592
--7383810289
--7384817053
--7385876330
select * from wms.dbo.DtllPedido where CodProducto like '7371802367'
select * from wms.dbo.Transacciones where PedidoId = 75771
select * from wms.dbo.DtllPedido where PedidoID = 71808
select * from EdiDB.dbo.PAYLESS_ProdPrioriDet WHERE BarCode = '7383810131'
select * from EdiDB.dbo.PAYLESS_ProdPrioriM where Id = 4
select * from EdiDb.dbo.Payless_Transporte
select * from EdiDb.dbo.Payless_Transporte where ClienteId = 385
select * from EdiDb.dbo.Payless_Transporte where Transporte = 'SMLU8506517'


7372854892 -- MAYO 2019 SPS

7372854892 -- SEPT 2019 SPS

--repetidos payless original
select distinct
M.Periodo, 
T.Transporte,
D.Categoria, 
SB2.Barcode
--D2.CP
FROM EdiDB.dbo.PAYLESS_ProdPrioriDet D
JOIN (
	SELECT SB1.barcode, COUNT(*) C
	FROM (
		SELECT DISTINCT CATEGORIA, D.barcode
		FROM EdiDB.dbo.PAYLESS_ProdPrioriDet D
		where D.Categoria != 'ACCESORIOS'
		--and D.Barcode = '7372854892'
	) SB1
	GROUP BY SB1.barcode
	HAVING COUNT(*) > 1
) SB2
	ON SB2.Barcode = D.Barcode
JOIN EdiDB.dbo.PAYLESS_ProdPriorim M
	ON M.Id = D.IdPayless_ProdPrioriM
--JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D2
--	ON M.Id = D2.IdPayless_ProdPrioriM
JOIN EdiDB.dbo.PAYLESS_Transporte T
	ON D.IdTransporte = T.Id
ORDER BY M.Periodo, SB2.Barcode
	



--update EdiDB.dbo.PedidosDetExternos SET PedidoId =  16 where PedidoId = 12
--delete from EdiDB.dbo.PedidosExternos where Id = 16
--truncate table EdiDB.dbo.PedidosDetExternos

select * from wms.dbo.Racks where Rack = 6493
select BodegaId, RegimenID, Rack, Observacion, NombreRack, Barcode, Fecha, EstatusID, Alto, Largo, Ancho 
from wms.dbo.Racks where Rack = 8221

select * from wms.dbo.Racks where NombreRack = 'StageTGU'
select * from wms.dbo.Racks order by Rack DESC
select * from wms.dbo.Racks where BodegaId = 9 order by Rack DESC
select * from wms.dbo.Bodegas where BodegaID = 9 order by Rack DESC
select DISTINCT I.* from wms.dbo.Inventario I where I.Rack = 11977
SELECT DISTINCT
	Pe.Id,
	(
	select top 1 B.NomBodega
	from wms.dbo.ItemInventario Ii WITH(NOLOCK)
	JOIN wms.dbo.Inventario I WITH(NOLOCK)
		ON I.InventarioID = Ii.InventarioID
	JOIN wms.dbo.Racks R WITH(NOLOCK)
		ON R.Rack = I.Rack
	JOIN wms.dbo.Bodegas B WITH(NOLOCK)
		ON B.BodegaID = R.BodegaID
	where Ii.CodProducto = PeD.CodProducto order by ItemInventarioID desc
	) Bodega,
	Pe.TiendaId,
	Pe.FechaPedido,
	M.Periodo,
	D.Categoria,
	D.CP,
	D.Barcode,
	(
	select top 1 R.Rack 
	from wms.dbo.ItemInventario Ii WITH(NOLOCK)
	JOIN wms.dbo.Inventario I WITH(NOLOCK)
		ON I.InventarioID = Ii.InventarioID
	JOIN wms.dbo.Racks R WITH(NOLOCK)
		ON R.Rack = I.Rack
	where Ii.CodProducto = PeD.CodProducto order by ItemInventarioID desc
	) IdRack,
	(
	select top 1 R.NombreRack 
	from wms.dbo.ItemInventario Ii WITH(NOLOCK)
	JOIN wms.dbo.Inventario I WITH(NOLOCK)
		ON I.InventarioID = Ii.InventarioID
	JOIN wms.dbo.Racks R WITH(NOLOCK)
		ON R.Rack = I.Rack
	where Ii.CodProducto = PeD.CodProducto order by ItemInventarioID desc
	) NombreRack
FROM EdiDB.dbo.PedidosExternos Pe WITH(NOLOCK)
JOIN EdiDB.dbo.PedidosDetExternos PeD WITH(NOLOCK)
	ON PeD.PedidoId = Pe.Id
JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D WITH(NOLOCK)
	ON D.Barcode = PeD.CodProducto
JOIN EdiDB.dbo.PAYLESS_ProdPrioriM M WITH(NOLOCK)
	ON M.Id = D.IdPAYLESS_ProdPrioriM
--WHERE Pe.Id = 9
ORDER BY Pe.Id, Pe.TiendaId, M.Periodo, D.Categoria, D.Barcode

select top 1000 *
from wms.dbo.ItemInventario Ii
JOIN wms.dbo.Inventario I
	ON I.InventarioID = Ii.InventarioID
JOIN wms.dbo.Racks R
	ON R.Rack = I.Rack
where Ii.CodProducto like '7376%' 
and Ii.Descripcion = 'CABALLEROS'
order by CodProducto, ItemInventarioID desc
select * from wms.dbo.Bodegas
select * from wms.dbo.locations
select * from EdiDb.dbo.PAYLESS_ProdPrioriDet where Barcode = '7373823622'
select distinct BarCode from EdiDb.dbo.PAYLESS_ProdPrioriDet
--2559 - 554 CP + 293 CP = 2298
--delete from  EdiDB.dbo.PedidosDetExternos WHERE CodProducto in (
--SELECT distinct D.BarCode
--FROM EdiDB.dbo.PedidosDetExternos PeD
--JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D
--	ON D.Barcode = PeD.CodProducto
--WHERE D.CP NOT IN ('A', 'H', '')
--)
SELECT * FROM wms_test_29_01_2019.dbo.VInformacionPedidosWeb WHERE ClienteID = 618 ORDER BY CodProducto
SELECT * FROM wms_test_29_01_2019.dbo.InventarioExistencias WHERE ClienteID = 618
SELECT * FROM ListaPedidosWeb Where ClienteID = 618 Order by fecha DESC
SELECT     P.ClienteID, P.PedidoBarcode AS Pedido, P.fechapedido AS Fecha, E.Estatus, 
B.NomBodega AS Bodega, R.Regimen, (Dp.CodProducto) AS Articulos, Dp.Cantidad, P.Observacion
FROM dbo.Pedido AS P 
INNER JOIN dbo.Estatus AS E ON E.EstatusID = P.EstatusID 
INNER JOIN dbo.Bodegas AS B ON B.BodegaID = P.BodegaID 
INNER JOIN dbo.Regimen AS R ON R.IDRegimen = P.RegimenID 
INNER JOIN dbo.DtllPedido AS Dp ON Dp.PedidoID = P.PedidoID
WHERE ClienteID = 618
--GROUP BY P.ClienteID, P.PedidoBarcode, P.fechapedido, B.NomBodega, R.Regimen, E.Estatus, P.Observacion
ORDER BY P.fechapedido DESC
SELECT TOP 200 * FROM wms_test_29_01_2019.[dbo].[VPedidosWebProducto]
SELECT TOP 200 * FROM wms_test_29_01_2019.dbo.Producto
SELECT TOP 200 * FROM [wms_test_29_01_2019].dbo.Producto WHERE CodProducto = 'E11084800'
SELECT TOP 200 * FROM [wms_test_29_01_2019].dbo.UnidadMedida WHERE UnidadMedidaID = 346

SELECT CodProducto, ClienteId, Count(*) FROM wms_test_29_01_2019.dbo.Producto GROUP BY CodProducto, ClienteId ORDER BY count(*) desc
SELECT TOP 200 * FROM wms.dbo.Clientes WHERE ClienteId = 1432
SELECT TOP 200 * FROM wms_test_29_01_2019.dbo.Inventario
SELECT TOP 200 * FROM wms_test_29_01_2019.dbo.ItemInventario

SELECT * FROM LEAR_EQUIVALENCIAS 

--70246
EXEC GetSNDet 70246
select * from wms.dbo.Pedido where ClienteId = 1432
select * from wms.dbo.Pedido where PedidoId = 70920
select * from wms.dbo.Pedido where PedidoId = 71915
select * from wms.dbo.DtllPedido where PedidoId = 78312
--70246, despacho 51633
select * from wms.dbo.usrsystem where idusr = 'EPALACIOS'
select * from wms.dbo.usrsystem where idusr like '%salvad%'
select * from wms.dbo.usrsystem where LocationID = 1
select * from EdiDB.dbo.PedidosExternos where PedidoWms in (73470, 73283)
select top 20 * from wms.dbo.Despachos where DocumentoFiscal = 'SA120103' order by DespachoID DESC
select top 20 * from wms.dbo.Transacciones where TransaccionID >= 127876
select top 20 * from wms.dbo.Transacciones where TransaccionID = 120546
select top 20 * from wms.dbo.Transacciones order by TransaccionID DESC
select top 20 * from wms.dbo.Transacciones where ClienteId = 1432 order by TransaccionID DESC
select * from wms.dbo.ItemInventario where CodProducto = '7950893168'
select * from wms.dbo.Producto where CodProducto = '7950893168'
--traslado 127912
--delete from wms.dbo.Transacciones where TransaccionID >= 127872
select top 2000 * from wms.dbo.DtllItemTransaccion where TransaccionID = 120559
select top 2000 * from wms.dbo.DetalleTransacciones where TransaccionID = 127912
select top 20 * from wms.dbo.DtllDespacho Dd where Dd.DespachoID = 51953
SELECT TOP 200 * FROM wms.dbo.Transacciones WHERE PedidoId = 72784
select * from wms.dbo.Pedido where PedidoId = 72784
SELECT * FROM wms.dbo.SysTempSalidas S WHERE S.DtllPedidoID in (
	select DtllPedidoID from wms.dbo.DtllPedido where PedidoId = 72784
) 
AND S.CodProducto NOT IN (
select CodProducto from wms.dbo.DtllPedido where PedidoId = 71908
)
SELECT top 1000 * FROM wms.dbo.SysTempSalidas S WHERE TransaccionID = 127873 OR S.Usuario = 'HCAMPOS' order by IDTempSalida DESC

--IN (
--	SELECT CodProducto FROM EdiDB.dbo.PedidosDetExternos where PedidoId = 40
--)
select * from EdiDB.dbo.PedidosExternos where PedidoWMS = 70648
select * from wms.dbo.Inventario where InventarioID in (
	SELECT InventarioID FROM wms.dbo.SysTempSalidas WHERE DtllPedidoID in (
	select DtllPedidoID from wms.dbo.DtllPedido where PedidoId = 70041
	)
)
--facturas por salidas
SELECT TOP 200 
T.*,
(
SELECT COUNT(*)
FROM wms.dbo.SysTempSalidas S
WHERE S.TransaccionID = T.TransaccionID
) Total
FROM wms.dbo.Transacciones T
WHERE T.ClienteID = 1432 
AND T.IDTipoTransaccion = 'SA'

select top 20 * from wms.dbo.DocumentosxTransaccion order by IDDocxTransaccion desc
select top 20 * from wms.dbo.Inventario
select top 20 * from wms.dbo.Transacciones where TransaccionID = 119336
select top 20 Ii.*
from wms.dbo.Transacciones T
JOIN wms.dbo.DetalleTransacciones Dt
	ON Dt.TransaccionID = T.TransaccionID
JOIN wms.dbo.Inventario I
	ON I.InventarioID = Dt.InventarioID
JOIN wms.dbo.ItemInventario Ii
	ON Ii.InventarioID = I.InventarioID
where T.TransaccionID = 119336
select * from wms.dbo.SysTempSalidas where TransaccionID = 127876
select * from wms.dbo.SysTempSalidas where CodProducto like '7675870426%'
select * from wms.dbo.Producto where CodProducto like '76%' AND ClienteID = 385
select * from EdiDb.dbo.PAYLESS_ProdPrioriDet D where D.Barcode in (
	SELECT CodProducto FROM wms.dbo.SysTempSalidas S WHERE S.DtllPedidoID in (
		select DtllPedidoID from wms.dbo.DtllPedido where PedidoId = 70310
	)
)
--7388882724
--7388882839
--7366830856
select top 100 
	MIN(ItemInventarioID) OVER(PARTITION BY Ii.CodProducto) MinItemInventarioId, 
	Ii.CodProducto,
	Ii.ItemInventarioID,
	T.TransaccionID,
	DxT.FACT_COMERCIAL
from wms.dbo.ItemInventario Ii,
wms.dbo.DetalleTransacciones Dt,
wms.dbo.Transacciones T,
wms.dbo.DocumentosxTransaccion DxT
where Ii.CodProducto IN (
SELECT DISTINCT Dp.CodProducto from wms.dbo.DtllPedido Dp where Dp.PedidoID = 70266
) AND 
Dt.InventarioID = Ii.InventarioID
AND T.TransaccionID = Dt.TransaccionID
AND T.IDTipoTransaccion = 'IN'
AND DxT.TransaccionID = T.TransaccionID
AND T.ClienteID = 1432
AND DxT.FACT_COMERCIAL != ''
--AND Ii.Existencia = 0
GROUP BY Ii.CodProducto,
Ii.ItemInventarioID,
T.TransaccionID,
DxT.FACT_COMERCIAL
ORDER BY Ii.CodProducto

EXEC sp_spaceused;

select * from wms.dbo.Bodegas where BodegaId = 82
select * from wms.dbo.Racks where Rack in (
11789,
11808,
11928,
11951
)

--problema de CodProducto en bodegas de SPS
select * from wms.dbo.Racks where Rack in (
SELECT  distinct DxT.INFORME_ALMACEN
FROM wms.dbo.Inventario I, 
wms.dbo.DocumentosxTransaccion DxT, 
wms.dbo.Transacciones T,
wms.dbo.DetalleTransacciones Dt,
wms.dbo.ItemInventario Ii
WHERE I.InventarioID IN (
SELECT InventarioID FROM wms.dbo.ItemInventario WHERE CodProducto like '7383%'
)
AND Dt.InventarioID = I.InventarioID
AND Dt.TransaccionID = T.TransaccionID
AND T.TransaccionID = DxT.TransaccionID
AND Ii.InventarioID = I.InventarioID
)
select * from wms.dbo.DocumentosxTransaccion order by IDDocxTransaccion DESC
select * from wms.dbo.Racks where Rack in (11808, 11977)
SELECT TOP 200 * FROM wms.dbo.Inventario WHERE InventarioID in (2072867)
SELECT TOP 200 * FROM wms.dbo.ItemInventario WHERE CodProducto = '7667837196'
SELECT TOP 200 * FROM wms.dbo.Transacciones where TransaccionID in (130275)
SELECT TOP 200 * FROM wms.dbo.DetalleTransacciones where InventarioID = 119480
SELECT TOP 200 * FROM wms.dbo.DetalleTransacciones WHERE InventarioId in (2210192, 2210991, 2211860)
SELECT TOP 200 * FROM wms.dbo.SysTempSalidas WHERE ItemInventarioID IN (1831191)
SELECT TOP 200 * FROM wms.dbo.SysTempSalidas where CodProducto like '7667%'
--TId: 115914	Pid: 69104	IId: 1831824
SELECT TOP 200 * FROM wms.dbo.SysTempSalidas WHERE TransaccionID = 118331 order by IdTempSalida
--Transaccion que se mezclo 2 usuarios 118331
SELECT TOP 200 * FROM wms.dbo.Transacciones WHERE TransaccionID in (119480)
SELECT TOP 200 * FROM wms_test_29_01_2019.dbo.Transacciones WHERE IDTipoTransaccion = 'IN' AND year(FechaTransaccion) = 2019
SELECT TOP 200 * FROM wms_test_29_01_2019.dbo.Transacciones WHERE --IDTipoTransaccion = 'IN' 
 year(FechaTransaccion) = 2019 AND ClienteID = 1134 order by ClienteID
SELECT TOP 200 * FROM wms_test_29_01_2019.dbo.DetalleTransacciones WHERE TransaccionID IN (1663770, 1663779)
SELECT TOP 200 * FROM [wms_test_29_01_2019].dbo.Inventario WHERE ClienteId IS NULL AND year(FechaCreacion) = 2019
SELECT TOP 200 * FROM wms_test_29_01_2019.dbo.DetalleTransacciones WHERE InventarioID IN (1663770,
1663779)
SELECT TOP 200 * FROM wms_test_29_01_2019.dbo.Transacciones WHERE TransaccionID = 105001

---
SELECT TOP 200 * FROM [wms_test_29_01_2019].dbo.Inventario WHERE InventarioID IN (1663770, 1663779)
SELECT TOP 200 * FROM wms.dbo.ItemInventario WHERE CodProducto = '7365821972'
SELECT TOP 200 * FROM wms_test_29_01_2019.dbo.DetalleTransacciones WHERE InventarioID IN (1663770, 1663779)
SELECT TOP 200 * FROM wms_test_29_01_2019.dbo.Transacciones WHERE TransaccionID = 105001
----
SELECT TOP 200 * FROM wms_test_29_01_2019.dbo.Inventario WHERE Existencia IS NOT NULL AND YEAR(FechaCreacion) = 2018 ORDER BY Existencia DESC

SELECT TOP 200 * FROM [wms_test_29_01_2019].dbo.ItemInventario WHERE InventarioID = 1590313
SELECT TOP 200 * FROM [wms_test_29_01_2019].dbo.Inventario WHERE InventarioID IN (1590313)
SELECT TOP 200 * FROM wms_test_29_01_2019.dbo.DetalleTransacciones WHERE InventarioID IN (1590313)
SELECT TOP 200 * FROM wms_test_29_01_2019.dbo.Transacciones WHERE TransaccionID IN (SELECT TransaccionID FROM wms_test_29_01_2019.dbo.DetalleTransacciones WHERE InventarioID IN (1590313))

--16HB4326-7
EXEC [SP_GetExistenciasExtern] 1345
--1967856449
--16HB4326-7	KIDS SOCKS BOYS HANES COMFORBLEND P6S NPI, ANKLE MEDIUM	0	CAJA	NULL

--select * from PAYLESS_ProdPriori where BarCode = '7392819938' order by OID desc
--delete from PAYLESS_ProdPriori where Id = 2434
--update PAYLESS_ProdPriori SET Periodo = '08/04/2019'
SELECT TOP 200 * FROM [wms_test_29_01_2019].dbo.Producto WHERE CodProducto = '7658893139'
select * from PAYLESS_ProdPrioriM
select * from PAYLESS_ProdPrioriDet where IdPAYLESS_ProdPrioriM = 10 and Barcode = '1983832691'
where IdPAYLESS_ProdPrioriM = 1
--truncate table PAYLESS_ProdPrioriDet
--truncate table PAYLESS_ProdPrioriM
select distinct Producto, Talla, Lote, Categoria from PAYLESS_ProdPrioriDet ORDER BY Producto, Talla, Lote, Categoria
select distinct Producto from PAYLESS_ProdPrioriDet ORDER BY Producto
select * from wms_test_29_01_2019.dbo.Producto where Descripcion like'%GEMU3131%'
select * from PAYLESS_ProdPrioriDet where IdTransporte = 9
select * from EdiDb.dbo.PAYLESS_ProdPrioriArchM
--update  EdiDb.dbo.PAYLESS_ProdPrioriArchM SET PorcValidez = null, Typ = 0 where Id = 9
--update  EdiDb.dbo.PAYLESS_ProdPrioriArchM SET Typ = 0
--delete from EdiDb.dbo.PAYLESS_ProdPrioriArchM where Id in (38, 39)
--delete from EdiDb.dbo.PAYLESS_ProdPrioriArchDet where IdM in (38, 39)
select * from EdiDb.dbo.PAYLESS_ProdPrioriArchDet
select * from EdiDb.dbo.PAYLESS_Transporte
select * from EdiDb.dbo.Lear_PureEdi
--drop table PedidosDetExternos2
--8	SMLU 789569-3
--9	SMLU 796382-8
select * from EdiDb.dbo.PAYLESS_ProdPrioriM
select SUBSTRING(s.bc, 1, 4) bc, count(*) from (
select distinct barcode bc from EdiDb.dbo.PAYLESS_ProdPrioriDet 
where IdPAYLESS_ProdPrioriM = 4 and IdTransporte in (9)
) s
group by SUBSTRING(s.bc, 1, 4) order by SUBSTRING(s.bc, 1, 4)
select * from PAYLESS_ProdPrioriArchDet
select * from EdiDb.dbo.PAYLESS_ProdPrioriDet where barcode like '7370872774'
select * from PAYLESS_ProdPrioriArchDet where barcode like '7370872774'
select distinct 
--(select T.Transporte from EdiDb.dbo.PayLess_Transporte T where T.Id = D.IdTransporte) Transporte, 
D.barcode from EdiDb.dbo.PAYLESS_ProdPrioriArchDet D where D.barcode not in(
select barcode from  PAYLESS_ProdPrioriDet 
) order by D.barcode

select distinct barcode from EdiDb.dbo.PAYLESS_ProdPrioriDet where barcode like '7393%' and IdTransporte = 4
--update EdiDb.dbo.PAYLESS_Tiendas SET BodegaId = null where ClienteId = 385
select * from EdiDb.dbo.PAYLESS_Tiendas order by TiendaID
select * from EdiDb.dbo.PAYLESS_Tiendas where ClienteId = 385
select * from EdiDb.dbo.PAYLESS_Tiendas where BodegaId is null
select * from EdiDb.dbo.PAYLESS_Tiendas where TiendaId = 7671
--delete from EdiDb.dbo.PAYLESS_Tiendas where Id = 48
select * from EdiDb.dbo.PAYLESS_Tiendas where TiendaId = 7393
--update EdiDb.dbo.IEnetUsers SET ClienteID = 1432
-- 7379 , 7383 pasan a ser TGU, SAP
select * from EdiDb.dbo.PayLess_Transporte
select * from EdiDB.dbo.PAYLESS_ProdPrioriDet where IdTransporte = 7
--MLU 796554-8
select barcode, count(*) from PAYLESS_ProdPrioriArchDet where IdM = 1 and barcode like'1967%' group by barcode
insert into PAYLESS_ProdPrioriArchDet(IdM, barcode)
VALUES(1, '1983832691')
select * from EdiDb.dbo.PedidosExternos 
select * from EdiDb.dbo.PedidosDetExternos where PedidoId = 1022
--delete from EdiDb.dbo.PedidosExternos where Id in (2, 3) 
--delete from EdiDb.dbo.PedidosDetExternos where PedidoId in (2, 3) 
exec SP_GetExistenciasExtern 1345
select top 10 * from wms_test_29_01_2019.dbo.Inventario where ClienteId = 1345 and InventarioID = 1675373
select top 10 * from wms.dbo.ItemInventario where CodProducto = '1967856448'
select top 10 * from wms_test_29_01_2019.dbo.ItemInventario order by Existencia deSC
select top 10 * from wms_test_29_01_2019.dbo.Transacciones where TransaccionID = 105972
select top 10 * from wms_test_29_01_2019.dbo.Transacciones where ClienteID = 1345
select top 1000 * from wms_test_29_01_2019.dbo.DtllItemTransaccion where TransaccionID = 105970
select top 10 * from wms_test_29_01_2019.dbo.DetalleTransacciones order by TransaccionID DESC

SELECT top 10 
Ii.CodProducto,
Ii.Existencia,
T.IDTipoTransaccion,
T.ClienteID,
T.Fechacrea
FROM wms_test_29_01_2019.dbo.ItemInventario Ii
join wms_test_29_01_2019.dbo.DetalleTransacciones Dt
	ON Dt.InventarioID = Ii.InventarioID
join wms_test_29_01_2019.dbo.Transacciones T
	ON T.TransaccionID = Dt.TransaccionID
where Ii.CodProducto = '1967856448'


select top 10 * from wms_test_29_01_2019.dbo.Producto where CodProducto = '06-PSS-026-18'
select top 10 * from wms_test_29_01_2019.dbo.Producto where CodProducto = '12-PSS-047-18'
select top 10 * from wms_test_29_01_2019.dbo.Producto where CodProducto = '419532811'
select top 10 * from wms_test_29_01_2019.dbo.Producto where CodProducto = 'N� 2083'
select top 10 * from wms_test_29_01_2019.dbo.Producto where CodProducto = 'N� 048 '
select top 10 * from wms_test_29_01_2019.dbo.Producto where CodProducto = '07-PSS-031-18'

select top 10 * from wms_test_29_01_2019.dbo.ItemInventario where CodProducto = '06-PSS-026-18'
ALTER TABLE wms_test_29_01_2019.dbo.ItemInventario NOCHECK CONSTRAINT FK_ItemInventario_Producto
update wms_test_29_01_2019.dbo.ItemInventario SET CodProducto = '1983832690' where CodProducto = '1953849670'
update wms_test_29_01_2019.dbo.SysTempSalidas SET CodProducto = '1983832690' where CodProducto = '1953849670'
update wms_test_29_01_2019.dbo.DtllPedido SET CodProducto = '1983832690' where CodProducto = '1953849670'
update wms_test_29_01_2019.dbo.Producto SET CodProducto = '1983832690' where CodProducto = '1953849670'
ALTER TABLE wms_test_29_01_2019.dbo.ItemInventario CHECK CONSTRAINT FK_ItemInventario_Producto

ALTER TABLE wms_test_29_01_2019.dbo.ItemInventario NOCHECK CONSTRAINT FK_ItemInventario_Producto
update wms_test_29_01_2019.dbo.ItemInventario SET CodProducto = '1983832611' where CodProducto = '1953850339'
update wms_test_29_01_2019.dbo.SysTempSalidas SET CodProducto = '1983832611' where CodProducto = '1953850339'
update wms_test_29_01_2019.dbo.DtllPedido SET CodProducto = '1983832611' where CodProducto = '1953850339'
update wms_test_29_01_2019.dbo.Producto SET CodProducto = '1983832611' where CodProducto = '1953850339'
ALTER TABLE wms_test_29_01_2019.dbo.ItemInventario CHECK CONSTRAINT FK_ItemInventario_Producto

ALTER TABLE wms_test_29_01_2019.dbo.ItemInventario NOCHECK CONSTRAINT FK_ItemInventario_Producto
update wms_test_29_01_2019.dbo.ItemInventario SET CodProducto = '1983832700' where CodProducto = '1953850346'
update wms_test_29_01_2019.dbo.SysTempSalidas SET CodProducto = '1983832700' where CodProducto = '1953850346'
update wms_test_29_01_2019.dbo.DtllPedido SET CodProducto = '1983832700' where CodProducto = '1953850346'
update wms_test_29_01_2019.dbo.Producto SET CodProducto = '1983832700' where CodProducto = '1953850346'
ALTER TABLE wms_test_29_01_2019.dbo.ItemInventario CHECK CONSTRAINT FK_ItemInventario_Producto

ALTER TABLE wms_test_29_01_2019.dbo.ItemInventario NOCHECK CONSTRAINT FK_ItemInventario_Producto
update wms_test_29_01_2019.dbo.ItemInventario SET CodProducto = '1983832691' where CodProducto = '1983832719'
update wms_test_29_01_2019.dbo.SysTempSalidas SET CodProducto = '1983832691' where CodProducto = '1983832719'
update wms_test_29_01_2019.dbo.DtllPedido SET CodProducto = '1983832691' where CodProducto = '1983832719'
update wms_test_29_01_2019.dbo.Producto SET CodProducto = '1983832691' where CodProducto = '1983832719'
ALTER TABLE wms_test_29_01_2019.dbo.ItemInventario CHECK CONSTRAINT FK_ItemInventario_Producto

update wms_test_29_01_2019.dbo.Producto SET CodProducto = '1953850339' where CodProducto = '06-PSS-027-18'
update wms_test_29_01_2019.dbo.Producto SET CodProducto = '1953850346' where CodProducto = '06-PSS-028-18'
update wms_test_29_01_2019.dbo.Producto SET CodProducto = '1953850344' where CodProducto = '07-PSS-029-18'
update wms_test_29_01_2019.dbo.Producto SET CodProducto = '1953850347' where CodProducto = '07-PSS-030-18'
update wms_test_29_01_2019.dbo.Producto SET CodProducto = '1953850340' where CodProducto = '07-PSS-031-18'

1953849670
1953850339
1953850346
1953850344
1953850347
1953850340
--1953850349

1983832690
1983832611
1983832700
1983832719
1983832691

select * from PAYLESS_Tiendas

select * from PAYLESS_Reportes
--update PAYLESS_Reportes SET FechaGen = '07/05/2019 08:49'


select GETDATE() - convert(datetime,'30/12/2018', 103)


SELECT [De0].[Id], [De0].[Barcode], [De0].[Cargada], [De0].[Categoria], [De0].[CP], [De0].[Departamento], [De0].[Estado], 
[De0].[Etiquetada], [De0].[IdPAYLESS_ProdPrioriM], [De0].[IdTransporte], 
[De0].[Lote], [De0].[M3], [De0].[OID], [De0].[Peso], [De0].[Pickeada], [De0].[PoolP], [De0].[Preinspeccion], [De0].[Pri], 
[De0].[Producto], [De0].[Talla]
FROM [PAYLESS_ProdPrioriDet] AS [De0]

select * from EdiDB.[dbo].[PAYLESS_PeriodoTransporte]

--insert into EdiDB.[dbo].[PAYLESS_PeriodoTransporte] (Periodo, IdTransporte)
--select distinct M.Periodo, D.IdTransporte  from EdiDb.[dbo].[PAYLESS_ProdPrioriDet] D
--join EdiDb.[dbo].[PAYLESS_ProdPrioriM] M
--ON D.IdPAYLESS_ProdPrioriM = M.Id




SELECT P.ClienteID
		,P.PedidoBarcode
		,CONVERT(VARCHAR, P.fechapedido, 103) FechaPedido
		,E.Estatus
		,B.NomBodega
		,R.Regimen
		,Dp.CodProducto
		,Dp.Cantidad
		,P.Observacion
		,P.PedidoID
	FROM wms.dbo.Pedido AS P WITH (NOLOCK)
	INNER JOIN wms.dbo.Estatus AS E WITH (NOLOCK) ON E.EstatusID = P.EstatusID
	INNER JOIN wms.dbo.Bodegas AS B WITH (NOLOCK) ON B.BodegaID = P.BodegaID
	INNER JOIN wms.dbo.Regimen AS R WITH (NOLOCK) ON R.IDRegimen = P.RegimenID
	INNER JOIN wms.dbo.DtllPedido AS Dp WITH (NOLOCK) ON Dp.PedidoID = P.PedidoID
	WHERE ClienteID = 618
	ORDER BY P.fechapedido DESC
--2114
--24063
--26488
select count(*) from (
select --Gc.Nombre, 
(select top 1 C.Nombre 
from EdiDb.[dbo].[PAYLESS_Tiendas] T
join wms.dbo.Clientes C
	on C.ClienteID = T.ClienteID
	AND T.TiendaId = SUBSTRING(Ad.BarCode, 0, 5)) NomCliente,
Ex.*
from EdiDb.dbo.PAYLESS_ProdPrioriArchDet Ad
join EdiDb.dbo.PAYLESS_ProdPrioriArchM Am 
	on Am.Id = Ad.IdM AND Am.Periodo = '13/05/2019'
join EdiDb.dbo.PAYLESS_ProdPrioriDet Ex 
	on Ex.Barcode = Ad.barcode AND Ex.IdTransporte = 9
	) r1

select  C.ClienteID, T.TiendaId, C.Nombre 
from EdiDb.[dbo].[PAYLESS_Tiendas] T
join [wms_test_29_01_2019].dbo.Clientes C
	on C.ClienteID = T.ClienteID

select * from EdiDb.dbo.PAYLESS_ProdPrioriArchM
select * from EdiDb.dbo.PAYLESS_ProdPrioriArchDet where IdM = 1
select * from EdiDb.dbo.PAYLESS_ProdPrioriM where id = 9
select * from EdiDb.[dbo].[PAYLESS_Transporte]
select * from EdiDb.dbo.PAYLESS_ProdPrioriDet 
where IdPayless_prodprioriM = 2 AND IdTransporte = 4

--7365822058

select --Gc.Nombre, 
(select top 1 C.Nombre 
from EdiDb.[dbo].[PAYLESS_Tiendas] T
join wms.dbo.Clientes C
	on C.ClienteID = T.ClienteID
	AND T.TiendaId = SUBSTRING(Ad.BarCode, 0, 5)) NomCliente,
Ex.*
from EdiDb.dbo.PAYLESS_ProdPrioriArchDet Ad
join EdiDb.dbo.PAYLESS_ProdPrioriArchM Am 
	on Am.Id = Ad.IdM AND Am.Periodo = '13/05/2019'
join EdiDb.dbo.PAYLESS_ProdPrioriDet Ex 
	on Ex.Barcode = Ad.barcode AND Ex.IdTransporte = 9
--24063
select * from EdiDb.dbo.PAYLESS_ProdPrioriArchM where Periodo = '13/05/2019'
update EdiDb.dbo.PAYLESS_ProdPrioriArchM SET PorcValidez = null where Id = 4
--6046
select * from EdiDb.dbo.PAYLESS_ProdPrioriArchDet
select * from EdiDb.dbo.PAYLESS_ProdPrioriM
--delete from EdiDb.dbo.PAYLESS_ProdPrioriM where Id = 1
select count(*) from (select distinct Barcode from EdiDb.dbo.PAYLESS_ProdPrioriDet) a1
select count(*) from (select distinct Barcode from EdiDb.dbo.PAYLESS_ProdPrioriArchDet) a1
--delete from EdiDb.dbo.PAYLESS_ProdPrioriDet WHERE IdPAYLESS_ProdPrioriM = 1
--6046
--2598
--6034
select count(*) from (
select distinct p1.barcode from EdiDb.dbo.PAYLESS_ProdPrioriArchDet p1,
EdiDb.dbo.PAYLESS_ProdPrioriDet p2
where p1.barcode = p2.Barcode) ca1
--6033 match

select * from wms.dbo.Producto where CodProducto = '7369829284'

--Este voy a probar a ver si soy sysadmin
--TS8CACC16-900-155 
'CAMISA PLATINUM SPORT MC '
select * from wms.dbo.Producto where CodProducto = 'TS8CACC16-900-155'

--update wms.dbo.Producto SET Descripcion = 'CAMISA PLATINUM SPORT MC '
--where CodProducto = 'TS8CACC16-900-155'

select * from wms.dbo.Transacciones T where ClienteID = 1181
select * from wms.dbo.Locations
select * from wms.dbo.Bodegas where LocationId =7
select * from wms.dbo.Bodegas where BodegaId =9
select * from wms_test.dbo.Racks where BodegaId = 81
select * from wms_test.dbo.Racks where Rack = 8221
order by Rack desc
select * from wms.dbo.UnidadMedida where UnidadMedida like'%bult%'
select * from wms.dbo.UnidadMedida where UnidadMedidaID = 70
select * from wms.dbo.Transacciones T where T.Usuariocrea = 'Hilmer'
select count(*) from wms_test_29_01_2019.dbo.Producto
select  * from wms_test_29_01_2019.dbo.Producto order by Fecha DESC
select max(InventarioID) from wms.dbo.Inventario
--1820626
--1820687
--1820858
---1821022
--1821028
select count(*)
select * from wms.dbo.DocumentosxTransaccion where INFORME_ALMACEN like'%GLCHN33-5-001%' order by IDDocxTransaccion desc
select top 100 * from wms.dbo.Bodegas
select top 10 * from wms.dbo.Regimen
select top 10 * from wms.dbo.Producto where CodProducto = '7650895208'
select top 10 * from wms.dbo.Producto where Descripcion = '19003833B PORTA ANILLOS MANOS GRD'
--delete from wms.dbo.Producto where Descripcion = '19003833B PORTA ANILLOS MANOS GRD'
select top 1 * from wms.dbo.Inventario where CodProducto = '7365822071'
select top 1 * from wms.dbo.ItemInventario where CodProducto = '7365822071'
--update wms.dbo.Producto SET CodProducto = '19003833B' where Descripcion = '19003833B PORTA ANILLOS MANOS GRD'
select top 10 * from wms.dbo.Inventario where InventarioID in (
1837157)
select top 10 * from wms.dbo.ItemInventario where CodProducto = '7366830856' 

select top 10 * from wms_test.dbo.Transacciones where TransaccionID = 101029
select TransaccionID, NoTransaccion, FechaTransaccion, IdTipoTransaccion, PedidoId, BodegaId, RegimenId, ClienteId, Total, TipoIngreso, UsuarioCrea, FechaCrea, Observacion, EstatusId, OperarioId, TipoPicking, ExportadorId, DestinoId, TransportistaId, Pais_Orig, Adu_fro, Placa, Marchamo, Contenedor, Cod_Motoris, Remolque, RecivingCliente, FechaReciving, FacturaId, IdrControl from dbo.Transacciones where TransaccionId = 101029

select top 20 * from wms.dbo.Estatus
select top 20 * from wms.dbo.Transacciones where ClienteId = 1432 
AND IDTipoTransaccion = 'SA'
order by Fechacrea DESC --IN115900
select top 20 * from wms.dbo.Transacciones where TransaccionID = 116804
 order by TransaccionId DESC
--update wms.dbo.Transacciones SET PedidoId = 69251 where TransaccionID = 116085
--salida SA115914 y SA116005 son salidas 
--reuso 116085
--116160 mal receiving
--delete from wms.dbo.Transacciones where TransaccionID in (
--116137
--)
--PedidoId = 69104
--Problema con receiving, la TransaccionId 115912 esta bien, pero la 116160 da mal receiving
select * from wms.dbo.DocumentosxTransaccion where INFORME_ALMACEN like'%GLCHN%'
'GLCHN33-5-007'
'GLCHN33-5-007'
select * from wms.dbo.DocumentosxTransaccion where TransaccionID = 116137
--update wms.dbo.DocumentosxTransaccion SET INFORME_ALMACEN = 'GLCHNTGU-05-003' where TransaccionID = 116137
--delete from wms.dbo.DocumentosxTransaccion where IDDocxTransaccion = 31128
select top 10 * from wms.dbo.Pedido where ClienteId = 1432 or PedidoId = 69334
--update wms.dbo.Pedido SET PedidoBarcode = 'PD69251' where PedidoId = 69251 AND ClienteId = 1432
--delete from wms.dbo.Pedido where PedidoId in (69160)
select top 10 * from wms.dbo.Estatus
select top 10000 * from wms.dbo.SysTempSalidas where PedidoId = 69335
--delete from  wms.dbo.SysTempSalidas where PedidoId in (69160)
select distinct CodProducto from wms.dbo.DtllPedido where PedidoId = 70113
--delete from wms.dbo.DtllPedido where PedidoId in (69160)
select top 100000 * from wms.dbo.DetalleTransacciones where TransaccionID = 116524
--delete from wms.dbo.DetalleTransacciones where TransaccionID = 116137
select top 1000000 * from wms.dbo.DtllItemTransaccion where TransaccionID = 116367
--delete from wms.dbo.DtllItemTransaccion where TransaccionID = 116137
--116081
--116074
--blocking
exec sp_who2
select * from wms.dbo.embalaje
select * from wms.dbo.Inventario where InventarioID in (1869645)
select * from wms.dbo.ItemInventario WITH(NOLOCK) where InventarioID IN (
select InventarioID from wms.dbo.DetalleTransacciones WITH(NOLOCK) where TransaccionID = 116551
) 
--853
--and Existencia > 1  
order by CodProducto
--update wms.dbo.Inventario SET Existencia = 1 where InventarioID = 1869645
--update wms.dbo.ItemInventario SET Existencia = 1 where ItemInventarioID = 1850341
--7380872774
select * from wms.dbo.ItemInventario where ItemInventarioId = 1834892
--update wms.dbo.ItemInventario SET CodProducto = '7366831282' where ItemInventarioId = 1834892
116209
116206
116201
116173
116272
116271
--Entradas a TEGUS
--116137 - 1688
--116081 - 1586
--116074 - 1862
--and lote = ' 175771'
order by CodProducto
--InventarioId = 1841744
select * from wms.dbo.ItemInventario where ItemInventarioId in (1806365,
1812398,
1826261,
1829322)
select * from wms.dbo.Inventario where InventarioID in (
select InventarioID from wms.dbo.ItemInventario where ItemInventarioId in (1806365)
)
select I.* from 
wms.dbo.Inventario I
JOIN wms.dbo.ItemInventario Ii
	ON Ii.InventarioID = I.InventarioID
WHERE Ii.ItemInventarioId in (1806365)
 
--update wms.dbo.ItemInventario SET numero_oc = 8, lote = '572403', modelo = 'PRR', cod_equivale = '7365 - PAYLESS SHOE SOURCE', estilo = '149089', pais_orig = 166, color = 'SMLU 789569-3'
--where ItemInventarioId = 1833186
select * from wms.dbo.Producto where CodProducto = '7370872774'
--INSERT INTO wms.dbo.Producto(CodProducto, Descripcion, UnidadMedida, ClienteID, EstatusID, CategoriaID, CantMinima, Fecha, Comentario, stock_maximo, descargoid, partida)
--VALUES ('7366831282', 'ACCESORIOS', 1, 1432, 1, 10, 0, '21-05-2019', 'IngresoM Hilmer', 0, 1, null)
--update wms.dbo.ItemInventario Set CodProducto = '7366831282' where ItemInventarioId = 1823077
AND CodProducto = '7366831282'
select * from EdiDb.dbo.PAYLESS_ProdPrioriM
--update EdiDb.dbo.PAYLESS_ProdPrioriM SET ClienteId = 1432
--delete from EdiDb.dbo.PAYLESS_ProdPrioriDet where [IdPAYLESS_ProdPrioriM] in (5, 6)
delete from EdiDb.dbo.PAYLESS_ProdPrioriM where id in (5, 6)
select count(*) from EdiDb.dbo.PAYLESS_ProdPrioriDet where [IdPAYLESS_ProdPrioriM] in (5, 6)
--3441
--3441
--4739
--6882
select * from EdiDb.dbo.PAYLESS_ProdPrioriArchDet where Barcode = '7650895208'
select * from EdiDb.dbo.PAYLESS_ProdPrioriDet where Barcode = '7377820804'

select * from EdiDb.dbo.PAYLESS_ProdPrioriDet where Barcode

select distinct IdTransporte, Barcode from EdiDb.dbo.PAYLESS_ProdPrioriDet where Barcode like '7365%'
select * from EdiDb.dbo.PAYLESS_ProdPrioriArchM
--delete from EdiDb.dbo.PAYLESS_ProdPrioriArchM where Id in (29, 30, 31)
select SUBSTRING(barcode, 2, 10), barcode from EdiDb.dbo.PAYLESS_ProdPrioriArchDet where IdM = 32 and SUBSTRING(barcode, 1, 1) = '-'
--delete from EdiDb.dbo.PAYLESS_ProdPrioriArchDet where IdM in (29, 30, 31)
--update EdiDb.dbo.PAYLESS_ProdPrioriArchM SET PorcValidez = null where Id = 1
select * from EdiDb.dbo.PAYLESS_ProdPrioriM
--delete from EdiDb.dbo.PAYLESS_ProdPrioriM where Id = 7
select * from EdiDb.dbo.PAYLESS_ProdPrioriDet where IdPAYLESS_ProdPrioriM = 7
--delete from EdiDb.dbo.PAYLESS_ProdPrioriDet where IdPAYLESS_ProdPrioriM = 7
select distinct SUBSTRING(Barcode, 1, 4) TiendaId from EdiDb.dbo.PAYLESS_ProdPrioriDet order by SUBSTRING(Barcode, 1, 4)
select distinct barcode bc from EdiDb.dbo.PAYLESS_ProdPrioriDet 
where IdPAYLESS_ProdPrioriM = 4 and IdTransporte in (8)
and barcode not in
(
select barcode from EdiDb.dbo.PAYLESS_ProdPrioriArchDet
where IdM = 6)
select * from wms.dbo.Pedido where PedidoId = 69328
select * from 
wms.dbo.DetalleTransacciones Dt
join wms.dbo.ItemInventario Ii on Ii.InventarioID = Dt.InventarioID
join wms.dbo.Transacciones t
on t.TransaccionID = Dt.TransaccionID
where Ii.CodProducto = '7373823174'
order by Dt.TransaccionID DESC
--7365821972
--7381831861 tiene dos entradas pero no la salida...
select * from wms.dbo.Racks where Rack = 11759
select * from wms.dbo.Transacciones where --usuarioCrea = 'RPERDOMO' and 
IDTipoTransaccion = 'IN' and ClienteID = 1432 order by TransaccionID DESC
select * from wms.dbo.Transacciones WITH(NOLOCK) where usuarioCrea = 'Hilmer' order by FechaCrea DESC
select * from wms.dbo.DetalleTransacciones where TransaccionID = 122609
select * from wms.dbo.Transacciones WITH(NOLOCK) where usuarioCrea = 'Admin' order by TransaccionID DESC
select * from wms.dbo.Transacciones WITH(NOLOCK) where ClienteId = 385 order by TransaccionID DESC
select * from wms.dbo.Transacciones WITH(NOLOCK) where-- IDTipoTransaccion = 'IN' and 
ClienteID = 1432 order by FechaCrea DESC
select top 40 * from wms.dbo.Transacciones WITH(NOLOCK) where 
--IDTipoTransaccion = 'SA' and 
ClienteID = 1432 order by TransaccionID DESC
--119515

--Salidas ultimo es 116661 y est� ok
EXEC SP_WHO2
select * from wms.dbo.DocumentosxTransaccion order by IDDocxTransaccion DESC
select * from wms.dbo.DocumentosxTransaccion where Informe_almacen like 'GLCHN33%'  order by IDDocxTransaccion DESC
--119,483
SELECT CONVERT(DATETIME, '2019-06-27 16:53', 120) fECHA
select max(transaccionID) from wms.dbo.Transacciones
select * from wms.dbo.Transacciones where ClienteId = 1432 order by TransaccionID DESC
select * from wms.dbo.DocumentosxTransaccion where TransaccionID = 119592
select * from wms.dbo.DocumentosxTransaccion where TransaccionID in (
select TransaccionID from wms.dbo.Transacciones WITH(NOLOCK) where ClienteID = 1432
) order by IDDocxTransaccion desc
--update wms.dbo.DocumentosxTransaccion SET IM_5 = null WHERE TransaccionID in (116074, 116395)
--update wms.dbo.Transacciones Set Observacion = '' where TransaccionID = 116395
--delete from wms.dbo.Transacciones where TransaccionID in (116389, 116368, 116367)
-- 7370872774 es la que viene duplicada, la 7380 vino junto
select top 2 * from wms.dbo.SysTempSalidas where CodProducto = '7376841272'
select * from wms.dbo.SysTempSalidas where TransaccionID = 119473
--7369829033 duplicado en archivos de escaners ?
select * from wms.dbo.Producto where CodProducto = '7380872774'
select * from wms.dbo.Transacciones where TransaccionId in (118198)
--update wms.dbo.Transacciones SET FechaTransaccion = '16-05-2019' where TransaccionID = 116081
--7366831282 no se escaneo, falta cargar en WMS
--update EdiDb.dbo.PAYLESS_Tiendas SET ClienteID = 1432
--8	SMLU 789569-3
--9	SMLU 796382-8
exec SP_GetPaylessProdPrioriByPeriodAndIdTransport '17/05/2019', 9
	
select count(*) from EdiDb.dbo.PAYLESS_ProdPrioriM
select top 100 * from EdiDb.dbo.PAYLESS_ProdPrioriM
select top 10 * from EdiDb.dbo.PAYLESS_ProdPrioriArchM
select distinct COUNT(*) from EdiDb.dbo.PAYLESS_ProdPrioriDet where Barcode like '7365%'
select * from EdiDb.dbo.PAYLESS_ProdPrioriArchDet where IdM = 1
--truncate table EdiDb.dbo.PAYLESS_ProdPrioriArchM
--truncate table EdiDb.dbo.PAYLESS_ProdPrioriArchDet
--truncate table EdiDb.dbo.PAYLESS_ProdPrioriM
--truncate table EdiDb.dbo.PAYLESS_ProdPrioriDet

7366831282

exec [spGeneraSalida]
'10-05-2019',
'7365821972',
82,
2,
1432,
7,
0

select * from EdiDb.[dbo].[IEnetUsers]
--update EdiDb.dbo.IEnetUsers SET TiendaId = 7365
--where Id = 1
select * from EdiDb.[dbo].[IEnetGroups]
select * from EdiDb.[dbo].PAYLESS_Tiendas
select distinct Color, CodProducto from wms.dbo.Producto where CodProducto like '7370%'
select top 20 * from wms.dbo.Transacciones where ClienteID = 1432
select top 20 * from wms.dbo.DtllItemTransaccion
select top 20 * from wms.dbo.DocumentosxTransaccion order by IDDocxTransaccion desc
select top 20 * from wms.dbo.Inventario

select * 
from wms.dbo.ItemInventario Ii
where Ii.CodProducto like '7370%' and Ii.color  = 'DRYU 961708-5'

--Obtener numeros de factura, bodega, 
select distinct
B.NomBodega,
DoT.Informe_Almacen, 
DoT.Fact_Comercial,
T.NoTransaccion,
Ii.color Transporte,
Ii.CodProducto,
CONVERT(VARCHAR(64), T.Fechacrea, 109) FechaCrea,
CONVERT(VARCHAR(64), Dt.FechaItem, 109) FechaIngreso,
(
	SELECT distinct P2.PedidoBarcode
	FROM wms.dbo.Transacciones T2
	JOIN wms.dbo.Pedido P2
		ON P2.PedidoID = T2.PedidoID
	JOIN wms.dbo.Bodegas B2
		ON B2.BodegaID = T2.BodegaID
	JOIN wms.dbo.DetalleTransacciones Dt2
		ON Dt2.TransaccionID = T2.TransaccionID
	JOIN wms.dbo.ItemInventario Ii2
		ON Ii2.InventarioID = Dt2.InventarioID
	WHERE T2.ClienteID = 1432
	and B2.BodegaID = 82
	AND T2.IDTipoTransaccion = 'SA'
	AND Ii2.CodProducto = Ii.CodProducto
) PedidoBarcode
from wms.dbo.Transacciones T
JOIN wms.dbo.DocumentosxTransaccion DoT
	ON DoT.TransaccionId = T.TransaccionId
JOIN wms.dbo.Bodegas B
	ON B.BodegaID = T.BodegaID
JOIN wms.dbo.DetalleTransacciones Dt
	ON Dt.TransaccionID = T.TransaccionID
JOIN wms.dbo.ItemInventario Ii
	ON Ii.InventarioID = Dt.InventarioID
where T.ClienteID = 1432
and B.BodegaID = 81
AND T.IDTipoTransaccion = 'IN'
ORDER BY B.NomBodega, T.NoTransaccion, Ii.color, Ii.CodProducto




SELECT DISTINCT Ii.CodProducto, B.NomBodega, R.Rack, R.NombreRack
		from wms.dbo.ItemInventario Ii WITH(NOLOCK)
		JOIN wms.dbo.DetalleTransacciones Dt WITH(NOLOCK)
			ON Dt.InventarioID = Ii.InventarioID		
		JOIN wms.dbo.Inventario I WITH(NOLOCK)
			ON I.InventarioID = Ii.InventarioID
		JOIN wms.dbo.Racks R WITH(NOLOCK)
			ON R.Rack = I.Rack
		JOIN wms.dbo.Bodegas B WITH(NOLOCK)
			ON B.BodegaID = R.BodegaID
		where I.ClienteID = 1432
		AND Ii.Existencia > 0		




SELECT 
		t.BodegaId,
		ii.CodProducto,
		SUM(ii.CantidadInicial - isnull(Sy_1.reservado, 0)) AS existencia
	FROM wms.dbo.ItemInventario AS ii WITH(NOLOCK)
	JOIN wms.dbo.inventario AS i WITH(NOLOCK)
		ON i.InventarioID=ii.InventarioID
	JOIN wms.dbo.producto AS p WITH(NOLOCK) 
		ON p.codproducto=ii.codproducto		
	JOIN wms.dbo.DetalleTransacciones AS d1 WITH(NOLOCK)
		ON d1.InventarioID=i.InventarioID
	JOIN wms.dbo.transacciones AS T WITH(NOLOCK) 
		ON t.TransaccionID=d1.TransaccionID		
	LEFT OUTER JOIN
	  (SELECT Sy.InventarioID,
			  Sy.ItemInventarioID,
			  Sy.CodProducto,
			  SUM(ISNULL(Sy.Cantidad, 0)) AS Reservado
	   FROM wms.dbo.SysTempSalidas AS Sy WITH(NOLOCK)
	   INNER JOIN wms.dbo.Pedido AS Pe WITH(NOLOCK) 
			ON Pe.PedidoID = Sy.PedidoID
	   GROUP BY Sy.InventarioID,
				sy.ItemInventarioID,
				Sy.CodProducto) AS Sy_1 ON Sy_1.InventarioID = I.InventarioID
	AND Sy_1.ItemInventarioID = II.ItemInventarioID
	AND Sy_1.CodProducto = II.CodProducto
	WHERE II.existencia > 0
	  AND T.IDTipoTransaccion IN ('IN')
	  AND T.ClienteID = 1432
	  AND p.CodProducto like '7376%'
	GROUP BY t.BodegaId, ii.CodProducto
	ORDER BY t.BodegaId, ii.CodProducto


 SELECT CONVERT(VARCHAR(4),getdate(),108) 


 select * from EdiDB.dbo.PAYLESS_ProdPrioriDet D where D.Barcode like '7661818611'
 select * from EdiDB.dbo.PAYLESS_ProdPrioriDet D where D.Barcode like '7365822052' 

 select D.Barcode, D.Categoria, count(*) from EdiDB.dbo.PAYLESS_ProdPrioriDet D 
 group by D.Barcode, D.Categoria having count(*) > 1
 order by count(*) desc

select D.Barcode, D.Categoria, count(*) 
from EdiDB.dbo.PAYLESS_ProdPrioriDet D 
where D.Barcode like '7661818611'
group by D.Barcode, D.Categoria having count(*) > 1
order by D.Barcode desc
 where D.Barcode like '7661818611'

-- Ver fechas de BD SQLServer
DBCC USEROPTIONS; 
SELECT COUNT(1) FROM EdiDB.dbo.PAYLESS_ProdPrioriDet
--73,758
USE EdiDB
BEGIN
DECLARE @Barcode VARCHAR(11)
DECLARE @IdFirst INT
DECLARE @Count INT

DECLARE ProdCur CURSOR FOR
SELECT DISTINCT	--TOP 10000
	D.Barcode
FROM EdiDB.dbo.PAYLESS_ProdPrioriDet D 
ORDER BY D.Barcode

OPEN ProdCur

FETCH NEXT FROM ProdCur
INTO @Barcode

WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT TOP 1 @IdFirst = D.Id
	FROM EdiDB.dbo.PAYLESS_ProdPrioriDet D
	WHERE D.Barcode = @Barcode

	SELECT @Count = COUNT(*)
	FROM EdiDB.dbo.PAYLESS_ProdPrioriDet D
	WHERE D.Barcode = @Barcode
	IF (@Count > 1)
	BEGIN
		PRINT CONVERT(VARCHAR(32), @IdFirst	) + ' - ' + @Barcode + ' - ' +  CONVERT(VARCHAR(32), @Count)
		DELETE FROM EdiDB.dbo.PAYLESS_ProdPrioriDet
		WHERE Id IN (
			SELECT Id 
			FROM EdiDB.dbo.PAYLESS_ProdPrioriDet
			WHERE Barcode = @Barcode
			AND Id != @IdFirst
		)
		PRINT @@ROWCOUNT
	END

	FETCH NEXT FROM ProdCur
	INTO @Barcode
END
CLOSE ProdCur
DEALLOCATE ProdCur
END





------------------------------------- Remps-------------------------------------
--select * from ReMPS_Global.dbo.GLBtrackEvent
--select * from ReMPS_Global.dbo.GLBOrderTracking
--select * from ReMPS_Global.dbo.GLBRemark
--select * from ReMPS_Global.dbo.GLBLocation
--select * from ReMPS_Global.dbo.GLBTrackingNotification
--select * from ReMPS_Global.dbo.GLBNotiCenter
select * from ReMPS_Global.dbo.GLBMediaNotification

declare @IdRemark BIGINT = null
select @IdRemark

SELECT * FROM EdiDb.dbo.PaylessRutas
--delete from EdiDb.dbo.PaylessRutas where Id = 3
--truncate table EdiDb.dbo.PaylessRutas
select * from EdiDb.dbo.PAYLESS_Tiendas
--update EdiDb.dbo.PAYLESS_Tiendas SET RutaId = 5 where ClienteId = 1432

INSERT INTO EdiDb.dbo.PaylessRutas(NumRuta, Horario, ClienteId, CambioHorario)
VALUES(1, 'Martes a las 06:00am, opcional segunda entrega para el d�a Jueves', 385, 1)
GO
INSERT INTO EdiDb.dbo.PaylessRutas(NumRuta, Horario, ClienteId, CambioHorario)
VALUES(2, 'Mi�rcoles a las 06:00am, opcional segunda entrega para el d�a Viernes', 385, 2)
GO
--truncate table EdiDb.dbo.Notificaciones
select * from EdiDb.dbo.Notificaciones
INSERT INTO  EdiDb.dbo.Notificaciones(CodUsr, Mensaje)
VALUES('Admin', 'Hola mundo')
GO
INSERT INTO  EdiDb.dbo.Notificaciones(CodUsr, Mensaje)
VALUES('Admin', 'Tiene un mensaje')
GO

select * from EdiDB.dbo.TransaccionesTraslados

select * from remps_global.dbo.glbPartnerType
--insert into remps_global.dbo.glbPartnerType

select * from remps_global.dbo.GLBLocation

select * from remps_global.dbo.GLBTrackEvent

select * from remps_global.dbo.GLBOrderTrackingRemark

select * from remps_global.dbo.GlbOrderTracking order by IdOrderTracking desc
--update remps_global.dbo.GlbOrderTracking
--SET IsActive = 0
--WHERE IdOrderTracking < 361
--delete from remps_global.dbo.GlbOrderTracking where IdOrderTracking != 1


--alter table remps_global.dbo.GlbOrderTracking
--Add UploadDate datetime null
--alter table remps_global.dbo.glbTrackEvent
--drop column UploadDate
--truncate table remps_global.dbo.GlbOrderTracking
--delete from remps_global.dbo.GlbOrderTracking
--alter table remps_global.dbo.GlbOrderTracking
--drop Column IdTrackEvent


--Pricing
--RES = {FLETE} + ({CARGOS DE ORIGEN} - 10)
--sqrt(RES + AUDIFONOS)
SELECT * FROM ReMPS_Global.dbo.GLBPricing --spPricing_h_Insert, spPricingDetail_GetOne --*
SELECT * FROM ReMPS_Global.dbo.GLBClient --*
SELECT * FROM ReMPS_Global.dbo.GLBPricingDetail --*
SELECT * FROM ReMPS_Global.dbo.GLBPricingDetailRange  --*
SELECT * FROM ReMPS_Global.dbo.GLBRange --*
SELECT * FROM ReMPS_Global.dbo.GLBProduct --*
SELECT * FROM ReMPS_Global.dbo.GLBUnitMeasure --*
SELECT * FROM ReMPS_Global.dbo.GLBUnit --*
SELECT * FROM ReMPS_Global.dbo.GLBType --[dbo].[spType_GetAll] --*
SELECT * FROM ReMPS_Global.dbo.GLBCompanyTransport --GetAll, Insert, Update
SELECT * FROM ReMPS_Global.dbo.GLBShipmentType --GetAll, GetByIdType, GetOne
SELECT * FROM ReMPS_Global.dbo.GLBProduct --GetAll, GetOne, GetByCostCenter, Insert, Update
SELECT * FROM ReMPS_Global.dbo.GLBCity --GetAll, GetallAddress, GetByIdCountry, GetByIdDepartment, GetOne
SELECT * FROM ReMPS_Global.dbo.GLBTerminal --GetAll, Insert, Update, GetByIdCity
SELECT * FROM ReMPS_Global.dbo.GLBCityTerminal --*
SELECT * FROM ReMPS_Global.dbo.GLBCurrency --*
SELECT * FROM ReMPS_Global.dbo.GLBCountry --GetAll, GetOne, GetByAbbrv, GetByIdDepartment, GetByIdRegion
SELECT * FROM ReMPS_Global.dbo.GLBInCoTerm --GetAll
SELECT * FROM ReMPS_Global.dbo.GLBContainer --*
SELECT * FROM ReMPS_Global.dbo.GLBAgent --*
SELECT * FROM ReMPS_Global.dbo.GLBPartnerType --*
SELECT * FROM ReMPS_Global.dbo.GLBServiceLevel --*



7651800391


--EXEC sp_rename 'PricingDetailRange', 'GLBPricingDetailRange'








