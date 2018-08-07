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


public partial class Admin_frmSubProduct : System.Web.UI.Page
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
			ddlProduct.Items.Clear();
			strConnection.Open();
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "SELECT  * FROM         dbo.productMaster ";
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			da.Fill(ds);
			ddlProduct.DataSource = ds;
			ddlProduct.DataTextField = "ProductName";
			ddlProduct.DataValueField = "productId";
			ddlProduct.DataBind();

			strConnection.Close();


			ddlProduct.Items.Insert(0, new ListItem("Select", "0"));
			ddlProduct.SelectedIndex = 0;
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
			cmd.CommandText = "Select SubProductMaster.url, * from ProductMaster inner join SubProductMaster on ProductMaster.ProductId=SubProductMaster.ProductId ";
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
			string URL = "";
			if (FileUpload1.FileName.ToString().Length > 0)
			{
				URL = txtSName.Text + FileUpload1.FileName.ToString();
				URL = URL.Replace(" ", "");
				//FileUpload1.SaveAs(Server.MapPath("Images") + "/" + URL);
				FileUpload1.SaveAs(Server.MapPath("../Images") + "/" + URL);
			}
			else
			{
				URL = "";
			}
			strConnection.Close();
			strConnection.Open();

			SqlCommand CmCo = new SqlCommand();
			CmCo.Connection = strConnection;
			CmCo.CommandText = "select Count(*) from SubProductMaster where productId='" + ddlProduct.SelectedValue + "' and  SubProductName='" + txtSName.Text.Trim() + "'";
			int Count = Convert.ToInt32(CmCo.ExecuteScalar());
			if (Count == 0)
			{

				SqlCommand cmd = new SqlCommand();
				cmd.Connection = strConnection;
				cmd.CommandText = "Insert into SubProductMaster(SubProductName,URL,Details,productId,price)values('" + txtSName.Text + "','" + URL + "','" + txtDetails.Text + "','" + ddlProduct.SelectedValue + "','"+txtPrice.Text +"')";
				cmd.ExecuteNonQuery();
				strConnection.Close();
				lblEMsg.Text = "";
				lblEMsg.Text = "Product Inserted Successfully";
				txtSName.Text = "";

                txtPrice.Text = "";
				txtDetails.Text = "";
				ddlProduct.SelectedValue = "0";
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

		ddlProduct.SelectedValue = "0";

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

	protected void lnkDelete_Click(object sender, ImageClickEventArgs e)
	{
		strConnection.Open();
		try
		{
			ImageButton lnkDelete = (ImageButton)(sender);
			GridViewRow row = (GridViewRow)lnkDelete.Parent.Parent;
			int ProductId = Convert.ToInt32(gvProduct.DataKeys[row.RowIndex].Value);
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "Delete from SubProductMaster where SubProductId=" + ProductId + " ";
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

			string URL = "";
			if (FileUpload1.FileName.ToString().Length > 0)
			{
				URL = txtSName.Text + FileUpload1.FileName.ToString();
				URL = URL.Replace(" ", "");
				FileUpload1.SaveAs(Server.MapPath("../Images") + "/" + URL);
			}
			else
			{
				URL = "";
			}
			lblEMsg.Visible = false;
			strConnection.Close();
			strConnection.Open();
			SqlCommand CmCo = new SqlCommand();
			CmCo.Connection = strConnection;
			CmCo.CommandText = "select Count(*) from SubProductMaster where productid='" + ddlProduct.SelectedValue + "' and  SubProductName='" + txtSName.Text.Trim() + "' and SubProductId !='" + ViewState["SubProductId"] + "'";
			int Count = Convert.ToInt32(CmCo.ExecuteScalar());
			if (Count == 0)
			{
				SqlCommand cmdAdd = new SqlCommand();
				cmdAdd.CommandText = "update SubProductMaster set price='"+txtPrice.Text +"', productid='" + ddlProduct.SelectedValue + "', URL='" + URL + "',  SubProductNAME='" + txtSName.Text.Trim() + "' ,Details='" + txtDetails.Text + "' WHERE SubProductId = '" + ViewState["SubProductId"] + "'";
				cmdAdd.Connection = strConnection;
				cmdAdd.ExecuteNonQuery();
				strConnection.Close();
				lblEMsg.Visible = true;
				lblEMsg.Text = "Product updated.";
				ReadProduct();
                txtPrice.Text = "";
				txtSName.Text = "";
				txtDetails.Text = "";
				txtSName.Text = "";


				ddlProduct.SelectedValue = "0";

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
	protected void lnkEdit_Click(object sender, ImageClickEventArgs e)
	{
		btnAdd.Visible = false;
		btnUpdate.Visible = true;
		strConnection.Open();
		try
		{

			ImageButton lnkEdit = (ImageButton)(sender);
			GridViewRow row = (GridViewRow)lnkEdit.Parent.Parent;
			int SubProductId = Convert.ToInt32(gvProduct.DataKeys[row.RowIndex].Value);
			ViewState["SubProductId"] = SubProductId;
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "Select * from SubProductMaster where SubProductId=" + SubProductId + " ";
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			da.Fill(ds);
			if (ds.Tables[0].Rows.Count > 0)
			{
				panAdd.Visible = true;


				txtSName.Text = ds.Tables[0].Rows[0]["SubProductName"].ToString();

				txtDetails.Text = ds.Tables[0].Rows[0]["Details"].ToString();
				ddlProduct.SelectedValue = ds.Tables[0].Rows[0]["ProductId"].ToString();
			}

		}
		catch
		{
		}
		finally
		{
		}

	}
}