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

public partial class Admin_frmStateMaster : System.Web.UI.Page
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


 


    
    protected void btnSubmit_Click(object sender, EventArgs e)
    {


       
        try
        {

            strConnection.Open();
						SqlCommand CmCo = new SqlCommand();
						CmCo.Connection = strConnection;
						CmCo.CommandText = "select Count(*) from StateMaster where State='" + txtStateName.Text.Trim() + "'";
						int Count = Convert.ToInt32(CmCo.ExecuteScalar());
						if (Count == 0)
						{
							SqlCommand cmd = new SqlCommand();
							cmd.Connection = strConnection;
							cmd.CommandText = "insert into  dbo.StateMaster(State)values('" + txtStateName.Text.Trim() + "') ";
							cmd.ExecuteNonQuery();
							cmd.Dispose();
							strConnection.Close();
							lblMess.Text = "";
							lblMess.Visible = true;
							lblMess.Text = "Record Saved Successfully";
							txtStateName.Text = "";
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
            txtStateName.Text = string.Empty;
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
    protected void btnAddState_Click1(object sender, EventArgs e)
    {
        try
        {
            divAdd.Visible = true;
            btnSubmit.Visible = true;
           
            txtStateName.Text = string.Empty;
            
           
            
        }
        catch
        {
        }
        finally
        { loaddata(); }
    }



	protected void btnEdit_Click(object sender, EventArgs e)
	{
		Response.Redirect("frmEditState.aspx");
	}
}
