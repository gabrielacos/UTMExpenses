using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UTMExpenses
{
    public partial class Event : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void gvEvents_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Assign value to a session variable from the selected row on the GridView
            Session["ssEventID"] = gvEvents.SelectedValue;
            // Redirect to open the ProductDetails page
            Response.Redirect("EventDetails.aspx");
        }

        protected void gvEvents_PreRender(object sender, EventArgs e)
        {
            lblTotal.Text = gvEvents.Rows.Count.ToString();
        }

        protected void btnCreateEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("EventDetails.aspx");
        }
    }
}