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
            // If signup button is clicked, these are all hidden
            EmailLbl.Visible = false;
            EmailTxtBox.Visible = false;
            PasswordLbl.Visible = false;
            PasswordTxtBox.Visible = false;
            NewEmailTxtBox.Visible = true;
            SignupEmailLbl.Visible = true;
            NewPassTxtBox.Visible = true;
            NewPasswordLbl.Visible = true;
            FNameLbl.Visible = true;
            FNameTxtBox.Visible = true;
            LNameTxtbox.Visible = true;
            LastNameLbl.Visible = true;
            ConfirmPWLbl.Visible = true;
            ConfirmPassTxtBox.Visible = true;
            RegisterBtn.Visible = true;
            LoginBtn.Visible = false;
            SignUpBtn.Visible = false;
        }
        // If login button is clicked, program will go here. This function is not complete
        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            // Store username in a variable to check and see if its available
            string userName = EmailTxtBox.Text;
            string password = PasswordTxtBox.Text;
            // Store username in a session variable to track who is using the program
            Session["UserName"] = userName;
            // if user name exists, this will be true
            bool ifUserNameExists;
            // if password is correct this will be true (not setup yet)
            bool correctPassword;
            // store connection string in userDb
            SqlConnection userDb = new SqlConnection(SqlDataSource1.ConnectionString);
            // open the connection
            userDb.Open();
            // this function is to check and see if the username exists in database. If the scalar value returns >0, ifUserNameExists is set to true
            using (SqlCommand checkCmd = new SqlCommand("select count(*) from username where email = @email", userDb))
            {
                checkCmd.Parameters.AddWithValue("@email", userName);
                ifUserNameExists = (int)checkCmd.ExecuteScalar() > 0;
            }
            // if the username exists in the DB, we now check to see there is a username(email) and password combination that matches
            if (ifUserNameExists)
            {
                using (SqlCommand checkCmd = new SqlCommand("select count(*) from username where email = @email and password = @password", userDb))
                {
                    checkCmd.Parameters.AddWithValue("@email", userName);
                    checkCmd.Parameters.AddWithValue("@password", password);

                    correctPassword = (int)checkCmd.ExecuteScalar() > 0;
                }

                if (correctPassword)
                {
                    Response.Redirect("/page1.aspx");
                }
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
        // if register button is clicked, program goes here
        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            // Variable to store username and boolean to store whether or not user name exists
            string userName = NewEmailTxtBox.Text;
            bool ifUserNameExists;
            // store connection string in userDb
            SqlConnection userDb = new SqlConnection(SqlDataSource1.ConnectionString);
            // Open database connection
            userDb.Open();
            // this function is to check and see if the username exists in database. If the scalar value returns >0, ifUserNameExists is set to true
            using (SqlCommand checkCmd = new SqlCommand("select count(*) from username where email = @email", userDb))
            {
                checkCmd.Parameters.AddWithValue("@email", userName);
                ifUserNameExists = (int)checkCmd.ExecuteScalar() > 0;
            }
            // if the user name exists, if the user name is blank, or if the email isn't valid, program will enter this if statement
            if (ifUserNameExists || userName == "" || !IsValidEmail(userName))
            {
                //error box set to red and displays message
                error1.ForeColor = System.Drawing.Color.Red;
                error1.Text = "Sorry, that user name is already taken, or you left the field blank.";
                error1.Visible = true;
                // Close database
                userDb.Close();
                // checks email to see if valid. Function is at bottom of code. The function is called again to diplay an additional message if the email isn't valid. 
                if (!IsValidEmail(userName))
                {
                    error2.ForeColor = System.Drawing.Color.Red;
                    error2.Text = "Invalid email address.";
                    error2.Visible = true;
                }
            }
            else
            {

                // Try to add values to sql table  
                
                try
                {
                    SqlDataSource1.InsertParameters["email"].DefaultValue = NewEmailTxtBox.Text;
                    SqlDataSource1.InsertParameters["firstname"].DefaultValue = FNameTxtBox.Text;
                    SqlDataSource1.InsertParameters["lastname"].DefaultValue = LNameTxtbox.Text;
                    SqlDataSource1.InsertParameters["password"].DefaultValue = NewPassTxtBox.Text;

                    SqlDataSource1.Insert();
                    

                    error1.ForeColor = System.Drawing.Color.Black;
                    error1.Text = "User name is accepted!, Account created.";
                    error1.Visible = true;

                    // Response.Redirect("/page2.aspx");
                }
                catch
                {

                    error1.ForeColor = System.Drawing.Color.Red;
                    error1.Text = "Error writing into the database";
                    error1.Visible = true;

                }
                finally
                {
                    userDb.Close();
                }

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