USE EdiDB
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('SP_GetSetExistenciasByCliente', 'P') IS NOT NULL
	DROP PROC dbo.SP_GetSetExistenciasByCliente
GO
CREATE PROCEDURE dbo.SP_GetSetExistenciasByCliente
@ClienteId int,
@CodUser VARCHAR(128),
@AllExist int = 0
AS
BEGIN
	DELETE FROM EdiDB.dbo.WmsProductoExistencia WHERE CodUser = @CodUser
	INSERT INTO EdiDB.dbo.WmsProductoExistencia(BodegaId, CodProducto, Existencia, CodUser)
	SELECT 
		t.BodegaId,
		ii.CodProducto,
		SUM(ii.CantidadInicial - isnull(Sy_1.reservado, 0)) AS existencia,
		@CodUser CodUser
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
			AND Pe.ClienteID = @ClienteId
	   GROUP BY Sy.InventarioID,
				sy.ItemInventarioID,
				Sy.CodProducto) AS Sy_1 ON Sy_1.InventarioID = I.InventarioID
	AND Sy_1.ItemInventarioID = II.ItemInventarioID
	AND Sy_1.CodProducto = II.CodProducto
	WHERE 
	(@AllExist = 1 OR II.existencia > 0) AND 
	  T.IDTipoTransaccion IN ('IN')
	  AND T.ClienteID = @ClienteId
	GROUP BY t.BodegaId, ii.CodProducto
	ORDER BY t.BodegaId, ii.CodProducto

	IF(@AllExist = 1)
	BEGIN
		DELETE FROM EdiDB.dbo.WmsProductoExistencia WHERE CodUser = @CodUser
		AND CodProducto NOT IN (
			SELECT DISTINCT
				WpeEx.CodProducto
			FROM EdiDB.dbo.WmsProductoExistencia WpeEx
			WHERE WpeEx.CodUser = @CodUser + '232'
		)
		DELETE FROM EdiDB.dbo.WmsProductoExistencia WHERE CodUser = @CodUser + '232'
	END

	--DELETE FROM EdiDB.dbo.WmsProductoExistencia WHERE CodUser = @CodUser
	--AND CodProducto IN (
	--	SELECT DISTINCT
	--		CodProducto
	--	FROM EdiDB.dbo.PedidosExternos Pe WITH(NOLOCK)
	--	JOIN EdiDB.dbo.PedidosDetExternos Pde WITH(NOLOCK)
	--		ON Pde.PedidoId = Pe.Id
	--	WHERE Pe.PedidoWMS IS NULL
	--)
END

EXEC EdiDb.dbo.SP_GetSetExistenciasByCliente 385, 'Admin', 0
--11537
--7055
--DELETE FROM EdiDB.dbo.WmsProductoExistencia where CodUser = 'Admin' 
SELECT distinct CodProducto from EdiDB.dbo.WmsProductoExistencia where CodUser = 'Admin' 
AND Existencia > 0 
AND CodProducto like '7650%' --293
order by CodProducto
--450 
SELECT * from EdiDB.dbo.WmsProductoExistencia where CodUser = 'Admin' AND Existencia = 1 AND CodProducto like '7659%' --293
SELECT * FROM wms.dbo.SysTempSalidas S where S.CodProducto like '7659%'
select distinct barcode from EdiDb.dbo.PAYLESS_ProdPrioriDet D where D.Barcode like '7650%'
--hay 463 sin descontar lo pendiente o solicitado
-- 346 segun priori
--306 - 48 =  258
-- 48 salidas
--306 segun existencia wms
-- supuesto total web 346, solicitado 145, disponible 201
-- 189 muestra a la tienda disponible para hacer pedido + 145 solicitado = 334
SELECT DISTINCT
CodProducto
FROM EdiDB.dbo.PedidosExternos Pe
JOIN EdiDB.dbo.PedidosDetExternos Pde
	ON Pde.PedidoId = Pe.Id
WHERE Pe.PedidoWMS IS NULL

EXEC EdiDb.dbo.SP_GetSetExistenciasByCliente 385, 'Admin', 0
SELECT distinct SUBSTRING(D.Barcode, 1, 4) Tienda, D.Barcode, D.Categoria, D.Cp, D.Talla, D.Producto
from EdiDB.dbo.WmsProductoExistencia Wpe
JOIN EdiDb.dbo.PAYLESS_ProdPrioriDet D
	ON D.BarCode = Wpe.CodProducto
where Wpe.CodUser = 'Admin' 
AND Wpe.Existencia > 0 
AND Wpe.CodProducto like '7650%' --293
--AND D.Categoria = 'NI�OS / AS'
order by SUBSTRING(D.Barcode, 1, 4), D.Categoria, D.Cp


select * from wms.dbo.Producto where CodProducto in (
SELECT distinct CodProducto from EdiDB.dbo.WmsProductoExistencia where CodUser = 'Admin232')

