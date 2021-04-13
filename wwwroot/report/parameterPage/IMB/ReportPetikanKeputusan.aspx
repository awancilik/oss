<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="ReportPetikanKeputusan.aspx.vb" Inherits="report_ReportPetikanKeputusan"
    Title="OSS" %>

<%@ Reference VirtualPath="~/report/reportPage/IMB/PetikanReport.aspx" %>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dxpc:ASPxPopupControl ID="WarningPopupControl" ClientInstanceName="WarningPopupControl"
        Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        runat="server">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
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
            <td style="padding-left: 229px;">
            <br />
                <strong>Masukan &nbsp;Nomor Permohonan :<br /></strong>
                <br />
                <dxe:ASPxTextBox ID="NoIjinTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
                <br />
                <dxe:ASPxButton ID="CariNoIjinButton" runat="server" Text="Cari" Height="23px" Width="62px">
                </dxe:ASPxButton>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" Runat="Server">
</asp:Content>

--%>
