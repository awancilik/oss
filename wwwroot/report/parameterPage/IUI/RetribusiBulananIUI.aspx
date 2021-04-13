<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="RetribusiBulananIUI.aspx.vb" Inherits="report_parameterPage_IUI_RetribusiBulananIUI" %>
<%@ Reference VirtualPath="~/report/reportPage/IUI/RetribusiBulananIUI.aspx"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<table>
        <tr>
            <td>
                Daftar Berdasarkan Tanggal :
            </td>
            <td>
                <dxe:ASPxDateEdit ID="TglAwalDateEdit" runat="server" DisplayFormatString="dd MMMM yyyy">
                </dxe:ASPxDateEdit>
            </td>
            <td>
                Sampai :
            </td>
            <td>
                <dxe:ASPxDateEdit ID="TglAhkirDateEdit" runat="server" DisplayFormatString="dd MMMM yyyy">
                </dxe:ASPxDateEdit>
            </td>
            <td>
                <dxe:ASPxButton ID="CariTanggal" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>

