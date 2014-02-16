using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace DatabaseAccess
{
    /// <summary>
    /// Summary description for SqlHelper
    /// </summary>
    public static class SqlHelper
    {
        /// <summary>
        /// ExecuteScalar takes an SqlCommand and will return a single value from the database.
        /// </summary>
        /// <param name="command">The command you are using.</param>
        /// <returns>Value from database</returns>
        public static String ExecuteScalar(SqlCommand command, string connectionString)
        {
            String sReturnVal = "";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                command.Connection = conn;
                try
                {
                    conn.Open();
                    sReturnVal = command.ExecuteScalar().ToString();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
                finally
                {
                    conn.Dispose();
                    conn.Close();
                }
            }

            return sReturnVal;
        }

        /// <summary>
        /// This will execute an SQL command, that does not return a value.
        /// Useful for UPDATE statements, or INSERT.
        /// </summary>
        /// <param name="command">The SQL Command to run.</param>
        public static void ExecuteNonQuery(SqlCommand command, string connectionString)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                command.Connection = conn;
                try
                {
                    conn.Open();
                    command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
                finally
                {
                    conn.Dispose();
                    conn.Close();
                }
            }
        }

        /// <summary>
        /// This will execute an SQL command and return the results as a data table.
        /// Useful when running a SELECT * FROM ...
        /// </summary>
        /// <param name="command">The command to execute</param>
        /// <returns>Results from the database</returns>
        public static DataTable ReturnAsTable(SqlCommand command, string connectionString)
        {
            DataTable results = new DataTable();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                command.Connection = conn;
                try
                {
                    conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(command);
                    da.Fill(results);
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
                finally
                {
                    conn.Dispose();
                    conn.Close();
                }
            }

            return results;
        }
    }
}

