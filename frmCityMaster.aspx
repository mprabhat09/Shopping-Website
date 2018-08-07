<%@ Page  Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master"  AutoEventWireup="true"
	EnableSessionState="ReadOnly" CodeFile="frmCityMaster.aspx.cs" Inherits="Admin_frmCityMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<table width="600PX" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center" colspan="2">
				<table cellpadding="2" cellspacing="0" width="400px"  class="tbl_border">
					<tr>
						<td class="bg h2" align="center" valign="top" style="width: 400px">
							<b>City Master</b>&nbsp;
						</td>
					</tr>
					<tr>
						<td align="right">
							&nbsp;
						</td>
					</tr>
					<tr> 
						<td align="center" valign="top">
							<asp:GridView ID="GridCity" runat="server" AutoGenerateColumns="False" AllowPaging="True"
								OnPageIndexChanging="GridCity_PageIndexChanging" DataKeyNames="CityId" EmptyDataText="No Data Found"
								GridLines="Horizontal" Width="100%" CellPadding="3" BackColor="White" BorderColor="#E7E7FF"
								BorderStyle="None" BorderWidth="1px">
								<RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
								<Columns>
									<asp:BoundField DataField="State" HeaderText="State Name" />
									<asp:BoundField DataField="City" HeaderText="City" />
								</Columns>
								<PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
								<SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
								<HeaderStyle BackColor="#660066" Font-Bold="True" ForeColor="#F7F7F7" />
								<FooterStyle BackColor="#B5C7DE" CssClass="header1 " ForeColor="#4A3C8C" />
								<AlternatingRowStyle BackColor="#F7F7F7" />
							</asp:GridView>
						</td>
					</tr>
					<br />
					<tr>
						<td width="30%" align="center">
							<asp:Button ID="btnAddCity" runat="server" OnClick="btnAddCity_Click" TabIndex="1"
								CausesValidation="False" ImageUrl="~/Images/addnew.gif" Height="25px" Width="70px"
								ImageAlign="left" EnableViewState="False" CssClass="button" Text="Add" />
								<asp:Button ID="btnEdit" runat="server"  TabIndex="1"
								CausesValidation="False" ImageUrl="~/Images/addnew.gif" Height="25px" Width="70px"
								ImageAlign="left" EnableViewState="False" CssClass="button" Text="Edit" onclick="btnEdit_Click" />
							&nbsp;<asp:Label ID="lblMess" runat="server" Visible="False" ForeColor="Red"></asp:Label>
							
						</td>
					</tr>
					<tr>
						<td align="left">
							<div id="divAddCity" runat="server" visible="false">
								<table width="100%" class="centalign">
									<tr>
										<td colspan="2" class="bg h2" >
											<b>Add City</b>
										</td>
									</tr>
									<tr>
										<td class="text" align="right" valign="top" style="width: 92px">
											Select State :&nbsp;
										</td>
										<td calign="left" valign="top">
											<%--<asp:DropDownList ID="ddlStates" runat="server" Width="120px"><asp:ListItem Value="0">Select</asp:ListItem></asp:DropDownList>--%>
											<asp:DropDownList
												ID="ddlStates" runat="server" AppendDataBoundItems="True" ToolTip="State" CssClass="textbox"
												Width="200px">
												<asp:ListItem Value="0">Select</asp:ListItem>
											</asp:DropDownList>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlStates"
												ValidationGroup="City" InitialValue="0" SetFocusOnError="True" ErrorMessage="please select state">*</asp:RequiredFieldValidator>
										</td>
									</tr>
									<tr>
										<td align="right" valign="top" style="width: 92px">
											City Name :
										</td>
										<td align="left" valign="top">
											<asp:TextBox ID="txtCityName" runat="server" MaxLength="50" ToolTip="City Name" EnableViewState="False"
												CssClass="textbox"></asp:TextBox>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCityName"
												ValidationGroup="City" SetFocusOnError="True" ErrorMessage="please enter city name">*</asp:RequiredFieldValidator>&nbsp;
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<asp:ValidationSummary ID="ValidationSummary2" runat="server" HeaderText="Verify information with * "
												ValidationGroup="City" ShowMessageBox="True" ShowSummary="False" />
										</td>
									</tr>
									<tr>
										<td style="width: 30%" class="bg h2" >
											&nbsp;
										</td>
										<td align="left" valign="top" class="bg h2" >
											<asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" ValidationGroup="City"
												Height="25px" Width="70px" EnableViewState="False" CssClass="button" Text="Save" />
											&nbsp;&nbsp;<asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" CausesValidation="False"
												Height="25px" Width="70px" EnableViewState="False" CssClass="button" Text="Cancel" />
											&nbsp;
										</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</asp:Content>
