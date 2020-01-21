﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using ComModels;
using ComModels.Models.EdiDB;
using ComModels.Models.WmsDB;
using Newtonsoft.Json;

namespace CoreApiClient
{
    public partial class ApiClient {
        public string Encrypt(string Val) {
            return Convert.ToBase64String(CryptoHelper.EncryptData(Encoding.UTF8.GetBytes(Val)));
        }
        //public byte[] Decrypt(byte[] Val)
        //{
        //    return CryptoHelper.DecryptData(Val);
        //}
        public async Task<RetReporte> TranslateForms830() {
            return await GetAsync<RetReporte>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Edi/TranslateForms830")));
        }
        public async Task<IEnumerable<Rep830Info>> GetPureEdi(string HashId = "") {
            return await GetAsync<IEnumerable<Rep830Info>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPureEdi"), $"HashId={HashId}"));
        }
        public async Task<IEnumerable<EdiComs>> GetEdiComs() {
            return await GetAsync<IEnumerable<EdiComs>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetEdiComs")));
        }
        public async Task<IEnumerable<EdiRepSent>> GetEdiRepSent() {
            return await GetAsync<IEnumerable<EdiRepSent>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetEdiRepSent")));
        }
        public async Task<IEnumerable<LearPureEdi>> GetLearPureEdi() {
            return await GetAsync<IEnumerable<LearPureEdi>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetLearPureEdi")));
        }
        public async Task<IEnumerable<TsqlDespachosWmsComplex>> GetSN(bool NoEnviado) {
            return await GetAsync<IEnumerable<TsqlDespachosWmsComplex>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetSN"), $"?NoEnviado={NoEnviado}"));
        }
        public async Task<IEnumerable<TsqlDespachosWmsComplex>> GetSN(IEnumerable<string> _ListDispatch, IEnumerable<string> _ListProducts) {
            return await GetAsync<IEnumerable<TsqlDespachosWmsComplex>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetSNDetails"), "?ListDispatch=" + string.Join('|', _ListDispatch) + "&ListProducts=" + string.Join('|', _ListProducts)));
        }
        public async Task<FE830Data> GetFE830Data(string HashId) {
            return await GetAsync<FE830Data>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetFE830Data"), $"HashId={HashId}"));
        }
        public async Task<string> SendForm856(IEnumerable<string> _ListDispatch, string Idusr) {
            return await GetAsyncNoJson<string>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/SendForm856"), $"?listDispatch={string.Join('|', _ListDispatch)}&Idusr={Idusr}"));
        }
        public async Task<string> UpdateLinComments(string _LinHashId, string _TxtLinComData, string _ListFst) {
            return await GetAsyncNoJson<string>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/UpdateLinComments"), $"?LinHashId={_LinHashId}&TxtLinComData={_TxtLinComData}&ListFst={_ListFst}"));
        }
        public async Task<string> Login(string _User, string _Password) {
            return await GetAsyncNoJson<string>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/Login"), $"?User={_User}&Password={_Password}"));
        }
        public async Task<RetInfo> AutoSendInventary830(string _Force, string Idusr) {
            return await GetAsync<RetInfo>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Edi/AutoSendInventary830"), $"?Force={_Force}&Idusr={Idusr}"));
        }
        public async Task<string> LastRep() {
            return await GetAsyncNoJson<string>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/LastRep")));
        }
        // Extranet
        public async Task<string> LoginExtern(string _User, string _Password) {
            UserModel UserO = new UserModel() {
                User = _User,
                Password = _Password
            };
            string JsonParams = JsonConvert.SerializeObject(UserO);
            return await PostAsyncJson<string>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/LoginExtern")), JsonParams);
        }
        public async Task<RetData<IEnumerable<ExistenciasExternModel>>> GetStock(int ClientId) {
            string JsonParams = JsonConvert.SerializeObject(ClientId);
            string JsonRes = await PostAsyncJson<string>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetStock")), JsonParams);
            return JsonConvert.DeserializeObject<RetData<IEnumerable<ExistenciasExternModel>>>(JsonRes);
        }
        public async Task<RetData<PaylessTiendas>> GetClient(int TiendaId) {
            string JsonParams = JsonConvert.SerializeObject(TiendaId);
            string JsonRes = await PostAsyncJson<string>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetClient")), JsonParams);
            return JsonConvert.DeserializeObject<RetData<PaylessTiendas>>(JsonRes);
        }
        public async Task<RetData<Tuple<IEnumerable<PedidosExternos>, IEnumerable<PedidosDetExternos>>>> GetPedidosExternosByTienda(int ClienteId, int TiendaId) {
            return await GetAsync<RetData<Tuple<IEnumerable<PedidosExternos>, IEnumerable<PedidosDetExternos>>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPedidosExternosByTienda"), $"?ClienteId={ClienteId}&TiendaId={TiendaId}"));
        }
        public async Task<RetData<Tuple<IEnumerable<PedidosExternos>, IEnumerable<PedidosDetExternos>>>> GetPedidosExternosMDetAdmin(int ClienteId) {
            return await GetAsync<RetData<Tuple<IEnumerable<PedidosExternos>, IEnumerable<PedidosDetExternos>>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPedidosExternos"), $"?ClienteId={ClienteId}"));
        }
        public async Task<RetData<IEnumerable<PaylessProdPrioriDetModel>>> GetPedidosExternosDet(int PedidoId) {
            string JsonParams = JsonConvert.SerializeObject(PedidoId);
            return await PostGetAsyncJson<RetData<IEnumerable<PaylessProdPrioriDetModel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPedidosExternosDet")), JsonParams);
        }
        public async Task<RetData<Tuple<IEnumerable<PedidosExternos>, IEnumerable<PedidosDetExternos>>>> GetPedidosExternosGuardados(int ClienteId) {
            string JsonParams = JsonConvert.SerializeObject(ClienteId);
            return await PostGetAsyncJson<RetData<Tuple<IEnumerable<PedidosExternos>, IEnumerable<PedidosDetExternos>>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPedidosExternosGuardados")), JsonParams);
        }
        public async Task<RetData<Tuple<IEnumerable<PedidosExternos>, IEnumerable<PedidosDetExternos>>>> GetPedidosExternosPendientes(int ClienteId) {
            string JsonParams = JsonConvert.SerializeObject(ClienteId);
            return await PostGetAsyncJson<RetData<Tuple<IEnumerable<PedidosExternos>, IEnumerable<PedidosDetExternos>>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPedidosExternosPendientes")), JsonParams);
        }
        public async Task<RetData<Tuple<IEnumerable<PedidosExternos>, IEnumerable<PedidosDetExternos>>>> GetPedidosExternosPendientesByTienda(int ClienteId, int TiendaId) {
            return await GetAsync<RetData<Tuple<IEnumerable<PedidosExternos>, IEnumerable<PedidosDetExternos>>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPedidosExternosPendientesByTienda"), $"?ClienteId={ClienteId}&TiendaId={TiendaId}"));
        }
        public async Task<RetData<Tuple<IEnumerable<PedidosExternos>, IEnumerable<PedidosDetExternos>, IEnumerable<Clientes>>>> GetPedidosExternosPendientesAdmin() {
            return await GetAsync<RetData<Tuple<IEnumerable<PedidosExternos>, IEnumerable<PedidosDetExternos>, IEnumerable<Clientes>>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPedidosExternosPendientesAdmin")));
        }
        public async Task<RetData<Tuple<IEnumerable<PedidosExternos>, IEnumerable<PedidosDetExternos>>>> GetPedidosExternosAdmin(int PedidoId) {
            string JsonParams = JsonConvert.SerializeObject(PedidoId);
            return await PostGetAsyncJson<RetData<Tuple<IEnumerable<PedidosExternos>, IEnumerable<PedidosDetExternos>>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPedidosExternosAdmin")), JsonParams);
        }
        public async Task<RetData<IEnumerable<PedidosDetExternos>>> GetPedidosDetExternos(int PedidoId) {
            string JsonParams = JsonConvert.SerializeObject(PedidoId);
            return await PostGetAsyncJson<RetData<IEnumerable<PedidosDetExternos>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPedidosDetExternos")), JsonParams);
        }
        public async Task<RetData<PedidosExternos>> SetPedidoExterno(IEnumerable<PaylessProdPrioriDetModel> ListDis, int ClienteId, int IdEstado, string cboPeriod, string TiendaIdDest) {
            string JsonParams = JsonConvert.SerializeObject(ListDis);
            return await PostGetAsyncJson<RetData<PedidosExternos>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/SetPedidoExterno"), $"?ClienteId={ClienteId}&IdEstado={IdEstado}&cboPeriod={cboPeriod}&TiendaIdDest={TiendaIdDest}"), JsonParams);
        }
        public async Task<RetData<PedidosDetExternos>> SetPedidoDetExterno(PedidosDetExternos PedidoDetExterno) {
            string JsonParams = JsonConvert.SerializeObject(PedidoDetExterno);
            return await PostGetAsyncJson<RetData<PedidosDetExternos>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/SetPedidoDetExterno")), JsonParams);
        }
        public async Task<RetData<IEnumerable<PedidosWmsModel>>> GetPedidosWms(int ClienteId) {
            string JsonParams = JsonConvert.SerializeObject(ClienteId);
            return await PostGetAsyncJson<RetData<IEnumerable<PedidosWmsModel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPedidosWms")), JsonParams);
        }
        public async Task<RetData<IEnumerable<PedidosWmsModel>>> GetWmsGroupDispatchs(int ClienteId) {
            return await GetAsync<RetData<IEnumerable<PedidosWmsModel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetWmsGroupDispatchs"), $"?ClienteId={ClienteId}"));
        }
        public async Task<RetData<IEnumerable<PedidosWmsModel>>> GetWmsGroupDispatchsBills(int ClienteId) {
            return await GetAsync<RetData<IEnumerable<PedidosWmsModel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetWmsGroupDispatchsBills"), $"?ClienteId={ClienteId}"));
        }
        public async Task<RetData<IEnumerable<ClientesModel>>> GetClientsOrders() {
            return await GetAsync<RetData<IEnumerable<ClientesModel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetClientsOrders")));
        }
        public async Task<RetData<IEnumerable<TsqlDespachosWmsComplex>>> GetPedidosDet(int PedidoId) {
            string JsonParams = JsonConvert.SerializeObject(PedidoId);
            return await PostGetAsyncJson<RetData<IEnumerable<TsqlDespachosWmsComplex>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPedidosDet")), JsonParams);
        }
        public async Task<RetData<IEnumerable<PaylessProdPrioriDetModel>>> GetPaylessProdPriori(string Period) {
            string JsonParams = JsonConvert.SerializeObject(Period);
            return await PostGetAsyncJson<RetData<IEnumerable<PaylessProdPrioriDetModel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPaylessProdPriori")), JsonParams);
        }
        public async Task<RetData<IEnumerable<PaylessProdPrioriDetModel>>> GetPaylessProdPrioriAll(int ClienteId) {
            return await GetAsync<RetData<IEnumerable<PaylessProdPrioriDetModel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPaylessProdPrioriAll"), $"?ClienteId={ClienteId}"));
        }
        public async Task<RetData<string>> SetPaylessProdPriori(IEnumerable<PaylessUploadFileModel> ListUpload, int ClienteId, string Periodo, string codUsr, string transporte, bool ChkUpDelete) {
            string JsonParams = JsonConvert.SerializeObject(ListUpload);
            return await PostGetAsyncJson<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/SetPaylessProdPriori"), $"?ClienteId={ClienteId}&Periodo={Periodo}&codUsr={codUsr}&transporte={transporte}&ChkUpDelete={ChkUpDelete}"), JsonParams);
        }
        public async Task<RetData<IEnumerable<string>>> GetPaylessPeriodPriori(int ClienteId) {
            return await GetAsync<RetData<IEnumerable<string>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPaylessPeriodPriori"), $"?ClienteId={ClienteId}"));
        }
        public async Task<RetData<IEnumerable<string>>> GetPaylessPeriodPrioriByClient(int ClienteId) {
            string JsonParams = JsonConvert.SerializeObject(ClienteId);
            return await GetAsync<RetData<IEnumerable<string>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPaylessPeriodPrioriByClient"), $"?ClienteId={ClienteId}"));
        }
        public async Task<RetData<PaylessProdPrioriArchM>> SetPaylessProdPrioriFile(IEnumerable<string> ListUploadSalida, IEnumerable<string> ListUploadEntrada, int IdTransporte, string Periodo, string codUsr, string cboTipo, int ClienteId) {
            string JsonParams = JsonConvert.SerializeObject(new Tuple<IEnumerable<string>, IEnumerable<string>>(ListUploadSalida, ListUploadEntrada));
            return await PostGetAsyncJson<RetData<PaylessProdPrioriArchM>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/SetPaylessProdPrioriFile"), $"?IdTransporte={IdTransporte}&Periodo={Periodo}&codUsr={codUsr}&cboTipo={cboTipo}&ClienteId={ClienteId}"), JsonParams);
        }
        public async Task<RetData<Tuple<IEnumerable<PaylessProdPrioriArchMModel>, IEnumerable<PaylessProdPrioriArchDet>>>> GetPaylessPeriodPrioriFile(int ClienteId) {
            return await PostGetAsyncJson<RetData<Tuple<IEnumerable<PaylessProdPrioriArchMModel>, IEnumerable<PaylessProdPrioriArchDet>>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPaylessPeriodPrioriFile"), $"?ClienteId={ClienteId}"), "");
        }
        public async Task<RetData<IEnumerable<Clientes>>> GetClients() {
            return await GetAsync<RetData<IEnumerable<Clientes>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetClients")));
        }
        public async Task<RetData<string>> GetClientById(int ClienteId) {
            return await GetAsync<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetClientById"), $"?ClienteId={ClienteId}"));
        }
        public async Task<RetData<Tuple<string, string, string, bool>>> GetClientNameScheduleById(int TiendaId) {
            return await GetAsync<RetData<Tuple<string, string, string, bool>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetClientNameScheduleById"), $"?TiendaId={TiendaId}"));
        }
        public async Task<RetData<IEnumerable<PaylessProdPrioriDetModel>>> GetPaylessFileDif(string idProdArch, int idData, int ClienteId) {
            return await GetAsync<RetData<IEnumerable<PaylessProdPrioriDetModel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPaylessFileDif"), $"?idProdArch={idProdArch}&idData={idData}&ClienteId={ClienteId}"));
        }
        public async Task<RetData<IEnumerable<PaylessProdPrioriDetModel>>> GetTransDif(int IdM) {
            return await GetAsync<RetData<IEnumerable<PaylessProdPrioriDetModel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetTransDif"), $"?IdM={IdM}"));
        }
        /////////////////////////////////////////Account
        public async Task<string> LoginIe(string _User, string _Password) {
            UserModel UserO = new UserModel() {
                User = _User,
                Password = _Password
            };
            string JsonParams = JsonConvert.SerializeObject(UserO);
            return await PostAsyncJson<string>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Account/LoginIe")), JsonParams);
        }
        public async Task<RetData<IEnumerable<IenetUsers>>> GetUsers(string HashId) {
            string JsonParams = JsonConvert.SerializeObject(HashId);
            return await PostGetAsyncJson<RetData<IEnumerable<IenetUsers>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Account/GetUsers")), JsonParams);
        }
        public async Task<RetData<IEnumerable<IenetGroups>>> GetGroups(string HashId) {
            string JsonParams = JsonConvert.SerializeObject(HashId);
            return await PostGetAsyncJson<RetData<IEnumerable<IenetGroups>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Account/GetGroups")), JsonParams);
        }
        public async Task<RetData<Tuple<IEnumerable<IenetGroups>, IEnumerable<IenetAccesses>, IEnumerable<IenetGroupsAccesses>, IEnumerable<IenetGroupsAccesses>>>> GetLoginStruct(string IdGroup) {
            return await GetAsync<RetData<Tuple<IEnumerable<IenetGroups>, IEnumerable<IenetAccesses>, IEnumerable<IenetGroupsAccesses>, IEnumerable<IenetGroupsAccesses>>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Account/GetLoginStruct"), $"?IdGroup={IdGroup}"));
        }
        public async Task<RetData<IEnumerable<IenetAccesses>>> GetIenetAccesses(string HashId) {
            string JsonParams = JsonConvert.SerializeObject(HashId);
            return await PostGetAsyncJson<RetData<IEnumerable<IenetAccesses>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Account/GetIenetAccesses")), JsonParams);
        }
        public async Task<RetData<IEnumerable<IenetGroupsAccesses>>> GetIEnetGroupsAccesses(string HashId) {
            string JsonParams = JsonConvert.SerializeObject(HashId);
            return await PostGetAsyncJson<RetData<IEnumerable<IenetGroupsAccesses>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Account/GetIEnetGroupsAccesses")), JsonParams);
        }
        public async Task<RetData<IEnumerable<Clientes>>> GetAllClients(string HashId) {
            string JsonParams = JsonConvert.SerializeObject(HashId);
            return await PostGetAsyncJson<RetData<IEnumerable<Clientes>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetAllClients")), JsonParams);
        }
        public async Task<RetData<IEnumerable<PaylessTiendas>>> GetAllPaylessStores(string HashId) {
            string JsonParams = JsonConvert.SerializeObject(HashId);
            return await PostGetAsyncJson<RetData<IEnumerable<PaylessTiendas>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetAllPaylessStores")), JsonParams);
        }
        public async Task<RetData<Tuple<IEnumerable<PaylessProdPrioriArchM>, IEnumerable<PaylessProdPrioriArchDet>>>> GetPaylessPeriodPrioriFileExists(string Period, int ClienteId) {
            return await PostGetAsyncJson<RetData<Tuple<IEnumerable<PaylessProdPrioriArchM>, IEnumerable<PaylessProdPrioriArchDet>>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPaylessPeriodPrioriFileExists"), $"?Period={Period}&ClienteId={ClienteId}"), "");
        }
        public async Task<RetData<Tuple<IEnumerable<PaylessProdPrioriArchM>, IEnumerable<PaylessProdPrioriArchDet>>>> GetPaylessPeriodPrioriFileExists2(string TiendaId) {
            return await PostGetAsyncJson<RetData<Tuple<IEnumerable<PaylessProdPrioriArchM>, IEnumerable<PaylessProdPrioriArchDet>>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPaylessPeriodPrioriFileExists2"), $"?TiendaId={TiendaId}"), "");
        }
        public async Task<RetData<bool>> ChangePedidoState(int PedidoId, int ClienteId) {
            return await PostGetAsyncJson<RetData<bool>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/ChangePedidoState"), $"?PedidoId={PedidoId}&ClienteId={ClienteId}"), "");
        }
        public async Task<RetData<IEnumerable<PaylessReportes>>> GetPaylessReportes(int ClienteId) {
            return await GetAsync<RetData<IEnumerable<PaylessReportes>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPaylessReportes"), $"?ClienteId={ClienteId}"));
        }
        public async Task<RetData<IEnumerable<WmsFileModel>>> GetWmsFile(string Period, int IdTransport, int Typ) {
            return await GetAsync<RetData<IEnumerable<WmsFileModel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetWmsFile"), $"?Period={Period}&IdTransport={IdTransport}&Typ={Typ}"));
        }
        public async Task<RetData<string>> SetGroupAccess(int IdGroup, int IdAccess) {
            return await PostGetAsyncJson<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/SetGroupAccess"), $"?IdGroup={IdGroup}&IdAccess={IdAccess}"), "");
        }
        public async Task<RetData<IEnumerable<PaylessPeriodoTransporteModel>>> GetTransportByPeriod(string Period, int ClienteId) {
            return await PostGetAsyncJson<RetData<IEnumerable<PaylessPeriodoTransporteModel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetTransportByPeriod"), $"?Period={Period}&ClienteId={ClienteId}"), "");
        }
        public async Task<RetData<IEnumerable<Bodegas>>> GetWmsBodegas(int LocationId) {
            return await PostGetAsyncJson<RetData<IEnumerable<Bodegas>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetWmsBodegas"), $"?LocationId={LocationId}"), "");
        }
        public async Task<RetData<IEnumerable<Regimen>>> GetWmsRegimen(int BodegaId) {
            return await PostGetAsyncJson<RetData<IEnumerable<Regimen>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetWmsRegimen"), $"?BodegaId={BodegaId}"), "");
        }
        public async Task<RetData<string>> SetIngresoExcelWms2(IEnumerable<WmsFileModel> ListProducts, int cboBodega, int cboRegimen, string CodUser, int ClienteId) {
            string JsonParams = JsonConvert.SerializeObject(ListProducts);
            return await PostGetAsyncJson<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/SetIngresoExcelWms2"), $"?cboBodega={cboBodega}&cboRegimen={cboRegimen}&CodUser={CodUser}&ClienteId={ClienteId}"), JsonParams);
        }
        public async Task<RetData<string>> SetIngresoExcelWmsCheck(IEnumerable<WmsFileModel> ListProducts, int cboBodega, int cboRegimen, string CodUser, int ClienteId) {
            string JsonParams = JsonConvert.SerializeObject(ListProducts);
            return await PostGetAsyncJson<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/SetIngresoExcelWmsCheck"), $"?cboBodega={cboBodega}&cboRegimen={cboRegimen}&CodUser={CodUser}&ClienteId={ClienteId}"), JsonParams);
        }
        public async Task<RetData<string>> SetSalidaWmsFromEscaner(IEnumerable<string> ListProducts2, string dtpPeriodo, int cboBodegas, int cboRegimen, int ClienteId, string CodUser, int cboLocation, int cboTipo) {
            string JsonParams = JsonConvert.SerializeObject(ListProducts2);
            return await PostGetAsyncJson<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/SetSalidaWmsFromEscaner"), $"?dtpPeriodo={dtpPeriodo}&cboBodegas={cboBodegas}&cboRegimen={cboRegimen}&ClienteId={ClienteId}&CodUser={CodUser}&cboLocation={cboLocation}&cboTipo={cboTipo}"), JsonParams);
        }
        public async Task<RetData<string>> SetNewDisPayless(string dtpFechaEntrega, int txtWomanQty, int txtManQty, int txtKidQty, int txtAccQty, string radInvType, int ClienteId, int TiendaId, bool? Divert, bool? FullPed, int? TiendaIdDestino, int? txtWomanQtyT, int? txtManQtyT, int? txtKidQtyT, int? txtAccQtyT, string CodUser) {
            string JsonParams = JsonConvert.SerializeObject(TiendaId);
            return await PostGetAsyncJson<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/SetNewDisPayless"), $"?dtpFechaEntrega={dtpFechaEntrega}&txtWomanQty={txtWomanQty}&txtManQty={txtManQty}&txtKidQty={txtKidQty}&txtAccQty={txtAccQty}&radInvType={radInvType}&ClienteId={ClienteId}&TiendaId={TiendaId}&Divert={Divert}&FullPed={FullPed}&TiendaIdDestino={TiendaIdDestino}&txtWomanQtyT={txtWomanQtyT}&txtManQtyT={txtManQtyT}&txtKidQtyT={txtKidQtyT}&txtAccQtyT={txtAccQtyT}&CodUser={CodUser}"), JsonParams);
        }
        public async Task<RetData<IEnumerable<PaylessTiendas>>> GetStores(int ClienteId) {
            return await GetAsync<RetData<IEnumerable<PaylessTiendas>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetStores"), $"?ClienteId={ClienteId}"));
        }
        public async Task<RetData<IEnumerable<AsyncStates>>> GetAsyncState(int Typ, string CodUser) {
            return await GetAsync<RetData<IEnumerable<AsyncStates>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetAsyncState"), $"?Typ={Typ}&CodUser={CodUser}"));
        }
        public async Task<RetData<IEnumerable<FE830DataAux>>> GetStockByTienda(int ClienteId, int TiendaId) {
            return await GetAsync<RetData<IEnumerable<FE830DataAux>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetStockByTienda"), $"?ClienteId={ClienteId}&TiendaId={TiendaId}"));
        }
        public async Task<RetData<IEnumerable<FE830DataAux>>> GetStockByCliente(int ClienteId) {
            return await GetAsync<RetData<IEnumerable<FE830DataAux>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetStockByClient"), $"?ClienteId={ClienteId}"));
        }
        public async Task<RetData<List<PedidosPendientesAdmin>>> GetPedidosPendientesAdmin(int ClienteId) {
            return await GetAsync<RetData<List<PedidosPendientesAdmin>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPedidosPendientesAdmin"), $"?ClienteId={ClienteId}"));
        }
        public async Task<RetData<string>> ChangeUserClient(int IdUser, int ClienteId) {
            return await GetAsync<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/ChangeUserClient"), $"?IdUser={IdUser}&ClienteId={ClienteId}"));
        }
        public async Task<RetData<string>> ChangeUserTienda(int IdUser, int TiendaId) {
            return await GetAsync<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/ChangeUserTienda"), $"?IdUser={IdUser}&TiendaId={TiendaId}"));
        }
        public async Task<RetData<IEnumerable<PeticionesAdminBGModel>>> GetPeticionesAdminB(int ClienteId) {
            return await GetAsync<RetData<IEnumerable<PeticionesAdminBGModel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPeticionesAdminB"), $"?ClienteId={ClienteId}"));
        }
        public async Task<RetData<IEnumerable<PedidosWmsModel>>> GetPedidosMWmsByTienda(int ClienteId, int TiendaId) {
            return await GetAsync<RetData<IEnumerable<PedidosWmsModel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPedidosMWmsByTienda"), $"?ClienteId={ClienteId}&TiendaId={TiendaId}"));
        }
        public async Task<RetData<string>> ChangePedidoExternoIdWMS(int PedidoId, int PedidoIdWms) {
            return await GetAsync<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/ChangePedidoExternoIdWMS"), $"?PedidoId={PedidoId}&PedidoIdWms={PedidoIdWms}"));
        }
        public async Task<RetData<IEnumerable<PedidosWmsModel>>> GetWmsDetDispatchsBills(int ClienteId) {
            return await GetAsync<RetData<IEnumerable<PedidosWmsModel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetWmsDetDispatchsBills"), $"?ClienteId={ClienteId}"));
        }
        public async Task<RetData<Tuple<PaylessReportes, IEnumerable<PaylessReportesDet>, IEnumerable<PaylessTiendas>>>> GetWeekReport(int Id, string Typ) {
            return await GetAsync<RetData<Tuple<PaylessReportes, IEnumerable<PaylessReportesDet>, IEnumerable<PaylessTiendas>>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetWeekReport"), $"?Id={Id}&Typ={Typ}"));
        }
        public async Task<RetData<Tuple<IEnumerable<int>, IEnumerable<string>, IEnumerable<int>, IEnumerable<string>>>> GetProductoTallaLoteCategoria(int ClienteId) {
            return await GetAsync<RetData<Tuple<IEnumerable<int>, IEnumerable<string>, IEnumerable<int>, IEnumerable<string>>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetProductoTallaLoteCategoria"), $"?ClienteId={ClienteId}"));
        }
        public async Task<RetData<IEnumerable<PaylessProdPrioriDetModel>>> GetPaylessProdTallaLoteFil(string TxtBarcode, string CboProducto, string CboTalla, string CboLote, string CboCategoria, string CodUser, string BodegaId) {
            return await GetAsync<RetData<IEnumerable<PaylessProdPrioriDetModel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPaylessProdTallaLoteFil"), $"?TxtBarcode={TxtBarcode}&CboProducto={CboProducto}&CboTalla={CboTalla}&CboLote={CboLote}&CboCategoria={CboCategoria}&CodUser={CodUser}&BodegaId={BodegaId}"));
        }
        public async Task<RetData<bool>> GetSetExistenciasByCliente(int ClienteId, string CodUser) {
            return await GetAsync<RetData<bool>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetSetExistenciasByCliente"), $"?ClienteId={ClienteId}&CodUser={CodUser}"));
        }
        public async Task<RetData<IEnumerable<CboValuesModel>>> GetPaylessEncuestaCboPedidos(int ClienteId, int TiendaId, int Typ) {
            return await GetAsync<RetData<IEnumerable<CboValuesModel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Cbo/GetPaylessEncuestaCboPedidos"), $"?TiendaId={TiendaId}&Typ={Typ}&ClienteId={ClienteId}"));
        }
        public async Task<RetData<IEnumerable<PaylessProdPrioriDetModel>>> GetPaylessSellQtys(int ClienteId, string TiendaId, string CodUser) {
            return await GetAsync<RetData<IEnumerable<PaylessProdPrioriDetModel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPaylessSellQtys"), $"?ClienteId={ClienteId}&TiendaId={TiendaId}&CodUser={CodUser}"));
        }
        public async Task<RetData<IEnumerable<PaylessPedidosCpT>>> GetTemporadas(int ClienteId) {
            return await GetAsync<RetData<IEnumerable<PaylessPedidosCpT>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetTemporadas"), $"?ClienteId={ClienteId}"));
        }
        public async Task<RetData<IEnumerable<PaylessProdPrioriDet>>> GetFilterTemporada() {
            return await GetAsync<RetData<IEnumerable<PaylessProdPrioriDet>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Cbo/GetFilterTemporada")));
        }
        public async Task<RetData<string>> PaylessAddTemporada(string CboProducto, string CboTalla, string CboLote, string CboCategoria, string CboDepartamento, string CboCp) {
            return await GetAsync<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/PaylessAddTemporada"), $"?CboProducto={CboProducto}&CboTalla={CboTalla}&CboLote={CboLote}&CboCategoria={CboCategoria}&CboDepartamento={CboDepartamento}&CboCp={CboCp}"));
        }
        public async Task<RetData<string>> PaylessDeleteTemporada(int Id) {
            return await GetAsync<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/PaylessDeleteTemporada"), $"?id={Id}"));
        }
        public async Task<RetData<string>> SetPaylessEncuestaPedidos(int TiendaId, string cboPedido, string CodUser, string preg0, string preg2, string preg2a, string preg2b, string preg2c, string preg3, string preg3a, string preg4, string preg4a, string preg5, string preg5a, string preg6, string preg7, string preg7a, string preg8, string preg9, string preg10, string preg11, string preg12, string preg13, string preg14, string preg15, string preg16, string preg17, string preg17a, string preg18, string Nombre, string preg19, int ClienteId) {
            return await GetAsync<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/SetPaylessEncuestaPedidos"), $"?TiendaId={TiendaId}&preg0={preg0}&cboPedido={cboPedido}&preg2={preg2}&preg2a={preg2a}&preg2b={preg2b}&preg2c={preg2c}&preg3={preg3}&preg3a={preg3a}&preg4={preg4}&preg4a={preg4a}&preg5={preg5}&preg5a={preg5a}&preg6={preg6}&preg7={preg7}&preg7a={preg7a}&preg8={preg8}&preg9={preg9}&preg10={preg10}&preg11={preg11}&preg12={preg12}&preg13={preg13}&preg14={preg14}&preg15={preg15}&preg16={preg16}&preg17={preg17}&preg17a={preg17a}&preg18={preg18}&CodUser={CodUser}&Nombre={Nombre}&preg19={preg19}&ClienteId={ClienteId}"));
        }
        public async Task<RetData<IEnumerable<PaylessEncuestaRepMmGModel>>> GetPaylessEncuestaRepM(int Anio, int Mes, string CodUser, int ClienteId) {
            return await GetAsync<RetData<IEnumerable<PaylessEncuestaRepMmGModel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPaylessEncuestaRepM"), $"?Anio={Anio}&Mes={Mes}&CodUser={CodUser}&ClienteId={ClienteId}"));
        }
        public async Task<RetData<Tuple<PaylessEncuestaRepMm, IEnumerable<PaylessEncuestaRepDet1>, IEnumerable<PaylessEncuestaRepDet2>>>> GetExcelEncuestaMatrix(int Id) {
            return await GetAsync<RetData<Tuple<PaylessEncuestaRepMm, IEnumerable<PaylessEncuestaRepDet1>, IEnumerable<PaylessEncuestaRepDet2>>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetExcelEncuestaMatrix"), $"?Id={Id}"));
        }
        public async Task<RetData<Tuple<IEnumerable<PaylessInvSnapshotM>, IEnumerable<PaylessInvSnapshotDet>>>> GetSnapshootInvByStore(int ClienteId, string Periodo) {
            return await GetAsync<RetData<Tuple<IEnumerable<PaylessInvSnapshotM>, IEnumerable<PaylessInvSnapshotDet>>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetSnapshootInvByStore"), $"?ClienteId={ClienteId}&Periodo={Periodo}"));
        }
        public async Task<RetData<IEnumerable<PaylessInvSnapshotDet>>> GetPaylessInv(int ClienteId) {
            return await GetAsync<RetData<IEnumerable<PaylessInvSnapshotDet>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPaylessInv"), $"?ClienteId={ClienteId}"));
        }
        public async Task<RetData<string>> MakePaylessInvSnapshot(int ClienteId) {
            return await GetAsync<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/MakePaylessInvSnapshot"), $"?ClienteId={ClienteId}"));
        }
        public async Task<RetData<string>> MakeAutoReportsPayless() {
            return await GetAsync<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/MakeAutoReportsPayless")));
        }
        public async Task<RetData<string>> SetPaylessEncuestaPedidos2(string CboPedido, string CodUser, string Preg2, string Preg2a, string Preg3, string Preg3a, string Preg4, string Preg4a, string Preg5, string Preg5a, string Preg6, string Preg6a, string Preg7, string Preg7a, string Preg8, string Preg8a, string Preg9, string Preg9a, string Preg18, string Nombre, int ClienteId) {
            return await GetAsync<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/SetPaylessEncuestaPedidos2"), $"?cboPedido={CboPedido}&Preg2={Preg2}&Preg2a={Preg2a}&Preg3={Preg3}&Preg3a={Preg3a}&Preg4={Preg4}&Preg4a={Preg4a}&Preg5={Preg5}&Preg5a={Preg5a}&Preg6={Preg6}&Preg6a={Preg6a}&Preg7={Preg7}&Preg7a={Preg7a}&Preg8={Preg8}&Preg8a={Preg8a}&Preg9={Preg9}&Preg9a={Preg9a}&Preg18={Preg18}&CodUser={CodUser}&Nombre={Nombre}&ClienteId={ClienteId}"));
        }
        public async Task<RetData<string>> SetChangeDis(int PedidoId) {
            return await GetAsync<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/SetChangeDis"), $"?PedidoId={PedidoId}"));
        }
        public async Task<RetData<string>> SetDeleteDis(int PedidoId, string CodUser, string Observaciones, string FechaEntrega) {
            return await GetAsync<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/SetDeleteDis"), $"?PedidoId={PedidoId}&Observaciones={Observaciones}&FechaEntrega={FechaEntrega}&CodUser={CodUser}"));
        }
        public async Task<RetData<IEnumerable<PedidosExternosDel>>> GetPedidosHist(int ClienteId) {
            return await GetAsync<RetData<IEnumerable<PedidosExternosDel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPedidosHist"), $"?ClienteId={ClienteId}"));
        }
        public async Task<RetData<string>> SetRestoreDis(int PedidoId, string CodUser, string Observaciones, string FechaEntrega) {
            return await GetAsync<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/SetRestoreDis"), $"?PedidoId={PedidoId}&Observaciones={Observaciones}&FechaEntrega={FechaEntrega}&CodUser={CodUser}"));
        }
        public async Task<RetData<IEnumerable<Locations>>> GetWmsLocations() {
            return await GetAsync<RetData<IEnumerable<Locations>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetWmsLocations")));
        }
        public async Task<RetData<IEnumerable<WmsInOutGModel>>> GetEntradasSalidasWms(int ClienteId, int BodegaId, int RegimenId) {
            return await GetAsync<RetData<IEnumerable<WmsInOutGModel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetEntradasSalidasWms"), $"?ClienteId={ClienteId}&BodegaId={BodegaId}&RegimenId={RegimenId}"));
        }
        public async Task<RetData<string>> UpdateProductsLocal() {
            return await GetAsync<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/UpdateProductsLocal")));
        }
        public async Task<RetData<IEnumerable<PaylessTiendasGModel>>> GetPaylessTiendas(int ClienteId) {
            return await GetAsync<RetData<IEnumerable<PaylessTiendasGModel>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPaylessTiendas"), $"?ClienteId={ClienteId}"));
        }
        public async Task<RetData<IEnumerable<PaylessRutas>>> GetPaylessRutas(int ClienteId) {
            return await GetAsync<RetData<IEnumerable<PaylessRutas>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPaylessRutas"), $"?ClienteId={ClienteId}"));
        }
        public async Task<RetData<string>> ChangeRutaAllowed(int Id) {
            return await GetAsync<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/ChangeRutaAllowed"), $"?Id={Id}"));
        }
        public async Task<RetData<string>> ChangeTiendaRutaId(int Id, int RutaId) {
            return await GetAsync<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/ChangeTiendaRutaId"), $"?Id={Id}&RutaId={RutaId}"));
        }
        public async Task<RetData<string>> GaDelete(int gaId) {
            return await GetAsync<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GaDelete"), $"?GaId={gaId}"));
        }
        public async Task<RetData<string>> AddRuta(int? NumRuta, string Horario, int? ClienteId, bool? CambioHorario) {
            return await GetAsync<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/AddRuta"), $"?NumRuta={NumRuta}&Horario={Horario}&ClienteId={ClienteId}&CambioHorario={CambioHorario}"));
        }
        public async Task<RetData<string>> DeleteRuta(int Id) {
            return await GetAsync<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/DeleteRuta"), $"?Id={Id}"));
        }
        public async Task<RetData<IEnumerable<WmsDispatch>>> GetIngresosWMSDet(long TransaccionId) {
            return await GetAsync<RetData<IEnumerable<WmsDispatch>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetIngresosWMSDet"), $"?TransaccionId={TransaccionId}"));
        }
        public async Task<RetData<IEnumerable<Racks>>> GetRacks(int BodegaId, int RegimenId) {
            return await GetAsync<RetData<IEnumerable<Racks>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetRacks"), $"?BodegaId={BodegaId}&RegimenId={RegimenId}"));
        }
        public async Task<RetData<string>> GetNotificaciones(string CodUser) {
            return await GetAsync<RetData<string>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetNotificaciones"), $"?CodUser={CodUser}"));
        }
        public async Task<RetData<IEnumerable<PaylessProdPrioriDet>>> GetPaylessGetAllProducts(int ClienteId) {
            return await GetAsync<RetData<IEnumerable<PaylessProdPrioriDet>>>(CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture, "Data/GetPaylessGetAllProducts"), $"?ClienteId={ClienteId}"));
        }
        /////////////////////////////////////////
        //public async Task<List<UsersModel>> GetUsers()
        //{
        //    var requestUrl = CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture,
        //        "User/GetAllUsers"));
        //    return await GetAsync<List<UsersModel>>(requestUrl);
        //}

        //public async Task<Message<UsersModel>> SaveUser(UsersModel model)
        //{
        //    var requestUrl = CreateRequestUri(string.Format(System.Globalization.CultureInfo.InvariantCulture,
        //        "User/SaveUser"));
        //    return await PostAsync<UsersModel>(requestUrl, model);
        //}
    }
}
