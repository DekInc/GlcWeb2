USE EdiDB
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('SP_GetPedidosPendientesAdmin', 'P') IS NOT NULL
	DROP PROC dbo.SP_GetPedidosPendientesAdmin
GO
CREATE PROCEDURE dbo.SP_GetPedidosPendientesAdmin
@ClienteId INT
AS
BEGIN
	DELETE FROM EdiDB.dbo.ProductoUbicacion WHERE Typ = 1
	INSERT INTO EdiDB.dbo.ProductoUbicacion (Typ, CodProducto, NomBodega, Rack, NombreRack)
	SELECT DISTINCT 1, 
		Ii.CodProducto, 
		B.NomBodega, 
		R.Rack, 
		R.NombreRack		
		from wms.dbo.ItemInventario Ii WITH(NOLOCK)
		JOIN wms.dbo.DetalleTransacciones Dt WITH(NOLOCK)
			ON Dt.InventarioID = Ii.InventarioID
		JOIN wms.dbo.Transacciones Tr WITH(NOLOCK)
			ON Tr.TransaccionID = Dt.TransaccionID
		JOIN wms.dbo.Inventario I WITH(NOLOCK)
			ON I.InventarioID = Ii.InventarioID
		JOIN wms.dbo.Racks R WITH(NOLOCK)
			ON R.Rack = I.Rack
		JOIN wms.dbo.Bodegas B WITH(NOLOCK)
			ON B.BodegaID = Tr.BodegaID
		where I.ClienteID = @ClienteId
		AND Ii.Existencia > 0

	SELECT DISTINCT
		Pe.Id,
		Pu.NomBodega,
		Pe.TiendaId,
		Pe.FechaPedido,
		M.Periodo,
		D.Categoria,
		D.CP,
		D.Barcode,
		Pu.Rack,
		Pu.NombreRack,
		D.Departamento,
		null Producto,
		null Lote,
		null Talla,
		Pe.FullPed,
		Pe.Divert,
		Pe.TiendaIdDestino		
	FROM EdiDB.dbo.PedidosExternos Pe WITH(NOLOCK)
	JOIN EdiDB.dbo.PedidosDetExternos PeD WITH(NOLOCK)
		ON PeD.PedidoId = Pe.Id
	JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D WITH(NOLOCK)
		ON D.Barcode = PeD.CodProducto
	JOIN EdiDB.dbo.PAYLESS_ProdPrioriM M WITH(NOLOCK)
		ON M.Id = D.IdPAYLESS_ProdPrioriM
	LEFT JOIN EdiDB.dbo.ProductoUbicacion Pu WITH(NOLOCK)
		ON Pu.CodProducto = PeD.CodProducto AND Pu.Typ = 1
	WHERE Pe.IdEstado IN (2, 4)
	AND Pe.ClienteID = @ClienteId
	ORDER BY Pe.Id, Pe.TiendaId, M.Periodo, D.Categoria, D.Barcode
END

EXEC EdiDb.dbo.SP_GetPedidosPendientesAdmin 1432

select * from EdiDB.dbo.ProductoUbicacion
select distinct Typ from select * from EdiDB.dbo.ProductoUbicacion
truncate table EdiDB.dbo.ProductoUbicacion