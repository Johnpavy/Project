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
            // store connection string in userDb
            SqlConnection userDb = new SqlConnection(SqlDataSource1.ConnectionString);
            // open the connection
            userDb.Open();

            string id = (string)Session["UserID"];
            SqlCommand getID = new SqlCommand();
            getID.CommandText = "SELECT firstname FROM username WHERE userid = @id";
            getID.Parameters.AddWithValue("@id", id);
            getID.Connection = userDb;
            SqlDataReader read = getID.ExecuteReader();
            read.Read();
            string firstname = read.GetString(0);
            //Present greeting on login page
            greeting.Text = "Welcome back, " + firstname;
            userDb.Close();
        }
    }
}