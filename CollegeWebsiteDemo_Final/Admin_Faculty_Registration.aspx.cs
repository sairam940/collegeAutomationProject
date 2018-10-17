using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;


public partial class Admin_Faculty_Registration : System.Web.UI.Page
{
    MySql.Data.MySqlClient.MySqlConnection conn;
    MySql.Data.MySqlClient.MySqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        if (!IsPostBack)
        {
            BindFacultyGrid();
            BindddlSubjectProducts();
        }

    }

    protected void btnFacultyUpdate_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvFacultygrid.Rows)
        {
            CheckBox checkbox = (CheckBox)row.FindControl("cbSelectFaculty");
            TextBox txtgvFacultyCode = (TextBox)row.FindControl("txtgvFacultyCode");
            TextBox txtgvFirstName = (TextBox)row.FindControl("txtgvFirstName");
            TextBox txtgvLastName = (TextBox)row.FindControl("txtgvLastName");
            TextBox txtgvQualification = (TextBox)row.FindControl("txtgvQualification");
            TextBox txtgvDesignation = (TextBox)row.FindControl("txtgvDesignation");
            int i_AdminID = Convert.ToInt32(Session["AdminId"]);
            if (checkbox.Checked)
            {
                string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
                conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
                conn.Open();
                using (conn)
                {
                    using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspFacultyUpdate", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add("i_FacultyCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvFacultyCode.Text.Trim());
                        cmd.Parameters.Add("i_FacultyFirstName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvFirstName.Text.Trim());
                        cmd.Parameters.Add("i_FacultyLastName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvLastName.Text.Trim());
                        cmd.Parameters.Add("i_Qualification", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvQualification.Text.Trim());
                        cmd.Parameters.Add("i_Designation", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvDesignation.Text.Trim());

                        if (cmd.ExecuteNonQuery() > 0)
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
                BindFacultyGrid();
            }
        }

    }

    protected void btnFacultyDelete_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvFacultygrid.Rows)
        {
            CheckBox checkbox = (CheckBox)row.FindControl("cbSelectFaculty");
            TextBox txtgvFacultyCode = (TextBox)row.FindControl("txtgvFacultyCode");
            TextBox txtgvFirstName = (TextBox)row.FindControl("txtgvFirstName");
            TextBox txtgvLastName = (TextBox)row.FindControl("txtgvLastName");
            TextBox txtgvQualification = (TextBox)row.FindControl("txtgvQualification");
            TextBox txtgvDesignation = (TextBox)row.FindControl("txtgvDesignation");
            int i_AdminID = Convert.ToInt32(Session["AdminId"]);
            if (checkbox.Checked)
            {

                string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
                conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
                conn.Open();
                using (conn)
                {
                    using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspFacultyDelete", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add("i_FacultyCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvFacultyCode.Text.Trim());
                        cmd.Parameters.Add("i_FacultyFirstName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvFirstName.Text.Trim());
                        cmd.Parameters.Add("i_FacultyLastName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvLastName.Text.Trim());
                        cmd.Parameters.Add("i_Qualification", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvQualification.Text.Trim());
                        cmd.Parameters.Add("i_Designation", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvDesignation.Text.Trim());


                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            string script2= "alert(\"Rows Deleted\")";
                            ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script2, true);
                            
                        }
                        else
                        {
                            string script3 = "alert(\"This Faculty does not exists\")";
                            ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script3, true);
                        }
                    }
                }
                conn.Close();
                BindFacultyGrid();
            }
        }

    }

    protected void btnFacultyInsert_Click(object sender, EventArgs e)
    {
        reqinsFacultyCode.Enabled = true;
        reqinsFacultyFirstName.Enabled = true;
        reqinsFacultyLastName.Enabled = true;
        reqinsQualification.Enabled = true;
        reqinsDesignation.Enabled = true;
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        conn.Open();
        using (conn)
        {
            using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspFacultyInsert", conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("i_FacultyCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtinsFacultyCode.Text.Trim();
                cmd.Parameters.Add("i_FacultyFirstName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtinsFacultyFirstName.Text;
                cmd.Parameters.Add("i_FacultyLastName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtinsFacultyLastName.Text;
                cmd.Parameters.Add("i_Qualification", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtinsQualification.Text;
                cmd.Parameters.Add("i_Designation", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtinsDesignation.Text;
                cmd.Parameters.Add("o_FacultyID", MySql.Data.MySqlClient.MySqlDbType.Int32);
                cmd.Parameters["o_FacultyID"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("o_isSameFacultyCodeExists", MySql.Data.MySqlClient.MySqlDbType.Int32);
                cmd.Parameters["o_isSameFacultyCodeExists"].Direction = ParameterDirection.Output;

                if (cmd.ExecuteNonQuery() > 0)
                {
                    if (Convert.ToInt32(cmd.Parameters["o_isSameFacultyCodeExists"].Value) == 0)
                    {
                        string script3 = "alert(\"The Faculty is Saved\")";
                        ScriptManager.RegisterStartupScript(this, GetType(),
                          "ServerControlScript", script3, true);
                        
                    }
                }
                else if (Convert.ToInt32(cmd.Parameters["o_isSameFacultyCodeExists"].Value) == 1)
                {
                    string script4 = "alert(\"This Faculty Code already Exists. Please enter any other Faculty Code\")";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                      "ServerControlScript", script4, true);
                }
                else
                {
                    string script5 = "alert(\"Error in saving the data\")";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                      "ServerControlScript", script5, true);
                    
                }
            }
        }
        conn.Close();
        BindFacultyGrid();
    }

    protected void btnFacultyClearFields_Click(object sender, EventArgs e)
    {
        txtinsDesignation.Text = "";
        txtinsFacultyCode.Text = "";
        txtinsFacultyFirstName.Text = "";
        txtinsFacultyLastName.Text = "";
        txtinsQualification.Text = "";
       
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        gvFacultygrid.PageIndex = e.NewPageIndex;
    }

    protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddlSubject = (DropDownList)sender;
        ViewState["Filter"] = ddlSubject.SelectedValue;
    }

    private void BindFacultyGrid()
    {
        DataTable dt = new DataTable();
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        cmd = new MySql.Data.MySqlClient.MySqlCommand("uspFacultyDetailsGet", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
        cmd.Connection = conn;
        sda.SelectCommand = cmd;
        sda.Fill(dt);
        gvFacultygrid.DataSource = dt;
        gvFacultygrid.DataBind();

    }

    private void BindddlSubjectProducts()
    {
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        cmd = new MySql.Data.MySqlClient.MySqlCommand("Select SubjectID,SubjectName from tblSubjectDetails", conn);
        MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
        DataTable ds = new DataTable();
        try
        {
            conn.Open();

            adp.Fill(ds);

            ddlSubject.DataSource = ds;
            ddlSubject.DataTextField = "SubjectName";
            ddlSubject.DataValueField = "SubjectID";
            ddlSubject.DataBind();
            ddlSubject.Items.Insert(0, new ListItem("SELECT", "SELECT"));
            conn.Close();
        }
        catch
        {
            string script6 = "alert(\"Unexpected Error Occured\")";
            ScriptManager.RegisterStartupScript(this, GetType(),
              "ServerControlScript", script6, true);
            
        }
    }

    protected void btnAssignSubject_Click(object sender, EventArgs e)
    {
        reqAssignFacultyCode.Enabled = true;

        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        conn.Open();
        using (conn)
        {
            using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspFacultyAssignInsert", conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("i_AssignFacultyCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtAssignFacultyCode.Text.Trim();
                cmd.Parameters.Add("in_Filter", MySql.Data.MySqlClient.MySqlDbType.Int32).Value = Convert.ToInt32(ViewState["Filter"].ToString());
                cmd.Parameters.Add("o_isSameSubjectCodeAssigned", MySql.Data.MySqlClient.MySqlDbType.Int32);
                cmd.Parameters["o_isSameSubjectCodeAssigned"].Direction = ParameterDirection.Output;
            }
            if (cmd.ExecuteNonQuery() > 0)
            {
                if (Convert.ToInt32(cmd.Parameters["o_isSameSubjectCodeAssigned"].Value) == 0)
                {
                    string script7 = "alert(\"The Subject is assigned to the faculty\")";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                      "ServerControlScript", script7, true);
                    
                }
            }
            else 
            {
                string script8 = "alert(\"Error in saving the data\")";
                ScriptManager.RegisterStartupScript(this, GetType(),
                  "ServerControlScript", script8, true);
            }
           
            
            
        }
        conn.Close();
        BindFacultyGrid();
    }

    public void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Session.RemoveAll();
        Response.Redirect("Admin_Login.aspx");
    }
}