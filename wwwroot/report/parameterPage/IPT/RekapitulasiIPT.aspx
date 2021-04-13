<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="RekapitulasiIPT.aspx.vb" Inherits="report_parameterPage_IPT_RekapitulasiIPT" title="Untitled Page" %>
<%@ Reference VirtualPath="~/report/reportPage/IPT/RekapitulasiIPT.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<table>
        <tr>
            <td>
                <b>Berdasarkan: </b>
                <br />
                <dxe:ASPxDateEdit  ID="DateEditASPxDateEdit" runat="Server" Width="170px">
                </dxe:ASPxDateEdit>
                <br />
                <dxe:ASPxButton ID="NoPermohonanButton" runat="server" Text="Cari" Height="23px" Width="62px">
                </dxe:ASPxButton>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

