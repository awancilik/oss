<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="PetikanSementara.aspx.vb" Inherits="rp_PetikanSementara" Title="Petikan Sementara" %>
    
<%@ Reference VirtualPath="~/report/reportPage/IMB/rpPetikanSementara.aspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <table>
        <tr>
            <td>
                <strong>&nbsp;Masukkan No. Permohonan :</strong>
            </td>
        </tr>
        <tr>
            <td>
                <dxe:ASPxTextBox ID="PetikSementaraTxtBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
                <dxe:ASPxButton ID="PetikSementaraButton" Text="Cari" runat="Server">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>
