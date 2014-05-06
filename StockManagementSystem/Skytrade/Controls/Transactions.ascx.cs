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


public partial class Controls_BuyStock : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SetActiveTab(lbtnPending);
            BindData("Pending");
            Session["TransType"] = "Pending";
        }
    }

    /// <summary>
    /// Bind the data of the gridview
    /// </summary>
    /// <param name="status">The status of the transaction to pull data from</param>
    private void BindData(string status)
    {
        gvTransactions.DataSource = SkyTrade.GetTransactionDetailsByStatusAndUser(status);
        gvTransactions.DataBind();
        lblMessage.Text = String.Empty;
    }

    protected void lbtnPending_Click(object sender, EventArgs e)
    {
        SetActiveTab(lbtnPending);
        BindData("Pending");
        Session["TransType"] = "Pending";
        pnlMessage.Visible = false;
    }

    protected void lbtnApproved_Click(object sender, EventArgs e)
    {
        SetActiveTab(lbtnApproved);
        BindData("Approved");
        Session["TransType"] = "Approved";
        pnlMessage.Visible = true;
    }

    protected void lbtnDenied_Click(object sender, EventArgs e)
    {
        SetActiveTab(lbtnDenied);
        BindData("Denied");
        Session["TransType"] = "Denied";
        pnlMessage.Visible = true;
    }

    protected void lbtnOnHold_Click(object sender, EventArgs e)
    {
        SetActiveTab(lbtnOnHold);
        BindData("On Hold");
        Session["TransType"] = "On Hold";
        pnlMessage.Visible = true;
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
        lbtnOnHold.ForeColor = Color.SlateGray;
        lbtnStatus.ForeColor = Color.Blue;
    }

    protected void gvTransactions_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Reset each color back to the default value
        foreach (GridViewRow r in gvTransactions.Rows)
        {
            r.BackColor = Color.Empty;
        }

        GridViewRow row = gvTransactions.SelectedRow;
        row.BackColor = Color.SlateGray;
        int id = int.Parse(gvTransactions.DataKeys[row.RowIndex].Value.ToString());
        lblMessage.Text = SkyTrade.GetTransactionMessage(id);
    }

    protected void gvTransactions_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvTransactions.PageIndex = e.NewPageIndex;
        BindData(Session["TransType"].ToString());
    }
}