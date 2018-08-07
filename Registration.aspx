<%@ Page  Language="C#"  AutoEventWireup="true"
	CodeFile="Registration.aspx.cs" Inherits="Registration" %>

 <head>

 <link href="css/balancestyle.css" rel="stylesheet" type="text/css" />
     <style type="text/css">
         .textbox
         {}
     </style>
</head>
 <form id="f" runat ="server" >
<table width="1000px" border="0" cellpadding="0" cellspacing="0" class="tbl_border">
		<tr align="center" valign="middle">
			<td align="center" valign="middle">
				<table  width= "600px"  class="tbl_border">
					<tr align="center" valign="middle">
						<td align="center" valign="middle" colspan="2" class="bg h2">
							Registration Form
						</td>
					</tr>
				 
					 
					<tr>
						<td align="right">
							First Name:
						</td>
						<td align="left" >
							<asp:TextBox ID="txtFirstName" CssClass="textbox" runat="server" MaxLength="50"></asp:TextBox>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="User Name is required."
								ControlToValidate="txtFirstName" ToolTip="First Name is required." ValidationGroup="Login1"
								SetFocusOnError="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td align="right">
							Father Name:
						</td>
						<td align="left">
							<asp:TextBox ID="txtFatherName" CssClass="textbox" runat="server" MaxLength="50"></asp:TextBox>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtFatherName"
								Display="Dynamic" ErrorMessage="Father name is required" SetFocusOnError="true"
								ValidationGroup="Login1" ForeColor="Red"></asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td align="right">
							Last Name:
						</td>
						<td align="left">
							<asp:TextBox ID="txtLastName" CssClass="textbox" runat="server" MaxLength="50"></asp:TextBox>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Last name is required"
								ControlToValidate="txtLastName" ValidationGroup="Login1" Display="Dynamic" SetFocusOnError="true"
								ForeColor="Red"></asp:RequiredFieldValidator>
						</td>
					</tr>
					<tr>
						<td align="right">
							State:
						</td>
						<td align="left">
							<asp:DropDownList ID="ddlStates" runat="server"  
                                  Height="16px" Width="120px" AutoPostBack="True" 
                                onselectedindexchanged="ddlStates_SelectedIndexChanged1">
                            </asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td align="right">
							City:
						</td>
						<td align="left">
							<asp:DropDownList ID="ddlCity" runat="server" AppendDataBoundItems="True" 
                                Height="17px" Width="127px"  
								>
								<asp:ListItem Value="0">Select</asp:ListItem>
							</asp:DropDownList>
							&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="ddlCity"
								Display="Dynamic" ErrorMessage="Select City" InitialValue="0" SetFocusOnError="true"
								ValidationGroup="Login1" ForeColor="Red"></asp:RequiredFieldValidator>
						</td>
					</tr>
					 
					<tr>
						<td align="right">
							Password:
						</td>
						<td align="left">
							<asp:TextBox ID="txtPassword" CssClass="textbox" runat="server" MaxLength="8" TextMode="Password"></asp:TextBox>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Password is required."
								ControlToValidate="txtPassword" ToolTip="Password is required." ValidationGroup="Login1"
								SetFocusOnError="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
							<asp:RegularExpressionValidator ID="valPassword" runat="server" ControlToValidate="txtPassword"
								ValidationGroup="Login1" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Minimum password length is 6"
								ValidationExpression=".{6}.*" ForeColor="Red" />
						</td>
					</tr>
					<tr>
						<td align="right">
							Confirm Password:
						</td>
						<td align="left">
							<asp:TextBox ID="txtconfimpassword" runat="server" TextMode="Password" CssClass="textbox"
								MaxLength="8"></asp:TextBox>
							<asp:RequiredFieldValidator ControlToValidate="txtconfimpassword" Display="Dynamic"
								ErrorMessage="Confirm Password is Required." ID="RequiredFieldValidator11" runat="server"
								ToolTip="Confirm Password is Required." ValidationGroup="Login1" SetFocusOnError="true"
								ForeColor="Red"></asp:RequiredFieldValidator>
							<asp:RegularExpressionValidator ID="RegularExprtxtconfimpasswordionValidator1" runat="server"
								ControlToValidate="txtconfimpassword" ValidationGroup="Login1" SetFocusOnError="true"
								Display="Dynamic" ErrorMessage="Minimum password length is 6" ValidationExpression=".{6}.*"
								ForeColor="Red" />
							<asp:CompareValidator ControlToCompare="txtPassword" ControlToValidate="txtconfimpassword"
								Display="Dynamic" ErrorMessage="Password dot not match" ID="CompareValidator1"
								runat="server" ValidationGroup="Login1" SetFocusOnError="true" ForeColor="Red"></asp:CompareValidator>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						</td>
					</tr>
					<tr>
						<td align="right" valign="top">
							Mobile No:
						</td>
						<td align="left">
							<asp:TextBox ID="txtMoibileNo" CssClass="textbox" runat="server" MaxLength="10"></asp:TextBox>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Mobile no is required"
								ControlToValidate="txtMoibileNo" ValidationGroup="Login1" Display="Dynamic" SetFocusOnError="true"
								ForeColor="Red"></asp:RequiredFieldValidator>
							<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMoibileNo"
								ErrorMessage="Please Enter Only Numbers" ValidationExpression="^d*[0-9]*(|.\d*[0-9]|,\d*[0-9])?$"
								ValidationGroup="Login1" ForeColor="Red"></asp:RegularExpressionValidator>
							<asp:RegularExpressionValidator ID="RegularMLehgth" runat="server" ControlToValidate="txtMoibileNo"
								ValidationGroup="Login1" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Minimum Mobile length is 10"
								ValidationExpression=".{10}.*" ForeColor="Red" />
						</td>
					</tr>
					<tr>
						<td align="right">
							Email Id:
						</td>
						<td align="left" >
							<asp:TextBox ID="txtEmaildId" CssClass="textbox" runat="server" MaxLength="50"></asp:TextBox>
							<asp:RequiredFieldValidator ControlToValidate="txtEmaildId" Display="Dynamic" ErrorMessage="Emailid is required"
								ID="RequiredFieldValidator6" runat="server" SetFocusOnError="true" ValidationGroup="Login1"
								ForeColor="Red"></asp:RequiredFieldValidator>
							<asp:RegularExpressionValidator ControlToValidate="txtEmaildId" ErrorMessage="Invalid Email"
								ID="reqemail" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
								SetFocusOnError="true" ValidationGroup="Login1" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;</td>
						<td align="left">
							<asp:Label ID="lblMess" runat="server" ForeColor="Red"></asp:Label>
						</td>
					</tr>
					<tr>
						<td class="bg h2">
							&nbsp;
						</td>
						<td align="left" class="bg h2">
							<asp:Button ID="btnsave" CssClass="button" runat="server" Text="Submit" ValidationGroup="Login1"
								OnClick="btnsave_Click" />
						&nbsp;
							<asp:HyperLink ID="HyperLink1" runat="server" CssClass="h1" 
								NavigateUrl="~/MainPage.aspx">Login</asp:HyperLink>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
 
 </form>