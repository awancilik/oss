<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="SIUP.aspx.vb" Inherits="Utility_Izin_SIUP" Title="Data Izin SIUP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="SIUPXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.SIUP"
        Criteria="[SIUPID]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="newparameter" sessionfield="SIUPID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="MaksudXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.SIUPMaksud">
        <%--Criteria="Maksud like 'Memperoleh SIUP%'">--%>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="BentukXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.SIUPtBentuk">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KecamatanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kecamatan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KelurahanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kelurahan"
        Criteria="[KelurahanKecamatanID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="newparameter" sessionfield="KecamatanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IzinXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisIzin">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="SIUPJenisKLUIlXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.SIUPJenisKLUI"
        Criteria="[SIUPID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="newparameter" sessionfield="SIUPID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KLUIXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisUsahaKLUI">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="SIUPBankXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.SIUPbank"
        Criteria="[SIUPID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="newparameter" sessionfield="SIUPID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" Visible="false">
    </dxwgv:ASPxGridView>
    <dxpc:ASPxPopupControl ID="TersimpanASPxPopupControl" runat="server" ClientInstanceName="TersimpanPopupControl"
        Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        HeaderText="Tersimpan">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <center>
                    Data Telah Tersimpan !
                    <br />
                    <dxe:ASPxButton ID="TersimpanASPxButton" runat="server" Text="OK" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e){TersimpanPopupControl.HideWindow();}" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="TidakDitemukanASPxPopupControl" runat="server" ClientInstanceName="TidakDitemukanPopupControl"
        Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        HeaderText="Not Found !">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <center>
                    Data tidak Ditemukan !
                    <br />
                    <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="OK" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e){TidakDitemukanPopupControl.HideWindow();}" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="TambahKLUIASPxPopupControl" runat="server" ClientInstanceName="TambahKLUIPopupControl"
        Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        HeaderText="Tambah">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl3" runat="server">
                <center>
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
                    <dxwgv:ASPxGridView ID="JenisUsahaKLUIASPxGridView2" runat="server" ClientInstanceName="JenisUsahaKLUIGridView"
                        AutoGenerateColumns="False" DataSourceID="KLUIXpoDataSource" KeyFieldName="JenisUsahaID"
                        Width="100%">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="JenisUsahaID" ReadOnly="True" Visible="False"
                                VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Grup" FieldName="JenisUsahaParentID!Key"
                                VisibleIndex="0" GroupIndex="0">
                                <PropertiesComboBox DataSourceID="KLUIXpoDataSource" TextField="JenisUsahaNama"
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
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <%--<table>
        <tr>
            <td>
                Masukan nomor Permohonan
            </td>
            <td>
                :</td>
            <td>
                <dxe:ASPxTextBox ID="NoPermohonanASPxTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="CariASPxTextBox" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>--%>
    <dxcb:ASPxCallback ID="SIUPCallback" runat="server">
    </dxcb:ASPxCallback>
    <dxcb:ASPxCallback ID="KelurahanASPxCallback" runat="server" ClientInstanceName="KelurahanCallback">
    </dxcb:ASPxCallback>
    <dxe:ASPxComboBox ID="ASPxComboBox1" runat="server" Visible="false">
    </dxe:ASPxComboBox>
    <dxcb:ASPxCallback ID="MaksudASPxCallback" runat="server" ClientInstanceName="MaksudCallBack">
    </dxcb:ASPxCallback>
    <center>
        <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="598px" HeaderText="Maksud Permohonan Izin">
            <PanelCollection>
                <dxp:PanelContent runat="server">
                    <ajax:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <center>
                                <dxe:ASPxComboBox ID="MaksudASPxComboBox" runat="server" ClientInstanceName="MaksudComboBox"
                                    DataSourceID="MaksudXpoDataSource" Width="250px" ValueField="SIUPMaksudID" TextField="Maksud"
                                    AutoPostBack="true" OnSelectedIndexChanged="MaksudASPxComboBox_SelectedIndexChanged">
                                </dxe:ASPxComboBox>
                                <dxe:ASPxLabel ID="MaksudASPxLabel" runat="server" Text="( Pilih Ketentuan yang diinginkan )">
                                </dxe:ASPxLabel>
                                <dxe:ASPxTextBox ID="MaksudASPxTextBox" runat="server" Width="170px" Visible="false"
                                    HorizontalAlign="Center">
                                </dxe:ASPxTextBox>
                                <table>
                                    <tr>
                                        <td>
                                            <dxe:ASPxButton ID="LanjutASPxButton" runat="server" Text="OK" AutoPostBack="true"
                                                Enabled="false" OnClick="LanjutASPxButton_Click">
                                            </dxe:ASPxButton>
                                            <dxe:ASPxButton ID="ASPxButton2" runat="server" Text="OK" OnClick="ASPxButton2_Click"
                                                Visible="false">
                                            </dxe:ASPxButton>
                                        </td>
                                        <td>
                                            <dxe:ASPxButton ID="GantiASPxButton" runat="server" Text="Ganti" AutoPostBack="true"
                                                OnClick="GantiASPxButton_Click">
                                            </dxe:ASPxButton>
                                            <dxe:ASPxButton ID="ASPxButton3" runat="server" Text="Ganti" AutoPostBack="true"
                                                OnClick="ASPxButton3_Click" Visible="false">
                                            </dxe:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </center>
                        </ContentTemplate>
                        <Triggers>
                            <ajax:AsyncPostBackTrigger ControlID="LanjutASPxButton" EventName="Click" />
                            <ajax:PostBackTrigger ControlID="ASPxButton2" />
                            <ajax:PostBackTrigger ControlID="ASPxButton3" />
                        </Triggers>
                    </ajax:UpdatePanel>
                </dxp:PanelContent>
            </PanelCollection>
        </dxrp:ASPxRoundPanel>
    </center>
    <br />
    <asp:DetailsView ID="SIUPDetailView" runat="server" DataSourceID="SIUPXpoDataSource"
        DataKeyNames="SIUPID" GridLines="None" CssClass="dataprop" AutoGenerateRows="false"
        Visible="false">
        <RowStyle CssClass="rowfield" />
        <FieldHeaderStyle CssClass="headerfield" />
        <Fields>
            <asp:TemplateField HeaderText="Identitas Perusahaan">
                <ItemStyle CssClass="field" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nama Perusahaan : ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PerusahaanNama" runat="server" Text='<%#Bind("PerusahaanNama") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bentuk Perusahaan : ">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="BentukPerusahaanASPxCombobox" runat="server" DataSourceID="BentukXpoDataSource"
                        ValueField="BentukPerusahaanID" TextField="BentukPerusahaan">
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alamat Perusahaaan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxMemo ID="AlamatPerusahaanASPxTextBox" runat="server" Text='<%#Bind("PerusahaanAlamat") %>'
                        Width="170px">
                    </dxe:ASPxMemo>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kecamatan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="KecamatanPerusahaanASPxCombobox" runat="server" DataSourceID="KecamatanXpoDataSource"
                        ValueField="KecamatanID" TextField="KecamatanNama" ValueType="System.String"
                        ClientInstanceName="KecamatanCombobox">
                        <ClientSideEvents SelectedIndexChanged="function(s, e){KelurahanCombobox.PerformCallback(KecamatanCombobox.GetValue());}" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kelurahan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="KelurahanPerusahaanASPxCombobox" runat="server" DataSourceID="KelurahanXpoDataSource"
                        ValueField="KelurahanID" TextField="KelurahanNama" ValueType="System.String"
                        ClientInstanceName="KelurahanCombobox" OnCallback="KelurahanCombobox_Callback">
                        <ClientSideEvents LostFocus="function(s, e){KelurahanCallback.PerformCallback(KelurahanCombobox.GetValue());}" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Lokasi Perusahaan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxMemo ID="LokasiPerusahaanASPxMemo" runat="server" Text='<%#Bind("LokasiPerusahaan") %>'
                        Width="170px">
                    </dxe:ASPxMemo>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nomor Telepon">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NoTeleponASPxTextBox" runat="server" Text='<%#Bind("Telepon")%>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nomor Fax">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NoFaxASPxTextBox" runat="server" Text='<%#Bind("Fax")%>' Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status Tempat Usaha">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="StatusTempatASPxTextBox" runat="server" Text='<%#Bind("StatusTempat") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NPWP">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NPWPASPxTextbox" runat="server" Text='<%#Bind("NPWP") %>' Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Identitas Pemilik / Direktur Utama">
                <ItemStyle CssClass="field" />
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nama Lengkap">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NamaLengkapASPxTextBox" runat="server" Text='<%#Bind("PemilikNama") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tempat Tanggal Lahir">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TempatTanggalASPxTextBox" runat="server" Text='<%#Bind("PemilikTTL") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alamat Pemilik">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxMemo ID="AlamatPemilikASPxMemo" runat="server" Text='<%#Bind("PemilikAlamat") %>'
                        Width="170px">
                    </dxe:ASPxMemo>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nomor Telepon">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NomorASPxTextBox" runat="server" Text='<%#Bind("PemilikTelp") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fax">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="FaxASPxTextBox" runat="server" Text='<%#Bind("PemilikFax") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nama Suami / Istri">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NamaSuamiIstriASPxTextbox" runat="server" Text='<%#Bind("PemilikSuamiIstriNama") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kewarganegaraan Suami / Istri">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="KewarganegaraanASPxTextBox" runat="server" Text='<%#Bind("PemilikSuamiIstriKewarganegaraan") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Legalitas Perusahaan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="LegalitasPerusahaanASPxComboBox" runat="server" Width="240px">
                        <Items>
                            <dxe:ListEditItem Text="Berbentuk PT" />
                            <dxe:ListEditItem Text="Berbentuk Koperasi" />
                            <dxe:ListEditItem Text="Selain Berbentuk PT dan Koperasi" />
                        </Items>
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
                <HeaderStyle Font-Bold="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Akte Notaris">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <div style="float: left">
                        <dxe:ASPxTextBox ID="NamaAkteNotarisASPxTextBox" runat="server" Text='<%#Bind("NamaNotaris") %>'
                            Width="170px">
                        </dxe:ASPxTextBox>
                    </div>
                    <div style="float: left">
                        (Diisi Jika Perusahaan Berbentuk PT !)
                    </div>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nomor Tanggal Akte Notaris">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <div style="float: left">
                        <dxe:ASPxTextBox ID="NomorAkteNotarisASPxTextBox" runat="server" Text='<%#Bind("NoTglAkteNotaris") %>'
                            Width="170px">
                        </dxe:ASPxTextBox>
                    </div>
                    <div style="float: left">
                        (Diisi Jika Perusahaan Berbentuk PT !)
                    </div>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nomor / Tanggal Akte ">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NoTglAkteASPxTextBox" runat="server" Text='<%#Bind("NoTglPengesahan") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nomor / Tanggal Pengesahan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NoTglPengesahanASPxTextBox" runat="server" Text='<%#Bind("NoTglAktePendirianPerusahaan") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Izin Yang Dimiliki">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="Izin" runat="server" Text='<%#Bind("IzinYgDimiliki") %>' Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Modal">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="ModalASPxTextBox" runat="server" Text='<%#Bind("Modal") %>'
                        Width="170px" DisplayFormatString="c0" MaxLength="9">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kegiatan Usaha">
                <ItemStyle CssClass="field" />
                <HeaderStyle Font-Bold="True" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="KegUsahaASPxTextBox" runat="server" Text='<%#Bind("KegUsaha") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kelembagaan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="KelembagaanASPxTextBox" runat="server" Text='<%#Bind("Kelembagaan") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Bidang Usaha (sesuai KLUI)">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxm:ASPxMenu ID="ASPxMenu1" runat="server" Width="100%">
                        <Items>
                            <dxm:MenuItem Name="New" Text="New">
                            </dxm:MenuItem>
                            <dxm:MenuItem Name="Edit" Text="Edit">
                            </dxm:MenuItem>
                            <dxm:MenuItem Name="Delete" Text="Delete">
                            </dxm:MenuItem>
                            <dxm:MenuItem Name="TambahKLUI" Text="(Tambah KLUI)">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e){
                         if (e.item.name=='New')
                         {
                            KLUIGridView.AddNewRow();
                         }
                            else
                                {
                                        if (e.item.name=='Edit')
                                    {
                                        KLUIGridView.StartEditRow(KLUIGridView.GetFocusedRowIndex());
                                    }
                                    else 
                                    {
                                        if(e.item.name=='Delete')
                                        {
                                            KLUIGridView.DeleteRow(KLUIGridView.GetFocusedRowIndex());
                                        }
                                            else
                                                {
                                                    TambahKLUIPopupControl.ShowWindow();
                                                }
                                    }
                                }
                        }" />
                    </dxm:ASPxMenu>
                    <dxwgv:ASPxGridView ID="KLUIASPxGridView" runat="server" ClientInstanceName="KLUIGridView"
                        DataSourceID="SIUPJenisKLUIlXpoDataSource" AutoGenerateColumns="False" KeyFieldName="SIUPJENISKLUIID"
                        OnRowInserting="KLUIASPxGridView_RowInserting" Width="100%">
                        <SettingsBehavior AllowFocusedRow="true" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="SIUPJENISKLUIID" ReadOnly="True" Visible="False"
                                VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="SIUPID!Key" Visible="False" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Nomor KLUI" FieldName="JenisKLUIID!Key"
                                VisibleIndex="0">
                                <PropertiesComboBox DataSourceID="KLUIXpoDataSource" ValueField="JenisUsahaID" ValueType="System.String"
                                    TextField="NomorKLUI">
                                </PropertiesComboBox>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Jenis KLUI" FieldName="JenisKLUIID!Key"
                                VisibleIndex="0">
                                <PropertiesComboBox DataSourceID="KLUIXpoDataSource" ValueField="JenisUsahaID" ValueType="System.String"
                                    TextField="JenisUsahaNama">
                                </PropertiesComboBox>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Jenis KLUI" FieldName="JenisKLUIID!Key"
                                VisibleIndex="0" Visible="false">
                                <PropertiesComboBox DataSourceID="KLUIXpoDataSource" ValueField="JenisUsahaID" ValueType="System.String">
                                    <Columns>
                                        <dxe:ListBoxColumn FieldName="NomorKLUI" Width="170px" />
                                        <dxe:ListBoxColumn FieldName="JenisUsahaNama" Width="170px" />
                                    </Columns>
                                </PropertiesComboBox>
                                <EditFormSettings Visible="True" />
                            </dxwgv:GridViewDataComboBoxColumn>
                        </Columns>
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
                            PopupEditFormVerticalAlign="WindowCenter" />
                    </dxwgv:ASPxGridView>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jenis Barang jasa dagangan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxMemo ID="BarangDagangASPxMemo" runat="server" Text='<%#Bind("JenisBarangJasaDagangan") %>'
                        Width="170px">
                    </dxe:ASPxMemo>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hubungan Dengan Bank">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxm:ASPxMenu ID="BankASPxMenu" runat="server" Width="100%">
                        <Items>
                            <dxm:MenuItem Text="New" Name="New">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Edit" Name="Edit">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Delete" Name="Delete">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e){
                        if(e.item.name=='New'){
                        SIUPBankGridView.AddNewRow();
                        }else{
                        if(e.item.name=='Edit'){
                                SIUPBankGridView.StartEditRow(SIUPBankGridView.GetFocusedRowIndex());
                            }else{
                            SIUPBankGridView.DeleteRow(SIUPBankGridView.GetFocusedRowIndex());
                            }
                        }
                        }" />
                    </dxm:ASPxMenu>
                    <dxwgv:ASPxGridView ID="SIUPBankASPxGridView" runat="server" ClientInstanceName="SIUPBankGridView"
                        DataSourceID="SIUPBankXpoDataSource" KeyFieldName="SIUPBankID" AutoGenerateColumns="False"
                        OnRowInserting="SIUPBankASPxGridView_RowInserting">
                        <SettingsBehavior AllowFocusedRow="true" />
                        <SettingsEditing PopupEditFormWidth="340px" Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
                            PopupEditFormVerticalAlign="WindowCenter" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="SIUPBankID" ReadOnly="True" Visible="False"
                                VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="SIUPID!Key" Visible="False" VisibleIndex="1">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="NamaBank" VisibleIndex="0" Width="170px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="AlamatBank" VisibleIndex="1" Width="170px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Keterangan" VisibleIndex="2" Width="170px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataCheckColumn Caption="Dalam Negri" FieldName="LN" VisibleIndex="3"
                                Width="170px">
                            </dxwgv:GridViewDataCheckColumn>
                        </Columns>
                    </dxwgv:ASPxGridView>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Input">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="TglinputASPxDateEdit" runat="server" ClientInstanceName="TglIzinLamaDateEdit"
                        DisplayFormatString="dd MMMM yyyy" Date='<%#Bind("TglInput") %>'>
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="updateASPxButton" runat="server" Text="Simpan" CommandName="Update">
                        </dxe:ASPxButton>
                    </div>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="CancelButton" Text="Cancel" runat="server" CommandName="Cancel">
                        </dxe:ASPxButton>
                    </div>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
</asp:Content>
