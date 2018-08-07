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

public partial class admin_left : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lnkAddCategory_Click(object sender, EventArgs e)
    {
		Response.Redirect("frmCategoryMaster.aspx");
    }
    
 
     
     protected void lnkChangePassword_Click(object sender, EventArgs e)
    {
		Response.Redirect("changepassword.aspx");
    }

	 protected void lnkAddsubProduct_Click(object sender, EventArgs e)
	 {
		 Response.Redirect("frmSubProduct.aspx");
	 }
	 protected void lnkAddProducts_Click(object sender, EventArgs e)
	 {
		 Response.Redirect("frmProductMaster.aspx");
	 }
	 protected void lnkCity_Click(object sender, EventArgs e)
	 {
		 Response.Redirect("frmCityMaster.aspx");
	 }
	 protected void lnkState_Click(object sender, EventArgs e)
	 {
		 Response.Redirect("frmStateMaster.aspx");
	 }
	 protected void lnkLogout_Click(object sender, EventArgs e)
	 {
		 Response.Redirect("Login.aspx");
	 }
	 protected void lnkReport_Click(object sender, EventArgs e)
	 {
		 Response.Redirect("report.aspx");
	 }
}
