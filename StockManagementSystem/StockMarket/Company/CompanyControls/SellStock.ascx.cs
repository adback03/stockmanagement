using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

using Common;
using DatabaseAccess;

public partial class Company_CompanyControls_SellStock : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        InitJavascript();
        if (!Page.IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        gvStock.DataSource = StockMarket.GetStockQuantityByUser();
        gvStock.DataBind();
    }

    private void InitJavascript()
    {
        txtQuantitySell.Attributes.Add("onkeypress", "return isNumber(event);");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int stockToSell = int.Parse(txtQuantitySell.Text);
        int stockAvailable = int.Parse(lblAvailable.Text);

        if (stockToSell > stockAvailable || stockToSell == 0 || stockToSell == null)
        {
            App.ShowAlertMessage("You cannot sell 0 stocks or more stocks than what you currently own.");
        }
        else
        {
            StockMarket.InsertTransaction(lblTicker.Text, stockToSell, Enums.TransactionType.Sell);
            App.ShowAlertMessage("Your transaction is currently pending, and you will be notified when it is approved.");
            lblPrice.Text = "****";
            lblTicker.Text = "****";
            lblAvailable.Text = "****";
            txtQuantitySell.Text = "";
            DataBind();
        }
    }

    /// <summary>
    /// Pagination for selling stocks
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvStock_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvStock.PageIndex = e.NewPageIndex;
        BindData();
    }
    protected void gvStock_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Reset each color back to the default value
        txtQuantitySell.Enabled = true;
        btnSubmit.Enabled = true;
        foreach (GridViewRow r in gvStock.Rows)
        {
            r.BackColor = Color.Empty;
        }

        GridViewRow row = gvStock.SelectedRow;
        row.BackColor = Color.SlateGray;

        string ticker = row.Cells[1].Text;
        string price = row.Cells[5].Text;
        int qtyAvailable = int.Parse(row.Cells[4].Text);

        lblPrice.Text = price;
        lblTicker.Text = ticker;
        lblAvailable.Text = qtyAvailable.ToString();
    }
}