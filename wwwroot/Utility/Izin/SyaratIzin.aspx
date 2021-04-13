<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="SyaratIzin.aspx.vb" Inherits="Utility_Izin_SyaratIzin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="syaratIzinXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.SyaratIzin">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="masterDataSifatXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.MasterDataSifat">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="jenisPermohonanIzinXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisPermohonanIzin"
        Criteria="[JenisIzinID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="JenisIzinID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="jenisPermohonanIzinXpoDataSource2" runat="server" TypeName="Bisnisobjek.OSS.JenisPermohonanIzin">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="jenisIzinXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisIzin">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="masterDataSyaratXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.MasterDataSyarat">
    </dx:XpoDataSource>
    <table>
        <tr>
            <td>
                Jenis Izin :
            </td>
            <td>
                <dxe:ASPxComboBox ID="jenisIzinASPxComboBox" runat="server" ClientInstanceName="jenisIzinComboBox"
                    DataSourceID="jenisIzinXpoDataSource" TextField="JenisIzinNama" ValueField="JenisIzinID"
                    ValueType="System.String">
                </dxe:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                Jenis Permohonan Izin :
            </td>
            <td>
                <dxe:ASPxComboBox ID="jenisPermohonanIzinASPxComboBox" runat="server" ClientInstanceName="jenisPermohonanIzinComboBox"
                    DataSourceID="jenisPermohonanIzinXpoDataSource2" TextField="MasterDataJenisPermohonanID.MasterDataJenisPermohonanNama"
                    ValueField="JenisPermohonanIzinID" ValueType="System.String">
                    <Columns>
                        <dxe:ListBoxColumn Caption="Jenis Izin" FieldName="JenisIzinID.JenisIzinNama" />
                        <dxe:ListBoxColumn Caption="Jenis Permohonan" FieldName="MasterDataJenisPermohonanID.MasterDataJenisPermohonanNama" />
                    </Columns>
                </dxe:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                Syarat Izin :
            </td>
            <td>
                <dxe:ASPxComboBox ID="masterDataSyaratASPxComboBox" runat="server" ClientInstanceName="masterDataSyaratComboBox"
                    DataSourceID="masterDataSyaratXpoDataSource" TextField="MasterDataSyaratNama"
                    ValueField="MasterDataSyaratID" ValueType="System.String">
                </dxe:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <dxe:ASPxButton ID="insertASPxButton" runat="server" Text="Tambah Syarat">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
    <dxwgv:ASPxGridView ID="syaratIzinASPxGridView" runat="server" DataSourceID="syaratIzinXpoDataSource"
        KeyFieldName="SyaratIzinID" AutoGenerateColumns="False" Width="100%">
        <Columns>
            <dxwgv:GridViewCommandColumn VisibleIndex="0">
                <DeleteButton Visible="True">
                </DeleteButton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Jenis Izin" FieldName="JenisIzinID!Key"
                VisibleIndex="1" GroupIndex="0">
                <PropertiesComboBox DataSourceID="jenisIzinXpoDataSource" TextField="JenisIzinNama"
                    ValueField="JenisIzinID" ValueType="System.String">
                </PropertiesComboBox>
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Jenis Permohonan" FieldName="JenisPermohonanIzinID!Key"
                VisibleIndex="2" GroupIndex="1">
                <PropertiesComboBox DataSourceID="jenisPermohonanIzinXpoDataSource2" TextField="MasterDataJenisPermohonanID.MasterDataJenisPermohonanNama"
                    ValueField="JenisPermohonanIzinID" ValueType="System.String">
                </PropertiesComboBox>
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Syarat Izin" FieldName="MasterDataSyaratID!Key"
                VisibleIndex="3">
                <PropertiesComboBox DataSourceID="masterDataSyaratXpoDataSource" TextField="MasterDataSyaratNama"
                    ValueField="MasterDataSyaratID" ValueType="System.String">
                </PropertiesComboBox>
            </dxwgv:GridViewDataComboBoxColumn>
        </Columns>
        <SettingsBehavior/>
    </dxwgv:ASPxGridView>
</asp:Content>
