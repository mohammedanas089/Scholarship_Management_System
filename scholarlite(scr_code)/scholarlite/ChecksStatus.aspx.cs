using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChecksStatus : System.Web.UI.Page
{
    string con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string stat;
        try
        {
            SqlConnection sql = new SqlConnection(con);
            sql.Open();
            SqlCommand cmd = new SqlCommand("select count(*) from sanctbl where id=@id", sql);
            cmd.Parameters.AddWithValue("@id", TextBox1.Text);
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            sql.Close();
            if (count >= 1)
            {
                stat = "sanc";
            }
            else
            {
                try { 
                SqlConnection sql2 = new SqlConnection(con);
                sql2.Open();
                SqlCommand cmd2 = new SqlCommand("select stat from cantbl where id=@id", sql2);
                cmd2.Parameters.AddWithValue("@id", TextBox1.Text);
                stat = Convert.ToString(cmd2.ExecuteScalar());
                }
                catch
                {
                    stat = "none";
                }
            }
        }
        catch
        {
            stat = "none";
        }
        
       if (stat == "approved")
        {
            Response.Write("<script language=javascript>alert('Your Application has been Approved.');</script>");
        }
        else if(stat == "Unapproved")
        {
            Response.Write("<script language=javascript>alert('Application still under-verification.');</script>");

        }
        else if (stat == "sanc")
        {
            Response.Write("<script language=javascript>alert('Amount Sanctioned.Please check your bank details');</script>");

        }
        else if(stat == "none")
        {
            Response.Write("<script language=javascript>alert('Entered ID has not been used for application/Incorrect ID');</script>");
        }
        

    }
}