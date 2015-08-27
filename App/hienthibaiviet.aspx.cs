using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hienthibaiviet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string mabaiviet = "";
        try
        {
            mabaiviet = Request.QueryString["articleID"].ToString();
            if(mabaiviet == "")
            {
                Response.Redirect("~/tintuc.aspx");
            }
        }
        catch (Exception)
        {
            Response.Redirect("~/tintuc.aspx");
        }
        if(!IsPostBack)
        {
            baiviet bv = new baiviet();
            bv.mabaiviet = mabaiviet;
            dtl_baiviet.DataSource = baiviet_Action.getByID_Baiviet(bv);
            dtl_baiviet.DataBind();

            dtl_tinkhac.DataSource = baiviet_Action.getTop_Baiviet(5);
            dtl_tinkhac.DataBind();

            dtl_hienthimautran.DataSource = mathang_Action.getTop_Mautran(3);
            dtl_hienthimautran.DataBind();

            dtl_hienthivattu.DataSource = mathang_Action.getTop_Vattu(3);
            dtl_hienthivattu.DataBind();
        }
        
    }
}