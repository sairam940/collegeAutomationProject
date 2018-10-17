using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Playgrounds : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SetImageURL();
    }

    protected void Timer1_Tick(object sender, EventArgs e)
    {
        SetImageURL();
    }

    private void SetImageURL()
    {
        Random _rand = new Random();
        int i = _rand.Next(1, 4);
        ImageControl.ImageUrl = "~/PlayGrounds/" + i.ToString() + ".jpg";
    }
}