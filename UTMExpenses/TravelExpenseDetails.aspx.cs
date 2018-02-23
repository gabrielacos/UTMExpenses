using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
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
        }
    }
}