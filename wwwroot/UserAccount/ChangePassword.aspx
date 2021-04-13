<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="ChangePassword.aspx.vb" Inherits="UserAccount_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:MultiView ID="MainMultiview" runat="Server" ActiveViewIndex="0">
        <asp:View ID="EditorView" runat="Server">
            <table>
                <tr>
                    <td >
                        <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Old Password</asp:Label>
                    </td>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="CurrentPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" 
                             CssClass="failureNotification" ErrorMessage="Password lama harus diisi." ToolTip="Password lama harus diisi." 
                             ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">New Password</asp:Label>
                    </td>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="NewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" 
                             CssClass="failureNotification" ErrorMessage="Password baru harus diisi." ToolTip="Password baru harus diisi." 
                             ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Confirm Password</asp:Label>
                    </td>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" 
                             CssClass="failureNotification" Display="Dynamic" ErrorMessage="Konfirmasi Password harus diisi."
                             ToolTip="Konfirmasi Password harus diisi." ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                             CssClass="failureNotification" Display="Dynamic" ErrorMessage="Konfirmasi Password harus sama dengan password baru."
                             ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div style="float:left;">
                            <dxe:ASPxButton ID="OKButton" runat="server" Text="OK" Width="75px" CausesValidation="True" />
                        </div>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="Success" runat="server">
            <table style="width: 100%;" cellpadding="-1" cellspacing="5" border="0">
                <tr align="center">
                    <td>
                        <asp:Label ID="ConfirmSuccessLabel" runat="server" Text="Kata sandi anda telah di perbaharui"
                         Font-Size="Large" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>

