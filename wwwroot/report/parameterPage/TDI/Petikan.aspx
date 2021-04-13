<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="Petikan.aspx.vb" Inherits="report_parameterPage_TDI_Petikan" Title="Untitled Page" %>

<%@ Reference VirtualPath="~/report/reportPage/TDI/Petikan.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dxe:ASPxLabel ID="CetakKeputusanASPxLabel" runat="server" Text="Cetak Petikan"
        Font-Size="X-Large">
    </dxe:ASPxLabel>
    <table>
        <tr>
            <td>
                Masukan nomor permohonan
            </td>
            <td>
                :</td>
            <td>
                <dxe:ASPxTextBox ID="noPermohonanASPxTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="CariASPxButton" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>
