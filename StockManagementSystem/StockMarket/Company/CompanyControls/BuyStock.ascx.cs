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


public partial class Company_CompanyControls_BuyStock : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        InitJavascript();

        if (!Page.IsPostBack)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM Stock";
            DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.StockMarketConn);
            gvStock.DataSource = dt;
            gvStock.DataBind();

            cmd.CommandText = "SELECT Ticker FROM Stock";
            dt = SqlHelper.ReturnAsTable(cmd, Settings.StockMarketConn);
            ddlStock.DataTextField = "Ticker";
            ddlStock.DataSource = dt;
            ddlStock.DataBind();
        }
    }

    private void InitJavascript()
    {
        txtQuantityPurchase.Attributes.Add("onkeypress", "return isNumber(event);");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        StockMarket.InsertTransaction(ddlStock.SelectedItem.Text, int.Parse(txtQuantityPurchase.Text), Enums.TransactionType.Buy);
        Response.Redirect(Request.Url.ToString(), true);
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
        DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.StockMarketConn);
        gvStock.DataSource = dt;
        gvStock.DataBind();
    }
}