using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Google;

public partial class Staff_StaffControls_Stats : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GenerateProfitMarginGraph();
    }

    private void GenerateProfitMarginGraph()
    {
        GoogleChart chart = new GoogleChart();
        chart.elementId = "divProfit";
        chart.title = "Stocks Profit Margin ";
        chart.width = 750;
        chart.height = 400;
        chart.addColumn("string", "Profit");
        chart.addColumn("number", "Spent");
        chart.addColumn("number", "Earned");
        chart.addColumn("number", "Profit");

        double spent = SkyTrade.GetCompanyStats(Common.Enums.TransactionType.Sell);
        double earned = SkyTrade.GetCompanyStats(Common.Enums.TransactionType.Buy);
        double profit = earned - spent;

        chart.addRow("'Profit', " + spent + ", " + earned + ", " + profit);
        ltProfit.Text = chart.generateChart(GoogleChart.ChartType.ColumnChart);
    }
}