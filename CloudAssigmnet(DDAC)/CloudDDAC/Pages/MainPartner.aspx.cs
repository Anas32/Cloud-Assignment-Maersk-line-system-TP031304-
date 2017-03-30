using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CloudDDAC.Pages
{
    public partial class MainPartner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrackShipmentPart.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manshipment.aspx");
        }

        protected void btnA_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateCustomerProfile.aspx");
        }

        protected void btnB_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeActivateCustomerProfile.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditCustomerProfile.aspx");
        }
    }
}