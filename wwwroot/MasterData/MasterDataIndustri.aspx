<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="MasterDataIndustri.aspx.vb" Inherits="MasterData_MasterDataIndustri"
    Title="Data Industri" %>

<asp:Content ID="Content" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="StatusBangunanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.StatusBangunan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="StatusPabrikXpoDatasource" runat="server" TypeName="Bisnisobjek.OSS.StatusPabrik">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="JenisIndustriXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisUsahaKLUI">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="JenisIndustriListXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisUsahaKLUI">
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="PopupStatusPabrik" runat="Server" Modal="true" ClientInstanceName="PopupStatusPabrik"
        HeaderText="Konfirmasi" PopupHorizontalAlign="windowCenter" PopupVerticalAlign="WindowCenter"
        Width="100%">
        <ContentCollection>
            <dxpc:PopupControlContentControl runat="Server">
                Apakah Anda Yakin Akan Menghapus Status Pabrik?
                <br />
                <br />
                <center>
                    <dxm:ASPxMenu ID="ASPxMenuStatusPabrik" runat="Server" HorizontalAlign="Center">
                        <Items>
                            <dxm:MenuItem Name="Ya" Text="Ya">
                            </dxm:MenuItem>
                            <dxm:MenuItem Name="Tidak" Text="Tidak">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s,e){
                   if(e.item.name=='Ya')
                   {
                     StatusPabrikGridView.DeleteRow(StatusPabrikGridView.GetFocusedRowIndex());
                     PopupStatusPabrik.HideWindow();
                   }
                   else
                        {
                           if(e.item.name=='Tidak')
                             {
                                PopupStatusPabrik.HideWindow();
                             }
                          }
                   }" />
                    </dxm:ASPxMenu>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="ASPxPopupControl1" runat="Server" Modal="true" ClientInstanceName="PopupStatusBangunan"
        HeaderText="Konfirmasi" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        Width="100%">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="Server">
                Apakah Anda Yakin Akan Menghapus Status Bangunan?
                <br />
                <br />
                <center>
                    <dxm:ASPxMenu ID="ASPxMenu2" runat="Server" HorizontalAlign="Center">
                        <Items>
                            <dxm:MenuItem Name="Ya" Text="Ya">
                            </dxm:MenuItem>
                            <dxm:MenuItem Name="Tidak" Text="Tidak">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s,e){
                   if(e.item.name=='Ya')
                   {
                     StatusBangunanGridView.DeleteRow(StatusBangunanGridView.GetFocusedRowIndex());
                     PopupStatusBangunan.HideWindow();
                   }
                   else
                        {
                           if(e.item.name=='Tidak')
                             {
                                PopupStatusBangunan.HideWindow();
                             }
                          }
                   }" />
                    </dxm:ASPxMenu>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="ASPxPopupControl2" runat="Server" Modal="true" ClientInstanceName="PopupJenisUsahaKLUI"
        HeaderText="Konfirmasi" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        Width="100%">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="Server">
                Apakah Anda Yakin Akan Menghapus Jenis UsahaKLUI?
                <br />
                <br />
                <center>
                    <dxm:ASPxMenu ID="ASPxMenu3" runat="Server" HorizontalAlign="Center">
                        <Items>
                            <dxm:MenuItem Name="Ya" Text="Ya">
                            </dxm:MenuItem>
                            <dxm:MenuItem Name="Tidak" Text="Tidak">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s,e){
                   if(e.item.name=='Ya')
                   {
                     JenisUsahaKLUIGridView.DeleteRow(JenisUsahaKLUIGridView.GetFocusedRowIndex());
                     PopupJenisUsahaKLUI.HideWindow();
                   }
                   else
                        {
                           if(e.item.name=='Tidak')
                             {
                                PopupJenisUsahaKLUI.HideWindow();
                             }
                          }
                   }" />
                    </dxm:ASPxMenu>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxm:ASPxMenu ID="ASPxMenu1" runat="server">
        <Items>
            <dxm:MenuItem Name="StatusPabrik" Text="Status Pabrik">
            </dxm:MenuItem>
            <dxm:MenuItem Name="StatusBangunan" Text="Status Bangunan">
            </dxm:MenuItem>
            <%--<dxm:MenuItem Name="JenisIndustri" Text="Jenis Usaha KLUI">
            </dxm:MenuItem>--%>
        </Items>
    </dxm:ASPxMenu>
    <dxp:ASPxPanel ID="PabrikASPxPanel" runat="server" ClientInstanceName="PabrikASPxPanel"
        Width="200px">
        <PanelCollection>
            <dxp:PanelContent runat="server">
                <dxm:ASPxMenu ID="PabrikASPxMenu" runat="server" Width="170px">
                    <Items>
                        <dxm:MenuItem Name="New" Text="Buat Baru">
                        </dxm:MenuItem>
                        <dxm:MenuItem Name="Edit" Text="Ubah">
                        </dxm:MenuItem>
                        <dxm:MenuItem Name="Delete" Text="Hapus">
                        </dxm:MenuItem>
                    </Items>
                    <ClientSideEvents ItemClick="function(s, e){
                    if(e.item.name=='New')
                    {
                        StatusPabrikGridView.AddNewRow();
                    }
                    else
                    {
                        if(e.item.name=='Edit')
                        {
                            StatusPabrikGridView.StartEditRow(StatusPabrikGridView.GetFocusedRowIndex());
                        }
                        else
                        {
                            if(e.item.name=='Delete')
                            {
                                PopupStatusPabrik.ShowWindow();
                            }
                        }
                    }
              
              }" />
                </dxm:ASPxMenu>
                <dxwgv:ASPxGridView ID="StatusPabrikASPxGridView" runat="server" ClientInstanceName="StatusPabrikGridView"
                    AutoGenerateColumns="False" DataSourceID="StatusPabrikXpoDatasource" KeyFieldName="StatusPabrikID"
                    Width="200px">
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="StatusPabrikID" ReadOnly="True" Visible="False"
                            VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Status" Caption="Status Pabrik" VisibleIndex="0">
                            <PropertiesTextEdit Width="170px">
                                <ValidationSettings>
                                    <RequiredField IsRequired="true" ErrorText="Tidak Boleh Kosong!!" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="true" />
                </dxwgv:ASPxGridView>
            </dxp:PanelContent>
        </PanelCollection>
    </dxp:ASPxPanel>
    <dxp:ASPxPanel ID="BangunanASPxPanel" runat="server" ClientInstanceName="BangunanASPxPanel"
        Width="200px">
        <PanelCollection>
            <dxp:PanelContent ID="PanelContent1" runat="server">
                <dxm:ASPxMenu ID="BangunanASPxMenu" runat="server">
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
                        StatusBangunanGridView.AddNewRow();
                    }
                    else{
                        if(e.item.name=='Edit'){
                        StatusBangunanGridView.StartEditRow(StatusBangunanGridView.GetFocusedRowIndex());
                        }
                        else{
                            if(e.item.name=='Delete')
                            {
                                PopupStatusBangunan.ShowWindow();
                            }
                        }
                    }
              
              }" />
                </dxm:ASPxMenu>
                <dxwgv:ASPxGridView ID="StatusBangunanASPxGridView" runat="server" ClientInstanceName="StatusBangunanGridView"
                    AutoGenerateColumns="False" DataSourceID="StatusBangunanXpoDatasource" KeyFieldName="StatusBangunanID"
                    Width="200px">
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="StatusBangunanID" ReadOnly="True" Visible="False"
                            VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="StatusBangunan" Caption="Status Bangunan"
                            VisibleIndex="0">
                            <PropertiesTextEdit Width="170px">
                                <ValidationSettings>
                                    <RequiredField IsRequired="True" ErrorText="Tidak Boleh Kosong!!!" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="true" />
                </dxwgv:ASPxGridView>
            </dxp:PanelContent>
        </PanelCollection>
    </dxp:ASPxPanel>
    <%--<dxp:ASPxPanel ID="JenisUsahaKLUIASPxPanel" runat="server" ClientInstanceName="JenisIndustriASPxPanel"
        Width="200px">
        <PanelCollection>
            <dxp:PanelContent ID="PanelContent2" runat="server">
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
                    Width="200px">
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="JenisUsahaID" ReadOnly="True" Visible="False"
                            VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataComboBoxColumn Caption="Grup" FieldName="JenisUsahaParentID" 
                            VisibleIndex="0">
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
                    <SettingsEditing EditFormColumnCount="1" Mode="EditForm" PopupEditFormModal="true"
                        PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter" />
                    <SettingsBehavior AllowFocusedRow="true" />
                </dxwgv:ASPxGridView>
            </dxp:PanelContent>
        </PanelCollection>
    </dxp:ASPxPanel>--%>
</asp:Content>
