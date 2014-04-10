using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using Common;
using DatabaseAccess;
//class to load buying stock control
public partial class Controls_BuyStockControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        InitJavascript();
        //loads available stocks to buy
        if (!Page.IsPostBack)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM Stock";
            DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.SkyTradeConn);
            gvStock.DataSource = dt;
            gvStock.DataBind();

            cmd.CommandText = "SELECT Ticker FROM Stock";
            dt = SqlHelper.ReturnAsTable(cmd, Settings.SkyTradeConn);
            ddlStock.DataTextField = "Ticker";
            ddlStock.DataSource = dt;
            ddlStock.DataBind();

            // If the user is a staff member, display the discount information
            if (SkyTrade.GetUserType() == Enums.SkyTradeType.Staff)
            {
                pnlDiscount.Visible = true;
            }
            else
            {
                pnlDiscount.Visible = false;
            }
        }
    }
    //checks that input is valid number
    private void InitJavascript()
    {
        txtQuantityPurchase.Attributes.Add("onkeypress", "return isNumber(event);");
    }
    //on button click inserts transactions to db
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // Get ticker selected
        string tckr = ddlStock.SelectedItem.Text;
        // Get the current quantity available for the stock chosen in the table
        int quantityAvailable = SkyTrade.GetQuantityAvailable(tckr);
        // quantity Client wants to buy
        int qty = Int16.Parse(txtQuantityPurchase.Text);

        // if qty is not 0 and less or equal to available amount
        if (qty != 0 && qty <= quantityAvailable)
        {
            SkyTrade.InsertTransaction(ddlStock.SelectedItem.Text, int.Parse(txtQuantityPurchase.Text), Enums.TransactionType.Buy, chkDiscount.Checked);
            Response.Redirect(Request.Url.ToString(), true);
        }
        else
        {
            // Client picked invalid amount
            App.ShowAlertMessage("Quantity must be greater than 0 and less or equal to available quantity.");
        }
    }

    /// <summary>
    /// Sorts the gridview.
    /// </summary>
    protected void gvStock_Sorting(object sender, GridViewSortEventArgs e)
    {

        Session["PriceSort"] = (Session["PriceSort"] != null) ? (SortDirection)Session["PriceSort"] : SortDirection.Ascending;
        Session["QuantitySort"] = (Session["QuantitySort"] != null) ? (SortDirection)Session["QuantitySort"] : SortDirection.Ascending;

        // Determine what field to sort by
        switch (e.SortExpression)
        {
            //gets price boxes drop down
            case "Price":
                // Sort ascending
                if ((SortDirection)Session["PriceSort"] == SortDirection.Ascending)
                {
                    SortField("Price", "asc");
                    Session["PriceSort"] = SortDirection.Descending;
                }
                // Sort Descending
                else
                {
                    SortField("Price", "desc");
                    Session["PriceSort"] = SortDirection.Ascending;
                }
                break;
            //gets quantity box
            case "Quantity":
                // Sort ascending
                if ((SortDirection)Session["QuantitySort"] == SortDirection.Ascending)
                {
                    SortField("Quantity", "asc");
                    Session["QuantitySort"] = SortDirection.Descending;
                }
                // Sort descending
                else
                {
                    SortField("Quantity", "desc");
                    Session["QuantitySort"] = SortDirection.Ascending;
                }
                break;
        }
    }

    /// <summary>
    /// Sort the grid view based on the field and sort direction
    /// </summary>
    /// <param name="field">The column from the grid view to sort by</param>
    /// <param name="sortDirection">The direction to sort</param>
    private void SortField(string field, string sortDirection)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Stock ORDER BY " + field + " " + sortDirection;
        DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.SkyTradeConn);
        gvStock.DataSource = dt;
        gvStock.DataBind();
    }
}