using System;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectManagement
{
    public partial class Menu : System.Web.UI.Page
    {
        //ArrayList taskdays;
        protected DataSet dsmilestone;

        protected void Page_Load(object sender, EventArgs e)
        {
                // store connection string in userDb
                SqlConnection userDb = new SqlConnection(SqlDataSource1.ConnectionString);
                // open the connection
                userDb.Open();
                // store the user id session variable in id
                string id = (string)Session["UserID"];
                
                SqlCommand getID = new SqlCommand();
                getID.CommandText = "SELECT firstname FROM username WHERE userid = @id";
                getID.Parameters.AddWithValue("@id", id);
                getID.Connection = userDb;
                SqlDataReader read = getID.ExecuteReader();
                read.Read();
                string firstname = read.GetString(0);
                // on page load if not a page refresh, get todays date and call fill events
                if (!IsPostBack)
                {
                    Calendar1.VisibleDate = DateTime.Today;
                    FillEvents();
                }
                // close db connection
                userDb.Close();
        }
        // Most of calendar day highlighting code was taken from msdn and modified to suit our purposes
        
        protected void FillEvents()
        {
            DateTime firstDate = new DateTime(Calendar1.VisibleDate.Year, Calendar1.VisibleDate.Month, 1);
            DateTime lastDate = GetFirstDateOfNextMonth();
            dsmilestone = GetCurrentMonthData(firstDate, lastDate);
        }

        protected DateTime GetFirstDateOfNextMonth()
        {
            int monthNumber, yearNumber;
            if (Calendar1.VisibleDate.Month == 12)
            {
                monthNumber = 1;
                yearNumber = Calendar1.VisibleDate.Year + 1;
            }
            else
            {
                monthNumber = Calendar1.VisibleDate.Month + 1;
                yearNumber = Calendar1.VisibleDate.Year;
            }
            DateTime lastDate = new DateTime(yearNumber, monthNumber, 1);
            return lastDate;
        }

        protected DataSet GetCurrentMonthData(DateTime firstDate, DateTime lastDate)
        {
            int intID;
            string id = (string)Session["UserID"];
            int.TryParse(id, out intID);
            DataSet dsMonth = new DataSet();
            SqlConnection userDb = new SqlConnection(SqlDataSource1.ConnectionString);
            String connString = userDb.ConnectionString;
            SqlConnection dbConnection = new SqlConnection(connString);
            String query;
            query = "SELECT milestone.duedate FROM milestone INNER JOIN projects ON milestone.projectid = projects.projectid WHERE userid = @userid UNION SELECT duedate FROM projects WHERE userid = @userid";
            SqlCommand dbCommand = new SqlCommand(query, dbConnection);
            dbCommand.Parameters.Add(new SqlParameter("@firstDate", firstDate));
            dbCommand.Parameters.Add(new SqlParameter("@lastDate", lastDate));
            dbCommand.Parameters.Add(new SqlParameter("@userid", intID));

            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(dbCommand);
            try
            {
                sqlDataAdapter.Fill(dsMonth);
            }
            catch { }
            return dsMonth;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

            FillEvents();
            taskTxt.Text = ""; //clear task textbox
                               //if day is a task day, pull its data
                               // store connection string in userDb
            int intID;
            
            DateTime selectedDate = Calendar1.SelectedDate;
            SqlConnection userDb = new SqlConnection(SqlDataSource1.ConnectionString);
            // open the connection
            userDb.Open();

            string id = (string)Session["UserID"];
            int.TryParse(id, out intID);
            SqlCommand getProjectInfo = new SqlCommand();
            
            getProjectInfo.CommandText = "SELECT description FROM projects WHERE userid = @id AND duedate = @selectedDate UNION SELECT milestone.description FROM milestone INNER JOIN projects ON milestone.projectid = projects.projectid WHERE userid = @id AND milestone.duedate = @selectedDate";
            getProjectInfo.Parameters.AddWithValue("@id", id);
            getProjectInfo.Parameters.AddWithValue("@selectedDate", selectedDate);
            getProjectInfo.Connection = userDb;
            SqlDataReader read = getProjectInfo.ExecuteReader();
            // if anything is read from database, put the text in the textbox
            if(read.Read())
            {
               // read.Read();
                
                    string projecttext = read.GetString(0);

                    taskTxt.Text = projecttext;
                

            }
            else
            {
                taskTxt.Text = "Nothing due on day selected";
            }
            
            userDb.Close();
        }

        //should be called when the calendar is created, dates should be rendered
        //as calandar is created
        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {

            DateTime nextDate;
            if (dsmilestone != null)
            {
                foreach (DataRow dr in dsmilestone.Tables[0].Rows)
                {
                    nextDate = (DateTime)dr["duedate"];
                    if (nextDate == e.Day.Date)
                    {
                        e.Cell.BackColor = System.Drawing.Color.IndianRed;
                    }
                }
            }

        }

        protected void Calendar1_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
        {
            FillEvents();
        }

    }
}