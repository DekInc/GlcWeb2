﻿using System;
using System.Collections.Generic;

namespace ComModels.Models.EdiDB
{
    public partial class PaylessReportes
    {
        public int Id { get; set; }
        public string Periodo { get; set; }
        public string PeriodoF { get; set; }
        public string FechaGen { get; set; }
        public string Tipo { get; set; }
        public bool? MailEnviado { get; set; }
        public int? ClienteId { get; set; }
    }
}
