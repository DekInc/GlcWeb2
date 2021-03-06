USE [EdiDB]
GO
/****** Object:  StoredProcedure [dbo].[SP_GeneraSalidaWms]    Script Date: 15/8/2019 13:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[SP_GeneraSalidaWms]
 @fecha_sal as date=null,
 @cod_producto as varchar(50)=null,
 @bodegaID as int=null,
 @regimenID as int=null,
 @clienteID as int=null,
 @locationID as int=null,
 @rackID as int=null
as
begin

if @rackID=0
 set @rackID=null

 if @locationID=0
 set @locationID=null

 if @regimenID=0
 set @regimenID=null

 if @clienteID=0
 set @clienteID=null

 if @bodegaID=0
 set @bodegaID=null
if @fecha_sal='01/01/01'
set	@fecha_sal=null

SELECT ii.InventarioID
      ,ii.ItemInventarioID
      ,ii.CodProducto
      ,p.descripcion
      ,II.CantidadInicial
      ,isnull(II.CantidadInicial/(i.CantidadInicial/nullif(i.articulos,0)),0) as bultosinicial
      ,II.CantidadInicial*II.precio as valorInicial 
      ,i.rack  
      ,r.NombreRack
      ,isnull(i.CantidadInicial/nullif(i.articulos,0),0) as uxb 
      ,ii.CantidadInicial-isnull(Sy_1.reservado,0) as existencia
	  ,isnull(Sy_2.reservado,0) as reservado
      ,isnull((ii.CantidadInicial-isnull(Sy_1.reservado,0))/(i.CantidadInicial/nullif(i.articulos,0)),0) as BultosExis
      ,(ii.CantidadInicial-isnull(Sy_1.reservado,0))*ii.precio as valorexis 
      ,ii.numero_oc
      ,ii.lote
      ,ii.fecha_vcmto
      ,ii.modelo
      ,ii.cod_equivale,
	  ii.estilo,paises.nompais,
      dt.INFORME_ALMACEN as nodt,
	  dt.FE_INFORME_ALMACEN as Fecha_Dt,
	  dt.IM_5 as nodm,
	  dt.FE_IM_5 as fecha_dm,
      0000000000000000000.00 as solicitado,
	  ii.precio,
	  ii.observacion,
	  t.fechatransaccion,
	  u.UnidadMedida,
	  iI.fechaitem,
	  t.bodegaid,
	  t.regimenid, 
      isnull((ii.CantidadInicial-isnull(Sy_1.reservado,0))/(i.CantidadInicial/nullif(i.peso,0)),0) as peso, 
      isnull((ii.CantidadInicial-isnull(Sy_1.reservado,0))/(i.CantidadInicial/nullif(i.volumen,0)),0) as cbm,
      t.clienteid,
	  c.nombre as nombrecliente,
	  B.nombodega, 
      i.barcode,
	  t.NoTransaccion,
	  isnull(ii.cantidadinicial/(i.CantidadInicial/nullif(i.volumen,0)),0) as cbm_ini,
      isnull(ii.cantidadinicial/(i.CantidadInicial/nullif(i.peso,0)),0) as peso_ini,rg.regimen,
	  t.contenedor
      FROM wms.dbo.ItemInventario as ii WITH(NOLOCK)
    inner join wms.dbo.inventario as i WITH(NOLOCK) on i.InventarioID=ii.InventarioID  
    inner join wms.dbo.producto as p WITH(NOLOCK) on p.codproducto=ii.codproducto 
    left join wms.dbo.racks as r WITH(NOLOCK) on r.rack=i.rack 
	left join wms.dbo.metodo_descargo md WITH(NOLOCK) on md.descargoID=p.descargoid
    inner join wms.dbo.DetalleTransacciones as d1 WITH(NOLOCK) on d1.InventarioID=i.InventarioID 
    inner join wms.dbo.transacciones as T WITH(NOLOCK) on t.TransaccionID=d1.TransaccionID 
    left join wms.dbo.Bodegas as B WITH(NOLOCK) on b.bodegaid=t.bodegaid 
    Inner Join wms.dbo.Clientes As C WITH(NOLOCK) On C.ClienteID = T.ClienteID 
    left Join wms.dbo.DocumentosxTransaccion As dt WITH(NOLOCK) On dt.transaccionid = t.transaccionid 
    left join wms.dbo.paises WITH(NOLOCK) on paises.paisid=ii.pais_orig 
    left join wms.dbo.unidadmedida as u WITH(NOLOCK) on u.unidadmedidaid=p.unidadmedida 
    inner join wms.dbo.Regimen as rg WITH(NOLOCK) on rg.IDRegimen=t.RegimenID 
	inner join wms.dbo.locations l WITH(NOLOCK) on l.locationid=b.locationid
    LEFT OUTER JOIN (SELECT Sy.InventarioID, Sy.ItemInventarioID, Sy.CodProducto, SUM(ISNULL(Sy.Cantidad, 0)) AS Reservado 
                     FROM wms.dbo.SysTempSalidas AS Sy 
					 INNER JOIN wms.dbo.Pedido AS Pe WITH(NOLOCK) ON Pe.PedidoID = Sy.PedidoID 
					 INNER JOIN wms.dbo.Transacciones as t WITH(NOLOCK) ON t.TransaccionID=sy.TransaccionID and t.IDTipoTransaccion in ('SA','XL')
                   --  WHERE (Pe.EstatusID  )
                     GROUP BY Sy.InventarioID, sy.ItemInventarioID, Sy.CodProducto) AS Sy_1 ON Sy_1.InventarioID = I.InventarioID AND 
                              Sy_1.ItemInventarioID = II.ItemInventarioID And Sy_1.CodProducto = II.CodProducto 
	 LEFT OUTER JOIN (SELECT Sy.InventarioID, Sy.ItemInventarioID, Sy.CodProducto, SUM(ISNULL(Sy.Cantidad, 0)) AS Reservado 
                     FROM wms.dbo.SysTempSalidas AS Sy WITH(NOLOCK) 
					 INNER JOIN wms.dbo.Pedido AS Pe WITH(NOLOCK) ON Pe.PedidoID = Sy.PedidoID 
					 INNER JOIN wms.dbo.Transacciones as t WITH(NOLOCK) ON t.TransaccionID=sy.TransaccionID and t.IDTipoTransaccion in ('SA','XL')
                     WHERE (Pe.EstatusID not in (9,10) )
                     GROUP BY Sy.InventarioID, sy.ItemInventarioID, Sy.CodProducto) AS Sy_2 ON Sy_2.InventarioID = I.InventarioID AND 
                              Sy_2.ItemInventarioID = II.ItemInventarioID And Sy_2.CodProducto = II.CodProducto 
     where 
	 ii.CodProducto in (SELECT DISTINCT Pu.CodProducto from EdiDB.dbo.ProductoUbicacion Pu where Typ = 4)
	 and (isnull(ii.cantidadinicial,0) -isnull(sy_1.Reservado,0))>0  and
		   T.IDTipoTransaccion IN ('IN') and
		   t.ClienteID=isnull(@clienteID,t.ClienteID) and 
		   t.BodegaID=isnull(@bodegaID,t.BodegaID) and 
		   t.RegimenID=isnull(@regimenID,t.RegimenID) and
		   i.rack=isnull(@rackID,i.Rack) and
		   b.locationid=isnull(@locationID,b.locationid) and
		   t.EstatusID>=l.IDinvShow and
		  case when p.descargoid =1 then t.FechaTransaccion
			   when p.descargoid =2 then ii.fecha_vcmto
		       when p.descargoid =3 then t.FechaTransaccion end <= @fecha_sal           
        order by case when p.descargoid in (1,3) then t.FechaTransaccion else ii.fecha_vcmto end 
end


exec EdiDB.dbo.SP_GeneraSalidaWms '17-08-2019', '7376841272', 9, 2, 1432, 7, 0


