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

public partial class Admin_login : System.Web.UI.Page
{
    public SqlConnection strConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
		 
        if (!IsPostBack)
        {


        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
		 
        try
        {
            string LoginName = Convert.ToString(txtLoginName.Text);
            string Password = Convert.ToString(txtPassword.Text);
            strConnection.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = strConnection;
						cmd.CommandText = "Select * from admin where AdminName='" + LoginName + "' and AdminPassword='" + Password + "' and ascii(adminName)=ascii('" + LoginName + "') and ascii(AdminPassword)=ascii('" + Password + "')";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            strConnection.Close();

            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Session["AdminId"] = Convert.ToInt32(ds.Tables[0].Rows[0]["AdminId"]);
                    Session["AdminName"] = Convert.ToString(ds.Tables[0].Rows[0]["AdminName"]);
                    Response.Redirect("Home.aspx");
                    lblloginmsg.Text = "Login Successfully";

                }
                else
                {
                    lblloginmsg.Text = "InValid Input";
                }

            }
            else
            {
                lblloginmsg.Text = "InValid Input";
            }


        }

        catch
        {
        }
        finally
        {
            strConnection.Close();

        }
    }
    protected void lnkBtnCloseColHelp_Click(object sender, EventArgs e)
    {
        // Response.Redirect("ApplicationDetails.aspx");
    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {

    }
}