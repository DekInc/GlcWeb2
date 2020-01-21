USE EdiDB
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('SP_GetPeticionesAdminB', 'P') IS NOT NULL
	DROP PROC dbo.SP_GetPeticionesAdminB
GO
CREATE PROCEDURE dbo.SP_GetPeticionesAdminB
@ClienteId INT
AS
BEGIN
	DECLARE @Cont int

	--DELETE FROM EdiDB.dbo.ProductoUbicacion WHERE Typ IN (3)
	SELECT @Cont = COUNT(*) FROM EdiDB.dbo.ProductoUbicacion WHERE Typ = 2 AND CodUser = CONVERT(VARCHAR(4), getdate(), 108)
	--SELECT @Cont
	IF (@Cont = 0)
	BEGIN
		DELETE FROM EdiDB.dbo.ProductoUbicacion WHERE Typ IN (2, 3)
		INSERT INTO EdiDB.dbo.ProductoUbicacion (Typ, CodProducto, NomBodega, Rack, NombreRack, Departamento, CodUser)
		SELECT DISTINCT 2, 
			Dp2.CodProducto, 
			(SELECT TOP 1 
				D2.Categoria
			FROM EdiDB.dbo.PAYLESS_ProdPrioriDet D2 WITH(NOLOCK)
			WHERE D2.Barcode = Dp2.CodProducto) Categoria,
			Pe.PedidoWMS,
			(SELECT TOP 1 
				D2.CP
			FROM EdiDB.dbo.PAYLESS_ProdPrioriDet D2 WITH(NOLOCK)
			WHERE D2.Barcode = Dp2.CodProducto) CP,
			(SELECT TOP 1 
				D2.Departamento
			FROM EdiDB.dbo.PAYLESS_ProdPrioriDet D2 WITH(NOLOCK)
			WHERE D2.Barcode = Dp2.CodProducto) Depto,
			CONVERT(VARCHAR(4),getdate(),108)
		FROM wms.dbo.DtllPedido Dp2 WITH(NOLOCK)			
		JOIN EdiDB.dbo.PedidosExternos Pe WITH(NOLOCK)
			ON Dp2.PedidoId = Pe.PedidoWMS
		WHERE Pe.ClienteID = @ClienteId

		INSERT INTO EdiDB.dbo.ProductoUbicacion (Typ, CodProducto, NomBodega, Rack, NombreRack, Departamento)
		SELECT DISTINCT 3, 
			Dp2.CodProducto, 
			(SELECT TOP 1 
				D2.Categoria
			FROM EdiDB.dbo.PAYLESS_ProdPrioriDet D2 WITH(NOLOCK)
			WHERE D2.Barcode = Dp2.CodProducto) Categoria,
			Pe.Id,
			(SELECT TOP 1 
				D2.CP
			FROM EdiDB.dbo.PAYLESS_ProdPrioriDet D2 WITH(NOLOCK)
			WHERE D2.Barcode = Dp2.CodProducto) CP,
			(SELECT TOP 1 
				D2.Departamento
			FROM EdiDB.dbo.PAYLESS_ProdPrioriDet D2 WITH(NOLOCK)
			WHERE D2.Barcode = Dp2.CodProducto) Depto
		FROM EdiDB.dbo.PedidosDetExternos Dp2 WITH(NOLOCK)			
		JOIN EdiDB.dbo.PedidosExternos Pe WITH(NOLOCK)
			ON Dp2.PedidoId = Pe.Id
		WHERE Pe.ClienteId = @ClienteId
	END

	SELECT DISTINCT
		Pe.Id,		
		Pe.TiendaId,
		T.Descr,
		Pe.WomanQty,
		Pe.ManQty,
		Pe.KidQty,
		Pe.AccQty,				
		Pe.FechaCreacion,
		Pe.FechaPedido,		
		(SELECT COUNT(DISTINCT SB1.Barcode) FROM (
		SELECT DISTINCT D.Barcode
			FROM EdiDb.dbo.PedidosDetExternos Pd WITH(NOLOCK)
			JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D WITH(NOLOCK)
				ON D.Barcode = Pd.CodProducto
			WHERE Pd.PedidoId = Pe.Id
			AND D.CP IN (SELECT DISTINCT Ppt.CP FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.CP IS NOT NULL)
			--AND D.Producto NOT IN (SELECT DISTINCT Ppt.Producto FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Producto IS NOT NULL)
			--AND D.Talla NOT IN (SELECT DISTINCT Ppt.Talla FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Talla IS NOT NULL)
			--AND D.Lote NOT IN (SELECT DISTINCT Ppt.Lote FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Lote IS NOT NULL)
			--AND D.Categoria NOT IN (SELECT DISTINCT Ppt.Categoria FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Categoria IS NOT NULL)
			--AND D.Departamento NOT IN (SELECT DISTINCT Ppt.Departamento FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Departamento IS NOT NULL)			
		) SB1) TotalCp,
		Pe.PedidoWMS,
		Pe.IdEstado,
		(
			SELECT COUNT(DISTINCT D.Barcode)
			FROM EdiDB.dbo.ProductoUbicacion Pu1 WITH(NOLOCK)
			JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D WITH(NOLOCK)
				ON D.Barcode = Pu1.CodProducto
			WHERE Pu1.Typ = 2
			AND UPPER(Pu1.NomBodega) = 'DAMAS'
			AND Pu1.Rack = Pe.PedidoWMS
			--AND D.CP NOT IN (SELECT DISTINCT Ppt.CP FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.CP IS NOT NULL)
			--AND D.Producto NOT IN (SELECT DISTINCT Ppt.Producto FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Producto IS NOT NULL)
			--AND D.Talla NOT IN (SELECT DISTINCT Ppt.Talla FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Talla IS NOT NULL)
			--AND D.Lote NOT IN (SELECT DISTINCT Ppt.Lote FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Lote IS NOT NULL)
			--AND D.Categoria NOT IN (SELECT DISTINCT Ppt.Categoria FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Categoria IS NOT NULL)
			--AND D.Departamento NOT IN (SELECT DISTINCT Ppt.Departamento FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Departamento IS NOT NULL)
		) WomanQtyEnv,
		(
			SELECT COUNT(DISTINCT D.Barcode)
			FROM EdiDB.dbo.ProductoUbicacion Pu1 WITH(NOLOCK)
			JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D WITH(NOLOCK)
				ON D.Barcode = Pu1.CodProducto
			WHERE Pu1.Typ = 2
			AND UPPER(Pu1.NomBodega) = 'CABALLEROS'
			AND Pu1.Rack = Pe.PedidoWMS
			--AND D.CP NOT IN (SELECT DISTINCT Ppt.CP FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.CP IS NOT NULL)
			--AND D.Producto NOT IN (SELECT DISTINCT Ppt.Producto FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Producto IS NOT NULL)
			--AND D.Talla NOT IN (SELECT DISTINCT Ppt.Talla FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Talla IS NOT NULL)
			--AND D.Lote NOT IN (SELECT DISTINCT Ppt.Lote FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Lote IS NOT NULL)
			--AND D.Categoria NOT IN (SELECT DISTINCT Ppt.Categoria FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Categoria IS NOT NULL)
			--AND D.Departamento NOT IN (SELECT DISTINCT Ppt.Departamento FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Departamento IS NOT NULL)
		) ManQtyEnv,
		(
			SELECT COUNT(DISTINCT D.Barcode)
			FROM EdiDB.dbo.ProductoUbicacion Pu1 WITH(NOLOCK)
			JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D WITH(NOLOCK)
				ON D.Barcode = Pu1.CodProducto
			WHERE Pu1.Typ = 2
			AND UPPER(Pu1.NomBodega) = 'NI�OS / AS'
			AND Pu1.Rack = Pe.PedidoWMS
			--AND D.CP NOT IN (SELECT DISTINCT Ppt.CP FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.CP IS NOT NULL)
			--AND D.Producto NOT IN (SELECT DISTINCT Ppt.Producto FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Producto IS NOT NULL)
			--AND D.Talla NOT IN (SELECT DISTINCT Ppt.Talla FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Talla IS NOT NULL)
			--AND D.Lote NOT IN (SELECT DISTINCT Ppt.Lote FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Lote IS NOT NULL)
			--AND D.Categoria NOT IN (SELECT DISTINCT Ppt.Categoria FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Categoria IS NOT NULL)
			--AND D.Departamento NOT IN (SELECT DISTINCT Ppt.Departamento FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Departamento IS NOT NULL)
		) KidQtyEnv,
		(
			SELECT COUNT(DISTINCT D.Barcode)
			FROM EdiDB.dbo.ProductoUbicacion Pu1 WITH(NOLOCK)
			JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D WITH(NOLOCK)
				ON D.Barcode = Pu1.CodProducto
			WHERE Pu1.Typ = 2
			AND UPPER(Pu1.NomBodega) = 'ACCESORIOS'
			AND Pu1.Rack = Pe.PedidoWMS
			--AND D.CP NOT IN (SELECT DISTINCT Ppt.CP FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.CP IS NOT NULL)
			--AND D.Producto NOT IN (SELECT DISTINCT Ppt.Producto FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Producto IS NOT NULL)
			--AND D.Talla NOT IN (SELECT DISTINCT Ppt.Talla FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Talla IS NOT NULL)
			--AND D.Lote NOT IN (SELECT DISTINCT Ppt.Lote FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Lote IS NOT NULL)
			--AND D.Categoria NOT IN (SELECT DISTINCT Ppt.Categoria FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Categoria IS NOT NULL)
			--AND D.Departamento NOT IN (SELECT DISTINCT Ppt.Departamento FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Departamento IS NOT NULL)
		) AccQtyEnv,
		(
			SELECT COUNT(DISTINCT D.Barcode)
			FROM EdiDB.dbo.ProductoUbicacion Pu1 WITH(NOLOCK)
			JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D WITH(NOLOCK)
				ON D.Barcode = Pu1.CodProducto
			WHERE Pu1.Typ = 2
			AND D.CP IN (SELECT DISTINCT Ppt.CP FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.CP IS NOT NULL)
			--AND D.Producto NOT IN (SELECT DISTINCT Ppt.Producto FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Producto IS NOT NULL)
			--AND D.Talla NOT IN (SELECT DISTINCT Ppt.Talla FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Talla IS NOT NULL)
			--AND D.Lote NOT IN (SELECT DISTINCT Ppt.Lote FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Lote IS NOT NULL)
			--AND D.Categoria NOT IN (SELECT DISTINCT Ppt.Categoria FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Categoria IS NOT NULL)
			--AND D.Departamento NOT IN (SELECT DISTINCT Ppt.Departamento FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Departamento IS NOT NULL)
			AND Pu1.Rack = Pe.PedidoWMS
		) TotalCpEnv,
		Pe.FullPed,
		Pe.Divert,
		Pe.TiendaIdDestino,
		Pe.WomanQtyT,
		Pe.ManQtyT,
		Pe.KidQtyT,
		Pe.AccQtyT,
		(SELECT COUNT(DISTINCT SB2.Barcode) FROM (
		SELECT DISTINCT D.Barcode
			FROM EdiDb.dbo.PedidosDetExternos Pd WITH(NOLOCK)
			JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D WITH(NOLOCK)
				ON D.Barcode = Pd.CodProducto
			WHERE Pd.PedidoId = Pe.Id
		) SB2) TotalPedido,
		(
			SELECT COUNT(DISTINCT D.Barcode)
			FROM EdiDB.dbo.ProductoUbicacion Pu1 WITH(NOLOCK)
			JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D WITH(NOLOCK)
				ON D.Barcode = Pu1.CodProducto
			WHERE Pu1.Typ = 2			
			AND Pu1.Rack = Pe.PedidoWMS
		) TotalEnv
	FROM EdiDB.dbo.PedidosExternos Pe WITH(NOLOCK)
	LEFT JOIN EdiDB.dbo.PAYLESS_Tiendas T WITH(NOLOCK)
		ON T.TiendaId = Pe.TiendaId	
	WHERE Pe.ClienteId = @ClienteId
	
	--DELETE FROM EdiDB.dbo.ProductoUbicacion WHERE Typ IN (2)
