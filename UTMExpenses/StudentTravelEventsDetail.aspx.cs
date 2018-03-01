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

        protected void dlStudentTravelEvents_ItemInserting(object sender, System.Web.UI.WebControls.DetailsViewInsertEventArgs e)
        {
            // Variable to accumulate the errors before displaying them
            string strMensajeError = "";
            e.Cancel = false;
            // Takes the TextBox value and assign it to local variable
            //TextBox strMCode = (TextBox)dvEventDetails.FindControl("txtEventID");
            DropDownList strEname = (DropDownList)dvStudentTravelEvent.FindControl("ddlEventID");
            DropDownList strSname = (DropDownList)dvStudentTravelEvent.FindControl("ddlStudentID");
            TextBox strExpenseAmount = (TextBox)dvStudentTravelEvent.FindControl("txtExpenseAmount");
            TextBox strExpenseStatus = (TextBox)dvStudentTravelEvent.FindControl("txtExpenseStatus");

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

            if (strExpenseAmount.Text == null || strExpenseAmount.Text == "")
            {
                strMensajeError += "Missing Expense Amount.";

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
                DateTime date = DateTime.Now;
                string ssUserName = Session["ssUsr"].ToString();
                ((TextBox)dvStudentTravelEvent.FindControl("txtcreationdate")).Text = date.ToString();
                ((TextBox)dvStudentTravelEvent.FindControl("txtcreatedby")).Text = ssUserName.ToString();
                ((TextBox)dvStudentTravelEvent.FindControl("txtUpdatedby")).Text = ssUserName.ToString();
                ((TextBox)dvStudentTravelEvent.FindControl("txtUpdatedate")).Text = date.ToString();

                //// Establecer la informacion de la conexion
                //SqlConnection conn_string = new
                //SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connctrionstringdbUMTExpenses"].ConnectionString);
                //// Establecer el comando de SQL que se va a ejecutar
                //SqlCommand sql_comm = new SqlCommand("UPDATE UTM.Student SET Total_Amount_Received = sum(StudentTravelEvent.ExpenseAmount FROM UTM.Student INNER JOIN UTM.StudentTravelEvent ON UTM.Student.StudentID = UTM.StudentTravelEvent.StudentID WHERE(UTM.Student.StudentID = @StudentID))  ; ", conn_string);
                //// Asignar valor a los parametros
                //sql_comm.Parameters.AddWithValue("@EventID", strSname);
                //// Abrir la conexion
                //conn_string.Open();

                //// Cerrar la conexion
                //conn_string.Close();
            }
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
            Label lblTitleInstructions = Master.FindControl("lblTitle") as Label;
            string valuefromParameter = string.Empty;
            // Evauates the action intended for this form
            if (!String.IsNullOrEmpty(actionID))
            {
                if (actionID == "c")
                {
                    lblTitle.Text = "Add New Event";
                    lblTitleInstructions.Text = "Fill all the required fields, then press Insert. To return to the Eventt list Press Cancel";
                    dvStudentTravelEvent.ChangeMode(DetailsViewMode.Insert);
                }
                else if (actionID == "u")
                {
                    lblTitle.Text = "Update Event";
                    lblTitleInstructions.Text = "Edit the appropiate fields, then press Updated To return to the  Event list Press Cancel";

                    dvStudentTravelEvent.ChangeMode(DetailsViewMode.Edit);
                }
                else if (actionID == "d")
                {
                    lblTitle.Text = "Delete Event";
                    lblTitleInstructions.Text = "Record to be deleted. Are you sure you want to delete this record? Press Delete to eliminate this record or Cancel to return to the Event list";

                    dvStudentTravelEvent.ChangeMode(DetailsViewMode.ReadOnly);
                }
                else if (actionID == "r")
                {
                    dvStudentTravelEvent.ChangeMode(DetailsViewMode.ReadOnly);
                }
            }
            else
            {
                Session["ssMessage"] = "Invalid action";
            }
        }

        protected void dvStudentTravelEvent_DataBound(object sender, EventArgs e)
        {
            {
                //Funcion para llenar los textboxes que no pueden ser llenados por el usuario!
                DateTime date = DateTime.Now;
                string ssUserName = Session["ssUsr"].ToString();
                //Assign default value
                if (dvStudentTravelEvent.CurrentMode == DetailsViewMode.Insert)
                {
                    ((TextBox)dvStudentTravelEvent.FindControl("txtcreationdate")).Text = date.ToString();
                    ((TextBox)dvStudentTravelEvent.FindControl("txtcreatedby")).Text = ssUserName.ToString();
                    ((TextBox)dvStudentTravelEvent.FindControl("txtUpdatedby")).Text = ssUserName.ToString();
                    ((TextBox)dvStudentTravelEvent.FindControl("txtUpdatedate")).Text = date.ToString();
                }
                if (dvStudentTravelEvent.CurrentMode == DetailsViewMode.Edit)
                {
                    ((TextBox)dvStudentTravelEvent.FindControl("txtUpdatedby")).Text = ssUserName.ToString();
                    ((TextBox)dvStudentTravelEvent.FindControl("txtUpdatedate")).Text = date.ToString();
                }
            }
        }

        protected void dvStudentTravelEvent_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            StrssMessage = "Item Deleted Successfully";
            StrssCSS = "alert-success";
            //Asignar valor a las parametros del metodo WriteLogProc
            strEvento = "ItemDeleted";
            WriteLognRedirect();
        }

        protected void dvStudentTravelEvent_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
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
            if (!UTMExpenses.GlobalMethods.ValidateChildEvent(Ecode))
            {
                StrssMessage = "<B>Record wont be deleted. This Event was sold on one or more invoices</ B > ";
                e.Cancel = true;
            }
        }

        protected void dvStudentTravelEvent_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if (e.Exception == null && e.AffectedRows == 1)
            {
                StrssMessage = "Item Inserted Successfully";
                StrssCSS = "alert-success";
                //Asignar valor a las parametros del metodo WriteLogProc
                strEvento = "ItemInserted";
                WriteLognRedirect();
            }
            else if (e.Exception.Message.Contains("Violation of PRIMARY KEY"))
            {
                StrssMessage = "Product Code already exists. Please enter a NEW Product Code " + " </ div > ";
                lblMessage.Text = "Product Code already exists. Please enter a NEWProduct Code " + " </ br > ";
            }
            // Logic comes to this section if an error occurred during the INSERT
            // This IF evaluates the content of the error message to isolate
            // the Foreign key Violation
            else if (e.Exception.Message.Contains("conflicted with the FOREIGN KEY constraint"))
            {
                lblMessage.Text = "Vendor Code not valid. Please enter a VALID Vendor Code " + " </ div > ";
            }
            else
            {
                // Coding to Show the system error to the user
                // e.Exception.Message carries the system error
                // Coding to Show the system error to the user
                // e.Exception.Message carries the system error
                StrssMessage = e.Exception.Message + "</div>";
                lblMessage.Text = e.Exception.Message.ToString();
            }
            // Change the property ExceptionHandled to true
            // This will tell the system that the error was handled and avoid crash
            e.ExceptionHandled = true;
            // Keep the form in InsertMode to let the user continue working with
            // the form and correct the error
            e.KeepInInsertMode = true;
        }

        protected void dvStudentTravelEvent_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            // Variable to accumulate the errors before displaying them
            string strMensajeError = "";
            e.Cancel = false;
            // Takes the TextBox value and assign it to local variable
            //TextBox strMCode = (TextBox)dvEventDetails.FindControl("txtEventID");
            DropDownList strEname = (DropDownList)dvStudentTravelEvent.FindControl("ddlEventID");
            DropDownList strSname = (DropDownList)dvStudentTravelEvent.FindControl("ddlStudentID");
            TextBox strExpenseAmount = (TextBox)dvStudentTravelEvent.FindControl("txtExpenseAmount");
            // TextBox strExpenseStatus = (TextBox)dvStudentTravelEvent.FindControl("txtExpenseStatus");

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

            if (strExpenseAmount.Text == null || strExpenseAmount.Text == "")
            {
                strMensajeError += "Missing Expense Amount.";

                e.Cancel = true;
            }
            //if (strEname.Text == null || strEname.Text == "")
            //{
            //    strMensajeError += "Missing Event Name.";
            //    e.Cancel = true;
            //}

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
                //DateTime date = DateTime.Now;
                //string ssUserName = Session["ssUsr"].ToString();
                //((TextBox)dvStudentTravelEvent.FindControl("txtcreationdate")).Text = date.ToString();
                //((TextBox)dvStudentTravelEvent.FindControl("txtcreatedby")).Text = ssUserName.ToString();
                //((TextBox)dvStudentTravelEvent.FindControl("txtUpdatedby")).Text = ssUserName.ToString();
                //((TextBox)dvStudentTravelEvent.FindControl("txtUpdatedate")).Text = date.ToString();
                //// Establecer la informacion de la conexion
                SqlConnection conn_string = new
                SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connctrionstringdbUMTExpenses"].ConnectionString);
                // Establecer el comando de SQL que se va a ejecutar
                SqlCommand sql_comm = new SqlCommand("Update UTM.Student  Set  Total_Amount_Received = SUM(UTM.StudentTravelEvent.ExpenseAmount) FROM UTM.Student INNER JOIN UTM.StudentTravelEvent ON UTM.Student.StudentID = UTM.StudentTravelEvent.StudentID and(UTM.Student.StudentID = @StudentID)  ; ", conn_string);
                // Asignar valor a los parametros
                sql_comm.Parameters.AddWithValue("@StudentID", strSname);
                // Abrir la conexion

                conn_string.Open();

                // Cerrar la conexion
                conn_string.Close();
            }
        }

        protected void dvStudentTravelEvent_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            StrssMessage = "Item Updated Successfully";
            StrssCSS = "alert-success";
            //Asignar valor a las parametros del metodo WriteLogProc
            strEvento = "ItemUpdated";
            WriteLognRedirect();
        }

        protected void dvStudentTravelEvent_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
            {
                Session["ssMessage"] = StrssMessage;
                Response.Redirect("Event.aspx");
            }
        }
    }
}