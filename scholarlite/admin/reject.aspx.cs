using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_reject : System.Web.UI.Page
{
    string con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    public static String to, id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            id = Request.QueryString["id"];
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection sql = new SqlConnection(con);
        string ok;
        String from, pass, msgbody;
        sql.Open();
        // SqlCommand cmd=new SqlCommand("insert into testtbl(aadhar) select aadhar from freshtbl",sql);
        //cmd.Parameters.AddWithValue("@aadhar",e.CommandArgument.ToString());
        if (Request.QueryString["type"] == "F")
        {
            SqlCommand cmd3 = new SqlCommand("select email from cantbl where aadhar=" + Convert.ToInt64(id.ToString()), sql);
            ok = Convert.ToString(cmd3.ExecuteScalar());
            SqlCommand cmd2 = new SqlCommand("delete from cantbl where aadhar=" + Convert.ToInt64(id.ToString()), sql);

            cmd2.ExecuteNonQuery();
            msgbody = "Application with Aadhar ID:" + Convert.ToInt64(id.ToString()) + " has been rejected.For the following reason \n" + TextBox1.Text;

        }
        else
        {
            SqlCommand cmd3 = new SqlCommand("select email from cantbl where id=" + Convert.ToInt64(id.ToString()), sql);
            ok = Convert.ToString(cmd3.ExecuteScalar());
            SqlCommand cmd2 = new SqlCommand("update cantbl set stat='reapply' where id=" + Convert.ToInt64(id.ToString()), sql);

            cmd2.ExecuteNonQuery();
            msgbody = "Application ID:" + Convert.ToInt64(id.ToString()) + " has been rejected.For the following reason \n" + TextBox1.Text;
        }

        sql.Close();

        MailMessage msg = new MailMessage();
        to = Convert.ToString(ok);
        from = "mohammedanas1581@gmail.com";
        pass = "mbdxcruowsntlgdw";

        msg.To.Add(to);
        msg.From = new MailAddress(from);
        msg.Body = msgbody;
        msg.Subject = "Scholarship Status";
        SmtpClient smtp = new SmtpClient("smtp.gmail.com");
        smtp.EnableSsl = true;
        smtp.Port = 587;
        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
        smtp.Credentials = new NetworkCredential(from, pass);
        try
        {
            smtp.Send(msg);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sent Successfully')", true);

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.Message + "')", true);

        }
        Response.Redirect("adminfresh.aspx");
    }
}