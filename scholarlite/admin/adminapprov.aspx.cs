using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminapprov : System.Web.UI.Page
{
    string con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Form.DefaultButton = Button3.UniqueID;

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
    void PopulateGridview()
    {

        TextBox tb = this.Master.FindControl("tbm") as TextBox;

        if (!String.IsNullOrWhiteSpace(tb.Text))
        {
            Label3.Visible = true;
            SqlConnection sql = new SqlConnection(con);//makes connection to sql
                                                       //selects product as given in searchbox and displays only them
            SqlDataAdapter sda = new SqlDataAdapter("select * from cantbl where (name like '%" + tb.Text + "%' ) or (course like '%" + tb.Text + "%') or (id like '%" + tb.Text + "%' )", sql);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            ViewState["dirState"] = dt;
            ViewState["sortdr"] = "Asc";
        }
        else
        {
            SqlConnection sql = new SqlConnection(con);

            sql.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select * from cantbl where stat='approved'", sql);
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
        try
        {
        using (SqlConnection sqlCon = new SqlConnection(con))
        {
            sqlCon.Open();
            string query = "UPDATE cantbl SET sancamount=@sancamount,name=@n,father=@f,occupation=@o,pcourseyear=@p,pcoursemarks=@m,sslc=@sslc,pu=@pu,institute=@i,aadhar=@a  WHERE id = @id";
            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            sqlCmd.Parameters.AddWithValue("@sancamount", Convert.ToInt64((GridView1.Rows[e.RowIndex].FindControl("txtsancamount") as TextBox).Text.Trim()));
                sqlCmd.Parameters.AddWithValue("@n", (GridView1.Rows[e.RowIndex].FindControl("n") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@f", (GridView1.Rows[e.RowIndex].FindControl("f") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@o", (GridView1.Rows[e.RowIndex].FindControl("o") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@p", (GridView1.Rows[e.RowIndex].FindControl("p") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@m", (GridView1.Rows[e.RowIndex].FindControl("m") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@sslc", (GridView1.Rows[e.RowIndex].FindControl("sslc") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@pu",   (GridView1.Rows[e.RowIndex].FindControl("pu") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@i",    (GridView1.Rows[e.RowIndex].FindControl("i") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@a",    Convert.ToInt64((GridView1.Rows[e.RowIndex].FindControl("a") as TextBox).Text.Trim()));
                sqlCmd.Parameters.AddWithValue("@id",   Convert.ToInt64(GridView1.DataKeys[e.RowIndex].Value.ToString()));
            sqlCmd.ExecuteNonQuery();
            GridView1.EditIndex = -1;
            PopulateGridview();

        }
      }
           catch (Exception ex)
       {
           Response.Write("<script>alert('Enter Valid Sanction amount')</script>;");

       }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "sanction")
        {
            SqlConnection sql = new SqlConnection(con);
            sql.Open();
            SqlCommand cmd6 = new SqlCommand("select sancamount from cantbl where id=" + Convert.ToInt64(e.CommandArgument.ToString()), sql);
            Int64 sanc=Convert.ToInt64(cmd6.ExecuteScalar());
            if (sanc != 0)
            {

                SqlCommand cmd = new SqlCommand("insert into sanctbl(type,review,income,id,name,father,occupation,course,courseyear,pcourse,pcourseyear,pcoursemarks,sslc,pu,institute,balancefee,year,email,aadhar,sancamount) " +
                "select type,review,income,id,name,father,occupation,course,courseyear,pcourse,pcourseyear,pcoursemarks,sslc,pu,institute,balancefee,year,email,aadhar,sancamount from cantbl" +
                " where id=" + Convert.ToInt64(e.CommandArgument.ToString()), sql);
            SqlCommand cmd1 = new SqlCommand("delete from cantbl where id=" + Convert.ToInt64(e.CommandArgument.ToString()), sql);
            cmd.ExecuteNonQuery();
            cmd1.ExecuteNonQuery();
            Response.Redirect("adminapprov.aspx");
            }
            else
            {
                Response.Write("<script>alert('Sanction amount cannot be Zero')</script>;");
            }
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
            SqlDataAdapter sda = new SqlDataAdapter("select * from cantbl where stat='approved' and ( (name like '%" + tb.Text + "%' ) or (course like '%" + tb.Text + "%') or (aadhar like '%" + tb.Text + "%' ) or (id like '%" + tb.Text + "%' ))", sql);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            SqlConnection sql = new SqlConnection(con);

            sql.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select * from cantbl where stat='approved'", sql);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
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

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        PopulateGridview();
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
       SqlCommand cmd = new SqlCommand("update cantbl set review=@review where id=@id", sql);
       cmd.Parameters.AddWithValue("@review", review.Text);
       cmd.Parameters.AddWithValue("@id", r1.Cells[2].Text);
       
       cmd.ExecuteNonQuery();
       Response.Redirect("adminapprov.aspx");
    }
}