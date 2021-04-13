<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="JmlIUI.aspx.vb" Inherits="report_parameterPage_IUI_JmlIUI" %>
<%@ Reference VirtualPath="~/report/reportPage/IUI/JmlIUI.aspx"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<table>
        <tr>
            <td>
                Laporan berdasar kan tanggal
            </td>
            <td>
                :</td>
            <td>
                <dxe:ASPxDateEdit ID="AwalCalendar" runat="server" DisplayFormatString="dd MMMM yyyy">
                </dxe:ASPxDateEdit>
            </td>
            <td>
                Sampai
            </td>
            <td>
                :</td>
            <td>
                <dxe:ASPxDateEdit ID="AhkirCalendar" runat="server" DisplayFormatString="dd MMMM yyyy">
                </dxe:ASPxDateEdit>
            </td>
            <td>
              <dxe:ASPxButton  ID="CariButton" Text="Cari" runat="server">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>

