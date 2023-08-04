using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["restrict"] == "y")
        {
            Response.Write("<script>alert('Website Closed')</script>;");
        }
        if (Request.QueryString["res"] == "done")
        {
            Response.Write("<script>alert('Your Application has been submitted.')</script>;");
        }
    }



    protected void Timer1_Tick(object sender, EventArgs e)
    {
        Random ran= new Random();
        int i = ran.Next(1,6);
        Image1.ImageUrl = "~/HomeSlides/" + i.ToString() + ".jpg";
    }
}