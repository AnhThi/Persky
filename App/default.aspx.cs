using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Persky | Nâng tầm cuộc sống";
        if(!IsPostBack)
        {
            dtl_baivietmoi.DataSource = baiviet_Action.getTop_Baiviet(3);
            dtl_baivietmoi.DataBind();

            dtl_mautran.DataSource = mathang_Action.getAll_Mautran();
            dtl_mautran.DataBind();

            dtl_vattu.DataSource = mathang_Action.getAll_Vattu();
            dtl_vattu.DataBind();

            Dtl_dsduan.DataSource = duan_Action.getTop_Duan();
            Dtl_dsduan.DataBind();
        }
    }
}