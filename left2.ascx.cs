using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient; 

public partial class left2 : System.Web.UI.UserControl
{
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

    }

	protected void lnkLogout_Click(object sender, EventArgs e)
	{
		Session.Abandon();
		Response.Redirect("MainPage.aspx");
	}
    protected void tot_div_ValueChanged(object sender, EventArgs e)
    {

    }
}
