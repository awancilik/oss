<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="IPB.aspx.vb" Inherits="report_reportPage_IMB_IPB"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table>
        <tr>
            <td>
                Masukan No Izin :
            </td>
            <td>
            <dxe:ASPxTextBox ID="NoIzinTextBox" runat="server" Width="170px"></dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="CariNoIzin" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>
