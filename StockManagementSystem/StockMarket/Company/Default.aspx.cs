using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Company_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Account.IsLoggedIn())
        {
            if (Account.CurrentUser().Type != Enums.enuType.Company)
            {
                Response.Redirect(Request.ApplicationPath);
            }
        }
        else
        {
            Response.Redirect(Path.Combine(Request.ApplicationPath, "Login.aspx"));
        }
    }
}