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
public partial class MainPage : System.Web.UI.Page
{
	public SqlConnection strConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			Session.Abandon();
		}
		 
	}
	protected void btnLogin_Click(object sender, EventArgs e)
	{
		try
		{
		 
			string LoginName = Convert.ToString(txtUserId.Text);
			string Password = Convert.ToString(txtPwd.Text);
			strConnection.Open();
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "Select * from CustomerMaster where Fname='" + LoginName + "' and Password='" + Password + "'   ";
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			da.Fill(ds);
			strConnection.Close();

			if (ds.Tables.Count > 0)
			{
				if (ds.Tables[0].Rows.Count > 0)
				{
					Session["CustName"] = LoginName.ToString();
					Session["CustId"] = Convert.ToInt32(ds.Tables[0].Rows[0]["CustId"]);
					Response.Redirect("Default.aspx",false);

				}
				else
				{
					lblloginmsg.Text = "InValid Input";
				}

			}
			else
			{
				lblloginmsg.Text = "InValid Input";
			}


		}

		catch
		{
		}
		finally
		{
			strConnection.Close();

		}
	}
}