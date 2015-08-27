using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class hienthimautran : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string mamautran = "";
        try
        {
            mamautran = Request.QueryString["ceilingID"].ToString();
            if (mamautran == "")
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
            mathang mh = new mathang();
            mh.mamathang = mamautran;
            DataTable dt_mautran = new DataTable();
            dt_mautran = mathang_Action.getByID_Mathang(mh);

            string tenmautran;
            tenmautran = dt_mautran.Rows[0]["tenmathang"].ToString();
            lbl_tenmautran.InnerText = tenmautran;
            try
            {
                string[] listFile = Directory.GetFiles(Server.MapPath("~/mautran/" + mamautran));
                DataTable dt = new DataTable();
                dt.Columns.Add(new DataColumn("num", typeof(int)));
                dt.Columns.Add(new DataColumn("pathImg", typeof(string)));
                int num = 1;
                foreach (string i in listFile)
                {
                    string pic = Path.GetFileName(i);
                    dt.Rows.Add(num, "../mautran/" + mamautran + "/" + pic);
                    num++;
                }
                dtl_hienthidsmautran.DataSource = dt;
                dtl_hienthidsmautran.DataBind();
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Ảnh chưa được upload')</script>");
            }

            dtl_tinkhac.DataSource = baiviet_Action.getTop_Baiviet(5);
            dtl_tinkhac.DataBind();

            dtl_hienthimautran.DataSource = mathang_Action.getTop_Mautran(3);
            dtl_hienthimautran.DataBind();

            dtl_hienthivattu.DataSource = mathang_Action.getTop_Vattu(3);
            dtl_hienthivattu.DataBind();
        }
    }
}