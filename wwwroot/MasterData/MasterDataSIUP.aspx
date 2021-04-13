<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="MasterDataSIUP.aspx.vb" Inherits="MasterData_MasterDataSIUP" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="ModalXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.SIUPModal">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="LembagaSIUPXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.SIUPtBentuk">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="JenisPermohonanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisPermohonanIzin"
        Criteria="[JenisIzinID.JenisIzinNama]='SIUP'">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="SIUPJenisXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.SIUPJenis">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="SyaratXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.MasterDataSyarat">
    </dx:XpoDataSource>
    <dxwgv:ASPxGridView ID="ModalASPxGridView" runat="server" ClientInstanceName="ModalGridView"
        DataSourceID="ModalXpoDataSource" KeyFieldName="SIUPModalID" AutoGenerateColumns="False"
        Width="400px">
        <Columns>
            <dxwgv:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn FieldName="SIUPModalID" ReadOnly="True" Visible="False"
                VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="JenisModal" VisibleIndex="1" Width="200px">
                <PropertiesTextEdit Width="200px">
                </PropertiesTextEdit>
                <EditFormSettings Visible="False" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Modal" VisibleIndex="2" Width="200px">
                <PropertiesTextEdit Width="200px" DisplayFormatString="c0">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
            PopupEditFormVerticalAlign="WindowCenter" />
    </dxwgv:ASPxGridView>
    <br />
    <br />
    <br />
    <br />
    <dxwgv:ASPxGridView ID="SIUPJenisASPxGridView" runat="server" AutoGenerateColumns="False"
        DataSourceID="" KeyFieldName="SIUPJenisID" ClientInstanceName="SIUPJenisGridView"
        Width="100%">
        <Columns>
            <dxwgv:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
                <DeleteButton Visible="True">
                </DeleteButton>
                <HeaderTemplate>
                    <dxe:ASPxButton ID="NewASPxButton" runat="server" Text="New" Width="100%" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e) {
	SIUPJenisGridView.AddNewRow();
}" />
                    </dxe:ASPxButton>
                </HeaderTemplate>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn FieldName="SIUPJenisID" ReadOnly="True" Visible="False"
                VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="JenisPermohonan!Key" VisibleIndex="1"
                Caption="Jenis Permohonan" Width="170px" GroupIndex="0">
                <PropertiesComboBox DataSourceID="JenisPermohonanXpoDataSource" TextField="MasterDataJenisPermohonanID.MasterDataJenisPermohonanNama"
                    ValueField="JenisPermohonanIzinID" ValueType="System.String" Width="200px">
                </PropertiesComboBox>
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="Bentuk!Key" VisibleIndex="2" Caption="Bentuk"
                Width="170px" GroupIndex="1">
                <PropertiesComboBox DataSourceID="LembagaSIUPXpoDataSource" TextField="BentukPerusahaan"
                    ValueField="BentukPerusahaanID" ValueType="System.String" Width="200px">
                </PropertiesComboBox>
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="SyaratID!Key" VisibleIndex="3" Caption="Syarat"
                Width="100%">
                <PropertiesComboBox DataSourceID="SyaratXpoDataSource" TextField="MasterDataSyaratNama"
                    ValueField="MasterDataSyaratID" ValueType="System.String" Width="200px">
                </PropertiesComboBox>
            </dxwgv:GridViewDataComboBoxColumn>
        </Columns>
        <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
            PopupEditFormVerticalAlign="WindowCenter" />
    </dxwgv:ASPxGridView>
</asp:Content>
<%--<dxwgv:GridViewDataTextColumn FieldName="JenisPermohonanIzinID!Key" VisibleIndex="2">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="MasterDataSyaratID!Key" VisibleIndex="3">
            </dxwgv:GridViewDataTextColumn>--%>
