﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace EdiApi
{
    public partial class CLD856 : EdiBase
    {
        public const string Init = "CLD";
        public const string Self = "Customer's Load Detail";
        [StringLength(maximumLength: 2, MinimumLength = 1)]
        public string NumberOfCustomerLoads { get; set; }        
        [StringLength(maximumLength: 30, MinimumLength = 1)]
        public string UnitsShipped { get; set; }        
        [StringLength(maximumLength: 6, MinimumLength = 3)]
        public string PackagingCode { get; set; }        
        public CLD856(string _SegmentTerminator) : base(_SegmentTerminator)
        {
            Orden = new string[]{
                "Init",
                "NumberOfCustomerLoads", "UnitsShipped",
                "PackagingCode"
            };
        }
    }
}
