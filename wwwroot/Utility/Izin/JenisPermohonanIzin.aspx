<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="JenisPermohonanIzin.aspx.vb" Inherits="Utility_Izin_JenisPermohonanIzin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="jenisPermohonanIzinXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisPermohonanIzin">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="jenisIzinXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisIzin">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="masterDataJenisPermohonanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.MasterDataJenisPermohonan">
    </dx:XpoDataSource>
    <dxwgv:ASPxGridView ID="jenisPermohonanIzinASPxGridView" runat="server" DataSourceID="jenisPermohonanIzinXpoDataSource"
        KeyFieldName="JenisPermohonanIzinID" AutoGenerateColumns="False" Width="100%">
        <Columns>
            <dxwgv:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
                <NewButton Visible="True">
                </NewButton>
                <DeleteButton Visible="True">
                </DeleteButton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Jenis Izin" FieldName="JenisIzinID!Key"
                VisibleIndex="1" GroupIndex="0" SortOrder="Ascending" SortIndex="1">
                <PropertiesComboBox DataSourceID="jenisIzinXpoDataSource" TextField="JenisIzinNama"
                    ValueField="JenisIzinID" ValueType="System.String">
                </PropertiesComboBox>
                <Settings SortMode="DisplayText" AllowSort="True" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Jenis Permohonan" FieldName="MasterDataJenisPermohonanID!Key"
                VisibleIndex="2">
                <PropertiesComboBox DataSourceID="masterDataJenisPermohonanXpoDataSource" TextField="MasterDataJenisPermohonanNama" ValueField="MasterDataJenisPermohonanID" ValueType="System.String">
                </PropertiesComboBox>
            </dxwgv:GridViewDataComboBoxColumn>
        </Columns>
        <SettingsBehavior AutoExpandAllGroups="true" />
    </dxwgv:ASPxGridView>
</asp:Content>
