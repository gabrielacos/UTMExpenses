using System;
using System.Web.UI.WebControls;

namespace UTMExpenses
{
    public partial class Event : System.Web.UI.Page
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
        }

        private void PageHeadings()
        {
            // Control lblTitleInstruction

            Label lblTitleInstructions = Master.FindControl("lblTitleInstructions") as Label;

            lblTitleInstructions.Text = "<H4>To add a new Event click the 'Register New Event' button.To change the product information, select the edit link on the Eventt line. To delete a Event, select de delete link on the Event line.</ H4 >";
            //Show the message from the sender page
            if (Session["ssMessage"] != null)
            {
                lblMessage.Text = Session["ssMessage"].ToString();
                // lblMessage.Attributes["class"] = Session["ssCCClass"].ToString();
                Session["ssMessage"] = null;
                Session["ssCCClass"] = null;
            }
        }

      

        protected void gvEvents_PreRender(object sender, EventArgs e)
        {
            lblTotal.Text = gvEvents.Rows.Count.ToString();
        }

        protected void btnCreateEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("EventDetails.aspx?ecode=&act=c");
        }
    }
}