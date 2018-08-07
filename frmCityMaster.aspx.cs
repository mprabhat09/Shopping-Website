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

public partial class Admin_frmCityMaster : System.Web.UI.Page
{
    public SqlConnection strConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

     
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtCityName.Text = string.Empty;
  
        btnSubmit.Visible = true;
        lblMess.Visible = false;

        lblMess.Text = "";
        lblMess.Visible = true;
        lblMess.Text = "Record cleared Successfully";

        divAddCity.Visible = false;
        loaddata();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        lblMess.Text = "";


        divAddCity.Visible = false;
        


        if (!Page.IsPostBack)
        {

            BindState();
            loaddata();
 
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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {




        try
        {

            strConnection.Open();
					SqlCommand CmCo = new SqlCommand();
						CmCo.Connection = strConnection;
						CmCo.CommandText = "select Count(*) from CityMaster where City='" + txtCityName.Text.Trim() + "'";
						int Count = Convert.ToInt32(CmCo.ExecuteScalar());
						if (Count == 0)
						{
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = strConnection;
            cmd.CommandText = "insert into  dbo.CityMaster (City,StateId)values('" + txtCityName.Text.Trim() + "','" + ddlStates.SelectedValue + "') ";
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            strConnection.Close();
            lblMess.Text = "";
            lblMess.Visible = true;
            lblMess.Text = "Record Saved Successfully";




            txtCityName.Text = string.Empty;
            ddlStates.SelectedIndex = 0;
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

    protected void btnAddCity_Click(object sender, EventArgs e)
    {
        try
        {
            BindState();
            //loaddata();
            ddlStates.Focus();
            divAddCity.Visible = true;
            lblMess.Visible = false;
     
            btnSubmit.Visible = true;
            divAddCity.Visible = true;
 
            txtCityName.Text = string.Empty;
     
      
        }
        catch
        {
        }
    }

	 


	protected void btnEdit_Click(object sender, EventArgs e)
	{
		Response.Redirect("frmEditCity.aspx");
	}
}
