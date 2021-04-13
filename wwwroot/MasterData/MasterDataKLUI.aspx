<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="MasterDataKLUI.aspx.vb" Inherits="MasterData_MasterDataKLUI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="JenisIndustriXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisUsahaKLUI">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="JenisIndustriListXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisUsahaKLUI">
    </dx:XpoDataSource>
    <dxm:ASPxMenu ID="JenisUsahaKLUIASPxMenu" runat="server">
        <Items>
            <dxm:MenuItem Name="New" Text="Buat Baru">
            </dxm:MenuItem>
            <dxm:MenuItem Name="Edit" Text="Ubah">
            </dxm:MenuItem>
            <dxm:MenuItem Name="Delete" Text="Hapus">
            </dxm:MenuItem>
        </Items>
        <ClientSideEvents ItemClick="function(s, e){
                    if(e.item.name=='New'){
                        JenisUsahaKLUIGridView.AddNewRow();
                    }
                    else{
                        if(e.item.name=='Edit'){
                        JenisUsahaKLUIGridView.StartEditRow(JenisUsahaKLUIGridView.GetFocusedRowIndex());
                        }
                        else
                        {
                            if(e.item.name=='Delete')
                            {
                                PopupJenisUsahaKLUI.ShowWindow();
                            }
                        }
                    }
              
              }" />
    </dxm:ASPxMenu>
    <dxwgv:ASPxGridView ID="JenisUsahaKLUIASPxGridView" runat="server" ClientInstanceName="JenisUsahaKLUIGridView"
        AutoGenerateColumns="False" DataSourceID="JenisIndustriXpoDatasource" KeyFieldName="JenisUsahaID"
        Width="100%">
        <Columns>
            <dxwgv:GridViewDataTextColumn FieldName="JenisUsahaID" ReadOnly="True" Visible="False"
                VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Grup" FieldName="JenisUsahaParentID!Key"
                VisibleIndex="0" GroupIndex="0">
                <PropertiesComboBox DataSourceID="JenisIndustriListXpoDatasource" TextField="JenisUsahaNama"
                    ValueField="JenisUsahaID" ValueType="System.String">
                </PropertiesComboBox>
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataTextColumn Caption="Nomor KLUI" FieldName="NomorKLUI" VisibleIndex="1">
                <PropertiesTextEdit Width="170px">
                    <ValidationSettings>
                        <RequiredField IsRequired="true" ErrorText="Tidak Boleh Kosong!!!" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Jenis Usaha KLUI" FieldName="JenisUsahaNama"
                VisibleIndex="2">
                <PropertiesTextEdit Width="170px">
                    <ValidationSettings>
                        <RequiredField IsRequired="true" ErrorText="Tidak Boleh Kosong!!!" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormModal="true"
            PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter" />
        <SettingsBehavior AllowFocusedRow="true" AutoExpandAllGroups="true" />
        <SettingsPager PageSize="20">
        </SettingsPager>
    </dxwgv:ASPxGridView>
</asp:Content>
