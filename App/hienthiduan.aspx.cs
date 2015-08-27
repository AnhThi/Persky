using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class hienthiduan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string maduan_ = "";
        try
        {
            maduan_ = Request.QueryString["projectID"].ToString();
            if (maduan_ == "")
            {
                Response.Redirect("~/default.aspx");
            }
        }
        catch (Exception)
        {
            Response.Redirect("~/default.aspx");
        }
        if (!IsPostBack)
        {
            dtl_hienthiduan.DataSource = duan_Action.getByID_Duan(maduan_);
            dtl_hienthiduan.DataBind();

            dtl_tinkhac.DataSource = baiviet_Action.getTop_Baiviet(5);
            dtl_tinkhac.DataBind();

            dtl_hienthimautran.DataSource = mathang_Action.getTop_Mautran(3);
            dtl_hienthimautran.DataBind();

            dtl_hienthivattu.DataSource = mathang_Action.getTop_Vattu(3);
            dtl_hienthivattu.DataBind();

            try
            {
                string[] listFile = Directory.GetFiles(Server.MapPath("~/duan/" + maduan_));
                DataTable dt = new DataTable();
                dt.Columns.Add(new DataColumn("num", typeof(int)));
                dt.Columns.Add(new DataColumn("pathImg", typeof(string)));
                int num = 1;
                foreach (string i in listFile)
                {
                    string pic = Path.GetFileName(i);
                    dt.Rows.Add(num, "../duan/" + maduan_ + "/" + pic);
                    num++;
                }
                dtl_hienthidsanhduan.DataSource = dt;
                dtl_hienthidsanhduan.DataBind();
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Ảnh chưa được upload')</script>");
            }
        }
    }
}