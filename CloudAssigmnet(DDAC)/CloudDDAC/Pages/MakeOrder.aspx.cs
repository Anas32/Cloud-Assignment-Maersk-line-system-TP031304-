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
    public partial class MakeOrder : System.Web.UI.Page
    {
        private string conn = ConfigurationManager.ConnectionStrings["Msk2"].ConnectionString;
        SqlConnection con = null;
        SqlCommand cmd = null;
        SqlCommand cmd2 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            save.Visible = false;
            err.Visible = false;
            idx.Value = random();
            email.Value = Customer.username;
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

        private bool checkNum()
        {
            string wggt = wgt.Value;
            bool isValid = Regex.IsMatch(wggt, @"^[0-9]*$");
            return isValid;
        }
        protected void submit_Click(object sender, EventArgs e)
        {
            string idv = idx.Value;
            string mel = email.Value;
            string wggt = wgt.Value;
            string fn = fon.Value;
            string pv = pval.Value;
            string rut = route.SelectedItem.ToString();
            if (checkNum()==false)
            {
                err.Visible = true;
            }
            else
            {
                err.Visible = false;
                using (con = new SqlConnection(conn))
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    try
                    {
                        string query = "insert into Orders (pID, email, weght, fone, package_Value,routename,stat) values (@id,@mail,@wgt,@fon,@pVal,@tripnm,'NEW')";
                        cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@id", idv);
                        cmd.Parameters.AddWithValue("@mail", mel);
                        cmd.Parameters.AddWithValue("@wgt", wggt);
                        cmd.Parameters.AddWithValue("@fon", fn);
                        cmd.Parameters.AddWithValue("@pVal", pv);
                        cmd.Parameters.AddWithValue("@tripnm", rut);
                        cmd.ExecuteNonQuery();

                        string query2 = "Update  Customer set shipment=@shp where usernm=@id";
                        cmd2 = new SqlCommand(query2, con);
                        cmd2.Parameters.AddWithValue("@shp", "PLACED");
                        cmd2.Parameters.AddWithValue("@id", mel);
                        cmd2.ExecuteNonQuery();
                        save.Visible = true;
                        con.Close();
                   
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