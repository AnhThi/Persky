using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public class khachhang
{
    public string makhachhang { get; set; }
    public string tenkhachhang { get; set; }
    public string sodienthoai { get; set; }
    public string email { get; set; }
    public string diachi { get; set; }

    public khachhang()
    {

    }

    public khachhang(string _makhachhang, string _tenkhachhang, string _sodienthoai, string _email, string _diachi)
    {
        this.makhachhang = _makhachhang;
        this.tenkhachhang = _tenkhachhang;
        this.sodienthoai = _sodienthoai;
        this.email = _email;
        this.diachi = _diachi;
    }
}

public class khachhang_Action
{
    static SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);

    public static DataTable getAll_Khachhang()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("sp_getAll_Khachhang", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("getAll_Khachhang");
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

    public static bool add_Khachhang(khachhang kh)
    {
        bool success = false;
        SqlCommand cmd = new SqlCommand("sp_add_Khachhang", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@makhachhang", kh.makhachhang);
        cmd.Parameters.AddWithValue("@tenkhachhang", kh.tenkhachhang);
        cmd.Parameters.AddWithValue("@sodienthoai", kh.sodienthoai);
        cmd.Parameters.AddWithValue("@diachi", kh.diachi);
        cmd.Parameters.AddWithValue("@email", kh.email);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("add_Khachhang");
        try
        {
            cmd.Transaction = trans;
            cmd.ExecuteNonQuery();
            trans.Commit();
            success = true;
        }
        catch (Exception)
        {
            success = false;
            trans.Rollback();
        }
        finally
        {
            if (cnn.State != ConnectionState.Closed)
            {
                cnn.Close();
            }
        }
        return success;
    }
}