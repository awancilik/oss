﻿<%@ Page Language="VB" MasterPageFile="~/MasterReportPage.master" AutoEventWireup="false" CodeFile="KeputusanHO.aspx.vb" Inherits="KeputusanHOReport" title="Report Keputusan HO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<crystalReport:CrystalReportSource ID="KeputusanHOReportSource" runat="server">
        <Report FileName="D:\Visual Studio 2005\Projects\OSS\wwwroot\report\source\HO\KeputusanHO.rpt">
        </Report>
    </crystalReport:CrystalReportSource>
    <div class="reportViewer" style="background-color: #f4f4f4; width: 1%; overflow: visible;">
        <crystalReport:CrystalReportViewer ID="KeputusanHOReportViewer" runat="server" ReportSourceID="KeputusanHOReportSource"
            AutoDataBind="true" DisplayGroupTree="False" EnableDrillDown="False" HasCrystalLogo="False"
            HasDrillUpButton="False" HasToggleGroupTreeButton="False" Width="350px" BackColor="gainsboro"
            HasRefreshButton="True" ReuseParameterValuesOnRefresh="True" HasViewList="False"
            EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" Height="50px" />
    </div>
</asp:Content>

