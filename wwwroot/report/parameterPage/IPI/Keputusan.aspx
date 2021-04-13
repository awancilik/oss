<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="Keputusan.aspx.vb" Inherits="report_parameterPage_IPI_Keputusan" Title="Untitled Page" %>
<%@ Reference VirtualPath="~/report/reportPage/IPI/KeputusanIzin.aspx"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table>
        <tr>
            <td>
                Masukan nomor permohonan</td>
            <td>
                :</td>
            <td>
                <dxe:ASPxTextBox ID="NoPermohonanASPxTextbox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="CariASPxButton" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>
