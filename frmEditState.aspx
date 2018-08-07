<%@ Page  Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master"  AutoEventWireup="true"
	CodeFile="frmEditState.aspx.cs" Inherits="frmEditState" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<table width="600PX" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center" colspan="2">
				<table cellpadding="2" cellspacing="0" width="400px" class="tbl_border">
					<tr>
						<td class="bg h2">
							&nbsp;&nbsp;<b>State Master&nbsp;&nbsp;&nbsp; </b>
						</td>
					</tr>
					<tr>
						<td align="left" valign="top">
							Select State
							<asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"
								AppendDataBoundItems="True" Style="height: 22px" Width="200px" CssClass="textbox">
								<asp:ListItem Value="0">Select</asp:ListItem>
							</asp:DropDownList>
						</td>
					</tr>
					<tr>
						<td>
							<div id="divDisp" runat="server" style="widows: 100%">
								<%--style="display :none"--%> 
								<table width="100%">
									<tr>
										<td align="center" valign="top" colspan="2">
											<asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true"
												ShowSummary="false" ValidationGroup="SearchBy" HeaderText="Verify information with * " />
										</td>
									</tr>
									<tr>
										<td align="center" valign="top" colspan="2">
											<asp:GridView ID="GridState" runat="server" AutoGenerateColumns="False" CellPadding="3"
												OnPageIndexChanging="GridState_PageIndexChanging" DataKeyNames="StateId" PageSize="5"
												GridLines="Horizontal" AllowPaging="True" EmptyDataText="No Data Found" Width="100%"
												BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" Style="margin-bottom: 0px">
												<RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
												<Columns>
													<asp:BoundField DataField="State" HeaderText="State Name" />
												</Columns>
												<PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
												<SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
												<HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
												<FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
												<AlternatingRowStyle BackColor="#F7F7F7" />
											</asp:GridView>
										</td>
									</tr>
									<tr>
										<td align="center" colspan="2">
											&nbsp;
										</td>
									</tr>
									<tr>
										<td align="center" colspan="2">
											<asp:Label ID="lblMess" runat="server" ForeColor="#FF3300" Visible="False"></asp:Label>
										</td>
									</tr>
									<tr>
										<td align="center" colspan="2">
											&nbsp;
										</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div id="divAdd" runat="server" style="width: 100%">
								<%--style="display :none"--%>
								<table width="100%" class="centalign">
									<tr>
										<td colspan="2" class="bg h2" >
											<b>Add State</b>&nbsp;
										</td>
									</tr>
									<tr>
										<td align="right" valign="top">
											&nbsp;
										</td>
										<td align="left" valign="top">
										</td>
									</tr>
									<tr>
										<td align="right" valign="top">
											State Name
										</td>
										<td align="left" valign="top">
											<asp:TextBox ID="txtStateName" runat="server" MaxLength="50" CssClass="textbox"></asp:TextBox>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStateName"
												ValidationGroup="State" SetFocusOnError="true" ErrorMessage="please enter state name">*</asp:RequiredFieldValidator>
										</td>
									</tr>
									<tr>
										<td>
											<asp:ValidationSummary ID="ValidationSummary2" HeaderText="Verify information with * "
												runat="server" ValidationGroup="State" EnableViewState="False" ShowMessageBox="True"
												ShowSummary="False" />
										</td>
										<td>
										</td>
									</tr>
									<tr>
										<td class="bg h2"  colspan="2">
											&nbsp;
											&nbsp;<asp:Button ID="btnUpdate" Height="25px" Width="70px" runat="server" 
												OnClick="btnUpdate_Click" ValidationGroup="State" CssClass="button"
												Text="Update" />
											<asp:Button ID="btnCancel" runat="server" Height="25px" Width="70px" OnClick="btnCancel_Click1"
												CausesValidation="False" EnableViewState="False" CssClass="button" Text="Cancel" />
											&nbsp;
											<asp:Button ID="btnDelete" runat="server" CssClass="button" OnClick="btnDelete_Click"
												Text="Delete" Visible="False" />
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
