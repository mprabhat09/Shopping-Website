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

public partial class frmEditCity : System.Web.UI.Page
{
	public SqlConnection strConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

	 
	protected void btnCancel_Click(object sender, EventArgs e)
	{
		txtCityName.Text = string.Empty;
		btnUpdate.Visible = false;
        ddlCity.SelectedValue = "0";
        lblMess.Text = "";
		lblMess.Visible = true;

        lblMess.Text = "Record Cleared Successfully";
		divAddCity.Visible = false;
		loaddata(); 
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		lblMess.Text = "";


		if (!Page.IsPostBack)
		{

			BindState();
			loaddata();
			BindCity();
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

	public void loaddata()
	{



		try
		{
			strConnection.Open();
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "SELECT  * FROM         dbo.StateMaster inner join CityMaster on StateMaster.StateId=CityMaster.StateId  ";
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			da.Fill(ds);
			GridCity.DataSource = ds;

			GridCity.DataBind();
			cmd.Dispose();
			strConnection.Close();

		}
		catch
		{

		}
		finally
		{
			strConnection.Close();
		}

	}







	protected void GridCity_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		try
		{
			GridCity.PageIndex = e.NewPageIndex;
			loaddata();
		}
		catch
		{
		}
	}
 

 

	protected void btnUpdate_Click(object sender, EventArgs e)
	{



		try
		{


			strConnection.Open();
				SqlCommand CmCo = new SqlCommand();
						CmCo.Connection = strConnection;
						CmCo.CommandText = "select Count(*) from CityMaster where City='" + txtCityName.Text.Trim() + "' and CityId !='" + ddlCity.SelectedValue + "' ";
						int Count = Convert.ToInt32(CmCo.ExecuteScalar());
						if (Count == 0)
						{
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "Update   dbo.CityMaster  set City='" + txtCityName.Text.Trim() + "', StateId='" + ddlStates.SelectedValue + " ' where CityId='" +ddlCity.SelectedValue  + "' ";
			cmd.ExecuteNonQuery();
			cmd.Dispose();
			strConnection.Close();
			lblMess.Text = "";
			lblMess.Visible = true;
            lblMess.Text = "Record Updated Successfully";




			txtCityName.Text = string.Empty;
			ddlStates.SelectedIndex = 0;

			txtCityName.Text = string.Empty;
			ddlStates.SelectedIndex = 0;
			divAddCity.Visible = false;
						}
						else
						{
							lblMess.Text = "";
							lblMess.Visible = true;
							lblMess.Text = "Record Already Exists";
                            divAddCity.Visible = false;
						}
		}
		catch
		{
		}
		finally
		{
		strConnection.Close();
			loaddata(); BindCity();
		}
	}










	protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
	{
		lblMess.Visible = false;

		BindState();
		try
		{
			btnUpdate.Visible = true;
 
			divAddCity.Visible = true;
			btnDelete.Visible = true;

			strConnection.Open();
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "SELECT  * FROM         dbo.CityMaster where CityId='"+ddlCity.SelectedValue +"'     ";
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			da.Fill(ds);

			txtCityName.Text = ds.Tables[0].Rows[0]["City"].ToString();
			ddlStates.SelectedValue = ds.Tables[0].Rows[0]["StateId"].ToString();
			divAddCity.Visible = true;
			btnUpdate.Visible = true;
 
			strConnection.Close();
		}
		catch
		{
		}
		finally
		{
			strConnection.Close();
		}
	}
	protected void btnDelete_Click(object sender, EventArgs e)
	{
		try
		{
			btnDelete.Attributes.Add("onclick", "return confirm('Are you sure want to delete City?');");


			ViewState["EditId"] = Convert.ToInt32(ddlCity.SelectedValue);
			strConnection.Open();
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "Delete   from  dbo.CityMaster  where CityId='" + ddlCity.SelectedValue + "' ";
			cmd.ExecuteNonQuery();
			cmd.Dispose();
			strConnection.Close();
			lblMess.Text = "";
			lblMess.Text = "Record Deleted Successfully";
			//btnUpdate.Visible = true;
            lblMess.Visible = true;
			txtCityName.Text = string.Empty;
			ddlStates.SelectedIndex = 0;

			txtCityName.Text = string.Empty;
			ddlStates.SelectedIndex = 0;
			divAddCity.Visible = false;


		}
		catch
		{

		}
		finally
		{
			strConnection.Close();
			loaddata();
			BindCity();
		}
	}
}