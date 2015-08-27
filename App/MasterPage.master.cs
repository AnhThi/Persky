using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void btn_guiyeucau_Click(object sender, EventArgs e)
    {
        if(txt_hoten.Value != "" || txt_sdt.Value != "" || txt_email.Value != "" || txt_diachi.Value != "" || txt_content.Text != "")
        {
            yeucau yc = new yeucau();
            yc.mayeucau = "YC-" + DateTime.Now.ToString("yyyyMMddhhmmss");
            yc.hoten = txt_hoten.Value;
            yc.email = txt_email.Value;
            yc.sdt = txt_sdt.Value;
            yc.diachithicong = txt_diachi.Value;
            yc.noidung = txt_content.Text;
            yc.ngaygui = DateTime.Now;
            bool success = yeucau_Action.add_Yeucau(yc);
            if (success)
            {
                Response.Write("<script>alert('Cám ơn quí khách đã tin tưởng Persky. Chúng tôi sẽ liên hệ trong thời gian sớm nhất')</script>");
            }
            else
            {
                Response.Write("<script>alert('Không thể gửi yêu cầu')</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('Một trong các thông tin người dùng vẫn chưa được nhập')</script>");
        }
    }
}
