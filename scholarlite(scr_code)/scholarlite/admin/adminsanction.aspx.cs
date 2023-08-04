using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminsanction : System.Web.UI.Page
{
    string con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        review.Visible = false;
        Button4.Visible = false;
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ContentType = "~/appdocs/";
        Response.AddHeader("content-disposition", "attachment;filename=userinfo.xls");
        Response.Charset = "";
        System.IO.StringWriter sw = new System.IO.StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(sw);
        GridView1.RenderControl(htw);
        Response.Output.Write(sw.ToString());
        Response.End();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlConnection sql = new SqlConnection(con);
        sql.Open();
        SqlCommand cmd4 = new SqlCommand("delete from cantbl", sql);
       SqlCommand cmd5 = new SqlCommand("INSERT INTO histbl SELECT * FROM sanctbl" , sql);
       SqlCommand cmd = new SqlCommand("insert into cantbl(sancamount,review,income,id,name,father,occupation,course,courseyear,pcourse,pcourseyear," +
           "pcoursemarks,sslc,pu,institute,balancefee,year,email,aadhar,type,totalfee,doc) select sancamount,review,income,id,name,father,occupation," +
           "course,courseyear,pcourse,pcourseyear,pcoursemarks,sslc,pu,institute,balancefee,year,email,aadhar,type,balancefee,email from" +
           " sanctbl", sql);
       SqlCommand cmd3 = new SqlCommand("update cantbl set type='R'", sql);
       SqlCommand cmd2 = new SqlCommand("delete from sanctbl", sql);
       cmd4.ExecuteNonQuery();
       cmd5.ExecuteNonQuery();

        cmd.ExecuteNonQuery();

        cmd3.ExecuteNonQuery();
        cmd2.ExecuteNonQuery();
        

        Response.Redirect("adminsanction.aspx");

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox tb = this.Master.FindControl("tbm") as TextBox;
        if (!String.IsNullOrWhiteSpace(tb.Text))
        {
            Label3.Visible = true;
            SqlConnection sql = new SqlConnection(con);//makes connection to sql
                                                       //selects product as given in searchbox and displays only them
            SqlDataAdapter sda = new SqlDataAdapter("select * from sanctbl where(name like '%" + tb.Text + "%' ) or (aadhar like '%" + tb.Text + "%' ) or (id like '%" + tb.Text + "%' )", sql);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSourceID = null;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            SqlConnection sql = new SqlConnection(con);

            sql.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select * from sanctbl", sql);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
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
         SqlCommand cmd = new SqlCommand("update sanctbl set review=@review where id=@aadhar", sql);
         cmd.Parameters.AddWithValue("@review", review.Text);
         cmd.Parameters.AddWithValue("@aadhar", r1.Cells[2].Text);
         cmd.ExecuteNonQuery();
         Response.Redirect("adminsanction.aspx");
        
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
        void PopulateGridview()
    {
        TextBox tb = this.Master.FindControl("tbm") as TextBox;

        if (!String.IsNullOrWhiteSpace(tb.Text))
        {
            Label3.Visible = true;
            SqlConnection sql = new SqlConnection(con);//makes connection to sql
                                                       //selects product as given in searchbox and displays only them
            SqlDataAdapter sda = new SqlDataAdapter("select * from sanctbl" +
                "((name like '%" + tb.Text + "%' ) or (course like '%" + tb.Text + "%') or (aadhar like '%" + tb.Text + "%' ))", sql);
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
            SqlDataAdapter sda = new SqlDataAdapter("select * from sanctbl ", sql);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            ViewState["dirState"] = dt;
            ViewState["sortdr"] = "Asc";

        }
    }
}