using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Google;

public partial class Controls_AccountOverviewControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GenerateQuickStats();
    }

    protected void lbtnUpdate_Click(object sender, EventArgs e)
    {
        lblUsername.Text = "backes.andr";
    }

    private void GenerateQuickStats()
    {
        GoogleChart chart = new GoogleChart();
        chart.title = "Quick Stats";
        chart.width = 250;
        chart.height = 200;
        chart.addColumn("string", "Year");
        chart.addColumn("number", "Value");
        chart.addColumn("number", "Profit");
        chart.addRow("'2014', 2000, 1000");
        ltChart.Text = chart.generateChart(GoogleChart.ChartType.ColumnChart);
    }
}