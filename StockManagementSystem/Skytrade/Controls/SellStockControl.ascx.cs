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

public partial class Controls_SellStockControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        InitJavascript();
        if (!Page.IsPostBack)
        {
            gvStock.DataSource = SkyTrade.GetStockQuantityByUser();
            gvStock.DataBind();

            foreach (GridViewRow row in gvStock.Rows)
            {
                if (int.Parse(gvStock.DataKeys[row.RowIndex]["discount"].ToString()) == 1)
                {
                    row.BackColor = Color.DarkBlue;
                }
            }
        }
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
            SkyTrade.InsertTransaction(lblTicker.Text, stockToSell, Enums.TransactionType.Sell, false);
            Response.Redirect(Request.Url.ToString(), true);
        }
    }

    protected void gvStock_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Reset each color back to the default value
        txtQuantitySell.Enabled = true;
        btnSubmit.Enabled = true;
        foreach (GridViewRow r in gvStock.Rows)
        {
            if (int.Parse(gvStock.DataKeys[r.RowIndex]["discount"].ToString()) == 1)
            {
                r.BackColor = Color.DarkBlue;
            }
            else
            {
                r.BackColor = Color.Empty;
            }     
        }

        GridViewRow row = gvStock.SelectedRow;
        row.BackColor = Color.SlateGray;

        int id = int.Parse(gvStock.DataKeys[row.RowIndex]["transaction_id"].ToString());
        string ticker = row.Cells[2].Text;
        int discount = int.Parse(gvStock.DataKeys[row.RowIndex]["discount"].ToString());
        int qtyAvailable = int.Parse(row.Cells[5].Text);
        DataTable dt = SkyTrade.GetDiscountSellQuantity(ticker);

        // If a discount was used on the selected stock, get the quantity available by checking the timestamp
        if (discount == 1)
        {
            qtyAvailable = 0;
            foreach(DataRow dr in dt.Rows){
                DateTime transactionDate = DateTime.Parse(dr["timestamp"].ToString());
                if (transactionDate.AddMonths(6) <= DateTime.Now)
                {
                    qtyAvailable += int.Parse(dr["quantity"].ToString());
                }
            }

            if (qtyAvailable == 0)
            {
                App.ShowAlertMessage("You must wait 6 months before selling any of this stock. Earliest date to sell: " + DateTime.Parse(dt.Compute("min(timestamp)", string.Empty).ToString()).AddMonths(6).ToString());
                txtQuantitySell.Enabled = false;
                btnSubmit.Enabled = false;
            }
        }

        lblTicker.Text = ticker;
        lblAvailable.Text = qtyAvailable.ToString();
    }
}
