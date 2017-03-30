using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CloudDDAC.Pages
{
    public partial class SetupCosting : System.Web.UI.Page
    {
        private string conn = ConfigurationManager.ConnectionStrings["Msk2"].ConnectionString;
        SqlConnection con = null;
        SqlCommand cmd = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            save.Visible = false;
            lbcost.Visible = false;
            lbship.Visible = false;
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string shipp = ship.Value;
            string costt = cost.Value;
            using (con = new SqlConnection(conn))
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                try
                {
                    if (shipp.Equals("") | shipp.Equals(null)|cost.Equals("") | cost.Equals(null))
                    {
                        lbship.Visible = true;
                        lbcost.Visible = true;
                    }
                    else
                    {
                            string query = "insert into CostingTable(Ship_Type,Cost) values (@type,@cst)";
                            cmd = new SqlCommand(query, con);
                            cmd.Parameters.AddWithValue("@type", shipp);
                            cmd.Parameters.AddWithValue("@cst", costt);
                            cmd.ExecuteNonQuery();
                            save.Visible = true;
                            con.Close();
                            Response.Redirect("SetupCosting.aspx");
                    }
                    
                }
                catch (Exception ex)
                {
                    Response.Write(ex);
                }
            }
        }
    }
}