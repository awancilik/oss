<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="PetikanIUI.aspx.vb" Inherits="report_parameterPage_IUI_PetikanIUI" %>
<%@ Reference VirtualPath="~/report/reportPage/IUI/PetikanIUI.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<table>
        <tr>
            <td>
                <strong>&nbsp;Masukkan No. Permohonan :</strong>
            </td>
        </tr>
        <tr>
            <td>
                <dxe:ASPxTextBox ID="PetikSementaraTxtBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
                <dxe:ASPxButton ID="PetikSementaraButton" Text="Cari" runat="Server">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>

