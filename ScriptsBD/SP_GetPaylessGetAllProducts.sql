USE EdiDB
GO
IF OBJECT_ID('SP_GetPaylessGetAllProducts', 'P') IS NOT NULL
	DROP PROC SP_GetPaylessGetAllProducts
GO

CREATE PROCEDURE [dbo].SP_GetPaylessGetAllProducts 
@ClienteId int
AS
BEGIN
	EXEC EdiDb.dbo.SP_GetSetExistenciasByCliente @ClienteId, 'AdminHil'

	SELECT distinct SUBSTRING(D.Barcode, 1, 4) Tienda, D.Barcode, D.Categoria, D.Cp, D.Talla, D.Producto
	from EdiDB.dbo.WmsProductoExistencia Wpe
	JOIN EdiDb.dbo.PAYLESS_ProdPrioriDet D
		ON D.BarCode = Wpe.CodProducto
	where Wpe.CodUser = 'AdminHil' 
	AND Wpe.Existencia > 0

	DELETE FROM EdiDB.dbo.WmsProductoExistencia WHERE CodUser = 'AdminHil'
END
GO

exec EdiDB.dbo.SP_GetPaylessGetAllProducts 1432

select * from EdiDB.dbo.WmsProductoExistencia where CodUser = 'Admin'