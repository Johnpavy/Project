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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignUpBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Signup.aspx");
        }
        // If login button is clicked, program will go here. This function is not complete
        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            // Store username in a variable to check and see if its available
            string userName = EmailTxtBox.Text;
            string password = PasswordTxtBox.Text;
 
            // Store username in a session variable to track who is using the program
            Session["user"] = userName;
           
            // if user name exists, this will be true
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
                checkCmd.Parameters.AddWithValue("@email", userName);
                ifUserNameExists = (int)checkCmd.ExecuteScalar() > 0;
            }
            // if the username exists in the DB, we now check to see there is a username(email) and password combination that matches
            if (ifUserNameExists)
            {
                // check to see if username and pw combo exists
                using (SqlCommand checkCmd = new SqlCommand("select count(*) from username where email = @email and password = @password", userDb))
                {
                    checkCmd.Parameters.AddWithValue("@email", userName);
                    checkCmd.Parameters.AddWithValue("@password", password);

                    correctPassword = (int)checkCmd.ExecuteScalar() > 0;
                   /* if (correctPassword)
                    {
                        string userID = (string)checkCmd.ExecuteScalar();
                        Session["UserID"] = userID;

                    }*/
                }
                // if both match, on to page 1(or whatever we call it)
                if (correctPassword)
                {
                    //SqlDataSource1.SelectCommand = "SELECT firstname FROM username WHERE email = @email";
                    //SqlDataSource1.SelectParameters.Add("firstname", Convert.ToString(Session["name"]));

                    // menu redirection after login
                    Response.Redirect("/menu.aspx");
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
                loginLabel.Text = "User name not found.";
                loginLabel.Visible = true;
            }

        }
  
        bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }
    }
}