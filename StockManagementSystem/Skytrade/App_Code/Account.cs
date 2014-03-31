using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using DatabaseAccess;
using Common;

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

    /// <summary>
    /// Verify that the user is logged in, and that they have access to the page which they are requesting.
    /// </summary>
    /// <param name="userType">The user type to verify</param>
    public static void VerifyCredentials(Enums.SkyTradeType userType)
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
                    case Enums.SkyTradeType.Client:
                        HttpContext.Current.Response.Redirect(Path.Combine(HttpContext.Current.Request.ApplicationPath, "Client"));
                        break;
                    // Redirect to the Admin home page if the user type is an Admin
                    case Enums.SkyTradeType.Staff:
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

    public static Address GetAddressById(int aid)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Address WHERE address_id=@address_id";
        cmd.Parameters.Add("@address_id", SqlDbType.Int).Value = aid;
        DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.SkyTradeConn);
        DataRow dr = dt.Rows[0];
        Address address = new Address();
        address.Address1 = (String)dr["line1"];
        address.Address2 = (String)dr["line2"];
        address.City = (String)dr["city"];
        address.State = (String)dr["state"];
        address.Zip = (String)dr["zip"];
        return address;
    }

    // Address store in separated table?
    public static Bank GetBankByUserId(int uid)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM BankAccount WHERE user_id=@user_id";
        cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = uid;
        DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.SkyTradeConn);
        DataRow dr = dt.Rows[0];
        Bank bank = new Bank();
        bank.AccountNo = (String)dr["account_number"];
        return bank;
    }

    public static bool Login(string sUsername, string sPassword, int iType)
    {
        
        // check if the user exists in the admin table, and if they do, validate password.
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Users WHERE username = '"+ sUsername + "' and password = '" + sPassword + "' and status_id = 2";
        DataTable dtResults = SqlHelper.ReturnAsTable(cmd, Settings.SkyTradeConn);

        if (dtResults.Rows.Count > 0)
        {
            User activeUser = new User();
            DataRow dr = dtResults.Rows[0];
            activeUser.AddressId = Convert.ToInt32(dr["address_id"]);
            activeUser.Email = (String)dr["email"];
            activeUser.FirstName = (String)dr["firstname"];
            activeUser.LastName = (String)dr["lastname"];
            activeUser.Password = (String)dr["password"];
            activeUser.Phone = (String)dr["phone"];
            activeUser.SSN = (String)dr["ssn"];
            activeUser.UserName = (String)dr["username"];
            activeUser.Type = (Enums.SkyTradeType)Convert.ToInt32(dr["type_id"]);
            activeUser.UserId = Convert.ToInt32(dr["user_id"]);
            // if the user chose a type other than what they are in the database
            if (activeUser.Type != (Enums.SkyTradeType)iType)
            {
                // if the user returned is an admin, allow them to sign in as admin or client
                if (activeUser.Type == Enums.SkyTradeType.Staff)
                {
                    activeUser.Type = (Enums.SkyTradeType)iType;
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