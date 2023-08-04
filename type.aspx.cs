using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class type : System.Web.UI.Page
{
    string con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        SqlCommand cmd = new SqlCommand("select start from statustbl where id='1'", sql);
        string status = (string)cmd.ExecuteScalar();
        if (status == "no")
        {
            Response.Redirect("home.aspx?restrict=y");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("fresh.aspx");

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection sql = new SqlConnection(con);
            sql.Open();
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM cantbl WHERE id = '" + Convert.ToInt64(TextBox1.Text) + "'AND type='R'", sql);


            //int variable that stores the result of the Sql statement
            int rowCount = Convert.ToInt32(cmd.ExecuteScalar());
            //Executed if the value of rowCount is greater than or equal to 1
            if (rowCount >= 1)
            {
                //Sets the value of valid variable to true
                Response.Redirect("renewal.aspx?id=" + TextBox1.Text);
            }
            //Executed if the value of rowCount is less than or equal to 0
            else
            {
                //Sets the value of valid variable to false
                Response.Write("<script>alert('Incorrect ID')</script>");
            }
        }
        catch
        {
            Response.Write("<script>alert('Incorrect ID')</script>");

        }

    }
}