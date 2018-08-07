using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient; 

public partial class Admin_changepassword : System.Web.UI.Page
{
    public SqlConnection strConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminId"] == null)
        {
            Response.Redirect("login.aspx"); 
        }
    txtUserName.Text = Session["AdminName"].ToString();
    }

    protected void ChangePasswordPushButton_Click(object sender, EventArgs e)
    {
        try
        {
            strConnection.Close();
            strConnection.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT count(*) FROM admin WHERE AdminName = '" + txtUserName.Text + "' AND AdminPassword = '" + txtPassword.Text + "'";
            cmd.Connection = strConnection;
            int RegNo = Convert.ToInt32(cmd.ExecuteScalar());
            if (RegNo > 0)
            {



                strConnection.Close();
                strConnection.Open();

                SqlCommand cmdAdd = new SqlCommand();
                cmdAdd.CommandText = "Update  admin set AdminName='" + txtUserName.Text.Trim() + "',AdminPassword='" + txtNPassword.Text.Trim() + "' WHERE AdminName = '" + txtUserName.Text + "' AND AdminPassword = '" + txtPassword.Text + "'";
                cmdAdd.Connection = strConnection;
                cmdAdd.ExecuteNonQuery();

                lblMsg.Visible = true;
                lblMsg.Text = "Password updated.";
								Response.Redirect("Home.aspx");
            }
            else
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Invalid Password.";
                return;
            }

        }
        catch
        {

        }
    }
    protected void CancelPushButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}