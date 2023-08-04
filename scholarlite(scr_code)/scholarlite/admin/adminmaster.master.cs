using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminmaster : System.Web.UI.MasterPage
{
    string con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Button1.Visible = false;
        }
        else
        {
            Button1.Visible=true;
        }
        if (Request.Path.EndsWith("adminfresh.aspx"))
        {

            HyperLink1.Style.Add("font-weight", "bolder");
            HyperLink1.Style.Add("text-decoration", "underline");
            HyperLink1.Style.Add("text-underline-offset", "6px");
            HyperLink1.Style.Add("text-decoration-thickness", "2px");
        }
        if (Request.Path.EndsWith("adminsanction.aspx"))
        {

            HyperLink4.Style.Add("font-weight", "bolder");
            HyperLink4.Style.Add("text-decoration", "underline");
            HyperLink4.Style.Add("text-underline-offset", "6px");
            HyperLink4.Style.Add("text-decoration-thickness", "2px");
        }
        if (Request.Path.EndsWith("adminnote.aspx"))
        {

            HyperLink3.Style.Add("font-weight", "bolder");
            HyperLink3.Style.Add("text-decoration", "underline");
            HyperLink3.Style.Add("text-underline-offset", "6px");
            HyperLink3.Style.Add("text-decoration-thickness", "2px");
        }
        if (Request.Path.EndsWith("adminrenew.aspx"))
        {

            HyperLink6.Style.Add("font-weight", "bolder");
            HyperLink6.Style.Add("text-decoration", "underline");
            HyperLink6.Style.Add("text-underline-offset", "6px");
            HyperLink6.Style.Add("text-decoration-thickness", "2px");
        }
        if (Request.Path.EndsWith("adminapprov.aspx"))
        {

            HyperLink2.Style.Add("font-weight", "bolder");
            HyperLink2.Style.Add("text-decoration", "underline");
            HyperLink2.Style.Add("text-underline-offset", "6px");
            HyperLink2.Style.Add("text-decoration-thickness", "2px");
        }
        if (Request.Path.EndsWith("adminspace.aspx"))
        {

            HyperLink5.Style.Add("font-weight", "bolder");
            HyperLink5.Style.Add("text-decoration", "underline");
            HyperLink5.Style.Add("text-underline-offset", "6px");
            HyperLink5.Style.Add("text-decoration-thickness", "2px");
        }
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["admin"] = null;
        Response.Redirect("~/home.aspx");

    }
}
