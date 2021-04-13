<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="PetikanLokasi.aspx.vb" Inherits="report_parameterPage_Lokasi_PetikanLokasi" %>
<%@ Reference VirtualPath="~/report/reportPage/Lokasi/PetikanLokasi.aspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
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

