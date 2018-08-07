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
public partial class Payment : System.Web.UI.Page
{
	public SqlConnection strConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
	public string CartNo = "";
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
		CartNo = Request.QueryString["CartNo"].ToString();
		if (!Page.IsPostBack)
		{
			loadCartdata();
		}
	}
	public void loadCartdata()
	{

		try
		{

			strConnection.Open();
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "SELECT  CartId,   SubProductMaster.SubProductName as Product,  CartDetails.Qty ,price as UnitPrice,CartDetails.Qty * price As Price  FROM CartDetails INNER JOIN SubProductMaster ON CartDetails.SubProductId = SubProductMaster.SubProductId INNER JOIN CustomerMaster ON CartDetails.CustId = CustomerMaster.CustId where CartDetails.CustId =" + Session["CustId"].ToString() + "   and CartNo =" + CartNo.ToString() + " ANd CartNo not in (Select CartNo from PaymentMaster where PayBy =" + Session["CustId"].ToString() + " )";
			SqlDataAdapter da = new SqlDataAdapter(cmd);
			DataSet ds = new DataSet();
			da.Fill(ds);



			cmd.Dispose();
			strConnection.Close();
			int Sum = 0; int val = 0;
			for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
			{

				if (i == 0)
				{
					Sum = Convert.ToInt32(ds.Tables[0].Rows[i]["Price"]);
				}
				else
				{
					Sum = Convert.ToInt32(ds.Tables[0].Rows[i]["Price"]) + Sum;
				}

			}
			grData.Columns[3].FooterText = Sum.ToString();
			ViewState["Price"] = Sum.ToString();
			grData.DataSource = ds;
			grData.DataBind();
		}
		catch
		{
		}
		finally
		{
			strConnection.Close();


		}

	}
	protected void btnSave_Click(object sender, EventArgs e)
	{
		try
		{
			//INSERT INTO [PaymentMaster]([CartNo],[Amt],[PayBy],[PayDate])VALUES

			strConnection.Open();
			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
			cmd.CommandText = "INSERT INTO [PaymentMaster]([CartNo],[Amt],[PayBy],cardNo)VALUES(" + CartNo.ToString() + ",'" + ViewState["Price"].ToString() + "','" + Session["CustId"] + "','"+txtCard.Text +"')";
			cmd.ExecuteNonQuery();
			strConnection.Close();
			lblMsg.Text = "Payment Successfully";
			txtCard.Text = "";
			StartDate.Text = "";
			ExpiryDate.Text = "";
		
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