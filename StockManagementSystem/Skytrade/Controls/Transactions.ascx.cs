using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using DatabaseAccess;


public partial class Company_CompanyControls_BuyStock : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM TransactionDetails WHERE username = '" + Account.CurrentUser().UserName + "' AND transaction_type = 'Buy' ORDER BY timestamp desc";
            DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.SkyTradeConn);
            gvBuy.DataSource = dt;
            gvBuy.DataBind();

            cmd.CommandText = "SELECT * FROM TransactionDetails WHERE username = '" + Account.CurrentUser().UserName + "' AND transaction_type = 'Sell' ORDER BY timestamp desc";
            dt = SqlHelper.ReturnAsTable(cmd, Settings.SkyTradeConn);
            gvSell.DataSource = dt;
            gvSell.DataBind();
        }
    }
}