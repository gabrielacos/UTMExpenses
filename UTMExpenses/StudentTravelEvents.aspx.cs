using System;

namespace UTMExpenses
{
    public partial class TravelEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ////// Display Error Message when the user is not logged in
            ////if (Session["ssUsr"] == null)
            ////{
            ////    Session["ssMessage"] = " Authorized users only; Please login";
            ////    Response.Redirect("Default.aspx");
            ////}
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

        protected void btnStudentTravelEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentTravelEventsDetail.aspx?ecode=&act=c");
        }
    }
}