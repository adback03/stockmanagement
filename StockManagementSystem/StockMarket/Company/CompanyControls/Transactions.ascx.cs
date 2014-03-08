using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

using DatabaseAccess;


public partial class Company_CompanyControls_BuyStock : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindData("Pending");
        }
    }

    /// <summary>
    /// Bind the data of the gridview
    /// </summary>
    /// <param name="status">The status of the transaction to pull data from</param>
    private void BindData(string status)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM TransactionDetails WHERE username = '" + Account.CurrentUser().UserName + "' AND Status = '" + status + "' ORDER BY timestamp desc";
        DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.StockMarketConn);
        gvTransactions.DataSource = dt;
        gvTransactions.DataBind();
    }

    protected void lbtnPending_Click(object sender, EventArgs e)
    {
        SetActiveTab(lbtnPending);
        BindData("Pending");
    }

    protected void lbtnApproved_Click(object sender, EventArgs e)
    {
        SetActiveTab(lbtnApproved);
        BindData("Approved");
    }

    protected void lbtnDenied_Click(object sender, EventArgs e)
    {
        SetActiveTab(lbtnDenied);
        BindData("Denied");
    }

    /// <summary>
    /// Set the active link button
    /// </summary>
    /// <param name="lbtnStatus">The link button to set</param>
    private void SetActiveTab(LinkButton lbtnStatus)
    {
        lbtnPending.ForeColor = Color.SlateGray;
        lbtnApproved.ForeColor = Color.SlateGray;
        lbtnDenied.ForeColor = Color.SlateGray;
        lbtnStatus.ForeColor = Color.Blue;
    }
}