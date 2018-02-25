using System;

namespace UTMExpenses
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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
                    lblMensaje.Text = Session["ssMessage"].ToString();
                    Session["ssMessage"] = null;
                }
            }
        }
    }
}