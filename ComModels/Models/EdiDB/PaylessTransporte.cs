﻿using System;
using System.Collections.Generic;

namespace ComModels.Models.EdiDB
{
    public partial class PaylessTransporte
    {
        public int Id { get; set; }
        public string Transporte { get; set; }
        public int? ClienteId { get; set; }
    }
}
