using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class _Default : System.Web.UI.Page
{
    MySql.Data.MySqlClient.MySqlConnection conn;
    MySql.Data.MySqlClient.MySqlCommand cmd;
    MySql.Data.MySqlClient.MySqlDataReader reader;
    string username;
    int userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            SetImageURL();
        }
        this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        conn.Open();
        using (conn)
        {
            using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspStudentLoginGet", conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("i_UserName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtUserName.Text.Trim();
                cmd.Parameters.Add("i_StudentID", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtStudentID.Text.Trim();
                cmd.Parameters.Add("i_Password", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtPassword.Text.Trim();
                reader = cmd.ExecuteReader();
                username = "";
                
                while (reader.HasRows && reader.Read())
                {
                    username = reader.GetString(reader.GetOrdinal("FirstName"));
                    userid = reader.GetInt32(reader.GetOrdinal("StudentID"));


                }

                if(reader.HasRows)
                {
                    Session["UserName"] = username;
                    Session["UserId"] = userid;
                    Response.BufferOutput = true;
                    Response.Redirect("Login.aspx", false);

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

    protected void btnClearFields_Click(object sender, EventArgs e)
    {
        
        txtUserName.Text = string.Empty;
        txtPassword.Text = string.Empty;
        txtStudentID.Text = string.Empty;
    }





    protected void Timer1_Tick(object sender, EventArgs e)
    {
        SetImageURL();
    }

    private void SetImageURL()
    {
        Random _rand = new Random();
        int i = _rand.Next(1, 5);
        ImageControl.ImageUrl = "~/Images/" + i.ToString() + ".jpg";
    }
}