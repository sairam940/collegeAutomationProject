using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;



public partial class Library_Books : System.Web.UI.Page
{
    MySql.Data.MySqlClient.MySqlConnection conn;
    MySql.Data.MySqlClient.MySqlCommand cmd;
    
    protected void Page_Load(object sender, EventArgs e)
    {
       
        lblDepartment.Visible = false;
        ddldepartment.Visible = false;
        lblBookCode.Visible = false;
        txtBookCode.Visible = false;
        btnBookCodeSearch.Visible = false;
        btnBookCodeClearFields.Visible = false;
        lblStudentID.Visible = false;
        txtStudentID.Visible = false;
        btnTake.Visible = false;
        btnReturn.Visible = false;

        if (ddlSearchBy.SelectedValue == "Select")
        {
            lblDepartment.Visible = false;
            ddldepartment.Visible = false;
            lblBookCode.Visible = false;
            txtBookCode.Visible = false;
            btnBookCodeSearch.Visible = false;
            btnBookCodeClearFields.Visible = false;
            lblStudentID.Visible = false;
            txtStudentID.Visible = false;
            btnTake.Visible = false;
            btnReturn.Visible = false;
            GridView1.Visible = false;

        }


        if (ddlSearchBy.SelectedValue == "Department")
        {
            lblDepartment.Visible = true;
            ddldepartment.Visible = true;
            lblBookCode.Visible = false;
            txtBookCode.Visible = false;
            btnBookCodeSearch.Visible = false;
            btnBookCodeClearFields.Visible = false;
            lblStudentID.Visible = true;
            txtStudentID.Visible = true;
            btnTake.Visible = true;
            btnReturn.Visible = true;
           
            if (ddldepartment.SelectedValue == "ALL")
            {
                BindProducts();
                ViewState["Filter"] = "ALL";
                //BindGrid();
                GridView1.Visible = true;
            }
        }

    else if (ddlSearchBy.SelectedValue == "BookCode")
            {
                lblDepartment.Visible = false;
                ddldepartment.Visible = false;
                lblBookCode.Visible = true;
                txtBookCode.Visible = true;
            lblStudentID.Visible = true;
            txtStudentID.Visible = true;
            btnTake.Visible = true;
            btnReturn.Visible = true;
            //BindGridForBookCode();
                GridView1.Visible = true;
            }

     





        //BindProducts();

        //if (!IsPostBack)
        //{
        //    //ViewState["Filter"] = "ALL";
        //    //BindGrid();
        //}
    }

