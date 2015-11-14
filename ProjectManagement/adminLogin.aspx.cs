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
            using (SqlCommand checkCmd = new SqlCommand("select count(*) from username where email = @email and groupid = @groupid", userDb))
            {
                checkCmd.Parameters.AddWithValue("@email", adminUser);
                checkCmd.Parameters.AddWithValue("@groupid", "0");
                ifUserNameExists = (int)checkCmd.ExecuteScalar() > 0;
            }

            if (ifUserNameExists)
            {
                // check to see if username and pw combo exists
                using (SqlCommand checkCmd = new SqlCommand("select count(*) from username where email = @email and password = @password" , userDb))
                {
                    checkCmd.Parameters.AddWithValue("@email", adminUser);
                    checkCmd.Parameters.AddWithValue("@password", password);

                    correctPassword = (int)checkCmd.ExecuteScalar() > 0;
                }
                // if both match, on to page 1(or whatever we call it)
                if (correctPassword)
                {
                    // I put admin login as a placeholder for now

                    Response.Redirect("/AdminPage.aspx");
                }
                // we already confirmed that a username exists at this point so now we know that the password doesn't match
                else
                {
                    loginLabel.ForeColor = System.Drawing.Color.Red;
                    loginLabel.Text = "Incorrect password.";
                    loginLabel.Visible = true;
                }

            }
            // if the username doesnt exists, this code executes
            else
            {
                loginLabel.ForeColor = System.Drawing.Color.Red;
                loginLabel.Text = "Admin user name not found.";
                loginLabel.Visible = true;
            }

        
        }
    }
}