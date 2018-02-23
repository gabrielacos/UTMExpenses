using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UTMExpenses
{
    public partial class TravelEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void gvStudentEvents_PreRender(object sender, EventArgs e)
        {
            lblTotal.Text = gvStudentEvents.Rows.Count.ToString();
        }

        protected void gvStudentEvents_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Assign value to a session variable from the selected row on the GridView
            Session["ssStudentTravelEvents"] = gvStudentEvents.SelectedValue;
            // Redirect to open the ProductDetails page
            Response.Redirect("StudentTravelEventsDetails.aspx");
        }
    }
}