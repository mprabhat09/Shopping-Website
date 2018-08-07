<%@ Page  Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="600PX" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center" colspan="2">
				<table cellpadding="2" cellspacing="0" width="400px" class="mainbox">
					<tr>
						<td align="center" colspan="3" class="bg h2" >
							Product .
						</td>
					</tr>
					<tr>
						<td align="center" colspan="3">
							&nbsp;<asp:GridView ID="grdData" runat="server" CaptionAlign="Top"
								CellPadding="4" Font-Names="Times New Roman" HorizontalAlign="Center" 
								AutoGenerateColumns="true"
								Width="400px" GridLines="None" ForeColor="#333333">
								<AlternatingRowStyle BackColor="White" />
								 
								<EditRowStyle BackColor="#7C6F57" /> 
								<FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
								<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#1C5E55" />
								<PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
								<RowStyle BackColor="#E3EAEB" />
								<SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
								<SortedAscendingCellStyle BackColor="#F8FAFA" />
								<SortedAscendingHeaderStyle BackColor="#246B61" />
								<SortedDescendingCellStyle BackColor="#D4DFE1" />
								<SortedDescendingHeaderStyle BackColor="#15524A" />
							</asp:GridView>
						</td>
					</tr>
					
					
					<tr>

<td align="center" colspan="3" style="height: 28px" >

<asp:Button ID="btnExport" runat ="server" Text ="Export To Excel"

CssClass ="button " onclick="btnExport_Click" />

</td>

</tr>

					<tr>
						<td align="center" colspan="3" class="bg h2" >
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</asp:Content>

