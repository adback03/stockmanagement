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
                string ticker = dr["ticker"].ToString();
                double currentPrice = GetPrice(ticker);
                if (currentPrice < 1.0)
                {
                    currentPrice += 1.5;
                }
                else
                {
                    currentPrice += RandomDouble() * RandomPosOrNeg();
                }
                
                UpdatePrice(ticker, currentPrice, connStockMarket);
                UpdatePrice(ticker, currentPrice, connSkyTrade);
                UpdateStockHistory(ticker, currentPrice);
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

        private static void UpdateStockHistory(string ticker, double price)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "INSERT INTO PriceHistory (ticker, price, timestamp) VALUES (@ticker, @price, @timestamp)";
            cmd.Parameters.Add("@ticker", SqlDbType.VarChar).Value = ticker;
            cmd.Parameters.Add("@price", SqlDbType.Decimal).Value = Math.Round(price, 2);
            cmd.Parameters.Add("@timestamp", SqlDbType.DateTime).Value = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            SqlHelper.ExecuteNonQuery(cmd, connStockMarket);
        }
    }
}
