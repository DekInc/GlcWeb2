﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ComModels
{
    public static class ApplicationSettings
    {
        public static string ApiUri { get; set; }
        public const string DateTimeFormatT = "dd/MM/yyyy HH:mm";
        public const string DateTimeFormat = "dd/MM/yyyy";
        public static bool English = false;
    }
}
