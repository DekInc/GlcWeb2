﻿using System;
using System.Collections.Generic;

namespace ComModels.Models.EdiDB
{
    public partial class PaylessProdPrioriM
    {
        public int Id { get; set; }
        public string Periodo { get; set; }
        public int? ClienteId { get; set; }
        public string CodUsr { get; set; }
        public string InsertDate { get; set; }
        public string UpdateDate { get; set; }
    }
}
