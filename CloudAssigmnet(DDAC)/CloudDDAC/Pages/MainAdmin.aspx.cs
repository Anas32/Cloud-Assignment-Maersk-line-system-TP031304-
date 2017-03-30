using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CloudDDAC.Pages
{
    public partial class MainAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageFleet.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageSchedule.aspx");
        }

        protected void btnA_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manshipment.aspx");
        }

        protected void btnB_Click(object sender, EventArgs e)
        {
            Response.Redirect("SetupCosting.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrackShipmentMan.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("UpdateShipmentStatus.aspx");
        }
    }
}