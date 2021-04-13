<%@ Page Language="VB" MasterPageFile="~/MasterReportPage.master" AutoEventWireup="false" CodeFile="PetikanReport.aspx.vb" Inherits="IMBPetikanReport" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <crystalReport:CrystalReportSource ID="DiscountReportSource" runat="server">
        <Report FileName="D:\Visual Studio 2005\Projects\UPT\OSS\wwwroot\report\source\IMB\petikanKeputusanBupatikudusIMBreport.rpt">
        </Report>
    </crystalReport:CrystalReportSource>
    
    <div class="reportViewer" style="background-color:#f4f4f4; width:1%; overflow:visible;">
        <crystalReport:CrystalReportViewer ID="ReportViewer" runat="server" ReportSourceID="ReportSource"
            AutoDataBind="true" DisplayGroupTree="False" EnableDrillDown="False" HasCrystalLogo="False"
            HasDrillUpButton="False" HasToggleGroupTreeButton="False" Width="350px" BackColor="gainsboro"
            HasRefreshButton="True" ReuseParameterValuesOnRefresh="True" HasViewList="False"
            EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" Height="50px" />
    </div>
</asp:Content>

