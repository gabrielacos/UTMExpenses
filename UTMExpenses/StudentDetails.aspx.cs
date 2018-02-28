using System;
using System.Web.UI.WebControls;

namespace UTMExpenses
{
    public partial class StudentDetails : System.Web.UI.Page
    {
        //Declarar variables para la Vitacora
        public string strEvento;

        public string strTabla = "Events";
        public string strForma = "EventDetails";
        public string struser;
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
            {
                if (Session["ssMessage"] != null)
                {
                    lblMessage.Text = Session["ssMessage"].ToString();
                    Session["ssMessage"] = null;
                }
            }
        }

        protected void dvStudentsDetails_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
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

        protected void dvStudentsDetails_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            StrssMessage = "Item Deleted Successfully";
            StrssCSS = "alert-success";
            //Asignar valor a las parametros del metodo WriteLogProc
            strEvento = "ItemDeleted";
            WriteLognRedirect();
        }

        protected void dvStudentsDetails_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            // Variable to accumulate the errors before displaying them
            string strMensajeError = "";
            e.Cancel = false;
            // Takes the TextBox value and assign it to local variable
            TextBox strMCode = (TextBox)dvStudentsDetails.FindControl("txtStudentID");
            TextBox strMName = (TextBox)dvStudentsDetails.FindControl("txtFName");
            TextBox strDOB = (TextBox)dvStudentsDetails.FindControl("txtDOB");
            TextBox strCountry = (TextBox)dvStudentsDetails.FindControl("txtCountry");
            TextBox strState = (TextBox)dvStudentsDetails.FindControl("txtState");
            TextBox strCity = (TextBox)dvStudentsDetails.FindControl("txtCity");
            TextBox strAddrLin = (TextBox)dvStudentsDetails.FindControl("txtAddressLine");
            TextBox strCelular = (TextBox)dvStudentsDetails.FindControl("txtCelular");
            TextBox strZcode = (TextBox)dvStudentsDetails.FindControl("txtZipcode");
            TextBox strLName = (TextBox)dvStudentsDetails.FindControl("txtLName");
            TextBox strEmail = (TextBox)dvStudentsDetails.FindControl("txtEmail");

            // Validate before insert
            //Validate - Missing StudentID
            if (strMCode.Text == null || strMCode.Text == "")
            {
                strMensajeError += "Missing StudentID.";
                e.Cancel = true;
            }
            if (strMName.Text == null || strMName.Text == "")
            {
                strMensajeError += "Missing First Name.";
                e.Cancel = true;
            }
            if (strLName.Text == null || strLName.Text == "")
            {
                strMensajeError += "Missing Last Name.";
                e.Cancel = true;
            }
            if (strDOB.Text == null || strDOB.Text == "")
            {
                strMensajeError += "Missing Date of Birth (MM-DD-YYYY).";
                e.Cancel = true;
            }
            if (strCountry.Text == null || strCountry.Text == "")
            {
                strMensajeError += "Missing Country.";
                e.Cancel = true;
            }
            if (strState.Text == null || strState.Text == "")
            {
                strMensajeError += "Missing State.";
                e.Cancel = true;
            }
            if (strCity.Text == null || strCity.Text == "")
            {
                strMensajeError += "Missing City.";
                e.Cancel = true;
            }
            if (strAddrLin.Text == null || strAddrLin.Text == "")
            {
                strMensajeError += "Missing Adress Line 1.";
                e.Cancel = true;
            }
            if (strCelular.Text == null || strCelular.Text == "")
            {
                strMensajeError += "Missing Celular.";
                e.Cancel = true;
            }
            if (strZcode.Text == null || strZcode.Text == "")
            {
                strMensajeError += "Missing Zip Code.";
                e.Cancel = true;
            }
            if (strEmail.Text == null || strEmail.Text == "")
            {
                strMensajeError += "Missing Email Address.";
                e.Cancel = true;
            }

            // Validate -Sudent ID length
            //if (strMCode.Text.Length != 5)
            //{
            //    strMensajeError += "StudentID shoud be 5 characters long Example:10001 ";
            //    e.Cancel = true;
            //}
            // Validate -Sudent ID length
            if (strEmail.Text.Length < 8)

            {
                strMensajeError += "Enter a valid Email Address";
                e.Cancel = true;
            }
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
                e.Values["Total_Amount_Received"] = 0;
            }
        }

        protected void dvStudentsDetails_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            string strMensajeError = null;

            TextBox strMName = (TextBox)dvStudentsDetails.FindControl("txtFName");
            TextBox strDOB = (TextBox)dvStudentsDetails.FindControl("txtDOB");
            TextBox strCountry = (TextBox)dvStudentsDetails.FindControl("txtCountry");
            TextBox strState = (TextBox)dvStudentsDetails.FindControl("txtState");
            TextBox strCity = (TextBox)dvStudentsDetails.FindControl("txtCity");
            TextBox strAddrLin = (TextBox)dvStudentsDetails.FindControl("txtAddressLine");
            TextBox strCelular = (TextBox)dvStudentsDetails.FindControl("txtCelular");
            TextBox strZcode = (TextBox)dvStudentsDetails.FindControl("txtZipcode");
            TextBox strLName = (TextBox)dvStudentsDetails.FindControl("txtLname");
            TextBox strEmail = (TextBox)dvStudentsDetails.FindControl("txtEmail");
            TextBox strSID = (TextBox)dvStudentsDetails.FindControl("txtSID");

            // Validate before insert
            //Validate - Missing StudentID

            if (strMName.Text == null || strMName.Text == "")
            {
                strMensajeError += "Missing First Name.";
                e.Cancel = true;
            }
            if (strLName.Text == null || strLName.Text == "")
            {
                strMensajeError += "Missing Last Name.";
                e.Cancel = true;
            }
            if (strDOB.Text == null || strDOB.Text == "")
            {
                strMensajeError += "Missing Date of Birth (MM-DD-YYYY).";
                e.Cancel = true;
            }
            if (strCountry.Text == null || strCountry.Text == "")
            {
                strMensajeError += "Missing Country.";
                e.Cancel = true;
            }
            if (strState.Text == null || strState.Text == "")
            {
                strMensajeError += "Missing State.";
                e.Cancel = true;
            }
            if (strCity.Text == null || strCity.Text == "")
            {
                strMensajeError += "Missing City.";
                e.Cancel = true;
            }
            if (strAddrLin.Text == null || strAddrLin.Text == "")
            {
                strMensajeError += "Missing Adress Line 1.";
                e.Cancel = true;
            }
            if (strCelular.Text == null || strCelular.Text == "")
            {
                strMensajeError += "Missing Celular.";
                e.Cancel = true;
            }
            if (strZcode.Text == null || strZcode.Text == "")
            {
                strMensajeError += "Missing Zip Code.";
                e.Cancel = true;
            }
            //if (strEmail.Text == null || strEmail.Text == "")
            //{
            //    strMensajeError += "Missing Email Address.";
            //    e.Cancel = true;
            //}

            //// Validate -Sudent Email
            //if (strEmail.Text.Length != 8)

            //{
            //    strMensajeError += "Enter a valid Email Address";
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
        }

        protected void dvStudentsDetails_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            StrssMessage = "Item Updated Successfully";
            StrssCSS = "alert-success";
            //Asignar valor a las parametros del metodo WriteLogProc
            strEvento = "ItemUpdated";
            WriteLognRedirect();
        }

        protected void dvStudentsDetails_PreRender(object sender, EventArgs e)
        {
            if (IsPostBack == true)
            {
                lblMessage.Text = StrssMessage;
            }
        }

        protected void dvStudentsDetails_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
            {
                Session["ssMessage"] = StrssMessage;
                Response.Redirect("Event.aspx");
            }
        }

        protected void dvStudentsDetails_DataBound(object sender, EventArgs e)
        {
            //Funcion para llenar los textboxes que no pueden ser llenados por el usuario!
            DateTime date = DateTime.Now;
            string ssUserName = Session["ssUsr"].ToString();
            //Assign default value
            if (dvStudentsDetails.CurrentMode == DetailsViewMode.Insert)
            {
                ((TextBox)dvStudentsDetails.FindControl("txtCreationdate")).Text = date.ToString();
                ((TextBox)dvStudentsDetails.FindControl("txtcreatedby")).Text = ssUserName.ToString();
                ((TextBox)dvStudentsDetails.FindControl("txtUpdatedby")).Text = ssUserName.ToString();
                ((TextBox)dvStudentsDetails.FindControl("txtUpdatedate")).Text = date.ToString();
            }
            if (dvStudentsDetails.CurrentMode == DetailsViewMode.Edit)
            {
                ((TextBox)dvStudentsDetails.FindControl("txtUpdatedby")).Text = ssUserName.ToString();
                ((TextBox)dvStudentsDetails.FindControl("txtUpdatedate")).Text = date.ToString();
            }
        }

        //Write to the Log Table and Redirect
        private void WriteLognRedirect()
        {
            int struser = 1;

            // Ejecutar el metodo WriteLogProc que ejecuta el Stored Procedure [Store].[spINSERTLog]
            UTMExpenses.GlobalMethods.WriteLogProc(struser, strEvento, strTabla, strForma);
            //user autenticated - redirect to default page
            Response.Redirect("Students.aspx");
        }

        //subrutina para crear el mensaje de error formato JAVASCRIPT
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
                    dvStudentsDetails.ChangeMode(DetailsViewMode.Insert);
                }
                else if (actionID == "u")
                {
                    lblTitle.Text = "Update Event";
                    lblInstructions.Text = "Edit the appropiate fields, then press Updated To return to the  Event list Press Cancel";

                    dvStudentsDetails.ChangeMode(DetailsViewMode.Edit);
                }
                else if (actionID == "d")
                {
                    lblTitle.Text = "Delete Event";
                    lblInstructions.Text = "Record to be deleted. Are you sure you want to delete this record? Press Delete to eliminate this record or Cancel to return to the Event list";

                    dvStudentsDetails.ChangeMode(DetailsViewMode.ReadOnly);
                }
                else if (actionID == "r")
                {
                    dvStudentsDetails.ChangeMode(DetailsViewMode.ReadOnly);
                }
            }
            else
            {
                Session["ssMessage"] = "Invalid action";
            }
        }

        protected void dvStudentsDetails_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            StrssMessage = "Item Inserted Successfully";
            StrssCSS = "alert-success";
            //Asignar valor a las parametros del metodo WriteLogProc
            strEvento = "ItemInserted";
            WriteLognRedirect();
        }
    }
}