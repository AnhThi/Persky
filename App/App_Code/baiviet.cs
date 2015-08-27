using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public class baiviet
{
    public string mabaiviet{ get; set; }
    public string tieude{ get; set;}
    public string anhbaiviet { get; set; }
    public string noidung{ get; set;}
    public DateTime ngaydang{ get; set;}
    public baiviet ()
	{

	}
    public baiviet (string _mabaiviet, string _tieude, string _anhbaiviet, string _noidung, DateTime _ngaydang)
	{
        this.mabaiviet = _mabaiviet;
        this.tieude = _tieude;
        this.anhbaiviet = _anhbaiviet;
        this.noidung = _noidung;
        this.ngaydang = _ngaydang;
	}
}
public class baiviet_Action
{
    static SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);
    public static DataTable getAll_Baiviet()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("sp_getAll_Baiviet", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
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
            if(cnn.State != ConnectionState.Closed)
            {
                cnn.Close();
            }
        }
        return dt;
    }
    public static DataTable getTop_Baiviet(int soluong)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("sp_getTop_Baiviet", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@soluong", soluong);
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
    public static DataTable getByID_Baiviet(baiviet bv)
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("sp_getbyID_Baiviet", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mabaiviet", bv.mabaiviet);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("getByID_Baiviet");
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
    public static bool add_Baiviet(baiviet bv)
    {
        bool success = false;
        SqlCommand cmd = new SqlCommand("sp_add_Baiviet", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mabaiviet", bv.mabaiviet);
        cmd.Parameters.AddWithValue("@tieude", bv.tieude);
        cmd.Parameters.AddWithValue("@anhbaiviet", bv.anhbaiviet);
        cmd.Parameters.AddWithValue("@noidung", bv.noidung);
        cmd.Parameters.AddWithValue("@ngaydang", bv.ngaydang);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("add_Baiviet");
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

    public static bool delete_Baiviet(baiviet bv)
    {
        bool success = false;
        SqlCommand cmd = new SqlCommand("sp_delete_Baiviet", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mabaiviet", bv.mabaiviet);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("delete_Baiviet");
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

    public static bool update_Baiviet(baiviet bv)
    {
        bool success = false;
        SqlCommand cmd = new SqlCommand("sp_update_Baiviet", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@mabaiviet", bv.mabaiviet);
        cmd.Parameters.AddWithValue("@anhbaiviet", bv.anhbaiviet);
        cmd.Parameters.AddWithValue("@noidung", bv.noidung);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("update_Baiviet");
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