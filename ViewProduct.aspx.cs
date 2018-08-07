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
public partial class ViewProduct : System.Web.UI.Page
{
	public SqlConnection strConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
	public int CategoryID = 0;
	public int ProductID = 0;
	public int SubProductID = 0;
	protected void Page_Load(object sender, EventArgs e)
	{
		if (Session["CustId"] != null)
		{

            lblMes.Visible = false;
			string loginC = Session["CustName"].ToString();

		}
		else
		{
			Response.Redirect("MainPage.aspx");
		}
		 
		CategoryID = Convert.ToInt32(Request.Params["CategoryID"]);
		ProductID = Convert.ToInt32(Request.Params["ProductID"]);
		SubProductID = Convert.ToInt32(Request.Params["SubProductID"]);

		if (!Page.IsPostBack)
		{
			DateTime dt = new DateTime();
			dt = DateTime.Now;
			int sec = dt.Second;

			int hr = dt.Hour ;
            string CartNo = "O" + sec + Session["CustId"].ToString() + hr.ToString() + sec.ToString ();
			ViewState["CartNo"] = CartNo;
			loaddata();
			loadCartdata();


		}


	}
	public void loaddata()
	{

		try
		{

			strConnection.Open();
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "SELECT  * FROM         dbo.subProductMaster where productid =" + ProductID + " ";
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			da.Fill(ds);
			DataList1.DataSource = ds;
			DataList1.DataBind();
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
	public void loadCartdata()
	{

		try
		{

			strConnection.Open();
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "SELECT  CartId,   SubProductMaster.SubProductName as Product,  CartDetails.Qty ,price as UnitPrice,CartDetails.Qty * price As Price  FROM CartDetails INNER JOIN SubProductMaster ON CartDetails.SubProductId = SubProductMaster.SubProductId INNER JOIN CustomerMaster ON CartDetails.CustId = CustomerMaster.CustId where CartDetails.CustId =" + Session["CustId"].ToString() + "   and CartNo ='" + ViewState["CartNo"].ToString() + "' ANd CartNo not in (Select CartNo from PaymentMaster where PayBy =" + Session["CustId"].ToString() + " )";
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			da.Fill(ds);
			if (ds.Tables[0].Rows.Count > 0)
			{
				btnPay.Visible = true;
				grData.DataSource = ds;
				grData.DataBind();
			}
			else
			{
				btnPay.Visible = false;
			}
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
	protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
	{
		try
		{
			

			TextBox txtQty = (TextBox)e.Item.FindControl("txtQty");
			TextBox txtSubProductId = (TextBox)e.Item.FindControl("txtSubProductId");
            if (txtQty.Text == "")
            {
                lblMes.Visible = true;

                lblMes.Text = "Qty is Required";
                return;

            }
            else
            {
                lblMes.Visible = false;


                if (e.CommandName == "Add")
                {
                    strConnection.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = strConnection;
                    cmd.CommandText = "INSERT INTO [CartDetails]([SubProductId] ,[CustId] ,[qty],CartNo) VALUES ('" + txtSubProductId.Text + "','" + Session["CustId"].ToString() + "','" + txtQty.Text + "','" + ViewState["CartNo"] + "')";
                    cmd.ExecuteNonQuery();
                    strConnection.Close();
                }
            }
		}
		catch
		{
		}
		finally
		{
			strConnection.Close();
			loadCartdata();
		}
	}
	protected void lnkDel_Click(object sender, EventArgs e)
	{
		try
		{

			LinkButton lnkEdit = (LinkButton)(sender);
			GridViewRow row = (GridViewRow)lnkEdit.Parent.Parent;
			int cartId = Convert.ToInt32(grData.DataKeys[row.RowIndex].Value);
			strConnection.Open();
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "delete from cartDetails where CartId =" + cartId + " and CartNo ='" + ViewState["CartNo"] .ToString ()+ "'";
			cmd.ExecuteNonQuery();
			strConnection.Close();
		}
		catch
		{

		}
		finally
		{
			strConnection.Close();
			loadCartdata();
		}
	}
	protected void btnPay_Click(object sender, EventArgs e)
	{
		Response.Redirect("Payment.aspx?CartNo='" + ViewState["CartNo"].ToString() + "'");
	}
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}