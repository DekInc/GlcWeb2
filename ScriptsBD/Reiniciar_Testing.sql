delete from EdiDB.dbo.PAYLESS_ProdPrioriDet where IdPAYLESS_ProdPrioriM > 57
GO
delete from EdiDB.dbo.PAYLESS_ProdPrioriM where Id > 57
GO
delete from EdiDB.dbo.PAYLESS_ProdPrioriArchM where Id > 110
GO
delete from EdiDB.dbo.PAYLESS_ProdPrioriArchDet where IdM > 110
GO
delete from EdiDB.dbo.PedidosExternos where Id > 721
GO
delete from EdiDB.dbo.PedidosDetExternos where PedidoId > 721
GO