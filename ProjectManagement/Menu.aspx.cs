using System;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectManagement
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                //SqlDataSource1.SelectCommand = "SELECT firstname FROM username WHERE email = @email";
               // SqlDataSource1.SelectParameters.Add("firstname", Convert.ToString(Session["name"]));

                //string query = "SELECT firstname FROM username WHERE email = @email";
                //Present greeting on login page
                //greeting.Text = "Welcome back, " + (string)Session["user"];
                greeting.Text = "Welcome back, " + Session["UserID"];
        }
    }
}