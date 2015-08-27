using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class danhsachmautran : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string madanhmuc = "";
        try
        {
            madanhmuc = Request.QueryString["categoryID"].ToString();
            if (madanhmuc == "")
            {
                Response.Redirect("~/default.aspx");
            }
        }
        catch (Exception)
        {
            Response.Redirect("~/default.aspx");
        }
        mathang mh = new mathang();
        mh.madanhmuc = madanhmuc;
        dtl_mathang.DataSource = mathang_Action.getByType_Mathang(mh);
        dtl_mathang.DataBind();

    }
}