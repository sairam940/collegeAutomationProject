using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class Admin_Registration : System.Web.UI.Page
{
    MySql.Data.MySqlClient.MySqlConnection conn;
    MySql.Data.MySqlClient.MySqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

    }

    protected void btnAdminRegister_Click(object sender, EventArgs e)
    {
        reqcmpPasswords.Enabled = true;
        reqcontactnumber.Enabled = true;
        reqEmailName.Enabled = true;
        reqFirstName.Enabled = true;
        reqLastName.Enabled = true;
        reqReenterPassword.Enabled = true;
        reqPassword.Enabled = true;
   
            RegisterUser();

    }

    protected void btnAdminClearFields_Click(object sender, EventArgs e)
    {
        txtFirstName.Text = string.Empty;
        txtlastname.Text = string.Empty;
        txtemailaddress.Text = string.Empty;
        txtcontactnumber.Text = string.Empty;
        txtUserName.Text = string.Empty;
        txtPassword.Text = string.Empty;
        txtReenterPassword.Text = string.Empty;
    }

    private void RegisterUser()
    {
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        conn.Open();
        using (conn)
        {
            using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspAdminDetailsInsert", conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("i_FirstName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtFirstName.Text.Trim();
                cmd.Parameters.Add("i_LastName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtlastname.Text.Trim();
                cmd.Parameters.Add("i_EmailAddress", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtemailaddress.Text.Trim();
                cmd.Parameters.Add("i_ContactNumber", MySql.Data.MySqlClient.MySqlDbType.Int64).Value = txtcontactnumber.Text.Trim();
                cmd.Parameters.Add("i_UserName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtUserName.Text.Trim();
                cmd.Parameters.Add("i_PasswordforUserName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtPassword.Text.Trim();
                cmd.Parameters.Add("o_AdminID", MySql.Data.MySqlClient.MySqlDbType.Int32);
                cmd.Parameters["o_AdminID"].Direction = ParameterDirection.Output;

                if (cmd.ExecuteNonQuery() > 0)
                {
                    Response.Write(cmd.Parameters["o_AdminID"].Value.ToString() + ":Admin saved with this ID.");
                }
            }
        }
        conn.Close();

    }

    public void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Session.RemoveAll();
        Response.Redirect("Admin_Login.aspx");
    }
}