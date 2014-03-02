using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.IO;
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

    /// <summary>
    /// Get the user that is currently logged into the system
    /// </summary>
    /// <returns>The active user</returns>
    public static User CurrentUser()
    {
        return ((User)HttpContext.Current.Session["User"]);
    }

    /// <summary>
    /// Verify that the user is logged in, and that they have access to the page which they are requesting.
    /// </summary>
    /// <param name="userType">The user type to verify</param>
    public static void VerifyCredentials(Enums.enuType userType)
    {
        // Make sure the user trying to access the page is logged in
        if (Account.IsLoggedIn())
        {
            // If the current user isn't the type of user needed to access a particular page, redirect based on their type.
            if (Account.CurrentUser().Type != userType)
            {
                switch (Account.CurrentUser().Type)
                {
                    // Redirect to the company home page if the user type is a Company
                    case Enums.enuType.Company:
                        HttpContext.Current.Response.Redirect(Path.Combine(HttpContext.Current.Request.ApplicationPath, "Company"));
                        break;
                    // Redirect to the Admin home page if the user type is an Admin
                    case Enums.enuType.Admin:
                        HttpContext.Current.Response.Redirect(HttpContext.Current.Request.ApplicationPath);
                        break;
                }
            }
        }
        // Else, we know that the user is not validated, so redirect to the login page.
        else
        {
            HttpContext.Current.Response.Redirect(Path.Combine(HttpContext.Current.Request.ApplicationPath, "Login.aspx"));
        }
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
            HttpContext.Current.Session["User"] = activeUser;
            return true;
        }

        return false;

    }

    /// <summary>
    /// Log a user out of the system by clearing the session and redirecting to the Login page.
    /// </summary>
    public static void LogOut()
    {
        HttpContext.Current.Session["User"] = null;
        HttpContext.Current.Response.Redirect(Path.Combine(HttpContext.Current.Request.ApplicationPath, "Login.aspx"));
    }
}