using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class Courses_Offerred : System.Web.UI.Page
{
    MySql.Data.MySqlClient.MySqlConnection conn;
    MySql.Data.MySqlClient.MySqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        { 
        GetDepartment();
        }
    }

protected void ddldepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        int get_departmentID;
        string get_departmentName;
        GridView1.Visible = false;
        get_departmentID = Convert.ToInt32(ddldepartment.SelectedValue.ToString());
        get_departmentName = ddldepartment.SelectedItem.Text;
        
        if (get_departmentID!=0)
        {
            string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
            conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
            cmd = new MySql.Data.MySqlClient.MySqlCommand("Select CourseID,CourseName from tblCourseDetails where DepartmentID='" +get_departmentID+"'", conn);
            MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
            DataTable ds = new DataTable();
            try
            {
                conn.Open();

                adp.Fill(ds);

                ddlCourse.DataSource = ds;
                ddlCourse.DataTextField = "CourseName";
                ddlCourse.DataValueField = "CourseID";
                ddlCourse.DataBind();
                
                ddlCourse.Items.Insert(0, new ListItem("Select Course", "0"));
                
                conn.Close();

            }
            catch
            {
                string script = "alert(\"Unexpected Error Occured\")";
                ScriptManager.RegisterStartupScript(this, GetType(),
                  "ServerControlScript", script, true);
                
            }
        }
        else
        { ddlCourse.Items.Insert(0, "Select Course");
            ddlCourse.DataBind();
        }
    }
protected void ddlcourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        ViewState["Filter"] = ddlCourse.SelectedValue;
        BindGrid();
    }
private void GetDepartment()
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
        ddldepartment.Items.Insert(0, new ListItem("Select Department", "0"));
        ddlCourse.Items.Insert(0, new ListItem("Select Course", "0"));
            conn.Close();

    }
    catch
    {
            string script1 = "alert(\"Unexpected Error Occured\")";
            ScriptManager.RegisterStartupScript(this, GetType(),
              "ServerControlScript", script1, true);
    }
}

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.BindGrid();
    }

    private void BindGrid()
    {
        DataTable dt = new DataTable();
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        cmd = new MySql.Data.MySqlClient.MySqlCommand("uspSubjectDetailsGetforCourses", conn);
        cmd.Parameters.AddWithValue("in_Filter", ViewState["Filter"].ToString());
        cmd.CommandType = CommandType.StoredProcedure;
        MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
        cmd.Connection = conn;
        sda.SelectCommand = cmd;
        sda.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();

    }
}