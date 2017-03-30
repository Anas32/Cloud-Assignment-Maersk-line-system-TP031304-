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
    public partial class ManageFleet : System.Web.UI.Page
    {
        private string conn = ConfigurationManager.ConnectionStrings["Msk2"].ConnectionString;
        SqlConnection con = null;
        SqlCommand cmd = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            nmlb.Visible = false;
            numlb.Visible = false;
            mxlb.Visible = false;
            save.Visible = false;
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string nm = name.Value;
            string rgst = register.Value;
            string mx = max.Value;
            using (con = new SqlConnection(conn))
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                try
                {
                    if (nm.Equals("") | nm.Equals(null) | rgst.Equals("") | rgst.Equals(null) | mx.Equals("") | mx.Equals(null))
                    {
                        nmlb.Visible = true;
                        numlb.Visible = true;
                        mxlb.Visible = true;
                    }
                    else
                    {
                        string query = "insert into Fleet(name, registration_num,maximum_capacity,typ) values (@nm,@num,@mx,@ty)";
                        cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@nm", nm);
                        cmd.Parameters.AddWithValue("@num", rgst);
                        cmd.Parameters.AddWithValue("@mx", mx);
                        cmd.Parameters.AddWithValue("@ty",tyyp.SelectedValue);
                        cmd.ExecuteNonQuery();
                        save.Visible = true;
                        con.Close();
                        Response.Redirect("ManageFleet.aspx");
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