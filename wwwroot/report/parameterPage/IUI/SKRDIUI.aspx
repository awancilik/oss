﻿<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="SKRDIUI.aspx.vb" Inherits="report_parameterPage_IUI_SKRDIUI" %>
<%@ Reference VirtualPath="~/report/reportPage/IUI/SKRDIUI.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<table>
        <tr>
            <td>
                Nomor Permohonan</td>
            <td>
                :</td>
            <td>
                <dxe:ASPxTextBox ID="NoPermohonanTextBox" Width="170px" runat="server">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="noPermohonanButton" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>

