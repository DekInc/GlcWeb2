﻿using System;
using System.Collections.Generic;

namespace ComModels.Models.EdiDB
{
    public partial class LearHlsl856
    {
        public string HierarchicalIdNumber { get; set; }
        public string HierarchicalLevelCode { get; set; }
        public string EdiStr { get; set; }
        public string HashId { get; set; }
        public string ParentHashId { get; set; }
    }
}
