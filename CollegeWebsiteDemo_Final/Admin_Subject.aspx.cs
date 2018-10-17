using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class Admin_Subject : System.Web.UI.Page
{

    MySql.Data.MySqlClient.MySqlConnection conn;
    MySql.Data.MySqlClient.MySqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;

        if (!IsPostBack)
        {
            BindSubjectGrid();
        }


    }
    public void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Session.RemoveAll();
        Response.Redirect("Admin_Login.aspx");
    }

    private void BindSubjectGrid()
    {
        DataTable dt = new DataTable();
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        cmd = new MySql.Data.MySqlClient.MySqlCommand("uspSubjectDetailsGet", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
        cmd.Connection = conn;
        sda.SelectCommand = cmd;
        sda.Fill(dt);
        gvSubjectgrid.DataSource = dt;
        gvSubjectgrid.DataBind();

    }

    protected void btnSubjectInsert_Click(object sender, EventArgs e)
    {
        reqinsSubjectCode.Enabled = true;
        reqinsCourseCode.Enabled = true;
        reqinsDepartmentCode.Enabled = true;
        reqinsSubjectName.Enabled = true;
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        conn.Open();
        using (conn)
        {
            using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspSubjectInsert", conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("i_SubjectCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtinsSubjectCode.Text.Trim();
                cmd.Parameters.Add("i_DepartmentCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtinsDepartmentCode.Text.Trim();
                cmd.Parameters.Add("i_CourseCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtinsCourseCode.Text;
                cmd.Parameters.Add("i_SubjectName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtinsSubjectName.Text.Trim();
                cmd.Parameters.Add("i_AdminID", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToInt32(Session["AdminId"]);
                cmd.Parameters.Add("o_SubjectID", MySql.Data.MySqlClient.MySqlDbType.Int32);
                cmd.Parameters["o_SubjectID"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("o_isSameSubjectCodeExists", MySql.Data.MySqlClient.MySqlDbType.Int32);
                cmd.Parameters["o_isSameSubjectCodeExists"].Direction = ParameterDirection.Output;

                if (cmd.ExecuteNonQuery() > 0)
                {
                    if (Convert.ToInt32(cmd.Parameters["o_isSameSubjectCodeExists"].Value) == 0)
                    {
                        string script = "alert(\"The Course is Saved\")";
                        ScriptManager.RegisterStartupScript(this, GetType(),
                          "ServerControlScript", script, true);
                        
                    }
                }
                else if (Convert.ToInt32(cmd.Parameters["o_isSameSubjectCodeExists"].Value) == 1)
                {
                    string script1 = "alert(\"This Course Code already Exists. Please enter other Course Code\")";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                      "ServerControlScript", script1, true);
                    
                }
                else
                {
                    string script2 = "alert(\"Error in saving the data\")";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                      "ServerControlScript", script2, true);
                    
                }
            }
        }
        conn.Close();
        BindSubjectGrid();

    }

    protected void btnSubjectClearFields_Click(object sender, EventArgs e)
    {
        txtinsCourseCode.Text = "";
        txtinsDepartmentCode.Text = "";
        txtinsSubjectCode.Text = "";
        txtinsSubjectName.Text = "";
    }

    protected void btnSubjectUpdate_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvSubjectgrid.Rows)
        {
            CheckBox checkbox = (CheckBox)row.FindControl("cbSelectSubject");
            TextBox txtgvSubjectCode = (TextBox)row.FindControl("txtgvSubjectCode");
            TextBox txtgvDepartmentCode = (TextBox)row.FindControl("txtgvDepartmentCode");
            TextBox txtgvCourseCode = (TextBox)row.FindControl("txtgvCourseCode");
            TextBox txtgvSubjectName = (TextBox)row.FindControl("txtgvSubjectName");
            int i_AdminID = Convert.ToInt32(Session["AdminId"]);
            if (checkbox.Checked)
            {
                string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
                conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
                conn.Open();
                using (conn)
                {
                    using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspSubjectUpdate", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add("i_SubjectCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvSubjectCode.Text.Trim());
                        cmd.Parameters.Add("i_DepartmentCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvDepartmentCode.Text.Trim());
                        cmd.Parameters.Add("i_CourseCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvCourseCode.Text.Trim());
                        cmd.Parameters.Add("i_SubjectName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvSubjectName.Text.Trim());
                        cmd.Parameters.Add("i_AdminID", MySql.Data.MySqlClient.MySqlDbType.Int32).Value = i_AdminID;

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            string script4 = "alert(\"Rows Updated\")";
                            ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script4, true);
                        }
                        else
                        {
                            string script5 = "alert(\"Error while updating data\")";
                            ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script5, true);
                        }

                    }
                }
                conn.Close();
                BindSubjectGrid();


            }
        }

    }

    protected void btnSubjectDelete_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvSubjectgrid.Rows)
        {
            CheckBox checkbox = (CheckBox)row.FindControl("cbSelectSubject");
            TextBox txtgvSubjectCode = (TextBox)row.FindControl("txtgvSubjectCode");
            TextBox txtgvDepartmentCode = (TextBox)row.FindControl("txtgvDepartmentCode");
            TextBox txtgvCourseCode = (TextBox)row.FindControl("txtgvCourseCode");
            TextBox txtgvSubjectName = (TextBox)row.FindControl("txtgvSubjectName");
            int i_AdminID = Convert.ToInt32(Session["AdminId"]);
            if (checkbox.Checked)
            {

                string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
                conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
                conn.Open();
                using (conn)
                {
                    using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspSubjectDelete", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add("i_SubjectCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvSubjectCode.Text.Trim());
                        cmd.Parameters.Add("i_DepartmentCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvDepartmentCode.Text.Trim());
                        cmd.Parameters.Add("i_CourseCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvCourseCode.Text.Trim());
                        cmd.Parameters.Add("i_SubjectName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvSubjectName.Text);
                        cmd.Parameters.Add("i_AdminID", MySql.Data.MySqlClient.MySqlDbType.Int32).Value = i_AdminID;
                        cmd.Parameters.Add("o_issubjectcodeexists", MySql.Data.MySqlClient.MySqlDbType.Int32);
                        cmd.Parameters["o_issubjectcodeexists"].Direction = ParameterDirection.Output;
                        int BookID = Convert.ToInt32(cmd.Parameters["o_issubjectcodeexists"].Value);

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            if (Convert.ToInt32(cmd.Parameters["o_issubjectcodeexists"].Value) == 1)
                            {
                                string script5 = "alert(\"Rows Deleted\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script5, true);
                                
                            }
                        }
                        else if (Convert.ToInt32(cmd.Parameters["o_issubjectcodeexists"].Value) == 0)
                        {
                            string script5 = "alert(\"This subject Code does not exists\")";
                            ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script5, true);
                            
                        }

                        else
                        {
                            string script5 = "alert(\"Error while Deleting the Data\")";
                            ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script5, true);
                        }

                    }
                }
                conn.Close();
                BindSubjectGrid();
            }
        }

    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        gvSubjectgrid.PageIndex = e.NewPageIndex;
        BindSubjectGrid();

    }

    //    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    //    {
    //        if (e.Row.RowType == DataControlRowType.DataRow)
    //        {
    //            if (e.Row.RowType == DataControlRowType.DataRow)
    //            {
    //                //Find the DropDownList in the Row
    //                DropDownList ddlgvDepartment = (e.Row.FindControl("ddlgvDepartment") as DropDownList);
    //                DropDownList ddlgvCourse = (e.Row.FindControl("ddlgvCourse") as DropDownList);
    //                ddlgvDepartment.DataSource = GetData();
    //                ddlgvDepartment.DataTextField = "DepartmentName";
    //                ddlgvDepartment.DataValueField = "DepartmentName";
    //                ddlgvDepartment.DataBind();

    //                //Add Default Item in the DropDownList
    //                ddlgvDepartment.Items.Insert(0, new ListItem("Please select"));

    //                //Select the Country of Customer in DropDownList
    //                string Department = (e.Row.FindControl("lblgvDepartment") as Label).Text;
    //                ddlgvDepartment.Items.FindByValue(Department).Selected = true;

    //                ddlgvCourse.DataSource = GetData();
    //                ddlgvCourse.DataTextField = "CourseName";
    //                ddlgvCourse.DataValueField = "CourseName";
    //                ddlgvCourse.DataBind();

    //                //Add Default Item in the DropDownList
    //                ddlgvCourse.Items.Insert(0, new ListItem("Please select"));

    //                //Select the Country of Customer in DropDownList
    //                string Course = (e.Row.FindControl("lblgvCourse") as Label).Text;
    //                ddlgvCourse.Items.FindByValue(Course).Selected = true;
    //            }
    //        }
    //    }
}