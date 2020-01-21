USE EdiDB
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF OBJECT_ID('SP_SetPaylessNewDis', 'P') IS NOT NULL
	DROP PROC dbo.SP_SetPaylessNewDis
GO
CREATE PROCEDURE dbo.SP_SetPaylessNewDis
@PedidoId int,
@CodUser VARCHAR(128)
AS
BEGIN
	DECLARE 
		@ClienteId INT, 
		@TiendaId INT, 
		@WomanQty INT,
		@ManQty INT,
		@KidQty INT,
		@AccQty INT,
		@WomanQtyT INT,
		@ManQtyT INT,
		@KidQtyT INT,
		@AccQtyT INT,
		@TotalCp INT

	SET @CodUser = @CodUser + 'Cp'	

	SELECT 
		@TotalCp = Pe.TotalCp,
		@ClienteId = Pe.ClienteId, 
		@TiendaId = Pe.TiendaId,
		@WomanQty = ISNULL(Pe.WomanQty, 0),
		@ManQty = ISNULL(Pe.ManQty, 0),
		@KidQty = ISNULL(Pe.KidQty, 0),
		@AccQty = ISNULL(Pe.AccQty, 0),
		@WomanQtyT = ISNULL(Pe.WomanQtyT, 0),
		@ManQtyT = ISNULL(Pe.ManQtyT, 0),
		@KidQtyT = ISNULL(Pe.KidQtyT, 0),
		@AccQtyT = ISNULL(Pe.AccQtyT, 0)
	FROM EdiDb.dbo.PedidosExternos Pe 
	WHERE Pe.Id = @PedidoId

	EXEC EdiDb.dbo.SP_GetPaylessSellQtys @ClienteId, @TiendaId,  @CodUser

	UPDATE EdiDB.dbo.PedidosExternos
	SET TotalCp = (
		SELECT COUNT(*) 
		FROM EdiDB.dbo.GetPaylessSellQtysT
		WHERE Typ = 2 AND CodUser = @CodUser
	) WHERE Id = @PedidoId

	INSERT INTO EdiDB.dbo.PedidosDetExternos(PedidoId, CodProducto, CantPedir)
	SELECT 
		@PedidoId, 
		Qty.Barcode, 
		1 
	FROM EdiDB.dbo.GetPaylessSellQtysT Qty 
	WHERE Qty.Typ = 2 AND Qty.CodUser = @CodUser	

	INSERT INTO EdiDB.dbo.PedidosDetExternos(PedidoId, CodProducto, CantPedir)
	SELECT TOP (@WomanQty)
		@PedidoId, 
		Qty.Barcode,
		1 
	FROM EdiDB.dbo.GetPaylessSellQtysT Qty 
	WHERE Qty.Typ = 1 AND Qty.CodUser = @CodUser
	AND Qty.Categoria = 'DAMAS'
	AND Qty.Barcode NOT IN (SELECT DISTINCT Ped.CodProducto FROM EdiDB.dbo.PedidosDetExternos Ped WHERE Ped.PedidoId = @PedidoId)
	UNION
	SELECT TOP (@ManQty)
		@PedidoId, 
		Qty.Barcode,
		1 
	FROM EdiDB.dbo.GetPaylessSellQtysT Qty 
	WHERE Qty.Typ = 1 AND Qty.CodUser = @CodUser
	AND Qty.Categoria = 'CABALLEROS'
	AND Qty.Barcode NOT IN (SELECT DISTINCT Ped.CodProducto FROM EdiDB.dbo.PedidosDetExternos Ped WHERE Ped.PedidoId = @PedidoId)
	UNION
	SELECT TOP (@KidQty)
		@PedidoId, 
		Qty.Barcode,
		1 
	FROM EdiDB.dbo.GetPaylessSellQtysT Qty 
	WHERE Qty.Typ = 1 AND Qty.CodUser = @CodUser
	AND Qty.Categoria = 'NIÑOS / AS'
	AND Qty.Barcode NOT IN (SELECT DISTINCT Ped.CodProducto FROM EdiDB.dbo.PedidosDetExternos Ped WHERE Ped.PedidoId = @PedidoId)
	UNION
	SELECT TOP (@AccQty)
		@PedidoId, 
		Qty.Barcode,
		1 
	FROM EdiDB.dbo.GetPaylessSellQtysT Qty 
	WHERE Qty.Typ = 1 AND Qty.CodUser = @CodUser
	AND Qty.Categoria = 'ACCESORIOS'
	AND Qty.Barcode NOT IN (SELECT DISTINCT Ped.CodProducto FROM EdiDB.dbo.PedidosDetExternos Ped WHERE Ped.PedidoId = @PedidoId)

	INSERT INTO EdiDB.dbo.PedidosDetExternos(PedidoId, CodProducto, CantPedir)
	SELECT TOP (@WomanQtyT)
		@PedidoId, 
		Qty.Barcode,
		1 
	FROM EdiDB.dbo.GetPaylessSellQtysT Qty 
	WHERE Qty.Typ = 3 AND Qty.CodUser = @CodUser
	AND Qty.Categoria = 'DAMAS'
	AND Qty.Barcode NOT IN (SELECT DISTINCT Ped.CodProducto FROM EdiDB.dbo.PedidosDetExternos Ped WHERE Ped.PedidoId = @PedidoId)
	UNION
	SELECT TOP (@ManQtyT)
		@PedidoId, 
		Qty.Barcode,
		1 
	FROM EdiDB.dbo.GetPaylessSellQtysT Qty 
	WHERE Qty.Typ = 3 AND Qty.CodUser = @CodUser
	AND Qty.Categoria = 'CABALLEROS'
	AND Qty.Barcode NOT IN (SELECT DISTINCT Ped.CodProducto FROM EdiDB.dbo.PedidosDetExternos Ped WHERE Ped.PedidoId = @PedidoId)
	UNION
	SELECT TOP (@KidQtyT)
		@PedidoId, 
		Qty.Barcode,
		1 
	FROM EdiDB.dbo.GetPaylessSellQtysT Qty 
	WHERE Qty.Typ = 3 AND Qty.CodUser = @CodUser
	AND Qty.Categoria like 'NI%'
	AND Qty.Barcode NOT IN (SELECT DISTINCT Ped.CodProducto FROM EdiDB.dbo.PedidosDetExternos Ped WHERE Ped.PedidoId = @PedidoId)
	UNION
	SELECT TOP (@AccQtyT)
		@PedidoId, 
		Qty.Barcode,
		1 
	FROM EdiDB.dbo.GetPaylessSellQtysT Qty 
	WHERE Qty.Typ = 3 AND Qty.CodUser = @CodUser
	AND Qty.Categoria like 'ACCES%'
	AND Qty.Barcode NOT IN (SELECT DISTINCT Ped.CodProducto FROM EdiDB.dbo.PedidosDetExternos Ped WHERE Ped.PedidoId = @PedidoId)
