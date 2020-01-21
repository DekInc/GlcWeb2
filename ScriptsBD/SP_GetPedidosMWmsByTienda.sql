USE EdiDB
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('SP_GetPedidosMWmsByTienda', 'P') IS NOT NULL
	DROP PROC SP_GetPedidosMWmsByTienda
GO

CREATE PROCEDURE [dbo].SP_GetPedidosMWmsByTienda 
@ClienteId INT,
@TiendaId VARCHAR(4)
AS
BEGIN
	--DECLARE @Cont INT = 0
	--SELECT @Cont = COUNT(*)	
	--FROM EdiDB.dbo.PedidosDetExternos Ped WITH (NOLOCK) 
	--JOIN EdiDB.dbo.PedidosExternos Pe WITH (NOLOCK) 
	--	ON Pe.Id = Ped.PedidoId AND Pe.ClienteID = @ClienteId
	--JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D WITH (NOLOCK) 
	--	ON D.Barcode = Ped.CodProducto
	--WHERE Ped.CodProducto like @TiendaId + '%'
	--AND D.CP IN ('A', 'H')
	--AND Pe.PedidoWMS IS NULL

	--IF (@Cont > 0)
	--BEGIN
	--	SELECT DISTINCT 
	--		P.ClienteID,
	--		P.PedidoBarcode,
	--		CONVERT(VARCHAR, P.fechapedido, 103) FechaPedido,
	--		P.fechapedido fechapedidoDt,
	--		E.Estatus,
	--		B.NomBodega,
	--		R.Regimen,
	--		P.Observacion,
	--		P.PedidoID,
	--		(SELECT COUNT(*) 
	--		FROM wms.dbo.DtllPedido Dp2 WITH (NOLOCK)
	--		WHERE Dp2.PedidoID = P.PedidoID
	--		AND Dp2.CodProducto like @TiendaId + '%') Total
	--	FROM wms.dbo.Pedido AS P WITH (NOLOCK)
	--	INNER JOIN wms.dbo.Estatus AS E WITH (NOLOCK) 
	--		ON E.EstatusID = P.EstatusID
	--	INNER JOIN wms.dbo.Bodegas AS B WITH (NOLOCK) 
	--		ON B.BodegaID = P.BodegaID
	--	INNER JOIN wms.dbo.Regimen AS R WITH (NOLOCK) 
	--		ON R.IDRegimen = P.RegimenID
	--	INNER JOIN wms.dbo.DtllPedido AS Dp WITH (NOLOCK) 
	--		ON Dp.PedidoID = P.PedidoID 
	--		AND Dp.CodProducto like @TiendaId + '%'		
	--	WHERE ClienteID = @ClienteId
	--	AND Dp.CodProducto IN (
	--		SELECT DISTINCT Ped.CodProducto
	--		FROM EdiDB.dbo.PedidosDetExternos Ped WITH (NOLOCK) 
	--		JOIN EdiDB.dbo.PedidosExternos Pe WITH (NOLOCK) 
	--			ON Pe.Id = Ped.PedidoId
	--		JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D WITH (NOLOCK) 
	--			ON D.Barcode = Ped.CodProducto
	--		WHERE Ped.CodProducto like @TiendaId + '%'
	--		AND D.CP != ''
	--	)
	--	ORDER BY P.fechapedido DESC
	--END
	--ELSE
	--BEGIN
		SELECT DISTINCT 
			P.ClienteID,
			P.PedidoBarcode,
			CONVERT(VARCHAR, P.fechapedido, 103) FechaPedido,
			P.fechapedido fechapedidoDt,
			E.Estatus,
			B.NomBodega,
			R.Regimen,
			P.Observacion,
			P.PedidoID,
			(SELECT COUNT(*) 
			FROM wms.dbo.DtllPedido Dp2 WITH (NOLOCK)
			WHERE Dp2.PedidoID = P.PedidoID
			AND Dp2.CodProducto like @TiendaId + '%') Total
		FROM wms.dbo.Pedido AS P WITH (NOLOCK)
		INNER JOIN wms.dbo.Estatus AS E WITH (NOLOCK) 
			ON E.EstatusID = P.EstatusID
		INNER JOIN wms.dbo.Bodegas AS B WITH (NOLOCK) 
			ON B.BodegaID = P.BodegaID
		INNER JOIN wms.dbo.Regimen AS R WITH (NOLOCK) 
			ON R.IDRegimen = P.RegimenID
		INNER JOIN wms.dbo.DtllPedido AS Dp WITH (NOLOCK) 
			ON Dp.PedidoID = P.PedidoID 
			AND Dp.CodProducto like @TiendaId + '%'		
		WHERE ClienteID = @ClienteId
		AND P.PedidoID NOT IN (
			SELECT P2.PedidoWMS 
			FROM EdiDB.dbo.PedidosExternos P2 WITH(NOLOCK) 
			WHERE P2.PedidoWMS IS NOT NULL
			AND P2.PedidoWMS NOT IN (
				SELECT SB1.PedidoID
				FROM (
					SELECT DISTINCT 
					Dp4.PedidoID, 
					SUBSTRING(Dp4.CodProducto, 1, 4) T
					FROM wms.dbo.DtllPedido Dp4
					JOIN wms.dbo.Pedido P4
						ON P4.PedidoID = Dp4.PedidoID
					WHERE P4.ClienteID = @ClienteId
				) SB1
				GROUP BY SB1.PedidoID
				HAVING COUNT(*) > 1
				)
			)
		ORDER BY P.fechapedido DESC
	--END
