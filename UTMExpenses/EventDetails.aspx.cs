using System;
using System.Web.UI.WebControls;

namespace UTMExpenses
{
    public partial class EventDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Display Error Message when the user is not logged in
            if (Session["ssUsr"] == null)
            {
                Session["ssMessage"] = " Authorized users only; Please login";
                Response.Redirect("Default.aspx");
            }

            if (Session["ssEventID"] == null)
            {
                dvEventDetails.DefaultMode = DetailsViewMode.Insert;
            }
            else
            {
                dvEventDetails.DefaultMode = DetailsViewMode.ReadOnly;
            }
        }

        protected void dvEventsDetails_PreRender(object sender, EventArgs e)
        {
        }
    }
}