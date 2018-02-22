using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UTMExpenses
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Function to validate username/password combination
        public static Boolean ValidateUser(string struser, string strpass)
        {
            // Establish connection information
            SqlConnection conn_string = new
           SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connctrionstringdbUMTExpenses"].ConnectionString);
            // Establish SQL command
            SqlCommand sql_comm = new SqlCommand("SELECT count(UTM_USERID) FROM UTM.UTMUser where UTM_USERNAME = @usuario and UTM_USERPASS = @contrasena ; ", conn_string);
            // Provide Parameter values
            sql_comm.Parameters.AddWithValue("@usuario", struser);
            sql_comm.Parameters.AddWithValue("@contrasena", strpass);
            // Open the connection
            conn_string.Open();
            // Execute the SQL command and assign the resulting value to an integer variable
            Int32 intUserCount = Convert.ToInt32(sql_comm.ExecuteScalar());
            // Close the connection
            conn_string.Close();
            //Evaluate the integer variable content; greater than cero is a valid combination
            if (intUserCount > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Declare and assing values to the authentication variables
            string struser = txtUser.Text;
            string strpass = txtPass.Text;
            if (ValidateUser(struser, strpass) == true)
            {
                //Keep information for the session
                Session["ssUsr"] = struser;
                //user autenticated - redirect to default page
                Response.Redirect("Default.aspx");
            }
            else
            {
                // Autentication error
                // Show message using Javascript
                MsgWindow("ERROR - Invalid autentication information");
            }
        }

        //method to display error message box using JAVASCRIPT
        private void MsgWindow(string sMessage)
        {
            string msg;
            msg = "<script language='javascript'>";
            msg += "alert('" + sMessage + "');";
            msg += "<" + "/script>";
            Response.Write(msg);
        }
    }
}