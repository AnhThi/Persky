using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using com.flajaxian;
using System.IO;
using System.Data;

public partial class per_admin_default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        selected_tab.Value = Request.Form[selected_tab.UniqueID];
        if (Session["dangnhap"].ToString() == "refuse")
        {
            Response.Redirect("~/per-admin/default.aspx");
        }

        if (!IsPostBack)
        {
            //----------------- YÊU CẦU --------------------------

            grv_chuaduyet.DataSource = yeucau_Action.getAll_Yeucau("CHƯA DUYỆT");
            grv_chuaduyet.DataBind();

            grv_choxuli.DataSource = yeucau_Action.getAll_Yeucau("CHỜ XỬ LÍ");
            grv_choxuli.DataBind();

            grv_daduyet.DataSource = yeucau_Action.getAll_Yeucau("ĐÃ DUYỆT");
            grv_daduyet.DataBind();
            //----------------- BÀI VIẾT --------------------------

            dtl_baiviet.DataSource = baiviet_Action.getAll_Baiviet();
            dtl_baiviet.DataBind();
            txt_mabv.Value = "BV-" + DateTime.Now.ToString("yyyyMMddhhmmss");

            //----------------- MẪU TRẦN --------------------------

            txt_mamautran.Value = "MT-" + DateTime.Now.ToString("yyyyMMddhhmmss");
            lbl_thumucanhmautran.InnerText = txt_mamautran.Value;

            ddl_danhmucmautran.DataSource = danhmuchang_Action.getAll_Danhmuchang();
            ddl_danhmucmautran.DataTextField = "tendanhmuc";
            ddl_danhmucmautran.DataValueField = "madanhmuc";
            ddl_danhmucmautran.DataBind();

            dtl_dsmautran.DataSource = mathang_Action.getFull_Mautran();
            dtl_dsmautran.DataBind();
            //----------------- VẬT TƯ --------------------------

            txt_mavattu.Value = "VT-" + DateTime.Now.ToString("yyyyMMddhhmmss");
            lbl_thumucchua.InnerText = txt_mavattu.Value;

            ddl_danhmucvattu.DataSource = danhmuchang_Action.getAll_Danhmuchang();
            ddl_danhmucvattu.DataTextField = "tendanhmuc";
            ddl_danhmucvattu.DataValueField = "madanhmuc";
            ddl_danhmucvattu.DataBind();

            ddl_donvitinhvattu.DataSource = donvitinh_Action.getAll_Donvitinh();
            ddl_donvitinhvattu.DataTextField = "donvitinh";
            ddl_donvitinhvattu.DataValueField = "madvt";
            ddl_donvitinhvattu.DataBind();

            dtl_dsvattu.DataSource = mathang_Action.getFull_Vattu();
            dtl_dsvattu.DataBind();

            //----------------- KHÁCH HÀNG --------------------------

            txt_makhachhang.Value = "KH-" + DateTime.Now.ToString("yyyyMMddhhmmss");

            grv_dskhachhang.DataSource = khachhang_Action.getAll_Khachhang();
            grv_dskhachhang.DataBind();

            //----------------- DỰ ÁN --------------------------

            ddl_dskhachhang.DataSource = khachhang_Action.getAll_Khachhang();
            ddl_dskhachhang.DataTextField = "tenkhachhang";
            ddl_dskhachhang.DataValueField = "makhachhang";
            ddl_dskhachhang.DataBind();

            txt_maduan.Value = "DA-" + DateTime.Now.ToString("yyyyMMddhhmmss");
            lbl_thumucanhduan.InnerText = txt_maduan.Value;

            dtl_dsduan.DataSource = duan_Action.getFull_Duan();
            dtl_dsduan.DataBind();

            //----------------- THẮC MÁC --------------------------
            grv_thacmac.DataSource = thacmac_Action.getAll_Thacmac();
            grv_thacmac.DataBind();
            //----------------- SLIDER --------------------------
            show_Slider();
        }
    }

    protected void btn_thaydoimatkhau_Click(object sender, EventArgs e)
    {
        nhanvien nv = new nhanvien();
        nv.manhanvien = common.manhanvien;
        nv.matkhau = txt_matkhaucu.Value;
        bool success = false;
        success = nhanvien_Action.changepassword_Nhanvien(nv, txt_matkhaumoi.Value);
        if (success == true)
        {
            common.matkhau = txt_matkhaumoi.Value;
            Response.Write("<script>alert('Thay đổi mật khẩu thành công')</script>");
        }
        else
        {
            Response.Write("<script>alert('Không thể thay đổi mật khẩu')</script>");
        }
    }
    protected void btn_dangxuat_Click(object sender, EventArgs e)
    {
        Session["dangnhap"] = "refuse";
        Response.Redirect("~/per-admin/default.aspx");
    }
