using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Default : System.Web.UI.Page
{
    string con = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
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
            SqlDataAdapter sda = new SqlDataAdapter("select * from aprvtbl where(name like '%" + tb.Text + "%' )", sql);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            SqlConnection sql = new SqlConnection(con);

            sql.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select * from aprvtbl", sql);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
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
                string query = "UPDATE aprvtbl SET name=@note,sancamount=@date  WHERE id = @slnos";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@note", (GridView1.Rows[e.RowIndex].FindControl("txtnote") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@date", Convert.ToInt64((GridView1.Rows[e.RowIndex].FindControl("txtdate") as TextBox).Text.Trim()));

                sqlCmd.Parameters.AddWithValue("@slnos", Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()));
                sqlCmd.ExecuteNonQuery();
                GridView1.EditIndex = -1;
                PopulateGridview();

            }
        }
        catch (Exception ex)
        {
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
            SqlDataAdapter sda = new SqlDataAdapter("select * from aprvtbl where(name like '%" + tb.Text + "%' )", sql);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            SqlConnection sql = new SqlConnection(con);

            sql.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select * from aprvtbl", sql);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }









}