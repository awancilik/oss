<%@ Page Language="VB" MasterPageFile="~/MasterReportPage.master" AutoEventWireup="false" CodeFile="PetikanIUI.aspx.vb" Inherits="PetikanIUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<crystalReport:CrystalReportSource ID="petikanIUIReportSource" runat="server">
        <Report FileName="D:\Visual Studio 2005\Projects\UPT\OSS\wwwroot\report\source\Lokasi\PetikanLokasi.rpt">
        </Report>
    </crystalReport:CrystalReportSource>
    <div class="LokasireportViewer" style="background-color: #f4f4f4; width: 1%; overflow: visible;">
        <crystalReport:CrystalReportViewer ID="petikanIUIReportViewer" runat="server"
            ReportSourceID="petikanIUIReportSource" AutoDataBind="true" DisplayGroupTree="False"
            EnableDrillDown="False" HasCrystalLogo="False" HasDrillUpButton="False" HasToggleGroupTreeButton="False"
            Width="350px" BackColor="gainsboro" HasRefreshButton="True" ReuseParameterValuesOnRefresh="True"
            HasViewList="False" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False"
            Height="50px" />
    </div>
</asp:Content>

