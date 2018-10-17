using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string username;
        this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        username = (string)(Session["username"]);
        lbllastname.Text = username;
    }

    public void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Session.RemoveAll();
        Response.Redirect("Admin_Login.aspx");
    }

}