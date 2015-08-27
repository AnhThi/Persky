using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chitietyeucau : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string mayeucau = "";
        if(Session["dangnhap"].ToString() == "refuse")
        {
            Response.Redirect("~/default.aspx");
        }
        try
        {
            mayeucau = Request.QueryString["requestID"].ToString();
            if(mayeucau == "")
            {
                Response.Redirect("~/default.aspx");
            }
        }
        catch (Exception)
        {
            Response.Redirect("~/default.aspx");
        }
        yeucau yc = new yeucau();
        yc.mayeucau = mayeucau;
        dtl_chitietyeucau.DataSource = yeucau_Action.getByID_Yeucau(yc);
        dtl_chitietyeucau.DataBind();
    }
}