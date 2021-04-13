<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="ListPermohonan.aspx.vb" Inherits="Utility_ListPermohonan" Title="List Permohonan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="permohonanXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.Permohonan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="permohonanDetailXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.PermohonanDetail"
        Criteria="[PermohonanID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" sessionField="PermohonanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="jenisIzinXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.JenisIzin">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="jenisPermohonanIzinXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisPermohonanIzin">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="izinJenisXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.PermohonanDetail"
        Criteria="[PermohonanDetailID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" sessionField="PermohonanDetailID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="PDXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.PermohonanDetail">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="serachPermohonanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.PermohonanDetail"
        Criteria="[PermohonanDetailID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" sessionField="DetailID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="PeringatanPopupControl" runat="server" Modal="True" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" ClientInstanceName="PeringatanPopup">
        <ContentCollection>
            <dxpc:PopupControlContentControl runat="Server">
                wew
                <dxe:ASPxButton ID="PeringatanButton" runat="Server" Text="OK">
                    <ClientSideEvents Click="function(s,e){
                        PeringatanPopup.HideWindow();
                    }" />
                </dxe:ASPxButton>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <h3>
        Cari Nomor Permohonan
    </h3>
    <table cellspacing="0" cellpadding="0">
        <tr>
            <td>
                Nama Jenis Izin
            </td>
            <td colspan="2">
                <dxe:ASPxComboBox ID="ComboJenisIzin" runat="Server" DataSourceID="jenisIzinXpoDataSource"
                    TextField="JenisIzinNama" Width="170px" ClientInstanceName="cbJenisIzin" ValueType="System.String"
                    ValueField="JenisIzinID">
                    <ClientSideEvents SelectedIndexChanged="function(s,e){
                        IzinNamaDetail.PerformCallback(cbJenisIzin.GetValue());
                }" />
                </dxe:ASPxComboBox>
            </td>
        </tr>
    </table>
    <dxwgv:ASPxGridView ID="GridPermohonan" runat="Server" DataSourceID="serachPermohonanXpoDataSource"
        Width="50%" KeyFieldName="PermohonanDetailID" AutoGenerateColumns="False" ClientInstanceName="IzinNamaDetail">
        <Columns>
            <dxwgv:GridViewDataTextColumn Caption="Nomor Permohonan" FieldName="PermohonanID.NomorPermohonan"
                VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Jenis Izin" FieldName="JenisIzinID.JenisIzinNama"
                VisibleIndex="1">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
    </dxwgv:ASPxGridView>
    <h1>
        List Permohonan</h1>
    <dxwgv:ASPxGridView ID="permohonanASPxGridView" runat="server" DataSourceID="permohonanXpoDataSource"
        KeyFieldName="PermohonanID" AutoGenerateColumns="False" Width="100%">
        <Columns>
            <dxwgv:GridViewDataTextColumn Caption="Nomor Permohonan" FieldName="NomorPermohonan"
                VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataDateColumn Caption="Tanggal Permohonan" FieldName="TanggalPermohonan"
                VisibleIndex="1">
            </dxwgv:GridViewDataDateColumn>
            <dxwgv:GridViewDataTextColumn Caption="Nama Pemohon" FieldName="PemohonNama" VisibleIndex="2">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Alamat" FieldName="PemohonAlamat" VisibleIndex="3">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <Templates>
            <DetailRow>
                <dxwgv:ASPxGridView ID="permohonanDetailASPxGridView" runat="server" DataSourceID="permohonanDetailXpoDataSource"
                    KeyFieldName="PermohonanDetailID" AutoGenerateColumns="False" Width="100px">
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <Columns>
                        <dxwgv:GridViewDataComboBoxColumn Caption="Jenis Izin" FieldName="JenisIzinID!Key"
                            VisibleIndex="0">
                            <PropertiesComboBox DataSourceID="jenisIzinXpoDataSource" TextField="JenisIzinNama"
                                ValueField="JenisIzinID" ValueType="System.String">
                            </PropertiesComboBox>
                        </dxwgv:GridViewDataComboBoxColumn>
                        <dxwgv:GridViewDataComboBoxColumn Caption="Jenis Permohonan" FieldName="JenisPermohonanIzinID!Key"
                            VisibleIndex="1">
                            <PropertiesComboBox DataSourceID="jenisPermohonanIzinXpoDataSource" TextField="MasterDataJenisPermohonanID.MasterDataJenisPermohonanNama"
                                ValueField="jenisPermohonanIzinID" ValueType="System.String">
                            </PropertiesComboBox>
                        </dxwgv:GridViewDataComboBoxColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="PermohonanIzinID" Visible="False" VisibleIndex="1">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="PermohonanID!Key" Visible="False" VisibleIndex="1">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                </dxwgv:ASPxGridView>
            </DetailRow>
        </Templates>
        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />
        <SettingsPager PageSize="20">
        </SettingsPager>
    </dxwgv:ASPxGridView>
</asp:Content>
