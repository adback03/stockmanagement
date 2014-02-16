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
    }

    protected void lbtnAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect("#account");
    }

    protected void lbtnBuyStock_Click(object sender, EventArgs e)
    {
        Response.Redirect("#buy");
    }

    protected void lbtnManageStock_Click(object sender, EventArgs e)
    {
        Response.Redirect("#manage");
    }

    protected void lbtnContact_Click(object sender, EventArgs e)
    {
        Response.Redirect("#contact");
    }

    protected void lbtnLogOut_Click(object sender, EventArgs e)
    {
        Session["User"] = null;
        Response.Redirect(Request.ApplicationPath);
    }
}