//----------------------------------------- YÊU CẦU ----------------------------------------------------------------------
    #region YÊU CẦU
    protected void grv_chuaduyet_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        string mayeucau = grv_chuaduyet.DataKeys[e.NewSelectedIndex].Value.ToString();
        Response.Redirect("~/chitietyeucau.aspx?requestID=" + mayeucau);
    }

    protected void grv_chuaduyet_RowEditing(object sender, GridViewEditEventArgs e)
    {
        string mayeucau = grv_chuaduyet.DataKeys[e.NewEditIndex].Value.ToString();
        yeucau yc = new yeucau();
        yc.mayeucau = mayeucau;
        yc.tinhtrang = "CHỜ XỬ LÍ";
        try
        {
            bool success = yeucau_Action.updateStatus_Yeucau(yc);
            grv_chuaduyet.DataSource = yeucau_Action.getAll_Yeucau("CHƯA DUYỆT");
            grv_chuaduyet.DataBind();

            grv_choxuli.DataSource = yeucau_Action.getAll_Yeucau("CHỜ XỬ LÍ");
            grv_choxuli.DataBind();

            grv_daduyet.DataSource = yeucau_Action.getAll_Yeucau("ĐÃ DUYỆT");
            grv_daduyet.DataBind();
        }
        catch (Exception)
        {
            Response.Write("<script>alert('Cập nhật thất bại')</script>");
        }
    }

    protected void grv_chuaduyet_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string mayeucau = grv_chuaduyet.DataKeys[e.RowIndex].Value.ToString();
        yeucau yc = new yeucau();
        yc.mayeucau = mayeucau;
        yc.tinhtrang = "ĐÃ DUYỆT";
        try
        {
            bool success = yeucau_Action.updateStatus_Yeucau(yc);
            grv_chuaduyet.DataSource = yeucau_Action.getAll_Yeucau("CHƯA DUYỆT");
            grv_chuaduyet.DataBind();

            grv_choxuli.DataSource = yeucau_Action.getAll_Yeucau("CHỜ XỬ LÍ");
            grv_choxuli.DataBind();

            grv_daduyet.DataSource = yeucau_Action.getAll_Yeucau("ĐÃ DUYỆT");
            grv_daduyet.DataBind();
        }
        catch (Exception)
        {
            Response.Write("<script>alert('Cập nhật thất bại')</script>");
        }
    }

    protected void grv_choxuli_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        string mayeucau = grv_choxuli.DataKeys[e.NewSelectedIndex].Value.ToString();
        Response.Redirect("~/chitietyeucau.aspx?requestID=" + mayeucau);
    }

    protected void grv_choxuli_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string mayeucau = grv_choxuli.DataKeys[e.RowIndex].Value.ToString();
        yeucau yc = new yeucau();
        yc.mayeucau = mayeucau;
        yc.tinhtrang = "ĐÃ DUYỆT";
        try
        {
            bool success = yeucau_Action.updateStatus_Yeucau(yc);
            grv_chuaduyet.DataSource = yeucau_Action.getAll_Yeucau("CHƯA DUYỆT");
            grv_chuaduyet.DataBind();

            grv_choxuli.DataSource = yeucau_Action.getAll_Yeucau("CHỜ XỬ LÍ");
            grv_choxuli.DataBind();

            grv_daduyet.DataSource = yeucau_Action.getAll_Yeucau("ĐÃ DUYỆT");
            grv_daduyet.DataBind();
        }
        catch (Exception)
        {
            Response.Write("<script>alert('Cập nhật thất bại')</script>");
        }
    }

    protected void grv_daduyet_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        string mayeucau = grv_daduyet.DataKeys[e.NewSelectedIndex].Value.ToString();
        Response.Redirect("~/chitietyeucau.aspx?requestID=" + mayeucau);
    }

    protected void grv_daduyet_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string mayeucau = grv_daduyet.DataKeys[e.RowIndex].Value.ToString();
        yeucau yc = new yeucau();
        yc.mayeucau = mayeucau;
        try
        {
            bool success = yeucau_Action.delete_Yeucau(yc);
            grv_chuaduyet.DataSource = yeucau_Action.getAll_Yeucau("CHƯA DUYỆT");
            grv_chuaduyet.DataBind();

            grv_choxuli.DataSource = yeucau_Action.getAll_Yeucau("CHỜ XỬ LÍ");
            grv_choxuli.DataBind();

            grv_daduyet.DataSource = yeucau_Action.getAll_Yeucau("ĐÃ DUYỆT");
            grv_daduyet.DataBind();
        }
        catch (Exception)
        {
            Response.Write("<script>alert('Xóa yêu cầu thất bại')</script>");
        }
    }

    #endregion

    //----------------------------------------- BÀI VIẾT ----------------------------------------------------------------------
    #region BÀI VIẾT
    protected void ful_uploadanh_FileReceived(object sender, com.flajaxian.FileReceivedEventArgs e)
    {
        
    }
    protected void ful_uploadanh_FileNameDetermining(object sender, FileNameDeterminingEventArgs e)
    {
        if (!Directory.Exists(Server.MapPath("~/article/" + txt_mabv.Value)))
        {
            Directory.CreateDirectory(Server.MapPath("~/article/" + txt_mabv.Value));
        }
        e.FileName = Server.MapPath("~/article/" + txt_mabv.Value + "/") + e.File.FileName;       
    }
    protected void btn_refresh_Click(object sender, EventArgs e)
    {
        if(txt_mabv.Value != "")
        {
            try
            {
                string[] listFile = Directory.GetFiles(Server.MapPath("~/article/" + txt_mabv.Value));
                DataTable dt = new DataTable();
                dt.Columns.Add(new DataColumn("num", typeof(int)));
                dt.Columns.Add(new DataColumn("link", typeof(string)));
                int num = 1;
                foreach (string i in listFile)
                {
                    string pic = Path.GetFileName(i);
                    dt.Rows.Add(num, "../article/" + txt_mabv.Value + "/" + pic);
                    num++;
                }
                dtl_uploadanh.DataSource = dt;
                dtl_uploadanh.DataBind();
                ddl_anhbaiviet.DataSource = dt;
                ddl_anhbaiviet.DataTextField = "num";
                ddl_anhbaiviet.DataValueField = "link";
                ddl_anhbaiviet.DataBind();
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Ảnh chưa được upload')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Tiêu đề chưa được nhập')</script>");
        }
    }
    protected void btn_dangbaiviet_Click(object sender, EventArgs e)
    {
        if(txt_tieude.Value != "" && cke_baiviet.Text != "")
        {
            baiviet bv = new baiviet();
            bv.mabaiviet = txt_mabv.Value;
            bv.tieude = txt_tieude.Value;
            bv.anhbaiviet = ddl_anhbaiviet.SelectedValue;
            bv.noidung = cke_baiviet.Text;
            bv.ngaydang = DateTime.Now;
            bool success = baiviet_Action.add_Baiviet(bv);
            if (success)
            {
                Response.Write("<script>alert('Bài viết đã được đăng')</script>");
                txt_mabv.Value = "BV-" + DateTime.Now.ToString("yyyyMMddhhmmss");
                dtl_baiviet.DataSource = baiviet_Action.getAll_Baiviet();
                dtl_baiviet.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Error')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Các trường dữ liệu chưa được nhập đầy đủ')</script>");
        }
    }
    protected void dtl_baiviet_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        string[] argu = e.CommandArgument.ToString().Split(new char[] { '#' });
        baiviet bv = new baiviet();
        bv.mabaiviet = argu[0];
        bool success = baiviet_Action.delete_Baiviet(bv);
        if (success == true)
        {
            Directory.Delete(Server.MapPath(@"~/article/" + argu[0]), true);
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        else
        {
            Response.Write("<script>alert('Xóa bài viết thất bại')</script>");
        }
    }
    protected void dtl_baiviet_EditCommand(object source, DataListCommandEventArgs e)
    {
        Response.Redirect("~/per-admin/chinhsuabaiviet.aspx?articleID=" + e.CommandArgument.ToString());
    }
    #endregion

    //----------------------------------------- MẪU TRẦN ----------------------------------------------------------------------
    #region MẪU TRẦN
    protected void ful_anhmautran_FileNameDetermining(object sender, FileNameDeterminingEventArgs e)
    {
        if (!Directory.Exists(Server.MapPath("~/mautran/" + txt_mamautran.Value)))
        {
            Directory.CreateDirectory(Server.MapPath("~/mautran/" + txt_mamautran.Value));
        }
        e.FileName = Server.MapPath("~/mautran/" + txt_mamautran.Value + "/") + e.File.FileName;
    }
    protected void btn_themmautran_Click(object sender, EventArgs e)
    {
        mathang mh = new mathang();
        mh.mamathang = txt_mamautran.Value;
        mh.madanhmuc = ddl_danhmucmautran.SelectedValue;
        mh.tenmathang = txt_tenmautran.Value;
        mh.ghichu = txt_ghichumautran.Text;
        mh.thumuchinh = txt_mamautran.Value;
        mh.mota = "";
        mh.donvitinh = "Khong DVT";
        mh.anhdaidien = ddl_anhdaidienmautran.SelectedValue;
        mh.ngaydang = DateTime.Now;
        mh.danhgia = 0;
        bool success = mathang_Action.add_Mathang(mh);
        if (success == true)
        {
            dtl_dsmautran.DataSource = mathang_Action.getFull_Mautran();
            dtl_dsmautran.DataBind();
            Response.Write("<script>alert('Thêm mẫu trần thành công')</script>");
        }
        else
        {
            Response.Write("<script>alert('Thêm mẫu trần không thành công')</script>");
        }
    }
    protected void btn_hienthianhmautran_Click(object sender, EventArgs e)
    {
        try
        {
            string[] listFile = Directory.GetFiles(Server.MapPath("~/mautran/" + txt_mamautran.Value));
            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("num", typeof(int)));
            dt.Columns.Add(new DataColumn("link", typeof(string)));
            int num = 1;
            foreach (string i in listFile)
            {
                string pic = Path.GetFileName(i);
                dt.Rows.Add(num, "../mautran/" + txt_mamautran.Value + "/" + pic);
                num++;
            }
            dtl_anhmautran.DataSource = dt;
            dtl_anhmautran.DataBind();

            ddl_anhdaidienmautran.DataSource = dt;
            ddl_anhdaidienmautran.DataTextField = "num";
            ddl_anhdaidienmautran.DataValueField = "link";
            ddl_anhdaidienmautran.DataBind();
        }
        catch (Exception)
        {
            Response.Write("<script>alert('Ảnh chưa được upload')</script>");
        }
    }

    protected void dtl_dsmautran_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        string argu = e.CommandArgument.ToString();
        mathang mh = new mathang();
        mh.mamathang = argu;
        bool success = mathang_Action.delete_Mathang(mh);
        if (success == true)
        {
            Directory.Delete(Server.MapPath(@"~/mautran/" + argu), true);

            Response.Redirect(Request.Url.AbsoluteUri);
        }
        else
        {
            Response.Write("<script>alert('Xóa mẫu trần thất bại')</script>");
        }
    }

    #endregion
    //----------------------------------------- VẬT TƯ ----------------------------------------------------------------------
    #region VẬT TƯ
    protected void ful_uploadanhvattu_FileNameDetermining(object sender, FileNameDeterminingEventArgs e)
    {
        if (!Directory.Exists(Server.MapPath("~/vattu/" + txt_mavattu.Value)))
        {
            Directory.CreateDirectory(Server.MapPath("~/vattu/" + txt_mavattu.Value));
        }
        e.FileName = Server.MapPath("~/vattu/" + txt_mavattu.Value + "/") + e.File.FileName;
    }
    protected void btn_hienanhvattu_Click(object sender, EventArgs e)
    {
        try
        {
            string[] listFile = Directory.GetFiles(Server.MapPath("~/vattu/" + txt_mavattu.Value));
            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("num", typeof(int)));
            dt.Columns.Add(new DataColumn("link", typeof(string)));
            int num = 1;
            foreach (string i in listFile)
            {
                string pic = Path.GetFileName(i);
                dt.Rows.Add(num, "../vattu/" + txt_mavattu.Value + "/" + pic);
                num++;
            }
            dtl_anhvattu.DataSource = dt;
            dtl_anhvattu.DataBind();
            ddl_anhdaidienvattu.DataSource = dt;
            ddl_anhdaidienvattu.DataTextField = "num";
            ddl_anhdaidienvattu.DataValueField = "link";
            ddl_anhdaidienvattu.DataBind();
        }
        catch (Exception)
        {
            Response.Write("<script>alert('Ảnh chưa được upload')</script>");
        }
    }
    protected void btn_themvattu_Click(object sender, EventArgs e)
    {
        mathang mh = new mathang();
        mh.mamathang = txt_mavattu.Value;
        mh.madanhmuc = ddl_danhmucvattu.SelectedValue;
        mh.mota = cke_motavattu.Text;
        mh.tenmathang = txt_tenvattu.Value;
        mh.donvitinh = ddl_donvitinhvattu.SelectedValue;
        mh.ghichu = txt_ghichuvattu.Text;
        mh.thumuchinh = txt_mavattu.Value;
        mh.anhdaidien = ddl_anhdaidienvattu.SelectedValue;
        mh.ngaydang = DateTime.Now;
        mh.danhgia = 0;
        bool success = mathang_Action.add_Mathang(mh);
        if(success == true)
        {
            dtl_dsvattu.DataSource = mathang_Action.getFull_Vattu();
            dtl_dsvattu.DataBind();
            Response.Write("<script>alert('Thêm vật tư thành công')</script>");
        }
        else
        {
            Response.Write("<script>alert('Thêm vật tư không thành công')</script>");
        }
    }

    protected void dtl_dsvattu_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        string argu = e.CommandArgument.ToString();
        mathang mh = new mathang();
        mh.mamathang = argu;
        bool success = mathang_Action.delete_Mathang(mh);
        if (success == true)
        {
            Directory.Delete(Server.MapPath(@"~/vattu/" + argu), true);
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        else
        {
            Response.Write("<script>alert('Xóa vật tư thất bại')</script>");
        }
    }

    #endregion

    //----------------------------------------- KHÁCH HÀNG ----------------------------------------------------------------------

    protected void btn_themkhachhang_Click(object sender, EventArgs e)
    {
        khachhang kh = new khachhang();
        kh.makhachhang = txt_makhachhang.Value;
        kh.tenkhachhang = txt_tenkhachhang.Value.ToString();
        kh.email = txt_emailkhachhang.Value.ToString();
        kh.sodienthoai = txt_sdtkhachhang.Value.ToString();
        kh.diachi = txt_diachikhachhang.Value.ToString();
        bool success = khachhang_Action.add_Khachhang(kh);
        if (success == true)
        {
            Response.Write("<script>alert('Thêm khách hàng mới thành công')</script>");
        }
        else
        {
            Response.Write("<script>alert('Thêm khách hàng mới không thành công')</script>");
        }
    }

    //----------------------------------------- DỰ ÁN ----------------------------------------------------------------------
    protected void ful_boanhduan_FileNameDetermining(object sender, FileNameDeterminingEventArgs e)
    {
        if (!Directory.Exists(Server.MapPath("~/duan/" + lbl_thumucanhduan.InnerText)))
        {
            Directory.CreateDirectory(Server.MapPath("~/duan/" + lbl_thumucanhduan.InnerText));
        }
        e.FileName = Server.MapPath("~/duan/" + lbl_thumucanhduan.InnerText + "/") + e.File.FileName;
    }

    protected void btn_themduan_Click(object sender, EventArgs e)
    {
        duan da = new duan();
        da.maduan = txt_maduan.Value.ToString();
        da.tenduan = txt_tenduan.Value.ToString();
        da.makhachhang = ddl_dskhachhang.SelectedValue.ToString();
        da.boanh = lbl_thumucanhduan.InnerText.ToString();
        da.ngaykhoicong = DateTime.Parse(txt_ngaykhoicongduan.Value.ToString()).ToString();
        da.ngayhoanthanh = DateTime.Parse(txt_ngayhoanthanhduan.Value.ToString()).ToString();
        da.dientich = txt_dientichduan.Value.ToString();
        da.diachi = txt_diachicongtrinh.Value.ToString();
        bool success = duan_Action.add_Duan(da);
        if (success == true)
        {
            dtl_dsduan.DataSource = duan_Action.getFull_Duan();
            dtl_dsduan.DataBind();
            Response.Write("<script>alert('Thêm dự án mới thành công')</script>");
        }
        else
        {
            Response.Write("<script>alert('Thêm dự án mới không thành công')</script>");
        }
    }


    protected void btn_hienanhduan_Click(object sender, EventArgs e)
    {
        try
        {
            string[] listFile = Directory.GetFiles(Server.MapPath("~/duan/" + lbl_thumucanhduan.InnerText));
            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("num", typeof(int)));
            dt.Columns.Add(new DataColumn("link", typeof(string)));
            int num = 1;
            foreach (string i in listFile)
            {
                string pic = Path.GetFileName(i);
                dt.Rows.Add(num, "../duan/" + lbl_thumucanhduan.InnerText + "/" + pic);
                num++;
            }
            dtl_hienanhduan.DataSource = dt;
            dtl_hienanhduan.DataBind();
            ddl_hienanhdaidienduan.DataSource = dt;
            ddl_hienanhdaidienduan.DataTextField = "num";
            ddl_hienanhdaidienduan.DataValueField = "link";
            ddl_hienanhdaidienduan.DataBind();
        }
        catch (Exception)
        {
            Response.Write("<script>alert('Ảnh chưa được upload')</script>");
        }
    }

    protected void dtl_dsduan_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        string argu = e.CommandArgument.ToString();
        duan da = new duan();
        da.maduan = argu;
        bool success = duan_Action.delete_Duan(da);
        if (success == true)
        {
            Directory.Delete(Server.MapPath(@"~/duan/" + argu), true);
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        else
        {
            Response.Write("<script>alert('Xóa dự án thất bại')</script>");
        }
    }

    //----------------------------------------- THẮC MẮC ----------------------------------------------------------------------
    protected void btn_dangnoidungthacmac_Click(object sender, EventArgs e)
    {
        thacmac tm = new thacmac();
        tm.cauhoi = txt_cauhoi.Value;
        tm.cautraloi = txt_cautraloi.Text;
        tm.ngaydang = DateTime.Now;
        bool success = thacmac_Action.add_Thacmac(tm);
        if(success == true)
        {
            Response.Write("<script>alert('Đăng thắc mắc thành công')</script>");
        }
        else
        {
            Response.Write("<script>alert('Đăng thắc mắc không thành công')</script>");
        }
    }

