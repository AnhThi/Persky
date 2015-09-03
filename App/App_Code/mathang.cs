using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class mathang
{
    public string mamathang { get; set; }
    public string tenmathang { get; set; }
    public string madanhmuc { get; set; }
    public string mota { get; set; }
    public string donvitinh { get; set; }
    public string ghichu { get; set; }
    public string thumuchinh { get; set; }
    public string anhdaidien { get; set; }
    public DateTime ngaydang { get; set; }
    public int danhgia { get; set; }

    public mathang()
    {

    }
    public mathang(string _mamathang, string _tenmathang, string _madanhmuc, string _mota, string _donvitinh, string _ghichu, string _thumuchinh, string _anhdaidien, DateTime _ngaydang, int _danhgia)
    {
        this.mamathang = _mamathang;
        this.tenmathang = _tenmathang;
        this.madanhmuc = _madanhmuc;
        this.mota = _mota;
        this.donvitinh = _donvitinh;
        this.ghichu = _ghichu;
        this.thumuchinh = _thumuchinh;
        this.anhdaidien = _anhdaidien;
        this.ngaydang = _ngaydang;
        this.danhgia = _danhgia;
    }
}

public class mathang_Action
{
    static SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);
    public static bool add_Mathang(mathang mh)
    {
        bool success = false;
        SqlCommand cmd = new SqlCommand("sp_add_Mathang", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mamathang", mh.mamathang);
        cmd.Parameters.AddWithValue("@madanhmuc", mh.madanhmuc);
        cmd.Parameters.AddWithValue("@mota", mh.mota);
        cmd.Parameters.AddWithValue("@tenmathang", mh.tenmathang);
        cmd.Parameters.AddWithValue("@donvitinh", mh.donvitinh);
        cmd.Parameters.AddWithValue("@ghichu", mh.ghichu);
        cmd.Parameters.AddWithValue("@thumuchinh", mh.thumuchinh);
        cmd.Parameters.AddWithValue("@anhdaidien", mh.anhdaidien);
        cmd.Parameters.AddWithValue("@ngaydang", mh.ngaydang);
        cmd.Parameters.AddWithValue("@danhgia", mh.danhgia);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("add_Mathang");
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

    public static DataTable getByType_Mathang(mathang mh)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("sp_getByType_Mathang", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@madanhmuc", mh.madanhmuc);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("getByType_Mathang");
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

    public static DataTable getByID_Mathang(mathang mh)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("sp_getByID_Mathang", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mamathang", mh.mamathang);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("getByID_Mathang");
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

    public static DataTable getTop_Mautran(int soluong)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("sp_getTop_Mautran", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@soluong", soluong);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("getAll_Mautran");
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

    public static DataTable getTop_Vattu(int soluong)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("sp_getTop_Vattu", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@soluong", soluong);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("getAll_Vattu");
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

    public static DataTable getAll_Mautran()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("sp_getAll_Mautran", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("getAll_Mautran");
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

    public static DataTable getFull_Mautran()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("sp_getFull_Mautran", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("getFull_Mautran");
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

    public static DataTable getFull_Vattu()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("sp_getFull_Vattu", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("getFull_Vattu");
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

    public static DataTable getAll_Vattu()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("sp_getAll_Vattu", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("getAll_Vattu");
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

    public static bool delete_Mathang(mathang mh)
    {
        bool success = false;
        SqlCommand cmd = new SqlCommand("sp_delete_Mathang", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mamathang", mh.mamathang);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("delete_Mathang");
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