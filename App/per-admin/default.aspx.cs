using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Transactions;

public partial class per_admin_default : System.Web.UI.Page
{
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            
        }
    }
    protected void btn_dangnhap_Click(object sender, EventArgs e)
    {
        nhanvien nv = new nhanvien();
        nv.manhanvien = txt_manhanvien.Value;
        nv.matkhau = txt_matkhau.Value;// nho chuyen sang MD5
        nv.chucvu = "Quản trị website";
        nv.trangthai = "Đang làm việc";
        dt = nhanvien_Action.check_Nhanvien(nv);
        if(dt.Rows.Count != 0)
        {
            Session["dangnhap"] = "allow";

            common.manhanvien = dt.Rows[0][0].ToString();
            common.matkhau = dt.Rows[0][1].ToString();
            common.tenhanvien = dt.Rows[0][2].ToString();
            common.chucvu = dt.Rows[0][3].ToString();
            if(dt.Rows[0][4].ToString() == "True")
            {
                common.gioitinh = "Nam";
            }
            else
            {
                common.gioitinh = "Nữ";
            }
            common.ngaysinh = DateTime.Parse(dt.Rows[0][5].ToString());
            common.diachi = dt.Rows[0][6].ToString();
            common.sdt = dt.Rows[0][7].ToString();
            common.email = dt.Rows[0][8].ToString();
            common.trangthai = dt.Rows[0][9].ToString();
            Response.Redirect("~/per-admin/dashboard.aspx");
        }
        else
        {
            Session["dangnhap"] = "refuse";
            Response.Write("<script>alert('Đăng nhập thất bại')</script>");
        }
    }
    protected void btn_guilaiemail_Click(object sender, EventArgs e)
    {
        string[] rand = { "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M", "1", "2", "3", "4", "5", "6", "7", "8", "9" };
        Random rr = new Random();
        string matkhaumoi = rand[rr.Next(0, rand.Length)] + rand[rr.Next(0, rand.Length)] + rand[rr.Next(0, rand.Length)] + rand[rr.Next(0, rand.Length)] + rand[rr.Next(0, rand.Length)] + rand[rr.Next(0, rand.Length)] + rand[rr.Next(0, rand.Length)];
        MailMessage mail = new MailMessage();
        string emailTo = txt_nhaplaiemail.Value;
        mail.To.Add(emailTo);
        mail.From = new MailAddress("kiris.nat@gmail.com");
        mail.Subject = "Phục hồi mật khẩu dành cho Quản Trị Website Persky";
        mail.Body = "Mật khẩu mới của bạn là: " + matkhaumoi;
        mail.IsBodyHtml = true;

        SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
        client.EnableSsl = true;
        NetworkCredential credent = new NetworkCredential("kiris.nat@gmail.com", "/?id=g00gle.");
        client.UseDefaultCredentials = true;
        client.Credentials = credent;

        using(TransactionScope scope = new TransactionScope())
        {
            try
            {
                client.Send(mail);
                nhanvien nv = new nhanvien();
                nv.email = txt_nhaplaiemail.Value;
                bool success = false;
                success = nhanvien_Action.updatepassword_Nhanvien(nv, matkhaumoi);
                if (success == true)
                {
                    Response.Write("<script>alert('Cập nhật thành công. Hãy truy cập vào mail để nhận mật khẩu mới')</script>");
                    scope.Complete();
                }
                else
                {
                    Response.Write("<script>alert('Không thể cấp lại mật khẩu mới')</script>");
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Không thể cấp lại mật khẩu mới')</script>");
            }
        }
    }
}