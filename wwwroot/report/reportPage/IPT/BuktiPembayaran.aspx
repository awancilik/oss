<%@ Page Language="VB" MasterPageFile="~/MasterReportPage.master" AutoEventWireup="false" CodeFile="BuktiPembayaran.aspx.vb" Inherits="report_reportPage_IPT_BuktiPembayaran" title="Bukti Pembayaran IPT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<crystalReport:CrystalReportSource ID="TandaBuktiPembayaranIPTReportSource" runat="server">
        <Report FileName="D:\Visual Studio 2005\Projects\OSS\wwwroot\report\source\IPT\TandaBuktiPembayaran.rpt">
        </Report>
    </crystalReport:CrystalReportSource>
    <div class="IPTreportViewer" style="background-color: #f4f4f4; width: 1%; overflow: visible;">
        <crystalReport:CrystalReportViewer ID="TandaBuktiPembayaranReportIPTViewer" runat="server"
            ReportSourceID="TandaBuktiPembayaranIPTReportSource" AutoDataBind="true" DisplayGroupTree="False"
            EnableDrillDown="False" HasCrystalLogo="False" HasDrillUpButton="False" HasToggleGroupTreeButton="False"
            Width="350px" BackColor="gainsboro" HasRefreshButton="True" ReuseParameterValuesOnRefresh="True"
            HasViewList="False" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False"
            Height="50px" />
    </div>
</asp:Content>

