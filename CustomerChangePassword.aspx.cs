using System;
using System.Collections;
using System.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

using System.Data.SqlClient; 
public partial class CustomerChangePassword : System.Web.UI.Page
{
	public SqlConnection strConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
	 
	protected void Page_Load(object sender, EventArgs e)
	{
		if (Session["CustId"] != null)
		{


			string loginC = Session["CustName"].ToString();

		}
		else
		{
			Response.Redirect("MainPage.aspx");
		}
		username.Text = Session["CustName"].ToString();
	 
	}

	protected void ChangePasswordPushButton_Click(object sender, EventArgs e)
	{
		try
		{
			strConnection.Close();
			strConnection.Open();
			SqlCommand cmd = new SqlCommand();
			cmd.CommandText = "SELECT count(*) FROM cUSTOMERmASTER WHERE Fname = '" + username.Text + "'";
			cmd.Connection = strConnection;
			int RegNo = Convert.ToInt32(cmd.ExecuteScalar());
			if (RegNo > 0)
			{



				strConnection.Close();
				strConnection.Open();

				SqlCommand cmdAdd = new SqlCommand();
				cmdAdd.CommandText = "Update  cUSTOMERmASTER set Fname='" + username.Text.Trim() + "',Password='" + txtnewpassword.Text.Trim() + "' WHERE CustId = '" + Session["CustId"] + "' ";
				cmdAdd.Connection = strConnection;
				cmdAdd.ExecuteNonQuery();

                txtmessage.Visible = true;
                txtmessage.Text = "Password updated.";
				//Response.Redirect("CustomerHome.aspx");
			}
			else
			{
				//.Visible = true;
				//lblMsg.Text = "Invalid Password.";
				return;
			}

		}
		catch
		{

		}
	}
	protected void CancelPushButton_Click(object sender, EventArgs e)
	{
		Response.Redirect("CustomerHome.aspx");
	}
}