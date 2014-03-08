using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

using Common;

public partial class Company_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Account.VerifyCredentials(Enums.StockMarketType.Company);

        lblMessages.Text = "(" + StockMarket.GetTotalUnreadMessages().ToString() + ")";
    }
}