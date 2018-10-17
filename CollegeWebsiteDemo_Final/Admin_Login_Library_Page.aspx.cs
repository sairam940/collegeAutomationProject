using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class Admin_Login_Library_Page : System.Web.UI.Page
{
    MySql.Data.MySqlClient.MySqlConnection conn;
    MySql.Data.MySqlClient.MySqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        //string AdminName = Session["AdminName"].ToString();

        // Response.Write("Welcome    " +AdminName);

        /* if(!IsPostBack)
         { 
         BindInsertProducts();
         }*/
        ViewState["InsertFilter"] = ddlinsdepartment.SelectedValue;

        if (!IsPostBack)
        {
            ddlinsdepartment.Items.Insert(0, new ListItem("Select Department", "0"));
            ViewState["InsertFilter"] = ddlinsdepartment.SelectedValue;
            BindInsertProducts();
        }

        lblDepartment.Visible = false;
        ddldepartment.Visible = false;
        lblBookCode.Visible = false;
        txtBookCode.Visible = false;
        btnBookCodeSearch.Visible = false;
        btnBookCodeClearFields.Visible = false;
        //lblStudentID.Visible = false;
        //txtStudentID.Visible = false;
        //btnTake.Visible = false;
        //btnReturn.Visible = false;

        if (ddlSearchBy.SelectedValue == "Select")
        {
            lblDepartment.Visible = false;
            ddldepartment.Visible = false;
            lblBookCode.Visible = false;
            txtBookCode.Visible = false;
            btnBookCodeSearch.Visible = false;
            btnBookCodeClearFields.Visible = false;
            //lblStudentID.Visible = false;
            //txtStudentID.Visible = false;
            //btnTake.Visible = false;
            //btnReturn.Visible = false;

        }

        if (ddlSearchBy.SelectedValue == "Department")
        {
            lblDepartment.Visible = true;
            ddldepartment.Visible = true;
            lblBookCode.Visible = false;
            txtBookCode.Visible = false;
            btnBookCodeSearch.Visible = false;
            btnBookCodeClearFields.Visible = false;
            //lblStudentID.Visible = true;
            //txtStudentID.Visible = true;
            //btnTake.Visible = true;
            //btnReturn.Visible = true;
            if (ddldepartment.SelectedValue == "ALL")
            {
                BindProducts();
                ViewState["Filter"] = "ALL";
                //BindGrid();
                GridView1.Visible = true;
                btnUpdate.Visible = true;
                btnDelete.Visible = true;
            }
        }

        else if (ddlSearchBy.SelectedValue == "BookCode")
        {
            lblDepartment.Visible = false;
            ddldepartment.Visible = false;
            lblBookCode.Visible = true;
            txtBookCode.Visible = true;
            //lblStudentID.Visible = true;
            //txtStudentID.Visible = true;
            //btnTake.Visible = true;
            //btnReturn.Visible = true;
            //BindGridForBookCode();
            GridView1.Visible = true;
            btnUpdate.Visible = true;
            btnDelete.Visible = true;
        }
    }

    protected void ddlSearchBy_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSearchBy.SelectedValue == "Select")
        {
            lblDepartment.Visible = false;
            lblBookCode.Visible = false;
            txtBookCode.Visible = false;
        }

        else if (ddlSearchBy.SelectedValue == "Department")
        {
            lblDepartment.Visible = true;
            ddldepartment.Visible = true;
            lblBookCode.Visible = false;
            txtBookCode.Visible = false;
            if (ddldepartment.SelectedValue == "ALL")
            {
                BindProducts();
                ViewState["Filter"] = "ALL";
                BindGrid();
            }

        }
        else if (ddlSearchBy.SelectedValue == "BookCode")
        {
            lblDepartment.Visible = false;
            ddldepartment.Visible = false;
            lblBookCode.Visible = true;
            txtBookCode.Visible = true;
            btnBookCodeSearch.Visible = true;
            btnBookCodeClearFields.Visible = true;
            GridView1.Visible = true;
            btnUpdate.Visible = true;
            btnDelete.Visible = true;
        }
    }


    protected void ddldepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddldepartment = (DropDownList)sender;
        ViewState["Filter"] = ddldepartment.SelectedValue;
        this.BindGrid();
        GridView1.Visible = true;
        btnUpdate.Visible = true;
        btnDelete.Visible = true;
    }

    /*protected void ddlinsdepartment_SelectedIndexChanged(object sender,EventArgs e)
    {
        DropDownList ddlinsdepartment = (DropDownList)sender;
        ViewState["InsertFilter"] = ddlinsdepartment.SelectedValue;
    }*/

    protected void ddlinsdepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddlinsdepartment = (DropDownList)sender;
        ddlinsdepartment.Items.Insert(0, new ListItem("Select Department", "0"));
        ViewState["InsertFilter"] = ddlinsdepartment.SelectedValue;
    }


    protected void btnBookCodeSearch_Click(object sender, EventArgs e)
    {
        BindGridForBookCode();
        GridView1.Visible = true;
        btnBookCodeSearch.Visible = true;
        btnBookCodeClearFields.Visible = true;
        btnUpdate.Visible = true;
        btnDelete.Visible = true;
    }

    protected void btnBookCodeClearFields_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        btnUpdate.Visible = false;
        btnDelete.Visible = false;
        txtBookCode.Text = "";
        btnBookCodeSearch.Visible = true;
        btnBookCodeClearFields.Visible = true;
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.BindGrid();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox checkbox = (CheckBox)row.FindControl("cbSelect");
            TextBox txtgvBookCode = (TextBox)row.FindControl("txtgvBookCode");
            TextBox txtgvBookName = (TextBox)row.FindControl("txtgvBookName");
            TextBox txtgvBookAvailability = (TextBox)row.FindControl("txtgvBookAvailability");
            int i_AdminID = Convert.ToInt32(Session["AdminId"]);
            if (checkbox.Checked)
            {   
                string i_BookCode = Convert.ToString(GridView1.DataKeys[row.RowIndex].Value);
                string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
                conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
                conn.Open();
                using (conn)
                {
                    using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspBookUpdate", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add("i_BookCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvBookCode.Text.Trim());
                        cmd.Parameters.Add("i_BookName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvBookName.Text);
                        cmd.Parameters.Add("i_BookAvailability", MySql.Data.MySqlClient.MySqlDbType.Int32).Value = Convert.ToInt32(txtgvBookAvailability.Text.Trim());
                        cmd.Parameters.Add("i_AdminID", MySql.Data.MySqlClient.MySqlDbType.Int32).Value = i_AdminID;

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
            }
        }
        if (ddlSearchBy.SelectedValue == "Department")
        {
            BindGrid();
        }

        if (ddlSearchBy.SelectedValue == "BookCode")
        {
            BindGridForBookCode();
        }

    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox checkbox = (CheckBox)row.FindControl("cbSelect");
            TextBox txtgvBookCode = (TextBox)row.FindControl("txtgvBookCode");
            TextBox txtgvBookName = (TextBox)row.FindControl("txtgvBookName");
            TextBox txtgvBookAvailability = (TextBox)row.FindControl("txtgvBookAvailability");
            int i_AdminID = Convert.ToInt32(Session["AdminId"]);
            if (checkbox.Checked)
            {
                string i_BookCode = Convert.ToString(GridView1.DataKeys[row.RowIndex].Value);
                string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
                conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
                conn.Open();
                using (conn)
                {
                    using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspBookDelete", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add("i_BookCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvBookCode.Text.Trim());
                        cmd.Parameters.Add("i_BookName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToString(txtgvBookName.Text);
                        cmd.Parameters.Add("i_BookAvailability", MySql.Data.MySqlClient.MySqlDbType.Int32).Value = Convert.ToInt32(txtgvBookAvailability.Text.Trim());
                        cmd.Parameters.Add("i_AdminID", MySql.Data.MySqlClient.MySqlDbType.Int32).Value = i_AdminID;

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            string script2 = "alert(\"Rows Deleted\")";
                            ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script2, true);
                        }
                        else
                        {
                            string script3 = "alert(\"Error while deleting data\")";
                            ScriptManager.RegisterStartupScript(this, GetType(),
                              "ServerControlScript", script3, true);
                        }

                    }
                }
                conn.Close();
            }
        }
        if (ddlSearchBy.SelectedValue == "Department")
        {
            BindGrid();
        }

        if (ddlSearchBy.SelectedValue == "BookCode")
        {
            BindGridForBookCode();
        }

    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        reqinsBookAvailability.Enabled = true;
        reqinsbookcode.Enabled = true;
        reqinsBookName.Enabled = true;
        reqinsmaxBookAvailability.Enabled = true;
    string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
    conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        conn.Open();
        using (conn)
        {
            using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspBookInsert", conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("i_BookCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtinsBookCode.Text.Trim();
                cmd.Parameters.Add("i_DepartmentID", MySql.Data.MySqlClient.MySqlDbType.Int32).Value = Convert.ToInt32(ViewState["InsertFilter"]);
                cmd.Parameters.Add("i_BookName", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtinsBookName.Text.Trim();
                cmd.Parameters.Add("i_BookAvailability", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtinsBookAvailability.Text.Trim();
                cmd.Parameters.Add("i_AdminID", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToInt32(Session["AdminId"]);
                cmd.Parameters.Add("i_MaxBookAvailability", MySql.Data.MySqlClient.MySqlDbType.Int32).Value = Convert.ToInt32(txtinsmaxBookAvailability.Text.Trim());
                cmd.Parameters.Add("o_BookID", MySql.Data.MySqlClient.MySqlDbType.Int32);
                cmd.Parameters["o_BookID"].Direction = ParameterDirection.Output;

                if (cmd.ExecuteNonQuery() > 0)
                {
                    string script4 = "alert(\"The Book is Saved\")";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                      "ServerControlScript", script4, true);
                    
                }
            }
        }
        conn.Close();

    }

    protected void btnClearInsertFields_Click(object sender, EventArgs e)
    {
        txtinsBookCode.Text = "";
        txtinsBookName.Text = "";
        txtinsBookAvailability.Text = "";
        txtinsmaxBookAvailability.Text = "";
    }


    private void BindProducts()
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
            ddldepartment.Items.Insert(0, new ListItem("ALL", "ALL"));
            conn.Close();

        }
        catch
        {
            string script5 = "alert(\"Unexpected Error Occured\")";
            ScriptManager.RegisterStartupScript(this, GetType(),
              "ServerControlScript", script5, true);
            
        }
    }

        private void BindInsertProducts()
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

            ddlinsdepartment.DataSource = ds;
            ddlinsdepartment.DataTextField = "DepartmentName";
            ddlinsdepartment.DataValueField = "DepartmentID";
            ddlinsdepartment.DataBind();
            conn.Close();

        }
        catch
        {

            string script5 = "alert(\"Unexpected Error Occured\")";
            ScriptManager.RegisterStartupScript(this, GetType(),
              "ServerControlScript", script5, true);
            
        }
    }





    private void BindGrid()
    {
        DataTable dt = new DataTable();
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        cmd = new MySql.Data.MySqlClient.MySqlCommand("uspBookDetailsGet", conn);
        cmd.Parameters.AddWithValue("in_Filter", ViewState["Filter"].ToString());
        cmd.CommandType = CommandType.StoredProcedure;
        MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
        cmd.Connection = conn;
        sda.SelectCommand = cmd;
        sda.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();

    }

    private void BindGridForBookCode()
    {
        DataTable dt = new DataTable();
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        cmd = new MySql.Data.MySqlClient.MySqlCommand("uspBookDetailsByBookCodeGet", conn);
        cmd.Parameters.Add("i_BookCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = txtBookCode.Text.Trim();
        cmd.CommandType = CommandType.StoredProcedure;
        MySqlDataAdapter sda = new MySqlDataAdapter(cmd);
        cmd.Connection = conn;
        sda.SelectCommand = cmd;
        sda.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    public void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Session.RemoveAll();
        Response.Redirect("Admin_Login.aspx");
    }


}