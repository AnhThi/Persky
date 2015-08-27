using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class donvitinh
{
    public string madonvitinh { get; set; }
    public string tendonvitinh { get; set; }
    public donvitinh()
    {

    }
    public donvitinh(string _madonvitinh,string _donvitinh)
    {
        this.madonvitinh = _madonvitinh;
        this.tendonvitinh = _donvitinh;
    }
}

public class donvitinh_Action
{
    static SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);
    public static DataTable getAll_Donvitinh()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("sp_getAll_Donvitinh", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("getAll_DVT");
        try
        {
            cmd.Transaction = trans;
            dt.Load(cmd.ExecuteReader());
            trans.Commit();
        }
        catch (Exception)
        {
            trans.Rollback();
        }
        finally
        {
            if (cnn.State != ConnectionState.Closed)
            {
                cnn.Close();
            }
        }
        return dt;
    }
}