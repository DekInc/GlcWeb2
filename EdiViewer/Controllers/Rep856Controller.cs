﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic.Core;
using System.Threading.Tasks;
using ComModels;
using Microsoft.AspNetCore.Mvc;

namespace EdiViewer.Controllers
{
    public class Rep856Controller : PreRunController
    {
        public IActionResult Index()
        {
            return View();
        }
        public async Task<IActionResult> SendForm()
        {
            try
            {
                List<string[]> ListSelected = new List<string[]>();
                Microsoft.AspNetCore.Http.IFormCollection formCollection = HttpContext.Request.Form;
                foreach (string FormPara in formCollection.Keys)
                    if (FormPara.StartsWith("chkS"))
                        ListSelected.Add(FormPara.Replace("chkS", "").Split('|'));
                if (ListSelected.Count > 0)
                {
                    IEnumerable<string> ListDispatch = ListSelected.Select(O1 => O1.Fod()).Distinct();
                    string Idusr = HttpContext.Session.GetObjSession<string>("Session.CodUsr");
                    string s1 = await ApiClientFactory.Instance.SendForm856(ListDispatch, Idusr);
                    return Json(new { data = s1 });
                }
            }
            catch (Exception e3)
            {
                return Json(new { data = e3.ToString() });
            }            
            return Json(new { data = "" });
        }
        public IActionResult GetGridData(string cbTo = "", bool chkEnviados = false, string dtp1 = "", string TxtDespachoId = "") {
            try
            {
                if (cbTo == "null") cbTo = string.Empty;
                if (dtp1 == "null") dtp1 = string.Empty;
                if (TxtDespachoId == "null") TxtDespachoId = string.Empty;
                //var dict = Request.Form.ToDictionary(x => x.Key, x => x.Value.ToString());
                var draw = HttpContext.Request.Form["draw"].Fod();
                // Skiping number of Rows count  
                var start = Request.Form["start"].Fod();
                // Paging Length 10,20  
                var length = Request.Form["length"].Fod();
                // Sort Column Name  
                var sortColumn = Request.Form["columns[" + Request.Form["order[0][column]"].Fod() + "][name]"].Fod();
                // Sort Column Direction ( asc ,desc)  
                var sortColumnDirection = Request.Form["order[0][dir]"].Fod();
                // Search Value from (Search box)  
                var searchValue = Request.Form["search[value]"].Fod();

                //Paging Size (10,20,50,100)  
                int pageSize = length != null ? Convert.ToInt32(length) : 0;
                int skip = start != null ? Convert.ToInt32(start) : 0;
                int recordsTotal = 0;

                // Getting all Customer data  
                IEnumerable<TsqlDespachosWmsComplex> TsqlDespachosWmsComplexO;                
                if ((sortColumn == "despachoId" && sortColumnDirection == "desc")
                    || HttpContext.Session.GetObjSession<bool>("chkEnviados") != chkEnviados
                    || !HttpContext.Session.ExistsObjSession<bool>("chkEnviados"))
                {
                    HttpContext.Session.SetObjSession("chkEnviados", chkEnviados);
                    TsqlDespachosWmsComplexO = ApiClientFactory.Instance.GetSN(chkEnviados).Result;
                    HttpContext.Session.SetObjSession("TsqlDespachosWmsComplexO", TsqlDespachosWmsComplexO);
                }
                else
                {
                    TsqlDespachosWmsComplexO = HttpContext.Session.GetObjSession<IEnumerable<TsqlDespachosWmsComplex>>("TsqlDespachosWmsComplexO");
                }
                IEnumerable<string> ListTo = (from D in TsqlDespachosWmsComplexO
                                                  orderby D.CodProducto
                                                  select D.CodProducto).Distinct();
                if (TsqlDespachosWmsComplexO.Count() == 1)
                {
                    if (TsqlDespachosWmsComplexO.Fod().DespachoId == 0)
                    {
                        if (string.IsNullOrEmpty(TsqlDespachosWmsComplexO.Fod().ErrorMessage))
                        {
                            return Json(new { draw = 0, recordsFiltered = 0, recordsTotal = 0, TsqlDespachosWmsComplexO.Fod().ErrorMessage, ListTo });
                        }
                    }
                }
                //Search                
                if (!string.IsNullOrEmpty(cbTo))
                {
                    TsqlDespachosWmsComplexO = TsqlDespachosWmsComplexO.Where(Co => Co.CodProducto == cbTo);
                }
                if (!string.IsNullOrEmpty(dtp1)) {
                    DateTime Dtp1 = dtp1.ToDateEsp();
                    TsqlDespachosWmsComplexO = TsqlDespachosWmsComplexO.Where(Co => Co.FechaSalida == Dtp1);
                }
                if (!string.IsNullOrEmpty(TxtDespachoId))
                {
                    int DespachoId = Convert.ToInt32(TxtDespachoId);
                    TsqlDespachosWmsComplexO = TsqlDespachosWmsComplexO.Where(Co => Co.DespachoId == DespachoId);
                }
                if (!(string.IsNullOrEmpty(sortColumn) && string.IsNullOrEmpty(sortColumnDirection)))
                {
                    TsqlDespachosWmsComplexO = TsqlDespachosWmsComplexO.AsQueryable().OrderBy(sortColumn + " " + sortColumnDirection);
                }
                //total number of rows count
                recordsTotal = TsqlDespachosWmsComplexO.Count();
                //Paging
                TsqlDespachosWmsComplexO = TsqlDespachosWmsComplexO.Skip(skip).Take(pageSize);
                //Returning Json Data
                return Json(new { draw, recordsFiltered = recordsTotal, recordsTotal, data = TsqlDespachosWmsComplexO, errorMessage = "", ListTo });
            }
            catch (Exception e1)
            {
                return Json(new { draw = 0, recordsFiltered = 0, recordsTotal = 0, errorMessage = e1.ToString(), ListTo = "" });
            }
        }
    }
}