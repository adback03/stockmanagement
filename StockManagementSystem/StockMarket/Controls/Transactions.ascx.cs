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
            BindData();
        }
    }

    private void BindData()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM TransactionDetails ORDER BY timestamp desc";
        DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.StockMarketConn);
        gvPending.DataSource = dt;
        gvPending.DataBind();
    }

    protected void gvPending_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvPending.PageIndex = e.NewPageIndex;
        BindData();
    }

    protected void gvPending_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = gvPending.SelectedRow;
        int id = int.Parse(gvPending.DataKeys[row.RowIndex].Value.ToString());
        string ticker = row.Cells[3].Text;
        int quantityRequested = int.Parse(row.Cells[4].Text);
        double price = double.Parse(row.Cells[5].Text);

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT quantity FROM Stock WHERE ticker = '" + ticker + "'";
        int quantityAvailable = int.Parse(SqlHelper.ExecuteScalar(cmd, Settings.StockMarketConn));

        lblID.Text = id.ToString();
        lblTicker.Text = ticker;
        lblQuantityRequested.Text = quantityRequested.ToString();
        lblQuantityAvailable.Text = quantityAvailable.ToString();
        lblPrice.Text = price.ToString();

        // Check if the quantity being requested is greater than the amount available
        if (quantityRequested > quantityAvailable)
        {
            lblQuantityRequested.ForeColor = Color.Red;
            lblWarning.Visible = true;
        }
        else
        {
            lblQuantityRequested.ForeColor = Color.Blue;
            lblWarning.Visible = false;
        }
    }
}