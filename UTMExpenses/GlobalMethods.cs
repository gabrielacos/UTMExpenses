using System;
using System.Data;
using System.Data.SqlClient;

namespace UTMExpenses
{
    public static class GlobalMethods
    {
        // Funcion para Validar el user y password
        public static Boolean ValidateUser(string struser, string strpass)
        {
            // Establecer la informacion de la conexion
            SqlConnection conn_string = new
           SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connctrionstringdbUMTExpenses"].ConnectionString);
            // Establecer el comando de SQL que se va a ejecutar
            SqlCommand sql_comm = new SqlCommand("SELECT count(UTM_USERID) FROM UTM.UTMUser where UTM_USERNAME = @usuario and UTM_USERPASS = @contrasena ; ",
            conn_string);
            // Asignar valor a los parametros
            sql_comm.Parameters.AddWithValue("@usuario", struser);
            sql_comm.Parameters.AddWithValue("@contrasena", strpass);
            // Abrir la conexion
            conn_string.Open();
            // Ejecutar el comando de SQL y asignar el resultado a una variable Entera 32
            Int32 intUserCount = Convert.ToInt32(sql_comm.ExecuteScalar());
            // Cerrar la conexion
            conn_string.Close();
            //Evaluar si el valor obtenido es mayor de 0 para luego contar 1
            if (intUserCount > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        // Metodo para escribir al log
        public static void WriteLogProc(string strUser, string strEvento, string strTabla, string strForma)
        {
            // Establecer la informacion de la conexion
            SqlConnection conn_string = new
           SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connctrionstringdbUMTExpenses"].ConnectionString);
            SqlCommand sql_comm = new SqlCommand();
            SqlDataReader reader;
            sql_comm.CommandText = "[UTM].[spINSERTLog]";
            sql_comm.CommandType = CommandType.StoredProcedure;
            sql_comm.Connection = conn_string;
            // Asignar valor a los parametros
            sql_comm.Parameters.AddWithValue("@usr", strUser);
            sql_comm.Parameters.AddWithValue("@event", strEvento);
            sql_comm.Parameters.AddWithValue("@table", strTabla);
            sql_comm.Parameters.AddWithValue("@formname", strForma);
            conn_string.Open();
            reader = sql_comm.ExecuteReader();
            conn_string.Close();
        }

        // Funcion para Validar el user y password
        public static Boolean ValidateChild(string EventID)
        {
            // Establecer la informacion de la conexion
            SqlConnection conn_string = new
            SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connctrionstringdbUMTExpenses"].ConnectionString);
            // Establecer el comando de SQL que se va a ejecutar
            SqlCommand sql_comm = new SqlCommand("SELECT count(EventID) FROM UTM.StudentTravelEvents where EventID = @EventID ; ", conn_string);
            // Asignar valor a los parametros
            sql_comm.Parameters.AddWithValue("@EventID", EventID);
            // Abrir la conexion
            conn_string.Open();
            // Ejecutar el comando de SQL y asignar el resultado a una variable Entera 32
            Int32 intChildCount = Convert.ToInt32(sql_comm.ExecuteScalar());
            // Cerrar la conexion
            conn_string.Close();
            //Evaluar si el valor obtenido es mayor de 0 para luego contar 1
            if (intChildCount > 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
    }
}