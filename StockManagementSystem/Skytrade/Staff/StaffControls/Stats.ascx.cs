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
        double spent = SkyTrade.GetCompanyStats(Common.Enums.TransactionType.Sell);
        double earned = SkyTrade.GetCompanyStats(Common.Enums.TransactionType.Buy);
        double profit = earned - spent;

        chrtProfitMargin.Titles.Add("Profit");
        chrtProfitMargin.Series[0].Points.AddXY("Spent", spent);
        chrtProfitMargin.Series[0].Points.AddXY("Earned", earned);
        chrtProfitMargin.Series[0].Points.AddXY("Profit", profit);
        lblSpent.Text = "$" + spent.ToString();
        lblEarned.Text = "$" + earned.ToString();
        lblProfit.Text = "$" + profit.ToString();
    }
}