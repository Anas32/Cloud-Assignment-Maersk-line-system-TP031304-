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
    public partial class EditCustomerProfile : System.Web.UI.Page
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
                GetMonth();
                GetYear();
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
                        fname.Value = dr[1].ToString();
                        lname.Value = dr[2].ToString();
                        address.Value = dr[3].ToString();
                        phone.Value = dr[4].ToString();
                        txtDate.Text = dr[6].ToString();
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
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

        #region GetYear
        protected void GetYear()
        {
            dropYear.Items.Clear();
            for (int intYear = DateTime.Now.Year; intYear >= DateTime.Now.Year - 40; intYear--)
            {
                dropYear.Items.Add(intYear.ToString());
            }
        }
        #endregion GetYear
        private void fillData()
        {   //bind data to be loaded only once the page loads
            if (!Page.IsPostBack)
            {
                Email.DataSource = getData();
                Email.DataTextField = "usernm";
                Email.DataBind();
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
                    string query = "select usernm from Customer where status ='ACTIVE'";
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
            string firname = fname.Value;
            string lasname = lname.Value;
            string email = Email.SelectedValue;
            string dob = txtDate.Text;
            string add = address.Value;
            string fon = phone.Value;
            using (con = new SqlConnection(conn))
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                try
                {
                    string query = "Update Customer set fname=@fname, lname=@lname, address=@addr, phone=@fon,DOB=@dob where usernm=@usernm";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@usernm", email);
                    cmd.Parameters.AddWithValue("@fname", firname);
                    cmd.Parameters.AddWithValue("@lname", lasname);
                    cmd.Parameters.AddWithValue("@addr", add);
                    cmd.Parameters.AddWithValue("@fon", fon);
                    cmd.Parameters.AddWithValue("@dob", dob);
                    cmd.ExecuteNonQuery();
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

        protected void Name_SelectedIndexChanged(object sender, EventArgs e)
        {
            getDetailbyEmail();
        }
    }
}