﻿using System;
using System.Collections.Generic;

namespace ComModels.Models.WmsDB
{
    public partial class Grpsystem
    {
        public Grpsystem()
        {
            Usrsystem = new HashSet<Usrsystem>();
        }

        public int Codgrp { get; set; }
        public string Nomgrp { get; set; }

        public ICollection<Usrsystem> Usrsystem { get; set; }
    }
}
