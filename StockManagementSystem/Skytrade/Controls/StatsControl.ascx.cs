using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google;

public partial class Controls_StatsControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack){
            chrtProfitMargin.Titles.Add("Stock");
            ddlStock.DataSource = SkyTrade.GetAllTickers();
            ddlStock.DataTextField = "ticker";
            ddlStock.DataBind();
            SetQuickStats();
            LoadStocks();
        }
    }

    private void LoadStocks()
    {
        foreach (var series in chrtProfitMargin.Series)
        {
            series.Points.Clear();
        }
        DataTable dt = SkyTrade.GetProfitByStock(ddlStock.Text);
        double spent = 0;
        double earned = 0;
        double profit = 0;
        if (dt.Rows.Count > 0)
        {
            spent = double.Parse(dt.Rows[0]["Spent"].ToString());
            earned = double.Parse(dt.Rows[0]["Earned"].ToString());
            profit = double.Parse(dt.Rows[0]["Profit"].ToString());
        }

        chrtProfitMargin.Series[0].Points.AddXY("Spent", spent);
        chrtProfitMargin.Series[0].Points.AddXY("Earned", earned);
        chrtProfitMargin.Series[0].Points.AddXY("Profit", profit);
    }

    protected void ddlStock_SelectedIndexChanged(object sender, EventArgs e)
    {
        SetQuickStats();
    }

    private void SetQuickStats()
    {
        DataTable dt = SkyTrade.GetProfitByStock(ddlStock.Text);
        double spent = 0;
        double earned = 0;
        double profit = 0;
        if (dt.Rows.Count > 0)
        {
            spent = double.Parse(dt.Rows[0]["Spent"].ToString());
            earned = double.Parse(dt.Rows[0]["Earned"].ToString());
            profit = double.Parse(dt.Rows[0]["Profit"].ToString());
        }

        lblSpent.Text = spent.ToString();
        lblEarned.Text = earned.ToString();
        lblProfit.Text = profit.ToString();
        LoadStocks();
    }
}