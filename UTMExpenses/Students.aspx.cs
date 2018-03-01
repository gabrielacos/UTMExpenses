using System;
using System.Web.UI.WebControls;

namespace UTMExpenses
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Validate if the user is logged in or not
            ValidateLogin();
            // Display Page Headings
            PageHeadings();
        }

        private void ValidateLogin()
        {
            // Display Error Message when the user is not logged in
            if (Session["ssUsr"] == null)
            {
                Session["ssMessage"] = " Authorized users only; Please login";
                Response.Redirect("Default.aspx");
            }
            {
                if (Session["ssMessage"] != null)
                {
                    lblMessage.Text = Session["ssMessage"].ToString();
                    Session["ssMessage"] = null;
                }
            }
        }

        private void PageHeadings()
        {
            // Control lblTitleInstruction
            Label lblTitleInstructions = Master.FindControl("lblTitleInstructions") as Label;
            lblTitleInstructions.Text = "<H4>To add a new Event click the 'Create New Event' button.To change the product information, select the edit link on the Student line. To delete a Student, select de delete link on the Student line.</ H4 >";
            //Show the message from the sender page
            if (Session["ssMessage"] != null)
            {
                lblMessage.Text = Session["ssMessage"].ToString();
                // lblMessage.Attributes["class"] = Session["ssCCClass"].ToString();
                Session["ssMessage"] = null;
                Session["ssCCClass"] = null;
            }
        }

        protected void btnRegisterStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentDetails.aspx?ecode=&act=c");
        }

        protected void btnInformeEstudiante_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentAlphabetical.aspx");
        }
    }
}