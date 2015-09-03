using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

public partial class per_admin_chinhsuabaiviet : System.Web.UI.Page
{
    DataTable dt = new DataTable();
    string mabaiviet = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            mabaiviet = Request.QueryString["articleID"].ToString();
            if(mabaiviet == "")
            {
                Response.Redirect("~/per-admin/dashboard.aspx");
            }
        }
        catch (Exception)
        {
            Response.Redirect("~/per-admin/dashboard.aspx");
        }
        baiviet bv = new baiviet();
        bv.mabaiviet = mabaiviet;
        if(!IsPostBack)
        {
            dt = baiviet_Action.getByID_Baiviet(bv);
            txt_tieude.Value = dt.Rows[0][1].ToString();
            cke_baiviet.Text = dt.Rows[0][3].ToString();
            btn_refresh_Click(sender, e);
        }
    }
    protected void btn_suabaiviet_Click(object sender, EventArgs e)
    {
        baiviet bv = new baiviet();
        bv.mabaiviet = mabaiviet;
        bv.anhbaiviet = ddl_anhbaiviet.SelectedValue.ToString();
        bv.noidung = cke_baiviet.Text;

        bool success = baiviet_Action.update_Baiviet(bv);
        if (success == true)
        {
            Response.Write("<script>alert('Chỉnh sửa hoàn tất')</script>");
        }
        else
        {
            Response.Write("<script>alert('Không thể chỉnh sửa bài viết')</script>");
        }
    }
    protected void ful_uploadanh_FileNameDetermining(object sender, com.flajaxian.FileNameDeterminingEventArgs e)
    {
        e.FileName = Server.MapPath("~/article/" + mabaiviet + "/") + e.File.FileName; 
    }
    protected void btn_refresh_Click(object sender, EventArgs e)
    {
        try
        {
            string[] listFile = Directory.GetFiles(Server.MapPath("~/article/" + mabaiviet));
            DataTable dt_ref = new DataTable();
            dt_ref.Columns.Add(new DataColumn("num", typeof(int)));
            dt_ref.Columns.Add(new DataColumn("link", typeof(string)));
            int num = 1;
            foreach (string i in listFile)
            {
                string pic = Path.GetFileName(i);
                dt_ref.Rows.Add(num, "../article/" + mabaiviet + "/" + pic);
                num++;
            }

            dtl_uploadanh.DataSource = dt_ref;
            dtl_uploadanh.DataBind();

            ddl_anhbaiviet.DataSource = dt_ref;
            ddl_anhbaiviet.DataTextField = "num";
            ddl_anhbaiviet.DataValueField = "link";
            ddl_anhbaiviet.DataBind();
        }
        catch (Exception)
        {
            Response.Write("<script>alert('Ảnh chưa được upload')</script>");
        }
    }
}