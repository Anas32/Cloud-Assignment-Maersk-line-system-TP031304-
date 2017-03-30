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
    public partial class CreateSchedule : System.Web.UI.Page
    {
        private string conn = ConfigurationManager.ConnectionStrings["Msk2"].ConnectionString;
        SqlConnection con = null;
        SqlCommand cmd = null;
        SqlDataReader dr = null;
        DataTable dt = null;
        SqlDataAdapter da = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            fillData();
            if (!IsPostBack)
            {
                save.Visible = false;
                lp.Visible = false;
                
            }
        }

        private void fillData()
        {   //bind data to be loaded only once the page loads
            if (!Page.IsPostBack)
            {
                shippid.DataSource = getData();
                shippid.DataTextField = "id";
                shippid.DataBind();
            }
            DataBind();
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
                    string query = "select id from Fleet";
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

        private bool idExist(string idx)
        {
            bool exist = true;
            try
            {
                using (con = new SqlConnection(conn))
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    string query = "Select shipid from Schedule where shipid=@id";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", idx);
                    dr = cmd.ExecuteReader();

                    if (dr.HasRows)
                    {
                        dr.Read();
                        dr.Dispose();
                        exist = true;
                    }
                    else
                    {
                        exist = false;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
            return exist;
        }
        protected void submit_Click(object sender, EventArgs e)
        {
            string id = shippid.SelectedItem.Text;
            string rgst = dp.SelectedItem.Text;
            string mx = arrP.SelectedItem.Text;
            string trp = loc.Value;
            if (idExist(id) == true)
            {
                lp.Visible = true;
            }
            else
            {
                using (con = new SqlConnection(conn))
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    try
                    {
                        string query = "insert into Schedule(Departure_point,Arrival_point,shipid,tripname) values (@id,@rgst,@mx,@trip)";
                        cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@id", rgst);
                        cmd.Parameters.AddWithValue("@rgst", mx);
                        cmd.Parameters.AddWithValue("@mx", id);
                        cmd.Parameters.AddWithValue("@trip", trp);
                        cmd.ExecuteNonQuery();
                        save.Visible = true;
                        Response.Redirect("ManageSchedule.aspx");

                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex);
                    }
                }
            }
        }
    }
}