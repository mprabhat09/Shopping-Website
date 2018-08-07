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
using System.IO;

public partial class Report : System.Web.UI.Page
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
		if (Page.IsPostBack == false)
		{


			try
			{
				ReadProduct();

			}
			catch
			{

			}
		}
	}
	private void ReadProduct()
	{
		try
		{


			SqlCommand cmd = new SqlCommand();
			cmd.Connection = strConnection;
            cmd.CommandText = "SELECT PaymentMaster.CardNo, PaymentMaster.CartNo, SubProductMaster.SubProductName, ProductMaster.ProductName, CategoryMaster.Category, CartDetails.qty, SubProductMaster.Price as UnitPrice, CartDetails.qty * SubProductMaster.Price as TotalPrice    FROM SubProductMaster INNER JOIN CartDetails ON SubProductMaster.SubProductId = CartDetails.SubProductId INNER JOIN  ProductMaster ON SubProductMaster.ProductId = ProductMaster.ProductId INNER JOIN CategoryMaster ON ProductMaster.CategoryId = CategoryMaster.CategoryId INNER JOIN  PaymentMaster ON CartDetails.CartNo = PaymentMaster.CartNo where  CartDetails.CustId =" + Session["CustId"].ToString() + "";    
			SqlDataAdapter adp = new SqlDataAdapter(cmd);

			//Fill Dataet
			DataSet ds = new DataSet();
			adp.Fill(ds);

			grdData.DataSource = ds;
			grdData.DataBind();

			adp.Dispose();
			cmd.Cancel();
			strConnection.Close();
		}
		catch
		{

		}
	}

	protected void btnExport_Click(object sender, EventArgs e)
	{

		try
		{

			Response.Clear();

			Response.Buffer = true;

			string attachment = null;

			attachment = "attachment; filename=Product.xls";

			Response.ClearContent();

			Response.AddHeader("content-disposition", attachment);

			Response.ContentType = "application/vnd.ms-excel";

			StringWriter sw = null;

			sw = new StringWriter();

			HtmlTextWriter htw = default(HtmlTextWriter);

			htw = new HtmlTextWriter(sw);



			HtmlForm frm = default(HtmlForm);

			frm = new HtmlForm();

			grdData.HeaderStyle.Width = Unit.Pixel(20);//here use your gridview control id

			grdData.Parent.Controls.Add(frm);//here use your gridview control id

			frm.Attributes["runat"] = "server";

			frm.Controls.Add(grdData);//here use your gridview control id

			grdData.AllowPaging = false;//here use your gridview control id

			grdData.AllowSorting = false;//here use your gridview control id

			frm.RenderControl(htw);

			Response.Write(sw.ToString());

			Response.End();

		}

		catch { }

		finally { }

	}
}