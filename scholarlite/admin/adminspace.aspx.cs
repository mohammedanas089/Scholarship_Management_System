using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_adminspace : System.Web.UI.Page
{
    string con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("~/deny.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        SqlCommand cmd = new SqlCommand("update statustbl set start='yes' where id='1'", sql);

        cmd.ExecuteNonQuery();
        Response.Write("<script>alert('Website has been Allowed Access')</script>;");

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        SqlCommand cmd = new SqlCommand("update statustbl set start='no' where id='1'", sql);

        cmd.ExecuteNonQuery();
        Response.Write("<script>alert('Website has been Restricted Access')</script>;");

    }
}