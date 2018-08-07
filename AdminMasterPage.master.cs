using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (Session["AdminId"] == null && Session["AdminName"] == null)
		{
			Response.Redirect("Login.aspx");
		}
		else
		{

			string loginEmp = Session["AdminName"].ToString();
			lblName.Text = loginEmp.ToString();
		}
    }
    protected void MenuAdmin_MenuItemClick(object sender, MenuEventArgs e)
    {

    }
}
