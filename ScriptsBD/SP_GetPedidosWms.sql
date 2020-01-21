USE EdiDB
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('SP_GetPedidosWms', 'P') IS NOT NULL
	DROP PROC SP_GetPedidosWms
GO

CREATE PROCEDURE [dbo].SP_GetPedidosWms @IdClient INT
AS
BEGIN
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
	WHERE ClienteID = @IdClient
	ORDER BY P.fechapedido DESC
END
GO

EXEC [SP_GetPedidosWms] 1432