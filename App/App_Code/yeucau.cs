using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class yeucau
{
    public string mayeucau { get; set; }
    public string hoten {get; set;}
    public string email { get; set; }
    public string sdt { get; set; }
    public string diachithicong { get; set; }
    public string noidung { get; set; }
    public DateTime ngaygui { get; set; }
    public string tinhtrang { get; set; }

    public yeucau()
    {

    }

    public yeucau(string _mayeucau, string _hoten, string _email, string _sdt, string _diachithicong, string _noidung, DateTime _ngaygui, string _tinhtrang)
    {
        this.mayeucau = _mayeucau;
        this.hoten = _hoten;
        this.email = _email;
        this.sdt = _sdt;
        this.diachithicong = _diachithicong;
        this.noidung = _noidung;
        this.ngaygui = _ngaygui;
        this.tinhtrang = _tinhtrang;
    }
}

public class yeucau_Action
{
    static SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);

    public static DataTable getAll_Yeucau(string trangthai)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("sp_getAll_Yeucau", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@trangthai", trangthai);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("getAll_Baiviet");
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
    public static DataTable getByID_Yeucau(yeucau yc)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("sp_getByID_Yeucau", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mayeucau", yc.mayeucau);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("getByID_Yeucau");
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

    public static bool add_Yeucau(yeucau yc)
    {
        bool success = false;
        SqlCommand cmd = new SqlCommand("sp_add_Yeucau", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mayeucau", yc.mayeucau);
        cmd.Parameters.AddWithValue("@hoten", yc.hoten);
        cmd.Parameters.AddWithValue("@email", yc.email);
        cmd.Parameters.AddWithValue("@diachithicong", yc.diachithicong);
        cmd.Parameters.AddWithValue("@sodienthoai", yc.sdt);
        cmd.Parameters.AddWithValue("@noidung", yc.noidung);
        cmd.Parameters.AddWithValue("@ngaygui", yc.ngaygui);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("add_Yeucau");
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

    public static bool updateStatus_Yeucau(yeucau yc)
    {
        bool success = false;
        SqlCommand cmd = new SqlCommand("sp_changeStatus_Yeucau", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mayeucau", yc.mayeucau);
        cmd.Parameters.AddWithValue("@tinhtrangmoi", yc.tinhtrang);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("changeStatus_Yeucau");
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

    public static bool delete_Yeucau(yeucau yc)
    {
        bool success = false;
        SqlCommand cmd = new SqlCommand("sp_delete_Yeucau", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mayeucau", yc.mayeucau);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("delete_Yeucau");
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