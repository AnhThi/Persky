using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class tintuc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            dtl_dsbaiviet.DataSource = baiviet_Action.getAll_Baiviet();
            dtl_dsbaiviet.DataBind();
        }
    }
}