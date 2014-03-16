using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.UI;

/// <summary>
/// Summary description for App
/// </summary>
public static class App
{
    /// <summary>
    /// Redirect to the Root of the current application.
    /// </summary>
    public static void RedirectToRoot()
    {
        HttpContext.Current.Response.Redirect(HttpContext.Current.Request.ApplicationPath);
    }

    /// <summary>
    /// Redirect to the root of a specific folder
    /// </summary>
    /// <param name="folderRoot"></param>
    public static void Redirect(string path)
    {
        HttpContext.Current.Response.Redirect(Path.Combine(HttpContext.Current.Request.ApplicationPath, path));
    }

    /// <summary>
    /// Show an alert message popup on the current page.
    /// </summary>
    /// <param name="message">The messeage to display</param>
    public static void ShowAlertMessage(string message)
    {
        message = "alert('" + message.Replace("'", @"\'").Replace("\n", @"\n") + "');";

        // Get the current page handler
        if (HttpContext.Current.CurrentHandler is Page)
        {
            Page p = (Page)HttpContext.Current.CurrentHandler;

            if (ScriptManager.GetCurrent(p) != null)
            {
                ScriptManager.RegisterStartupScript(p, typeof(Page), "Message", message, true);
            }
            else
            {
                p.ClientScript.RegisterStartupScript(typeof(Page), "Message", message, true);
            }
        }
    }
}