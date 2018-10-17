using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class Admin_Department : System.Web.UI.Page
{
    MySql.Data.MySqlClient.MySqlConnection conn;
    MySql.Data.MySqlClient.MySqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        if(!IsPostBack)
        {
            BindDepartmentGrid();
        }


    }

    protected void btnDepartmentUpdate_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvDepartment.Rows)
        {
            CheckBox checkbox = (CheckBox)row.FindControl("cbSelectDepartment");
            TextBox txtgvDepartmentCode = (TextBox)row.FindControl("txtgvDepartmentCode");
            TextBox txtgvDepartmentName = (TextBox)row.FindControl("txtgvDepartmentName");
            int i_AdminID = Convert.ToInt32(Session["AdminId"]);
            if (checkbox.Checked)
            {
                string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
                conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
                conn.Open();
                using (conn)
                {
                    using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspDepartmentUpdate", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add("i_DepartmentCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvDepartmentCode.Text.Trim());
                        cmd.Parameters.Add("i_DepartmentName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvDepartmentName.Text);
                        cmd.Parameters.Add("i_AdminID", MySql.Data.MySqlClient.MySqlDbType.Int32).Value = i_AdminID;
                        //cmd.Parameters.Add("o_SameBookCode", MySql.Data.MySqlClient.MySqlDbType.Int32);
                        //cmd.Parameters["o_SameBookCode"].Direction = ParameterDirection.Output;

                        if (cmd.ExecuteNonQuery() > 0 )  
                        {
                            string script = "alert(\"Rows Updated\")";
                            ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script, true);
                            
                        }
                        else
                        {
                            string script1 = "alert(\"Error while updating data\")";
                            ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script1, true);
                        }

                    }
                }
                conn.Close();
                BindDepartmentGrid();
            }
        }
     }


    protected void btnDepartmentDelete_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvDepartment.Rows)
        {
            CheckBox checkbox = (CheckBox)row.FindControl("cbSelectDepartment");
            TextBox txtgvDepartmentCode = (TextBox)row.FindControl("txtgvDepartmentCode");
            TextBox txtgvDepartmentName = (TextBox)row.FindControl("txtgvDepartmentName");
            int i_AdminID = Convert.ToInt32(Session["AdminId"]);
            if (checkbox.Checked)
            {

                string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
                conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
                conn.Open();
                using (conn)
                {
                    using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspDepartmentDelete", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add("i_DepartmentCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvDepartmentCode.Text.Trim());
                        cmd.Parameters.Add("i_DepartmentName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvDepartmentName.Text);
                        cmd.Parameters.Add("i_AdminID", MySql.Data.MySqlClient.MySqlDbType.Int32).Value = i_AdminID;
                        cmd.Parameters.Add("o_isbookcodeexists", MySql.Data.MySqlClient.MySqlDbType.Int32);
                        cmd.Parameters["o_isbookcodeexists"].Direction = ParameterDirection.Output;
                        int BookID = Convert.ToInt32(cmd.Parameters["o_isbookcodeexists"].Value);

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            if(Convert.ToInt32(cmd.Parameters["o_isbookcodeexists"].Value) == 0)
                            {
                                string script2 = "alert(\"Rows Deleted\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script2, true);
                                
                            }
                        }
                        else if(Convert.ToInt32(cmd.Parameters["o_isbookcodeexists"].Value) == 1) 
                        {
                            string script3 = "alert(\"This Department Code does not exists\")";
                            ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script3, true);
                            
                        }

                       else
                        {
                            string script4= "alert(\"Error while Deleting the Data\")";
                            ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script4, true);
                            
                        }

                    }
                }
                conn.Close();
                BindDepartmentGrid();
            }
        }
    }

    protected void btnDepartmentInsert_Click(object sender, EventArgs e)
        {
        reqinsDepartmentCode.Enabled =true;
        reqinsDepartmentName.Enabled = true;
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        conn.Open();
        using (conn)
        {
            using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspDepartmentInsert", conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("i_DepartmentCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtinsDepartmentCode.Text.Trim();
                cmd.Parameters.Add("i_DepartmentName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtinsDepartmentName.Text;
                cmd.Parameters.Add("i_AdminID", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToInt32(Session["AdminId"]);
                cmd.Parameters.Add("o_DepartmentID", MySql.Data.MySqlClient.MySqlDbType.Int32);
                cmd.Parameters["o_DepartmentID"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("o_isSameDepartmentCodeExists", MySql.Data.MySqlClient.MySqlDbType.Int32);
                cmd.Parameters["o_isSameDepartmentCodeExists"].Direction = ParameterDirection.Output;

                if (cmd.ExecuteNonQuery() > 0)
                {
                    if(Convert.ToInt32(cmd.Parameters["o_isSameDepartmentCodeExists"].Value) == 0)
                    { 
                    Response.Write("The Department is Saved");
                    }
                }
                else if (Convert.ToInt32(cmd.Parameters["o_isSameDepartmentCodeExists"].Value) == 1)
                {
                    Response.Write("This Department Code already Exists. Please enter other Department Code");
                }
                else
                {
                    Response.Write("Error in saving the data");
                }
            }
        }
        conn.Close();
        BindDepartmentGrid();
    }

    protected void btnDepartmentClearFields_Click(object sender, EventArgs e)
    {
        txtinsDepartmentCode.Text ="";
        txtinsDepartmentName.Text = "";
    }



    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        gvDepartment.PageIndex = e.NewPageIndex;
        this.BindDepartmentGrid();
    }
    private void BindDepartmentGrid()
    {
        DataTable dt = new DataTable();
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        cmd = new MySql.Data.MySqlClient.MySqlCommand("uspDepartmentDetailsGet", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
        cmd.Connection = conn;
        sda.SelectCommand = cmd;
        sda.Fill(dt);
        gvDepartment.DataSource = dt;
        gvDepartment.DataBind();

    }

    public void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Session.RemoveAll();
        Response.Redirect("Admin_Login.aspx");
    }
}