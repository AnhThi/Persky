using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hienthithacmac : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            dtl_thacmac.DataSource = thacmac_Action.getAll_Thacmac();
            dtl_thacmac.DataBind();
        }
    }
}