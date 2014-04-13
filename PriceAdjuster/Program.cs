using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DatabaseAccess;

namespace PriceAdjuster
{
    class Program
    {
        private static string connStockMarket { get; set; }
        private static string connSkyTrade { get; set; }

        static void Main(string[] args)
        {
            connStockMarket = System.Configuration.ConfigurationManager.ConnectionStrings["StockMarket"].ToString();
            connSkyTrade = System.Configuration.ConfigurationManager.ConnectionStrings["SkyTrade"].ToString();
            DataTable dt = GetAllTickers();
            foreach (DataRow dr in dt.Rows)
            {
                double currentPrice = GetPrice(dr["ticker"].ToString());
                currentPrice += RandomDouble() * RandomPosOrNeg();
                UpdatePrice(dr["ticker"].ToString(), currentPrice, connStockMarket);
                UpdatePrice(dr["ticker"].ToString(), currentPrice, connSkyTrade);
                //break;
            }
        }

        private static double RandomDouble()
        {
            Random rand = new Random();
            return rand.NextDouble();
        }

        private static int RandomPosOrNeg()
        {
            Random rand = new Random();
            int i = rand.Next(100);

            if (i % 2 == 0)
            {
                return 1;
            }
            else
            {
                return -1;
            }
        }

        private static double GetPrice(string ticker)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT price FROM Stock WHERE ticker = '" + ticker + "'";
            double currentPrice = double.Parse(SqlHelper.ExecuteScalar(cmd, connStockMarket));
            return currentPrice;
        }

        /// <summary>
        /// Get a list of all the activer tickers in Skytrade
        /// </summary>
        private static DataTable GetAllTickers()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT ticker FROM Stock";
            return SqlHelper.ReturnAsTable(cmd, connStockMarket);
        }

        private static void UpdatePrice(string ticker, double price, string connection)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "UPDATE Stock SET price = " + price + " WHERE ticker = '" + ticker + "'";
            SqlHelper.ExecuteNonQuery(cmd, connection);
        }
    }
}