    protected void ddlSearchBy_SelectedIndexChanged(object sender,EventArgs e )
    {
        if(ddlSearchBy.SelectedValue =="Select")
        {
            lblDepartment.Visible = false;
            lblBookCode.Visible = false;
            txtBookCode.Visible = false;
        }

        else if(ddlSearchBy.SelectedValue == "Department" )
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
            lblStudentID.Visible = true;
            txtStudentID.Visible = true;
            btnTake.Visible = true;
            btnReturn.Visible = true;
            GridView1.Visible = true;
        }
    }


    protected void ddldepartment_SelectedIndexChanged(object sender, EventArgs e)
    {

       
        lblStudentID.Visible = true;
        txtStudentID.Visible = true;
        btnTake.Visible = true;
        btnReturn.Visible = true;
        DropDownList ddldepartment = (DropDownList)sender;
        lblDepartment.Visible = true;
        ddldepartment.Visible = true;
        ViewState["Filter"] = ddldepartment.SelectedValue;
        this.BindGrid();
        GridView1.Visible = true;
    }

    protected void btnBookCodeSearch_Click(object sender, EventArgs e)
    {
        BindGridForBookCode();
        GridView1.Visible = true;
        btnBookCodeSearch.Visible = true;
        btnBookCodeClearFields.Visible = true;
        btnBookCodeSearch.Visible = true;
        btnBookCodeClearFields.Visible = true;
        lblStudentID.Visible = true;
        txtStudentID.Visible = true;
        btnTake.Visible = true;
        btnReturn.Visible = true;

    }

    protected void btnBookCodeClearFields_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        txtBookCode.Text = "";
        btnBookCodeSearch.Visible = true;
        btnBookCodeClearFields.Visible = true;
        lblStudentID.Visible = false;
        txtStudentID.Visible = false;
        btnTake.Visible = false;
        btnReturn.Visible = false;


    }

    protected void btnTake_Click(object sender, EventArgs e)
    {
        BindCheckBoxSelectedTake();
     
        //foreach (GridViewRow row in GridView1.Rows)
        //{
        //    CheckBox checkbox = (CheckBox)row.FindControl("cbSelect");
        //    if (checkbox.Checked)
        //    {

        //        string i_BookCode = Convert.ToString(GridView1.DataKeys[row.RowIndex].Value);
        //        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        //        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        //        conn.Open();
        //        using (conn)
        //        {
        //            using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspBookTake", conn))
        //            {
        //                cmd.CommandType = System.Data.CommandType.StoredProcedure;
        //                cmd.Parameters.Add("i_BookCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = i_BookCode;
        //                cmd.Parameters.Add("i_StudentID", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToInt32(txtStudentID.Text.Trim());
        //                cmd.Parameters.Add("o_BookAvailability", MySql.Data.MySqlClient.MySqlDbType.Int32);
        //                cmd.Parameters["o_BookAvailability"].Direction = ParameterDirection.Output;
                       
        //        }
        //            if (cmd.ExecuteNonQuery() > 0)
        //            {
        //                if (Convert.ToInt32(cmd.Parameters["o_BookAvailability"].Value) > 0)
        //                {
        //                    Response.Write("<Script>alert('This Book is available for you')</Script>");
        //                }
        //            }
        //            else
        //            {
        //                Response.Write("<Script>alert('This Book is Not available')</Script>");
        //            }


        //        }

        //        GridView1.DataBind();
                

        //        conn.Close();
        //    }
        //}
        
    }






    protected void btnReturn_Click(object sender, EventArgs e)
    {
        BindCheckBoxSelectedReturn();
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.BindGrid();
    }

    private void BindProducts()
    {
        string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
        conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
        cmd = new MySql.Data.MySqlClient.MySqlCommand("Select DepartmentID,DepartmentName from tbldepartmentdetails", conn);
                MySqlDataAdapter adp = new MySqlDataAdapter(cmd);
                DataTable ds = new DataTable();
                try {
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
            string script = "alert(\"Unexpected Error Occured\")";
            ScriptManager.RegisterStartupScript(this, GetType(),
              "ServerControlScript", script, true);
            
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

    private void BindCheckBoxSelectedTake()
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox checkbox = (CheckBox)row.FindControl("cbSelect");
            if (checkbox.Checked)
            {
                string i_BookCode = Convert.ToString(GridView1.DataKeys[row.RowIndex].Value);
                string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
                conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
                conn.Open();
                using (conn)
                {
                    using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspBookTake1", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add("i_BookCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = i_BookCode;
                        cmd.Parameters.Add("i_StudentID", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToInt32(txtStudentID.Text.Trim());
                        cmd.Parameters.Add("o_BookAvailability", MySql.Data.MySqlClient.MySqlDbType.Int32);
                        cmd.Parameters["o_BookAvailability"].Direction = ParameterDirection.Output;
                        cmd.Parameters.Add("o_BookID", MySql.Data.MySqlClient.MySqlDbType.Int32);
                        cmd.Parameters["o_BookID"].Direction = ParameterDirection.Output;
                        cmd.Parameters.Add("o_IsMaxBookLimitReached", MySql.Data.MySqlClient.MySqlDbType.Int32);
                        cmd.Parameters["o_IsMaxBookLimitReached"].Direction = ParameterDirection.Output;
                        cmd.Parameters.Add("o_BookAlreadyTaken", MySql.Data.MySqlClient.MySqlDbType.Int32);
                        cmd.Parameters["o_BookAlreadyTaken"].Direction = ParameterDirection.Output;
                        int BookID = Convert.ToInt32(cmd.Parameters["o_BookID"].Value);
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            if(Convert.ToInt32(cmd.Parameters["o_BookAlreadyTaken"].Value)==1)
                            {
                                string script2 = "alert(\"This Book is already taken by you.You cannot take the same book twice\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script2, true);
                                
                            }
                            else if (Convert.ToInt32(cmd.Parameters["o_BookAvailability"].Value) == 0)
                            {
                                string script3 = "alert(\"This Book is Not available\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script3, true);
                                
                            }
                            else if (Convert.ToInt32(cmd.Parameters["o_IsMaxBookLimitReached"].Value) == 1)
                            {
                                string script4 = "alert(\"You have reached your maximum limit\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script4, true);
                                
                            }
                            else if ((Convert.ToInt32(cmd.Parameters["o_BookAvailability"].Value) > 0 && Convert.ToInt32(cmd.Parameters["o_IsMaxBookLimitReached"].Value)==0))
                            {
                                string script5 = "alert(\"This Book is available for you\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script5, true);
                                
                            }
                            
                        }
                        else
                        {
                            if (Convert.ToInt32(cmd.Parameters["o_BookAlreadyTaken"].Value) == 1)
                            {
                                string script6 = "alert(\"This Book is already taken by you.You cannot take the same book twice\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script6, true);
                                
                            }
                         else if (Convert.ToInt32(cmd.Parameters["o_BookAvailability"].Value) == 0)
                            {
                                string script7 = "alert(\"This Book is Not available\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script7, true);
                                
                            }
                          else if (Convert.ToInt32(cmd.Parameters["o_IsMaxBookLimitReached"].Value) == 1)
                            {
                                string script8 = "alert(\"You have reached your maximum limit\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script8, true);
                                
                            }
                           else if ((Convert.ToInt32(cmd.Parameters["o_BookAvailability"].Value) > 0 && Convert.ToInt32(cmd.Parameters["o_IsMaxBookLimitReached"].Value) == 0))
                            {
                                string script9= "alert(\"This Book is available for you\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script9, true);
                                
                            }
                            //Response.Write("Error while Processing your request");
                        }
                    }
                }
                conn.Close();

            }
       

        }

        if(ddlSearchBy.SelectedValue == "Department")
        { 
        BindGrid();
        }

    if(ddlSearchBy.SelectedValue == "BookCode")
        {
            BindGridForBookCode();
        }



    }


    private void BindCheckBoxSelectedReturn()
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox checkbox = (CheckBox)row.FindControl("cbSelect");
            if (checkbox.Checked)
            {
                string i_BookCode = Convert.ToString(GridView1.DataKeys[row.RowIndex]["BookCode"]);
                int i_BookAvailability= Convert.ToInt32(GridView1.DataKeys[row.RowIndex]["BookAvailability"]);
                string connstring = System.Configuration.ConfigurationManager.ConnectionStrings["msuconnectionstring"].ToString();
                conn = new MySql.Data.MySqlClient.MySqlConnection(connstring);
                conn.Open();
                using (conn)
                {
                    using (cmd = new MySql.Data.MySqlClient.MySqlCommand("uspBookReturn", conn))
                    {
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd.Parameters.Add("i_BookCode", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = i_BookCode;
                        cmd.Parameters.Add("i_StudentID", MySql.Data.MySqlClient.MySqlDbType.VarChar).Value = Convert.ToInt32(txtStudentID.Text.Trim());
                        cmd.Parameters.Add("o_BookAvailability", MySql.Data.MySqlClient.MySqlDbType.Int32);
                        cmd.Parameters["o_BookAvailability"].Direction = ParameterDirection.Output;
                        cmd.Parameters.Add("o_BookID", MySql.Data.MySqlClient.MySqlDbType.Int32);
                        cmd.Parameters["o_BookID"].Direction = ParameterDirection.Output;
                        cmd.Parameters.Add("o_IsBookCanBeReturned", MySql.Data.MySqlClient.MySqlDbType.Int32);
                        cmd.Parameters["o_IsBookCanBeReturned"].Direction = ParameterDirection.Output;
                        cmd.Parameters.Add("o_IsBookAlreadyReturned", MySql.Data.MySqlClient.MySqlDbType.Int32);
                        cmd.Parameters["o_IsBookAlreadyReturned"].Direction = ParameterDirection.Output;
                        if (cmd.ExecuteNonQuery()>0)
                        { 
                       if (Convert.ToInt32(cmd.Parameters["o_IsBookCanBeReturned"].Value) == 0)
                            {
                                string script11 = "alert(\"This book has reached its maximum available limit.This can't be returned\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script11, true);
                                
                            }
                            else if (Convert.ToInt32(cmd.Parameters["o_IsBookAlreadyReturned"].Value) == 0)
                            {
                                string script12 = "alert(\"This book is either already returned by you or this has not been taken by you yet.\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script12, true);
                                
                            }

                            else if (Convert.ToInt32(cmd.Parameters["o_BookAvailability"].Value) == i_BookAvailability+1)
                            {
                                string script13 = "alert(\"The  Book has been returned\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script13, true);
                            }
                        }
                        else
                        {
                            if (Convert.ToInt32(cmd.Parameters["o_IsBookCanBeReturned"].Value) == 0)
                            {
                                string script14 = "alert(\"This book has reached its maximum available limit.This can't be returned\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script14, true);
                              
                            }
                            else if (Convert.ToInt32(cmd.Parameters["o_IsBookAlreadyReturned"].Value) == 0)
                            {
                                string script15 = "alert(\"This book is either already returned by you or this ha not been taken by you yet.\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script15, true);
                                
                            }

                            else if (Convert.ToInt32(cmd.Parameters["o_BookAvailability"].Value) == i_BookAvailability + 1)
                            {
                                string script16 = "alert(\"The  Book has been returned\")";
                                ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script16, true);
                                ;
                            }
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


    public void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Session.RemoveAll();
        Response.Redirect("Default.aspx");
    }
}
