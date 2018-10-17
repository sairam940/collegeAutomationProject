using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class Login : System.Web.UI.Page
{
    string username;
    int userid;
    MySql.Data.MySqlClient.MySqlConnection conn;
    MySql.Data.MySqlClient.MySqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            GetDepartment();
            BindGrid2();
        }
        BindGrid2();
        btnEnroll.Visible = false;
        btnDeEnroll.Visible = false;
        username = (string)(Session["username"]);
        //lblHello.Text = username;
        userid = (int)Session["userid"];
        //lblstudentid.Text = userid.ToString();
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        conn.Open();
        using (conn)
        {
            using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspStudentDetailsGet", conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("i_StudentID", MySql.Data.MySqlClient.MySqlDbType.Int32).Value = userid;
                cmd.Parameters.Add("o_FirstName", MySql.Data.MySqlClient.MySqlDbType.VarChar);
                cmd.Parameters["o_FirstName"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("o_LastName", MySql.Data.MySqlClient.MySqlDbType.VarChar);
                cmd.Parameters["o_LastName"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("o_EmailAddress", MySql.Data.MySqlClient.MySqlDbType.VarChar);
                cmd.Parameters["o_EmailAddress"].Direction = ParameterDirection.Output;
                cmd.Parameters.Add("o_ContactNumber", MySql.Data.MySqlClient.MySqlDbType.VarChar);
                cmd.Parameters["o_ContactNumber"].Direction = ParameterDirection.Output;
                cmd.ExecuteNonQuery();
                lblFirstName.Text = cmd.Parameters["o_FirstName"].Value.ToString();
                lbllastname.Text = cmd.Parameters["o_LastName"].Value.ToString();
                lblemailaddress.Text = cmd.Parameters["o_EmailAddress"].Value.ToString();
                lblcontactnumber.Text = cmd.Parameters["o_ContactNumber"].Value.ToString();
               
            }

        }
        conn.Close();
    }
    protected void ddldepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        int get_departmentID;
        string get_departmentName;
        GridView1.Visible = false;
        btnEnroll.Visible = false;
        btnDeEnroll.Visible = false;
        get_departmentID = Convert.ToInt32(ddldepartment.SelectedValue.ToString());
        get_departmentName = ddldepartment.SelectedItem.Text;

        if (get_departmentID != 0)
        {
            string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
            conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
            cmd = new MySql.Data.MySqlClient.MySqlCommand("Select CourseID,CourseName from tblCourseDetails where DepartmentID='" + get_departmentID + "'", conn);
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
                Response.Write("Unexpected Error Occured");
            }
        }
        else
        {
            ddlCourse.Items.Insert(0, "Select Course");
            ddlCourse.DataBind();
        }
    }
    protected void ddlcourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        btnEnroll.Visible = true;
        btnDeEnroll.Visible = true;
        ViewState["Filter"] = ddlCourse.SelectedValue;
        BindGrid();
        BindGrid2();
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
            Response.Write("Unexpected Error Occured");
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
        btnEnroll.Visible = true;
        btnDeEnroll.Visible = true;
    }

    private void BindGrid2()
    {
        DataTable dt = new DataTable();
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        cmd = new MySql.Data.MySqlClient.MySqlCommand("uspSubjectDetailsGetforStudent", conn);
        cmd.Parameters.Add("i_StudentID", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = (int)Session["userid"];
        cmd.CommandType = CommandType.StoredProcedure;
        MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
        cmd.Connection = conn;
        sda.SelectCommand = cmd;
        sda.Fill(dt);
        GridView2.DataSource = dt;
        GridView2.DataBind();
        
    }

    public void btnEnroll_Click(object sender, EventArgs e)
    {
        BindCheckBoxSelectedEnroll();

    }

    public void btnDeEnroll_Click(object sender, EventArgs e)
    {
        BindCheckBoxSelectedDeEnroll();
    }

    private void BindCheckBoxSelectedEnroll()
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox checkbox = (CheckBox)row.FindControl("cbSelectSubject");
            if (checkbox.Checked)
            {
                string i_SubjectCode = Convert.ToString(GridView1.DataKeys[row.RowIndex].Value);
                string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
                conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
                conn.Open();
                using (conn)
                {
                    using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspSubjectEnroll", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add("i_SubjectCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = i_SubjectCode; 
                        cmd.Parameters.Add("i_StudentID", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = (int)Session["userid"]; 
                        cmd.Parameters.Add("o_SubjectAlreadyEnrolled", MySql.Data.MySqlClient.MySqlDbType.Int32);
                        cmd.Parameters["o_SubjectAlreadyEnrolled"].Direction = ParameterDirection.Output;
                      
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            if (Convert.ToInt32(cmd.Parameters["o_SubjectAlreadyEnrolled"].Value) == 1)
                            {
                                string script2 = "alert(\"This Subject is already taken by you.You cannot enroll the same Subject twice\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script2, true);

                            }

                            
                            else 
                            {
                                string script5 = "alert(\"This subject is available for you\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script5, true);

                            }

                        }
                        else
                        {
                            if (Convert.ToInt32(cmd.Parameters["o_SubjectAlreadyEnrolled"].Value) == 1)
                            {
                                string script6 = "alert(\"This Subject is already taken by you.You cannot enroll the same Subject twice\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script6, true);

                            }
                            //Response.Write("Error while Processing your request");
                        }
                    }
                }
                conn.Close();

            }


        }

        BindGrid();
        BindGrid2();

    }

    private void BindCheckBoxSelectedDeEnroll()
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox checkbox = (CheckBox)row.FindControl("cbSelectSubject");
            if (checkbox.Checked)
            {
                string i_SubjectCode = Convert.ToString(GridView1.DataKeys[row.RowIndex].Value);
                string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
                conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
                conn.Open();
                using (conn)
                {
                    using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspSubjectdeEnroll", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add("i_SubjectCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = i_SubjectCode;
                        cmd.Parameters.Add("i_StudentID", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = (int)Session["userid"];
                        cmd.Parameters.Add("o_SubjectAlreadyEnrolled", MySql.Data.MySqlClient.MySqlDbType.Int32);
                        cmd.Parameters["o_SubjectAlreadyEnrolled"].Direction = ParameterDirection.Output;
                        
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            if (Convert.ToInt32(cmd.Parameters["o_SubjectAlreadyEnrolled"].Value) == 0)
                            {
                                string script2 = "alert(\"This Subject is either not enrolled by you\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script2, true);

                            }


                            else
                            {
                                string script5 = "alert(\"This subject is withdrawed\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script5, true);

                            }

                        }
                        else
                        {
                            if (Convert.ToInt32(cmd.Parameters["o_SubjectAlreadyEnrolled"].Value) == 0)
                            {
                                string script6 = "alert(\"This Subject is either not enrolled by you\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script6, true);

                            }

                            else 
                            {
                                string script6 = "alert(\"Error while processing data\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script6, true);

                            }
                            //Response.Write("Error while Processing your request");
                        }
                    }
                }
                conn.Close();

            }


        }

        BindGrid();
        BindGrid2();

    }
    public void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Session.RemoveAll();
        Response.Redirect("Default.aspx");
    }


}