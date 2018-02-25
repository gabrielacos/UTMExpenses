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
            //else
            //{
            //    //Display Username and Logout link
            //    HyperLink lkLogin = Master.FindControl("lkLogin") as HyperLink;
            //    HyperLink lkLogout = Master.FindControl("lkLogout") as HyperLink;
            //    lkLogin.Text = "Hi " + Session["ssUsr"] + "!";
            //    lkLogin.NavigateUrl = "";
            //    lkLogout.Text = "Logout";
            //    lkLogout.NavigateUrl = "~/Logout.aspx";
            //}
        }

        private void PageHeadings()
        {
            // Control lblTitleInstruction

            Label lblTitleInstructions = Master.FindControl("lblTitleInstructions") as Label;

            lblTitleInstructions.Text = "<H4>To add a new Event click the 'Create New Event' button.To change the product information, select the edit link on the Event line. To delete a Event, select de delete link on the Event line.</ H4 >";
            //Show the message from the sender page
            if (Session["ssMessage"] != null)
            {
                lblMessage.Text = Session["ssMessage"].ToString();
                // lblMessage.Attributes["class"] = Session["ssCCClass"].ToString();
                Session["ssMessage"] = null;
                Session["ssCCClass"] = null;
            }
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
            Session.Remove("ssTraveExpenses");
            Response.Redirect("EventDetails.aspx?pcode=&act=c");
        }
    }
}