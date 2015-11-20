using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace teamproj
{
    public partial class calander : System.Web.UI.Page
    {
        ArrayList taskdays;

        protected void Page_Load(object sender, EventArgs e)
        {
            //get days to populate on calendar. store in array
            taskdays = new ArrayList();
            System.DateTime day;
            //query days
            //taskdays.Add(day);
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            //if day is a task day, pull its data
            //display the data with hyperlink to the project
        }

        //should be called when the calendar is created, dates should be rendered
        //as calandar is created
        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            //if the date is in the arraylist of task days
            if (taskdays.Contains(e.Day.Date))
            {
                //set color
                //e.Cell.BackColor = System.Drawing.Color.Aquamarine;
            }
        }


    }
}