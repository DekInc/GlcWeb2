--USE EdiDb;
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
IF OBJECT_ID('spGeneraSalida', 'P') IS NOT NULL
BEGIN
	DROP PROC spGeneraSalida;
END
CREATE PROCEDURE dbo.spGeneraSalida 
AS
	@fecha_sal AS date=NULL,
	@bodegaID AS int=NULL,
	@regimenID AS int=NULL,
	@clienteID AS int=NULL,
	@locationID AS int=NULL,
	@rackID AS int=NULL AS IF @rackID=0
BEGIN
SET @rackID=NULL IF @locationID=0
SET @locationID=NULL IF @regimenID=0
SET @regimenID=NULL IF @clienteID=0
SET @clienteID=NULL IF @bodegaID=0
SET @bodegaID=NULL IF @fecha_sal='01/01/01'
SET @fecha_sal=NULL
SELECT ii.InventarioID ,
       ii.ItemInventarioID ,
       ii.CodProducto ,
       p.descripcion ,
       II.CantidadInicial ,
       isnull(II.CantidadInicial/(i.CantidadInicial/nullif(i.articulos, 0)), 0) AS bultosinicial ,
       II.CantidadInicial*II.precio AS valorInicial ,
       i.rack ,
       r.NombreRack ,
       isnull(i.CantidadInicial/nullif(i.articulos, 0), 0) AS uxb ,
       ii.CantidadInicial-isnull(Sy_1.reservado, 0) AS existencia ,
       isnull(Sy_2.reservado, 0) AS reservado ,
       isnull((ii.CantidadInicial-isnull(Sy_1.reservado, 0))/(i.CantidadInicial/nullif(i.articulos, 0)), 0) AS BultosExis ,
       (ii.CantidadInicial-isnull(Sy_1.reservado, 0))*ii.precio AS valorexis ,
       ii.numero_oc ,
       ii.lote ,
       ii.fecha_vcmto ,
       ii.modelo ,
       ii.cod_equivale,
       ii.estilo,
       paises.nompais,
       dt.INFORME_ALMACEN AS nodt,
       dt.FE_INFORME_ALMACEN AS Fecha_Dt,
       dt.IM_5 AS nodm,
       dt.FE_IM_5 AS fecha_dm,
       0000000000000000000.00 AS solicitado,
       ii.precio,
       ii.observacion,
       t.fechatransaccion,
       u.UnidadMedida,
       iI.fechaitem,
       t.bodegaid,
       t.regimenid,
       isnull((ii.CantidadInicial-isnull(Sy_1.reservado, 0))/(i.CantidadInicial/nullif(i.peso, 0)), 0) AS peso,
       isnull((ii.CantidadInicial-isnull(Sy_1.reservado, 0))/(i.CantidadInicial/nullif(i.volumen, 0)), 0) AS cbm,
       t.clienteid,
       c.nombre AS nombrecliente,
       B.nombodega,
       i.barcode,
       t.NoTransaccion,
       isnull(ii.cantidadinicial/(i.CantidadInicial/nullif(i.volumen, 0)), 0) AS cbm_ini,
       isnull(ii.cantidadinicial/(i.CantidadInicial/nullif(i.peso, 0)), 0) AS peso_ini,
       rg.regimen,
       t.contenedor
FROM wms.dbo.ItemInventario AS ii
INNER JOIN wms.dbo.inventario AS i ON i.InventarioID=ii.InventarioID
INNER JOIN wms.dbo.producto AS p ON p.codproducto=ii.codproducto
LEFT JOIN wms.dbo.racks AS r ON r.rack=i.rack
LEFT JOIN wms.dbo.metodo_descargo md ON md.descargoID=p.descargoid
INNER JOIN wms.dbo.DetalleTransacciones AS d1 ON d1.InventarioID=i.InventarioID
INNER JOIN wms.dbo.transacciones AS T ON t.TransaccionID=d1.TransaccionID
LEFT JOIN wms.dbo.Bodegas AS B ON b.bodegaid=t.bodegaid
INNER JOIN wms.dbo.Clientes AS C ON C.ClienteID = T.ClienteID
LEFT JOIN wms.dbo.DocumentosxTransaccion AS dt ON dt.transaccionid = t.transaccionid
LEFT JOIN wms.dbo.paises ON paises.paisid=ii.pais_orig
LEFT JOIN wms.dbo.unidadmedida AS u ON u.unidadmedidaid=p.unidadmedida
INNER JOIN wms.dbo.Regimen AS rg ON rg.IDRegimen=t.RegimenID
INNER JOIN wms.dbo.locations l ON l.locationid=b.locationid
LEFT OUTER JOIN
  (SELECT Sy.InventarioID,
          Sy.ItemInventarioID,
          Sy.CodProducto,
          SUM(ISNULL(Sy.Cantidad, 0)) AS Reservado
   FROM wms.dbo.SysTempSalidas AS Sy
   INNER JOIN wms.dbo.Pedido AS Pe ON Pe.PedidoID = Sy.PedidoID
   INNER JOIN wms.dbo.Transacciones AS t ON t.TransaccionID=sy.TransaccionID
   AND t.IDTipoTransaccion IN ('SA',
                               'XL')--  WHERE (Pe.EstatusID  )

   GROUP BY Sy.InventarioID,
            sy.ItemInventarioID,
            Sy.CodProducto) AS Sy_1 ON Sy_1.InventarioID = I.InventarioID
AND Sy_1.ItemInventarioID = II.ItemInventarioID
AND Sy_1.CodProducto = II.CodProducto
LEFT OUTER JOIN
  (SELECT Sy.InventarioID,
          Sy.ItemInventarioID,
          Sy.CodProducto,
          SUM(ISNULL(Sy.Cantidad, 0)) AS Reservado
   FROM wms.dbo.SysTempSalidas AS Sy
   INNER JOIN wms.dbo.Pedido AS Pe ON Pe.PedidoID = Sy.PedidoID
   INNER JOIN wms.dbo.Transacciones AS t ON t.TransaccionID=sy.TransaccionID
   AND t.IDTipoTransaccion IN ('SA',
                               'XL')
   WHERE (Pe.EstatusID NOT IN (9,
                               10))
   GROUP BY Sy.InventarioID,
            sy.ItemInventarioID,
            Sy.CodProducto) AS Sy_2 ON Sy_2.InventarioID = I.InventarioID
AND Sy_2.ItemInventarioID = II.ItemInventarioID
AND Sy_2.CodProducto = II.CodProducto
WHERE ii.CodProducto=isnull(@cod_producto, ii.CodProducto)
  AND (isnull(ii.cantidadinicial, 0) -isnull(sy_1.Reservado, 0))>0
  AND T.IDTipoTransaccion IN ('IN')
  AND t.ClienteID=isnull(@clienteID, t.ClienteID)
  AND t.BodegaID=isnull(@bodegaID, t.BodegaID)
  AND t.RegimenID=isnull(@regimenID, t.RegimenID)
  AND i.rack=isnull(@rackID, i.Rack)
  AND b.locationid=isnull(@locationID, b.locationid)
  AND t.EstatusID>=l.IDinvShow
  AND CASE
          WHEN p.descargoid =1 THEN t.FechaTransaccion
          WHEN p.descargoid =2 THEN ii.fecha_vcmto
          WHEN p.descargoid =3 THEN t.FechaTransaccion
      END <= @fecha_sal
ORDER BY CASE
             WHEN p.descargoid IN (1,
                                   3) THEN t.FechaTransaccion
             ELSE ii.fecha_vcmto
END;