END

--truncate table EdiDB.dbo.ProductoUbicacion
--DELETE FROM EdiDB.dbo.PedidosDetExternos where PedidoId = 207
EXEC EdiDb.dbo.SP_SetPaylessNewDis 822, 'Admin'

SELECT COUNT(*) 
		FROM EdiDB.dbo.GetPaylessSellQtysT
		WHERE Typ = 2 AND CodUser = 'AdminCp'

TRUNCATE TABLE EdiDB.dbo.GetPaylessSellQtysT
TRUNCATE TABLE EdiDB.dbo.WmsProductoExistencia
SELECT * FROM EdiDB.dbo.PedidosExternos where Id = 208
SELECT * FROM EdiDB.dbo.PedidosDetExternos where PedidoId = 208
SELECT * FROM EdiDB.dbo.WmsProductoExistencia WHERE CodUser = 'Admin'
select distinct CodProducto from EdiDB.dbo.ProductoUbicacion where Typ = 7
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

--51
UPDATE EdiDB.dbo.PedidosExternos
	SET TotalCp = (
		SELECT COUNT(*) FROM (
		SELECT DISTINCT
		D.Barcode
	FROM EdiDB.dbo.WmsProductoExistencia Wpe WITH(NOLOCK)
	JOIN EdiDB.dbo.PAYLESS_ProdPrioriDet D WITH(NOLOCK)
		ON Wpe.CodProducto = D.Barcode
	WHERE Wpe.CodUser = 'Admin'
	AND D.Producto NOT IN (SELECT DISTINCT Ppt.Producto FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Producto IS NOT NULL)
	AND D.Talla NOT IN (SELECT DISTINCT Ppt.Talla FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Talla IS NOT NULL)
	AND D.Lote NOT IN (SELECT DISTINCT Ppt.Lote FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Lote IS NOT NULL)
	AND D.Categoria NOT IN (SELECT DISTINCT Ppt.Categoria FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Categoria IS NOT NULL)
	AND D.Departamento NOT IN (SELECT DISTINCT Ppt.Departamento FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.Departamento IS NOT NULL)
	AND D.CP IN (SELECT DISTINCT Ppt.CP FROM EdiDB.dbo.PaylessPedidosCpT Ppt WITH(NOLOCK) WHERE Ppt.CP IS NOT NULL)
	) SB1
	) WHERE Id = 218