<%@ Page Language="VB" MasterPageFile="~/MasterReportPage.master" AutoEventWireup="false"
    CodeFile="TandaBuktiBayarUlang.aspx.vb" Inherits="TBPUlangHO"
    Title="Tanda Bukti Pembayaran Ulang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <crystalReport:CrystalReportSource ID="TandaBuktiPembayaranUlangHOReportSource" runat="server">
        <Report FileName="D:\Visual Studio 2005\Projects\OSS\wwwroot\report\source\HO\TandaBuktiPembayaranUlang.rpt">
        </Report>
    </crystalReport:CrystalReportSource>
    <div class="HOreportViewer" style="background-color: #f4f4f4; width: 1%; overflow: visible;">
        <crystalReport:CrystalReportViewer ID="TandaBuktiPembayaranReportUlangHOViewer" runat="server"
            ReportSourceID="TandaBuktiPembayaranHOReportSource" AutoDataBind="true" DisplayGroupTree="False"
            EnableDrillDown="False" HasCrystalLogo="False" HasDrillUpButton="False" HasToggleGroupTreeButton="False"
            Width="350px" BackColor="gainsboro" HasRefreshButton="True" ReuseParameterValuesOnRefresh="True"
            HasViewList="False" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False"
            Height="50px" />
    </div>
</asp:Content>
