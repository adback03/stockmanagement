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

    public static bool Login(string sUsername, string sPassword)
    {

        // check if the user exists in the admin table, and if they do, validate password.
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Users WHERE username = '"+ sUsername + "' and password = '" + sPassword + "'";
        DataTable dtResults = SqlHelper.ReturnAsTable(cmd, Settings.StockMarketConn);

        if (dtResults.Rows.Count > 0)
        {
            User activeUser = new User();
            DataRow dr = dtResults.Rows[0];
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