using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DatabaseAccess;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    /// <summary>
    /// Redirect a user the the page where they can manage their stock.
    /// This includes buying, selling, and viewing transactions.
    /// </summary>
    protected void lbtnManageStock_Click(object sender, EventArgs e)
    {
        Response.Redirect(System.IO.Path.Combine(Request.ApplicationPath, "Company", "Manage.aspx"));
    }

    /// <summary>
    /// Log a user out by clearing the session and redirecting to the home page.
    /// </summary>
    protected void lbtnLogOut_Click(object sender, EventArgs e)
    {
        Account.LogOut();
    }

    /// <summary>
    /// Redirect the user to the Default page in the Company Directory
    /// </summary>
    protected void lbtnAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect(System.IO.Path.Combine(Request.ApplicationPath, "Company"));
    }
}
