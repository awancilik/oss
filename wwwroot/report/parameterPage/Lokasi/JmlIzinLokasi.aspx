<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="JmlIzinLokasi.aspx.vb" Inherits="report_parameterPage_Lokasi_JmlIzinLokasi" %>

<%@ Reference VirtualPath="~/report/reportPage/Lokasi/JmlIzinLokasi.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table>
        <tr>
            <td>
                Laporan berdasar kan tanggal
            </td>
            <td>
                :</td>
            <td>
                <dxe:ASPxDateEdit ID="AwalCalendar" runat="server" DisplayFormatString="dd MMMM yyyy">
                </dxe:ASPxDateEdit>
            </td>
            <td>
                Sampai
            </td>
            <td>
                :</td>
            <td>
                <dxe:ASPxDateEdit ID="AhkirCalendar" runat="server" DisplayFormatString="dd MMMM yyyy">
                </dxe:ASPxDateEdit>
            </td>
            <td>
                <dxe:ASPxButton ID="CariButton" Text="Cari" runat="server">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>
