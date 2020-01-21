use edidb
go
IF OBJECT_ID('GetPaylessSellQtysT', 'U') IS NOT NULL 
	DROP TABLE GetPaylessSellQtysT
GO
CREATE TABLE GetPaylessSellQtysT(
	[Id] [int] IDENTITY(1,1) PRIMARY KEY,	
	[Barcode] varchar(16) NULL,
	[Categoria] varchar(256) NULL,
	[CP] varchar(8) NULL,
	Producto varchar(16) NULL,
	[Talla] varchar(8) NULL,
	Lote varchar(8) NULL,
	[Departamento] varchar(16) NULL,
	Typ int,
	CodUser varchar(128)
) ON [PRIMARY]
GO
CREATE INDEX GetPaylessSellQtysTCu ON GetPaylessSellQtysT (CodUser);
GO