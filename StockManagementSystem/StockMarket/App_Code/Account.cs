using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using DatabaseAccess;

/// <summary>
/// Summary description for Account
/// </summary>
public static class Account
{
    /// <summary>
    /// Checks if a user is logged in.
    /// </summary>
    /// <returns>True if a user is currently logged in</returns>
    public static bool IsLoggedIn()
    {
        return (HttpContext.Current.Session["User"] != null);
    }

    public static User CurrentUser()
    {
        return ((User)HttpContext.Current.Session["User"]);
    }

    public static bool Login(string sUsername, string sPassword, int iType)
    {

        // check if the user exists in the admin table, and if they do, validate password.
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Users WHERE username = '" + sUsername + "' and password = '" + sPassword + "'";
        DataTable dtResults = SqlHelper.ReturnAsTable(cmd, Settings.StockMarketConn);

        if (dtResults.Rows.Count > 0)
        {
            User activeUser = new User();
            DataRow dr = dtResults.Rows[0];
            activeUser.UserId = Convert.ToInt32(dr["user_id"]);
            activeUser.CompanyName = dr["companyname"].ToString();
            activeUser.FirstName = dr["firstname"].ToString();
            activeUser.LastName = dr["lastname"].ToString();
            activeUser.Email = dr["email"].ToString();
            activeUser.Phone = dr["phone"].ToString();
            activeUser.UserName = dr["username"].ToString();
            activeUser.Password = dr["password"].ToString();
            activeUser.Type = (Enums.enuType)Convert.ToInt32(dr["type_id"]);

            // if the user chose a type other than what they are in the database
            if (activeUser.Type != (Enums.enuType)iType)
            {
                // if the user returned is an admin, allow them to sign in as admin or company
                if (activeUser.Type == Enums.enuType.Admin)
                {
                    activeUser.Type = (Enums.enuType)iType;
                }
                else
                {
                    // the user is a client who is trying to sign in as an admin
                    return false;
                }
            }
            // TODO: set properties...
            HttpContext.Current.Session["User"] = activeUser;
            return true;
        }

        return false;

    }

    public static void Register()
    {

    }
}