using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

using DatabaseAccess;

public partial class Controls_Manage : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM Stock";
            DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.StockMarketConn);

            Session["AdminStock"] = dt;
            BindData();
        }
    }

    protected void gvStock_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvStock.EditIndex = e.NewEditIndex;
        BindData();
    }

    protected void gvStock_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvStock.EditIndex = -1;
        BindData();
    }

    protected void gvStock_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        DataTable dt = (DataTable)Session["AdminStock"];
        DataRow dr = dt.Rows[e.RowIndex];
        GridViewRow row = gvStock.Rows[e.RowIndex];

        string sTicker = dr["ticker"].ToString();
        string sName = ((TextBox)(row.Cells[2].Controls[0])).Text;
        string sQuantity = ((TextBox)(row.Cells[3].Controls[0])).Text;
        string sMarketPrice = ((TextBox)(row.Cells[4].Controls[0])).Text;

        SqlCommand cmd = new SqlCommand("UpdateStock");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@ticker", SqlDbType.VarChar).Value = sTicker;
        cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = sName;
        cmd.Parameters.Add("@quantity", SqlDbType.Int).Value = int.Parse(sQuantity);
        cmd.Parameters.Add("@price", SqlDbType.Decimal).Value = double.Parse(sMarketPrice);

        SqlHelper.ExecuteNonQuery(cmd, Settings.StockMarketConn);

        dt.Rows[row.DataItemIndex]["name"] = sName;
        dt.Rows[row.DataItemIndex]["quantity"] = sQuantity;
        dt.Rows[row.DataItemIndex]["price"] = sMarketPrice;
        gvStock.EditIndex = -1;

        BindData();
    }

    private void BindData()
    {
        gvStock.DataSource = Session["AdminStock"];
        gvStock.DataBind();
    }

    protected void btnAddStock_Click(object sender, EventArgs e)
    {
        string sTicker = txtTicker.Text;
        string sName = txtName.Text;
        int iQuantity = int.Parse(txtQuantity.Text);
        double dMarketPrice = double.Parse(txtMarketPrice.Text);

        SqlCommand cmd = new SqlCommand("InsertStock");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@ticker", SqlDbType.VarChar).Value = sTicker;
        cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = sName;
        cmd.Parameters.Add("@quantity", SqlDbType.Int).Value = iQuantity;
        cmd.Parameters.Add("@price", SqlDbType.Decimal).Value = dMarketPrice;

        SqlHelper.ExecuteNonQuery(cmd, Settings.StockMarketConn);
        Response.Redirect("/Admin");

    }
}