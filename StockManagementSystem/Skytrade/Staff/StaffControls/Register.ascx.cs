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
        cmd.CommandText = "SELECT * FROM Users INNER JOIN BankAccount ON BankAccount.user_id = Users.user_id WHERE status_id = @pending OR status_id = @reactive";
        cmd.Parameters.Add("@pending", SqlDbType.Int).Value = 1;
        cmd.Parameters.Add("@reactive", SqlDbType.Int).Value = 4;
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
            Boolean reactive = (Convert.ToInt32(dr["status_id"]) == 4);
            if (e.CommandName == "Approve")
            {
                String username = reactive ? (String)dr["username"] : SkyTrade.generateUsername((String)dr["firstname"], (String)dr["lastname"]);
                String password = SkyTrade.generatePassword();
                SqlCommand cmd = new SqlCommand("UPDATE Users SET status_id=@status_id, username=@username, password=@password WHERE user_id = @user_id");
                cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = (int)dr["user_id"];
                cmd.Parameters.Add("@status_id", SqlDbType.Int).Value = 2;
                cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = username;
                cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = password;
                SqlHelper.ExecuteNonQuery(cmd, Settings.SkyTradeConn);
                String head = reactive?"Your account has been activated successfully!":"Congratulations, your request has been approved!";
                String body = "Username: \n" + username + "\nPassword: \n" + password + "\n" + txtMessage.Text;
                SkyTrade.sendMail((string)dr["email"], head, body);
            }
            else if (e.CommandName == "Deny")
            {
                if (txtMessage.Text.Length > 10)
                {
                    if (!reactive)
                    {
                        SqlCommand cmd = new SqlCommand("DELETE Users WHERE user_id = @user_id");
                        cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = (int)dr["user_id"];
                        SqlHelper.ExecuteNonQuery(cmd, Settings.SkyTradeConn);
                    }
                    else
                    {
                        SqlCommand cmd = new SqlCommand("UPDATE Users SET status_id=@status_id WHERE user_id = @user_id");
                        cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = (int)dr["user_id"];
                        cmd.Parameters.Add("@status_id", SqlDbType.Int).Value = 3;
                        SqlHelper.ExecuteNonQuery(cmd, Settings.SkyTradeConn);
                    }
                    String head = "Sorry, we can not approve your request now!";
                    String body = "Please check later";
                    SkyTrade.sendMail((string)dr["email"], head, body);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "MyScript", "alert('You must provide a registration message.');", true);
                }
            }
        
        BindData();
    }

    protected void lbtnChange_Click1(object sender, EventArgs e)
    {
        int index = gvRequest.SelectedIndex;
        index = gvRequest.PageIndex;
    }

    protected void gvRequest_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvRequest.PageIndex = e.NewPageIndex;
        BindData();
    }
}