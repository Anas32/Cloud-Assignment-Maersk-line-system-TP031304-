using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CloudDDAC
{
    public class Partner : Users
    {
        public static String Compname { get; set; }
        public static String address { get; set; }
        public static void logout()
        {
            username = String.Empty;
            password = String.Empty;
            address = String.Empty;
            Compname = String.Empty;
        }
    }
}