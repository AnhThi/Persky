using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class nhanvien
{
    public string manhanvien { get; set; }
    public string matkhau { get; set; }
    public string chucvu { get; set; }
    public string email { get; set; }
    public string trangthai { get; set; }
    public nhanvien()
    {

    }
    public nhanvien(string _manhanvien, string _matkhau, string _chucvu, string _email, string _trangthai)
    {
        this.manhanvien = _manhanvien;
        this.matkhau = _matkhau;
        this.chucvu = _chucvu;
        this.email = _email;
        this.trangthai = _trangthai;
    }
}

public class nhanvien_Action
{
    static SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);
    public static DataTable check_Nhanvien(nhanvien nv)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("sp_check_Nhanvien", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@manhanvien", nv.manhanvien);
        cmd.Parameters.AddWithValue("@matkhau", nv.matkhau);
        cmd.Parameters.AddWithValue("@chucvu", nv.chucvu);
        cmd.Parameters.AddWithValue("@trangthai", nv.trangthai);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("check_Nhanvien");
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

    public static bool updatepassword_Nhanvien(nhanvien nv, string _matkhaumoi)
    {
        bool success = false;
        SqlCommand cmd = new SqlCommand("sp_updatepassword_Nhanvien", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@email", nv.email);
        cmd.Parameters.AddWithValue("@matkhaumoi", _matkhaumoi);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("updatepassword_Nhanvien");
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

    public static bool changepassword_Nhanvien(nhanvien nv, string _matkhaumoi)
    {
        bool success = false;
        SqlCommand cmd = new SqlCommand("sp_changepassword_Nhanvien", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@manhanvien", nv.manhanvien);
        cmd.Parameters.AddWithValue("@matkhaucu", nv.matkhau);
        cmd.Parameters.AddWithValue("@matkhaumoi", _matkhaumoi);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("changepassword_Nhanvien");
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