﻿using System;
using System.Collections.Generic;

namespace ComModels.Models.WmsDB
{
    public partial class MetodoDescargo
    {
        public MetodoDescargo()
        {
            Producto = new HashSet<Producto>();
        }

        public int Descargoid { get; set; }
        public string Dscdescargo { get; set; }

        public ICollection<Producto> Producto { get; set; }
    }
}
