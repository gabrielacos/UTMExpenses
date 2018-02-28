using System;
using System.Web.UI.WebControls;

namespace UTMExpenses
{
    public partial class TravelExpenseDetails : System.Web.UI.Page
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

        protected void dvTravelExpenseDetails_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
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

        protected void dvTravelExpenseDetails_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            StrssMessage = "Item Deleted Successfully";
            StrssCSS = "alert-success";
            //Asignar valor a las parametros del metodo WriteLogProc
            strEvento = "ItemDeleted";
            WriteLognRedirect();
        }

        protected void dvTravelExpenseDetails_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            StrssMessage = "Item Inserted Successfully";
            StrssCSS = "alert-success";
            //Asignar valor a las parametros del metodo WriteLogProc
            strEvento = "ItemInserted";
            WriteLognRedirect();
        }

        protected void dvTravelExpenseDetails_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            // Variable to accumulate the errors before displaying them
            string strMensajeError = "";
            e.Cancel = false;
            // Takes the TextBox value and assign it to local variable
            //TextBox strMCode = (TextBox)dvEventDetails.FindControl("txtEventID");
            DropDownList strEname = (DropDownList)dvTravelExpenseDetails.FindControl("ddlEventID");
            DropDownList strSname = (DropDownList)dvTravelExpenseDetails.FindControl("ddlStudentID");

            // Validate before insert
            // Validate - Missing Medicine code
            //if (strMCode.Text == null || strMCode.Text == "")
            //{
            //    strMensajeError += "Missing Medicine Code.";
            //    e.Cancel = true;
            //}
            if (strSname.Text == null || strSname.Text == "" || strSname.Text == "0000")
            {
                strMensajeError += "Missing Event Name.";
                e.Cancel = true;
            }

            if (strEname.Text == null || strEname.Text == "" || strEname.Text == "0000")
            {
                strMensajeError += "Missing Event Name.";
                e.Cancel = true;
            }

            //// Validate - Medicine code length
            //if (strMCode.Text.Length != 5)
            //{
            //    strMensajeError += "Medicine Code shoud be 5 characters long";
            //    e.Cancel = true;
            //}
            // Validate - Medicine code length
            //string StartDate = strSDate.ToString();
            //string EndDate = strEDate.ToString();

            //DateTime parsedDate = DateTime.Parse(StartDate);
            //DateTime parsedDate1 = DateTime.Parse(StartDate);
            //if
            //{
            //    strMensajeError += "Medicine Code shoud be 5 characters long";
            //    e.Cancel = true;
            //}
            // If prevoius validation throws an error, return the error
            if (e.Cancel == true)
            {
                lblMessage.Text = "Insert Error! <br />" +
strMensajeError.ToString() + "</div>";
                StrssMessage = "Insert Error! <br />" +
                strMensajeError.ToString() + "</div>";
            }
            else
            {
                // Assign values to columns before table insert considering
                // this data will NOT be available to input on the detail form
                // Record Status is A for new records
                e.Values["RECORD_STATUS"] = "A";
                e.Values["Expense_Status"] = "P";
            }
        }

        protected void dvTravelExpenseDetails_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            StrssMessage = "Item Updated Successfully";
            StrssCSS = "alert-success";
            //Asignar valor a las parametros del metodo WriteLogProc
            strEvento = "ItemUpdated";
            WriteLognRedirect();
        }

        protected void dvTravelExpenseDetails_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
        }

        protected void dvTravelExpenseDetails_PreRender(object sender, EventArgs e)
        {
            if (IsPostBack == true)
            {
                lblMessage.Text = StrssMessage;
            }
        }

        protected void dvTravelExpenseDetails_DataBound(object sender, EventArgs e)
        {
            //Funcion para llenar los textboxes que no pueden ser llenados por el usuario!
            DateTime date = DateTime.Now;
            string ssUserName = Session["ssUsr"].ToString();
            //Assign default value
            if (dvTravelExpenseDetails.CurrentMode == DetailsViewMode.Insert)
            {
                ((TextBox)dvTravelExpenseDetails.FindControl("txtcreationdate")).Text = date.ToString();
                ((TextBox)dvTravelExpenseDetails.FindControl("txtcreatedby")).Text = ssUserName.ToString();
                ((TextBox)dvTravelExpenseDetails.FindControl("txtUpdatedby")).Text = ssUserName.ToString();
                ((TextBox)dvTravelExpenseDetails.FindControl("txtUpdatedate")).Text = date.ToString();
            }
            if (dvTravelExpenseDetails.CurrentMode == DetailsViewMode.Edit)
            {
                ((TextBox)dvTravelExpenseDetails.FindControl("txtUpdatedby")).Text = ssUserName.ToString();
                ((TextBox)dvTravelExpenseDetails.FindControl("txtUpdatedate")).Text = date.ToString();
            }
        }

        private void WriteLognRedirect()
        {
            //    // Ejecutar el metodo WriteLogProc que ejecuta el Stored Procedure [UTM].[spINSERTLog]
            UTMExpenses.GlobalMethods.WriteLogProc(struser, strEvento, strTabla, strForma);
            //    //user autenticated - redirect to default page
            Response.Redirect("TravelExpenses.aspx");
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
            Label lblTitleInstructions = Master.FindControl("lblTitle") as Label;

            string valuefromParameter = string.Empty;
            // Evauates the action intended for this form
            if (!String.IsNullOrEmpty(actionID))
            {
                if (actionID == "c")
                {
                    lblTitle.Text = "Add New Event";
                    lblTitleInstructions.Text = "Fill all the required fields, then press Insert. To return to the Eventt list Press Cancel";
                    dvTravelExpenseDetails.ChangeMode(DetailsViewMode.Insert);
                }
                else if (actionID == "u")
                {
                    lblTitle.Text = "Update Event";
                    lblTitleInstructions.Text = "Edit the appropiate fields, then press Updated To return to the  Event list Press Cancel";

                    dvTravelExpenseDetails.ChangeMode(DetailsViewMode.Edit);
                }
                else if (actionID == "d")
                {
                    lblTitle.Text = "Delete Event";
                    lblTitleInstructions.Text = "Record to be deleted. Are you sure you want to delete this record? Press Delete to eliminate this record or Cancel to return to the Event list";

                    dvTravelExpenseDetails.ChangeMode(DetailsViewMode.ReadOnly);
                }
                else if (actionID == "r")
                {
                    dvTravelExpenseDetails.ChangeMode(DetailsViewMode.ReadOnly);
                }
            }
            else
            {
                Session["ssMessage"] = "Invalid action";
            }
        }

        protected void dvTravelExpenseDetails_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
            {
                Session["ssMessage"] = StrssMessage;
                Response.Redirect("Event.aspx");
            }
        }
    }
}