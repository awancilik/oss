<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="Permohonan Perijinan.aspx.vb" Inherits="report_Permohonan_Perijinan" %>
<%@ Reference VirtualPath="~/report/reportPage/IMB/Permohonan.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table>
        <tr>
            <td>
                No Permohonan :
            </td>
            <td>
                <dxe:ASPxTextBox ID="NoPermohonanTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="NoPermohonanButton" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>
