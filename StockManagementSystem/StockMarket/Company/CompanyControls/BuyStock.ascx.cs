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
        SqlCommand cmd = new SqlCommand("InsertTransaction");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = Account.CurrentUser().UserId;
        cmd.Parameters.Add("@ticker", SqlDbType.VarChar).Value = ddlStock.SelectedItem.Text;
        cmd.Parameters.Add("@quantity", SqlDbType.Int).Value = int.Parse(txtQuantityPurchase.Text);

        SqlCommand cmd2 = new SqlCommand();
        cmd2.CommandText = "SELECT price FROM Stock WHERE ticker = '" + ddlStock.SelectedItem.Text + "'";
        string price = SqlHelper.ExecuteScalar(cmd2, Settings.StockMarketConn);
        cmd.Parameters.Add("@price", SqlDbType.Decimal).Value = double.Parse(price);

        SqlHelper.ExecuteNonQuery(cmd, Settings.StockMarketConn);
        Response.Redirect(Request.ApplicationPath + "Company");
    }
}