<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="IUI.aspx.vb" Inherits="Utility_Izin_IUI" Title="IUI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="IUIXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IUI"
        Criteria="[IUIID]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="new" sessionfield="IUIID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IUIMesinXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IUIMesin">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="StatusBangunanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.StatusBangunan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="StatusPabrikXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.StatusPabrik">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IUIDetailXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IUIDetail"
        Criteria="[IUIID]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="new" sessionfield="IUIID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KLUIXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisUsahaKLUI">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KecamatanXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.Kecamatan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KelurahanXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.Kelurahan"
        Criteria="[KelurahanKecamatanID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="new" sessionfield="KecamatanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KomoditiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IUIKomoditi"
        Criteria="[IUIID]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="new" sessionfield="IUIID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <%--Callback--%>
    <dxcb:ASPxCallback ID="StatusBangunanASPxCallback" runat="server" ClientInstanceName="StatusBangunanCallback">
    </dxcb:ASPxCallback>
    <dxcb:ASPxCallback ID="pabrikKelASPxCallback" runat="server" ClientInstanceName="pabrikKelCallback">
    </dxcb:ASPxCallback>
    <dxcb:ASPxCallback ID="pabrikKecASPxCallback" runat="server" ClientInstanceName="pabrikKecCallback">
    </dxcb:ASPxCallback>
    <dxcb:ASPxCallback ID="JenisUsahaKLUIASPxCallback" runat="server" ClientInstanceName="JenisUsahaCallback">
    </dxcb:ASPxCallback>
    <dxcb:ASPxCallback ID="tglDikeluarkanASPxCallback" runat="server" ClientInstanceName="tglDikeluarkanCallback">
    </dxcb:ASPxCallback>
    <dxcb:ASPxCallback ID="tglBerahkirASPxCallback" runat="server" ClientInstanceName="tglBerahkirCallback">
    </dxcb:ASPxCallback>
    <dxe:ASPxComboBox ID="ASPxComboBox1" runat="server" Visible="false">
    </dxe:ASPxComboBox>
    <%--Callback--%>
    <table>
        <tr>
            <td>
                Masukan Nomor Permohonan
            </td>
            <td>
                :
            </td>
            <td>
                <dxe:ASPxTextBox ID="NomorPermohonanASPxTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="NomorPermohonanASPxButton" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
    <dxpc:ASPxPopupControl ID="PeringatanASPxPopupControl" runat="server" ClientInstanceName="PeringatanPopupControl"
        Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        HeaderText="Peringatan">
        <ContentCollection>
            <dxpc:PopupControlContentControl runat="server">
                <center>
                    Maaf, Nomor Permohonan tidak Ditemukan!<br />
                    <dxe:ASPxButton ID="OKpopASPxButton" runat="server" Text="OK" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e){PeringatanPopupControl.HideWindow();}" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="TersimpanPopupControl" ClientInstanceName="TersimpanPopupControl"
        runat="server" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        Width="450px" HeaderText="Peringatan">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <center>
                    Data Telah Tersimpan !<br />
                    <dxe:ASPxButton ID="TersimpanButton" ClientInstanceName="TersimpanButton" runat="server"
                        Text="OK" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e){TersimpanPopupControl.HideWindow();}" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <asp:DetailsView ID="IUIDetailsView" AutoGenerateRows="False" runat="server" DataSourceID="IUIXpoDataSource"
        CssClass="dataprop" GridLines="None" DataKeyNames="IUIID">
        <RowStyle CssClass="rowfield" />
        <FieldHeaderStyle CssClass="headerfield" />
        <Fields>
            <asp:TemplateField HeaderText="Perusahaan">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nama Perusahaan">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NamaPemilikASPxTextBox" runat="server" Width="170px" Text='<%#Bind("PerusahaanNama") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alamat Perusahaan">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="AlamatPerusahaanTextBox" runat="server" Width="170px" Text='<%#Bind("PerusahaanAlamat") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Telpon Perusahaan">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TelponPerusahaanTextBox" runat="Server" Width="170px" Text='<%#Bind("PerusahaanTelpon")%>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fax Perusahaan">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="FaxPerusahaanTextBox" runat="Server" Width="170px" Text='<%#Bind("PerusahaanFax") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NPWP Perusahaan">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NPWPPerusahaanTextBox" runat="server" Width="170px" Text='<%#Bind("PerusahaanNPWP") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Direktur Perusahaan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="DirekturASPxTextbox" runat="server" Width="170px" Text='<%#Bind("PerusahaanDirektur") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alamat Direktur">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="AlamatDirekturASPxTextbox" runat="server" Width="170px" Text='<%#Bind("PerusahaanDirekturAlamat") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="No KTP Pemilik">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NoKTPPemilikTextBox" runat="Server" Width="170px" Text='<%#Bind("PemilikNoKTP") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NamaPemilik">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NamaPemilikTextBox" runat="Server" Width="170px" Text='<%#Bind("PemilikNama") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alamat Pemilik">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="AlamatPemilikTextBox" runat="Server" Width="170px" Text='<%#Bind("PemilikAlamat") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kodepos Pemilik">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="KodeposPemilikTextBox" runat="Server" Width="170px" MaxLength="5"
                        Text='<%#Bind("PemilikKodepos") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Telpon Pemilik">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TelponPemilikTextBox" runat="Server" Width="170px" Text='<%#Bind("PemilikTelpon") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fax Pemilik">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="FaxPemilikTextBox" runat="server" Width="170px" Text='<%#Bind("PemilikFax") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status Bangunan">
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="StatusBangunanASPxComboBox" runat="server" ClientInstanceName="StatusBangunanComboBox"
                        DataSourceID="StatusBangunanXpoDataSource" ValueField="StatusBangunanID" TextField="StatusBangunan"
                        ValueType="System.String">
                        <ClientSideEvents SelectedIndexChanged="function(s, e){StatusBangunanCallback.PerformCallback(StatusBangunanComboBox.GetValue());}" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alamat Pabrik">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PabrikAlamatASPxTextBox" runat="server" Text='<%#Bind("PabrikAlamat") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="KabupatenPabrik">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxLabel ID="kabupatenASPxLabel" runat="server" Text="KUDUS">
                    </dxe:ASPxLabel>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kecamatan Pabrik">
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="pabrikKecASPxComboBox" runat="server" ClientInstanceName="pabrikKecComboBox"
                        DataSourceID="KecamatanXpoDataSource" ValueField="KecamatanID" TextField="KecamatanNama"
                        ValueType="System.String">
                        <ClientSideEvents SelectedIndexChanged="function(s, e){pabrikComboBox.PerformCallback(pabrikKecComboBox.GetValue());}" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kelurahan Pabrik">
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="pabrikKelASPxComboBox" runat="server" ClientInstanceName="pabrikComboBox"
                        DataSourceID="KelurahanXpoDataSource" ValueField="KelurahanID" TextField="KelurahanNama"
                        ValueType="System.String" OnCallback="pabrikKelASPxCallback_Callback">
                        <ClientSideEvents SelectedIndexChanged="function(s, e){pabrikKelCallback.PerformCallback(pabrikComboBox.GetValue());}" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Luas Tanah (M&#178;)">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="LuasTanahASPxTextbox" runat="server" Width="170px" Text='<%#Bind ("LuasTanah", "{0:f2}")  %>'
                        DisplayFormatString="f2">
                        <%-- DisplayFormatString="d0">--%>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Luas Bangunan (M&#178;)">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="LuasBangunanASPxTextbox" runat="server" Width="170px" Text='<%#Bind ("LuasBangunan") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Luas Gudang (M&#178;)">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="LuasGudangASPxTextbox" runat="server" Width="170px" Text='<%#Bind ("LuasGudang") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Produksi">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nomor KLUI">
                <EditItemTemplate>
                    <dxm:ASPxMenu ID="ASPxMenu1" runat="server">
                        <Items>
                            <dxm:MenuItem Name="New" Text="New">
                            </dxm:MenuItem>
                            <dxm:MenuItem Name="Edit" Text="Edit">
                            </dxm:MenuItem>
                            <dxm:MenuItem Name="Delete" Text="Delete">
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
                                        KLUIGridView.DeleteRow(KLUIGridView.GetFocusedRowIndex());
                                    }
                                }
                        }" />
                    </dxm:ASPxMenu>
                    <dxwgv:ASPxGridView ID="KLUIASPxGridView" runat="server" ClientInstanceName="KLUIGridView"
                        DataSourceID="IUIDetailXpoDataSource" AutoGenerateColumns="False" KeyFieldName="IUIDetailID"
                        OnRowInserting="KLUIASPxGridView_RowInserting">
                        <SettingsBehavior AllowFocusedRow="true" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="IUIDetailID" ReadOnly="True" Visible="False"
                                VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="IUIID!Key" Visible="False" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Nomor KLUI" FieldName="KLUIID!Key" VisibleIndex="0">
                                <PropertiesComboBox DataSourceID="KLUIXpoDataSource" ValueField="JenisUsahaID" ValueType="System.String"
                                    TextField="NomorKLUI">
                                </PropertiesComboBox>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Jenis KLUI" FieldName="KLUIID!Key" VisibleIndex="0">
                                <PropertiesComboBox DataSourceID="KLUIXpoDataSource" ValueField="JenisUsahaID" ValueType="System.String"
                                    TextField="JenisUsahaNama">
                                </PropertiesComboBox>
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Jenis KLUI" FieldName="KLUIID!Key" VisibleIndex="0"
                                Visible="false">
                                <PropertiesComboBox DataSourceID="KLUIXpoDataSource" ValueField="JenisUsahaID" ValueType="System.String">
                                    <Columns>
                                        <dxe:ListBoxColumn FieldName="NomorKLUI" Width="170px">
                                        </dxe:ListBoxColumn>
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
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DaftarKomoditi">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxm:ASPxMenu ID="ASPxMenu2" runat="server">
                        <Items>
                            <dxm:MenuItem Name="New" Text="New">
                            </dxm:MenuItem>
                            <dxm:MenuItem Name="Edit" Text="Edit">
                            </dxm:MenuItem>
                            <dxm:MenuItem Name="Delete" Text="Delete">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e){
                         if (e.item.name=='New')
                         {
                            KomoditiGridView.AddNewRow();
                         }
                            else
                                {
                                        if (e.item.name=='Edit')
                                    {
                                        KomoditiGridView.StartEditRow(KomoditiGridView.GetFocusedRowIndex());
                                    }
                                    else 
                                    {
                                        KomoditiGridView.DeleteRow(KomoditiGridView.GetFocusedRowIndex());
                                    }
                                }
                        }" />
                    </dxm:ASPxMenu>
                    <dxwgv:ASPxGridView ID="KomoditiASPxGridView" runat="server" ClientInstanceName="KomoditiGridView"
                        DataSourceID="KomoditiXpoDataSource" AutoGenerateColumns="False" KeyFieldName="IUIKomoditiID"
                        OnRowInserting="KomoditiASPxGridView_RowInserting">
                        <SettingsBehavior AllowFocusedRow="true" />
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="WindowCenter"
                            PopupEditFormVerticalAlign="WindowCenter" PopupEditFormModal="true" PopupEditFormWidth="500px" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="IUIKomoditiID" ReadOnly="True" Visible="False"
                                VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="IUIID!Key" Visible="False" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Komoditi" FieldName="KomoditiNama" VisibleIndex="0"
                                Width="250px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Kapasitas" VisibleIndex="1" Width="250px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Satuan" VisibleIndex="2" Width="250px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Keterangan" VisibleIndex="3" Width="250px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="JenisKomoditi" VisibleIndex="4" Width="250px">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                    </dxwgv:ASPxGridView>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jenis Usaha">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="JenisUsahaTextbox" runat="server" Width="170px" Text='<%#Bind("JenisIndustri") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tenaga Kerja Indonesia">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PRIA">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TKIPriaASPxTextbox" runat="server" Width="170px" Text='<%#Bind("TKIPria") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Wanita">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TKIWanitaASPxTextbox" runat="server" Width="170px" Text='<%#Bind("TKIWanita") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tenaga Kerja Asing">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="PRIA">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TKAsingPriaASPxTextBox" runat="server" Width="170px" Text='<%#Bind("TKAsingPria") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Wanita">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TKAsingWanitaASPxTextBox" runat="server" Width="170px" Text='<%#Bind("TKAsingWanita") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kapasitas Produksi setahun">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="KapasitasProduksiASPxTextBox" runat="server" Width="170px" Text='<%#Bind("KapasitasProduksi") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Data Terkait">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Investasi">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="InvestasiASPxTextBox" runat="server" Text='<%#Bind("Investasi") %>'
                        MaxLength="15" Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Merk">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="MerkASPxTextBox" runat="server" Width="170px" Text='<%#Bind("Merk") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jenis Industri">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="JenisIndustriASPxTextBox" runat="server" Width="170px" Text='<%#Bind("JenisIndustri") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tgl Dikeluarkan">
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="TglDikeluarkanASPxDateEdit" runat="server" ClientInstanceName="TglDikeluarkanDateEdit"
                        DisplayFormatString="dd MMMM yyyy" Date='<%#Bind("TglDikeluarkan") %>'>
                        <%--<ClientSideEvents DateChanged="function(s, e){
                    tglDikeluarkanCallback.PerformCallback(TglDikeluarkanDateEdit.GetText());
                    }" />--%>
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <%--<asp:TemplateField HeaderText="Tgl Berahkir">
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="TglBerahkirASPxDateEdit" runat="server" ClientInstanceName="TglBerahkirDateEdit"
                        DisplayFormatString="dd MMMM yyyy" Date='<%#Bind("TglBerahkir") %>'>
                   <ClientSideEvents DateChanged="function(s, e){
                    tglBerahkirCallback.PerformCallback(TglBerahkirDateEdit.GetText());
                    }" /> 
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="Masa Berlaku">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="MasaBerlakuASPxTextBox" runat="server" Width="170px" Text='<%#Bind("MasaBerlaku") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Komoditi">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="KomoditiASPxTextBox" runat="server" Width="170px" Text='<%#Bind("Komoditi") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
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
