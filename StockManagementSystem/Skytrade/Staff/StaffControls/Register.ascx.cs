using DatabaseAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Staff_StaffControls_Register : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        DataTable dt = GetDataTable();
        gvRequest.DataSource = dt;
        gvRequest.DataBind();
    }

    private DataTable GetDataTable()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM Users WHERE status_id = @status_id";
        cmd.Parameters.Add("@status_id", SqlDbType.Int).Value = 1;
        DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.SkyTradeConn);
        return dt;
    }

    protected void gvRequest_IndexChanging(object sender, GridViewSelectEventArgs  e)
    {
        int s = e.NewSelectedIndex;
    }

    protected void gvRequest_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = Convert.ToInt32(e.CommandArgument);
        DataTable dt = GetDataTable();
        DataRow dr = dt.Rows[index];
        if (e.CommandName == "Approve")
        {
            String username = generateUsername((String)dr["firstname"], (String)dr["lastname"]);
            String password = generatePassword();
            SqlCommand cmd = new SqlCommand("UPDATE Users SET status_id=@status_id, username=@username, password=@password WHERE user_id = @user_id");
            cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = (int)dr["user_id"];
            cmd.Parameters.Add("@status_id", SqlDbType.Int).Value = 2;
            cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = username;
            cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = password;
            SqlHelper.ExecuteNonQuery(cmd, Settings.SkyTradeConn);
            String head = "Congratulations, your request has been approved!";
            String body = "Username: \n" + username + "\nPassword: \n" + password;
            sendMail((string)dr["email"], head, body);
        }
        else if (e.CommandName == "Deny")
        {
            SqlCommand cmd = new SqlCommand("DELETE Users WHERE user_id = @user_id");
            cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = (int)dr["user_id"];
            SqlHelper.ExecuteNonQuery(cmd, Settings.SkyTradeConn);
            String head = "Sorry, we can not approve your request now!";
            String body = "Please check later";
            sendMail((string)dr["email"], head, body);
        }


        BindData();
    }

    protected void lbtnChange_Click1(object sender, EventArgs e)
    {
        int index = gvRequest.SelectedIndex;
        index = gvRequest.PageIndex;
    }

    private String generateUsername(String first, String last)
    {
        if (first == null || first.Length == 0 || last == null || last.Length == 0)
            return null;
        String username = last + "." + first.Substring(0, 4);
        String temp = username;
        int num = 0;
        while (true)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT * FROM Users WHERE username = @username";
            cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = temp;
            DataTable dt = SqlHelper.ReturnAsTable(cmd, Settings.SkyTradeConn);
            if (dt.Rows.Count == 0)
                break;
            num++;
            temp = username + num;
        }
        return temp.ToLower();
    }

    private String generatePassword()
    {
        String password = "";
        Random r = new Random();
        for (int i = 0; i < 6; i++)
        {
            password += r.Next(10);
        }
        return password;
    }

    private void sendMail(string to, string head, string content)
    {
        var message = new MailMessage("skytradesky@gmail.com", to);
        string body = txtMessage.Text;
        message.Subject = head;
        message.Body = body;
        SmtpClient mailer = new SmtpClient("smtp.gmail.com", 587);
        mailer.Credentials = new NetworkCredential("skytradesky@gmail.com", "skytradesky...");
        mailer.EnableSsl = true;
        mailer.Send(message);

    }
}