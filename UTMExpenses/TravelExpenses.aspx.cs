using System;

namespace UTMExpenses
{
    public partial class TravelExpenses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Display Error Message when the user is not logged in
            if (Session["ssUsr"] == null)
            {
                Session["ssMessage"] = " Authorized users only; Please login";
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnRegisterStudent_Click(object sender, EventArgs e)
        {
            Session.Remove("ssTraveExpenses");
            Response.Redirect("TravelExpenseDetails.aspx");
        }
    }
}