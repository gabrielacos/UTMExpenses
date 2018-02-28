using System;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace UTMExpenses
{
    public partial class StudentTravelEventsDetail : System.Web.UI.Page
    {
        //Declarar variables para la Vitacora
        public string strEvento;

        public string strTabla = "Events";
        public string strForma = "EventDetails";
        public int struser;
        public string StrssMessage = "";
        public string StrssCSS = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            //Validate if the user is logged in or not
            ValidateLogin();
            // Verify Action
            VerifyAction();
        }

        private void ValidateLogin()
        {
            // Display Error Message when the user is not logged in
            if (Session["ssUsr"] == null)
            {
                StrssMessage = " Authorized users only; Please login";
                Session["ssMessage"] = StrssMessage;
                Response.Redirect("Default.aspx");
            }
        }

        protected void dlStudentTravelEvents_ItemDeleting(object sender, System.Web.UI.WebControls.DetailsViewDeleteEventArgs e)
        {
            // Verify if the user cancel the Delete Request
            if (Request.Form["confirm_value"] == "No")
            {
                StrssMessage = "Record wont be deleted";
                e.Cancel = true;
                Response.Redirect("Event.aspx");
            }
            //verify if is a parent with child
            string Ecode = Request.QueryString["Ecode"].ToString();
            if (!UTMExpenses.GlobalMethods.ValidateChild(Ecode))
            {
                StrssMessage = "<B>Record wont be deleted. This Event was sold on one or more invoices</ B > ";
                e.Cancel = true;
            }
        }

        protected void dlStudentTravelEvents_ItemDeleted(object sender, System.Web.UI.WebControls.DetailsViewDeletedEventArgs e)
        {
            StrssMessage = "Item Deleted Successfully";
            StrssCSS = "alert-success";
            //Asignar valor a las parametros del metodo WriteLogProc
            strEvento = "ItemDeleted";
            WriteLognRedirect();
        }

        protected void dlStudentTravelEvents_ItemInserting(object sender, System.Web.UI.WebControls.DetailsViewInsertEventArgs e)
        {
            //string strErrorMessage = null;
            //string strCreatedBy;
            //if (e.NewValues[2] == null)
            //{
            //    strErrorMessage += "Quantity on Hand cannot be blank";
            //    e.Cancel = true;
            //}
            //if (e.Cancel == true)
            //{
            //    StrssMessage = "Please verify " + strErrorMessage;
            //}
        }

        protected void dlStudentTravelEvents_ItemUpdating(object sender, System.Web.UI.WebControls.DetailsViewUpdateEventArgs e)
        {
        }

        protected void dlStudentTravelEvents_ItemUpdated(object sender, System.Web.UI.WebControls.DetailsViewUpdatedEventArgs e)
        {
            StrssMessage = "Item Updated Successfully";
            StrssCSS = "alert-success";
            //Asignar valor a las parametros del metodo WriteLogProc
            strEvento = "ItemUpdated";
            WriteLognRedirect();
        }

        protected void dlStudentTravelEvents_PreRender(object sender, EventArgs e)
        {
            if (IsPostBack == true)
            {
                lblMessage.Text = StrssMessage;
            }
        }

        protected void dlStudentTravelEvents_DataBound(object sender, EventArgs e)
        {
            //Funcion para llenar los textboxes que no pueden ser llenados por el usuario!
            DateTime date = DateTime.Now;
            string ssUserName = Session["ssUsr"].ToString();
            //Assign default value
            if (dlStudentTravelEvents.CurrentMode == DetailsViewMode.Insert)
            {
                ((TextBox)dlStudentTravelEvents.FindControl("txtcreationdate")).Text = date.ToString();
                ((TextBox)dlStudentTravelEvents.FindControl("txtcreatedby")).Text = ssUserName.ToString();
                ((TextBox)dlStudentTravelEvents.FindControl("txtUpdatedby")).Text = ssUserName.ToString();
                ((TextBox)dlStudentTravelEvents.FindControl("txtUpdatedate")).Text = date.ToString();
            }
            if (dlStudentTravelEvents.CurrentMode == DetailsViewMode.Edit)
            {
                //((TextBox)dvEventDetails.FindControl("txtUpdatedby")).Text = ssUserName.ToString();
                //((TextBox)dvEventDetails.FindControl("txtUpdatedate")).Text = date.ToString();
            }
        }

        private void WriteLognRedirect()
        {
            //    // Ejecutar el metodo WriteLogProc que ejecuta el Stored Procedure [UTM].[spINSERTLog]
            UTMExpenses.GlobalMethods.WriteLogProc(struser, strEvento, strTabla, strForma);
            //    //user autenticated - redirect to default page
            Response.Redirect("StudentTravelEvents.aspx");
        }

        private void MsgWindow(string sMessage)
        {
            string msg;
            msg = "<script language='javascript'>";
            msg += "alert('" + sMessage + "');";
            msg += "<" + "/script>";
            Response.Write(msg);
        }

        // Verify Action and Fill Headings values
        protected void VerifyAction()
        {
            //Show the message from the sender page
            if (StrssMessage != null)
            {
                lblMessage.Text = StrssMessage;
                lblMessage.Attributes["class"] = StrssCSS;
            }
            //Parameter sent using the QueryString
            string actionID = Request.QueryString["act"];
            string eventcodecode = Request.QueryString["ecode"];
            string studentcodecode = Request.QueryString["scode"];
            // Control lblTitle from the MasterPage
            Label lblTitle = Master.FindControl("lblTitle") as Label;
            string valuefromParameter = string.Empty;
            // Evauates the action intended for this form
            if (!String.IsNullOrEmpty(actionID))
            {
                if (actionID == "c")
                {
                    lblTitle.Text = "Add New Event";
                    lblInstructions.Text = "Fill all the required fields, then press Insert. To return to the Eventt list Press Cancel";
                    dlStudentTravelEvents.ChangeMode(DetailsViewMode.Insert);
                }
                else if (actionID == "u")
                {
                    lblTitle.Text = "Update Event";
                    lblInstructions.Text = "Edit the appropiate fields, then press Updated To return to the  Event list Press Cancel";

                    dlStudentTravelEvents.ChangeMode(DetailsViewMode.Edit);
                }
                else if (actionID == "d")
                {
                    lblTitle.Text = "Delete Event";
                    lblInstructions.Text = "Record to be deleted. Are you sure you want to delete this record? Press Delete to eliminate this record or Cancel to return to the Event list";

                    dlStudentTravelEvents.ChangeMode(DetailsViewMode.ReadOnly);
                }
                else if (actionID == "r")
                {
                    dlStudentTravelEvents.ChangeMode(DetailsViewMode.ReadOnly);
                }
            }
            else
            {
                Session["ssMessage"] = "Invalid action";
            }
        }

        protected void dlStudentTravelEvents_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            StrssMessage = "Item Inserted Successfully";
            StrssCSS = "alert-success";
            //Asignar valor a las parametros del metodo WriteLogProc
            strEvento = "ItemInserted";
            WriteLognRedirect();
        }

        protected void dlStudentTravelEvents_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
            {
                Session["ssMessage"] = StrssMessage;
                Response.Redirect("Event.aspx");
            }
        }
    }
}