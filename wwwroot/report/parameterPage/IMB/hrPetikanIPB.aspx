<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="hrPetikanIPB.aspx.vb" Inherits="report_hrPetikanIPB" Title="Untitled Page" %>
<%@ Reference VirtualPath="~/report/reportPage/IMB/PetikanIPB.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table>
        <tr>
            <td>
                Nomor Permohonan</td>
            <td>
                :</td>
            <td>
                <dxe:ASPxTextBox ID="NoIPBtextBox" runat="server" width="170px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="NoIPBButton" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>
