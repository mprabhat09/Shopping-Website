<%@ Page  Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true"
    CodeFile="frmProductMaster.aspx.cs" Inherits="frmProductMaster" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="600PX" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center" colspan="2">
                <table cellpadding="2" cellspacing="0" width="400px" class="tbl_border">
                    <tr>
                        <td colspan="3" class="bg h2">
                            Product Master
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:GridView ID="gvProduct" runat="server" AllowPaging="True" CaptionAlign="Top"
                                DataKeyNames="ProductId" Font-Names="Times New Roman" HorizontalAlign="Center"
                                AutoGenerateColumns="False" OnRowDataBound="gvProduct_RowDataBound" Width="600px"
                                OnPageIndexChanging="gvProduct_PageIndexChanging" PageSize="5" 
								CssClass="box_text2" Font-Size="Medium" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" ImageUrl="~/images/smalledit.jpg" Width="20px" runat="server"
                                                OnClick="lnkEdit_Click"></asp:ImageButton>
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" /> 
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Category" HeaderText="Category  Name">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ProductName" HeaderText="Product  Name">
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Top" />
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
								<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
								<HeaderStyle CssClass="box_text" BackColor="#990000" Font-Bold="True" 
									ForeColor="White" />
                            	<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
								<RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
								<SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
								<SortedAscendingCellStyle BackColor="#FDF5AC" />
								<SortedAscendingHeaderStyle BackColor="#4D0000" />
								<SortedDescendingCellStyle BackColor="#FCF6C0" />
								<SortedDescendingHeaderStyle BackColor="#820000" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Button ID="btnNew" runat="server" Text="Add New" OnClick="btnNew_Click" />
                        </td>
                    </tr>
                    <div id="panAdd" runat="server" visible="false">
                        <tr>
                            <td colspan="3" class="bg h2" >
                                Add Product
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top">
                                Select Category
                            </td>
                            <td align="left">
                                <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="false" AppendDataBoundItems="True"
                                    Style="height: 22px" Width="200px" CssClass="textbox">
                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlCategory"
                                    ToolTip=" " ValidationGroup="Login1" Display="Dynamic" ErrorMessage="Select Category"
                                    SetFocusOnError="True" InitialValue="0">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server">Product Name:</asp:Label>
                            </td>
                            <td align="left">
                                <asp:TextBox ID="txtSName" CssClass="textbox" runat="server" ValidationGroup="Login1"
                                    Width="200px" MaxLength="50"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="txtSName"
                                    ToolTip="Product Name is required." ValidationGroup="Login1" Display="Dynamic"
                                    ErrorMessage="Product Name is required." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                      
                     
                       
                        <tr>
                            <td colspan="3" align="center" valign="top">
                                &nbsp;<asp:Label ID="lblEMsg" runat="server" Font-Bold="False" Font-Names="Times New Roman"
                                    Font-Size="Medium" ForeColor="Red" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" class="bg h2">
                                <asp:Button ID="btnUpdate" runat="server" CssClass="button " Text="Update" OnClick="btnUpdate_Click"
                                    ValidationGroup="Login1" />
                                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add..." ValidationGroup="Login1"
                                    CssClass="button" />&nbsp;<asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click"
                                        Text="Clear" CssClass="button" />
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                                    ShowSummary="False" ValidationGroup="Login1" />
                            </td>
                        </tr>
                    </div>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
