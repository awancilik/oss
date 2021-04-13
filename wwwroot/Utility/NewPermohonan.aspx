<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="NewPermohonan.aspx.vb" Inherits="Utility_NewPermohonan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="permohonanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Permohonan"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <asp:DetailsView ID="permohonanDetailsView" runat="server" DataKeyNames="PermohonanID"
        DataSourceID="permohonanXpoDataSource" AutoGenerateRows="false" CssClass="dataprop"
        GridLines="None" DefaultMode="Insert">
        <Fields>
            <asp:TemplateField HeaderText="Jenis Izin">
                <InsertItemTemplate>
                    <dxe:ASPxCheckBox ID="imbASPxCheckBox" runat="server" Text="Izin Mendirikan Bangunan">
                    </dxe:ASPxCheckBox>
                </InsertItemTemplate>
            </asp:TemplateField>
        </Fields>
        <FieldHeaderStyle CssClass="headerfield" />
        <RowStyle CssClass="rowfield" />
    </asp:DetailsView>
</asp:Content>
