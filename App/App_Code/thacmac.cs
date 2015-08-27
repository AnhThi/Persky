using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class thacmac
{
    public string cauhoi { get; set; }
    public string cautraloi { get; set; }
    public DateTime ngaydang { get; set; }
    public thacmac ()
	{

	}
    public thacmac (string _cauhoi, string _cautraloi, DateTime _ngaydang)
	{
        this.cauhoi = _cauhoi;
        this.cautraloi = _cautraloi;
        this.ngaydang = _ngaydang;
	}
}

public class thacmac_Action
{
    static SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["cnn"].ConnectionString);
    public static DataTable getAll_Thacmac()
    {
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("sp_getAll_Thacmac", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("getAll_Thacmac");
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
    public static bool add_Thacmac(thacmac tm)
    {
        bool success = false;
        SqlCommand cmd = new SqlCommand("sp_add_Thacmac", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@cauhoi", tm.cauhoi);
        cmd.Parameters.AddWithValue("@cautraloi", tm.cautraloi);
        cmd.Parameters.AddWithValue("@ngaydang", tm.ngaydang);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("add_Thacmac");
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

    public static bool delete_Thacmac(thacmac tm)
    {
        bool success = false;
        SqlCommand cmd = new SqlCommand("sp_delete_Thacmac", cnn);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@cauhoi", tm.cauhoi);
        cnn.Open();
        SqlTransaction trans = cnn.BeginTransaction("delete_Thacmac");
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