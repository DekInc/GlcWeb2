﻿using System;
using System.Collections.Generic;

namespace ComModels.Models.EdiDB
{
    public partial class PaylessEncuestaResM
    {
        public int Id { get; set; }
        public string TiendaId { get; set; }
        public string Pedido { get; set; }
        public string Sdr { get; set; }
        public string CodUser { get; set; }
        public string FechaCreacion { get; set; }
        public int? Typ { get; set; }
        public string Nombre { get; set; }
        public int? ClienteId { get; set; }
    }
}
