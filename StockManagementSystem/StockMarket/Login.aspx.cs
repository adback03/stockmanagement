using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Settings.Initialize();
    }

    protected void lbtnLogin_Click(object sender, EventArgs e)
    {
        if (Account.Login(txtUserName.Text, txtPassword.Text))
        {
            Response.Redirect(Request.ApplicationPath);
        }
        else
        {
            // User login failed
        }
    }
}