﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

using DatabaseAccess;

public partial class Controls_Manage : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
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
        GridViewRow row = gvStock.Rows[e.RowIndex];

        string sTicker = gvStock.DataKeys[e.RowIndex].Value.ToString();
        string sName = ((TextBox)(row.Cells[2].Controls[0])).Text;
        string sQuantity = ((TextBox)(row.Cells[3].Controls[0])).Text;
        string sMarketPrice = ((TextBox)(row.Cells[4].Controls[0])).Text;
        Regex sN = new Regex(@"^[a-zA-Z '-]+$");
        Regex sQ = new Regex(@"^\d+$");
        Regex sM = new Regex( @"^\d{1,18}(\.\d{2})?$");

        SqlCommand cmd = new SqlCommand("UpdateStock");
        cmd.CommandType = CommandType.StoredProcedure;

        if (sN.IsMatch(sName)) {
            if (sQ.IsMatch(sQuantity)) {
                if (sM.IsMatch(sMarketPrice)) {
                    cmd.Parameters.Add("@ticker", SqlDbType.VarChar).Value = sTicker;
                    cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = sName;
                    cmd.Parameters.Add("@quantity", SqlDbType.Int).Value = int.Parse(sQuantity);
                    cmd.Parameters.Add("@price", SqlDbType.Decimal).Value = double.Parse(sMarketPrice);

                    SqlHelper.ExecuteNonQuery(cmd, Settings.StockMarketConn);
                    gvStock.EditIndex = -1;

                    BindData();
                } else {
                        System.Web.HttpContext.Current.Response.Write("Market Price invalid. Example: 100.00");
                }
            } else {
                    System.Web.HttpContext.Current.Response.Write("Quantity invalid. Example: 100");
            }
        } else {
                System.Web.HttpContext.Current.Response.Write("Name invalid. Example: Twitter Inc");
        }
    }

    private void BindData()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Stock";
        DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.StockMarketConn);
        Session["AdminStock"] = dt;
        gvStock.DataSource = dt;
        gvStock.DataBind();
    }

    protected void btnAddStock_Click(object sender, EventArgs e)
    {
        string sTicker = txtTicker.Text;
        string sName = txtName.Text;
        int iQuantity = int.Parse(txtQuantity.Text);
        double dMarketPrice = double.Parse(txtMarketPrice.Text);
        
        // Check is tckr is used
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Stock WHERE ticker=@ticker";
        cmd.Parameters.Add("@ticker", SqlDbType.VarChar).Value = sTicker;
        DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.StockMarketConn);
        if (dt.Rows.Count != 0)
        {
            App.ShowAlertMessage("Ticker is already in use. Please choose a different ticker symbol.");
        }
        else
        {
            cmd = new SqlCommand("InsertStock");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@ticker", SqlDbType.VarChar).Value = sTicker;
            cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = sName;
            cmd.Parameters.Add("@quantity", SqlDbType.Int).Value = iQuantity;
            cmd.Parameters.Add("@price", SqlDbType.Decimal).Value = dMarketPrice;
            SqlHelper.ExecuteNonQuery(cmd, Settings.StockMarketConn);
            BindData();
        }
    }

    /// <summary>
    /// Pagination for managing all stocks in the STock Market
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvStock_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvStock.PageIndex = e.NewPageIndex;
        BindData();
    }
}