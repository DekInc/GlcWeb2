﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Threading.Tasks;
using ComModels;
using ComModels.Models.EdiDB;
using ComModels.Models.WmsDB;
using Microsoft.EntityFrameworkCore;

namespace EdiApi.Models
{
    public static class ManualDB
    {
        public static IEnumerable<TsqlDespachosWmsComplex> SP_GetSN(ref EdiDBContext _DbO)
        {
            List<TsqlDespachosWmsComplex> ListSn = new List<TsqlDespachosWmsComplex>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand())
            {
                Cmd.CommandText ="[dbo].[GetSN]";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows)
                {
                    while (Dr.Read())
                    {
                        ListSn.Add(new TsqlDespachosWmsComplex()
                        {
                            DespachoId = Dr.GetInt32(0),
                            FechaSalida = Dr.GetDateTime(1),
                            CodProducto = Dr.GetString(2),
                            Producto = Dr.GetString(3),
                            Cliente = Dr.GetString(4),
                            Quantity = Dr.GetDouble(5),
                            Weight = Dr.GetDouble(6),
                            Volume = Dr.GetDouble(7),
                            Bulks = Dr.GetDouble(8),
                            UnidadDeMedida = Dr.GetString(9),
                            Destino = Dr.GetString(10),
                            Procesado = Dr.GetInt32(11)
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            //List<GetSNSP> L = await WmsDbO.Query<GetSNSP>().FromSql("EXEC [dbo].[GetSN]").ToListAsync();
            return ListSn;
        }
        public static IEnumerable<TsqlDespachosWmsComplex> SP_GetSNDet(ref EdiDBContext _DbO, int PedidoId)
        {
            List<TsqlDespachosWmsComplex> ListSn = new List<TsqlDespachosWmsComplex>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand())
            {
                Cmd.CommandText = $"[dbo].[GetSNDet] " + PedidoId.ToString();
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows)
                {
                    while (Dr.Read())
                    {
                        ListSn.Add(new TsqlDespachosWmsComplex()
                        {
                            DespachoId = Convert.ToInt32(Dr.GetValue(0)),
                            FechaSalida = Convert.ToDateTime(Dr.GetValue(1)),
                            CodProducto = Convert.ToString(Dr.GetValue(2)),
                            Producto = Convert.ToString(Dr.GetValue(3)),
                            Cliente = Convert.ToString(Dr.GetValue(4)),
                            Quantity = Convert.ToDouble(Dr.GetValue(5)),
                            Weight = Convert.ToDouble(Dr.GetValue(6)),
                            Volume = Convert.ToDouble(Dr.GetValue(7)),
                            Bulks = Convert.ToDouble(Dr.GetValue(8)),
                            UnidadDeMedida = Convert.ToString(Dr.GetValue(9)),
                            Destino = Convert.ToString(Dr.GetValue(10)),

                            NoContenedor = Convert.ToString(Dr.GetValue(11)),
                            Motorista = Convert.ToString(Dr.GetValue(12)),
                            DocumentoMotorista = Convert.ToString(Dr.GetValue(13)),
                            DocumentoFiscal = Convert.ToString(Dr.GetValue(14)),
                            FechaDocFiscal = Convert.ToDateTime(Dr.GetValue(15)),
                            NoMarchamo = Convert.ToString(Dr.GetValue(16)),
                            Observacion = Convert.ToString(Dr.GetValue(17)), 
                            TotalValue = Convert.ToDouble(Dr.GetValue(20)),
                            NumeroOc = Convert.ToString(Dr.GetValue(21)),
                            PedidoId = Convert.ToInt32(Dr.GetValue(22))
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            //List<GetSNSP> L = await WmsDbO.Query<GetSNSP>().FromSql("EXEC [dbo].[GetSN]").ToListAsync();
            return ListSn;
        }
        public static IEnumerable<FE830DataAux> SP_GetExistencias(ref EdiDBContext _DbO, int _IdClient)
        {
            List<FE830DataAux> ListExists = new List<FE830DataAux>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand())
            {
                Cmd.CommandText = $"[dbo].[SP_GetExistencias] {_IdClient}";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows)
                {
                    while (Dr.Read())
                    {
                        ListExists.Add(new FE830DataAux()
                        {                            
                            CodProducto = Convert.ToString(Dr.GetValue(0)),
                            Producto = Convert.ToString(Dr.GetValue(1)),
                            Existencia = Convert.ToDouble(Dr.GetValue(2)),
                            UnidadDeMedida = Convert.ToString(Dr.GetValue(3)),
                            CodProductoLear = Convert.ToString(Dr.GetValue(4))
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListExists;
        }
        public static IEnumerable<ExistenciasExternModel> SP_GetExistenciasExtern(ref EdiDBContext _DbO, int _IdClient)
        {
            List<ExistenciasExternModel> ListExists = new List<ExistenciasExternModel>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand())
            {
                Cmd.CommandText = $"[dbo].[SP_GetExistenciasExtern] {_IdClient}";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows)
                {
                    while (Dr.Read())
                    {
                        ListExists.Add(new ExistenciasExternModel()
                        {
                            Cliente = Convert.ToString(Dr.GetValue(0)),
                            Bodega = Convert.ToString(Dr.GetValue(1)),
                            CodProducto = Convert.ToString(Dr.GetValue(2)),
                            Descripcion = Convert.ToString(Dr.GetValue(3)),
                            Existencia = Convert.ToDouble(Dr.GetValue(4)),
                            Reservado = Convert.ToDouble(Dr.GetValue(5)),
                            Disponible = Convert.ToDouble(Dr.GetValue(6)),
                            ClienteID = Convert.ToInt32(Dr.GetValue(7)),
                            BodegaID = Convert.ToInt32(Dr.GetValue(8)),
                            Bultos = Convert.ToInt32(Dr.GetValue(9)),
                            Peso = Convert.ToDouble(Dr.GetValue(10)),
                            Volumen = Convert.ToDouble(Dr.GetValue(11)),
                            Uxb = Convert.ToInt32(Dr.GetValue(12)),
                            Lote = Convert.ToString(Dr.GetValue(13)),
                            Contenedor = Convert.ToString(Dr.GetValue(14))
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListExists;
        }
        public static IEnumerable<PedidosWmsModel> SP_GetPedidosWms(ref EdiDBContext _DbO, int _IdClient)
        {
            List<PedidosWmsModel> ListExists = new List<PedidosWmsModel>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand())
            {
                Cmd.CommandText = $"[dbo].[SP_GetPedidosWms] {_IdClient}";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows)
                {
                    while (Dr.Read())
                    {
                        ListExists.Add(new PedidosWmsModel()
                        {
                            ClienteId = Convert.ToInt32(Dr.GetValue(0)),
                            PedidoBarcode = Convert.ToString(Dr.GetValue(1)),
                            FechaPedido = Convert.ToString(Dr.GetValue(2)),
                            Estatus = Convert.ToString(Dr.GetValue(3)),
                            NomBodega = Convert.ToString(Dr.GetValue(4)),
                            Regimen = Convert.ToString(Dr.GetValue(5)),
                            CodProducto = Convert.ToString(Dr.GetValue(6)),
                            Cantidad = Convert.ToDouble(Dr.GetValue(7)),
                            Observacion = Convert.ToString(Dr.GetValue(8)),
                            PedidoId = Convert.ToInt32(Dr.GetValue(9))
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListExists;
        }
        public static IEnumerable<PedidosWmsModel> GetWmsGroupDispatchs(ref EdiDBContext _DbO, int ClienteId) {
            List<PedidosWmsModel> ListExists = new List<PedidosWmsModel>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"[dbo].[SP_GetWmsGroupDispatchs] {ClienteId}";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        ListExists.Add(new PedidosWmsModel() {
                            ClienteId = Dr.Gr<int>(0),
                            PedidoBarcode = Dr.Gr<string>(1),
                            FechaPedido = Dr.Gr<string>(2),
                            Estatus = Dr.Gr<string>(3),
                            NomBodega = Dr.Gr<string>(4),
                            Regimen = Dr.Gr<string>(5),
                            Bultos = (double)Dr.Gr<decimal>(6),
                            Cantidad = Dr.Gr<double>(7),
                            Observacion = Dr.Gr<string>(8),
                            PedidoId = Dr.Gr<int>(9),
                            TiendaId = Dr.Gr<string>(10),
                            Total = Dr.Gr<int>(11),
                            Destino = Dr.Gr<string>(12)
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListExists;
        }
        public static IEnumerable<PedidosWmsModel> GetWmsGroupDispatchsBills(ref EdiDBContext _DbO, int ClienteId) {
            List<PedidosWmsModel> ListExists = new List<PedidosWmsModel>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"[dbo].[SP_GetWmsGroupDispatchsBills] {ClienteId}";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();                
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        ListExists.Add(new PedidosWmsModel() {
                            ClienteId = Dr.Gr<int>(0),
                            PedidoBarcode = Dr.Gr<string>(1),
                            FechaPedido = Dr.Gr<string>(2),
                            Estatus = Dr.Gr<string>(3),
                            NomBodega = Dr.Gr<string>(4),
                            Regimen = Dr.Gr<string>(5),
                            Bultos = (double)Dr.Gr<decimal>(6),
                            Cantidad = Dr.Gr<double>(7),
                            Observacion = Dr.Gr<string>(8),
                            PedidoId = Dr.Gr<int>(9),
                            TiendaId = Dr.Gr<string>(10),
                            FactComercial = Dr.Gr<string>(11),
                            TransaccionId = Dr.Gr<int>(12),
                            Destino = Dr.Gr<string>(13)
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListExists;
        }
        public static IEnumerable<PedidosWmsModel> GetWmsDetDispatchsBills(ref EdiDBContext _DbO, int ClienteId) {
            List<PedidosWmsModel> ListExists = new List<PedidosWmsModel>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"[dbo].[SP_GetWmsDetDispatchsBills] {ClienteId}";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        ListExists.Add(new PedidosWmsModel() {
                            ClienteId = Dr.Gr<int>(0),
                            PedidoBarcode = Dr.Gr<string>(1),
                            FechaPedido = Dr.Gr<string>(2),
                            Estatus = Dr.Gr<string>(3),
                            NomBodega = Dr.Gr<string>(4),
                            Regimen = Dr.Gr<string>(5),
                            CodProducto = Dr.Gr<string>(6),
                            PedidoId = Dr.Gr<int>(7),
                            FactComercial = Dr.Gr<string>(8),
                            Observacion = Dr.Gr<string>(9),
                            TransaccionId = Dr.Gr<int>(10),
                            Destino = Dr.Gr<string>(11)
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListExists;
        }
        public static IEnumerable<PedidosDetExternos> SP_GetPedidosDetExternos(ref EdiDBContext _DbO, int _IdClient)
        {
            List<PedidosDetExternos> ListExists = new List<PedidosDetExternos>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand())
            {
                Cmd.CommandText = $"[dbo].[SP_GetPedidosDetExternos] {_IdClient}";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows)
                {
                    while (Dr.Read())
                    {
                        ListExists.Add(new PedidosDetExternos()
                        {
                            Id = Convert.ToInt32(Dr.GetValue(0)),
                            PedidoId = Convert.ToInt32(Dr.GetValue(1)),
                            CodProducto = Convert.ToString(Dr.GetValue(2)),
                            CantPedir = Convert.ToDouble(Dr.GetValue(3)),
                            Producto = Convert.ToString(Dr.GetValue(4))
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListExists;
        }
        public static IEnumerable<PedidosDetExternos> SP_GetPedidosDetExternosByTienda(ref EdiDBContext _DbO, int ClienteId, int TiendaId) {
            List<PedidosDetExternos> ListExists = new List<PedidosDetExternos>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"[dbo].[SP_GetPedidosDetExternosByTienda] {ClienteId}, {TiendaId}";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        ListExists.Add(new PedidosDetExternos() {
                            Id = Convert.ToInt32(Dr.GetValue(0)),
                            PedidoId = Convert.ToInt32(Dr.GetValue(1)),
                            CodProducto = Convert.ToString(Dr.GetValue(2)),
                            CantPedir = Convert.ToDouble(Dr.GetValue(3)),
                            Producto = Convert.ToString(Dr.GetValue(4))
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListExists;
        }
        public static IEnumerable<PedidosDetExternos> SP_GetPedidosDetExternosPendientesByTienda(ref EdiDBContext _DbO, int ClienteId, int TiendaId) {
            List<PedidosDetExternos> ListExists = new List<PedidosDetExternos>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"dbo.SP_GetPedidosDetExternosPendientesByTienda {ClienteId}, {TiendaId}";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        ListExists.Add(new PedidosDetExternos() {
                            Id = Convert.ToInt32(Dr.GetValue(0)),
                            PedidoId = Convert.ToInt32(Dr.GetValue(1)),
                            CodProducto = Convert.ToString(Dr.GetValue(2)),
                            CantPedir = Convert.ToDouble(Dr.GetValue(3)),
                            Producto = Convert.ToString(Dr.GetValue(4))
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListExists;
        }
        public static IEnumerable<PaylessProdPrioriDetModel> SP_GetPedidosExternosDetById(ref EdiDBContext _DbO, int PedidoId) {
            List<PaylessProdPrioriDetModel> List = new List<PaylessProdPrioriDetModel>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"[dbo].[SP_GetPedidosExternosDetById] {PedidoId}";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        List.Add(new PaylessProdPrioriDetModel() {
                            Id = Convert.ToInt32(Dr.GetValue(0)),
                            IdPaylessProdPrioriM = Convert.ToInt32(Dr.GetValue(1)),
                            Oid = Convert.ToString(Dr.GetValue(2)),
                            Barcode = Convert.ToString(Dr.GetValue(3)),
                            Estado = Convert.ToString(Dr.GetValue(4)),
                            Pri = Convert.ToString(Dr.GetValue(5)),
                            PoolP = Convert.ToString(Dr.GetValue(6)),
                            Producto = Convert.ToString(Dr.GetValue(7)),
                            Talla = Convert.ToString(Dr.GetValue(8)),
                            Lote = Convert.ToString(Dr.GetValue(9)),
                            Categoria = Convert.ToString(Dr.GetValue(10)),
                            Departamento = Convert.ToString(Dr.GetValue(11)),
                            Cp = Convert.ToString(Dr.GetValue(12)),
                            Pickeada = Convert.ToString(Dr.GetValue(13)),
                            Etiquetada = Convert.ToString(Dr.GetValue(14)),
                            Preinspeccion = Convert.ToString(Dr.GetValue(15)),
                            Cargada = Convert.ToString(Dr.GetValue(16)),
                            M3 = Convert.ToDouble(Dr.GetValue(17)),
                            Peso = Convert.ToDouble(Dr.GetValue(18)),
                            IdTransporte = Convert.ToInt32(Dr.GetValue(19)),
                            Transporte = Convert.ToString(Dr.GetValue(20)),
                            CantPedir = Convert.ToInt32(Dr.GetValue(21))
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return List;
        }
        public static IEnumerable<PedidosDetExternos> SP_GetPedidosDetExternosGuardados(ref EdiDBContext _DbO, int _IdClient) {
            List<PedidosDetExternos> ListExists = new List<PedidosDetExternos>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"[dbo].[SP_GetPedidosDetExternosGuardados] {_IdClient}";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        ListExists.Add(new PedidosDetExternos() {
                            Id = Convert.ToInt32(Dr.GetValue(0)),
                            PedidoId = Convert.ToInt32(Dr.GetValue(1)),
                            CodProducto = Convert.ToString(Dr.GetValue(2)),
                            CantPedir = Convert.ToDouble(Dr.GetValue(3)),
                            Producto = Convert.ToString(Dr.GetValue(4))
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListExists;
        }
        public static IEnumerable<PedidosDetExternos> SP_GetPedidosDetExternosByDate(ref EdiDBContext _DbO, DateTime DateInit, DateTime DateEnd, int Typ) {
            List<PedidosDetExternos> ListExists = new List<PedidosDetExternos>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"[dbo].[SP_GetPedidosDetExternosByDate] '{DateInit.ToString(ApplicationSettings.DateTimeFormatShort)}', '{DateEnd.ToString(ApplicationSettings.DateTimeFormatShort)}', {Typ}";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        ListExists.Add(new PedidosDetExternos() {
                            CantPedir = Convert.ToDouble(Dr.GetValue(0)),
                            CodProducto = Convert.ToString(Dr.GetValue(1)),
                            Producto = Convert.ToString(Dr.GetValue(2))
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListExists;
        }
        public static IEnumerable<PaylessProdPrioriDetModel> SP_GetPaylessProdPrioriByPeriod(ref EdiDBContext _DbO, string Period)
        {
            List<PaylessProdPrioriDetModel> ListProdDet = new List<PaylessProdPrioriDetModel>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand())
            {
                Cmd.CommandText = $"[dbo].[SP_GetPaylessProdPrioriByPeriod] '{Period}'";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows)
                {
                    while (Dr.Read())
                    {
                        ListProdDet.Add(new PaylessProdPrioriDetModel()
                        {
                            Id = Convert.ToInt32(Dr.GetValue(0)),
                            IdPaylessProdPrioriM = Convert.ToInt32(Dr.GetValue(1)),
                            Oid = Convert.ToString(Dr.GetValue(2)),
                            Barcode = Convert.ToString(Dr.GetValue(3)),
                            Estado = Convert.ToString(Dr.GetValue(4)),
                            Pri = Convert.ToString(Dr.GetValue(5)),
                            PoolP = Convert.ToString(Dr.GetValue(6)),
                            Producto = Convert.ToString(Dr.GetValue(7)),
                            Talla = Convert.ToString(Dr.GetValue(8)),
                            Lote = Convert.ToString(Dr.GetValue(9)),
                            Categoria = Convert.ToString(Dr.GetValue(10)),
                            Departamento = Convert.ToString(Dr.GetValue(11)),
                            Cp = Convert.ToString(Dr.GetValue(12)),
                            Pickeada = Convert.ToString(Dr.GetValue(13)),
                            Etiquetada = Convert.ToString(Dr.GetValue(14)),
                            Preinspeccion = Convert.ToString(Dr.GetValue(15)),
                            Cargada = Convert.ToString(Dr.GetValue(16)),
                            M3 = Convert.ToDouble(Dr.GetValue(17)),
                            Peso = Convert.ToDouble(Dr.GetValue(18)),
                            IdTransporte = Convert.ToInt32(Dr.GetValue(19)),
                            Transporte = Convert.ToString(Dr.GetValue(20))                            
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListProdDet;
        }        
        public static IEnumerable<PaylessProdPrioriDetModel> SP_GetPaylessProdPrioriByPeriodAndIdTransport(ref EdiDBContext _DbO, string Period, int IdTransport) {
            List<PaylessProdPrioriDetModel> ListProdDet = new List<PaylessProdPrioriDetModel>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"[dbo].[SP_GetPaylessProdPrioriByPeriodAndIdTransport] '{Period}', {IdTransport}";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        ListProdDet.Add(new PaylessProdPrioriDetModel() {
                            Id = Convert.ToInt32(Dr.GetValue(0)),
                            IdPaylessProdPrioriM = Convert.ToInt32(Dr.GetValue(1)),
                            Oid = Convert.ToString(Dr.GetValue(2)),
                            Barcode = Convert.ToString(Dr.GetValue(3)),
                            Estado = Convert.ToString(Dr.GetValue(4)),
                            Pri = Convert.ToString(Dr.GetValue(5)),
                            PoolP = Convert.ToString(Dr.GetValue(6)),
                            Producto = Convert.ToString(Dr.GetValue(7)),
                            Talla = Convert.ToString(Dr.GetValue(8)),
                            Lote = Convert.ToString(Dr.GetValue(9)),
                            Categoria = Convert.ToString(Dr.GetValue(10)),
                            Departamento = Convert.ToString(Dr.GetValue(11)),
                            Cp = Convert.ToString(Dr.GetValue(12)),
                            Pickeada = Convert.ToString(Dr.GetValue(13)),
                            Etiquetada = Convert.ToString(Dr.GetValue(14)),
                            Preinspeccion = Convert.ToString(Dr.GetValue(15)),
                            Cargada = Convert.ToString(Dr.GetValue(16)),
                            M3 = Convert.ToDouble(Dr.GetValue(17)),
                            Peso = Convert.ToDouble(Dr.GetValue(18)),
                            IdTransporte = Convert.ToInt32(Dr.GetValue(19)),
                            Transporte = Convert.ToString(Dr.GetValue(20)),
                            DateProm = Convert.ToString(Dr.GetValue(21)) //Realmente NomCliente
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListProdDet;
        }
        public static IEnumerable<PaylessProdPrioriDetModel> GetWmsFileById(ref EdiDBContext _DbO, int IdM) {
            List<PaylessProdPrioriDetModel> ListProdDet = new List<PaylessProdPrioriDetModel>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"dbo.GetWmsFileById {IdM}";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    int NRow = 0;
                    while (Dr.Read()) {
                        ListProdDet.Add(new PaylessProdPrioriDetModel() {
                            Id = (NRow++),
                            Barcode = Dr.Gr<string>(0),
                            Producto = Dr.Gr<string>(1),
                            Talla = Dr.Gr<string>(2),
                            Lote = Dr.Gr<string>(3),
                            Categoria = Dr.Gr<string>(4),
                            Departamento = Dr.Gr<string>(5),
                            Cp = Dr.Gr<string>(6),
                            IdTransporte = Dr.Gr<int?>(7),
                            //Transporte = Dr.Gr<string>(8),
                            DateProm = Dr.Gr<string>(9),
                            Pri = Dr.Gr<string>(10),
                            Peso = Dr.Gr<double?>(11),
                            M3 = Dr.Gr<double?>(12)
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListProdDet;
        }
        public static int UploadBatch(ref WmsContext _Wms, string Batch) {
            int Res = 0;
            using (DbCommand Cmd = _Wms.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = Batch;
                Cmd.CommandTimeout = 600;
                _Wms.Database.OpenConnection();
                 Res = Cmd.ExecuteNonQuery();
                _Wms.Database.CloseConnection();
            }
            return Res;
        }
        public static DataTable SpGeneraSalidaWMS(ref WmsContext _Wms, string FechaSalida, string CodProducto, int BodegaId, int RegimenId, int ClienteId, int LocationId, int RackId) {
            DataTable Dt = new DataTable();
            using (DbCommand Cmd = _Wms.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"[dbo].[spGeneraSalida] '{FechaSalida}', '{CodProducto}', {BodegaId}, {RegimenId}, {ClienteId}, {LocationId}, {RackId} ";
                Cmd.CommandTimeout = 600;
                _Wms.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                Dt.Load(Dr);
                _Wms.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return Dt;
        }
        public static DataTable SpGeneraSalidaWMS2(ref EdiDBContext _Dbo, string FechaSalida, string CodProducto, int BodegaId, int RegimenId, int ClienteId, int LocationId, int RackId) {
            DataTable Dt = new DataTable();
            using (DbCommand Cmd = _Dbo.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"[dbo].[SP_GeneraSalidaWms] '{FechaSalida}', '{CodProducto}', {BodegaId}, {RegimenId}, {ClienteId}, {LocationId}, {RackId} ";
                Cmd.CommandTimeout = 600;
                _Dbo.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                Dt.Load(Dr);
                _Dbo.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return Dt;
        }
        public static IEnumerable<Transacciones> GetTransaccionById(ref WmsContext _Wms, int TransaccionID) {
            List<Transacciones> List = new List<Transacciones>();
            using (DbCommand Cmd = _Wms.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"select TransaccionID, NoTransaccion, FechaTransaccion, IdTipoTransaccion, PedidoId, BodegaId, RegimenId, ClienteId, Total, TipoIngreso, UsuarioCrea, FechaCrea, Observacion, EstatusId, OperarioId, TipoPicking, ExportadorId, DestinoId, TransportistaId, Pais_Orig, Adu_fro, Placa, Marchamo, Contenedor, Cod_Motoris, Remolque, RecivingCliente, FechaReciving, FacturaId, IdrControl from dbo.Transacciones where TransaccionId = {TransaccionID}";
                _Wms.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        List.Add(new Transacciones() {
                            TransaccionId = Dr.Gr<int>(0),
                            NoTransaccion = Dr.Gr<string>(1),
                            FechaTransaccion = Dr.Gr<DateTime>(2),
                            IdtipoTransaccion = Dr.Gr<string>(3),
                            PedidoId = Dr.Gr<int>(4),
                            BodegaId = Dr.Gr<int>(5),
                            RegimenId = Dr.Gr<int>(6),
                            ClienteId = Dr.Gr<int>(7),
                            Total = Dr.Gr<double>(8),
                            TipoIngreso = Dr.Gr<string>(9),
                            Usuariocrea = Dr.Gr<string>(10),
                            Fechacrea = Dr.Gr<DateTime>(11),
                            Observacion = Dr.Gr<string>(12),
                            EstatusId = Dr.Gr<int>(13),
                            Operarioid = Dr.Gr<int>(14),
                            TipoPicking = Dr.Gr<string>(15),
                            Exportadorid = Dr.Gr<int>(16),
                            Destinoid = Dr.Gr<int>(17),
                            Transportistaid = Dr.Gr<int>(18),
                            PaisOrig = Dr.Gr<int>(19),
                            AduFro = Dr.Gr<string>(20),
                            Marchamo = Dr.Gr<string>(21),
                            Contenedor = Dr.Gr<string>(22),
                            CodMotoris = Dr.Gr<string>(23),
                            Remolque = Dr.Gr<string>(24),
                            RecivingCliente = Dr.Gr<string>(25),
                            FechaReciving = Dr.Gr<DateTime>(26),
                            FacturaId = Dr.Gr<int>(27)
                            //TransaccionId = Convert.ToInt32(Dr.GetValue(0)),
                            //NoTransaccion = Convert.ToString(Dr.GetValue(1)),
                            //FechaTransaccion = Dr.GetDateTime(2),
                            //IdtipoTransaccion = Convert.ToString(Dr.GetValue(3)),
                            //PedidoId = Convert.ToInt32(Dr.GetValue(4)),
                            //BodegaId = Convert.ToInt32(Dr.GetValue(5)),
                            //RegimenId = Convert.ToInt32(Dr.GetValue(6)),
                            //ClienteId = Convert.ToInt32(Dr.GetValue(7)),
                            //Total = Convert.ToDouble(Dr.GetValue(8)),
                            //TipoIngreso = Convert.ToString(Dr.GetValue(9)),
                            //Usuariocrea = Convert.ToString(Dr.GetValue(10)),
                            //Fechacrea = Dr.GetDateTime(11),
                            //Observacion = Convert.ToString(Dr.GetValue(12)),
                            //EstatusId = Convert.ToInt32(Dr.GetValue(13)),
                            //Operarioid = Convert.ToInt32(Dr.GetValue(14)),
                            //TipoPicking = Convert.ToString(Dr.GetValue(15)),
                            //Exportadorid = Convert.ToInt32(Dr.GetValue(16)),
                            //Destinoid = Convert.ToInt32(Dr.GetValue(17)),
                            //Transportistaid = Convert.ToInt32(Dr.GetValue(18)),
                            //PaisOrig = Convert.ToInt32(Dr.GetValue(19)),
                            //AduFro = Convert.ToString(Dr.GetValue(20)),
                            //Marchamo = Convert.ToString(Dr.GetValue(21)),
                            //Contenedor = Convert.ToString(Dr.GetValue(22)),
                            //CodMotoris = Convert.ToString(Dr.GetValue(23)),
                            //Remolque = Convert.ToString(Dr.GetValue(24)),
                            //RecivingCliente = Convert.ToString(Dr.GetValue(25)),
                            //FechaReciving = Dr.GetDateTime(26),
                            //FacturaId = Convert.ToInt32(Dr.GetValue(27))
                            //idrcontrol = Convert.ToInt32(Dr.GetValue(27)),
                        });
                    }
                }
                _Wms.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return List;
        }
        public static IEnumerable<PaylessProdPrioriDetModel> SP_GetPaylessProdPrioriFileDif(ref EdiDBContext _DbO, int IdData, int IdProdArch, int ClienteId) {
            List<PaylessProdPrioriDetModel> ListProdDet = new List<PaylessProdPrioriDetModel>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"dbo.SP_GetPaylessProdPrioriFileDif {IdData}, {IdProdArch}, {ClienteId}";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    int NRow = 0;
                    while (Dr.Read()) {
                        ListProdDet.Add(new PaylessProdPrioriDetModel() {
                            Id = NRow++,
                            //Id = Convert.ToInt32(Dr.GetValue(0)),
                            IdPaylessProdPrioriM = Convert.ToInt32(Dr.GetValue(1)),
                            Oid = Convert.ToString(Dr.GetValue(2)),
                            Barcode = Convert.ToString(Dr.GetValue(3)),
                            Estado = Convert.ToString(Dr.GetValue(4)),
                            Pri = Convert.ToString(Dr.GetValue(5)),
                            PoolP = Convert.ToString(Dr.GetValue(6)),
                            Producto = Convert.ToString(Dr.GetValue(7)),
                            Talla = Convert.ToString(Dr.GetValue(8)),
                            Lote = Convert.ToString(Dr.GetValue(9)),
                            Categoria = Convert.ToString(Dr.GetValue(10)),
                            Departamento = Convert.ToString(Dr.GetValue(11)),
                            Cp = Convert.ToString(Dr.GetValue(12)),
                            //Pickeada = Convert.ToString(Dr.GetValue(13)),
                            //Etiquetada = Convert.ToString(Dr.GetValue(14)),
                            //Preinspeccion = Convert.ToString(Dr.GetValue(15)),
                            //Cargada = Convert.ToString(Dr.GetValue(16)),
                            M3 = Convert.ToDouble(Dr.GetValue(17)),
                            Peso = Convert.ToDouble(Dr.GetValue(18)),
                            IdTransporte = Convert.ToInt32(Dr.GetValue(19)),
                            Transporte = Convert.ToString(Dr.GetValue(20))
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListProdDet;
        }
        public static IEnumerable<PaylessProdPrioriDetModel> SP_GetPaylessProdPrioriAll(ref EdiDBContext _DbO, int ClienteId) {
            List<PaylessProdPrioriDetModel> ListProdDet = new List<PaylessProdPrioriDetModel>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"[dbo].[SP_GetPaylessProdPrioriAll] '{ClienteId}'";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        ListProdDet.Add(new PaylessProdPrioriDetModel() {
                            Id = Convert.ToInt32(Dr.GetValue(0)),
                            IdPaylessProdPrioriM = Convert.ToInt32(Dr.GetValue(1)),
                            Oid = Convert.ToString(Dr.GetValue(2)),
                            Barcode = Convert.ToString(Dr.GetValue(3)),
                            Estado = Convert.ToString(Dr.GetValue(4)),
                            Pri = Convert.ToString(Dr.GetValue(5)),
                            PoolP = Convert.ToString(Dr.GetValue(6)),
                            Producto = Convert.ToString(Dr.GetValue(7)),
                            Talla = Convert.ToString(Dr.GetValue(8)),
                            Lote = Convert.ToString(Dr.GetValue(9)),
                            Categoria = Convert.ToString(Dr.GetValue(10)),
                            Departamento = Convert.ToString(Dr.GetValue(11)),
                            Cp = Convert.ToString(Dr.GetValue(12)),
                            Pickeada = Convert.ToString(Dr.GetValue(13)),
                            Etiquetada = Convert.ToString(Dr.GetValue(14)),
                            Preinspeccion = Convert.ToString(Dr.GetValue(15)),
                            Cargada = Convert.ToString(Dr.GetValue(16)),
                            M3 = Convert.ToDouble(Dr.GetValue(17)),
                            Peso = Convert.ToDouble(Dr.GetValue(18)),
                            IdTransporte = Convert.ToInt32(Dr.GetValue(19)),
                            Transporte = Convert.ToString(Dr.GetValue(20))
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListProdDet;
        }
        public static IEnumerable<PaylessProdPrioriDetModel> SP_GetPaylessSellQtys(ref EdiDBContext _DbO, int ClienteId, string TiendaId, string CodUser)
        {
            List<PaylessProdPrioriDetModel> ListProdDet = new List<PaylessProdPrioriDetModel>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand())
            {
                Cmd.CommandText = $"dbo.SP_GetPaylessSellQtys {ClienteId}, '{TiendaId}', '{CodUser}'";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows)
                {
                    int NRow = 0;
                    while (Dr.Read())
                    {
                        ListProdDet.Add(new PaylessProdPrioriDetModel()
                        {
                            Id = (NRow++),
                            Barcode = Dr.Gr<string>(0),
                            Categoria = Dr.Gr<string>(1),
                            Cp = Dr.Gr<string>(2),
                            Producto = Dr.Gr<string>(3),
                            Talla = Dr.Gr<string>(4),
                            Lote = Dr.Gr<string>(5),
                            Departamento = Dr.Gr<string>(6),
                            Existencia = Dr.Gr<int>(7)
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListProdDet;
        }
        public static IEnumerable<FE830DataAux> SP_GetExistenciasByTienda(ref EdiDBContext _DbO, int ClienteId, int TiendaId) {
            List<FE830DataAux> ListProdDet = new List<FE830DataAux>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"[dbo].[SP_GetExistenciasByTienda] {ClienteId}, '{TiendaId}'";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        ListProdDet.Add(new FE830DataAux() {
                            CodProductoLear = Convert.ToString(Dr.GetValue(0)),
                            CodProducto = Convert.ToString(Dr.GetValue(1)),
                            Existencia = Convert.ToDouble(Dr.GetValue(2))
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListProdDet;
        }
        public static IEnumerable<FE830DataAux> SP_GetExistenciasByCliente(ref EdiDBContext _DbO, int ClienteId) {
            List<FE830DataAux> ListProdDet = new List<FE830DataAux>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"dbo.SP_GetExistenciasByCliente {ClienteId}";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        ListProdDet.Add(new FE830DataAux() {
                            CodProductoLear = Convert.ToString(Dr.GetValue(0)),
                            CodProducto = Convert.ToString(Dr.GetValue(1)),
                            Existencia = Convert.ToDouble(Dr.GetValue(2))
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListProdDet;
        }
        public static List<PaylessProdPrioriDetModel> SP_GetPaylessProdSinPedido(ref EdiDBContext _DbO, int ClienteId, int TiendaId) {
            List<PaylessProdPrioriDetModel> ListProdDet = new List<PaylessProdPrioriDetModel>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"dbo.SP_GetPaylessProdSinPedido {ClienteId}, '{TiendaId}'";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        ListProdDet.Add(new PaylessProdPrioriDetModel() {
                            Barcode = Dr.Gr<string>(0),
                            Cp = Dr.Gr<string>(1),
                            Categoria = Dr.Gr<string>(2),
                            IdPaylessProdPrioriM = Dr.Gr<int>(3),
                            DateProm = Dr.Gr<string>(4),
                            Departamento = Dr.Gr<string>(5),
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListProdDet;
        }
        public static List<PedidosExternos> SP_SetPaylessNewDis(ref EdiDBContext _DbO, int PedidoId, string CodUser) {            
            List<PedidosExternos> ListProdDet = new List<PedidosExternos>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"dbo.SP_SetPaylessNewDis {PedidoId}, '{CodUser}'";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();                
                _DbO.Database.CloseConnection();                    
                if (!Dr.IsClosed)
                    Dr.Close();
                ListProdDet = _DbO.PedidosExternos.Where(O => O.Id == PedidoId).ToList();
            }
            return ListProdDet;
        }
        public static List<PedidosPendientesAdmin> SP_GetPedidosPendientesAdmin(ref EdiDBContext _DbO, int ClienteId) {
            List<PedidosPendientesAdmin> ListProdDet = new List<PedidosPendientesAdmin>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"dbo.SP_GetPedidosPendientesAdmin {ClienteId}";
                Cmd.CommandTimeout = 600;
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        ListProdDet.Add(new PedidosPendientesAdmin() {
                            PedidoId = Dr.Gr<int>(0),
                            Bodega = Dr.Gr<string>(1),
                            TiendaId = Dr.Gr<int>(2),
                            FechaPedido = Dr.Gr<string>(3),
                            Periodo = Dr.Gr<string>(4),
                            Categoria = Dr.Gr<string>(5),
                            CP = Dr.Gr<string>(6),
                            Barcode = Dr.Gr<string>(7),
                            IdRack = Dr.Gr<int>(8),
                            NombreRack = Dr.Gr<string>(9),
                            Departamento = Dr.Gr<string>(10),
                            Producto = Dr.Gr<string>(11),
                            Lote = Dr.Gr<string>(12),
                            Talla = Dr.Gr<string>(13),
                            FullPed = Dr.Gr<bool?>(14),
                            Divert = Dr.Gr<bool?>(15),
                            TiendaIdDestino = Dr.Gr<int?>(16)
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListProdDet;
        }
        public static List<PeticionesAdminBGModel> SP_GetPeticionesAdminB(ref EdiDBContext _DbO, int ClienteId) {
            List<PeticionesAdminBGModel> ListProdDet = new List<PeticionesAdminBGModel>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"dbo.SP_GetPeticionesAdminB {ClienteId}";
                Cmd.CommandTimeout = 600;
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        ListProdDet.Add(new PeticionesAdminBGModel() {
                            Id = Dr.Gr<int>(0),
                            TiendaId = Dr.Gr<int>(1),
                            Tienda = Dr.Gr<string>(2),
                            WomanQty = Dr.Gr<int>(3),
                            ManQty = Dr.Gr<int>(4),
                            KidQty = Dr.Gr<int>(5),
                            AccQty = Dr.Gr<int>(6),
                            FechaCreacion = Dr.Gr<string>(7),
                            FechaPedido = Dr.Gr<string>(8),
                            TotalCp = Dr.Gr<int>(9),
                            PedidoWMS = Dr.Gr<int?>(10),
                            IdEstado = Dr.Gr<int>(11),
                            WomanQtyEnv = Dr.Gr<int>(12),
                            ManQtyEnv = Dr.Gr<int>(13),
                            KidQtyEnv = Dr.Gr<int>(14),
                            AccQtyEnv = Dr.Gr<int>(15),
                            TotalCpEnv = Dr.Gr<int>(16),
                            FullPed = Dr.Gr<bool?>(17),
                            Divert = Dr.Gr<bool?>(18),
                            TiendaIdDestino = Dr.Gr<int?>(19),
                            WomanQtyT = Dr.Gr<int?>(20),
                            ManQtyT = Dr.Gr<int?>(21),
                            KidQtyT = Dr.Gr<int?>(22),
                            AccQtyT = Dr.Gr<int?>(23),
                            Total = Dr.Gr<int>(24),
                            TotalEnv = Dr.Gr<int>(25)
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListProdDet;
        }
        public static IEnumerable<PedidosWmsModel> SP_GetPedidosMWmsByTienda(ref EdiDBContext _DbO, int IdClient, int TiendaId) {
            List<PedidosWmsModel> ListExists = new List<PedidosWmsModel>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"[dbo].[SP_GetPedidosMWmsByTienda] {IdClient}, '{TiendaId}'";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        ListExists.Add(new PedidosWmsModel() {
                            ClienteId = Dr.Gr<int>(0),
                            PedidoBarcode = Dr.Gr<string>(1),
                            FechaPedido = Dr.Gr<string>(2),
                            Estatus = Dr.Gr<string>(4),
                            NomBodega = Dr.Gr<string>(5),
                            Regimen = Dr.Gr<string>(6),
                            Observacion = Dr.Gr<string>(7),
                            PedidoId = Dr.Gr<int>(8),
                            Total = Dr.Gr<int>(9)
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListExists;
        }
        public static IEnumerable<PeticionesAdminBGModel> SP_GetWmsGroupDispatchsSunday(ref EdiDBContext _DbO, int ClienteId, string FechaI, string FechaF) {
            List<PeticionesAdminBGModel> ListExists = new List<PeticionesAdminBGModel>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"[dbo].[SP_GetWmsGroupDispatchsSunday] {ClienteId}, '{FechaI}', '{FechaF}'";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        ListExists.Add(new PeticionesAdminBGModel() {
                            Id = Dr.Gr<int>(0),
                            TiendaId = Convert.ToInt32(Dr.Gr<string>(1)),
                            Tienda = Dr.Gr<string>(2),
                            WomanQty = Dr.Gr<int>(3),
                            ManQty = Dr.Gr<int>(4),
                            KidQty = Dr.Gr<int>(5),
                            AccQty = Dr.Gr<int>(6),
                            FechaPedido = Dr.Gr<string>(7),
                            Total = Convert.ToInt32(Dr.Gr<double>(8))
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListExists;
        }
        public static IEnumerable<PaylessProdPrioriDetModel> SP_GetTransDif(ref EdiDBContext _DbO, int IdM) {
            List<PaylessProdPrioriDetModel> ListExists = new List<PaylessProdPrioriDetModel>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"dbo.GetTransDif {IdM}";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    int NRow = 0;
                    while (Dr.Read()) {
                        ListExists.Add(new PaylessProdPrioriDetModel() {
                            Id = NRow++,
                            Barcode = Dr.Gr<string>(0),
                            Categoria = Dr.Gr<string>(1)
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListExists;
        }
        public static IEnumerable<PaylessProdPrioriDetModel> SP_GetPaylessProdTallaLoteFil(ref EdiDBContext _DbO, string TxtBarcode, string CboProducto, string CboTalla, string CboLote, string CboCategoria, string CodUser, int BodegaId) {
            List<PaylessProdPrioriDetModel> ListExists = new List<PaylessProdPrioriDetModel>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"dbo.SP_GetPaylessProdTallaLoteFil '{TxtBarcode}', '{CboProducto}', '{CboTalla}', '{CboLote}', '{CboCategoria}', '{CodUser}', {BodegaId}";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    int NRow = 0;
                    while (Dr.Read()) {
                        ListExists.Add(new PaylessProdPrioriDetModel() {
                            Id = NRow++,
                            Barcode = Dr.Gr<string>(0),
                            Producto = Dr.Gr<string>(1),
                            Talla = Dr.Gr<string>(2),
                            Lote = Dr.Gr<string>(3),
                            Categoria = Dr.Gr<string>(4),
                            Cp = Dr.Gr<string>(5)
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListExists;
        }
        public static void SP_GetSetExistenciasByCliente(ref EdiDBContext _DbO, int ClienteId, string CodUser) {            
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"dbo.SP_GetSetExistenciasByCliente {ClienteId}, '{CodUser}'";
                _DbO.Database.OpenConnection();
                Cmd.ExecuteNonQuery();
                _DbO.Database.CloseConnection();
            }
        }
        public static void SP_GetSetExistenciasByClienteAll(ref EdiDBContext _DbO, int ClienteId, string CodUser) {            
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"dbo.SP_GetSetExistenciasByCliente {ClienteId}, '{CodUser}', 1";
                _DbO.Database.OpenConnection();
                Cmd.ExecuteNonQuery();
                _DbO.Database.CloseConnection();
            }
        }
        public static IEnumerable<PaylessInvSnapshotDet> SP_GetSetInvToday(ref EdiDBContext _DbO, int ClienteId, string CodUser) {
            List<PaylessInvSnapshotDet> ListExists = new List<PaylessInvSnapshotDet>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"SP_GetSetInvToday {ClienteId}, '{CodUser}'";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        ListExists.Add(new PaylessInvSnapshotDet() {
                            TiendaId = Dr.Gr<int?>(0),
                            Bodega = Dr.Gr<string>(1),
                            WomanQty = Dr.Gr<int>(2),
                            TotalCp = Dr.Gr<int>(3),
                            Total = Dr.Gr<int>(4),
                            TotalSolicitado = Dr.Gr<int>(5),
                            AvaWomanQty = Dr.Gr<int>(6),
                            AvaManQty = Dr.Gr<int>(7),
                            AvaKidsQty = Dr.Gr<int>(8),
                            AvaAccQty = Dr.Gr<int>(9)
                        });                        
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListExists;
        }
        public static IEnumerable<PaylessInvSnapshotDetGModel> SP_GetSetInvTodayByBodega(ref EdiDBContext _DbO, int ClienteId, string CodUser) {
            List<PaylessInvSnapshotDetGModel> ListExists = new List<PaylessInvSnapshotDetGModel>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"SP_GetSetInvTodayByBodega {ClienteId}, '{CodUser}'";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        ListExists.Add(new PaylessInvSnapshotDetGModel {
                            BodegaId = Dr.Gr<int?>(0),
                            Bodega = Dr.Gr<string>(1),
                            TiendaId = Dr.Gr<int?>(2),
                            Tienda = Dr.Gr<string>(3),
                            Categoria = Dr.Gr<string>(4),
                            WomanQty = Dr.Gr<int>(5),
                            TotalCp = Dr.Gr<int>(6),
                            Total = Dr.Gr<int>(7),
                            TotalSolicitado = Dr.Gr<int>(8),
                            AvaWomanQty = Dr.Gr<int>(9),
                            AvaManQty = Dr.Gr<int>(10),
                            AvaKidsQty = Dr.Gr<int>(11),
                            AvaAccQty = Dr.Gr<int>(12)
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListExists;
        }
        public static void GetEntradasSalidasWms(ref EdiDBContext _DbO, int ClienteId) {
            List<PaylessProdPrioriDet> ListExists = new List<PaylessProdPrioriDet>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"SP_GetEntradasSalidasWms {ClienteId}";
                _DbO.Database.OpenConnection();
                Cmd.ExecuteNonQuery();
                _DbO.Database.CloseConnection();
            }
        }
        public static void PaylessDeleteRepeated(ref EdiDBContext _DbO) {
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandTimeout = 600;
                Cmd.CommandText = $"SP_PaylessDeleteRepeated";
                _DbO.Database.OpenConnection();
                Cmd.ExecuteNonQuery();
                _DbO.Database.CloseConnection();
            }
        }
        public static IEnumerable<WmsDispatch> WmsGetDisDet(ref EdiDBContext _DbO, long TransaccionId) {
            List<WmsDispatch> ListExists = new List<WmsDispatch>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"SP_WmsGetDisDet {TransaccionId}";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        ListExists.Add(new WmsDispatch() {
                            CodProducto = Dr.Gr<string>(0),
                            Barcode = Dr.Gr<string>(1),
                            TipoBulto = Dr.Gr<int>(2),
                            UnidadMedida = Dr.Gr<string>(3),
                            Cantidad = Dr.Gr<int>(4),
                            Cp = Dr.Gr<string>(5),
                            Categoria = Dr.Gr<string>(6),
                            Departamento = Dr.Gr<string>(7),
                            Producto = Dr.Gr<string>(8),
                            Talla = Dr.Gr<string>(9)
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListExists;
        }
        public static IEnumerable<PaylessProdPrioriDet> SP_GetPaylessGetAllProducts(ref EdiDBContext _DbO, int ClienteId) {
            List<PaylessProdPrioriDet> ListExists = new List<PaylessProdPrioriDet>();
            using (DbCommand Cmd = _DbO.Database.GetDbConnection().CreateCommand()) {
                Cmd.CommandText = $"SP_GetPaylessGetAllProducts {ClienteId}";
                _DbO.Database.OpenConnection();
                DbDataReader Dr = Cmd.ExecuteReader();
                if (Dr.HasRows) {
                    while (Dr.Read()) {
                        ListExists.Add(new PaylessProdPrioriDet() {
                            Pri = Dr.Gr<string>(0),
                            Barcode = Dr.Gr<string>(1),
                            Categoria = Dr.Gr<string>(2),
                            Cp = Dr.Gr<string>(3),
                            Talla = Dr.Gr<string>(4),
                            Producto = Dr.Gr<string>(5)                            
                        });
                    }
                }
                _DbO.Database.CloseConnection();
                if (!Dr.IsClosed)
                    Dr.Close();
            }
            return ListExists;
        }
    }
}
