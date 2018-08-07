using System;
using System.Collections;
using System.Configuration;
using System.Data;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

using System.Web.Mail;
using System.Data.SqlClient; 


public partial class Registration : System.Web.UI.Page
{
	public SqlConnection strConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);


	protected void Page_Load(object sender, EventArgs e)
	{


		if (!Page.IsPostBack)
		{
			BindState();

		}
	}


	public void BindCity()
	{


		try
		{
			ddlCity.Items.Clear();
			strConnection.Open();
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "SELECT  * FROM         dbo.CityMaster ";
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			da.Fill(ds);
			ddlCity.DataSource = ds;
			ddlCity.DataTextField = "City";
			ddlCity.DataValueField = "CityId";
			ddlCity.DataBind();

			strConnection.Close();


			ddlCity.Items.Insert(0, new ListItem("Select", "0"));
			ddlCity.SelectedIndex = 0;
		}
		catch
		{
		}
		finally
		{
			strConnection.Close();
		}

	}
	public void BindCityByState()
	{


		try
		{
			ddlCity.Items.Clear();
			strConnection.Open();
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "SELECT  * FROM         dbo.CityMaster where StateId='" + ddlStates.SelectedValue + "'";
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			da.Fill(ds);
			ddlCity.DataSource = ds;
			ddlCity.DataTextField = "City";
			ddlCity.DataValueField = "CityId";
			ddlCity.DataBind();

			strConnection.Close();


			ddlCity.Items.Insert(0, new ListItem("Select", "0"));
			ddlCity.SelectedIndex = 0;
		}
		catch
		{
		}
		finally
		{
			strConnection.Close();
		}

	}
	public void BindState()
	{


		try
		{
			ddlStates.Items.Clear();
			strConnection.Open();
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "SELECT  * FROM         dbo.StateMaster ";
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			da.Fill(ds);
          
			ddlStates.DataSource = ds;
			ddlStates.DataTextField = "State";
			ddlStates.DataValueField = "StateId";
			ddlStates.DataBind();

			strConnection.Close();


			ddlStates.Items.Insert(0, new ListItem("Select", "0"));
			ddlStates.SelectedIndex = 0;
		}
		catch
		{
		}
		finally
		{
			strConnection.Close();
		}

	}
	protected void btnsave_Click(object sender, EventArgs e)
	{


		try
		{

			string Password = Convert.ToString(txtPassword.Text);
			string FirstName = Convert.ToString(txtFirstName.Text);
			string MiddleName = Convert.ToString(txtFatherName.Text);
			string LastName = Convert.ToString(txtLastName.Text);


			string EmailId = Convert.ToString(txtEmaildId.Text);
			string MobileNo = Convert.ToString(txtMoibileNo.Text);

			int State = Convert.ToInt16(ddlStates.SelectedValue);
			int City = Convert.ToInt16(ddlCity.SelectedValue);


			strConnection.Open();
			SqlCommand CmdCo = new SqlCommand();
			CmdCo.Connection = strConnection;
			CmdCo.CommandText = "select Count(*) from CustomerMaster where FName= '" + FirstName.Trim() + "'";
			int Count = Convert.ToInt32(CmdCo.ExecuteScalar());

			if (Count == 0)
			{
				SqlCommand cmd = new SqlCommand();
				cmd.Connection = strConnection;
				cmd.CommandText = "insert into CustomerMaster(Password,FName,MName,LName,EmailId,Mobile,State,City ) values( '" + Password + "','" + FirstName + "','" + MiddleName + "','" + LastName + "','" + EmailId + "','" + MobileNo + "'," + State + "," + City + " ) ";
				cmd.ExecuteNonQuery();
				txtLastName.Text = "";
				txtPassword.Text = "";
				txtFatherName.Text = "";
				txtMoibileNo.Text = "";
				txtEmaildId.Text = "";
				txtFirstName.Text = "";
				lblMess.Text = "";
				lblMess.Visible = true;
				lblMess.Text = "Record Saved Succcessfully";
                ddlStates.SelectedValue = "0";
                ddlCity.SelectedValue = "0";

			}
			else
			{
				lblMess.Text = "";
				lblMess.Visible = true;
				lblMess.Text = "Record Already Exists";
			}


		}


		catch
		{
		}
		finally
		{

		}


	}


	protected void ddlStates_SelectedIndexChanged(object sender, EventArgs e)
	{
	
	}
    protected void ddlStates_SelectedIndexChanged1(object sender, EventArgs e)
    {
        BindCityByState();
    }
}
