﻿using System;
using System.Collections.Generic;

namespace ComModels.Models.EdiDB
{
    public partial class PaylessPeriodoTransporte
    {
        public int Id { get; set; }
        public string Periodo { get; set; }
        public int? IdTransporte { get; set; }
    }
}
