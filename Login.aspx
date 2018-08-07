<%@ Page  Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Admin_login" %>

<form id="f" runat="server">
<head>
	<link href="../css/balancestyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<table align="center" style="width: 0px; height: 129px; margin-left: 0px">
		<tr>
			<td>
				<table align="center" class="tbl_border">
					<tr>
						<td align="center" colspan="2">
							<strong style="font-family: 'Lucida Bright'; font-size: 30px">&nbsp;Admin Login</strong>
						</td>
					</tr>
					<tr>
						<td align="right" style="font-family: 'lucida Bright'; font-size: 20px">
							Login Name:
						</td>
						<td align="left">
							<asp:TextBox ID="txtLoginName" runat="server" MaxLength="10"></asp:TextBox>
							<asp:RequiredFieldValidator ID="ReqLoginname" runat="server" ControlToValidate="txtLoginName"
								Display="None" ErrorMessage="Enter Login Name" SetFocusOnError="True" ValidationGroup="login">*</asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td align="right" style="font-family: 'lucida Bright'; font-size: 20px">
							Password:
						</td>
						<td align="left">
							<asp:TextBox ID="txtPassword" runat="server" MaxLength="8" TextMode="Password"></asp:TextBox>
							<asp:RequiredFieldValidator ID="ReqPassword" runat="server" ControlToValidate="txtPassword"
								Display="None" ErrorMessage="Enter Password" SetFocusOnError="True" Text="*"
								ValidationGroup="login"></asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="2" valign="middle">
							<asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Sign in"
								ValidationGroup="login" Height="37px" Width="110px" ForeColor="Black" />
							<asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
								ShowSummary="False" ValidationGroup="login" Width="262px" />
						</td>
					</tr>
					<tr>
						<td align="left">
						</td>
						<td align="left">
							<asp:Label ID="lblloginmsg" runat="server" ForeColor="Red"></asp:Label>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</form>
