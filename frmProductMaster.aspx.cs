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

public partial class frmProductMaster : System.Web.UI.Page
{
	public SqlConnection strConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

	protected void Page_Load(object sender, EventArgs e)
	{
		lblEMsg.Text = "";
		if (Page.IsPostBack == false)
		{

			ReadProduct();
			BindCategory();
		}

	}
	void BindCategory()
	{


		try
		{
			ddlCategory.Items.Clear();
			strConnection.Open();
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "SELECT  * FROM         dbo.CategoryMaster ";
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			da.Fill(ds);
			ddlCategory.DataSource = ds;
			ddlCategory.DataTextField = "Category";
			ddlCategory.DataValueField = "CategoryId";
			ddlCategory.DataBind();

			strConnection.Close();


			ddlCategory.Items.Insert(0, new ListItem("Select", "0"));
			ddlCategory.SelectedIndex = 0;
		}
		catch
		{
		}
		finally
		{
			strConnection.Close();
		}

	}
	private void ReadProduct()
	{
		try
		{


			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "Select * from ProductMaster inner join CategoryMaster on ProductMaster.CategoryId=CategoryMaster.categoryId    ORDER BY ProductId";
			SqlDataAdapter adp = new SqlDataAdapter(cmd);

			//Fill Dataet
			DataSet ds = new DataSet();
			adp.Fill(ds);

			gvProduct.DataSource = ds;
			gvProduct.DataBind();

			adp.Dispose();
			cmd.Cancel();
			strConnection.Close();
		}
		catch
		{

		}
	}
	protected void gvProduct_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		try
		{
			gvProduct.PageIndex = e.NewPageIndex;
			ReadProduct();
		}
		catch
		{
		}
	}
	protected void btnAdd_Click(object sender, EventArgs e)
	{
		try
		{

			strConnection.Close();
			strConnection.Open();

			SqlCommand CmCo = new SqlCommand();
			CmCo.Connection = strConnection;
			CmCo.CommandText = "select Count(*) from ProductMaster where categoryid='" + ddlCategory.SelectedValue + "' and  ProductName='" + txtSName.Text.Trim() + "'";
			int Count = Convert.ToInt32(CmCo.ExecuteScalar());
			if (Count == 0)
			{

				SqlCommand cmd = new SqlCommand();
				cmd.Connection = strConnection;
				cmd.CommandText = "Insert into ProductMaster(ProductName,categoryId)values('" + txtSName.Text + "'  ,'" + ddlCategory.SelectedValue + "')";
				cmd.ExecuteNonQuery();
				strConnection.Close();
				lblEMsg.Text = "";
				lblEMsg.Text = "Product Inserted Successfully";
				txtSName.Text = "";


				ddlCategory.SelectedValue = "0";
			}
			else
			{
				lblEMsg.Text = "";
				lblEMsg.Visible = true;
				lblEMsg.Text = "Record Already Exists";
			}
		}
		catch
		{
		}
		finally
		{
			strConnection.Close();
			ReadProduct();
		}
	}
	protected void btnClear_Click(object sender, EventArgs e)
	{
		txtSName.Text = "";

		ddlCategory.SelectedValue = "0";

	}

	protected void lnkEdit_Click(object sender, EventArgs e)
	{
		btnAdd.Visible = false;
		btnUpdate.Visible = true;
		strConnection.Open();
		try
		{

			ImageButton lnkEdit = (ImageButton)(sender);
			GridViewRow row = (GridViewRow)lnkEdit.Parent.Parent;
			int ProductId = Convert.ToInt32(gvProduct.DataKeys[row.RowIndex].Value);
			ViewState["ProductId"] = ProductId;
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "Select * from ProductMaster where ProductId=" + ProductId + " ";
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			da.Fill(ds);
			if (ds.Tables[0].Rows.Count > 0)
			{
				panAdd.Visible = true;


				txtSName.Text = ds.Tables[0].Rows[0]["ProductName"].ToString();

				ddlCategory.SelectedValue = ds.Tables[0].Rows[0]["CategoryId"].ToString();
			}

		}
		catch
		{
		}
		finally
		{
		}
	}

	protected void gvProduct_RowDataBound(object sender, GridViewRowEventArgs e)
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
			int ProductId = Convert.ToInt32(gvProduct.DataKeys[row.RowIndex].Value);
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "Delete from ProductMaster where ProductId=" + ProductId + " ";
			cmd.ExecuteNonQuery();
			strConnection.Close(); ReadProduct();
		}
		catch (Exception ex)
		{
			Response.Redirect(ex.Message);
		}
		finally
		{
			strConnection.Close();
		}
	}


	protected void btnNew_Click(object sender, EventArgs e)
	{
		panAdd.Visible = true;
		btnUpdate.Visible = false;
		btnAdd.Visible = true;
	}
	protected void btnUpdate_Click(object sender, EventArgs e)
	{
		try
		{

			lblEMsg.Visible = false;
			strConnection.Close();
			strConnection.Open();
			SqlCommand CmCo = new SqlCommand();
			CmCo.Connection = strConnection;
			CmCo.CommandText = "select Count(*) from ProductMaster where categoryid='" + ddlCategory.SelectedValue + "' and  ProductName='" + txtSName.Text.Trim() + "' and ProductId !='" + ViewState["ProductId"] + "'";
			int Count = Convert.ToInt32(CmCo.ExecuteScalar());
			if (Count == 0)
			{
				SqlCommand cmdAdd = new SqlCommand();
				cmdAdd.CommandText = "update ProductMaster set categoryid='" + ddlCategory.SelectedValue + "' ,  ProductNAME='" + txtSName.Text.Trim() + "'  WHERE ProductId = '" + ViewState["ProductId"] + "'";
				cmdAdd.Connection = strConnection;
				cmdAdd.ExecuteNonQuery();
				strConnection.Close();
				lblEMsg.Visible = true;
				lblEMsg.Text = "Product updated.";
				ReadProduct();
				txtSName.Text = "";
				txtSName.Text = "";


				ddlCategory.SelectedValue = "0";

			}
			else
			{
				lblEMsg.Text = "";
				lblEMsg.Visible = true;
				lblEMsg.Text = "Record Already Exists";
			}
			btnAdd.Visible = true;
			panAdd.Visible = false;

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