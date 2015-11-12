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

           /* error2.Visible = false;
            error1.Visible = false;
            EmailLbl.Visible = true;
            EmailTxtBox.Visible = true;
            PasswordLbl.Visible = true;
            PasswordTxtBox.Visible = true;
            NewEmailTxtBox.Visible = false;
            SignupEmailLbl.Visible = false;
            NewPassTxtBox.Visible = false;
            NewPasswordLbl.Visible = false;
            FNameLbl.Visible = false;
            FNameTxtBox.Visible = false;
            LNameTxtbox.Visible = false;
            LastNameLbl.Visible = false;
            ConfirmPWLbl.Visible = false;
            ConfirmPassTxtBox.Visible = false;
            RegisterBtn.Visible = false;*/
        }

        protected void SignUpBtn_Click(object sender, EventArgs e)
        {
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

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            string userName = EmailTxtBox.Text;
            string password = PasswordTxtBox.Text;
            Session["UserName"] = userName;
            bool ifUserNameExists;
            bool correctPassword;

            SqlConnection userDb = new SqlConnection(SqlDataSource1.ConnectionString);
            userDb.Open();
            using (SqlCommand checkCmd = new SqlCommand("select count(*) from [user] where User_Username = @User_Username", userDb))
            {
                checkCmd.Parameters.AddWithValue("@User_Username", userName);
                ifUserNameExists = (int)checkCmd.ExecuteScalar() > 0;
            }

        }

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            string userName = NewEmailTxtBox.Text;
            string password = NewPassTxtBox.Text;
            string firstName = FNameTxtBox.Text;
            string lastName = LNameTxtbox.Text;
            string confirmPW = ConfirmPassTxtBox.Text;
            Session["UserName"] = userName;
            bool ifUserNameExists;

            SqlConnection userDb = new SqlConnection(SqlDataSource1.ConnectionString);
            userDb.Open();
            using (SqlCommand checkCmd = new SqlCommand("select count(*) from username where email = @email", userDb))
            {
                checkCmd.Parameters.AddWithValue("@email", userName);
                ifUserNameExists = (int)checkCmd.ExecuteScalar() > 0;
            }

            if (ifUserNameExists || userName == "" || !IsValidEmail(userName))
            {

                error1.ForeColor = System.Drawing.Color.Red;
                error1.Text = "Sorry, that user name is already taken, or you left the field blank.";
                error1.Visible = true;
                userDb.Close();
                // checks email to see if valid. Function is at bottom of code
                if (!IsValidEmail(userName))
                {
                    error2.ForeColor = System.Drawing.Color.Red;
                    error2.Text = "Invalid email address.";
                    error2.Visible = true;
                }
            }
            else
            {

                // create sql command instance
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                // create sql command
                cmd.CommandText = "insert into username (email) values (@email)";
                // add values to sql table
                cmd.Parameters.AddWithValue("@email", userName);
                cmd.Connection = userDb;

                // Problem here...Code is going to the catch statement here. 


                try
                {
                    cmd.ExecuteNonQuery();

                    error1.ForeColor = System.Drawing.Color.Black;
                    error1.Text = "User name is accepted!";
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