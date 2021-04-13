<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="hrPemeriksaan.aspx.vb" Inherits="report_hrPemeriksaan" Title="Untitled Page" %>
<%@ Reference VirtualPath="~/report/reportPage/IMB/Pemeriksaan.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="PemeriksaXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.TimPemeriksa">
    </dx:XpoDataSource>
    <table>
        <tr>
            <td>
                Nama Pemeriksa
            </td>
            <td>
                :</td>
            <td>
                <dxe:ASPxComboBox ID="PemeriksaComboBox" runat="server" DataSourceID="PemeriksaXpoDataSource"
                    TextField="TimPemeriksaNama" ValueField="TimPemeriksaID" ValueType="System.String">
                </dxe:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                Tanggal Pemeriksaan
            </td>
            <td>
                :</td>
            <td>
                <dxe:ASPxDateEdit ID="TanggalDateEdit" runat="server" DisplayFormatString="dd MMMM yyyy">
                </dxe:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
            <td align="right">
                <dxe:ASPxButton ID="CariButton" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>
