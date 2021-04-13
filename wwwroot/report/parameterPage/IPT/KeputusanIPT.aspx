<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="KeputusanIPT.aspx.vb" Inherits="report_parameterPage_IPT_KeputusanIPT" title="Keputusan IPT" %>
<%@ Reference VirtualPath="~/report/reportPage/IPT/KeputusanIPT.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<table>
        <tr>
            <td>
                <b>Masukkan Nomor Permohonan : </b>
                <br />
                <dxe:ASPxTextBox ID="NoPermohonanTextBox" runat="Server" Width="170px">
                </dxe:ASPxTextBox>
                <br />
                <dxe:ASPxButton ID="NoPermohonanButton" runat="server" Text="Cari" Height="23px" Width="62px">
                </dxe:ASPxButton>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

