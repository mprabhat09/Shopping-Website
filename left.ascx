<%@ Control Language="C#" AutoEventWireup="true" CodeFile="left.ascx.cs" Inherits="admin_left" %>
<link href="../css/balancestyle.css" rel="stylesheet" type="text/css" />
<table width="200" align="left" cellpadding="3" cellspacing="3" class="tableborder">
	<tr>
		<td style="width: 146px" class="text2 bg">
			<asp:LinkButton ID="lnkAddCategory" runat="server" OnClick="lnkAddCategory_Click"
				CssClass="text2">Category</asp:LinkButton>
		</td>
	</tr>
	<tr>
		<td style="width: 146px" class="text2 bg">
			<asp:LinkButton ID="lnkAddProducts" runat="server" CssClass="text2" OnClick="lnkAddProducts_Click">Product</asp:LinkButton>
		</td>
	</tr>
	<tr>
		<td style="width: 146px" class="text2 bg">
			<asp:LinkButton ID="lnkAddsubProduct" runat="server" CssClass="text2" OnClick="lnkAddsubProduct_Click">Sub Product</asp:LinkButton>
		</td>
	</tr>
	<tr>
		<td style="width: 146px" class="text2 bg">
		<asp:LinkButton ID="lnkState" runat="server" CssClass="text2" 
				onclick="lnkState_Click"  >State Master</asp:LinkButton>
			&nbsp;
		</td>
	</tr>
	<tr>
		<td style="width: 146px" class="text2 bg">
			<asp:LinkButton ID="lnkCity" runat="server" CssClass="text2" 
				onclick="lnkCity_Click"  >City Master</asp:LinkButton>
		</td>
	</tr>
	<tr>
		<td style="width: 146px" class="text2 bg">
			<asp:LinkButton ID="lnkReport" runat="server" CssClass="text2" 
				onclick="lnkReport_Click">Report</asp:LinkButton>
		</td>
	</tr>
	<tr>
		<td style="width: 146px" class="text2 bg">
			<asp:LinkButton ID="lnkChangePassword" runat="server" OnClick="lnkChangePassword_Click"
				CssClass="text2">Change Password</asp:LinkButton>
		</td>
	</tr>
	<tr>
		<td style="width: 146px" class="text2 bg">
			<asp:LinkButton ID="lnkLogout" runat="server"  
				CssClass="text2" onclick="lnkLogout_Click">Logout</asp:LinkButton>
		</td>
	</tr>
</table>
