using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CloudDDAC
{
    public class Customer : Users
    {
        public static String fname { get; set; }
        public static String lname { get; set; }
        public static String gender { get; set; }
        public static String dob { get; set; }
        public static String topup { get; set; }
        public static void logout()
        {
            username = String.Empty;
            password = String.Empty;
            gender = String.Empty;
            dob = String.Empty;
            topup = String.Empty;
        }
    }
}