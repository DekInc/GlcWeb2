﻿using System;
using System.Collections.Generic;

namespace ComModels.Models.WmsDB
{
    public partial class DtllPedidosxOperario
    {
        public int IddtllPedidoAsigando { get; set; }
        public int? IdpedidoAsigando { get; set; }
        public int? InventarioId { get; set; }
        public int? ItemInventarioId { get; set; }
        public double? Cantidad { get; set; }
        public int? Rack { get; set; }
    }
}
