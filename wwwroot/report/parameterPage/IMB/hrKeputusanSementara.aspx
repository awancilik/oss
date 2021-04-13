<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="hrKeputusanSementara.aspx.vb" Inherits="report_hrKeputusanSementara"
    Title="Untitled Page" %>

<%@ Reference VirtualPath="~/report/reportPage/IMB/KeputusanSementara.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dxpc:ASPxPopupControl ID="WarningPopupControl" ClientInstanceName="WarningPopupControl"
        Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        runat="server">
        <ContentCollection>
            <dxpc:PopupControlContentControl runat="server">
                <center>
                    Maaf, Perijinan belum di terima<br />
                    <dxe:ASPxButton ID="OKButton" runat="server" Text="OK">
                        <ClientSideEvents Click="function(s, e) {WarningPopupControl.HideWindow();}" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <table>
        <tr>
            <td>
                Nomor Permohonan</td>
            <td>
                :</td>
            <td>
                <dxe:ASPxTextBox ID="NoIjinSementaraTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="NoIjinSementaraButton" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>
