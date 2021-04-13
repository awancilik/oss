<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="DataHO.aspx.vb" Inherits="Utility_HO" Title="HO Data Izin" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="XpoDataSourceHO" runat="server" TypeName="Bisnisobjek.OSS.HO"
        Criteria="[HOID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="HOID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="XpoDataSourceKabupaten" runat="server" TypeName="Bisnisobjek.OSS.Kabupaten">
    </dx:XpoDataSource>
    <%--<dx:XpoDataSource ID="XpoDataSourceKecamatan" runat="Server" TypeName="Bisnisobjek.OSS.Kecamatan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="XpoDataSourceKelurahan" runat="server" TypeName="Bisnisobjek.OSS.Kelurahan">
    </dx:XpoDataSource>--%>
    <dx:XpoDataSource ID="XpoDataSourcePropinsi" runat="server" TypeName="Bisnisobjek.OSS.Propinsi">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="XpoDataSourceJenisUsaha" runat="Server" TypeName="Bisnisobjek.OSS.HOJenisUsaha">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="XpoDataSourceHOAlat" runat="server" TypeName="Bisnisobjek.OSS.HoAlat"
        Criteria="[HOID]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="new" sessionfield="HOID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="XpoDataSourceEnergi" runat="Server" TypeName="Bisnisobjek.OSS.HOEnergi">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="XpoDataSourceIL" runat="Server" TypeName="Bisnisobjek.OSS.HOIndeksLokasi">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="XpoDataSourceIG" runat="Server" TypeName="Bisnisobjek.OSS.HOIndeksGangguan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="XpoDataSourceJenisTarifLingkungan" runat="Server" TypeName="Bisnisobjek.OSS.HOTaripLingkungan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="XpoDataSourceJenisLingkungan" runat="Server" TypeName="Bisnisobjek.OSS.HOJenisLingkungan"
        Criteria="[HOTaripJenisID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="HOTaripLingkunganID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KelurahanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kelurahan"
        Criteria="[KelurahanKecamatanID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="new" sessionfield="KecamatanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KecamatanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kecamatan">
    </dx:XpoDataSource>
    <dxe:ASPxComboBox ID="ComboBox" runat="Server" Visible="false">
    </dxe:ASPxComboBox>
    <dxcb:ASPxCallback ID="CallbackTarif" runat="Server" ClientInstanceName="TarifCallback">
    </dxcb:ASPxCallback>
    <dxcb:ASPxCallback ID="CallbackJenis" runat="Server" ClientInstanceName="JenisCallback"
        OnCallback="CallbackJenis_Callback">
    </dxcb:ASPxCallback>
    <dxcb:ASPxCallback ID="KelurahanASPxCallback" runat="Server" ClientInstanceName="KeluarahanCallback">
    </dxcb:ASPxCallback>
    <%-- <dxcb:ASPxCallback ID="CallbackLokasi" runat="Server" ClientInstanceName="CallbackLokasi"
        OnCallback="CallbackLokasi_Callback">
    </dxcb:ASPxCallback>--%>
    <dxcb:ASPxCallback ID="CallbackIndeks" runat="Server" ClientInstanceName="JenisIndeksCallback">
    </dxcb:ASPxCallback>
    <dxcb:ASPxCallback ID="CallbackGangguan" runat="Server" ClientInstanceName="CallbackGangguan">
    </dxcb:ASPxCallback>
    <dxcb:ASPxCallback ID="CallbackSewa" runat="Server" ClientInstanceName="CallbackSewa">
    </dxcb:ASPxCallback>
    <dxpc:ASPxPopupControl ID="PopupControlPeringatan" runat="server" ClientInstanceName="PopupPeringatan"
        Modal="true" HeaderText="Peringatan" PopupHorizontalAlign="windowCenter" PopupVerticalAlign="windowCenter">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupPeringatan" runat="Server">
                <center>
                    Maaf, Nomor Permohonan Anda Tidak Terdaftar di Izin HO
                    <dxe:ASPxButton ID="PopupButton" runat="Server" Text="OK" AutoPostBack="false">
                        <ClientSideEvents Click="function(s,e){
                     PopupPeringatan.HideWindow();
                    }" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="ASPxPopupControlHapus" runat="server" ClientInstanceName="PopupPeringatanHapus"
        Modal="true" HeaderText="Peringatan" PopupHorizontalAlign="windowCenter" PopupVerticalAlign="windowCenter">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="Server">
                <center>
                    Apakah Anda Yakin Mengahapus Dafar Alat?<br />
                    <br />
                    <dxe:ASPxButton ID="ASPxButton1" runat="Server" Text="OK" AutoPostBack="false">
                        <ClientSideEvents Click="function(s,e){
                     GridViewAlat.DeleteRow(GridViewAlat.GetFocusedRowIndex());
                     PopupPeringatanHapus.HideWindow();
                    }" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="ASPxPopupControlSimpan" runat="server" ClientInstanceName="PopupPeringatanSimpan"
        Modal="true" HeaderText="Peringatan" PopupHorizontalAlign="windowCenter" PopupVerticalAlign="windowCenter">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="Server">
                <center>
                    Data Berhasil Disimpan!<br />
                    <br />
                    <dxe:ASPxButton ID="ASPxButton2" runat="Server" Text="OK" AutoPostBack="false">
                        <ClientSideEvents Click="function(s,e){
                     PopupPeringatanSimpan.HideWindow();
                    }" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <table>
        <tr>
            <td>
                Masukkan Nomor Permohonan :
            </td>
            <td>
                <dxe:ASPxTextBox ID="TxtNomorPermohonan" runat="Server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="ButtonNomorPermohonan" runat="Server" Text="Tampil">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
    <asp:DetailsView ID="DataHODetailView" runat="Server" AutoGenerateRows="false" DataSourceID="XpoDataSourceHO"
        CssClass="dataprop" GridLines="None" DataKeyNames="HOID" Visible="false">
        <RowStyle CssClass="rowfield" />
        <FieldHeaderStyle CssClass="headerfield" />
        <Fields>
            <asp:TemplateField HeaderText="Data Pemilik">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Input">
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="DateEditHO" runat="Server" DisplayFormatString="dd MMMM yyyy"
                        Date='<%#Bind("TglInput") %>'>
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanah Milik">
                <EditItemTemplate>
                    <div style="float: left; margin-left: 0px;">
                        <dxe:ASPxComboBox ID="cbPerjanjianSewa" runat="Server" ClientInstanceName="cbSewa">
                            <Items>
                                <dxe:ListEditItem Text="Sendiri" Value="1" Selected="true" />
                                <dxe:ListEditItem Text="Sewa < 5 Tahun" Value="2" />
                                <dxe:ListEditItem Text="Sewa > 5 Tahun" Value="3" />
                                <dxe:ListEditItem Text="HGB" Value="4" />
                                <dxe:ListEditItem Text="Penggunaan Tanah" Value="5" />
                            </Items>
                            <%--<ClientSideEvents SelectedIndexChanged="function(s,e){
                                CallbackSewa.PerformCallback(cbSewa.GetValue());
                            }" />--%>
                        </dxe:ASPxComboBox>
                    </div>
                    <%--<div style="float: left; margin-left: 5px;">
                        <ajax:UpdatePanel ID="SewaUpdatePanel" runat="Server">
                            <ContentTemplate>
                                <dxe:ASPxTextBox ID="TahunSewaTextBox" runat="Server" ClientInstanceName="SewaTxtBox"
                                    Width="170px" NullText="Sewa Selama (Tahun)" Text='<%#Bind("LamaSewa") %>'>
                                </dxe:ASPxTextBox>
                            </ContentTemplate>
                            <Triggers>
                                <ajax:AsyncPostBackTrigger ControlID="cbPerjanjianSewa" EventName="SelectedIndexChanged" />
                            </Triggers>
                        </ajax:UpdatePanel>
                    </div>--%>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Berlaku Hingga">
                <EditItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxDateEdit ID="MasaBerlakuDateEdit" runat="Server" DisplayFormatString="dd MMMM yyyy"
                            Date='<%#Bind("BerlakuSampai") %>'>
                        </dxe:ASPxDateEdit>
                    </div>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nama">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="NamaPemilikLabel" Width="170px" runat="Server" Text='<%#Eval("NamaPemilik") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NamaPemilikTextBox" Width="170px" runat="Server" Text='<%#Bind("NamaPemilik")%>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alamat">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="AlamatPemilikLabel" Width="170px" runat="Server" Text='<%#Eval("AlamatPemilik") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxMemo ID="AlamatPemilikMemo" Width="200px" Height="100px" runat="server"
                        Text='<%#Bind("AlamatPemilik") %>'>
                    </dxe:ASPxMemo>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kecamatan : ">
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="pemilikKecamatanASPxComboBox" runat="server" DropDownStyle="DropDownList"
                        EnableIncrementalFiltering="true" ClientInstanceName="pemilikKecamatanComboBox"
                        DataSourceID="KecamatanXpoDataSource" TextField="KecamatanNama" ValueField="KecamatanID"
                        ValueType="System.String" EnableSynchronization="False" Visible="true">
                        <ClientSideEvents SelectedIndexChanged="function(s, e)
                        {
                            pemilikKelurahanComboBox.PerformCallback(pemilikKecamatanComboBox.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kelurahan : ">
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="KelurahanPemilikComboBox" ClientInstanceName="pemilikKelurahanComboBox"
                        DataSourceID="KelurahanXpoDataSource" ValueField="KelurahanID" TextField="KelurahanNama"
                        runat="server" ValueType="System.String" Visible="true" OnCallback="KelurahanASPxCallback_Callback">
                        <ClientSideEvents LostFocus="function(s, e)
                        {
                            KeluarahanCallback.PerformCallback(pemilikKelurahanComboBox.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <%--<asp:TemplateField HeaderText="NPWP">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="NPWDLabel" runat="Server" Width="170px" Text='<%#Bind("NPWD") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NPWDTextBox" runat="Server" Width="170px" Text='<%#Bind("NPWD") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="Nama Perusahaan">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="NamaPerusahaanLabel" Width="170px" runat="Server" Text='<%#Bind("NamaPerusahaan") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NamaPerusahaanTextBox" Width="170px" runat="Server" Text='<%#Bind("NamaPerusahaan") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Lokasi Usaha">
                <EditItemTemplate>
                    <dxe:ASPxMemo ID="LokasiTextBox" runat="Server" Width="200px" Height="100px" Text='<%#Bind("LokasiUsaha") %>'>
                    </dxe:ASPxMemo>
                    Jika Kosong Sama dengan Alamat Pemilik
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jenis Usaha">
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="JenisComboBox" runat="Server" ClientInstanceName="JenisCombo"
                        DataSourceID="XpoDataSourceJenisUsaha" ValueField="JenisUsahaID" TextField="JenisUsaha"
                        ValueType="System.String" EnableCallbackMode="True" OnCallback="CallbackJenis_Callback">
                        <ClientSideEvents SelectedIndexChanged="function(s,e){
                                JenisCallback.PerformCallback(JenisCombo.GetValue());
                        }" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Luas Usaha (M&#178;)">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="ASPxTextBoxLuasUsaha" runat="Server" Width="170px" Text='<%#Bind("LuasUsaha") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bentuk Perusahaan">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="BentukPerusahaanLabel" runat="Server" Width="170px" Text='<%#Bind("BentukPerusahaan") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="BentukPerusahaanTextBox" runat="Server" Width="170px" Text='<%#Bind("BentukPerusahaan") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Batas Utara">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="BatasUtaraLabel" runat="Server" Width="170px" Text='<%#Bind("BatasUtara") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxMemo ID="BatasUtaraMemo" runat="Server" Width="200px" Height="100px" Text='<%#Bind("BatasUtara") %>'>
                    </dxe:ASPxMemo>
                    <%--<dxe:ASPxTextBox ID="BatasUtaraTextBox" runat="Server" Width="170px" Text='<%#Bind("BatasUtara") %>'>
                    </dxe:ASPxTextBox>--%>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Batas Selatan">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="BatasSelatanLabel" runat="Server" Width="170px" Text='<%#Bind("BatasSelatan") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxMemo ID="BatasSelatanMemo" runat="Server" Width="200px" Height="100px" Text='<%#Bind("BatasSelatan") %>'>
                    </dxe:ASPxMemo>
                    <%--<dxe:ASPxTextBox ID="BatasSelatanTextBox" runat="Server" Width="170px" Text='<%#Bind("BatasSelatan") %>'>
                    </dxe:ASPxTextBox>--%>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Batas Barat">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="BatasBaratLabel" runat="Server" Width="170px" Text='<%#Bind("BatasBarat") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxMemo ID="BatasBaratTextBox" runat="Server" Width="200px" Height="100px"
                        Text='<%#Bind("BatasBarat") %>'>
                    </dxe:ASPxMemo>
                    <%--<dxe:ASPxTextBox ID="BatasBaratTextBox" runat="server" Width="170px" Text='<%#Bind("BatasBarat") %>'>
                    </dxe:ASPxTextBox>--%>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Batas Timur">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="BatasTimurLabel" runat="Server" Width="170px" Text='<%#Bind("BatasTimur") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxMemo ID="BatasTimurMemo" runat="Server" Width="200px" Height="100px" Text='<%#Bind("BatasTimur") %>'>
                    </dxe:ASPxMemo>
                    <%--<dxe:ASPxTextBox ID="BatasTimurTextBox" runat="Server" Width="170px" Text='<%#Bind("BatasTimur") %>'>
                    </dxe:ASPxTextBox>--%>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Polusi">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Air">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="AirLabel" runat="Server" Width="170px" Text='<%#Bind("Air") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="AirTextBox" runat="server" Width="170px" Text='<%#Bind("Air") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Udara">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="UdaraLabel" runat="Server" Width="170px" Text='<%#Bind("Udara") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="UdaraTextBox" runat="server" Width="170px" Text='<%#Bind("Udara") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Suara">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="SuaraLabel" runat="Server" Width="170px" Text='<%#Bind("Suara") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="SuaraTextBox" runat="Server" Width="170px" Text='<%#Bind("Suara") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Daftar Alat">
                <EditItemTemplate>
                    <dxm:ASPxMenu ID="MenuAlat" runat="Server" ClientInstanceName="MenuAlat">
                        <Items>
                            <dxm:MenuItem Text="Buat Baru" Name="New">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Ubah" Name="Edit">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Hapus" Name="Delete">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s,e){
                        if(e.item.name=='New')
                           {
                             GridViewAlat.AddNewRow();
                           }
                          else
                              {
                               if(e.item.name=='Edit')
                                  {
                                    GridViewAlat.StartEditRow(GridViewAlat.GetFocusedRowIndex());
                                  }
                                 else
                                    {
                                        if(e.item.name=='Delete')
                                            {
                                                PopupPeringatanHapus.ShowWindow();
                                            }
                                        }
                                    }
                               } " />
                    </dxm:ASPxMenu>
                    <dxwgv:ASPxGridView ID="ASPxGridViewAlat" runat="Server" ClientInstanceName="GridViewAlat"
                        Width="100%" DataSourceID="XpoDataSourceHOAlat" KeyFieldName="AlatID" OnRowInserting="ASPxGridViewAlat_RowInserting">
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormModal="true" PopupEditFormWidth="700px"
                            PopupEditFormHorizontalAlign="windowCenter" PopupEditFormVerticalAlign="windowCenter" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="AlatID" Visible="false" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="HOID!Key" Visible="false" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="NamaAlat" Caption="Nama" Width="180px" VisibleIndex="1">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="JumlahAlat" Caption="Jumlah" Width="180px"
                                VisibleIndex="2">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Satuan" Caption="Satuan" Width="180px" VisibleIndex="6">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="NoAlatAsalBarang" Caption="Nomor Alat Dan Asal Barang"
                                Width="180px" VisibleIndex="3">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="KeteranganAlat" Caption="Keterangan" Width="180px"
                                VisibleIndex="4">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="true" />
                    </dxwgv:ASPxGridView>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="ButtonSimpan" runat="Server" Text="Simpan" ClientInstanceName="SimpanButton"
                            CommandName="Update">
                        </dxe:ASPxButton>
                    </div>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
</asp:Content>
