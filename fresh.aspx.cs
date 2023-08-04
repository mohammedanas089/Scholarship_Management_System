using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Threading;
using System.Text.RegularExpressions;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using iTextSharp.tool.xml.html;
using iTextSharp.tool.xml.parser;
using iTextSharp.tool.xml.pipeline.css;
using iTextSharp.tool.xml.pipeline.end;
using iTextSharp.tool.xml.pipeline.html;

public partial class fresh : System.Web.UI.Page
{
    String randomcode;
    public static String to;
    String containcode;

    string con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        SqlCommand cmd = new SqlCommand("select start from statustbl where id='1'", sql);
        string status = (string)cmd.ExecuteScalar();
        if (status == "no")
        {
            Response.Redirect("home.aspx");
        }
        Panel5.Visible = false;
        Panel2.Visible = false;
        Panel4.Visible = false;
        Panel3.Visible = false;
        Panel6.Visible = false;
        Panel7.Visible = false;
        form.Visible = false;
        docsec.Visible = false;
        Button1.Visible = false;
        Button2.Visible = false;
        tick.Visible = false;
        v.Visible = false;
        if (!IsPostBack)
        {
            chainddl();
            chainddl2();
            chainddl3();
        }
    }
    protected void chainddl()
    {
        SqlConnection sqlcon = new SqlConnection(con);
        sqlcon.Open();
        SqlCommand sqlcmd = new SqlCommand("select * from [dbo].[religiontbl]", sqlcon);
        sqlcmd.CommandType = CommandType.Text;
        ddlreligion.DataSource = sqlcmd.ExecuteReader();
        ddlreligion.DataTextField = "religionname";
        ddlreligion.DataValueField = "religionid";
        ddlreligion.DataBind();
        ddlreligion.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Religion--", "0"));
    }

    protected void ddlreligion_SelectedIndexChanged(object sender, EventArgs e)
    {
        int religionid = Convert.ToInt32(ddlreligion.SelectedValue);
        SqlConnection sqlcon = new SqlConnection(con);
        sqlcon.Open();
        SqlCommand sqlcmd = new SqlCommand("select * from [dbo].[castetbl] where religionid= " + religionid, sqlcon);
        sqlcmd.CommandType = CommandType.Text;
        ddlcaste.DataSource = sqlcmd.ExecuteReader();
        ddlcaste.DataTextField = "castename";
        ddlcaste.DataValueField = "casteid";
        ddlcaste.DataBind();
        ddlcaste.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Caste--", "0"));
    }
    protected void chainddl2()
    {
        SqlConnection sqlcon = new SqlConnection(con);
        sqlcon.Open();
        SqlCommand sqlcmd = new SqlCommand("select * from [dbo].[coursetbl]", sqlcon);
        sqlcmd.CommandType = CommandType.Text;
        ddlcourse.DataSource = sqlcmd.ExecuteReader();
        ddlcourse.DataTextField = "coursename";
        ddlcourse.DataValueField = "courseid";
        ddlcourse.DataBind();
        ddlcourse.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Course--", "0"));
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        int courseid = Convert.ToInt32(ddlcourse.SelectedValue);
        if (courseid > 2)
        {
            courseid = 3;
        }
        SqlConnection sqlcon = new SqlConnection(con);
        sqlcon.Open();
        SqlCommand sqlcmd = new SqlCommand("select * from [dbo].[courseyeartbl] where courseid= " + courseid, sqlcon);
        sqlcmd.CommandType = CommandType.Text;
        ddlcourseyear.DataSource = sqlcmd.ExecuteReader();
        ddlcourseyear.DataTextField = "courseyearname";
        ddlcourseyear.DataValueField = "courseyearid";
        ddlcourseyear.DataBind();
        ddlcourseyear.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Course year--", "0"));
    }
    protected void chainddl3()
    {
        SqlConnection sqlcon = new SqlConnection(con);
        sqlcon.Open();
        SqlCommand sqlcmd = new SqlCommand("select * from [dbo].[coursetbl]", sqlcon);
        sqlcmd.CommandType = CommandType.Text;
        ddlprecourse.DataSource = sqlcmd.ExecuteReader();
        ddlprecourse.DataTextField = "coursename";
        ddlprecourse.DataValueField = "courseid";
        ddlprecourse.DataBind();
        ddlprecourse.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Course--", "0"));
    }
    protected void ddlprecourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        int courseid = Convert.ToInt32(ddlprecourse.SelectedValue);
        if (courseid > 2)
        {
            courseid = 3;
        }
        SqlConnection sqlcon = new SqlConnection(con);
        sqlcon.Open();
        SqlCommand sqlcmd = new SqlCommand("select * from [dbo].[courseyeartbl] where courseid= " + courseid, sqlcon);
        sqlcmd.CommandType = CommandType.Text;
        ddlprecourseyear.DataSource = sqlcmd.ExecuteReader();
        ddlprecourseyear.DataTextField = "courseyearname";
        ddlprecourseyear.DataValueField = "courseyearid";
        ddlprecourseyear.DataBind();
        ddlprecourseyear.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select Course year--", "0"));
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(feetxt.Text) || string.IsNullOrEmpty(TextBox2.Text))

        {
            try
            {
                //Regex reg = new Regex(@"^[0-9]{12}$");
                Int64 trial = Convert.ToInt64(feetxt.Text);

                balancetxt.Text = (Convert.ToInt32(feetxt.Text) - Convert.ToInt32(TextBox2.Text)).ToString();
            }
            catch
            {
                Panel5.Visible = true;

            }
        }
    }


    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(feetxt.Text) || string.IsNullOrEmpty(TextBox2.Text))

        {
            try
            {
                //Regex reg = new Regex(@"^[0-9]{12}$");
                Int64 trial = Convert.ToInt64(feetxt.Text);
                balancetxt.Text = (Convert.ToInt32(feetxt.Text) - Convert.ToInt32(TextBox2.Text)).ToString();
            }
            catch
            {
                Panel5.Visible = true;

            }
        }
    }



    protected void Button3_Click(object sender, EventArgs e)
    {
        int er = 1;
        Regex reg = new Regex(@"^[0-9]{12}$");
        Regex reg2 = new Regex(@"^[0-9]");
        Regex reg3 = new Regex(@"^[0-9]{10}$");
        Regex regmail = new Regex(@"([a-zA-Z0-9]+)([\.{1}])?([a-zA-Z0-9]+)\@(?:gmail|GMAIL)([\.])(?:com|COM)");
        if (String.IsNullOrWhiteSpace(txtstreet.Text) || String.IsNullOrWhiteSpace(txtpin.Text) || String.IsNullOrWhiteSpace(txtarea.Text) || String.IsNullOrWhiteSpace(txtcity.Text) || String.IsNullOrWhiteSpace(txtdoor.Text) || String.IsNullOrWhiteSpace(txtmob.Text) || String.IsNullOrWhiteSpace(txtbranch.Text) || String.IsNullOrWhiteSpace(txtaccname.Text) || String.IsNullOrWhiteSpace(txtbank.Text) || String.IsNullOrWhiteSpace( txtmother.Text) || String.IsNullOrWhiteSpace(dobtxt.Text) || String.IsNullOrWhiteSpace(nametxt.Text) || String.IsNullOrWhiteSpace(txtincom.Text) || String.IsNullOrWhiteSpace(ddlreligion.Text) || String.IsNullOrWhiteSpace(rdlgen.Text) || String.IsNullOrWhiteSpace(emailtxt.Text) || String.IsNullOrWhiteSpace(fathertxt.Text) || String.IsNullOrWhiteSpace(occupationtxt.Text) || String.IsNullOrWhiteSpace(adhartxt.Text) || String.IsNullOrWhiteSpace(ddlcol.Text) || String.IsNullOrWhiteSpace(ddlcourse.Text) || String.IsNullOrWhiteSpace(ddlcourseyear.Text) || String.IsNullOrWhiteSpace(ddlprecourse.Text) || String.IsNullOrWhiteSpace(ddlprecourseyear.Text) || String.IsNullOrWhiteSpace(feetxt.Text) || String.IsNullOrWhiteSpace(TextBox2.Text) || String.IsNullOrWhiteSpace(markstxt.Text) || String.IsNullOrWhiteSpace(txtaccno.Text) || String.IsNullOrWhiteSpace(txtifsc.Text))
        {
            //Response.Redirect("home.aspx");
            Panel4.Visible = true;
            er = 0;
        }
        if (!reg.IsMatch(adhartxt.Text))
        {
            Panel2.Visible = true;
            er = 0;

        }
        if (!reg2.IsMatch(txtincom.Text))
        {
            Panel7.Visible = true;
            er = 0;

        }
        if(!reg3.IsMatch( txtmob.Text))
        {
            Panel3.Visible = true;
            er = 0;

        }
        //bool isEmail = Regex.IsMatch(emailtxt.Text, @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase);
        if (!regmail.IsMatch(emailtxt.Text))
        {
            Panel3.Visible = true;
            er = 0;

        }
        try
        {
            SqlConnection sql = new SqlConnection(con);
            sql.Open();
            SqlCommand cmd = new SqlCommand("select count(aadhar) from cantbl where aadhar=" + adhartxt.Text, sql);
            int rowCount = Convert.ToInt32(cmd.ExecuteScalar());
            if (rowCount >= 1)
            {
                //Sets the value of valid variable to true
                Panel6.Visible = true;
                er = 0;

            }
        }
        catch
        {
            Panel2.Visible = true;
            er = 0;


        }
        try
        {
            if (Convert.ToInt64(feetxt.Text) < Convert.ToInt64(TextBox2.Text))
            {
                Panel5.Visible = true;
                er = 0;
            }
        }
        catch
        {
            Panel5.Visible = true;
            er = 0;


        }
        if (er == 1)
        {

            Panel4.Visible = false;



            Button3.Visible = false;
            Button2.Visible = true;
            String from, pass, msgbody;
            Random rand = new Random();
            randomcode = (rand.Next(999999)).ToString();
            MailMessage msg = new MailMessage();
            to = (emailtxt.Text).ToString();
            from = "mohammedanas1581@gmail.com";
            pass = "mbdxcruowsntlgdw";
            pass = "bvdoxtduxkfkecog";

            msgbody = "Your OTP code is " + randomcode;
            Label1.Text = randomcode;
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
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        containcode = (TextBox8.Text).ToString();

        Label2.Text = containcode;

        if (Label1.Text == Label2.Text)
        {
            //to = TextBox9.Text;
            docsec.Visible = true;
            Button1.Visible = true;
            adhartxt.ReadOnly = true;
            emailtxt.ReadOnly = true;
            nametxt.ReadOnly = true;
            Panel1.Visible = false;
            v.Visible = true;
            tick.Visible = true;
            tick.Width = 75;
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('correct re')", true);
        }
        else
        {

            Button2.Visible = true;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Entered OTP is Incorrect')", true);

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection sql = new SqlConnection(con);
            sql.Open();
            SqlCommand cmd = new SqlCommand("select count(aadhar) from cantbl where aadhar=" + adhartxt.Text, sql);
            int rowCount = Convert.ToInt32(cmd.ExecuteScalar());
            if (rowCount >= 1)
            {
                Response.Redirect("home.aspx?res=done");

            }
        }
        catch
        {    


        }
        /* status.Text = "one";
         Response.Write("<script> alert('Aadhar Already exists!'); </script>");
         string query = "select count(*) from freshtbl where replace(aadhar,' ','')='" + adhartxt.Text.Trim() + "'";//query to check if product is already present
        // string strcon = ConfigurationManager.ConnectionStrings["mdasConnectionString2"].ConnectionString;//create connection string
         SqlConnection sqlcon = new SqlConnection(con);//makes connection to sql
         SqlCommand cmd1 = new SqlCommand(query, sqlcon);//command to do query
         cmd1.Parameters.AddWithValue("@aadhar", adhartxt.Text.Trim());
         sqlcon.Open();//opens connection to sql
         int count = Convert.ToInt32(cmd1.ExecuteScalar());//count number of given product in sql
         status.Text = "two";
         if (count > 0)//checks if product exists
         {
             status.Text = "three";
             //product exists block
             Response.Write("<script> alert('Aadhar Already exists!'); </script>");
             status.Text = "four";
         }
         else
         {*/
        status.Text = "five";
        //product does not exist block

        SqlConnection sqlconn = new SqlConnection(con);//makes connection to sql
        status.Text = "six";
        if (FileUpload1.HasFile)//checks if image is choosen
        {
            status.Text = "seven";
            string path = Server.MapPath("~/appdocs/");
            status.Text = "one";
            if (FileUpload1.HasFile)
            {
                status.Text = "eight";
                string ext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(path + DateTime.Now.Year.ToString() + adhartxt.Text + ext);
                sqlconn.Open();
                string filepn = path + DateTime.Now.Year.ToString() + adhartxt.Text + ext;
                //SqlCommand cmd = new SqlCommand("insert into freshtbl values('" + nametxt.Text + "','" + fathertxt.Text + "','" + occupationtxt.Text + "','" + ddlcourse.SelectedItem.Text + "','" + ddlcourseyear.SelectedItem.Text + "','" + ddlprecourse.SelectedItem.Text + "','" + ddlprecourseyear.SelectedItem.Text + "','" + markstxt.Text + "','" + sslctxt.Text + "','" + putxt.Text + "','" + ddlcol.SelectedItem.Text + "','" + balancetxt.Text + "','" + adhartxt.Text + "','" + DateTime.Now.Year.ToString() + "','"+filepn.ToString()+"','" + emailtxt.Text + "')", sqlconn);
                //this is old oneSqlCommand cmd2 = new SqlCommand("insert into freshtbl" + "(income,name,father,occupation,course,courseyear,pcourse,pcourseyear,pcoursemarks,sslc,pu,institute,totalfee,balancefee,aadhar,year,doc,email) values(@income,@name,@father,@occupation,@course,@courseyear,@pcourse,@pcourseyear,@pcoursemarks,@sslc,@pu,@institute,@totalfee,@balancefee,@aadhar,@year,@doc,@email)", sqlconn);
                SqlCommand cmd2 = new SqlCommand("insert into cantbl" + "(id,name,father,occupation,course,courseyear,pcourse,pcourseyear,pcoursemarks,sslc,pu,institute,totalfee,balancefee,aadhar,year,doc,email,type,stat,income) " +
                                                         "values(@aadhar,@name,@father,@occupation,@course,@courseyear,@pcourse,@pcourseyear,@pcoursemarks,@sslc,@pu,@institute,@totalfee,@balancefee,@aadhar,@year,@doc,@email,@type,@stat,@income)", sqlconn);
                cmd2.Parameters.AddWithValue("@type", 'F');
                cmd2.Parameters.AddWithValue("@stat", "Unapproved");
                cmd2.Parameters.AddWithValue("@income", txtincom.Text);
                cmd2.Parameters.AddWithValue("@name", nametxt.Text);
                cmd2.Parameters.AddWithValue("@father", fathertxt.Text);
                cmd2.Parameters.AddWithValue("@occupation", occupationtxt.Text);
                cmd2.Parameters.AddWithValue("@course", ddlcourse.SelectedItem.Text);
                cmd2.Parameters.AddWithValue("@courseyear", ddlcourseyear.SelectedItem.Text);
                cmd2.Parameters.AddWithValue("@pcourse", ddlprecourse.SelectedItem.Text);
                cmd2.Parameters.AddWithValue("@pcourseyear", ddlprecourseyear.SelectedItem.Text);
                cmd2.Parameters.AddWithValue("@pcoursemarks", markstxt.Text);
                cmd2.Parameters.AddWithValue("@sslc", sslctxt.Text);
                cmd2.Parameters.AddWithValue("@pu", putxt.Text);
                cmd2.Parameters.AddWithValue("@institute", ddlcol.Text);
                cmd2.Parameters.AddWithValue("@totalfee", feetxt.Text);
                cmd2.Parameters.AddWithValue("@balancefee", balancetxt.Text);
                cmd2.Parameters.AddWithValue("@aadhar", adhartxt.Text);
                cmd2.Parameters.AddWithValue("@year", DateTime.Now.Year.ToString());
                cmd2.Parameters.AddWithValue("@doc", filepn.ToString());
                cmd2.Parameters.AddWithValue("@email", emailtxt.Text);
                cmd2.ExecuteNonQuery();
                sqlconn.Close();

                lblname.Text = nametxt.Text;
                lbladhar.Text = adhartxt.Text;
                lblgen.Text = rdlgen.SelectedItem.Text;
                lbldob.Text = dobtxt.Text;
                lblrel.Text = ddlreligion.SelectedItem.Text;
                lblcaste.Text = ddlcaste.SelectedItem.Text;
                lblocc.Text = occupationtxt.Text;
                lblincome.Text = txtincom.Text;
                lblmother.Text = txtmother.Text;
                lblfather.Text = fathertxt.Text;
                lblcol.Text = ddlcol.Text;
                lblcourse.Text = ddlcourse.SelectedItem.Text;
                lblcourseyear.Text = ddlcourseyear.SelectedItem.Text;
                lblprecourse.Text = ddlprecourse.SelectedItem.Text;
                lblprecourseyear.Text = ddlprecourseyear.SelectedItem.Text;
                lblmarks.Text = markstxt.Text;
                lblbal.Text = balancetxt.Text;
                lblacname.Text = txtaccname.Text;
                lblaccno.Text = txtaccno.Text;
                lblbranch.Text = txtbranch.Text;
                lblbank.Text = txtbank.Text;
                lblifsc.Text = txtifsc.Text;
                lblmob.Text = txtmob.Text;
                lblemail.Text = emailtxt.Text;
                lblsslc.Text = sslctxt.Text;
                lblpu.Text = putxt.Text;
                lbldoor.Text = txtdoor.Text;
                lblarea.Text = txtarea.Text;
                lblstreet.Text = txtstreet.Text;
                lblcity.Text = txtcity.Text;
                lblpin.Text = txtpin.Text;
                Response.Write("<script> alert('Hoga re'); </script>");
                status.Text = "nine";
                //generate pdf
                form.Visible = true;
                Response.ContentType = "Application/pdf";
                // Response.TransmitFile("_blank");
                Response.AddHeader("Content-Disposition", "attachment;filename=YourFilename.pdf");
                
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                //form1.RenderControl(hw);
                form.RenderControl(hw);
                StringReader sr = new StringReader(sw.ToString());

                Document doc = new Document(PageSize.A4, 25f, 25f, 15f, 15f);
                // HTMLWorker htw = new HTMLWorker(doc);
                PdfWriter pdfwr = PdfWriter.GetInstance(doc, Response.OutputStream);
                //PdfWriter.GetInstance(doc, new FileStream(Server.MapPath(@"~/appdocs/"), FileMode.Create));
                HtmlPipelineContext hc = new HtmlPipelineContext(null);
                hc.SetTagFactory(Tags.GetHtmlTagProcessorFactory());
                ICSSResolver cssResolver = XMLWorkerHelper.GetInstance().GetDefaultCssResolver(false);
                cssResolver.AddCssFile(Server.MapPath("~/css/form.css"), true);
                IPipeline pipeline = new CssResolverPipeline(cssResolver, new HtmlPipeline(hc, new PdfWriterPipeline(doc, pdfwr)));
                var worker = new XMLWorker(pipeline, true);
                var xmlParse = new XMLParser(true, worker);
                doc.Open();
                xmlParse.Parse(sr);
                xmlParse.Flush();
                doc.Close();
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Write(doc);
                //Response.Redirect("fresh.aspx");
               
                Response.End();
                //   Response.Redirect("home.aspx");
                /* doc.Open();
                 //doc.Add(new Chunk("")); // << this will do the trick. 
                 //StringReader sr = new StringReader(sw.ToString());
                 htw.Parse(sr);
                 doc.Close();
                 Response.Write(doc);
                 Response.End();*/
                //  Response.Redirect("fresh.aspx");
            }

            status.Text = "ten";
            /*string filename = FileUpload1.PostedFile.FileName;//saves filename
            string filepath = "appdocs/" + FileUpload1.FileName;//saves filepath 
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/images/") + filename);//maps filepath
            sqlconn.Open();//opens connection to sql
            SqlCommand cmd = new SqlCommand("insert into prodadd values('" + TextBox1.Text + "','" + filepath + "','" + DropDownList1.SelectedItem.Value + "','" + TextBox2.Text + "','" + DropDownList1.SelectedItem.Value + "','" + TextBox3.Text + "')", sqlconn);//inserts data into sql
            cmd.ExecuteNonQuery();//completes the command
            sqlconn.Close();//connection is closed
            Response.Write("<script> alert('Product addedd Successfully'); </script>");*/
        }
        else
        {
            Response.Write("<script>alert('Please upload your file')</script>");
            docsec.Visible = true;
            Button1.Visible = true;
            adhartxt.ReadOnly = true;
            emailtxt.ReadOnly = true;
            nametxt.ReadOnly = true;
            Panel1.Visible = false;
            v.Visible = true;
            tick.Visible = true;
            tick.Width = 75;
        }
        docsec.Visible = false;
        Button1.Visible = false;
        adhartxt.ReadOnly = false;
        emailtxt.ReadOnly = false;
        nametxt.ReadOnly = false;
        Panel1.Visible = false;
        v.Visible = false;
        tick.Visible = false;
        form.Visible = false;
        // }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
              server control at run time. */
    }





}