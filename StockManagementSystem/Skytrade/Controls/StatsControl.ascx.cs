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
            LoadStocks();
            GenerateQuickStats();
        }
        
    }

    private void LoadStocks()
    {
        ddlStocks.DataSource = SkyTrade.GetAllTickers();
        ddlStocks.DataTextField = "ticker";
        ddlStocks.DataValueField = "ticker";
        ddlStocks.DataBind();
    }

    private void GenerateQuickStats()
    {
        GoogleChart chart = new GoogleChart();
        chart.elementId = "chart_div_byStock";
        chart.title = "Stocks Profit Margin ";
        chart.width = 600;
        chart.height = 600;
        chart.addColumn("string", "Stock Type");
        chart.addColumn("number", "Spent");
        chart.addColumn("number", "Earned");
        chart.addColumn("number", "Profit");

        foreach (DataRow row in SkyTrade.GetAllTickers().Rows)
        {
            DataTable dt = SkyTrade.GetProfitByStock(row["ticker"].ToString());
            double spent = 0;
            double earned = 0;
            double profit = 0;
            if (dt.Rows.Count > 0)
            {
                spent = double.Parse(dt.Rows[0]["Spent"].ToString());
                earned = double.Parse(dt.Rows[0]["Earned"].ToString());
                profit = double.Parse(dt.Rows[0]["Profit"].ToString());
            }

            chart.addRow("'" + row["ticker"].ToString() + "', " + spent + ", " + earned + ", " + profit);
        }
    
        ltChartByStock.Text = chart.generateChart(GoogleChart.ChartType.ColumnChart);
    }
}