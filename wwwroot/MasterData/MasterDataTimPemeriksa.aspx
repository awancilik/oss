<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="MasterDataTimPemeriksa.aspx.vb" Inherits="MasterData_MasterDataTimPemeriksa" Title="Data Tim Pemeriksa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="timPemeriksaXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.TimPemeriksa">
    </dx:XpoDataSource>
    <h1>Data Tim Pemeriksa</h1>
    <dxm:ASPxMenu ID="timPemeriksaanASPxMenu" runat="server">
        <Items>
            <dxm:MenuItem Text="Buat Baru" Name="New">
            </dxm:MenuItem>
            <dxm:MenuItem Text="Ubah" Name="Edit">
            </dxm:MenuItem>
            <dxm:MenuItem Text="Hapus" Name="Delete">
            </dxm:MenuItem>
        </Items>
        <ClientSideEvents ItemClick="function(s, e)
    {
        if (e.item.name=='New')
        {
            timPemeriksaGridView.AddNewRow();
        }
        else
        {
            if (e.item.name=='Edit')
            {
                timPemeriksaGridView.StartEditRow(timPemeriksaGridView.GetFocusedRowIndex());
            }
            else
            {
                if (e.item.name=='Delete')
                {
                    timPemeriksaGridView.DeleteRow(timPemeriksaGridView.GetFocusedRowIndex());
                }
            }
        }
    }" />
    </dxm:ASPxMenu>
    <dxwgv:ASPxGridView ID="timPemeriksaASPxGridView" runat="server" ClientInstanceName="timPemeriksaGridView"
        DataSourceID="timPemeriksaXpoDataSource" KeyFieldName="TimPemeriksaID" AutoGenerateColumns="False"
        Width="100%">
        <Columns>
            <dxwgv:GridViewDataTextColumn Caption="Nama" FieldName="TimPemeriksaNama" VisibleIndex="0">
                <PropertiesTextEdit Width="200px">
                    <ValidationSettings>
                        <RequiredField IsRequired="true" ErrorText="Nama harus di isi" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Instansi" FieldName="TimPemeriksaInstansi"
                VisibleIndex="1">
                <PropertiesTextEdit Width="200px">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="true" />
        <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormModal="true"
            PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter" />
        <SettingsText PopupEditFormCaption="Data Tim Pemeriksa" />
    </dxwgv:ASPxGridView>
</asp:Content>
