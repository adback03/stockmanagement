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
        GeneratePriceHistoryGraph("divGOOG", "GOOG", ltChartGOOG);
        GeneratePriceHistoryGraph("divTWTR", "TWTR", ltChartTWTR);
    }

    private void GeneratePriceHistoryGraph(string divId, string ticker, Literal lt)
    {
        GoogleChart chart = new GoogleChart();
        chart.elementId = divId;
        chart.title = ticker + " Price History";
        chart.width = 750;
        chart.height = 450;
        chart.addColumn("string", "Time");
        chart.addColumn("number", "Price");

        DataTable dt = StockMarket.GetPriceHistory(ticker);
        foreach (DataRow priceHistory in dt.Rows)
        {
            double price = double.Parse(priceHistory["price"].ToString());
            string time = priceHistory["timestamp"].ToString();
            if (dt.Rows.IndexOf(priceHistory) > 0 && dt.Rows.IndexOf(priceHistory) != dt.Rows.Count - 1)
            {
                time = "";
            }
            chart.addRow("'" + time + "', " + price);
        }

        lt.Text = chart.generateChart(GoogleChart.ChartType.LineChart);
    }
}