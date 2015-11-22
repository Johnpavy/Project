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

            //get days to populate on calendar. store in array

            

            //taskdays = new ArrayList();
            //System.DateTime day;
            ////query days
            //SqlCommand getDays = new SqlCommand();
            //getDays.CommandText = "SELECT duedate FROM milestone INNER JOIN task ON task.milestoneid = milestone.milestoneid";
            //getDays.Connection = userDb;
            ////taskdays.Add(day);

            if (!IsPostBack)
            {
                Calendar1.VisibleDate = DateTime.Today;
                FillEvents();
            }

            //taskTxt.Text = dsmilestone.ToString();

            userDb.Close();
        }

        protected void FillEvents()
        {
            DateTime firstDate = new DateTime(Calendar1.VisibleDate.Year, Calendar1.VisibleDate.Month, 1);
            DateTime lastDate = GetFirstDateOfNextMonth();
            dsmilestone = GetCurrentMonthData(firstDate,lastDate);
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
            DataSet dsMonth = new DataSet();
            SqlConnection userDb = new SqlConnection(SqlDataSource1.ConnectionString);
            String connString = userDb.ConnectionString;
            SqlConnection dbConnection = new SqlConnection(connString);
            String query;

            //query = "SELECT duedate FROM milestone INNER JOIN task ON task.milestoneid = milestone.milestoneid WHERE duedate >= @firstDate AND duedate < @lastDate";
            query = "SELECT duedate FROM projects WHERE duedate >= @firstDate AND duedate < @lastDate";
            
           /* query = "SELECT HolidayDate FROM Holidays " + _
        " WHERE HolidayDate >= @firstDate AND HolidayDate < @lastDate";*/
            SqlCommand dbCommand = new SqlCommand(query, dbConnection);
            dbCommand.Parameters.Add(new SqlParameter("@firstDate",
                firstDate));
            dbCommand.Parameters.Add(new SqlParameter("@lastDate", lastDate));

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
            
            //display the data with hyperlink to the project
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
                        e.Cell.BackColor = System.Drawing.Color.Crimson;
                    }
                }
            }

            //if the date is in the arraylist of task days
            //if (taskdays.Contains(e.Day.Date))
            //{
            //    //set color
            //    //e.Cell.BackColor = System.Drawing.Color.Aquamarine;
            //}
        }

        protected void Calendar1_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
        {
            FillEvents();
        }

    }
}