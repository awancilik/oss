﻿<%@ Page Language="VB" MasterPageFile="~/MasterReportPage.master" AutoEventWireup="false" CodeFile="JmlIUI.aspx.vb" Inherits="JmlIUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<crystalReport:CrystalReportSource ID="iuiJmlIzinReportSource" runat="server">
        <Report FileName="D:\Visual Studio 2005\Projects\OSS\wwwroot\report\source\Lokasi\LokasiJmlIzin.rpt">
        </Report>
    </crystalReport:CrystalReportSource>
    <div class="reportViewer" style="background-color: #f4f4f4; width: 1%; overflow: visible;">
        <crystalReport:CrystalReportViewer ID="iuiJmlIzinReportViewer" runat="server" ReportSourceID="iuiJmlIzinReportSource"
            AutoDataBind="true" DisplayGroupTree="False" EnableDrillDown="False" HasCrystalLogo="False"
            HasDrillUpButton="False" HasToggleGroupTreeButton="False" Width="350px" BackColor="gainsboro"
            HasRefreshButton="True" ReuseParameterValuesOnRefresh="True" HasViewList="False"
            EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" Height="50px" />
    </div>
</asp:Content>

