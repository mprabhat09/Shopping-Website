<%@ Page  Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
	CodeFile="ViewProduct.aspx.cs" Inherits="ViewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<link href="css/lightbox.min.css" rel="stylesheet" type="text/css" />
	<script src="js/lightbox-plus-jquery.min.js" type="text/javascript"></script>
	<table width="600PX" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center" colspan="2">
				<table cellpadding="2" cellspacing="0" width="400px" class="tbl_border">
					<tr>
						<td class="bg h2">
							&nbsp;&nbsp;<b> Product&nbsp;&nbsp;&nbsp; </b>
						</td>
					</tr>

                    <tr>
                    <td >
                    
                    <asp:Label ID ="lblMes" runat ="server" ForeColor ="Red" Visible =false  ></asp:Label>
                    </td>
                    </tr>
					<tr>
						<td colspan="2" align="center" valign="top">
							<asp:DataList ID="DataList1" runat="server" HorizontalAlign="Left" RepeatColumns="1"
								RepeatDirection="Horizontal" GridLines="None" Width="100%" OnItemCommand="DataList1_ItemCommand" 
                                onselectedindexchanged="DataList1_SelectedIndexChanged">
								<HeaderTemplate>
									<div>
										<%#Eval("SubProductName") %></div>
								</HeaderTemplate>
								<ItemTemplate>
									<table cellpadding="2" cellspacing="0" style="padding-left: 18px;">
										<tr>
											<td>
												<asp:TextBox ID="txtSubProductId" runat="server" Text='<%# Eval("SubProductid")%>'
													Visible="false"> </asp:TextBox>
												
											</td>
											<td class="subheading" style="padding-left: 18px;" valign="top" align="left">
												<a title="<%# Eval("URL")%>" data-lightbox="example-set" href="images/<%# Eval("URL")%>">
													<img border="0" title="<%# Eval("SubProductName")%>" src="images/<%# Eval("URL")%>"
														height="50" width="50" /></a>
											</td>
											<td>
											Price:	<asp:label ID="label" runat="server" Text='<%# Eval("price")%>'
												 > </asp:label>
												Qty: <asp:TextBox ID="txtQty" runat="server" Width ="20px" MaxLength ="2"></asp:TextBox>

                                               <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Qty is required"
								ControlToValidate="txtQty" ValidationGroup="save" Display="Dynamic" SetFocusOnError="true"
								ForeColor="Red"></asp:RequiredFieldValidator>
--%>
											    <asp:RangeValidator ID="RangeValidator1" runat="server" ValidationGroup="save" text ="minimum value is 1"
                                                    ControlToValidate="txtQty" Display="Dynamic" ErrorMessage="minimum value is 1" 
                                                    ForeColor="Red" MinimumValue="1" MaximumValue ="99" SetFocusOnError="True"></asp:RangeValidator>

                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                    ControlToValidate="txtQty" Text ="Please Enter Only Numbers"
								ErrorMessage="Please Enter Only Numbers" ValidationExpression="^d*[0-9]*(|.\d*[0-9]|,\d*[0-9])?$"
								ValidationGroup="save" ForeColor="Red"></asp:RegularExpressionValidator>

											</td>
											<td>
												<asp:Button ID="btnAdd" runat="server" ValidationGroup="save" Text="AddToCart" CommandName="Add" />
											</td>
										</tr>
										<tr>
											<td class="ourservices" colspan="3">
												<asp:Label ID="Label1" runat="server" class="subheading" Style="padding-left: 18px;"
													Text='<%#Eval("SubProductName")%>'></asp:Label>
											</td>
										</tr>
									</table>
								</ItemTemplate>
								<FooterTemplate>
								</FooterTemplate>
							</asp:DataList>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center" valign="top">
							<asp:GridView ID="grData" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84"
								BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="CartId" CellSpacing="2">
								<Columns>
									<asp:TemplateField>
										<ItemTemplate>
											<asp:LinkButton ID="lnkDel" runat="server" OnClick="lnkDel_Click">Delete</asp:LinkButton>
										</ItemTemplate>
									</asp:TemplateField>
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
						<td colspan="2" align="center" valign="top">
							<asp:Button ValidationGroup="save"  ID="btnPay" runat="server" CssClass ="button" Text="Payment" onclick="btnPay_Click" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</asp:Content>
