<%@ Page  Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true"
    CodeFile="changepassword.aspx.cs" Inherits="Admin_changepassword" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="650px" style="height: 400px" cellpadding="0">
        <tr>
            <td>
                &nbsp;&nbsp;
            </td>
        </tr>
        <tr align="center" valign="middle">
            <td align="center" valign="middle">
                <table border="0" cellspacing="0" cellpadding="2" align="center" class="mainbox">
                    <tr>
                        <td align="center" colspan="2" class="bg h2"  valign="middle">
                            &nbsp;
                        </td> 
                    </tr>
                    <tr>
                        <td align="center" colspan="2" style="height: 293px">
                            <table border="0" cellpadding="1" cellspacing="0">
                                <tr>
                                    <td style="width: 579px">
                                        <table border="0" cellpadding="1" cellspacing="1" class="mainbox">
                                            <tr>
                                                <td align="center" colspan="2" class="bg h2"  bgcolor="White">
                                                    Change Your Password
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="Label1" runat="server" Text="User Name:"></asp:Label>
                                                </td>
                                                <td align="left" style="width: 378px">
                                                    <asp:TextBox ID="txtUserName" CssClass="textbox" runat="server" ReadOnly="True" Width="140px"
                                                        ></asp:TextBox>
                                                    <asp:Label ID="lblName" Visible="false" runat="server" Text="Label" Width="156px"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="style1">
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Label ID="CurrentPasswordLabel" runat="server">Password:</asp:Label>
                                                </td>
                                                <td align="left" class="style2">
                                                    <asp:TextBox ID="txtPassword" CssClass="textbox" runat="server" TextMode="Password"
                                                        ></asp:TextBox><asp:RequiredFieldValidator ID="CurrentPasswordRequired"
                                                            runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required."
                                                            ToolTip="Please enter Password." ValidationGroup="ChangePassword1" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="NewPasswordLabel" runat="server" >New Password:</asp:Label>
                                                </td>
                                                <td align="left" style="width: 378px">
                                                    <asp:TextBox ID="txtNPassword" CssClass="textbox" runat="server" TextMode="Password"
                                                        ></asp:TextBox><asp:RequiredFieldValidator ID="NewPasswordRequired"
                                                            runat="server" ControlToValidate="txtNPassword" ErrorMessage="Please enter New password."
                                                            ToolTip="please enter New password." ValidationGroup="ChangePassword1" SetFocusOnError="True">*</asp:RequiredFieldValidator>&nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    &nbsp;<asp:Label ID="ConfirmNewPasswordLabel" runat="server">Confirm New Password:</asp:Label>
                                                </td>
                                                <td align="left">
                                                    <asp:TextBox ID="txtCNPassword" runat="server" CssClass="textbox" TextMode="Password"
                                                        ></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="txtCNPassword"
                                                        ErrorMessage="Please enter Confirm New Password." ToolTip="Please enter Confirm New Password."
                                                        ValidationGroup="ChangePassword1" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="color: red">
                                                    &nbsp;<asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="txtNPassword"
                                                        ControlToValidate="txtCNPassword" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry."
                                                        ValidationGroup="ChangePassword1" SetFocusOnError="True">*</asp:CompareValidator>
                                                    <asp:Label ID="lblMsg" runat="server" Text="..." Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="center" valign="middle">
                                                    <asp:Button ID="ChangePasswordPushButton" runat="server" Text="Change Password" 
                                                        ValidationGroup="ChangePassword1" OnClick="ChangePasswordPushButton_Click" />
                                                    &nbsp;
                                                    <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" Text="Cancel"
                                                         OnClick="CancelPushButton_Click"  />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                                            ShowSummary="False" ValidationGroup="ChangePassword1" Width="749px" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style1
        {
            height: 29px;
        }
        .style2
        {
            width: 378px;
            height: 29px;
        }
    </style>
</asp:Content>

