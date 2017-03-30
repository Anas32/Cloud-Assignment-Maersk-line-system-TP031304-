using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Sockets;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;


namespace CloudDDAC.Pages
{

    public partial class CreateCustomerProfile : System.Web.UI.Page
    {
        private string conn =ConfigurationManager.ConnectionStrings["Msk2"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetYear();
                GetMonth();
                save.Visible = false;
                vali.Visible = false;
                melchk.Visible = false;
            }
        }
        //Get Months
        #region GetMonth
        protected void GetMonth()
        {
            dropMonth.Items.Clear();
            var dtf = System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat;
            for (int i = 1; i <= 12; i++)
            {
                dropMonth.Items.Add(new ListItem(dtf.GetMonthName(i), i.ToString()));

            }
        }

        #endregion GetMonth
        //Get Years
        #region GetYear
        protected void GetYear()
        {
            dropYear.Items.Clear();
            for (int intYear = DateTime.Now.Year - 22; intYear >= DateTime.Now.Year - 90; intYear--)
            {
                dropYear.Items.Add(intYear.ToString());
            }
        }
        #endregion GetYear
        protected void submit_Click(object sender, EventArgs e)
        {
            string firname = fname.Value;
            string lasname = lname.Value;
            string password = Password.Value;
            string email = Email.Value;
            string dob = txtDate.Text;
            string add = address.Value;
            string fon = phone.Value;
            string gender = dropGender.SelectedValue;
            string topup = "10000";
            string role = "CUSTOMER";
            string ship="NONE";

            using (SqlConnection con = new SqlConnection(conn))
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                try
                {
                    string query = "insert into Customer(usernm, fname, lname, address, phone, gender, DOB,topup,shipment) values (@email, @fname, @lname, @addr, @fon, @gender, @dob, @topup,@ship)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@fname", firname);
                    cmd.Parameters.AddWithValue("@lname", lasname);
                    cmd.Parameters.AddWithValue("@addr", add);
                    cmd.Parameters.AddWithValue("@fon", fon);
                    cmd.Parameters.AddWithValue("@gender", gender);
                    cmd.Parameters.AddWithValue("@dob", dob);
                    cmd.Parameters.AddWithValue("@topup", topup);
                    cmd.Parameters.AddWithValue("@ship", ship);
                    cmd.ExecuteNonQuery();

                    string query2 = "insert into Login(usernm, pass, type) values (@email, @pass, @ty)";
                    SqlCommand cmd2 = new SqlCommand(query2, con);
                    cmd2.Parameters.AddWithValue("@email", email);
                    cmd2.Parameters.AddWithValue("@pass", password);
                    cmd2.Parameters.AddWithValue("@ty", role);
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


        protected void dropYear_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int year = Convert.ToInt16(dropYear.SelectedValue);
            int month = Convert.ToInt16(dropMonth.SelectedValue);
            if (Calendar1.Visible == false)
            {
                Calendar1.Visible = true;
            }
            Calendar1.VisibleDate = new DateTime(year, month, 1);
            Calendar1.SelectedDate = new DateTime(year, month, 1);
        }

        protected void dropMonth_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int year = Convert.ToInt16(dropYear.SelectedValue);
            int month = Convert.ToInt16(dropMonth.SelectedValue);
            if (Calendar1.Visible == false)
            {
                Calendar1.Visible = true;
            }
            Calendar1.VisibleDate = new DateTime(year, month, 1);
            Calendar1.SelectedDate = new DateTime(year, month, 1);
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = Calendar1.SelectedDate.ToString("dd-MM-yyyy");
        }
    }
}