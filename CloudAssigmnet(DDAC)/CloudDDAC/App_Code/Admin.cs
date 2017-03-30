using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CloudDDAC
{
    public class Admin : Users
    {
        public static String address { get; set; }
        public static String referer { get; set; }

        public static void logout()
        {
            username = String.Empty;
            password = String.Empty;
            address = String.Empty;
            referer = String.Empty;
        }
    }
}