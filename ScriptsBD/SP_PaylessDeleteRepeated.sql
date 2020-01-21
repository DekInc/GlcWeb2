--SP_PaylessDeleteRepeated
USE [EdiDB]
GO
/****** Object:  StoredProcedure [dbo].[SP_PaylessDeleteRepeated]    Script Date: 22/10/2019 14:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_PaylessDeleteRepeated] 
AS
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
			--PRINT CONVERT(VARCHAR(32), @IdFirst	) + ' - ' + @Barcode + ' - ' +  CONVERT(VARCHAR(32), @Count)

			DELETE FROM EdiDB.dbo.PAYLESS_ProdPrioriDet
			WHERE Id IN (
				SELECT Id 
				FROM EdiDB.dbo.PAYLESS_ProdPrioriDet
				WHERE Barcode = @Barcode
				AND Id != @IdFirst
			)
			--PRINT @@ROWCOUNT
		END

		FETCH NEXT FROM ProdCur
		INTO @Barcode
	END
	CLOSE ProdCur
	DEALLOCATE ProdCur
END

EXEC [SP_PaylessDeleteRepeated]
EXEC sp_who2

USE EdiDB
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('SP_WmsGetDisDet', 'P') IS NOT NULL
	DROP PROC SP_WmsGetDisDet
GO
CREATE PROCEDURE dbo.SP_WmsGetDisDet 
@TransaccionId INT
AS
BEGIN
	select
		P.CodProducto,
		I.Barcode,
		--P.Descripcion,
		I.TipoBulto,
		Um.UnidadMedida,
		1 Cantidad,
		D.CP,
		D.Categoria,
		D.Departamento,
		D.Producto,
		D.Talla		
	from wms.dbo.Transacciones T
	JOIN wms.dbo.DetalleTransacciones Dt
		ON Dt.TransaccionID = T.TransaccionID
	JOIN wms.dbo.Inventario I
		ON I.InventarioID = Dt.InventarioID
	JOIN wms.dbo.ItemInventario Ii
		ON Ii.InventarioID = I.InventarioID
	JOIN wms.dbo.Producto P
		ON P.CodProducto = Ii.CodProducto
	LEFT JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D
		ON D.Barcode = P.CodProducto
	LEFT JOIN wms.dbo.UnidadMedida Um
		ON Um.UnidadMedidaID = I.TipoBulto
	where T.TransaccionID = @TransaccionId
END
GO

EXEC SP_WmsGetDisDet 127871
--25011