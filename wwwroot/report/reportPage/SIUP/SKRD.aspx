<%@ Page Language="VB" MasterPageFile="~/MasterReportPage.master" AutoEventWireup="false"
    CodeFile="SKRD.aspx.vb" Inherits="SIUPSKRD1" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <crystalReport:CrystalReportSource ID="SKRDSIUPReportSource" runat="server">
        <Report FileName="D:\Visual Studio 2005\Projects\OSS\wwwroot\report\source\SIUP\SKRD.rpt">
        </Report>
    </crystalReport:CrystalReportSource>
    <div class="SIUPreportViewer" style="background-color: #f4f4f4; width: 1%; overflow: visible;">
        <crystalReport:CrystalReportViewer ID="SKRDReportSIUPViewer" runat="server" ReportSourceID="SKRDSIUPReportSource"
            AutoDataBind="true" DisplayGroupTree="False" EnableDrillDown="False" HasCrystalLogo="False"
            HasDrillUpButton="False" HasToggleGroupTreeButton="False" Width="350px" BackColor="gainsboro"
            HasRefreshButton="True" ReuseParameterValuesOnRefresh="True" HasViewList="False"
            EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" Height="50px" />
    </div>
</asp:Content>
