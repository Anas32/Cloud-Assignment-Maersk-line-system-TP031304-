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
    public partial class Manshipment : System.Web.UI.Page
    {
        private string conn = ConfigurationManager.ConnectionStrings["Msk2"].ConnectionString;
        SqlConnection con = null;
        SqlCommand cmd = null;
        SqlCommand cmd2 = null;
        SqlCommand cmd3 = null;
        SqlDataReader dr = null;
        DataTable dt = null;
        SqlDataAdapter da = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            fillData();
            getDetailbyPID();
            //clcAmt();
            if (!IsPostBack)
            {
                save.Visible = false;
                pcx.Visible = false;
                num.Value = random();
            }

        }
        private string random()
        {
            var alphaNumeric = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var codeArray = new char[7];
            var random = new Random();
            for (int i = 0; i < codeArray.Length; i++)
            {
                codeArray[i] = alphaNumeric[random.Next(alphaNumeric.Length)];
            }
            string verificationCode = new String(codeArray);
            return verificationCode;
        }
        private void fillData()
        {   //bind data to be loaded only once the page loads
            if (!Page.IsPostBack)
            {
                ddl.DataSource = getData();
                ddl.DataTextField = "pID";
                ddl.DataBind();
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
                    string query = "select pID from Orders where stat='NEW' ";
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
        public void getDetailbyPID()
        {
            string idxx = ddl.SelectedValue.ToString();
            try
            {
                using (con = new SqlConnection(conn))
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    //create new command
                    string query = "Select * from Orders where pID=@pid";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@pid", idxx);
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        //Set Design Mode State values
                        dr.Read();
                        email.Value = dr[2].ToString();
                        wgt.Value = dr[3].ToString();
                        fon.Value = dr[4].ToString();
                        pval.Value = dr[5].ToString();
                        long weght = long.Parse(wgt.Value);
                        long pcc = weght * 200;
                        price.Value = pcc.ToString();
                        clcAmt();
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

        private void clcAmt()
        {
            long val = 0;
            long val2 = 0;
            string g = email.Value.ToString();
            try
            {
                using (con = new SqlConnection(conn))
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    string query2 = "Select * from Customer where usernm=@us";
                    cmd = new SqlCommand(query2, con);
                    cmd.Parameters.AddWithValue("@us", g);
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        dr.Read();
                        vvv.Value = dr[7].ToString();
                        val = long.Parse(dr[7].ToString());
                        val2 = long.Parse(price.Value);
                        vv.Value = (val - val2).ToString();
                        dr.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
        private bool payment()
        {
            bool exist = true;
            string uname = email.Value;
            double val = 0;
            double val2 = 0;

            try
            {
                using (con = new SqlConnection(conn))
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    //get value frm customer db
                    string query = "Select * from Customer where usernm=@us";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@us", uname);
                    dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        dr.Read();
                        val = double.Parse(dr[7].ToString());
                        val2 = double.Parse(price.Value);
                        vv.Value = (val - val2).ToString();
                        if ((val - val2) > 0)
                        {
                            dr.Dispose();
                            exist = true;
                        }
                        else if ((val - val2) < 0)
                        {
                            exist = false;
                        }
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
            //set stat as ongoing
            //calculate the price based on price per metric ton
            //get amt from customer n subtract
            string id = ddl.SelectedValue;
            string mel = email.Value;
            string wggt = wgt.Value;
            string foni = fon.Value;
            string val = pval.Value;
            string snum = num.Value;
            string prc = price.Value;
            string ttp = vvv.Value;
            string xp = vv.Value;
            if (payment() == false)
            {
                pcx.Visible = true;
            }
            else
            {
                pcx.Visible = false;
                using (con = new SqlConnection(conn))
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    try
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('The shipment has been sent to Maersk and cannot be MODIFIED!!!');</script>");
                        string query = "insert into Shipment(PackageID,email,weght,phone,value,number,Price) values (@id,@mel,@wgt,@fon,@val,@num,@prc)";
                        cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Parameters.AddWithValue("@mel", mel);
                        cmd.Parameters.AddWithValue("@wgt", wggt);
                        cmd.Parameters.AddWithValue("@fon", foni);
                        cmd.Parameters.AddWithValue("@val", val);
                        cmd.Parameters.AddWithValue("@num", snum);
                        cmd.Parameters.AddWithValue("@prc", prc);
                        cmd.ExecuteNonQuery();

                        string query2 = "Update Customer set topup=@tp where usernm=@usnm";
                        cmd2 = new SqlCommand(query2, con);
                        cmd2.Parameters.AddWithValue("@tp", xp);
                        cmd2.Parameters.AddWithValue("@usnm", mel);
                        cmd2.ExecuteNonQuery();

                        string query3 = "Update Orders set stat=@ss where pID=@pid";
                        cmd3 = new SqlCommand(query3, con);
                        cmd3.Parameters.AddWithValue("@ss", "OUT");
                        cmd3.Parameters.AddWithValue("@pid", id);
                        cmd3.ExecuteNonQuery();

                        save.Visible = true;
                        Response.Redirect("ManShipment.aspx");
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex);
                    }
                }
            }

        }

        protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            getDetailbyPID();
        }

    }
}

