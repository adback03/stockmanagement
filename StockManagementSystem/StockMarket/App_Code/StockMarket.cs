﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;
using System.Web;

using Common;
using DatabaseAccess;

public static class StockMarket
{
    public static int GetQuantityAvailable(string ticker)
    {
        // Get the current quantity available for the stock chosen in the table
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT quantity FROM Stock WHERE ticker = '" + ticker + "'";
        return int.Parse(SqlHelper.ExecuteScalar(cmd, Settings.StockMarketConn));
    }

    public static DataTable GetTransactionDetailsByStatus(string status)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM TransactionDetails WHERE Status = '" + status + "' ORDER BY timestamp desc";
        return SqlHelper.ReturnAsTable(cmd, Settings.StockMarketConn);
    }

    public static DataTable GetTransactionDetailsByStatusAndUser(string status)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM TransactionDetails WHERE Status = '" + status + "' AND username = '" + Account.CurrentUser().UserName + "' ORDER BY timestamp desc";
        return SqlHelper.ReturnAsTable(cmd, Settings.StockMarketConn);
    }

    public static void UpdateTransaction(int id, Enums.Status status, string message)
    {
        // Update transaction to be approved
        SqlCommand cmd = new SqlCommand("UpdateTransaction");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@transaction_id", SqlDbType.Int).Value = id;
        cmd.Parameters.Add("@status_id", SqlDbType.Int).Value = status;
        cmd.Parameters.Add("@message", SqlDbType.VarChar).Value = message;
        SqlHelper.ExecuteNonQuery(cmd, Settings.StockMarketConn);
    }

    public static void InsertTransaction(string ticker, int quantity, Enums.TransactionType type)
    {
        SqlCommand cmd = new SqlCommand("InsertTransaction");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = Account.CurrentUser().UserId;
        cmd.Parameters.Add("@ticker", SqlDbType.VarChar).Value = ticker;
        cmd.Parameters.Add("@quantity", SqlDbType.Int).Value = quantity;
        cmd.Parameters.Add("@transaction_type_id", SqlDbType.Int).Value = type;
        SqlHelper.ExecuteNonQuery(cmd, Settings.StockMarketConn);
    }

    public static string GetTransactionMessage(int transactionId)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT message FROM Transactions WHERE transaction_id = " + transactionId + "";
        return SqlHelper.ExecuteScalar(cmd, Settings.StockMarketConn);
    }

    public static int GetTotalUnreadMessages()
    {
        try
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT COUNT(*) FROM messages WHERE to_user = " + Account.CurrentUser().UserId + " AND archived = 0";
            return int.Parse(SqlHelper.ExecuteScalar(cmd, Settings.StockMarketConn));
        }
        catch
        {
            return 0;
        }
    }

    public static void UpdateMessageArchiveStatus(int messageId, bool archive)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "UPDATE messages SET archived = '" + archive + "' WHERE message_id = " + messageId + "";
        SqlHelper.ExecuteNonQuery(cmd, Settings.StockMarketConn);
    }

    public static void InsertMessage(int recipient, string message)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "INSERT INTO Messages (from_user, to_user, message, archived, timestamp) VALUES (" + Account.CurrentUser().UserId + ", " + recipient + ", '" + message + "', 0, '" + DateTime.Now + "')";
        SqlHelper.ExecuteNonQuery(cmd, Settings.StockMarketConn);
    }

    public static DataTable GetStockQuantityByUser()
    {
        SqlCommand cmd = new SqlCommand("GetStockQuantityByUser");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = Account.CurrentUser().UserId;
        return SqlHelper.ReturnAsTable(cmd, Settings.StockMarketConn);
    }

    /// <summary>
    /// Get the profit margin for a particular stock.
    /// </summary>
    /// <param name="ticker"></param>
    /// <returns>Datatable with amount spent, amount earned, and total profit</returns>
    public static DataTable GetPriceHistory(string ticker)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT TOP(100) price, timestamp FROM PriceHistory WHERE ticker = @ticker ORDER BY timestamp";
        cmd.Parameters.Add("@ticker", SqlDbType.VarChar).Value = ticker;
        return SqlHelper.ReturnAsTable(cmd, Settings.StockMarketConn);
    }

    /// <summary>
    /// Get a list of all the activer tickers in Skytrade
    /// </summary>
    public static DataTable GetAllTickers()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT ticker FROM Stock";
        return SqlHelper.ReturnAsTable(cmd, Settings.StockMarketConn);
    }

    /// <summary>
    /// Get the profit margin for a particular stock.
    /// </summary>
    /// <param name="ticker"></param>
    /// <returns>Datatable with amount spent, amount earned, and total profit</returns>
    public static DataTable GetProfitByStock(string ticker)
    {
        SqlCommand cmd = new SqlCommand("GetProfitByStock");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@ticker", SqlDbType.VarChar).Value = ticker;
        return SqlHelper.ReturnAsTable(cmd, Settings.StockMarketConn);
    }

    public static String generatePassword()
    {
        String password = "";
        Random r = new Random();
        for (int i = 0; i < 6; i++)
        {
            password += r.Next(10);
        }
        return password;
    }

    public static void sendMail(string to, string head, string content)
    {
        var message = new MailMessage("skytradesky@gmail.com", to);
        string body = content;
        message.Subject = head;
        message.Body = body;
        SmtpClient mailer = new SmtpClient("smtp.gmail.com", 587);
        mailer.Credentials = new NetworkCredential("skytradesky@gmail.com", "skytradesky...");
        mailer.EnableSsl = true;
        mailer.Send(message);
    }
}

