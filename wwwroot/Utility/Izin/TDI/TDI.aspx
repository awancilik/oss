<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="TDI.aspx.vb" Inherits="Utility_Izin_TDI_TDI" Title="Data Izin TDI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <%--dummy--%>
    <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" Visible="false">
    </dxwgv:ASPxGridView>
    <dxe:ASPxComboBox ID="ASPxComboBox1" runat="server" Visible="false">
    </dxe:ASPxComboBox>
    <%--dummy--%>
    <dx:XpoDataSource ID="TDIIDetailXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.TDIDetail"
        Criteria="[TDIID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="newparameter" sessionfield="TDIID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KLUIXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisUsahaKLUI">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="MesinXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.TDIMesin"
        Criteria="[TDIID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="newparameter" sessionfield="TDIID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="TDIKomoditiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.TDIKomoditi"
        Criteria="[TDIID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="newparameter" sessionfield="TDIID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="TDIXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.TDI"
        Criteria="[TDIID]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="newparameter" sessionfield="TDIID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KecamatanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kecamatan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KelurahanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kelurahan"
        Criteria="[KelurahanKecamatanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="newparameter" sessionfield="KecamatanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="TersimpanASPxPopupControl" runat="server" ClientInstanceName="TersimpanPopupControl"
        Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        HeaderText="Tersimpan">
        <ContentCollection>
            <dxpc:PopupControlContentControl runat="server">
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
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
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
    <table>
        <tr>
            <td>
                Masukan Nomor Permohonan</td>
            <td>
                :</td>
            <td>
                <dxe:ASPxTextBox ID="NoPermohonanASPxTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="CariASPxButton" runat="server" Text="Cari" AutoPostBack="false">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
    <dxcb:ASPxCallback ID="KelurahanASPxCallback" runat="server" ClientInstanceName="KelurahanCallback">
    </dxcb:ASPxCallback>
    <asp:DetailsView ID="TDIDetailView" runat="server" DataSourceID="TDIXpoDataSource"
        DataKeyNames="TDIID" AutoGenerateRows="false" CssClass="dataprop" GridLines="None"
        Visible="false">
        <RowStyle CssClass="rowfield" />
        <FieldHeaderStyle CssClass="headerfield" />
        <Fields>
            <asp:TemplateField HeaderText="Nama Pemilik">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PemilikNamaASPxTextBox" runat="server" Width="170px" Text='<%#Bind("PemilikNama") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alamat Pemilik">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PemilikAlamatASPxTextBox" runat="server" Width="170px" Text='<%#Bind("PemilikAlamat") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nama Perusahaan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PerusahaanNamaASPxTextBox" runat="server" Width="170px" Text='<%#Bind("PerusahaanNama") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alamat Perusahaan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PerusahaanAlamatASPxTextBox" runat="server" Width="170px" Text='<%#Bind("PerusahaanAlamat") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Telpon">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TelpASPxTextBox" runat="server" Width="170px" Text='<%#Bind("PerusahaanTelpon") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fax">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="FaxASPxTextBox" runat="server" Width="170px" Text='<%#Bind("PerusahaanFax") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NPWP">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NPWPASPxTextBox" runat="server" Width="170px" Text='<%#Bind("PerusahaanNPWP") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="NIPIK">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="NIPIKASPxTextBox" runat="server" Text='<%#Bind("NIPIK") %>'
                        Width="170px">
                        <MaskSettings Mask="'0'3,'3319',00000" />
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Alamat Pabrik">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="AlamatPabrikASPxTextBox" runat="server" Width="170px" Text='<%#Bind("PabrikAlamat") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kecamatan Pabrik">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="KecamatanASPxComboBox" runat="server" DataSourceID="KecamatanXpoDataSource"
                        ClientInstanceName="KecamatanComboBox" ValueField="KecamatanID" TextField="KecamatanNama">
                        <ClientSideEvents SelectedIndexChanged="function(s, e){KelurahanComboBox.PerformCallback(KecamatanComboBox.GetValue());}" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Kelurahan Pabrik">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxComboBox ID="KelurahanASPxComboBox" runat="server" DataSourceID="KelurahanXpoDataSource"
                        ClientInstanceName="KelurahanComboBox" ValueField="KelurahanID" TextField="KelurahanNama"
                        OnCallback="KelurahanASPxComboBox_Callback">
                        <ClientSideEvents SelectedIndexChanged="function(s, e){KelurahanCallback.PerformCallback(KelurahanComboBox.GetValue());}" />
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pemilikan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PemilikanASPxTextBox" runat="server" Width="170px" Text='<%#Bind("Kepemilikan") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Luas Pabrik">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="LuasPabrikASPxTextBox" runat="server" Width="170px" Text='<%#Bind("LuasPabrik") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Luas Tanah">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="LuasTanahASPxTextBox" runat="server" Width="170px" Text='<%#Bind("LuasTanah") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mesin dan Peralatan">
                <ItemStyle CssClass="field" />
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
                        DataSourceID="MesinXpoDataSource" KeyFieldName="TDIMesinID" AutoGenerateColumns="False"
                        OnRowInserting="MesinASPxGridView_RowInserting">
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="MesinMesinID" ReadOnly="True" Visible="False"
                                VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="MesinID" Visible="False" VisibleIndex="0">
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
                            <dxwgv:GridViewDataTextColumn FieldName="Satuan" VisibleIndex="2">
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
                            <dxwgv:GridViewDataComboBoxColumn Caption="Prioritas" FieldName="Guna" VisibleIndex="9">
                                <PropertiesComboBox ValueType="System.String">
                                    <Items>
                                        <dxe:ListEditItem Text="Utama" Value="Utama" />
                                        <dxe:ListEditItem Text="Pembantu" value="Pembantu" />
                                    </Items>
                                </PropertiesComboBox>
                            </dxwgv:GridViewDataComboBoxColumn>
                        </Columns>
                        <SettingsPager Mode="ShowAllRecords" />
                        <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter"
                            Mode="PopupEditForm" PopupEditFormWidth="400px" PopupEditFormModal="false" />
                    </dxwgv:ASPxGridView>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tenaga Penggerak">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="TenagaASPxTextBox" runat="server" Width="170px" Text='<%#Bind("TenagaPenggerak") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jenis Industri">
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
                        DataSourceID="TDIIDetailXpoDataSource" AutoGenerateColumns="False" KeyFieldName="TDIDetailID"
                        OnRowInserting="KLUIASPxGridView_RowInserting">
                        <SettingsBehavior AllowFocusedRow="true" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="TDIDetailID" ReadOnly="True" Visible="False"
                                VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="TDIID!Key" Visible="False" VisibleIndex="0">
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
            <asp:TemplateField HeaderText="Komoditi">
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
                        DataSourceID="TDIKomoditiXpoDataSource" KeyFieldName="KomoditiID" AutoGenerateColumns="False"
                        OnRowInserting="KomoditasASPxGridView_RowInserting">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="KomoditiID" ReadOnly="True" Visible="False"
                                VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="TDIID!Key" Visible="False" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Komoditi" VisibleIndex="0" Width="170px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Kapasitas" VisibleIndex="1" Width="170px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Satuan" VisibleIndex="2" Width="170px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataMemoColumn FieldName="KKI" VisibleIndex="3" Width="170px">
                            </dxwgv:GridViewDataMemoColumn>
                            <dxwgv:GridViewDataMemoColumn FieldName="Keterangan" VisibleIndex="3" Width="170px">
                            </dxwgv:GridViewDataMemoColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="true" />
                        <SettingsEditing PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormModal="true"
                            PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="500px" Mode="PopupEditForm" />
                    </dxwgv:ASPxGridView>
                    <%--<dxe:ASPxTextBox ID="KomoditiASPxTextBox" runat="server" Text='<%#Bind("Komoditi") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>--%>
                </EditItemTemplate>
            </asp:TemplateField>
            <%--<asp:TemplateField HeaderText="Kebutuhan bahan baku / Penolong ">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="Kapasitas terpasang, per Tahun">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="KapasitasPertahunASPxTextBox" runat="server" Text='<%#Bind("KapasitasProduksi") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jumlah Tenaga Kerja">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Indonesia">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pria">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PriaIndonesiaASPxTextBox" runat="server" Width="170px" Text='<%#Bind("TKIPria") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Wanita">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="WanitaIndonesiaASPxTextBox" runat="server" Width="170px" Text='<%#Bind("TKIWanita") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Asing">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Pria">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="PriaAsingASPxTextBox" runat="server" Width="170px" Text='<%#Bind("TKAsingPria") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Wanita">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="170px" Text='<%#Bind("TKAsingWanita") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Asset">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="AssetASPxTextBox" runat="server" Width="170px" Text='<%#Bind("Asset") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Investasi">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="InvestasiASPxTextBox" runat="server" Width="170px" Text='<%#Bind("Investasi") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Keterangan">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <dxe:ASPxMemo ID="KeteranganASPxMemo" runat="server" Width="170px" Text='<%#Bind("Keterangan") %>'>
                    </dxe:ASPxMemo>
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
                <ItemStyle CssClass="field" />
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
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
</asp:Content>
