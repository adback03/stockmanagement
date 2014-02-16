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

    protected void lbtnManageStock_Click(object sender, EventArgs e)
    {
        Response.Redirect("#manage");
    }

    protected void lbtnLogOut_Click(object sender, EventArgs e)
    {
        Session["User"] = null;
        Response.Redirect(Request.ApplicationPath);
    }
}
