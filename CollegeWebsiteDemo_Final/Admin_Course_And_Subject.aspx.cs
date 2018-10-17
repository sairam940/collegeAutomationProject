using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class Admin_Course_And_Subject : System.Web.UI.Page
{
    MySql.Data.MySqlClient.MySqlConnection conn;
    MySql.Data.MySqlClient.MySqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        if (!IsPostBack)
        {
            BindCourseGrid();
            BindddlCourseProducts();
        }

    }



    protected void btnCourseInsert_Click(object sender, EventArgs e)
    {
        reqinsCourseCode.Enabled = true;
        reqinsCoursType.Enabled = true;
        reqinsCourseName.Enabled = true;
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        conn.Open();
        using (conn)
        {
            using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspCourseInsert", conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("i_CourseCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtinsCourseCode.Text.Trim();
                cmd.Parameters.Add("i_CourseType", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtinsCourseType.Text.Trim();
                cmd.Parameters.Add("i_CourseName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtinsCourseName.Text;
                cmd.Parameters.Add("in_Filter", MySql.Data.MySqlClient.MySqlDbType.Int32).Value = Convert.ToInt32(ViewState["Filter"].ToString());
                cmd.Parameters.Add("i_AdminID", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToInt32(Session["AdminId"]);
                cmd.Parameters.Add("o_CourseID", MySql.Data.MySqlClient.MySqlDbType.Int32);
                cmd.Parameters["o_CourseID"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("o_isSameCourseCodeExists", MySql.Data.MySqlClient.MySqlDbType.Int32);
                cmd.Parameters["o_isSameCourseCodeExists"].Direction = ParameterDirection.Output;

                if (cmd.ExecuteNonQuery() > 0)
                {
                    if (Convert.ToInt32(cmd.Parameters["o_isSameCourseCodeExists"].Value) == 0)
                    {
                        string script = "alert(\"The Course is Saved\")";
                        ScriptManager.RegisterStartupScript(this, GetType(),
                          "ServerControlScript", script, true);
                    }
                }
                else if (Convert.ToInt32(cmd.Parameters["o_isSameCourseCodeExists"].Value) == 1)
                {
                    string script2 = "alert(\"This Course Code already Exists. Please enter other Course Code\")";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                      "ServerControlScript", script2, true);
                }
                else
                {
                    string script3 = "alert(\"Error in saving the data\")";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                      "ServerControlScript", script3, true);
                }
            }
        }
        conn.Close();
        BindCourseGrid();
    }

    protected void btnCourseClearFields_Click(object sender, EventArgs e)
    {
        txtinsCourseCode.Text = "";
        txtinsCourseName.Text = "";
        txtinsCourseType.Text = "";
    }

    protected void btnCourseUpdate_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvCoursegrid.Rows)
        {
            CheckBox checkbox = (CheckBox)row.FindControl("cbSelectCourse");
            TextBox txtgvCourseCode = (TextBox)row.FindControl("txtgvCourseCode");
            TextBox txtgvCourseType = (TextBox)row.FindControl("txtgvCourseType");
            TextBox txtgvCourseName = (TextBox)row.FindControl("txtgvCourseName");
            int i_AdminID = Convert.ToInt32(Session["AdminId"]);
            if (checkbox.Checked)
            {
                string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
                conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
                conn.Open();
                using (conn)
                {
                    using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspCourseUpdate", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add("i_CourseCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvCourseCode.Text.Trim());
                        cmd.Parameters.Add("i_CourseType", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvCourseType.Text.Trim());
                        cmd.Parameters.Add("i_CourseName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvCourseName.Text);
                        cmd.Parameters.Add("i_AdminID", MySql.Data.MySqlClient.MySqlDbType.Int32).Value = i_AdminID;
                       
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            string script4 = "alert(\"Rows Updated\")";
                            ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script4, true);
                        }
                        else
                        {
                            string script5= "alert(\"Error while updating data\")";
                            ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script5, true);
                        }

                    }
                }
                conn.Close();
                BindCourseGrid();
            }
        }

    }

    protected void btnCourseDelete_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvCoursegrid.Rows)
        {
            CheckBox checkbox = (CheckBox)row.FindControl("cbSelectCourse");
            TextBox txtgvCourseCode = (TextBox)row.FindControl("txtgvCourseCode");
            TextBox txtgvCourseType = (TextBox)row.FindControl("txtgvCourseType");
            TextBox txtgvCourseName = (TextBox)row.FindControl("txtgvCourseName");
            int i_AdminID = Convert.ToInt32(Session["AdminId"]);
            if (checkbox.Checked)
            {

                string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
                conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
                conn.Open();
                using (conn)
                {
                    using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspCourseDelete", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add("i_CourseCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvCourseCode.Text.Trim());
                        cmd.Parameters.Add("i_CourseType", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvCourseType.Text.Trim());
                        cmd.Parameters.Add("i_CourseName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvCourseName.Text);
                        cmd.Parameters.Add("i_AdminID", MySql.Data.MySqlClient.MySqlDbType.Int32).Value = i_AdminID;
                        cmd.Parameters.Add("o_iscoursecodeexists", MySql.Data.MySqlClient.MySqlDbType.Int32);
                        cmd.Parameters["o_iscoursecodeexists"].Direction = ParameterDirection.Output;
                        int BookID = Convert.ToInt32(cmd.Parameters["o_iscoursecodeexists"].Value);

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            if (Convert.ToInt32(cmd.Parameters["o_iscoursecodeexists"].Value) == 0)
                            {
                                string script6 = "alert(\"Rows Deleted\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script6, true);
                                
                            }
                        }
                        else if (Convert.ToInt32(cmd.Parameters["o_iscoursecodeexists"].Value) == 1)
                        {
                            string script7= "alert(\"This Course Code does not exists\")";
                            ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script7, true);
                        }

                        else
                        {
                            string script8 = "alert(\"Error while Deleting the Data\")";
                            ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script8, true);
                        }

                    }
                }
                conn.Close();
                BindCourseGrid();
            }
        }
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        gvCoursegrid.PageIndex = e.NewPageIndex;
        BindCourseGrid();


    }

    protected void ddldepartment_SelectedIndexChanged(object sender, EventArgs e)
    {

        DropDownList ddldepartment = (DropDownList)sender;
        ViewState["Filter"] = ddldepartment.SelectedValue;
        
    }

    private void BindddlCourseProducts()
    {
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        cmd = new MySql.Data.MySqlClient.MySqlCommand("Select DepartmentID,DepartmentName from tbldepartmentdetails", conn);
        MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
        DataTable ds = new DataTable();
        try
        {
            conn.Open();

            adp.Fill(ds);

            ddldepartment.DataSource = ds;
            ddldepartment.DataTextField = "DepartmentName";
            ddldepartment.DataValueField = "DepartmentID";
            ddldepartment.DataBind();
            ddldepartment.Items.Insert(0, new ListItem("SELECT", "SELECT"));
            conn.Close();

        }
        catch
        {
            string script = "alert(\"Unexpected Error Occured\")";
            ScriptManager.RegisterStartupScript(this, GetType(),
              "ServerControlScript", script, true);
            
        }


    }

    private void BindCourseGrid()
    {
        DataTable dt = new DataTable();
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        cmd = new MySql.Data.MySqlClient.MySqlCommand("uspCourseDetailsGet", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
        cmd.Connection = conn;
        sda.SelectCommand = cmd;
        sda.Fill(dt);
        gvCoursegrid.DataSource = dt;
        gvCoursegrid.DataBind();

    }
    public void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Session.RemoveAll();
        Response.Redirect("Admin_Login.aspx");
    }
}