using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminnote : System.Web.UI.Page
{
    string con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] == null)
        {
            Response.Redirect("~/deny.aspx");
        }
    }

 

    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlConnection sql = new SqlConnection(con);
       sql.Open();  
        SqlCommand cmd2 = new SqlCommand("insert into notetbl" + "(note,date) values(@note,@date)", sql);
        cmd2.Parameters.AddWithValue("@note", TextBox1.Text);
        cmd2.Parameters.AddWithValue("@date", DateTime.Now.ToString("dd/MM/yyyy"));
        cmd2.ExecuteNonQuery();
        Response.Redirect("adminnote.aspx");
    }
}