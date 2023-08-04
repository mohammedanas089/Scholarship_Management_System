using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admincred : System.Web.UI.Page
{
    string con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button3_Click(object sender, EventArgs e)
    {

        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM admintbl WHERE adminid = '" + TextBox1.Text + "' AND adminpass = '" + TextBox2.Text + "'", sql);

        //int variable that stores the result of the Sql statement
        int rowCount = Convert.ToInt32(cmd.ExecuteScalar());
        //Executed if the value of rowCount is greater than or equal to 1
        if (rowCount >= 1)
        {
            Session["admin"] = true;
            //Sets the value of valid variable to true
            Response.Redirect("~/admin/adminfresh.aspx");
        }
        //Executed if the value of rowCount is less than or equal to 0
        else
        {
            //Sets the value of valid variable to false
            Response.Write("<script>alert('Invalid Admin Credentials');</script>");
        }

        //Returns the value of valid
    }
}