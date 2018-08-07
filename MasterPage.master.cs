using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

		if (Session["CustId"] != null)
		{


			string loginC = Session["CustName"].ToString();
			lblName.Text = loginC.ToString();

		}
		else
		{
			Response.Redirect("MainPage.aspx");
			lblName.Text = "";
		}
    }
}
