using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using DatabaseAccess;

/// <summary>
/// Summary description for Connection
/// </summary>
public static class Settings
{
    public static string SkyTradeConn { get; set; }
    public static string StockMarketConn { get; set; }

    public static void Initialize()
    {
        string machineName = System.Environment.MachineName;

        if (machineName == "DIDIERDROGBA")
        {
            SkyTradeConn = System.Configuration.ConfigurationManager.ConnectionStrings["AndrewSkyTrade"].ToString();
            StockMarketConn = System.Configuration.ConfigurationManager.ConnectionStrings["AndrewStockMarket"].ToString();
        }
        else
        {
            // Note that these connections will only work while on campus (or remotted in)
            SkyTradeConn = System.Configuration.ConfigurationManager.ConnectionStrings["SkyTrade"].ToString();
            StockMarketConn = System.Configuration.ConfigurationManager.ConnectionStrings["StockMarket"].ToString();
        }
    }
}