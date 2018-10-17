using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class Registration : System.Web.UI.Page
{
    MySql.Data.MySqlClient.MySqlConnection conn;
    MySql.Data.MySqlClient.MySqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

    }

    protected void btnRegister_Click(object sender,EventArgs e)
    {
        RegisterUser();

    }

    protected void btnClearFields_Click(object sender, EventArgs e)
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
            using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspStudentDetailsInsert", conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("i_FirstName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtFirstName.Text.Trim();
                cmd.Parameters.Add("i_LastName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtlastname.Text.Trim();
                cmd.Parameters.Add("i_EmailAddress", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtemailaddress.Text.Trim();
                cmd.Parameters.Add("i_ContactNumber", MySql.Data.MySqlClient.MySqlDbType.Int64).Value = txtcontactnumber.Text.Trim();
                cmd.Parameters.Add("i_UserName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtUserName.Text.Trim();
                cmd.Parameters.Add("i_PasswordforUserName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtPassword.Text.Trim();
                cmd.Parameters.Add("o_StudentID", MySql.Data.MySqlClient.MySqlDbType.Int32);
                cmd.Parameters["o_StudentID"].Direction = ParameterDirection.Output;

                if (cmd.ExecuteNonQuery() > 0)
                {
                    Response.Write(cmd.Parameters["o_StudentID"].Value.ToString() + ":Student saved with this ID.");
                }
            }
        }
        conn.Close();

    }

}