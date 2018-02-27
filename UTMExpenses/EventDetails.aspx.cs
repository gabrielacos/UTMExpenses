﻿using System;
using System.Web.UI.WebControls;

namespace UTMExpenses
{
    public partial class EventDetails : System.Web.UI.Page
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

        protected void dvEventDetails_ItemDeleting(object sender, DetailsViewDeleteEventArgs e)
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

        protected void dvEventDetails_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            StrssMessage = "Item Deleted Successfully";
            StrssCSS = "alert-success";
            //Asignar valor a las parametros del metodo WriteLogProc
            strEvento = "ItemDeleted";
            WriteLognRedirect();
        }

        protected void dvEventDetails_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            //StrssMessage = "Item Inserted Successfully";
            //StrssCSS = "alert-success";
            ////Asignar valor a las parametros del metodo WriteLogProc
            //strEvento = "ItemInserted";
            //WriteLognRedirect();
        }

        //Validacion para TextBox
        protected void dvEventDetails_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            string strErrorMessage = null;
            string strCreatedBy;
            if (e.NewValues[2] == null)
            {
                strErrorMessage += "Quantity on Hand cannot be blank";
                e.Cancel = true;
            }
            ////else
            ////{
            ////    try
            ////    {
            ////        strCreatedBy = Double.Parse(((TextBox)dvEventDetails.FindControl("txtcreatedby")).Text);
            ////    }
            ////    catch
            ////    {
            ////        strErrorMessage += "Quantity on Hand not numeric";
            ////        e.Cancel = true;
            ////    }
            ////}
            if (e.Cancel == true)
            {
                StrssMessage = "Please verify " + strErrorMessage;
            }
        }

        protected void dvEventDetails_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            StrssMessage = "Item Updated Successfully";
            StrssCSS = "alert-success";
            //Asignar valor a las parametros del metodo WriteLogProc
            strEvento = "ItemUpdated";
            WriteLognRedirect();
        }

        protected void dvEventDetails_PreRender(object sender, EventArgs e)
        {
            if (IsPostBack == true)
            {
                lblMessage.Text = StrssMessage;
            }
        }

        protected void dvEventDetails_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
            {
                Session["ssMessage"] = StrssMessage;
                Response.Redirect("Event.aspx");
            }
        }

        protected void dvEventDetails_DataBound(object sender, EventArgs e)
        {
            //Funcion para llenar los textboxes que no pueden ser llenados por el usuario!
            DateTime date = DateTime.Now;
            string ssUserName = Session["ssUsr"].ToString();
            //Assign default value
            if (dvEventDetails.CurrentMode == DetailsViewMode.Insert)
            {
                ((TextBox)dvEventDetails.FindControl("txtcreationdate")).Text = date.ToString();
                ((TextBox)dvEventDetails.FindControl("txtcreatedby")).Text = ssUserName.ToString();
                ((TextBox)dvEventDetails.FindControl("txtUpdatedby")).Text = ssUserName.ToString();
                ((TextBox)dvEventDetails.FindControl("txtUpdatedate")).Text = date.ToString();
            }
            if (dvEventDetails.CurrentMode == DetailsViewMode.Edit)
            {
                //((TextBox)dvEventDetails.FindControl("txtUpdatedby")).Text = ssUserName.ToString();
                //((TextBox)dvEventDetails.FindControl("txtUpdatedate")).Text = date.ToString();
            }
        }

        //Write to the Log Table and Redirect
        private void WriteLognRedirect()
        {
            //    // Ejecutar el metodo WriteLogProc que ejecuta el Stored Procedure [UTM].[spINSERTLog]
            UTMExpenses.GlobalMethods.WriteLogProc(struser, strEvento, strTabla, strForma);
            //    //user autenticated - redirect to default page
            Response.Redirect("Event.aspx");
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
                lblMessage.Attributes["cssclass"] = StrssCSS;
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
                    dvEventDetails.ChangeMode(DetailsViewMode.Insert);
                }
                else if (actionID == "u")
                {
                    lblTitle.Text = "Update Event";
                    lblInstructions.Text = "Edit the appropiate fields, then press Updated To return to the  Event list Press Cancel";

                    dvEventDetails.ChangeMode(DetailsViewMode.Edit);
                }
                else if (actionID == "d")
                {
                    lblTitle.Text = "Delete Event";
                    lblInstructions.Text = "Record to be deleted. Are you sure you want to delete this record? Press Delete to eliminate this record or Cancel to return to the Event list";

                    dvEventDetails.ChangeMode(DetailsViewMode.ReadOnly);
                }
                else if (actionID == "r")
                {
                    dvEventDetails.ChangeMode(DetailsViewMode.ReadOnly);
                }
            }
            else
            {
                Session["ssMessage"] = "Invalid action";
            }
        }

        protected void dvEventDetails_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            StrssMessage = "Item Inserted Successfully";
            StrssCSS = "alert-success";
            //Asignar valor a las parametros del metodo WriteLogProc
            strEvento = "ItemInserted";
            WriteLognRedirect();
        }
    }
}