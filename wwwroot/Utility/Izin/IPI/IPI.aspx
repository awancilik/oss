<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="IPI.aspx.vb" Inherits="Utility_Izin_IPI_IPI" Title="IPI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="IPIDetailXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IPIDetail"
        Criteria="[IPIID]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="new" sessionfield="IPIID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KLUIXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisUsahaKLUI">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IPIXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IPI"
        Criteria="[IPIID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="IPIID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="InvestasiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IPIInvestasi"
        Criteria="[IPIID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="IPIID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="JenisModalXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IPIJenisModal">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IPIMesinProduksiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IPIMesin"
        Criteria="[IPIID] = ? And [ProduksiPencemaran] = 'Produksi'">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="IPIID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IPIMesinPencemaranXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IPIMesin"
        Criteria="[IPIID] = ? And [ProduksiPencemaran] = 'Pencemaran'">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="IPIID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IPIKomoditiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IPIKomoditi"
        Criteria="[IPIID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="IPIID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="PemasaranXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IPIPemasaran"
        Criteria="[IPIID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="IPIID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KecamatanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kecamatan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KelurahanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kelurahan"
        Criteria="[KelurahanKecamatanID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="KecamatanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <%--dummy--%>
    <dxwgv:ASPxGridView ID="dummyASPxGridView1" runat="server" Visible="false">
    </dxwgv:ASPxGridView>
    <dxcb:ASPxCallback ID="dummyASPxCallback1" runat="server" Visible="false">
    </dxcb:ASPxCallback>
    <dxe:ASPxComboBox ID="dummyASPxComboBox1" runat="server" Visible="false">
    </dxe:ASPxComboBox>
    <dxcb:ASPxCallback ID="KelurahanASPxCallback" runat="server" ClientInstanceName="KelurahanCallback">
    </dxcb:ASPxCallback>
    <dxcb:ASPxCallback ID="TglIzinLamaASPxCallback" runat="server" ClientInstanceName="TglIzinLamaCallback">
    </dxcb:ASPxCallback>
    <table>
        <tr>
            <td>
                Masukan Nomor Permohonan
            </td>
            <td>
                :</td>
            <td>
                <dxe:ASPxTextBox ID="NomorPermohonanASPxTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="CariASPxButton" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
    <dxpc:ASPxPopupControl ID="PeringatanASPxPopupControl" runat="server" ClientInstanceName="PeringatanPopupControl"
        Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        HeaderText="Peringatan">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
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
            <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
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
    <asp:DetailsView ID="IPIDetailsView" AutoGenerateRows="False" runat="server" DataSourceID="IPIXpoDataSource"
        CssClass="dataprop" GridLines="None" DataKeyNames="IPIID">
        <RowStyle CssClass="rowfield" />
        <FieldHeaderStyle CssClass="headerfield" />
        <Fields>
            <asp:TemplateField HeaderText="Keterangan Pemohon Perusahaan :">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nama Pemilik ">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PemilikNamaASPxTextbox" runat="server" Width="170px" Text='<%#Bind("PemilikNama") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nama Perusahaan">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PerusahaanNamaASPxTextBox" runat="server" Width="170px" Text='<%#Bind("PerusahaanNama") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alamat Perusahaan">
                <EditItemTemplate>
                    <dxe:ASPxMemo ID="AlamatPerusahaanASPxMemo" runat="server" Height="71px" Width="170px"
                        Text='<%#Bind("PerusahaanAlamat") %>'>
                    </dxe:ASPxMemo>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NPWP">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NPWPASPxTextBox" runat="server" Width="170px" Text='<%#Bind("PerusahaanNPWP") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nomor Telpon">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TelponASPxTextBox" runat="server" Width="170px" Text='<%#Bind("PemilikTelpon") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Penanggung Jawab / Direktur">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="DirekturASPxTextBox" runat="server" Width="170px" Text='<%#Bind("PerusahaanDirektur") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alamat Direktur">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="DirekturAlamatASPxTextBox" runat="server" Width="170px" Text='<%#Bind("PerusahaanDirekturAlamat") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kapasitas yang direncanakan :">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sebelum Perluasan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="SebelumPerluasanASPxTextBox" runat="server" Width="170px" Text='<%#Bind("KapasitasSebelumPerluasan") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sesudah Perluasan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="SesudahPerluasanASPxTextBox" runat="server" Width="170px" Text='<%#Bind("KapasitasSesudahPerluasan") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Lokasi dan Luas Tanah :">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kecamatan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="KecamatanPabrikASPxComboBox" runat="server" ClientInstanceName="KecamatanPabrikComboBox"
                        DataSourceID="KecamatanXpoDataSource" ValueField="KecamatanID" TextField="KecamatanNama"
                        ValueType="System.String">
                        <ClientSideEvents SelectedIndexChanged="function(s, e){KelurahanComboBox.PerformCallback(KecamatanPabrikComboBox.GetValue());}" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kelurahan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="KelurahanASPxComboBox" runat="server" ClientInstanceName="KelurahanComboBox"
                        DataSourceID="KelurahanXpoDataSource" ValueField="KelurahanID" TextField="KelurahanNama"
                        ValueType="System.String" OnCallback="KelurahanASPxCallback_Callback1">
                        <ClientSideEvents LostFocus="function(s, e){KelurahanCallback.PerformCallback(KelurahanComboBox.GetValue());}" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tempat/Alamat Pabrik">
                <EditItemTemplate>
                    <dxe:ASPxMemo ID="AlamatPabrikASPxMemo" runat="server" Height="71px" Width="170px"
                        Text='<%#Bind("PabrikAlamat") %>'>
                    </dxe:ASPxMemo>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Luas Gudang (M2)">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="LuasGudangASPxTextBox" runat="server" Width="170px" Text='<%#Bind("LuasGudang") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Luas Tanah (M2)">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="LuasTanahASPxTextBox" runat="server" Width="170px" Text='<%#Bind("LuasTanah") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Daftar Mesin dan Peralatan :">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mesin/Peralatan Produksi">
                <EditItemTemplate>
                    <dxm:ASPxMenu ID="MesinASPxMenu" runat="server">
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
                                MesinProduksiGridView.AddNewRow();
                            }
                            else {
                                if(e.item.name=='Edit'){
                                    MesinProduksiGridView.StartEditRow(MesinProduksiGridView.GetFocusedRowIndex());
                                }
                                else
                                    {
                                        MesinProduksiGridView.DeleteRow(MesinProduksiGridView.GetFocusedRowIndex());
                                    }
                            }
                    }" />
                    </dxm:ASPxMenu>
                    <dxwgv:ASPxGridView ID="MesinASPxGridView" runat="server" ClientInstanceName="MesinProduksiGridView"
                        DataSourceID="IPIMesinProduksiXpoDataSource" KeyFieldName="IPIMesinID" AutoGenerateColumns="False"
                        OnRowInserting="MesinASPxGridView_RowInserting">
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="IPIMesinID" ReadOnly="True" Visible="False"
                                VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="IPIID" Visible="False" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn FieldName="DlmNegriImport" VisibleIndex="0">
                                <PropertiesComboBox ValueType="System.String">
                                    <Items>
                                        <dxe:ListEditItem Text="Dalam Negri" Value="Dalam Negri" />
                                        <dxe:ListEditItem Text="Import" Value="Import" />
                                    </Items>
                                </PropertiesComboBox>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="NamaMesin" VisibleIndex="1">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Jumlah" VisibleIndex="2">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Kapasitas" VisibleIndex="3">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Spesifikasi" VisibleIndex="4">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Merk" VisibleIndex="5">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Tahun" VisibleIndex="6">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="NegaraAsal" VisibleIndex="7">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Harga" VisibleIndex="8">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager Mode="ShowAllRecords" />
                        <SettingsEditing PopupEditFormHorizontalAlign="windowcenter" PopupEditFormVerticalAlign="WindowCenter"
                            Mode="PopupEditForm" PopupEditFormWidth="400px" />
                    </dxwgv:ASPxGridView>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mesin/Peralatan Pengendalian Pencemaran">
                <EditItemTemplate>
                    <dxm:ASPxMenu ID="MesinPencemaranASPxMenu" runat="server">
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
                                MesinPencemaranGridView.AddNewRow();
                            }
                            else {
                                if(e.item.name=='Edit'){
                                    MesinPencemaranGridView.StartEditRow(MesinPencemaranGridView.GetFocusedRowIndex());
                                }
                                else
                                    {
                                        MesinPencemaranGridView.DeleteRow(MesinPencemaranGridView.GetFocusedRowIndex());
                                    }
                            }
                    }" />
                    </dxm:ASPxMenu>
                    <dxwgv:ASPxGridView ID="MesinPencemaranASPxGridView" runat="server" ClientInstanceName="MesinPencemaranGridView"
                        DataSourceID="IPIMesinPencemaranXpoDataSource" KeyFieldName="IPIMesinID" AutoGenerateColumns="False"
                        OnRowInserting="MesinPencemaranASPxGridView_RowInserting">
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="IPIMesinID" ReadOnly="True" Visible="False"
                                VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="IPIID" Visible="False" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn FieldName="DlmNegriImport" VisibleIndex="0">
                                <PropertiesComboBox ValueType="System.String">
                                    <Items>
                                        <dxe:ListEditItem Text="Dalam Negri" Value="Dalam Negri" />
                                        <dxe:ListEditItem Text="Import" Value="Import" />
                                    </Items>
                                </PropertiesComboBox>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="NamaMesin" VisibleIndex="1">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Jumlah" VisibleIndex="2">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Kapasitas" VisibleIndex="3">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Spesifikasi" VisibleIndex="4">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Merk" VisibleIndex="5">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Tahun" VisibleIndex="6">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="NegaraAsal" VisibleIndex="7">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Harga" VisibleIndex="8">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager Mode="ShowAllRecords" />
                        <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter"
                            Mode="PopupEditForm" PopupEditFormWidth="400px" />
                    </dxwgv:ASPxGridView>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tujuan Industri">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TujuanASPxTextBox" runat="server" Width="170px" Text='<%#Bind("TujuanIndustri") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jenis Industri: ">
                <ItemStyle CssClass="field" />
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
                        DataSourceID="IPIDetailXpoDataSource" AutoGenerateColumns="False" KeyFieldName="IPIDetailID"
                        OnRowInserting="KLUIASPxGridView_RowInserting">
                        <SettingsBehavior AllowFocusedRow="true" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="IPIDetailID" ReadOnly="True" Visible="False"
                                VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="IPIID!Key" Visible="False" VisibleIndex="0">
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
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nilai Investasi :">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxm:ASPxMenu ID="InvestasiASPxMenu" runat="server">
                        <Items>
                            <dxm:MenuItem Text="New" Name="New">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Edit" Name="Edit">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Delete" Name="Delete">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e){
                         if (e.item.name=='New')
                         {
                            InvestasiGridView.AddNewRow();
                         }
                            else
                                {
                                        if (e.item.name=='Edit')
                                    {
                                        InvestasiGridView.StartEditRow(InvestasiGridView.GetFocusedRowIndex());
                                    }
                                    else 
                                    {
                                        InvestasiGridView.DeleteRow(InvestasiGridView.GetFocusedRowIndex());
                                    }
                                }
                        }" />
                    </dxm:ASPxMenu>
                    <dxwgv:ASPxGridView ID="InvestasiASPxGridView" runat="server" ClientInstanceName="InvestasiGridView"
                        DataSourceID="InvestasiXpoDataSource" AutoGenerateColumns="False" KeyFieldName="IPIInvestasiID"
                        OnRowInserting="InvestasiASPxGridView_RowInserting">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="IPIInvestasiID" ReadOnly="True" Visible="False"
                                VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="IPIID!Key" Visible="False" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn FieldName="JenisModalID!Key" Caption="Jenis Modal"
                                VisibleIndex="0" Width="180px">
                                <PropertiesComboBox DataSourceID="JenisModalXpoDataSource" TextField="JenisModal"
                                    ValueField="JenisModalID" ValueType="System.String">
                                </PropertiesComboBox>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Modal" VisibleIndex="1" Width="180px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="NilaiSebelumPerluasan" Caption="Nilai Sebelum Perluasan"
                                VisibleIndex="2" Width="180px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="NilaiSesudahPerluasan" Caption="Nilai Sesudah Perluasan"
                                VisibleIndex="3" Width="180px">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter"
                            Mode="PopupEditForm" PopupEditFormWidth="400px" />
                        <SettingsBehavior AllowFocusedRow="true" />
                    </dxwgv:ASPxGridView>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tenaga Kerja Pria :">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sebelum Perluasan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TKPriaSblmASPxTextBox" runat="server" Text='<%#Bind("TKIPriaSebelumPerluasan") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sesudah Perluasan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TKPriaSsdhASPxTextBox" runat="server" Text='<%#Bind("TKIPriaSesudahPerluasan") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tenaga Kerja Wanita :">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sebelum Perluasan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TKWanitaSblmASPxTextBox" runat="server" Text='<%#Bind("TKIWanitaSebelumPerluasan") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sesudah Perluasan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TKWanitaSsdhASPxTextBox" runat="server" Text='<%#Bind("TKIWanitaSesudahPerluasan") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Penggunaan Tenaga Kerja Asing :">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jumlah">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="JumlahTKIASPxTextBox" runat="server" Width="170px" Text='<%#Bind("JumlahTKAsing") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Negara Asal">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NegaraAsalTKIASPxTextBox" runat="server" Width="170px" Text='<%#Bind("NegaraAsalTKAsing") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Keahlian">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="KeahlianTKIASPxTextBox" runat="server" Width="170px" Text='<%#Bind("KeahlianTKAsing") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jangka Waktu Di Indonesia">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="JangkaWaktuTKasingTKIASPxTextBox" runat="server" Width="170px"
                        Text='<%#Bind("JangkaWaktuTKasing") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pemasaran">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxm:ASPxMenu ID="PemasaranASPxMenu" runat="server">
                        <Items>
                            <dxm:MenuItem Text="New" Name="New">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Edit" Name="Edit">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Delete" Name="Delete">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e){
                         if (e.item.name=='New')
                         {
                            PemasaranGridView.AddNewRow();
                         }
                            else
                                {
                                        if (e.item.name=='Edit')
                                    {
                                        PemasaranGridView.StartEditRow(PemasaranGridView.GetFocusedRowIndex());
                                    }
                                    else 
                                    {
                                        PemasaranGridView.DeleteRow(PemasaranGridView.GetFocusedRowIndex());
                                    }
                                }
                        }" />
                    </dxm:ASPxMenu>
                    <dxwgv:ASPxGridView ID="PemasaranASPxGridview" runat="server" ClientInstanceName="PemasaranGridView"
                        DataSourceID="PemasaranXpoDataSource" AutoGenerateColumns="False" KeyFieldName="IPIPemasaranID"
                        OnRowInserting="PemasaranGridview_RowInserting">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="IPIPemasaranID" ReadOnly="True" Visible="False"
                                VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="IPIID!Key" Visible="False" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn FieldName="PemasaranDlmLuarNegri" VisibleIndex="0"
                                Width="170px">
                                <PropertiesComboBox ValueType="System.String">
                                    <Items>
                                        <dxe:ListEditItem Text="Dalam Negri" Value="Dalam Negri" />
                                        <dxe:ListEditItem Text="Export" Value="Export" />
                                    </Items>
                                </PropertiesComboBox>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Volume" VisibleIndex="1" Width="170px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Nilai" VisibleIndex="2" Width="170px">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="true" />
                        <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter"
                            Mode="PopupEditForm" PopupEditFormWidth="500px" />
                    </dxwgv:ASPxGridView>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Merek">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="MerkASPxTextbox" runat="server" Width="170px" Text='<%#Bind("Merk") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DATA LAIN :">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jenis Industri">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="jnsASPxComboBox" runat="server" Width="170px" Text='<%#Bind("JenisIndustri") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jumlah Komoditi">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxm:ASPxMenu ID="KomoditasASPxMenu" runat="server">
                        <Items>
                            <dxm:MenuItem Text="New" Name="New">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Edit" Name="Edit">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Delete" Name="Delete">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e){
                         if (e.item.name=='New')
                         {
                            KomoditasGridView.AddNewRow();
                         }
                            else
                                {
                                        if (e.item.name=='Edit')
                                    {
                                        KomoditasGridView.StartEditRow(KomoditasGridView.GetFocusedRowIndex());
                                    }
                                    else 
                                    {
                                        KomoditasGridView.DeleteRow(KomoditasGridView.GetFocusedRowIndex());
                                    }
                                }
                        }" />
                    </dxm:ASPxMenu>
                    <dxwgv:ASPxGridView ID="KomoditasASPxGridView" runat="server" ClientInstanceName="KomoditasGridView"
                        DataSourceID="IPIKomoditiXpoDataSource" KeyFieldName="KomoditiID" AutoGenerateColumns="False"
                        OnRowInserting="KomoditasASPxGridView_RowInserting">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="KomoditiID" ReadOnly="True" Visible="False"
                                VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="IPIID!Key" Visible="False" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Komoditi" VisibleIndex="0" Width="170px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Kapasitas" Caption="Kapasitas Sesudah Perluasan"
                                VisibleIndex="1" Width="170px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="KapasitasSebelum" Caption="Kapasitas Sebelum Perluasan"
                                VisibleIndex="2" Width="170px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Satuan" VisibleIndex="3" Width="170px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataMemoColumn FieldName="KKI" VisibleIndex="4" Width="170px">
                            </dxwgv:GridViewDataMemoColumn>
                            <dxwgv:GridViewDataMemoColumn FieldName="Keterangan" VisibleIndex="5" Width="170px">
                            </dxwgv:GridViewDataMemoColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="true" />
                        <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter"
                            PopupEditFormWidth="500px" Mode="PopupEditForm" />
                    </dxwgv:ASPxGridView>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Industri (KKI) ">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="KKIASPxTextBox" runat="server" Width="170px" Text='<%#Bind("Komoditi") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nomor Izin Lama">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NoIzinLamaASPxTextBox" runat="server" Width="170px" Text='<%#Bind("NoIzinLama") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Izin Lama">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="TglIzinLamaASPxDateEdit" runat="server" ClientInstanceName="TglIzinLamaDateEdit"
                        DisplayFormatString="dd MMMM yyyy" Date='<%#Bind("TglIzinLama") %>'>
                        <ClientSideEvents DateChanged="function(s, e){
                    TglIzinLamaCallback.PerformCallback(TglIzinLamaDateEdit.GetText());
                    }" />
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Masa Berlaku">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="MasaBerlakuASPxTextBox" runat="server" Width="170px" Text='<%#Bind("MasaBerlaku") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Investasi">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="InvestasiASPxTextbox" runat="server" Width="170px" Text='<%#Bind("Investasi") %>'
                        NullText="Rp">
                    </dxe:ASPxTextBox>
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
