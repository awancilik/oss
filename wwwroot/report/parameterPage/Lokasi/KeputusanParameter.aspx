<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="KeputusanParameter.aspx.vb" Inherits="report_LokasiParameter"
    Title="Keputusan Lokasi" %>
<%@ Reference VirtualPath="~/report/reportPage/Lokasi/KeputusanLokasiReport.aspx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
   <%-- <dxpc:ASPxPopupControl ID="PopupWarning" runat="Server" ClientInstanceName="PopupWarning" Modal="true"
     PopupHorizontalAlign="windowCenter" PopupVerticalAlign="windowCenter">
    <ContentCollection>
    <dxpc:PopupControlContentControl ID="PopupControlWarning" runat="Server">
        <center>
            Maaf ,Perijinan Lokasi belum diterima <br />
            <dxe:ASPxButton ID="OKButton" runat="server" Text="OK">
                <ClientSideEvents Click="function(s,e) {PopupWarning.HideWindow();}" />
            </dxe:ASPxButton>
        </center>
    </dxpc:PopupControlContentControl>
    </ContentCollection>
    </dxpc:ASPxPopupControl>
    --%>
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
