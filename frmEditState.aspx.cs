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

public partial class frmEditState : System.Web.UI.Page
{

	public SqlConnection strConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
	 
	protected void Page_Load(object sender, EventArgs e)
	{

		lblMess.Text = "";
        divAdd.Visible = false;

		if (!Page.IsPostBack) 
		{
			divAdd.Visible = false;
			loaddata();
			BindState();


		}

		 

	}

	protected void GridState_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		try
		{
			GridState.PageIndex = e.NewPageIndex;
			loaddata();
		}
		catch
		{
		}
		finally
		{
		}
	}
 

	public void loaddata()
	{

		try
		{

			strConnection.Open();
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "SELECT  * FROM         dbo.StateMaster ";
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			da.Fill(ds);
			GridState.DataSource = ds;

			GridState.DataBind();
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


	void BindState()
	{


		try
		{
			ddlState.Items.Clear();
			strConnection.Open();
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "SELECT  * FROM         dbo.StateMaster ";
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			da.Fill(ds);
			ddlState.DataSource = ds;
			ddlState.DataTextField = "State";
			ddlState.DataValueField = "StateId";
			ddlState.DataBind();

			strConnection.Close();


			ddlState.Items.Insert(0, new ListItem("Select", "0"));
			ddlState.SelectedIndex = 0;
		}
		catch
		{
		}
		finally
		{
			strConnection.Close();
		}

	}



 
	protected void btnCancel_Click1(object sender, EventArgs e)
	{
		try
		{
			txtStateName.Text = string.Empty;
			divAdd.Visible = false;
			divDisp.Visible = true;
            ddlState.SelectedValue = "0";
            lblMess.Text = "";
			lblMess.Visible = true;
            lblMess.Text = "Record Cleared Successfully";
            
		}
		catch
		{
		}
		finally
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
						CmCo.CommandText = "select Count(*) from StateMaster where State='" + txtStateName.Text.Trim() + "' and StateId !='" + ddlState.SelectedValue + "' ";
						int Count = Convert.ToInt32(CmCo.ExecuteScalar());
						if (Count == 0)
						{
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "Update  dbo.StateMaster set State='" + txtStateName.Text.Trim() + "' where StateId='" + ddlState .SelectedValue + "' ";
			cmd.ExecuteNonQuery();
			cmd.Dispose();
			strConnection.Close();
			lblMess.Text = "";
			lblMess.Visible = true;
			lblMess.Text = "Record Updated Successfully";
			txtStateName.Text = "";
						}
						else
						{
                            ddlState.SelectedValue = "0";
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
			strConnection.Close();
			loaddata(); BindState();
		}
	}


 


 
	protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
	{
		lblMess.Visible = false;

		try
		{
			divAdd.Visible = true;
	 
			btnUpdate.Visible = true;
			btnDelete.Visible = true;
		 
			strConnection.Open();
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "SELECT  * FROM         dbo.StateMaster where StateId='" + ddlState.SelectedValue + "' ";
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			da.Fill(ds);
			txtStateName.Text = Convert.ToString(ds.Tables[0].Rows[0]["State"]);
			cmd.Dispose();
			strConnection.Close();
		}
		catch
		{
		}
		finally
		{

		}

	}
	protected void btnDelete_Click(object sender, EventArgs e)
	{
		try
		{



			btnDelete.Attributes.Add("onclick", "return confirm('Are you sure want to  Delete State?');");

			strConnection.Open();
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "Delete FROM dbo.StateMaster where StateId='" + ddlState.SelectedValue + "' ";
			cmd.ExecuteNonQuery();
			strConnection.Close();
            txtStateName.Text = "";
          
            lblMess.Text = "";
            lblMess.Visible = true;
            lblMess.Text = "Record Deleted Successfully";
		}
		catch
		{

		}
		finally
		{
			strConnection.Close();
			loaddata(); BindState();
		}

	}
}