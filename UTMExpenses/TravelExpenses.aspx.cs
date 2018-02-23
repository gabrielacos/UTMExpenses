using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UTMExpenses
{
    public partial class TravelExpenses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegisterStudent_Click(object sender, EventArgs e)
        {
            Session.Remove("ssTraveExpenses");
            Response.Redirect("TravelExpenseDetails.aspx");
        }
    }
}