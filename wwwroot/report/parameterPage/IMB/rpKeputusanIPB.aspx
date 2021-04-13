<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="rpKeputusanIPB.aspx.vb" Inherits="report_KeputusanIPB" title="Keputusan IPB" %>
<%@ Reference VirtualPath="~/report/reportPage/IMB/KeputusanIPB.aspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table>
        <tr>
            <td>
                <strong>&nbsp;Masukkan Nomor Permohonan : </strong>
            </td>
        </tr>
        <tr>
            <td>
                <dxe:ASPxTextBox ID="NoIPBTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
                <dxe:ASPxButton ID="NoIPBButton" Text="Cari" runat="server" Width="62px" Height="23px">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>

