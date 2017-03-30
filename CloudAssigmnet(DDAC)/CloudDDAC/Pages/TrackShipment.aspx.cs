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
    public partial class TrackShipment : System.Web.UI.Page
    {
        private string conn = ConfigurationManager.ConnectionStrings["Msk2"].ConnectionString;
        SqlConnection con = null;
        SqlCommand cmd = null;
        SqlDataReader dr = null;
        DataTable dt = null;
        SqlDataAdapter da = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack){
                fillData();
                getDetailbyPID();
            }
        }
        private void fillData()
        {   //bind data to be loaded only once the page loads
            if (!Page.IsPostBack)
            {
                piD.DataSource = getData();
                piD.DataTextField = "PackageID";
                piD.DataBind();
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
                    string query = "select PackageID from Shipment where email=@ipd ";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@ipd", "yy");
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
        public void getDetailbyPID()
        {
            string idxx = piD.SelectedValue.ToString();
            try
            {
                using (con = new SqlConnection(conn))
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    //create new command
                    string query = "Select * from Shipment where PackageID=@pid";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@pid", idxx);
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        //Set Design Mode State values
                        dr.Read();
                        stat.Value = dr[7].ToString();
                        dr.Close();
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }

        protected void piD_SelectedIndexChanged(object sender, EventArgs e)
        {
            getDetailbyPID();
        }

    }
}