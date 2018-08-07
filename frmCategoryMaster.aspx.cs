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

public partial class Seller_frmCategoryMaster : System.Web.UI.Page
{

	public SqlConnection strConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

	protected void Page_Load(object sender, EventArgs e)
	{
		lblMess.Text = "";
		 

		divAdd.Visible = false;

		if (!Page.IsPostBack)
		{

			loaddata();



		}


	}

	protected void GridCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		try
		{
			GridCategory.PageIndex = e.NewPageIndex;
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
			cmd.CommandText = "SELECT  * FROM dbo.CategoryMaster ";
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			da.Fill(ds);
			GridCategory.DataSource = ds;

			GridCategory.DataBind();
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






	protected void btnSubmit_Click(object sender, EventArgs e)
	{



		try
		{

			strConnection.Open();
			SqlCommand CmCo = new SqlCommand();
			CmCo.Connection = strConnection;
			CmCo.CommandText = "select Count(*) from CategoryMaster where Category='" + txtCategoryName.Text.Trim() + "'";
			int Count = Convert.ToInt32(CmCo.ExecuteScalar());
			if (Count == 0)
			{
				SqlCommand cmd = new SqlCommand();
				cmd.Connection = strConnection;
				cmd.CommandText = "insert into  dbo.CategoryMaster(Category)values('" + txtCategoryName.Text.Trim() + "') ";
				cmd.ExecuteNonQuery();
				cmd.Dispose();
				strConnection.Close();
				lblMess.Text = "";
				lblMess.Visible = true;
				lblMess.Text = "Record Saved Successfully";
				txtCategoryName.Text = "";
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
			strConnection.Close();
			loaddata();

		}


	}
	protected void btnCancel_Click1(object sender, EventArgs e)
	{
		try
		{
			txtCategoryName.Text = string.Empty;
			divAdd.Visible = false;
			divDisp.Visible = true;
			lblMess.Visible = false;

		}
		catch
		{
		}
		finally
		{
		}
	}
	protected void btnAddCategory_Click1(object sender, EventArgs e)
	{
		try
		{
			divAdd.Visible = true;
			btnSubmit.Visible = true;
			btnUpdate.Visible = false;
			txtCategoryName.Text = string.Empty;



		}
		catch
		{
		}
		finally
		{ loaddata(); }
	}



	protected void lnkEdit_Click(object sender, EventArgs e)
	{
		btnSubmit.Visible = false;
		btnUpdate.Visible = true;
		strConnection.Open();
		try
		{

			ImageButton lnkEdit = (ImageButton)(sender);
			GridViewRow row = (GridViewRow)lnkEdit.Parent.Parent;
			int categoryId = Convert.ToInt32(GridCategory.DataKeys[row.RowIndex].Value);
			ViewState["CategoryId"] = categoryId;
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "Select * from CategoryMaster where categoryId=" + categoryId + " ";
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			da.Fill(ds);
			if (ds.Tables[0].Rows.Count > 0)
			{
				btnSubmit.Visible = false;
				divAdd.Visible = true;
				txtCategoryName.Text = Convert.ToString(ds.Tables[0].Rows[0]["category"]);


			}

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
			CmCo.CommandText = "select Count(*) from CategoryMaster where Category='" + txtCategoryName.Text.Trim() + "' and CategoryId !='" + ViewState["CategoryId"] + "' ";
			int Count = Convert.ToInt32(CmCo.ExecuteScalar());
			if (Count == 0)
			{
				SqlCommand cmd = new SqlCommand();
				cmd.Connection = strConnection;
				cmd.CommandText = "Update  dbo.CategoryMaster set Category='" + txtCategoryName.Text.Trim() + "' where CategoryId='" + ViewState["CategoryId"] + "' ";
				cmd.ExecuteNonQuery();
				cmd.Dispose();
				strConnection.Close();
				lblMess.Text = "";
				lblMess.Visible = true;
				lblMess.Text = "Record Updated Successfully";
				txtCategoryName.Text = "";
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
			strConnection.Close();
			loaddata();
		}
	}

	protected void GridCategory_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			ImageButton lnkDelete = (ImageButton)e.Row.FindControl("lnkDelete");

			//   LinkButton lnkDelete = (LinkButton)e.Row.FindControl("lnkDelete");

			lnkDelete.Attributes.Add("onclick", "return confirm('Are you sure want to delete?');");

		}

	}
	protected void lnkDelete_Click(object sender, EventArgs e)
	{
		strConnection.Open();
		try
		{
			ImageButton lnkDelete = (ImageButton)(sender);
			GridViewRow row = (GridViewRow)lnkDelete.Parent.Parent;
			int CategoryId = Convert.ToInt32(GridCategory.DataKeys[row.RowIndex].Value);
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "Delete from CategoryMaster where CategoryId=" + CategoryId + " ";
			cmd.ExecuteNonQuery();
			strConnection.Close(); loaddata();
		}
		catch
		{
		}
		finally
		{
			strConnection.Close();
		}
	}
    protected void GridCategory_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}