--3447
--4067
select distinct BarCode,
Producto as Lote,
Talla,
Lote as Estilo,
Categoria,
Departamento,
CP
 from  EdiDb.dbo.PAYLESS_ProdPrioriDet where BarCode in (
SELECT [Barcode]
  FROM [EdiDB].[dbo].[Trasladado1]
) order by barcode
select * from EdiDb.dbo.IEnetUsers
select * from EdiDb.dbo.PaylessPedidosCpT
select * from EdiDb.dbo.PAYLESS_ProdPrioriM
--1
alter table EdiDb.dbo.PaylessPedidosCpT
ADD ClienteId int
--update EdiDb.dbo.PaylessPedidosCpT SET ClienteId = 1432


