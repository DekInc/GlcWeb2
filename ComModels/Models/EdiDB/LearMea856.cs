﻿using System;
using System.Collections.Generic;

namespace ComModels.Models.EdiDB
{
    public partial class LearMea856
    {
        public string MeasurementReferenceIdCode { get; set; }
        public string MeasurementDimensionQualifier { get; set; }
        public string MeasurementValue { get; set; }
        public string UnitOfMeasure { get; set; }
        public string EdiStr { get; set; }
        public string HashId { get; set; }
        public string ParentHashId { get; set; }
    }
}