END
GO

EXEC SP_GetPedidosMWmsByTienda 1432, '7377'

SELECT COUNT(*)	
	FROM EdiDB.dbo.PedidosDetExternos Ped WITH (NOLOCK) 
	JOIN EdiDB.dbo.PedidosExternos Pe WITH (NOLOCK) 
		ON Pe.Id = Ped.PedidoId AND Pe.ClienteID = 1432
	JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D WITH (NOLOCK) 
		ON D.Barcode = Ped.CodProducto
	WHERE Ped.CodProducto like '7384%'
	AND D.CP != ''
	AND Pe.PedidoWMS IS NULL

SELECT DISTINCT 
	P.ClienteID,
	P.PedidoBarcode,
	CONVERT(VARCHAR, P.fechapedido, 103) FechaPedido,
	P.fechapedido fechapedidoDt,
	E.Estatus,
	B.NomBodega,
	R.Regimen,
	P.Observacion,
	P.PedidoID,
	(SELECT COUNT(*) 
	FROM wms.dbo.DtllPedido Dp2 WITH (NOLOCK)
	WHERE Dp2.PedidoID = P.PedidoID
	AND Dp2.CodProducto like '7377%') Total
FROM wms.dbo.Pedido AS P WITH (NOLOCK)
JOIN wms.dbo.Estatus AS E WITH (NOLOCK) 
	ON E.EstatusID = P.EstatusID
JOIN wms.dbo.Bodegas AS B WITH (NOLOCK) 
	ON B.BodegaID = P.BodegaID
JOIN wms.dbo.Regimen AS R WITH (NOLOCK) 
	ON R.IDRegimen = P.RegimenID
JOIN wms.dbo.DtllPedido AS Dp WITH (NOLOCK) 
	ON Dp.PedidoID = P.PedidoID 
	AND Dp.CodProducto like '7377%'		
WHERE ClienteID = 1432
AND P.PedidoID NOT IN (
	SELECT P2.PedidoWMS 
	FROM EdiDB.dbo.PedidosExternos P2 WITH(NOLOCK) 
	JOIN wms.dbo.DtllPedido Dp3 WITH(NOLOCK) 
		ON Dp3.PedidoID = P2.PedidoWMS
	WHERE P2.PedidoWMS IS NOT NULL
)
ORDER BY P.fechapedido DESC

select * from EdiDB.dbo.PedidosExternos where PedidoWMS = 78312

SELECT DISTINCT P2.PedidoWMS 
FROM EdiDB.dbo.PedidosExternos P2 WITH(NOLOCK) 
JOIN wms.dbo.DtllPedido Dp3 WITH(NOLOCK) 
	ON Dp3.PedidoID = P2.PedidoWMS
WHERE P2.PedidoWMS IS NOT NULL
AND P2.PedidoWMS IN (

)

SELECT SB1.PedidoID, COUNT(*)
FROM (
	SELECT DISTINCT 
	Dp4.PedidoID, 
	SUBSTRING(Dp4.CodProducto, 1, 4) T
	FROM wms.dbo.DtllPedido Dp4
	JOIN wms.dbo.Pedido P4
		ON P4.PedidoID = Dp4.PedidoID
	WHERE P4.ClienteID = 1432
) SB1
GROUP BY SB1.PedidoID
HAVING COUNT(*) > 1
