﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShippingController_V1._0_.Classes.DisplayEntitys
{
    public class cstHomePageGv
    {
        public int Packed { get; set; }
        public long UserID { get; set; }
        public String UserName { get; set; }
        public String StationName { get; set; }
        public String DeviceID { get; set; }
        public String CurrentPackingShipmentID { get; set; }
        public string Datetime { get; set; }
    }
}