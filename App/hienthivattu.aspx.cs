using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hienthivattu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string mamautran = "";
        try
        {
            mamautran = Request.QueryString["materialID"].ToString();
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
            dtl_vatu.DataSource = mathang_Action.getByID_Mathang(mh);
            dtl_vatu.DataBind();

            dtl_tinkhac.DataSource = baiviet_Action.getTop_Baiviet(5);
            dtl_tinkhac.DataBind();

            dtl_hienthimautran.DataSource = mathang_Action.getTop_Mautran(3);
            dtl_hienthimautran.DataBind();

            dtl_hienthivattu.DataSource = mathang_Action.getTop_Vattu(3);
            dtl_hienthivattu.DataBind();
        }
    }
}