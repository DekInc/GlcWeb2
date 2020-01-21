﻿using System;
using System.Collections.Generic;

namespace ComModels.Models.EdiDB
{
    public partial class ProductoUbicacion
    {
        public int Id { get; set; }
        public int? Typ { get; set; }
        public string CodProducto { get; set; }
        public string NomBodega { get; set; }
        public int? Rack { get; set; }
        public string NombreRack { get; set; }
        public string Departamento { get; set; }
        public string CodUser { get; set; }
    }
}
