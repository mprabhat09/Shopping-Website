<%@ Page  Title="" Language="C#" MasterPageFile="~/MasterPage.master"
	AutoEventWireup="true" CodeFile="CustomerChangePassword.aspx.cs" Inherits="CustomerChangePassword" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<table width="650" align="center" cellpadding="0" cellspacing="0" class="tbl_border">
		<tr>
			<td colspan="2" align="center" class="bg h2">
				<strong>Change Password</strong>
			</td>
		</tr>
		<tr>
			<td width="121">
				<td width="427">
					&nbsp;
				</td>
		</tr>
		<tr>
			<td>
				User Id
				<td>
					<asp:Label ID="username" runat="server"></asp:Label>
				</td>
		</tr>
		<tr>
			<td>
				New Password:
			</td>
			<td>
				<asp:TextBox ID="txtnewpassword" runat="server" TextMode="Password" CssClass="textbox"
					MaxLength="8"></asp:TextBox>
				<asp:RequiredFieldValidator ControlToValidate="txtnewpassword" Display="None" ErrorMessage="New Password is Required."
					ID="RequiredFieldValidator1" runat="server" ToolTip="New Password is Required."
					ValidationGroup="pass1" SetFocusOnError="true">*</asp:RequiredFieldValidator>
				<asp:RegularExpressionValidator ID="valPassword" runat="server" ControlToValidate="txtnewpassword"
					ValidationGroup="pass1" SetFocusOnError="true" Display="None" ErrorMessage="Minimum password length is 6"
					ValidationExpression=".{6}.*">*</asp:RegularExpressionValidator>
			</td>
		</tr>
		<tr>
			<td>
				Confirm Password:
			</td>
			<td>
				<asp:TextBox ID="txtconfimpassword" runat="server" TextMode="Password" CssClass="textbox"
					MaxLength="8"></asp:TextBox>
				<asp:RequiredFieldValidator ControlToValidate="txtconfimpassword" Display="None"
					ErrorMessage="Confirm Password is Required." ID="RequiredFieldValidator2" runat="server"
					ToolTip="Confirm Password is Required." ValidationGroup="pass1" SetFocusOnError="true">*</asp:RequiredFieldValidator>
				<asp:CompareValidator ControlToCompare="txtnewpassword" ControlToValidate="txtconfimpassword"
					Display="None" ErrorMessage="Password dot not match" ID="CompareValidator1" runat="server"
					ValidationGroup="pass1" SetFocusOnError="true">*</asp:CompareValidator>
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
			<td>
				<asp:Label ID="txtmessage" runat="server"></asp:Label>
			</td>
		</tr>
		<tr>
			<td class="bg h2" align="center" colspan="2">
				&nbsp;
				<asp:Button ID="Button1" runat="server" Text="Submit" ValidationGroup="pass1" CssClass="button"
					OnClick="ChangePasswordPushButton_Click" />
			</td>
		</tr>
	</table>
	&nbsp;<asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
		ShowSummary="False" ValidationGroup="pass1" />
</asp:Content>
