using System;
using System.Web.UI.WebControls;

namespace UTMExpenses
{
    public partial class TravelExpenseDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ssStudentTravelEvents"] == null)
            {
                dvTravelExpenseDetails.DefaultMode = DetailsViewMode.Insert;
            }
            else
            {
                dvTravelExpenseDetails.DefaultMode = DetailsViewMode.ReadOnly;
            }
            // Display Error Message when the user is not logged in
            if (Session["ssUsr"] == null)
            {
                Session["ssMessage"] = " Authorized users only; Please login";
                Response.Redirect("Default.aspx");
            }
        }
    }
}