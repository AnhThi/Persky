using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class duan
{
    public string maduan { get; set; }
    public string tenduan { get; set; }
    public string makhachhang { get; set; }
    public string boanh { get; set; }
    public string ngaykhoicong { get; set; }
    public string ngayhoanthanh { get; set; }
    public string dientich { get; set; }
    public string diachi { get; set; }

    public duan()
    {

    }

    public duan(string _maduan, string _tenduan, string _makhachhang, string _boanh, string _ngaykhoicong, string _ngayhoanthanh, string _dientich, string _diachi)
    {
        this.maduan = _maduan;
        this.tenduan = _tenduan;
        this.makhachhang = _makhachhang;
        this.boanh = _boanh;
        this.ngaykhoicong = _ngaykhoicong;
        this.ngayhoanthanh = _ngayhoanthanh;
        this.dientich = _dientich;
        this.diachi = _diachi;
    }
}

public class duan_Action
{
    static SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);
    public static DataTable getAll_Duan()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("sp_getAll_Duan", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("getAll_Duan");
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
    public static DataTable getTop_Duan()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("sp_getTop_Duan", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("getTop_Duan");
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

    public static DataTable getByID_Duan(string maduan)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("sp_getById_Duan", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@maduan", maduan);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("getByID_Duan");
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

    public static bool add_Duan(duan da)
    {
        bool success = false;
        SqlCommand cmd = new SqlCommand("sp_add_Duan", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@maduan", da.maduan);
        cmd.Parameters.AddWithValue("@tenduan", da.tenduan);
        cmd.Parameters.AddWithValue("@makhachhang", da.makhachhang);
        cmd.Parameters.AddWithValue("@boanh", da.boanh);
        cmd.Parameters.AddWithValue("@ngaykhoicong", da.ngaykhoicong);
        cmd.Parameters.AddWithValue("@ngayhoanthanh", da.ngayhoanthanh);
        cmd.Parameters.AddWithValue("@dientich", da.dientich);
        cmd.Parameters.AddWithValue("@diachi", da.diachi);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("add_Duan");
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