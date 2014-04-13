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
            GenerateProfitMarginGraph();
        }
    }

    //private void LoadStocks()
    //{
    //    chrtProfitMargin.Titles.Add("Stock");
    //    foreach (DataRow row in SkyTrade.GetAllTickers().Rows)
    //    {
    //        DataTable dt = SkyTrade.GetProfitByStock(row["ticker"].ToString());
    //        double spent = 0;
    //        double earned = 0;
    //        double profit = 0;
    //        if (dt.Rows.Count > 0)
    //        {
    //            spent = double.Parse(dt.Rows[0]["Spent"].ToString());
    //            earned = double.Parse(dt.Rows[0]["Earned"].ToString());
    //            profit = double.Parse(dt.Rows[0]["Profit"].ToString());
    //        }

    //        chrtProfitMargin.Series[0].Points.AddXY("Spent", spent);
    //        chrtProfitMargin.Series[0].Points.AddXY("Earned", earned);
    //        chrtProfitMargin.Series[0].Points.AddXY("Profit", profit);
    //    }

    //}

    private void GenerateProfitMarginGraph()
    {
        GoogleChart chart = new GoogleChart();
        chart.elementId = "chart_div_byStock";
        chart.title = "Stocks Profit Margin ";
        chart.width = 350;
        chart.height = 350;
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