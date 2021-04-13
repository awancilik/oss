<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="TandaBuktiPembayaran.aspx.vb" Inherits="report_parameterPage_SIUP_TandaBuktiPembayaran"
    Title="Untitled Page" %>
<%@ Reference VirtualPath="~/report/reportPage/SIUP/TandaBuktiPembayaran.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="JenisXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisIzin"
        Criteria="[JenisIzinNama] <> 'SIUP'">
    </dx:XpoDataSource>
    <table>
        <tr>
            <td>
                Nama Izin
            </td>
            <td>
                :</td>
            <td>
                <dxe:ASPxComboBox ID="JenisIzinASPxComboBox" runat="server" DataSourceID="JenisXpoDataSource"
                    ValueField="JenisIzinID" TextField="JenisIzinNama">
                </dxe:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                Masukan Nomor Permohonan</td>
            <td>
                :</td>
            <td>
                <dxe:ASPxTextBox ID="NoPermohonanTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td>
                <dxe:ASPxButton ID="CariASPxButton" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>
