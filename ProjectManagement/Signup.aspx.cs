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
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        // if register button is clicked, program goes here
        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            // Variable to store username and boolean to store whether or not user name exists
            string userName = NewEmailTxtBox.Text;
            string password = NewPassTxtBox.Text;
            string confirmPW = ConfirmPassTxtBox.Text;
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
            if (ifUserNameExists || userName == "" || !IsValidEmail(userName) || !password.Equals(confirmPW))
            {
                //error box set to red and displays message
                if(ifUserNameExists || userName =="")
                {
                    error1.ForeColor = System.Drawing.Color.Red;
                    error1.Text = "Sorry, that user name is already taken, or you left the field blank.";
                    error1.Visible = true;
                }
                
            
                
                // checks email to see if valid. Function is at bottom of code. The function is called again to diplay an additional message if the email isn't valid. 
                if (!IsValidEmail(userName))
                {
                    error2.ForeColor = System.Drawing.Color.Red;
                    error2.Text = "Invalid email address.";
                    error2.Visible = true;
                }
                if(!password.Equals(confirmPW))
                {
                    loginLabel.ForeColor = System.Drawing.Color.Red;
                    loginLabel.Text = "Passwords don't match";
                    loginLabel.Visible = true;
                }
                userDb.Close();
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
                    SqlDataSource1.InsertParameters["groupid"].DefaultValue = "1";

                    SqlDataSource1.Insert();


                    error1.ForeColor = System.Drawing.Color.Black;
                    error1.Text = "User name is accepted!, Account created.";
                    error1.Visible = true;

                    Response.Redirect("/menu.aspx");
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