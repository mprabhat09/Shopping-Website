<%@ Page  Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master"  AutoEventWireup="true"
	CodeFile="frmEditCity.aspx.cs" Inherits="frmEditCity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<table width="600PX" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center" colspan="2">
				<table cellpadding="2" cellspacing="0" width="400px" class="tbl_border">
					<tr>
						<td  class="bg h2" align="center" valign="top" style="width: 400px">
							<b>City Master</b>&nbsp;
						</td>
					</tr>
					<tr>
						<td style="width: 400px" align="left">
							Select City&nbsp;&nbsp;&nbsp;
							<asp:DropDownList ID="ddlCity" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
								OnSelectedIndexChanged="ddlCity_SelectedIndexChanged" Width="200px" 
								CssClass="textbox">
								<asp:ListItem Value="0">Select</asp:ListItem>
							</asp:DropDownList>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlCity"
								ValidationGroup="City" InitialValue="0" SetFocusOnError="True" ErrorMessage="please select city">*</asp:RequiredFieldValidator>
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
									<asp:TemplateField HeaderText="State Name" SortExpression="StateName">
										<ItemTemplate>
											<asp:Label ID="lblStateName" runat="server" Text='<%#Eval("State")%>'></asp:Label></ItemTemplate>
										<HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Cssclass="bg h2"  />
										<ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
									</asp:TemplateField>
									<asp:TemplateField HeaderText="City Name" SortExpression="CityName">
										<ItemTemplate>
											<asp:Label ID="lblCityName" runat="server" Text='<%#Eval("City")%>'></asp:Label></ItemTemplate>
										<HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" Cssclass="bg h2"  />
										<ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
									</asp:TemplateField>
								</Columns>
								<PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
								<SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
								<HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
								<FooterStyle BackColor="#B5C7DE" CssClass="header1 " ForeColor="#4A3C8C" />
								<AlternatingRowStyle BackColor="#F7F7F7" />
							</asp:GridView>
						</td>
					</tr>
					<br />
					<tr>
						<td width="30%" align="center">
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
											<%--<asp:DropDownList ID="ddlStates" runat="server" Width="120px"><asp:ListItem Value="0">Select</asp:ListItem></asp:DropDownList>--%><asp:DropDownList
												ID="ddlStates" runat="server" AppendDataBoundItems="True" ToolTip="State" 
												CssClass="textbox">
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
										<td class="bg h2"  colspan="2">
											&nbsp;
											&nbsp;<asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click"
												ValidationGroup="City" Height="25px" Width="70px" CssClass="button"
												Text="Update" />
											&nbsp;<asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" CausesValidation="False"
												Height="25px" Width="70px" EnableViewState="False" CssClass="button" Text="Cancel" />
											&nbsp;
											<asp:Button ID="btnDelete" runat="server" CssClass="button" OnClick="btnDelete_Click"
												Text="Delete" />
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
