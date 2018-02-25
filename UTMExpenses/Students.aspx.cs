using System;

namespace UTMExpenses
{
    public partial class Details : System.Web.UI.Page
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

        protected void gvStudents_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Assign value to a session variable from the selected row on the GridView
            Session["ssStudent"] = gvStudents.SelectedValue;
            // Redirect to open the ProductDetails page
            Response.Redirect("StudentDetails.aspx");
        }

        protected void btnRegisterStudent_Click(object sender, EventArgs e)
        {
            Session.Remove("ssStudent");
            Response.Redirect("StudentDetails.aspx");
        }
    }
}