using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CloudDDAC.Pages
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Admin.logout();
            Customer.logout();
            Partner.logout();
            Response.Redirect("~/Pages/LoginMain.aspx");
        }
    }
}