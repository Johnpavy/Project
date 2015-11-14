using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;

namespace ProjectManagement
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AdminLoginButton_Click(object sender, EventArgs e)
        {
            string adminUser = AdminUserName.Text;
            string password = AdminPassword.Text;

            bool ifUserNameExists;
            // if password is correct this will be true (not setup yet)
            bool correctPassword;
            // store connection string in userDb
            SqlConnection userDb = new SqlConnection(SqlDataSource1.ConnectionString);
            // open the connection
            userDb.Open();
            //test
            // this function is to check and see if the username exists in database. If the scalar value returns >0, ifUserNameExists is set to true
            using (SqlCommand checkCmd = new SqlCommand("select count(*) from username where email = @email", userDb))
            {
                checkCmd.Parameters.AddWithValue("@email", adminUser);
                ifUserNameExists = (int)checkCmd.ExecuteScalar() > 0;
            }


            Response.Redirect("AdminPage.aspx");
        }
    }
}