<%@ Page Language="VB" MasterPageFile="~/MasterReportPage.master" AutoEventWireup="false" CodeFile="KeputusanReport.aspx.vb" Inherits="KeputusanReportLokasi" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<crystalReport:CrystalReportSource ID="KeputusanLokasiReportSource" runat="server">
    <Report FileName="D:\Visual Studio 2005\Projects\UPT\OSS\wwwroot\report\source\Lokasi\KeputusanReport.rpt">
    </Report>
    </crystalReport:CrystalReportSource>
    
    <div class="LokasireportViewer" style="background-color:#f4f4f4; width:1%; overflow:visible;">
        <crystalReport:CrystalReportViewer ID="KeputusanReportLokasiViewer" runat="server" ReportSourceID="KeputusanLokasiReportSource"
            AutoDataBind="true" DisplayGroupTree="False" EnableDrillDown="False" HasCrystalLogo="False"
            HasDrillUpButton="False" HasToggleGroupTreeButton="False" Width="350px" BackColor="gainsboro"
            HasRefreshButton="True" ReuseParameterValuesOnRefresh="True" HasViewList="False"
            EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" Height="50px" />
    </div>
</asp:Content>

