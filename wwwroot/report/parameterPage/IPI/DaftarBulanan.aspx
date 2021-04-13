<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="DaftarBulanan.aspx.vb" Inherits="report_parameterPage_IPI_DaftarBulanan"
    Title="Untitled Page" %>

<%@ Reference VirtualPath="~/report/reportPage/IPI/JmlIzin.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table>
        <tr>
            <td>
                Lihat Laporan bulan
            </td>
            <td>
                <dxe:ASPxDateEdit ID="tanggalASPxDateEdit" runat="server" DisplayFormatString="MMMM yyyy">
                </dxe:ASPxDateEdit>
            </td>
            <%-- <td>
                <dxe:ASPxComboBox ID="bulanASPxComboBox" runat="server" Width="170px">
                    <Items>
                        <dxe:ListEditItem Value="1" Text="Januari" />
                        <dxe:ListEditItem Value="2" Text="Febuari" />
                        <dxe:ListEditItem Value="3" Text="Maret" />
                        <dxe:ListEditItem Value="4" Text="April" />
                        <dxe:ListEditItem Value="5" Text="Mei" />
                        <dxe:ListEditItem Value="6" Text="Juni" />
                        <dxe:ListEditItem Value="7" Text="Juli" />
                        <dxe:ListEditItem Value="8" Text="Agustus" />
                        <dxe:ListEditItem Value="9" Text="September" />
                        <dxe:ListEditItem Value="10" Text="Oktober" />
                        <dxe:ListEditItem Value="11" Text="November" />
                        <dxe:ListEditItem Value="12" Text="Desember" />
                    </Items>
                </dxe:ASPxComboBox>
            </td>
            <td>
                <dxe:ASPxTextBox ID="Tahun" runat="server" Width="50px">
                </dxe:ASPxTextBox>
            </td>--%>
            <td>
                <dxe:ASPxButton ID="CariASPxButton" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>
