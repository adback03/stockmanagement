using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google;

public partial class Company_CompanyControls_Stats : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            chrtProfitMargin.Titles.Add("Stock");
            ddlStock.DataSource = StockMarket.GetAllTickers();
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
        DataTable dt = StockMarket.GetProfitByStock(ddlStock.Text);
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
        DataTable dt = StockMarket.GetProfitByStock(ddlStock.Text);
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

    //private void GeneratePriceHistoryGraph(string divId, string ticker, Literal lt)
    //{
    //    GoogleChart chart = new GoogleChart();
    //    chart.elementId = divId;
    //    chart.title = ticker + " Price History";
    //    chart.width = 750;
    //    chart.height = 450;
    //    chart.addColumn("string", "Time");
    //    chart.addColumn("number", "Price");

    //    DataTable dt = StockMarket.GetPriceHistory(ticker);
    //    foreach (DataRow priceHistory in dt.Rows)
    //    {
    //        double price = double.Parse(priceHistory["price"].ToString());
    //        string time = priceHistory["timestamp"].ToString();
    //        //if (dt.Rows.IndexOf(priceHistory) > 0 && dt.Rows.IndexOf(priceHistory) != dt.Rows.Count - 1)
    //        //{
    //        //    time = "";
    //        //}
    //        chart.addRow("'" + time + "', " + price);
    //    }

    //    lt.Text = chart.generateChart(GoogleChart.ChartType.LineChart);
    //}
}