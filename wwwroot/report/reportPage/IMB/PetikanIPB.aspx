<%@ Page Language="VB" MasterPageFile="~/MasterReportPage.master" AutoEventWireup="false"
    CodeFile="PetikanIPB.aspx.vb" Inherits="rPetikanIPB" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
  <crystalReport:CrystalReportSource ID="PetikanIPB" runat="server">
        <Report FileName="D:\Visual Studio 2005\Projects\OSS\wwwroot\report\source\IMB\PetikanIPB.rpt">
        </Report>
    </crystalReport:CrystalReportSource>
    <div class="reportViewer" style="background-color: #f4f4f4; width: 1%; overflow: visible;">
    
        <crystalReport:CrystalReportViewer ID="petIPBReportViewer" runat="server"  ReportSourceID="PetikanIPB"
            AutoDataBind="true" DisplayGroupTree="False" EnableDrillDown="False" HasCrystalLogo="False"
            HasDrillUpButton="False" HasToggleGroupTreeButton="False" Width="350px" BackColor="gainsboro"
            HasRefreshButton="True" ReuseParameterValuesOnRefresh="True" HasViewList="False"
            EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" Height="50px" />
    </div>

</asp:Content>
