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
    public partial class LoginMain : System.Web.UI.Page
    {
            private string conn = ConfigurationManager.ConnectionStrings["Msk2"].ConnectionString;
            SqlConnection con = null;
            SqlCommand cmd = null;
            SqlDataReader dr = null;
        protected void Page_Load(object sender, EventArgs e)
        {
           checklbl.Visible = false;
        }

        protected void login_Click(object sender, EventArgs e)
        {
                string uname = usr.Value;
                string passw = pass.Value;

        try
        {
            using (con = new SqlConnection(conn))
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                string query = "Select * from Login where usernm=@usr and pass=@ps";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@usr", uname);
                cmd.Parameters.AddWithValue("@ps", passw);
                dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    dr.Read();
                    string role = dr[2].ToString();
                    if (role == "ADMINISTRATOR")
                    {
                        Admin.username = uname;
                            
                        Response.Redirect("~/Pages/MainAdmin.aspx");
                    }
                    else if (role == "AGENT")
                    {
                        Partner.username = uname;
                        Response.Redirect("~/Pages/MainPartner.aspx");
                    }
                    else if (role == "CUSTOMER")
                    {
                        Customer.username = uname;
                        Response.Redirect("~/Pages/MainCustomer.aspx");
                    }
                }
                else
                {
                    checklbl.Visible = true;
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }

        }
    }
}

