using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using DatabaseAccess;

public partial class Company_CompanyControls_MessagesControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM messages WHERE archived = 0";
        rptMessages.DataSource = SqlHelper.ReturnAsTable(cmd, Settings.SkyTradeConn);
        rptMessages.DataBind();

        cmd.CommandText = "SELECT * FROM messages WHERE archived = 1";
        rptArchived.DataSource = SqlHelper.ReturnAsTable(cmd, Settings.SkyTradeConn);
        rptArchived.DataBind();
    }

    protected void btnArchive_Command(object sender, CommandEventArgs e)
    {
        int messageId = int.Parse(e.CommandArgument.ToString());
        SkyTrade.UpdateMessageArchiveStatus(messageId, true);
        BindData();
    }

    protected void btnArchiveToInbox_Command(object sender, CommandEventArgs e)
    {
        int messageId = int.Parse(e.CommandArgument.ToString());
        SkyTrade.UpdateMessageArchiveStatus(messageId, false);
        BindData();
    }
}