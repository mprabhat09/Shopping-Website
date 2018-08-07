<%@ Page  Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
	CodeFile="Payment.aspx.cs" Inherits="Payment" %>

<%@ Register TagPrefix="etier" Namespace="Etier" Assembly="CreditCardValidator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<table width="600PX" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center" colspan="2">
				<table cellpadding="2" cellspacing="0" width="400px" class="tbl_border">
					<tr>
						<td class="bg h2" style="width: 396px" colspan="2">
							&nbsp;&nbsp;<b> Product&nbsp;&nbsp;&nbsp; </b>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" valign="top" style="width: 396px">
							<asp:GridView ID="grData" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84"
								BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="CartId" CellSpacing="2"
								AutoGenerateColumns="False" ShowFooter="True">
								<Columns>
									<asp:BoundField DataField="Product" HeaderText="Product" />
									<asp:BoundField DataField="Qty" HeaderText="Qty" />
									<asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" />
									<asp:BoundField DataField="Price" HeaderText="Price" />
								</Columns>
								<FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
								<HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
								<PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
								<RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
								<SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
								<SortedAscendingCellStyle BackColor="#FFF1D4" />
								<SortedAscendingHeaderStyle BackColor="#B95C30" />
								<SortedDescendingCellStyle BackColor="#F1E5CE" />
								<SortedDescendingHeaderStyle BackColor="#93451F" />
							</asp:GridView>
						</td>
					</tr>
					<tr>
						<td style="height: 58px">
							Card No
						</td>
						<td style="height: 58px">
							<asp:TextBox ID="txtCard" runat="server" MaxLength="16"></asp:TextBox>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtCard"
								ErrorMessage="Please enter a card number" Display="Dynamic" runat="server"  
								ValidationGroup="save" SetFocusOnError="True" />
                                <asp:RegularExpressionValidator ID="RegularMLehgth" runat="server" ControlToValidate="txtCard"
								ValidationGroup="save" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Card length is 16"
								ValidationExpression=".{16}.*" ForeColor="Red" />


							<asp:RegularExpressionValidator ID="Regularexpressionvalidator1" ControlToValidate="txtCard"
								ValidationExpression="^\d+$" ErrorMessage="Please enter the card number without spaces or dashes."
								Display="Static" runat="server"   ValidationGroup="save" SetFocusOnError="True" />
							<etier:CreditCardValidator ID="MyValidator" ControlToValidate="txtCard" ErrorMessage="Please enter a valid credit card number"
								Display="Dynamic" runat="server"  ValidateCardType="True"
								AcceptedCardTypes="MasterCard" ValidationGroup="save" SetFocusOnError="True" Visible="False" />
						</td>
					</tr>
					<tr valign="middle">
						<td>
							<div align="right">
								<font color="#000000"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Valid
									from:</font></font></div>
						</td>
						<td>
							<asp:TextBox ID="StartDate" runat="server" MaxLength="5" Columns="5" />
							<strong><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Valid To:
								<asp:TextBox ID="ExpiryDate" runat="server" MaxLength="5" Columns="5" />
								(MM/YY) </font></strong>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ExpiryDate"
								ErrorMessage="Please enter an expiry date" Display="Dynamic" runat="server" ValidationGroup="save" 
                                SetFocusOnError="True" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="ExpiryDate"
								ErrorMessage="Please Enter Only Numbers" ValidationExpression="^d*[0-9]*(|.\d*[0-9]|,\d*[0-9])?$"
								ValidationGroup="save" ForeColor="Red"></asp:RegularExpressionValidator>
						</td>
					</tr>
					 
					<tr>
						<td>
							&nbsp;</td>
						<td>
							<asp:Label ID="lblMsg" runat="server" ForeColor="#CC0000" Text=" "></asp:Label>
						</td>
					</tr>
					 
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="save"
								OnClick="btnSave_Click" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</asp:Content>
