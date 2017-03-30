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
    public partial class DeActivateCustomerProfile : System.Web.UI.Page
    {
        private string conn = ConfigurationManager.ConnectionStrings["Msk2"].ConnectionString;
        SqlConnection con = null;
        SqlCommand cmd = null;
        SqlDataReader dr = null;
        DataTable dt = null;
        SqlDataAdapter da = null;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {  
                fillData();
                save.Visible = false;
                getDetailbyEmail();
            }
        }
        public void getDetailbyEmail()
        {
            string mm = Email.SelectedItem.ToString();
            //declare dataset for retrieving data
            //DataSet ds = new DataSet();
            //manipulate dataset to get values
            try
            {
                using (con = new SqlConnection(conn))
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    string query = "Select * from Customer where usernm=@usernm;";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@usernm", mm);
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        dr.Read();
                        ship.Value = dr[8].ToString();
                        stat.Value = dr[9].ToString();
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
        private void fillData()
        {   //bind data to be loaded only once the page loads
            if (!Page.IsPostBack)
            {
                Email.DataSource = getData();
                Email.DataTextField = "usernm";
                Email.DataBind();
            }
           // DataBind();
        }
        public DataTable getData()
        {
            try
            {
                using (con = new SqlConnection(conn))
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    string query = "select usernm from Customer where status ='ACTIVE' and shipment='NONE'";
                    cmd = new SqlCommand(query, con);
                    da = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    da.Fill(dt);
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
            return dt;
        }


        protected void submit_Click(object sender, EventArgs e)
        {

            string email = Email.SelectedValue;
            using (con = new SqlConnection(conn))
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                try
                {
                    string query = "Update Customer set status='DEACTIVATED' where usernm=@usernm";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@usernm", email);
                    cmd.ExecuteNonQuery();
                    save.Visible = true;
                    con.Close();
                    Response.Redirect("~/Pages/DeActivateCustomerProfile.aspx");
                }
                catch (Exception ex)
                {
                    Response.Write(ex);
                }
            }
        }

        protected void Name_SelectedIndexChanged(object sender, EventArgs e)
        {
            getDetailbyEmail();
        }
    }
}