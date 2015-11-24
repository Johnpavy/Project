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
                //greeting.Text = "Welcome back, " + firstname;

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
            // I dont think we will need the next two lines at all but I wanted to save them until i knew for sure - john
            //query = "SELECT duedate FROM milestone INNER JOIN task ON task.milestoneid = milestone.milestoneid WHERE duedate >= @firstDate AND duedate < @lastDate";
            //query = "SELECT duedate FROM projects WHERE duedate >= @firstDate AND duedate < @lastDate AND userid = @userid";

            // this query works and pulls up all of the user's project deadlines but not the milestones. 
            query = "SELECT duedate FROM projects WHERE userid = @userid";
            // this commented out code below is trying to get the milestone due dates
            //query = "SELECT duedate FROM milestone INNER JOIN projects WHERE milestone.projectid = project.projectid";

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
            getProjectInfo.CommandText = "SELECT description FROM projects WHERE userid = @id AND duedate = @selectedDate";
            getProjectInfo.Parameters.AddWithValue("@id", id);
            getProjectInfo.Parameters.AddWithValue("@selectedDate", selectedDate);
            getProjectInfo.Connection = userDb;
            SqlDataReader read = getProjectInfo.ExecuteReader();
            read.Read();
            if(read["description"] != DBNull.Value)
            {
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