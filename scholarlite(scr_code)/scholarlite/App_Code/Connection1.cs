using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Connection1
/// </summary>
public class Connection1
{
    SqlConnection con = null;
    SqlCommand cmd = null;
    // string sql;
    string connection = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\db1.mdf;Integrated Security=True;";
    public Connection1()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public void open_con()  // to open connection b/w VSstudio and SQL Server
    {
        try
        {
            con = new SqlConnection(connection);
            con.Open();
        }
        catch (Exception)
        {
        }
    }
    public void close_con() // to close connection b/w VSstudio and SQL Server
    {
        try
        {
            con.Close();
        }
        catch (Exception)
        {
            throw;
        }
    }

    public int count(string sql) // to get the count of no of rows in the table w.r.t username. Used in NewUser, Add
    {
        int count1 = 0;
        try
        {
            open_con();
            cmd = new SqlCommand(sql, con);
            count1 = int.Parse(cmd.ExecuteScalar().ToString());
            close_con();
            return count1;
        }
        catch { return 0; }
    }

    public bool insert(string sql) // to insert data in the table rowwise, Used in New User & Add
    {
        try
        {
            open_con();
            cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            close_con();
            return true;
        }
        catch (Exception)//e)
        { return false; }
    }
    public int userid(string sql) // to retrive the userId  and this function id used in Forget password
    {
        int id = 0;
        try
        {
            open_con();
            cmd = new SqlCommand(sql, con);
            id = int.Parse(cmd.ExecuteScalar().ToString());
            close_con();
            return id;
        }
        catch { return 0; }
    }
    public string SecQuesAns(string sql)// to retrive data from the table and this function id used in Forget password
    {
        string data;
        string n = string.Format("0");
        try
        {
            open_con();
            cmd = new SqlCommand(sql, con);
            data = string.Format(cmd.ExecuteScalar().ToString());
            close_con();
            return data;
        }
        catch { return (n); }
    }
    public DataTable fill_table(string sql) // this function is used in the search
    {
        try
        {

            DataTable tab = new DataTable();
            open_con();
            SqlDataAdapter adp = new SqlDataAdapter(sql, con);
            adp.Fill(tab);
            close_con();
            return tab;
        }
        catch { return null; }
    }
    public bool delete(string sql)
    {
        try
        {
            open_con();
            cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            close_con();
            return true;
        }
        catch { return false; }
    }
    public string getdata(string sql)// to retrive data from the table
    {
        string data;
        string n = string.Format("0");
        try
        {
            open_con();
            cmd = new SqlCommand(sql, con);
            data = string.Format(cmd.ExecuteScalar().ToString());
            close_con();
            return data;
        }
        catch { return (n); }
    }

    public bool update(string sql) // to update data in table
    {
        try
        {
            open_con();
            cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            close_con();
            return true;
        }
        catch { return false; }
    }


    public string SAnswer(string sql)
    {
        string data;
        string n = string.Format("0");
        try
        {
            open_con();
            cmd = new SqlCommand(sql, con);
            data = string.Format(cmd.ExecuteScalar().ToString());
            close_con();
            return data;
        }
        catch { return (n); }
    }
}