//----------------------------------------- SLIDER ----------------------------------------------------------------------
    public void show_Slider()
    {
        DataTable dt = new DataTable();
        string[] listFile = Directory.GetFiles(Server.MapPath("~/slider"));
        dt.Columns.Add(new DataColumn("num", typeof(string)));
        dt.Columns.Add(new DataColumn("link", typeof(string)));
        foreach (string i in listFile)
        {
            string pic = Path.GetFileName(i);
            dt.Rows.Add(pic, "../slider/" + pic);
        }
        dtl_slider.DataSource = dt;
        dtl_slider.DataBind();
    }


    protected void ful_slider_FileNameDetermining(object sender, FileNameDeterminingEventArgs e)
    {

    }
    protected void grv_thacmac_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string cauhoi = grv_thacmac.DataKeys[e.RowIndex].Value.ToString();
        thacmac tm = new thacmac();
        tm.cauhoi = cauhoi;
        bool success = thacmac_Action.delete_Thacmac(tm);
        if (success == true)
        {
            Response.Write("<script>alert('Xóa thắc mắc thành công')</script>");
            grv_thacmac.DataBind();
        }
        else
        {
            Response.Write("<script>alert('Không thể xóa thắc mắc')</script>");
        }
    }

    protected void btn_reloadalbum_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        string[] listFile = Directory.GetFiles(Server.MapPath("~/slider"));
        dt.Columns.Add(new DataColumn("num", typeof(string)));
        dt.Columns.Add(new DataColumn("link", typeof(string)));
        foreach (string i in listFile)
        {
            string pic = Path.GetFileName(i);
            dt.Rows.Add(pic, "../slider/" + pic);
        }
        dtl_slider.DataSource = dt;
        dtl_slider.DataBind();
    }
}