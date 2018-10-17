using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class Admin_Login : System.Web.UI.Page
{
    MySql.Data.MySqlClient.MySqlConnection conn;
    MySql.Data.MySqlClient.MySqlCommand cmd;
    MySql.Data.MySqlClient.MySqlDataReader reader;
    string username;
    int userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
    }

    protected void btnAdminLogin_Click(object sender, EventArgs e)
    {
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        conn.Open();
        using (conn)
        {
            using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspAdminLoginGet", conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("i_UserName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtUserName.Text.Trim();
                cmd.Parameters.Add("i_AdminID", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtAdminID.Text.Trim();
                cmd.Parameters.Add("i_Password", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtPassword.Text.Trim();
                reader = cmd.ExecuteReader();
                username = "";

                while (reader.HasRows && reader.Read())
                {
                    username = reader.GetString(reader.GetOrdinal("FirstName"));
                    userid = reader.GetInt32(reader.GetOrdinal("AdminID"));

                }

                if (reader.HasRows)
                {
                    Session["AdminName"] = username;
                    Session["AdminId"] = userid;
                    Response.BufferOutput = true;
                    Response.Redirect("Admin.aspx", false);

                }
                else
                {
                    string script = "alert(\"Invalid User Name or Password\")";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                      "ServerControlScript", script, true);
                    
                }
            }


        }
        reader.Close();
        conn.Close();
    }
    protected void btnAdminClearFields_Click(object sender, EventArgs e)
    {

        txtUserName.Text = string.Empty;
        txtPassword.Text = string.Empty;
        txtAdminID.Text = string.Empty;
    }
}