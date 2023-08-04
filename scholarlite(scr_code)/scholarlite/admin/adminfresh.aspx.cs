using iText.Html2pdf.Attach.Impl.Layout.Form.Element;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class adminfresh : System.Web.UI.Page
{

    string con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    public static String to;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Form.DefaultButton = Button3.UniqueID;
        review.Visible = false;
        Button4.Visible = false;
        Label1.Visible = false;
        Label3.Visible = false;
        if (Session["admin"] == null)
        {
            Response.Redirect("~/deny.aspx");
        }
        if (!IsPostBack)
        {
            PopulateGridview();
        }
    }
    void PopulateGridview()
    {
        TextBox tb = this.Master.FindControl("tbm") as TextBox;

        if (!String.IsNullOrWhiteSpace(tb.Text))
        {
            Label3.Visible = true;
            SqlConnection sql = new SqlConnection(con);//makes connection to sql
                                                       //selects product as given in searchbox and displays only them
            SqlDataAdapter sda = new SqlDataAdapter("select * from cantbl" +
                " where type='F' and stat='Unapproved' and ((name like '%" + tb.Text + "%' ) or (course like '%" + tb.Text + "%') or (aadhar like '%" + tb.Text + "%' ))", sql);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            ViewState["dirState"] = dt;
            ViewState["sortdr"] = "Asc";
        }
        else if (String.IsNullOrWhiteSpace(tb.Text))
        {
            SqlConnection sql = new SqlConnection(con);

            sql.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select * from cantbl where type='F' and stat='Unapproved'", sql);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            ViewState["dirState"] = dt;
            ViewState["sortdr"] = "Asc";

        }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        PopulateGridview();
    }


    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        PopulateGridview();
    }

    protected void GridView1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {
        /* try
          {
              using (SqlConnection sqlCon = new SqlConnection(con))
              {
                  sqlCon.Open();
                  string query = "UPDATE notetbl SET note=@note,date=@date  WHERE slno = @slnos";
                  SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                  sqlCmd.Parameters.AddWithValue("@note", (GridView1.Rows[e.RowIndex].FindControl("txtnote") as TextBox).Text.Trim());
                  sqlCmd.Parameters.AddWithValue("@date", (GridView1.Rows[e.RowIndex].FindControl("txtdate") as TextBox).Text.Trim());

                  sqlCmd.Parameters.AddWithValue("@slnos", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
                  sqlCmd.ExecuteNonQuery();
                  GridView1.EditIndex = -1;
                  PopulateGridview();

              }
          }
          catch (Exception ex)
          {
          }*/
    }
    protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "approve")
        {
            //Label1.Text=e.CommandArgument.ToString();
            //Response.Redirect("home.aspx?aadhar="+e.CommandArgument.ToString());
            String adhar = e.CommandArgument.ToString();
            SqlConnection sql = new SqlConnection(con);
            sql.Open();
            //  Label2.Text = "2";
            SqlCommand cmd3 = new SqlCommand("select email from cantbl where id=" + Convert.ToInt64(e.CommandArgument.ToString()), sql);
            string ok = Convert.ToString(cmd3.ExecuteScalar());
            String from, pass, msgbody;
            Random rand = new Random();
            String randomcode = (rand.Next(99)).ToString();
            // Label2.Text = "3";
            MailMessage msg = new MailMessage();
            to = Convert.ToString(ok);
            from = "mohammedanas1581@gmail.com";
            pass = "mbdxcruowsntlgdw";
            msgbody = "Your Scholarship has been Approved this is your ID used for status checking and renewal " + ((ulong)DateTime.Now.Year) + randomcode + Convert.ToInt64(adhar.Substring(adhar.Length - 4));
            //   Label2.Text = "4";
            Label1.Text = randomcode;
            msg.To.Add(to);
            msg.From = new MailAddress(from);
            msg.Body = msgbody;
            msg.Subject = "Al-Ameen Scholarship ";
            SmtpClient smtp = new SmtpClient("smtp.gmail.com");
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential(from, pass);
            // Label2.Text = "5";
            try
            {
                //Label2.Text = "6";
                // SqlCommand cmd=new SqlCommand("insert into testtbl(aadhar) select aadhar from freshtbl",sql);
                /*this is old one  SqlCommand cmd = new SqlCommand("insert into aprvtbl(id,name,father,occupation,course,courseyear,pcourse,pcourseyear,pcoursemarks,sslc,pu,institute,balancefee,year,email,aadhar,type) select aadhar,name,father,occupation,course,courseyear,pcourse,pcourseyear,pcoursemarks,sslc,pu,institute,balancefee,year,email,aadhar,aadhar from freshtbl where aadhar=" + Convert.ToInt64(e.CommandArgument.ToString()), sql);
                  SqlCommand cmd4 = new SqlCommand("update aprvtbl set id="+((ulong)DateTime.Now.Year)+ Convert.ToInt64(Label1.Text)+Convert.ToInt64( adhar.Substring(adhar.Length - 4))+" where id=" + Convert.ToInt64(e.CommandArgument.ToString()), sql);
                  SqlCommand cmd5 = new SqlCommand("update aprvtbl set type='F' where aadhar=" + Convert.ToInt64(e.CommandArgument.ToString()), sql);
                 */

                SqlCommand cmd4 = new SqlCommand("update cantbl set id=" + ((ulong)DateTime.Now.Year) + Convert.ToInt64(Label1.Text) + Convert.ToInt64(adhar.Substring(adhar.Length - 4)) + ", stat='approved' where id=" + Convert.ToInt64(e.CommandArgument.ToString()), sql);


                //cmd4.Parameters.AddWithValue("@id", Convert.ToInt64( Label1.Text));
                //cmd.Parameters.AddWithValue("@aadhar",e.CommandArgument.ToString());

                //   Label2.Text = "7";

                // Label2.Text = "8";
                smtp.Send(msg);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Sent Successfully')", true);
                //  Label2.Text = "23";
                cmd4.ExecuteNonQuery();
                // Label2.Text = "25";
                sql.Close();
                // Label2.Text = "9";
                Response.Redirect("adminfresh.aspx");
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + ex.Message + "')", true);

            }


        }

        if (e.CommandName == "deny")
        {
            Response.Redirect("reject.aspx?id=" + e.CommandArgument.ToString() + "&type=F");
            /*SqlConnection sql = new SqlConnection(con);

            sql.Open();
            // SqlCommand cmd=new SqlCommand("insert into testtbl(aadhar) select aadhar from freshtbl",sql);
            //cmd.Parameters.AddWithValue("@aadhar",e.CommandArgument.ToString());
            SqlCommand cmd3 = new SqlCommand("select email from freshtbl where aadhar=" + Convert.ToInt64(e.CommandArgument.ToString()), sql);
            string ok = Convert.ToString(cmd3.ExecuteScalar());
            SqlCommand cmd2 = new SqlCommand("delete from freshtbl where aadhar=" + Convert.ToInt64(e.CommandArgument.ToString()), sql);

            cmd2.ExecuteNonQuery();
            sql.Close();
            String from, pass, msgbody;
            MailMessage msg = new MailMessage();
            to = Convert.ToString(ok);
            from = "mohammedanas1581@gmail.com";
            pass = "mbdxcruowsntlgdw";
            msgbody = "denied";
            msg.To.Add(to);
            msg.From = new MailAddress(from);
            msg.Body = msgbody;
            msg.Subject = "E-mail confirmation OTP code";
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
            Response.Redirect("adminfresh.aspx");*/
        }
        if (e.CommandName == "pdf")
        {
            Response.Redirect("~/appdocs/" + DateTime.Now.Year.ToString() + e.CommandArgument.ToString() + ".pdf");
        }







    }
    protected void Button3_Click(object sender, EventArgs e)
    {

        TextBox tb = this.Master.FindControl("tbm") as TextBox;
        if (!String.IsNullOrWhiteSpace(tb.Text))
        {
            Label3.Visible = true;
            SqlConnection sql = new SqlConnection(con);//makes connection to sql
                                                       //selects product as given in searchbox and displays only them
            SqlDataAdapter sda = new SqlDataAdapter("select * from cantbl where (type='F') and (stat='Unapproved') and ((name like '%" + tb.Text + "%' ) or (course like '%" + tb.Text + "%') or (aadhar like '%" + tb.Text + "%' ))", sql);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            SqlConnection sql = new SqlConnection(con);

            sql.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select * from cantbl where (type='F') and (stat='Unapproved') ", sql);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }



    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            Int64 m = Convert.ToInt64(((Label)e.Row.FindControl("mark")).Text);
            
           Int64 i = Convert.ToInt64(((Label)e.Row.FindControl("income")).Text);
            if ((m < 50) || i > 150000)
            {
                e.Row.CssClass = "invalid";
            }
            if (m > 50 && m < 70 && i < 150000)
            {
                e.Row.CssClass = "n";

            }
            if ((m > 70) && i < 150000)
            {
                e.Row.CssClass = "valid";

            }


        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        review.Visible = true;
        Button4.Visible = true;
        GridViewRow row = GridView1.SelectedRow;
        review.Text = (row.Cells[1].FindControl("HiddenField1") as HiddenField).Value;


    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        GridViewRow r1 = GridView1.SelectedRow;

        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        SqlCommand cmd = new SqlCommand("update cantbl set review=@review where aadhar=@aadhar", sql);
        cmd.Parameters.AddWithValue("@review", review.Text);
        cmd.Parameters.AddWithValue("@aadhar", r1.Cells[16].Text);
        cmd.ExecuteNonQuery();
        Response.Redirect("adminfresh.aspx");
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        PopulateGridview();
    }

    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        DataTable dtrslt = (DataTable)ViewState["dirState"];
        if (dtrslt.Rows.Count > 0)
        {
            if (Convert.ToString(ViewState["sortdr"]) == "Asc")
            {
                dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                ViewState["sortdr"] = "Desc";
            }
            else
            {
                dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                ViewState["sortdr"] = "Asc";
            }
            GridView1.DataSource = dtrslt;
            GridView1.DataBind();


        }
    }
}

