<%@ Page  Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true"
	CodeFile="frmCategoryMaster.aspx.cs" Inherits="Seller_frmCategoryMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<table width="600PX" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center" colspan="2">
				<table cellpadding="2" cellspacing="0" width="400px" class="tbl_border">
					<tr>
						<td class="bg h2">
							&nbsp;&nbsp;<b>Category Master&nbsp;&nbsp;&nbsp; </b>
						</td>
					</tr>
					<tr>
						<td>
							<div id="divDisp" runat="server">
								<table width="100%">
									<tr>
										<td align="center" valign="top" colspan="2">
											<asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true"
												ShowSummary="false" ValidationGroup="SearchBy" HeaderText="Verify information with * " />
										</td>
									</tr>
									<tr>
										<td align="center" valign="top" colspan="2">
											<asp:GridView ID="GridCategory" runat="server" AutoGenerateColumns="False" CellPadding="4"
												OnPageIndexChanging="GridCategory_PageIndexChanging" DataKeyNames="CategoryId"
												PageSize="5" GridLines="None" AllowPaging="True" EmptyDataText="No Data Found"
												Width="100%" OnRowDataBound="GridCategory_RowDataBound" Style="margin-bottom: 0px"
												ForeColor="#333333" OnSelectedIndexChanged="GridCategory_SelectedIndexChanged"
												Font-Bold="True" Font-Italic="True" Font-Names="Lucida Fax" Font-Size="Medium">
												<RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
												<Columns>
													<asp:TemplateField HeaderText="Edit">
														<ItemTemplate>
															<asp:ImageButton ID="lnkEdit" ImageUrl="~/images/smallEdit.jpg" Width="20px" runat="server"
																OnClick="lnkEdit_Click"></asp:ImageButton>
														</ItemTemplate>
														<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
													</asp:TemplateField>
													<asp:BoundField DataField="Category" HeaderText="Category Name">
														<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
													</asp:BoundField>
													<asp:TemplateField HeaderText="Delete">
														<ItemTemplate>
															<asp:ImageButton ID="lnkDelete" runat="server" ImageUrl="~/images/smalldelete.jpg" Width="20px"
																OnClick="lnkDelete_Click"></asp:ImageButton>
														</ItemTemplate>
														<HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
														<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
													</asp:TemplateField>
												</Columns>
												<PagerSettings FirstPageText="next" LastPageText="last" />
												<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
												<SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
												<HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
												<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
												<AlternatingRowStyle BackColor="White" />
												<SortedAscendingCellStyle BackColor="#FDF5AC" />
												<SortedAscendingHeaderStyle BackColor="#4D0000" />
												<SortedDescendingCellStyle BackColor="#FCF6C0" />
												<SortedDescendingHeaderStyle BackColor="#820000" />
											</asp:GridView>
										</td>
									</tr>
									<tr>
										<td align="center" colspan="2" class="style1">
											&nbsp;
										</td>
									</tr>
									<tr>
										<td align="center" colspan="2">
											<asp:Button ID="btnAddCategory" Height="25px" Width="70px" runat="server" OnClick="btnAddCategory_Click1"
												CausesValidation="False" EnableViewCategory="False" Text="Add" CssClass="button" />
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
							<div id="divAdd" visible="false" runat="server" style="width: 100%">
								<table width="100%" class="centalign">
									<tr>
										<td colspan="2" class="bg h2">
											<b>Add Category</b>&nbsp;
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
											<font size="3pt">Category Name</font>
										</td>
										<td align="left" valign="top">
											<asp:TextBox ID="txtCategoryName" runat="server" MaxLength="50" CssClass="textbox"></asp:TextBox>
											<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCategoryName"
												ValidationGroup="Category" SetFocusOnError="true" ErrorMessage="please enter Category name"
												ForeColor="Red">*</asp:RequiredFieldValidator>
										</td>
									</tr>
									<tr>
										<td>
											<asp:ValidationSummary ID="ValidationSummary2" HeaderText="Verify information with * "
												runat="server" ValidationGroup="Category" EnableViewCategory="False" ShowMessageBox="True"
												ShowSummary="False" />
										</td>
										<td>
										</td>
									</tr>
									<tr>
										<td colspan="2" align="center" class="bg h2">
											&nbsp;
											<asp:Button ID="btnSubmit" Height="25px" Width="70px" runat="server" OnClick="btnSubmit_Click"
												ValidationGroup="Category" EnableViewCategory="False" CssClass="button" Text="Save" />
											<asp:Button ID="btnUpdate" Height="25px" Width="70px" runat="server" OnClick="btnUpdate_Click"
												ValidationGroup="Category" CssClass="button" Text="Update" />
											&nbsp;<asp:Button ID="btnCancel" runat="server" Height="25px" Width="70px" OnClick="btnCancel_Click1"
												CausesValidation="False" EnableViewCategory="False" CssClass="button" Text="Cancel" />
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
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
	<style type="text/css">
		.style1
		{
			height: 17px;
		}
	</style>
</asp:Content>