END












--DELETE FROM EdiDB.dbo.ProductoUbicacion
select * from EdiDB.dbo.ProductoUbicacion with(nolock) where Typ = '2'
--truncate table EdiDB.dbo.ProductoUbicacion
EXEC EdiDb.dbo.SP_GetPeticionesAdminB 1432
--2617 not in
select distinct Typ from EdiDB.dbo.ProductoUbicacion 
select distinct CodProducto, NomBodega, Rack, NombreRack, Departamento from EdiDB.dbo.ProductoUbicacion 
WHERE Typ = 3 
AND NomBodega = 'DAMAS'
AND (Departamento IN ('9', '10', '11', '5')
and NombreRack in ('A', 'H')
)
--AND Rack = '152'
ORDER BY NomBodega

select distinct CodProducto, NomBodega, Rack, NombreRack, Departamento from EdiDB.dbo.ProductoUbicacion 
WHERE Typ = 2
AND Rack = 71808
--51

SELECT COUNT(DISTINCT d.Barcode)
			FROM EdiDB.dbo.ProductoUbicacion Pu1 WITH(NOLOCK)
			JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D WITH(NOLOCK)
				ON D.Barcode = Pu1.CodProducto
			WHERE Pu1.Typ = 2
			AND UPPER(Pu1.NomBodega) = 'ACCESORIOS'
			AND Pu1.Rack = 71808
			AND D.CP NOT IN (SELECT DISTINCT Ppt.CP FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.CP IS NOT NULL)

SELECT COUNT(DISTINCT D.Barcode)
FROM EdiDB.dbo.ProductoUbicacion Pu1 WITH(NOLOCK)
JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D WITH(NOLOCK)
	ON D.Barcode = Pu1.CodProducto
WHERE Pu1.Typ = 2
AND UPPER(Pu1.NomBodega) = 'DAMAS'
AND Pu1.Rack = 71808


DECLARE @Cont int

	DELETE FROM EdiDB.dbo.ProductoUbicacion WHERE Typ IN (2, 3)
	SELECT @Cont = COUNT(*) FROM EdiDB.dbo.ProductoUbicacion WHERE Typ = 2 AND CodUser = CONVERT(VARCHAR(4),getdate(),108)
	SELECT @Cont