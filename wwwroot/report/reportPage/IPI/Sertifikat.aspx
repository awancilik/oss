<%@ Page Language="VB" MasterPageFile="~/MasterReportPage.master" AutoEventWireup="false"
    CodeFile="Sertifikat.aspx.vb" Inherits="IPISertifikat" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <crystalReport:CrystalReportSource ID="sertifikatIPIReportSource" runat="server">
        <Report FileName="D:\Visual Studio 2005\Projects\UPT\OSS\wwwroot\report\source\IPI\PiagamIzin.rpt">
        </Report>
    </crystalReport:CrystalReportSource>
    <div class="IPIreportViewer" style="background-color: #f4f4f4; width: 1%; overflow: visible;">
        <crystalReport:CrystalReportViewer ID="sertifikatIPIReportViewer" runat="server"
            ReportSourceID="sertifikatIPIReportSource" AutoDataBind="true" DisplayGroupTree="False"
            EnableDrillDown="False" HasCrystalLogo="False" HasDrillUpButton="False" HasToggleGroupTreeButton="False"
            Width="350px" BackColor="gainsboro" HasRefreshButton="True" ReuseParameterValuesOnRefresh="True"
            HasViewList="False" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False"
            Height="50px" />
    </div>
</asp:Content>
