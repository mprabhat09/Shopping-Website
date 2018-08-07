<%@ Control Language="C#" AutoEventWireup="true" CodeFile="left2.ascx.cs" Inherits="left2" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!--<img src="images/categories2.gif" width="217" height="483" border="0" usemap="#Map2" />-->
<script language="javascript" type="text/javascript">
	function fun_hide_show(divid) {
		//alert(document.getElementById("Left1_tot_div").value);
		for (var a = 0; a < parseInt(document.getElementById("Left1_tot_div").value); a++) {
			var divname = "div" + a;
			//alert(document.getElementById(divid)+" : "+divname);
			if (divid == divname) {

				if (document.getElementById(divid).style.display == 'none') {
					document.getElementById(divid).style.display = '';

				}
				else {
					document.getElementById(divid).style.display = 'none';

				}
			}
			else {
				document.getElementById(divname).style.display = 'none';
			}

		}
	}

	function fun_hide_show1(divid) {
		alert('hh');
		//alert(document.getElementById("Left1_tot_div").value);
		for (var a = 0; a < parseInt(document.getElementById("Left1_tot_div").value); a++) {
			var divname = "div" + a;
			//alert(document.getElementById(divid)+" : "+divname);
			if (divid == divname) {

				debugger;
				if (document.getElementById(divid).style.display == 'none') {
					document.getElementById(divid).style.display = 'block';

				}
				else {
					document.getElementById(divid).style.display = 'none';

				}
			}
			else {
				document.getElementById(divname).style.display = 'block';
			}

		}
	}

</script>
<link href="css/balancestyle.css" rel="stylesheet" type="text/css" />
<table align="left" class="AccordionPanelTab" style="width: 175px;">
	<tr>
		<td>
			<table width="213" height="20" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td height="23" class="buttoncolor" style="padding-left: 55px;">
						<a href="Default.aspx" class="whitecolour">Home</a>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<%
				try
				{
					con.Open();
					SqlCommand cmd = new SqlCommand("SELECT     c.CategoryID, Category as CategoryName,  dbo.ProductMaster.ProductName, dbo.ProductMaster.ProductID FROM dbo.CategoryMaster c left outer JOIN dbo.ProductMaster ON c.CategoryID = dbo.ProductMaster.CategoryID order by c.CategoryID ", con);
					SqlDataAdapter ad = new SqlDataAdapter(cmd);
					DataSet ds = new DataSet();
					ad.Fill(ds);
					if (ds.Tables[0].Rows.Count > 0)
					{
						String name = "";
						int i = 0, j = 0, k = 0;
						while (i < ds.Tables[0].Rows.Count)
						{

							if (name == "" || name.ToString() != ds.Tables[0].Rows[i]["CategoryName"].ToString())
							{

								if (i != 0)
									Response.Write("</div></td></tr>");
								name = ds.Tables[0].Rows[i]["CategoryName"].ToString();

								SqlCommand cmd2 = new SqlCommand("select count(*) as cnt FROM dbo.CategoryMaster c left outer JOIN dbo.ProductMaster ON c.CategoryID = dbo.ProductMaster.CategoryID where c.CategoryID=" + ds.Tables[0].Rows[i]["CategoryID"].ToString() + " and ProductName is not null", con);
								SqlDataAdapter ad2 = new SqlDataAdapter(cmd2);
								DataSet ds2 = new DataSet();
								ad2.Fill(ds2);
								if (ds2.Tables[0].Rows.Count > 0)
								{
									k = Convert.ToInt32(ds2.Tables[0].Rows[0]["cnt"].ToString());
								}

								if (k > 0)
								{
									Response.Write("<tr ><td  valign='top' class='AccordionPanelContent'  style=\"cursor:pointer\" onclick=\"fun_hide_show('div" + j.ToString() + "')\" >" + ds.Tables[0].Rows[i]["CategoryName"].ToString() + "</td></tr>");
								}
								else
								{
									Response.Write("<tr ><td  valign='top' class='AccordionPanelContent'  style=\"cursor:pointer\" onclick=\"fun_hide_show('div" + j.ToString() + "')\" ><a class='whitecolour' href ='ViewProduct.aspx?CategoryID=" + ds.Tables[0].Rows[i]["CategoryID"].ToString() + "&ProductID=0'>" + ds.Tables[0].Rows[i]["CategoryName"].ToString() + "</a></td></tr>");

								}

								Response.Write("<tr ><td valign='top' ><div class='AccordionPanelTab' style='display:none' id='div" + j.ToString() + "'>");
								j++;
							}
							if (ds.Tables[0].Rows[i]["ProductName"].ToString().Length > 0)
							{

								Response.Write("&nbsp;<img src='images/arrow.gif'  width='10' height='11' />&nbsp;<a class='navibg' href='ViewProduct.aspx?CategoryID=" + ds.Tables[0].Rows[i]["CategoryID"].ToString() + "&ProductID=" + ds.Tables[0].Rows[i]["ProductID"].ToString() + "' >" + ds.Tables[0].Rows[i]["ProductName"].ToString() + "</a>" + "<br/> ");

								 

							}

							i++;
						}
						if (i != 0)
							Response.Write("</div></td></tr>");
						tot_div.Value = j.ToString();
					}
					con.Close();
				}
				catch (Exception ex)
				{
					Response.Write(ex.Message.ToString());
				}
    
			%>
			<asp:HiddenField ID="tot_div" runat="server" 
                onvaluechanged="tot_div_ValueChanged" />
		</td>
	</tr>
	<tr>
		<td height="23" class="buttoncolor" style="padding-left: 55px;">
			<a href="Report.aspx" class="whitecolour">Report</a>
		</td>
	</tr>
	<tr>
		<td height="23" class="buttoncolor" style="padding-left: 55px;">
			<a href="CustomerChangePassword.aspx" class="whitecolour">Change Password</a>
		</td>
	</tr>
	<tr>
		<td height="23" class="buttoncolor" style="padding-left: 55px;">
			<asp:LinkButton ID="lnkLogout" runat="server" class="whitecolour" 
				onclick="lnkLogout_Click"  >Logout</asp:LinkButton>
		</td>
	</tr>
	 
</table>
