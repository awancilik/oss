<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="RetribusiBulananLokasi.aspx.vb" Inherits="report_parameterPage_Lokasi_RetribusiBulananLokasi" %>
<%@ Reference VirtualPath="~/report/reportPage/Lokasi/RetribusiBulananLokasi.aspx"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table>
        <tr>
            <td>
                Daftar Berdasarkan Tanggal :
            </td>
            <td>
                <dxe:ASPxDateEdit ID="TglAwalDateEdit" runat="server" DisplayFormatString="dd MMMM yyyy">
                </dxe:ASPxDateEdit>
            </td>
            <td>
                Sampai :
            </td>
            <td>
                <dxe:ASPxDateEdit ID="TglAhkirDateEdit" runat="server" DisplayFormatString="dd MMMM yyyy">
                </dxe:ASPxDateEdit>
            </td>
            <td>
                <dxe:ASPxButton ID="CariTanggal" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>
