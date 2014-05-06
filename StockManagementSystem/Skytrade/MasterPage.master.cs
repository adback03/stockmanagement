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
        Settings.Initialize();
        if (Account.CurrentUser().Type == Common.Enums.SkyTradeType.Staff)
        {
            lbtnAccount.Visible = false;
            lbtnManageStock.Visible = false;
        }
    }

    protected void lbtnAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.ApplicationPath);
    }

    protected void lbtnManageStock_Click(object sender, EventArgs e)
    {
        Response.Redirect(System.IO.Path.Combine(Request.ApplicationPath, "Manage.aspx"));
    }

    protected void lbtnLogOut_Click(object sender, EventArgs e)
    {
        Session["User"] = null;
        Response.Redirect(Request.ApplicationPath);
    }
}
