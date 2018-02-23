using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UTMExpenses
{
    public partial class EventDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

               
           
        }

        protected void dvEventsDetails_PreRender(object sender, EventArgs e)
        {
            if (Session["ssEventID"] == null)
            {
                dvEventsDetails.DefaultMode = DetailsViewMode.Insert;
            }
            else
            {
                dvEventsDetails.DefaultMode = DetailsViewMode.ReadOnly;
            }

        }
    }
}