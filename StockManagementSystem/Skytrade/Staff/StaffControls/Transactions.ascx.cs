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


public partial class Controls_BuyStockControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindData("Pending");
        }
    }

    private void BindData(string status)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM TransactionDetails WHERE Status = '" + status + "' ORDER BY timestamp desc";
        DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.SkyTradeConn);
        gvPending.DataSource = dt;
        gvPending.DataBind();
    }

    protected void gvPending_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvPending.PageIndex = e.NewPageIndex;
        //BindData();
    }

    protected void gvPending_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Reset each color back to the default value
        foreach (GridViewRow r in gvPending.Rows)
        {
            r.BackColor = Color.WhiteSmoke;
        }

        GridViewRow row = gvPending.SelectedRow;
        row.BackColor = Color.Turquoise;
        int id = int.Parse(gvPending.DataKeys[row.RowIndex].Value.ToString());
        string ticker = row.Cells[3].Text;
        int quantityRequested = int.Parse(row.Cells[4].Text);
        double price = double.Parse(row.Cells[5].Text);
        string type = row.Cells[6].Text;

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT quantity FROM Stock WHERE ticker = '" + ticker + "'";
        int quantityAvailable = int.Parse(SqlHelper.ExecuteScalar(cmd, Settings.SkyTradeConn));

        lblID.Text = id.ToString();
        lblTicker.Text = ticker;
        lblQuantity.Text = quantityRequested.ToString();
        lblQuantityAvailable.Text = quantityAvailable.ToString();
        lblPrice.Text = price.ToString();

        if (type != "Sell")
        {
            // Check if the quantity being requested is greater than the amount available
            if (quantityRequested > quantityAvailable)
            {
                lblQuantity.ForeColor = Color.Red;
                lblWarning.Visible = true;
            }
            else
            {
                lblQuantity.ForeColor = Color.Blue;
                lblWarning.Visible = false;
            }
        }

    }

    protected void btnApprove_Click(object sender, EventArgs e)
    {
        UpdateTransaction(int.Parse(lblID.Text), Enums.enuStatus.Approved);
    }

    protected void btnDisapprove_Click(object sender, EventArgs e)
    {
        UpdateTransaction(int.Parse(lblID.Text), Enums.enuStatus.Denied);
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

    protected void lbtnPending_Click(object sender, EventArgs e)
    {
        SetActiveTab(lbtnPending);
        BindData("Pending");
    }


    private void UpdateTransaction(int id, Enums.enuStatus status)
    {
        // Make sure a transaction message is supplied
        if (txtMessage.Text.Length > 10)
        {
            // Update transaction to be approved
            SqlCommand cmd = new SqlCommand("UpdateTransaction");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@transaction_id", SqlDbType.Int).Value = id;
            cmd.Parameters.Add("@status_id", SqlDbType.Int).Value = status;
            SqlHelper.ExecuteNonQuery(cmd, Settings.SkyTradeConn);
            ClearFields();
            BindData("Pending");
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyScript", "alert('Your transaction message must have at least 10 characters.');", true);
        }
    }

    private void ClearFields()
    {
        lblID.Text = "****";
        lblTicker.Text = "****";
        lblQuantity.Text = "****";
        lblQuantityAvailable.Text = "****";
        lblPrice.Text = "****";
    }

    private void SetActiveTab(LinkButton lbtnStatus)
    {
        lbtnPending.ForeColor = Color.SlateGray;
        lbtnApproved.ForeColor = Color.SlateGray;
        lbtnDenied.ForeColor = Color.SlateGray;
        lbtnStatus.ForeColor = Color.Blue;
    }
}
