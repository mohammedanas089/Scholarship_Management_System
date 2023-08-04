using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class adminhis : System.Web.UI.Page
{
    Connection1 c = new Connection1();

    protected void Page_Load(object sender, EventArgs e)
    {
        lblmsg1.Visible = false;
        
     
        lblmsg3.Visible = false;
        if (Session["admin"] == null)
        {
            Response.Redirect("~/deny.aspx");
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string str1 = string.Format("SELECT  COUNT(*) FROM histbl where id = {0};", TextBox1.Text);
        int count = c.count(str1);
        if (count >= 1)
        {
            string sql = string.Format("Delete  FROM histbl where id = {0};", TextBox1.Text);
            if (c.delete(sql))
            {
                lblmsg1.Visible = true;
                lblmsg1.Text = "Student deleted ";
                Response.Redirect("~/admin/adminhis.aspx");
            }
        }
        else
        {
            lblmsg1.Visible = true;
            lblmsg1.Text = "No Record Exists with this ID: " + TextBox1.Text;
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        string str = string.Format("Select count(*) from histbl where id='{0}';", TextBox1.Text );
        int count = c.count(str);
        if (count >= 1)
        {
            MultiView1.SetActiveView(View1);
            TextBox1.Enabled = false;
            GVDisplay.Visible = false;
            string str2 = string.Format("Select name from histbl where id={0} ;", TextBox1.Text);
            TextBox2.Text = String.Format(c.getdata(str2));
            string str3 = string.Format("Select father from histbl where id={0} ;", TextBox1.Text);
            TextBox3.Text = String.Format(c.getdata(str3));
            string str4 = string.Format("Select occupation from histbl where id={0};", TextBox1.Text);
            TextBox4.Text = String.Format(c.getdata(str4));
            string str5 = string.Format("Select course from histbl where id={0};", TextBox1.Text);
            TextBox5.Text = String.Format(c.getdata(str5));
            string str6 = string.Format("Select courseyear from histbl where id={0};", TextBox1.Text);
            TextBox6.Text = String.Format(c.getdata(str6));
            string str7 = string.Format("Select pcourse from histbl where id={0};", TextBox1.Text);
            TextBox7.Text = String.Format(c.getdata(str7));
            string str8 = string.Format("Select pcourseyear from histbl where id={0};", TextBox1.Text);
            TextBox8.Text = String.Format(c.getdata(str8));
            string str9 = string.Format("Select pcoursemarks from histbl where id={0};", TextBox1.Text);
            TextBox9.Text = String.Format(c.getdata(str9));
            string str10 = string.Format("Select sslc from histbl where id={0};", TextBox1.Text);
            TextBox10.Text = String.Format(c.getdata(str10));
            string str11 = string.Format("Select pu from histbl where id={0};", TextBox1.Text);
            TextBox11.Text = String.Format(c.getdata(str11));
            string str12 = string.Format("Select institute from histbl where id={0};", TextBox1.Text);
            TextBox12.Text = String.Format(c.getdata(str12));
            string str13 = string.Format("Select balancefee from histbl where id={0};", TextBox1.Text);
            TextBox13.Text = String.Format(c.getdata(str13));
            string str14 = string.Format("Select year from histbl where id={0};", TextBox1.Text);
            TextBox14.Text = String.Format(c.getdata(str14));
            string str15 = string.Format("Select email from histbl where id={0};", TextBox1.Text);
            TextBox15.Text = String.Format(c.getdata(str15));
            string str16 = string.Format("Select aadhar from histbl where id={0};", TextBox1.Text);
            TextBox16.Text = String.Format(c.getdata(str16));
            string str17 = string.Format("Select type from histbl where id={0};", TextBox1.Text);
            TextBox17.Text = String.Format(c.getdata(str17));
            string str18 = string.Format("Select sancamount from histbl where id={0};", TextBox1.Text);
            TextBox18.Text = String.Format(c.getdata(str18));
            string str19 = string.Format("Select income from histbl where id={0};", TextBox1.Text);
            TextBox19.Text = String.Format(c.getdata(str19));
            string str20 = string.Format("Select review from histbl where id={0};", TextBox1.Text);
            TextBox20.Text = String.Format(c.getdata(str20));

        }
        else
        {
            lblmsg1.Visible = true;
            lblmsg1.Text = "No Record Exists with this ID: " + TextBox1.Text;
        }

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string str = string.Format("Update histbl set name='{0}', father='{1}' , occupation='{2}', course='{3}', courseyear='{4}', pcourse='{5}', pcourseyear='{6}', pcoursemarks='{7}', sslc='{8}', pu='{9}', institute='{10}', balancefee='{11}', year='{12}', email='{13}', aadhar='{14}', type='{15}', sancamount='{16}', income='{17}', review='{18}' where id='{19}';", TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, TextBox6.Text, TextBox7.Text, TextBox8.Text, TextBox9.Text, TextBox10.Text, TextBox11.Text, TextBox12.Text, TextBox13.Text, TextBox14.Text, TextBox15.Text, TextBox16.Text, TextBox17.Text, TextBox18.Text, TextBox19.Text, TextBox20.Text, TextBox1.Text);
        if (c.update(str))
        {
            lblmsg2.Text = "Updated Successfully";
        }
        else
        {
            lblmsg2.Text = "Not Updated";
        }
    }


    
    
}