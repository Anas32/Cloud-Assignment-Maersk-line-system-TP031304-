using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CloudDDAC.Pages
{
    public partial class MainCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnA_Click(object sender, EventArgs e)
        {
            Response.Redirect("MakeOrder.aspx");
        }

        protected void btnB_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrackShipment.aspx");
        }
    }
}