﻿using System;
using System.Collections.Generic;

namespace ComModels.Models.WmsDB
{
    public partial class DtllReceivexItemInventario
    {
        public int DtllReceivexItemInventarioId { get; set; }
        public int? TransaccionId { get; set; }
        public int? DtllReceiveId { get; set; }
        public int? ItemInventarioId { get; set; }
    }
}
