<%@ Page Language="VB" MasterPageFile="~/MasterReportPage.master" AutoEventWireup="false"
    CodeFile="rpPetikanSementara.aspx.vb" Inherits="rpPetikanSementara" Title="Report Petikan Sementara" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <crystalReport:CrystalReportSource ID="PetikanSementara" runat="server">
        <Report FileName="D:\Visual Studio 2005\Projects\OSS\wwwroot\report\IMB\PetikanSementara.rpt">
        </Report>
    </crystalReport:CrystalReportSource>
    <div class="ReportViewer" style="background-color: #f4f4f4; width: 1%; overflow: visible;">
        <crystalReport:CrystalReportViewer ID="PetikanSementaraViewer" runat="server"
            ReportSourceID="PetikanSementara" AutoDataBind="true" DisplayGroupTree="False"
            EnableDrillDown="False" HasCrystalLogo="False" HasDrillUpButton="False" HasToggleGroupTreeButton="False"
            Width="350px" BackColor="gainsboro" HasRefreshButton="True" ReuseParameterValuesOnRefresh="True"
            HasViewList="False" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False"
            Height="50px" />
    </div>
</asp:Content>
