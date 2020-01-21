using System;
using System.Collections.Generic;

namespace ComModels.Models.EdiDB
{
    public partial class GetPaylessSellQtysT
    {
        public int Id { get; set; }
        public string Barcode { get; set; }
        public string Categoria { get; set; }
        public string Cp { get; set; }
        public string Producto { get; set; }
        public string Talla { get; set; }
        public string Lote { get; set; }
        public string Departamento { get; set; }
        public int? Typ { get; set; }
        public string CodUser { get; set; }
    }
}
