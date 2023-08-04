using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class portal : System.Web.UI.Page
{
    string con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("type.aspx");

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection sql = new SqlConnection(con);
        SqlDataReader dr;
        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.Parameters.Clear();
            cmd.CommandText = "SELECT * FROM cantbl WHERE id=@id and stat='approved'";
           
            cmd.Connection = sql;
            sql.Open();
            dr = cmd.ExecuteReader();

            
        }
        if (dr.HasRows)
        {
            dr.Close();
            Response.Write("<script language=javascript>alert('Approved');</script>");
        }
        else
        {
            dr.Close();

        }
        SqlDataReader dr2;
        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.Parameters.Clear();
            cmd.CommandText = "SELECT * FROM cantbl WHERE id=@id and stat='Unapproved'";
           
            cmd.Connection = sql;
            dr2 = cmd.ExecuteReader();


        }
        if (dr2.HasRows)
        {
            dr2.Close();
            Response.Write("<script language=javascript>alert('Not Approved');</script>");
        }
        else
        {
            dr.Close();
        }

    }

}