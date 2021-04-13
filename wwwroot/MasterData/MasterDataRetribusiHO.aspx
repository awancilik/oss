<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="MasterDataRetribusiHO.aspx.vb" Inherits="MasterData_MasterDataRetribusiHO"
    Title="Master Data Retribusi HO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="RetribusiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.HOTarifLingkungan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IndeksLokasiXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.HOIndeksLokasi">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IndeksGangguanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.HOIndeksGangguan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="UsahaIndustriXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.HOUsahaIndustri">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="PerdaganganTokoXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.HOUsahaPerdaganganToko">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="PergudanganPasarXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.HOUsahaPergudanganPasar">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="SifatSosialXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.HOUsahaBersifatSosial">
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="ASPxPopupControlHapus" HeaderText="Konfirmasi" runat="server"
        PopupHorizontalAlign="windowCenter" ClientInstanceName="PopupHapus" PopupVerticalAlign="windowCenter"
        Modal="true">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupHapus" runat="Server">
                <center>
                    Apakah Anda Ingin Menghapus Data Retribusi?
                    <br />
                    <dxm:ASPxMenu ID="MenuHapus" runat="Server">
                        <Items>
                            <dxm:MenuItem Text="Ya" Name="ya">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Tidak" Name="tidak">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s,e){
                    if(e.item.name=='ya')
                        {
                          GridViewMasterRetribusi.DeleteRow(GridViewMasterRetribusi.GetFocusedRowIndex());
                          PopupHapus.HideWindow();
                        }
                        else
                           {
                            if(e.item.name=='tidak')
                                {
                                  PopupHapus.HideWindow();
                                }
                               }
                        }" />
                    </dxm:ASPxMenu>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="ASPxPopupControlKonfirmLokasi" runat="Server" ClientInstanceName="PopupHapusIndeksLokasi"
        PopupHorizontalAlign="windowCenter" PopupVerticalAlign="windowCenter" Modal="true"
        HeaderText="Konfirmasi">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="ContentPopup" runat="Server">
                <center>
                    Apakah Anda Yakin Ingin Menghapus Data Indeks Lokasi?
                    <dxm:ASPxMenu ID="MenuHapusIndeksLokasi" runat="server">
                        <Items>
                            <dxm:MenuItem Text="Ya" Name="ya">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Tidak" Name="tidak">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s,e){
                        if(e.item.name=='ya')
                            {
                              GridIndeksLokasi.DeleteRow(GridIndeksLokasi.GetFocusedRowIndex());
                              PopupHapusIndeksLokasi.HideWindow();
                            }
                            else
                                {
                                  if(e.item.name=='tidak')
                                    {
                                      PopupHapusIndeksLokasi.HideWindow();
                                    }
                                   }
                        }" />
                    </dxm:ASPxMenu>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="ASPxPopupControlKonfirmasiGangguan" ClientInstanceName="PopupHapusGangguan"
        runat="server" Modal="true" PopupHorizontalAlign="windowCenter" PopupVerticalAlign="windowCenter">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupIndeksGangguan" runat="server">
                <center>
                    Apakah Anda Ingin Mengahapus Data Indeks Gangguan?
                    <dxm:ASPxMenu ID="ASPxMenuHapusIndeksGangguan" runat="server">
                        <Items>
                            <dxm:MenuItem Text="Ya" Name="Ya">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Tidak" Name="Tidak">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s,e)
                    {
                        if(e.item.name=='Ya')
                            {
                               GridIndeksGangguan.DeleteRow(GridIndeksGangguan.GetFocusedRowIndex());
                               PopupHapusGangguan.HideWindow();
                            }
                            else
                                if(e.item.name=='Tidak')
                                    {
                                      PopupHapusGangguan.HideWindow();
                                    }
                    }" />
                    </dxm:ASPxMenu>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxm:ASPxMenu ID="ASPxMenuPilih" runat="Server">
        <Items>
            <dxm:MenuItem Name="TL" Text="Tarif Lingkungan">
            </dxm:MenuItem>
            <dxm:MenuItem Name="IndeksLokasi" Text="Indeks Lokasi">
            </dxm:MenuItem>
            <dxm:MenuItem Name="IndeksGangguan" Text="Indeks Gangguan">
            </dxm:MenuItem>
        </Items>
    </dxm:ASPxMenu>
    <%-- Master Data Jenis Lingkungan --%>
    
    <dxm:ASPxMenu ID="ASPxMenuTL" runat="Server">
        <Items>
            <dxm:MenuItem Text="Buat Baru" Name="New"></dxm:MenuItem>
            <dxm:MenuItem Text="Ubah" Name="Edit"></dxm:MenuItem>
            <dxm:MenuItem Text="Hapus" Name="Delete"></dxm:MenuItem>
        </Items>
        <ClientSideEvents ItemClick="function(s,e){
        if(e.item.name=='New')
            {
              GridViewTL.AddNewRow();
            }
        else
            {
             if(e.item.name=='Edit')
                {
                  GridViewTL.StartEditRow(GridViewTL.GetFocusedRowIndex());
                }
               else
                    {
                      if(e.item.name=='Delete')
                        {
                            GridViewTL.DeleteRow(GridViewTL.GetFocusedRowIndex());
                        }
                    }
                }
            }" />
    </dxm:ASPxMenu>
    <dxwgv:ASPxGridView ID="GridTL" runat="server" ClientInstanceName="GridViewTL" DataSourceID="RetribusiXpoDataSource" KeyFieldName="HOTarifLingkunganID" AutoGenerateColumns="False">
        <Columns>
            <dxwgv:GridViewDataTextColumn Caption="Kondisi Lingkungan" FieldName="KondisiLingkungan">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="true" />
    </dxwgv:ASPxGridView>
    <%-- End Master --%>
    
    <%--Panel Tarif Lingkungan--%>
    <dxp:ASPxPanel ID="PanelTarifLingkungan" ClientInstanceName="TLPanel" runat="server"
        ClientVisible="True" Visible="false">
        <PanelCollection>
            <dxp:PanelContent runat="server">
                <dxm:ASPxMenu ID="ASPxMenuMasterRetribusi" runat="server" Width="100px">
                    <Items>
                        <dxm:MenuItem Text="Buat Baru" Name="Baru">
                        </dxm:MenuItem>
                        <dxm:MenuItem Text="Ubah" Name="Ubah">
                        </dxm:MenuItem>
                        <dxm:MenuItem Text="Hapus" Name="Hapus">
                        </dxm:MenuItem>
                    </Items>
                    <ClientSideEvents ItemClick="function(s,e){
        if(e.item.name=='Baru')
            {
               GridViewUsahaIndustri.AddNewRow();
            }
            else
                {
                  if(e.item.name=='Ubah')
                     {
                        GridViewUsahaIndustri.StartEditRow(GridViewUsahaIndustri.GetFocusedRowIndex());
                     }
                     else
                        {
                          if(e.item.name=='Hapus')
                            {
                                GridViewUsahaIndustri.DeleteRow(GridViewUsahaIndustri.GetFocusedRowIndex());
                            }
                          }
                        }   
                     }" />
                </dxm:ASPxMenu>
                <dxwgv:ASPxGridView ID="ASPxGridViewUsahaIndustri" Caption="Untuk Usaha Industri"
                    AutoGenerateColumns="False" DataSourceID="UsahaIndustriXpoDataSource" ClientInstanceName="GridViewUsahaIndustri"
                    runat="server" KeyFieldName="HOUsahaIndustriID" Width="180px">
                    <Columns>
                        <dxwgv:GridViewDataTextColumn Caption="Jenis Lingkungan" FieldName="JenisLingkungan"
                            VisibleIndex="1">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Tarif" FieldName="Tarif" VisibleIndex="2">
                            <PropertiesTextEdit DisplayFormatString="c2">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsEditing EditFormColumnCount="1" PopupEditFormShowHeader="False" Mode="PopupEditForm"
                        PopupEditFormWidth="600px" PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter"
                        PopupEditFormModal="True" />
                    <SettingsBehavior AllowFocusedRow="True" />
                </dxwgv:ASPxGridView>
                <dxm:ASPxMenu ID="ASPxMenu2" runat="server" Width="100px">
                    <Items>
                        <dxm:MenuItem Text="Buat Baru" Name="Baru">
                        </dxm:MenuItem>
                        <dxm:MenuItem Text="Ubah" Name="Ubah">
                        </dxm:MenuItem>
                        <dxm:MenuItem Text="Hapus" Name="Hapus">
                        </dxm:MenuItem>
                    </Items>
                    <ClientSideEvents ItemClick="function(s,e){
        if(e.item.name=='Baru')
            {
               GridViewDagangToko.AddNewRow();
            }
            else
                {
                  if(e.item.name=='Ubah')
                     {
                        GridViewDagangToko.StartEditRow(GridViewDagangToko.GetFocusedRowIndex());
                     }
                     else
                        {
                          if(e.item.name=='Hapus')
                            {
                                GridViewDagangToko.DeleteRow(GridViewDagangToko.GetFocusedRowIndex());
                            }
                          }
                        }   
                     }" />
                </dxm:ASPxMenu>
                <dxwgv:ASPxGridView ID="ASPxGridViewPerdaganganToko" Caption="Untuk Usaha Perdagangan/Pertokoan"
                    runat="server" AutoGenerateColumns="False" DataSourceID="PerdaganganTokoXpoDataSource"
                    ClientInstanceName="GridViewDagangToko" KeyFieldName="HOUsahaPerdaganganTokoID">
                    <Columns>
                        <dxwgv:GridViewDataTextColumn Caption="Jenis Lingkungan" FieldName="JenisLingkungan"
                            VisibleIndex="1">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Tarif" FieldName="Tarif" VisibleIndex="2">
                            <PropertiesTextEdit DisplayFormatString="c2">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsEditing EditFormColumnCount="1" PopupEditFormShowHeader="False" Mode="PopupEditForm"
                        PopupEditFormWidth="600px" PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter"
                        PopupEditFormModal="True" />
                    <SettingsBehavior AllowFocusedRow="True" />
                </dxwgv:ASPxGridView>
                <dxm:ASPxMenu ID="ASPxMenu1" runat="server" Width="100px">
                    <Items>
                        <dxm:MenuItem Text="Buat Baru" Name="Baru">
                        </dxm:MenuItem>
                        <dxm:MenuItem Text="Ubah" Name="Ubah">
                        </dxm:MenuItem>
                        <dxm:MenuItem Text="Hapus" Name="Hapus">
                        </dxm:MenuItem>
                    </Items>
                    <ClientSideEvents ItemClick="function(s,e){
        if(e.item.name=='Baru')
            {
               GridViewGudangPasar.AddNewRow();
            }
            else
                {
                  if(e.item.name=='Ubah')
                     {
                        GridViewGudangPasar.StartEditRow(GridViewGudangPasar.GetFocusedRowIndex());
                     }
                     else
                        {
                          if(e.item.name=='Hapus')
                            {
                                GridViewGudangPasar.DeleteRow(GridViewGudangPasar.GetFocusedRowIndex());
                            }
                          }
                        }   
                     }" />
                </dxm:ASPxMenu>
                <dxwgv:ASPxGridView ID="ASPxGridViewGudangPasar" runat="server" Caption="Untuk Usaha Pergudangan dan Pasar"
                    AutoGenerateColumns="False" DataSourceID="PergudanganPasarXpoDataSource" ClientInstanceName="GridViewGudangPasar"
                    KeyFieldName="HOUsahaPergudanganPasarID">
                    <Columns>
                        <dxwgv:GridViewDataTextColumn Caption="Jenis Lingkungan" FieldName="JenisLingkungan"
                            VisibleIndex="1">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Tarif" FieldName="Tarif" VisibleIndex="2">
                            <PropertiesTextEdit DisplayFormatString="c2">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsEditing EditFormColumnCount="1" PopupEditFormShowHeader="False" Mode="PopupEditForm"
                        PopupEditFormWidth="600px" PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter"
                        PopupEditFormModal="True" />
                    <SettingsBehavior AllowFocusedRow="True" />
                </dxwgv:ASPxGridView>
                <dxm:ASPxMenu ID="ASPxMenu3" runat="server" Width="100px">
                    <Items>
                        <dxm:MenuItem Text="Buat Baru" Name="Baru">
                        </dxm:MenuItem>
                        <dxm:MenuItem Text="Ubah" Name="Ubah">
                        </dxm:MenuItem>
                        <dxm:MenuItem Text="Hapus" Name="Hapus">
                        </dxm:MenuItem>
                    </Items>
                    <ClientSideEvents ItemClick="function(s,e){
        if(e.item.name=='Baru')
            {
               GridViewSifatSosial.AddNewRow();
            }
            else
                {
                  if(e.item.name=='Ubah')
                     {
                        GridViewSifatSosial.StartEditRow(GridViewSifatSosial.GetFocusedRowIndex());
                     }
                     else
                        {
                          if(e.item.name=='Hapus')
                            {
                                GridViewSifatSosial.DeleteRow(GridViewSifatSosial.GetFocusedRowIndex());
                            }
                          }
                        }   
                     }" />
                </dxm:ASPxMenu>
                <dxwgv:ASPxGridView ID="ASPxGridViewSifatSosial" runat="server" Caption="Untuk Usaha Yang Bersifat Sosial"
                    AutoGenerateColumns="False" DataSourceID="SifatSosialXpoDataSource" ClientInstanceName="GridViewSifatSosial"
                    KeyFieldName="HOUsahaBersifatSosialID">
                    <Columns>
                        <dxwgv:GridViewDataTextColumn Caption="Jenis Lingkungan" FieldName="JenisLingkungan"
                            VisibleIndex="1">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Tarif" FieldName="Tarif" VisibleIndex="2">
                            <PropertiesTextEdit DisplayFormatString="c2">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsEditing EditFormColumnCount="1" PopupEditFormShowHeader="False" Mode="PopupEditForm"
                        PopupEditFormWidth="600px" PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter"
                        PopupEditFormModal="True" />
                    <SettingsBehavior AllowFocusedRow="True" />
                </dxwgv:ASPxGridView>
            </dxp:PanelContent>
        </PanelCollection>
    </dxp:ASPxPanel>
    <%--Batas Panel Tarif Lingkungan --%>
    <br />
    
    <%--Panel Indeks Lokasi --%>
    <div style="padding-bottom: 100px; float: left;">
        <dxp:ASPxPanel ID="ASPxPanelIndeksLokasi" ClientInstanceName="IndeksLokasi" Visible="false"
            runat="Server" ClientVisible="True">
            <PanelCollection>
                <dxp:PanelContent runat="server">
                    <dxm:ASPxMenu ID="ASPxMenuIndeksLokasi" runat="server">
                        <Items>
                            <dxm:MenuItem Text="Buat Baru" Name="Baru">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Ubah" Name="Ubah">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Hapus" Name="Hapus">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s,e){
        if(e.item.name=='Baru')
            {
               GridIndeksLokasi.AddNewRow();
            }
            else
                {
                 if(e.item.name=='Ubah')
                    {
                        GridIndeksLokasi.StarEditRow(GridIndeksLokasi.GetFocusedRowIndex());
                    }
                    else
                        {
                           if(e.item.name=='Hapus')
                                {
                                    PopupHapusIndeksLokasi.ShowWindow();
                                }
                               }
                              }
                    }" />
                    </dxm:ASPxMenu>
                    <dxwgv:ASPxGridView ID="ASPxGridViewIndeksLokasi" runat="server" DataSourceID="IndeksLokasiXpoDataSource"
                        ClientInstanceName="GridIndeksLokasi" AutoGenerateColumns="False" KeyFieldName="HOIndeksLokasiID">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Jenis Lokasi" FieldName="JenisLokasi" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Indeks" FieldName="Indeks" VisibleIndex="1">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
                            PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px" PopupEditFormModal="True" />
                        <SettingsBehavior AllowFocusedRow="True" AllowDragDrop="False" />
                    </dxwgv:ASPxGridView>
                </dxp:PanelContent>
            </PanelCollection>
        </dxp:ASPxPanel>
    </div>
    <%--Panel Indeks Lokasi End--%>
    <br />
    
    <%--Indeks Gangguan--%>
    <dxp:ASPxPanel ID="ASPxPaneIndeksGangguan" runat="Server" Visible="false" ClientVisible="True">
        <PanelCollection>
            <dxp:PanelContent runat="server">
                <dxm:ASPxMenu ID="ASPxMenuIndeksGangguan" runat="server">
                    <Items>
                        <dxm:MenuItem Text="Buat Baru" Name="Baru">
                        </dxm:MenuItem>
                        <dxm:MenuItem Text="Ubah" Name="Ubah">
                        </dxm:MenuItem>
                        <dxm:MenuItem Text="Hapus" Name="Hapus">
                        </dxm:MenuItem>
                    </Items>
                    <ClientSideEvents ItemClick="function(s,e){
            if(e.item.name=='Baru')
                {
                 GridIndeksGangguan.AddNewRow();
                }
                else
                    {
                      if(e.item.name=='Ubah')
                        {
                            GridIndeksGangguan.StartEditRow(GridIndeksGangguan.GetFocusedRowIndex());
                        }
                        else
                            {
                              if(e.item.name=='Hapus')
                                {
                                    PopupHapusGangguan.ShowWindow();
                                }
                               }
                           }
                    }" />
                </dxm:ASPxMenu>
                <dxwgv:ASPxGridView ID="ASPxGridViewIndeksGangguan" runat="server" DataSourceID="IndeksGangguanXpoDataSource"
                    ClientInstanceName="GridIndeksGangguan" KeyFieldName="HOIndeksGangguanID" AutoGenerateColumns="False">
                    <Columns>
                        <dxwgv:GridViewDataTextColumn Caption="Jenis Gangguan" FieldName="JenisGangguan"
                            VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Indeks" FieldName="Indeks" VisibleIndex="1">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsEditing Mode="PopupEditForm" PopupEditFormModal="True" PopupEditFormHorizontalAlign="WindowCenter"
                        PopupEditFormVerticalAlign="WindowCenter" PopupEditFormShowHeader="False" EditFormColumnCount="1" />
                    <SettingsBehavior AllowFocusedRow="True" />
                </dxwgv:ASPxGridView>
            </dxp:PanelContent>
        </PanelCollection>
    </dxp:ASPxPanel>
    <%--End Panel Jenis Gangguan--%>
</asp:Content>
