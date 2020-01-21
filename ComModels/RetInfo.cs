﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ComModels
{
    public class RetInfo
    {
        public int CodError { get; set; } = 0;
        public string Mensaje { get; set; } = string.Empty;
        public double ResponseTimeSeconds { get; set; } = 0;
    }
}
