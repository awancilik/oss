<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="IMBRetribusi.aspx.vb" Inherits="Utility_Izin_IMBRetribusi" Title="IMB Retribusi" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <script language="javascript" type="text/javascript">
        function GridViewFocusedRow()
        {
            return RetribusiDetailsGridView.GetFocusedRowIndex();
        }
        function cekHargaDasar(text)
        {
            var x = text;
            if (x=='Umum')
            {
                colUmum.SetEnabled(true);
                colLain.SetEnabled(false);
            }
            else
            {
                colUmum.SetEnabled(false);
                colLain.SetEnabled(true);
            }
        }
    </script>

    <dx:XpoDataSource ID="RekeningDataSource" runat="server" TypeName="Bisnisobjek.OSS.Rekening">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="RetribusiListDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBRetribusi">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="RetribusiDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBRetribusi"
        Criteria="[Row_id] = ?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="Row_id" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="RetribusiDetailsDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBRetribusiDetails"
        Criteria="[RetribusiId] = ?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="row_id" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="PermohonanDataSource" runat="server" TypeName="Bisnisobjek.OSS.PermohonanDetail">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="HDUmumDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBkoef"
        Criteria="[Kategori] = 'Harga Dasar Bangunan Umum'">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="HDLainDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBkoef"
        Criteria="[Kategori] = 'Harga Dasar Bangunan Lain'">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KoefDaerahDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBkoef"
        Criteria="[Kategori] = 'Daerah'">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KelasJalanDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBkoef"
        Criteria="[Kategori] = 'Kelas Jalan'">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KelasBangunanDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBkoef"
        Criteria="[Kategori] = 'Kelas Bangunan'">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="StatusBangunanDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBkoef"
        Criteria="[Kategori] = 'Status Bangunan'">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="GunaBangunanDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBkoef"
        Criteria="[Kategori] = 'Guna Bangunan'">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="TingkatBangunanDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBkoef"
        Criteria="[Kategori] = 'Tingkat Bangunan'">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="LuasBangunanDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBkoef"
        Criteria="[Kategori] = 'Luas Bangunan'">
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="ConfirmPopup" runat="Server" PopupHorizontalAlign="windowCenter"
        PopupVerticalAlign="WindowCenter" Modal="true" HeaderText="Peringatan" ClientInstanceName="confirmPopup">
        <ContentCollection>
            <dxpc:PopupControlContentControl runat="server">
                <center>
                    Apakah Anda Yakin Ingin Menghapus?
                    <dxe:ASPxButton ID="confirmButton" runat="Server" Text="OK">
                        <ClientSideEvents Click="function(s,e){
                        RetribusiDetailsGridView.DeleteRow(GridViewFocusedRow());
                        RetribusiDetailsGridView.PerformCallback();
                        confirmPopup.HideWindow();
                    }" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <h1>
        IMB Retribusi</h1>
    <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
        <asp:View ID="ListView" runat="Server">
            <table>
                <tr>
                    <td>
                        <dxe:ASPxButton ID="NewBtn" runat="server" Text="Buat Retribusi" Width="75px">
                        </dxe:ASPxButton>
                    </td>
                    <td>
                        <dxe:ASPxButton ID="EditBtn" runat="server" Text="Rubah Retribusi" Width="75px">
                        </dxe:ASPxButton>
                    </td>
                </tr>
            </table>
            <dxwgv:ASPxGridView ID="RetribusiListGridView" runat="server" AutoGenerateColumns="False"
                DataSourceID="RetribusiListDataSource" KeyFieldName="Row_id" Width="100%" Paddings-PaddingTop="10px">
                <Columns>
                    <dxwgv:GridViewDataDateColumn FieldName="TglPembayaran" VisibleIndex="0">
                    </dxwgv:GridViewDataDateColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="Row_id" ReadOnly="True" Visible="False"
                        VisibleIndex="0">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="imbid!Key" Visible="False" VisibleIndex="0">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="imbid!.permohonanID!.NomorPermohonan" Visible="true"
                        VisibleIndex="0" Caption="Nomor Permohonan">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="Retribusi" Visible="False" VisibleIndex="0">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="PapanNama" VisibleIndex="1">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="Leges" VisibleIndex="2">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataDateColumn FieldName="JatuhTempo" Visible="False" VisibleIndex="2">
                    </dxwgv:GridViewDataDateColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="Denda" Visible="False" VisibleIndex="2">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="Terbilang" Visible="False" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn FieldName="Keterangan" VisibleIndex="3">
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" />
            </dxwgv:ASPxGridView>
        </asp:View>
        <asp:View ID="EditorView" runat="Server">
            <asp:DetailsView ID="RetribusiDetailsView" runat="server" Width="100%" DataSourceID="RetribusiDataSource"
                AutoGenerateRows="False" DataKeyNames="Row_id" CssClass="dataprop" GridLines="none">
                <Fields>
                    <asp:TemplateField ShowHeader="False">
                        <InsertItemTemplate>
                            <ul class="clearfix">
                                <li>
                                    <asp:LinkButton ID="AddLinkButton" runat="server" CommandName="Insert" CausesValidation="true"
                                        CssClass="tb_itm">
                                        <asp:Image ID="AddImage" ImageUrl="~/gambar/Toolbar/add.gif" runat="server" />
                                        <spann>Save</spann>
                                    </asp:LinkButton>
                                </li>
                                <li><span class="tb_sep">|</span> </li>
                                <li>
                                    <asp:LinkButton ID="BackLinkButton" runat="server" CommandName="Back" CausesValidation="false"
                                        CssClass="tb_itm">
                                        <asp:Image ID="BackImage" ImageUrl="~/gambar/Toolbar/back.gif" runat="server" />
                                        <span>Back</span>
                                    </asp:LinkButton>
                                </li>
                            </ul>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <ul class="clearfix">
                                <li>
                                    <asp:LinkButton ID="CancelLinkButton" runat="server" CommandName="Cancel" CausesValidation="false"
                                        CssClass="tb_itm">
                                        <asp:Image ID="CancelImage" ImageUrl="~/gambar/Toolbar/undo.gif" runat="server" />
                                        <span>Cancel</span>
                                    </asp:LinkButton>
                                </li>
                            </ul>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <ul>
                                <li>
                                    <asp:LinkButton ID="BackLinkButton" runat="server" CommandName="Back" CausesValidation="false"
                                        CssClass="tb_itm">
                                        <asp:Image ID="BackImage" ImageUrl="~/gambar/Toolbar/back.gif" runat="server" />
                                        <span>Back</span>
                                    </asp:LinkButton>
                                </li>
                            </ul>
                        </ItemTemplate>
                        <ItemStyle CssClass="toolbar" />
                        <HeaderStyle CssClass="headerfield" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Permohonan">
                        <ItemTemplate>
                            <dxe:ASPxLabel ID="PermohonanLabel" runat="server">
                            </dxe:ASPxLabel>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:HiddenField ID="PermohonanHiddenField" runat="server" Value='<%# Bind("imbid") %>' />
                            <table>
                                <tr>
                                    <td>
                                        <dxe:ASPxTextBox ID="searchNomerPermohonanASPxTextBox" runat="server" Width="250px">
                                        </dxe:ASPxTextBox>
                                    </td>
                                    <td>
                                        <dxe:ASPxButton ID="searchASPxButton" runat="server" Text="Cari" OnClick="searchASPxButton_Click">
                                        </dxe:ASPxButton>
                                    </td>
                                    <td>
                                        <dxe:ASPxLabel ID="MessageLabel" runat="server" Text="Jenis Izin belum ditentukan">
                                        </dxe:ASPxLabel>
                                    </td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <dxe:ASPxLabel ID="PermohonanLabel" runat="server">
                            </dxe:ASPxLabel>
                        </EditItemTemplate>
                        <ItemStyle CssClass="field" />
                        <HeaderStyle CssClass="headerfield" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Papan Nama">
                        <ItemTemplate>
                            <dxe:ASPxLabel ID="PapanNamaLabel" runat="server" Text='<%# Eval("PapanNama") %>'>
                            </dxe:ASPxLabel>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <dxe:ASPxTextBox ID="PapanNamaTextBox" runat="server" Text='<%# Bind("PapanNama") %>'
                                NullText="0" Width="170px">
                            </dxe:ASPxTextBox>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <dxe:ASPxTextBox ID="PapanNamaTextBox" runat="server" Text='<%# Bind("PapanNama") %>'
                                Width="170px">
                            </dxe:ASPxTextBox>
                        </EditItemTemplate>
                        <ItemStyle CssClass="field" />
                        <HeaderStyle CssClass="headerfield" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Leges">
                        <ItemTemplate>
                            <dxe:ASPxLabel ID="LegesLabel" runat="server" Text='<%# Eval("Leges") %>'>
                            </dxe:ASPxLabel>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <dxe:ASPxTextBox ID="LegesTextBox" runat="server" Text='<%# Bind("Leges") %>' NullText="0"
                                Width="170px">
                            </dxe:ASPxTextBox>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <dxe:ASPxTextBox ID="LegesTextBox" runat="server" Text='<%# Bind("Leges") %>' Width="170px">
                            </dxe:ASPxTextBox>
                        </EditItemTemplate>
                        <ItemStyle CssClass="field" />
                        <HeaderStyle CssClass="headerfield" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Keterangan">
                        <ItemTemplate>
                            <dxe:ASPxLabel ID="KeteranganLabel" runat="server" Text='<%# Eval("Keterangan") %>'>
                            </dxe:ASPxLabel>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <dxe:ASPxTextBox ID="KeteranganTextBox" runat="server" Text='<%# Bind("Keterangan") %>'
                                Width="170px">
                            </dxe:ASPxTextBox>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <dxe:ASPxTextBox ID="KeteranganTextBox" runat="server" Text='<%# Bind("Keterangan") %>'
                                Width="170px">
                            </dxe:ASPxTextBox>
                        </EditItemTemplate>
                        <ItemStyle CssClass="field" />
                        <HeaderStyle CssClass="headerfield" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Koefisien Daerah">
                        <ItemTemplate>
                            <dxe:ASPxLabel ID="DaerahLabel" runat="server" Text='<%# Eval("Daerah") %>'>
                            </dxe:ASPxLabel>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:HiddenField ID="DaerahHiddenField" runat="server" Value='<%# Bind("Daerah") %>' />
                            <dxe:ASPxComboBox ID="DaerahComboBox" runat="server" DataSourceID="KoefDaerahDataSource"
                                ValueField="Koefisien" TextField="JenisKategori">
                            </dxe:ASPxComboBox>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <dxe:ASPxTextBox ID="DaerahTextBox" runat="server" Text='<%# Bind("Daerah") %>' Width="170px">
                            </dxe:ASPxTextBox>
                        </EditItemTemplate>
                        <ItemStyle CssClass="field" />
                        <HeaderStyle CssClass="headerfield" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Koefisien Kelas Jalan">
                        <ItemTemplate>
                            <dxe:ASPxLabel ID="KelasJalanLabel" runat="server" Text='<%# Eval("KelasJalan") %>'>
                            </dxe:ASPxLabel>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:HiddenField ID="KelasJalanHiddenField" runat="server" Value='<%# Bind("KelasJalan") %>' />
                            <dxe:ASPxComboBox ID="KelasJalanComboBox" runat="server" DataSourceID="KelasJalanDataSource"
                                ValueField="Koefisien" TextField="JenisKategori">
                            </dxe:ASPxComboBox>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <dxe:ASPxTextBox ID="KelasJalanTextBox" runat="server" Text='<%# Bind("KelasJalan") %>'
                                Width="170px">
                            </dxe:ASPxTextBox>
                        </EditItemTemplate>
                        <ItemStyle CssClass="field" />
                        <HeaderStyle CssClass="headerfield" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Koefisien Kelas Bangunan">
                        <ItemTemplate>
                            <dxe:ASPxLabel ID="KelasBangunanLabel" runat="server" Text='<%# Eval("KelasBangunan") %>'>
                            </dxe:ASPxLabel>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:HiddenField ID="KelasBangunanHiddenField" runat="server" Value='<%# Bind("KelasBangunan") %>' />
                            <dxe:ASPxComboBox ID="KelasBangunanComboBox" runat="server" DataSourceID="KelasBangunanDataSource"
                                ValueField="Koefisien" TextField="JenisKategori">
                            </dxe:ASPxComboBox>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <dxe:ASPxTextBox ID="KelasBangunanTextBox" runat="server" Text='<%# Bind("KelasBangunan") %>'
                                Width="170px">
                            </dxe:ASPxTextBox>
                        </EditItemTemplate>
                        <ItemStyle CssClass="field" />
                        <HeaderStyle CssClass="headerfield" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Koefisien Status Bangunan">
                        <ItemTemplate>
                            <dxe:ASPxLabel ID="StatusBangunanLabel" runat="server" Text='<%# Eval("StatusBangunan") %>'>
                            </dxe:ASPxLabel>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:HiddenField ID="StatusBangunanHiddenField" runat="server" Value='<%# Bind("StatusBangunan") %>' />
                            <dxe:ASPxComboBox ID="StatusBangunanComboBox" runat="server" DataSourceID="StatusBangunanDataSource"
                                ValueField="Koefisien" TextField="JenisKategori">
                            </dxe:ASPxComboBox>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <dxe:ASPxTextBox ID="StatusBangunanTextBox" runat="server" Text='<%# Bind("StatusBangunan") %>'
                                Width="170px">
                            </dxe:ASPxTextBox>
                        </EditItemTemplate>
                        <ItemStyle CssClass="field" />
                        <HeaderStyle CssClass="headerfield" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Koefisien Guna Bangunan">
                        <ItemTemplate>
                            <dxe:ASPxLabel ID="GunaBangunanLabel" runat="server" Text='<%# Eval("GunaBangunan") %>'>
                            </dxe:ASPxLabel>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:HiddenField ID="GunaBangunanHiddenField" runat="server" Value='<%# Bind("GunaBangunan") %>' />
                            <dxe:ASPxComboBox ID="GunaBangunanComboBox" runat="server" DataSourceID="GunaBangunanDataSource"
                                ValueField="Koefisien" TextField="JenisKategori">
                            </dxe:ASPxComboBox>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <dxe:ASPxTextBox ID="GunaBangunanTextBox" runat="server" Text='<%# Bind("GunaBangunan") %>'
                                Width="170px">
                            </dxe:ASPxTextBox>
                        </EditItemTemplate>
                        <ItemStyle CssClass="field" />
                        <HeaderStyle CssClass="headerfield" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Koefisien Tingkat Bangunan">
                        <ItemTemplate>
                            <dxe:ASPxLabel ID="TingkatBangunanLabel" runat="server" Text='<%# Eval("TingkatBangunan") %>'>
                            </dxe:ASPxLabel>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:HiddenField ID="TingkatBangunanHiddenField" runat="server" Value='<%# Bind("TingkatBangunan") %>' />
                            <dxe:ASPxComboBox ID="TingkatBangunanComboBox" runat="server" DataSourceID="TingkatBangunanDataSource"
                                ValueField="Koefisien" TextField="JenisKategori">
                            </dxe:ASPxComboBox>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <dxe:ASPxTextBox ID="TingkatBangunanTextBox" runat="server" Text='<%# Bind("TingkatBangunan") %>'
                                Width="170px">
                            </dxe:ASPxTextBox>
                        </EditItemTemplate>
                        <ItemStyle CssClass="field" />
                        <HeaderStyle CssClass="headerfield" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Koefisien Luas Bangunan">
                        <ItemTemplate>
                            <dxe:ASPxLabel ID="LuasBangunanLabel" runat="server" Text='<%# Eval("LuasBangunan") %>'>
                            </dxe:ASPxLabel>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:HiddenField ID="LuasBangunanHiddenField" runat="server" Value='<%# Bind("LuasBangunan") %>' />
                            <dxe:ASPxComboBox ID="LuasBangunanComboBox" runat="server" DataSourceID="LuasBangunanDataSource"
                                ValueField="Koefisien" TextField="JenisKategori">
                            </dxe:ASPxComboBox>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <dxe:ASPxTextBox ID="LuasBangunanTextBox" runat="server" Text='<%# Bind("LuasBangunan") %>'
                                Width="170px">
                            </dxe:ASPxTextBox>
                        </EditItemTemplate>
                        <ItemStyle CssClass="field" />
                        <HeaderStyle CssClass="headerfield" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Retribusi">
                        <ItemTemplate>
                            <dxe:ASPxLabel ID="RetribusiLabel" runat="server" Text='<%# Eval("Retribusi") %>'>
                            </dxe:ASPxLabel>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:HiddenField ID="RetribusiHiddenField" runat="server" Value='<%# Bind("Retribusi") %>' />
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <dxe:ASPxLabel ID="RetribusiLabel" runat="server" Text='<%# Eval("Retribusi") %>'>
                            </dxe:ASPxLabel>
                        </EditItemTemplate>
                        <ItemStyle CssClass="field" />
                        <HeaderStyle CssClass="headerfield" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Rincian Retribusi">
                        <ItemTemplate>
                            <dxm:ASPxMenu ID="ASPxMenu" runat="server" ClientInstanceName="Menu">
                                <ClientSideEvents ItemClick="function(s, e)
                                {
                                    if (e.item.name=='New')
                                    {
                                        RetribusiDetailsGridView.AddNewRow();
                                    }
                                    else
                                    {
                                        if (e.item.name=='Edit')
                                        {
                                            RetribusiDetailsGridView.StartEditRow(GridViewFocusedRow());
                                        }
                                        else
                                        {
                                            if (e.item.name=='Delete')
                                            {
                                                confirmPopup.ShowWindow();
                                            }
                                        }
                                    }
                                }" />
                                <Items>
                                    <dxm:MenuItem Text="New" Name="New" />
                                    <dxm:MenuItem Text="Edit" Name="Edit" />
                                    <dxm:MenuItem Text="Delete" Name="Delete" />
                                </Items>
                            </dxm:ASPxMenu>
                            <dxwgv:ASPxGridView ID="RetribusiDetailsGridView" DataSourceID="RetribusiDetailsDataSource"
                                AutoGenerateColumns="False" KeyFieldName="Row_id" ClientInstanceName="RetribusiDetailsGridView"
                                OnRowInserting="RetribusiDetailsGridView_RowInserting" runat="server">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn FieldName="Row_id" ReadOnly="True" Visible="False"
                                        VisibleIndex="0">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Nama Bangunan" FieldName="NamaBangunan" VisibleIndex="0">
                                        <PropertiesTextEdit>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="true" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataColumn Caption="Pilih Harga Dasar" Name="colPilihHD" VisibleIndex="0">
                                        <EditItemTemplate>
                                            <dxe:ASPxComboBox ID="cbPilihHargaDasar" runat="Server" ClientInstanceName="cbPilihHargaDasar">
                                                <Items>
                                                    <dxe:ListEditItem Text="Harga Dasar Umum" Value="Umum" />
                                                    <dxe:ListEditItem Text="Harga Dasar Lain" Value="Lain" />
                                                </Items>
                                                <ClientSideEvents SelectedIndexChanged="function(s,e){
                                                cekHargaDasar(cbPilihHargaDasar.GetValue());
                                                }" />
                                            </dxe:ASPxComboBox>
                                        </EditItemTemplate>
                                    </dxwgv:GridViewDataColumn>
                                    <dxwgv:GridViewDataComboBoxColumn Caption="Harga Dasar Umum" FieldName="HDUmum" VisibleIndex="1">
                                        <PropertiesComboBox DataSourceID="HDUmumDataSource" TextField="JenisKategori" ValueField="Koefisien"
                                            ValueType="System.String" ClientInstanceName="colUmum">
                                            <ClientSideEvents Init="function(s,e){
                                                    colUmum.SetEnabled(false);
                                                }" />
                                        </PropertiesComboBox>
                                    </dxwgv:GridViewDataComboBoxColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Luas Bangunan" FieldName="HDUmumJML" VisibleIndex="3">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataComboBoxColumn Caption="Harga Dasar Lain" FieldName="HDLain" VisibleIndex="2">
                                        <PropertiesComboBox DataSourceID="HDLainDataSource" TextField="JenisKategori" ValueField="Koefisien"
                                            ValueType="System.String" ClientInstanceName="colLain">
                                            <ClientSideEvents Init="function(s,e){
                                                colLain.SetEnabled(false);
                                            }" />
                                        </PropertiesComboBox>
                                    </dxwgv:GridViewDataComboBoxColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Jumlah" FieldName="HDLainJML" VisibleIndex="4">
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSort="False" AllowFocusedRow="True"/>
                                <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="windowCenter"
                                    PopupEditFormVerticalAlign="WindowCenter" PopupEditFormModal="true" PopupEditFormWidth="100px"
                                    EditFormColumnCount="1" PopupEditFormShowHeader="false"/>
                            </dxwgv:ASPxGridView>
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <dxwgv:ASPxGridView ID="RetribusiDetailsGridView" DataSourceID="RetribusiDetailsDataSource"
                                AutoGenerateColumns="False" KeyFieldName="Row_id" ClientInstanceName="RetribusiDetailsGridView"
                                OnRowInserting="RetribusiDetailsGridView_RowInserting" runat="server">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn FieldName="Row_id" ReadOnly="True" Visible="False"
                                        VisibleIndex="0">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Nama Bangunan" FieldName="NamaBangunan" VisibleIndex="0">
                                        <PropertiesTextEdit>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="true" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                    </dxwgv:GridViewDataTextColumn>
                                     <dxwgv:GridViewDataColumn Caption="Pilih Harga Dasar" Name="colPilihHD" VisibleIndex="0">
                                        <EditItemTemplate>
                                            <dxe:ASPxComboBox ID="cbPilihHargaDasar" runat="Server" ClientInstanceName="cbPilihHargaDasar">
                                                <Items>
                                                    <dxe:ListEditItem Text="Harga Dasar Umum" Value="Umum" />
                                                    <dxe:ListEditItem Text="Harga Dasar Lain" Value="Lain" />
                                                </Items>
                                                <ClientSideEvents SelectedIndexChanged="function(s,e){
                                                cekHargaDasar(cbPilihHargaDasar.GetValue());
                                                }" />
                                            </dxe:ASPxComboBox>
                                        </EditItemTemplate>
                                    </dxwgv:GridViewDataColumn>
                                    <dxwgv:GridViewDataComboBoxColumn Caption="Harga Dasar Umum" FieldName="HDUmum" VisibleIndex="2">
                                        <PropertiesComboBox DataSourceID="HDUmumDataSource" TextField="JenisKategori" ValueField="Koefisien"
                                            ValueType="System.String" ClientInstanceName="colUmum">
                                        </PropertiesComboBox>
                                    </dxwgv:GridViewDataComboBoxColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Luas Bangunan" FieldName="HDUmumJML" VisibleIndex="4">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataComboBoxColumn Caption="Harga Dasar Lain" FieldName="HDLain" VisibleIndex="3">
                                        <PropertiesComboBox DataSourceID="HDLainDataSource" TextField="JenisKategori" ValueField="Koefisien"
                                            ValueType="System.String" ClientInstanceName="colLain">
                                        </PropertiesComboBox>
                                    </dxwgv:GridViewDataComboBoxColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Jumlah" FieldName="HDLainJML" VisibleIndex="5">
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowSort="False" AllowFocusedRow="True" />
                            </dxwgv:ASPxGridView>
                        </InsertItemTemplate>
                        <EditItemTemplate>
                            <dxwgv:ASPxGridView ID="RetribusiDetailsGridView" DataSourceID="RetribusiDetailsDataSource"
                                AutoGenerateColumns="False" KeyFieldName="Row_id" ClientInstanceName="RetribusiDetailsGridView"
                                OnRowInserting="RetribusiDetailsGridView_RowInserting" runat="server">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn FieldName="Row_id" ReadOnly="True" Visible="False"
                                        VisibleIndex="0">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Nama Bangunan" FieldName="NamaBangunan" VisibleIndex="0">
                                        <PropertiesTextEdit>
                                            <ValidationSettings>
                                                <RequiredField IsRequired="true" />
                                            </ValidationSettings>
                                        </PropertiesTextEdit>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataComboBoxColumn Caption="Harga Dasar Umum" FieldName="HDUmum" VisibleIndex="1">
                                        <PropertiesComboBox DataSourceID="HDUmumDataSource" TextField="JenisKategori" ValueField="Koefisien"
                                            ValueType="System.String">
                                        </PropertiesComboBox>
                                    </dxwgv:GridViewDataComboBoxColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Luas Bangunan" FieldName="HDUmumJML" VisibleIndex="2">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataComboBoxColumn Caption="Harga Dasar Lain" FieldName="HDLain" VisibleIndex="3">
                                        <PropertiesComboBox DataSourceID="HDLainDataSource" TextField="JenisKategori" ValueField="Koefisien"
                                            ValueType="System.String">
                                        </PropertiesComboBox>
                                    </dxwgv:GridViewDataComboBoxColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Jumlah" FieldName="HDLainJML" VisibleIndex="4">
                                    </dxwgv:GridViewDataTextColumn>
                                    <%--<dxwgv:GridViewDataComboBoxColumn Caption="Daerah" FieldName="Daerah" VisibleIndex="5">
                                        <PropertiesComboBox DataSourceID="KoefDaerahDataSource" TextField="JenisKategori"
                                            ValueField="Koefisien" ValueType="System.String">
                                        </PropertiesComboBox>
                                    </dxwgv:GridViewDataComboBoxColumn>
                                    <dxwgv:GridViewDataComboBoxColumn Caption="Kelas Jalan" FieldName="KelasJalan" VisibleIndex="6">
                                        <PropertiesComboBox DataSourceID="KelasJalanDataSource" TextField="JenisKategori"
                                            ValueField="Koefisien" ValueType="System.String">
                                        </PropertiesComboBox>
                                    </dxwgv:GridViewDataComboBoxColumn>
                                    <dxwgv:GridViewDataComboBoxColumn Caption="Kelas Bangunan" FieldName="KelasBangunan"
                                        VisibleIndex="7">
                                        <PropertiesComboBox DataSourceID="KelasJalanDataSource" TextField="JenisKategori"
                                            ValueField="Koefisien" ValueType="System.String">
                                        </PropertiesComboBox>
                                    </dxwgv:GridViewDataComboBoxColumn>
                                    <dxwgv:GridViewDataComboBoxColumn Caption="Status Bangunan" FieldName="StatusBangunan"
                                        VisibleIndex="8">
                                        <PropertiesComboBox DataSourceID="StatusBangunanDataSource" TextField="JenisKategori"
                                            ValueField="Koefisien" ValueType="System.String">
                                        </PropertiesComboBox>
                                    </dxwgv:GridViewDataComboBoxColumn>
                                    <dxwgv:GridViewDataComboBoxColumn Caption="Guna Bangunan" FieldName="GunaBangunan"
                                        VisibleIndex="9">
                                        <PropertiesComboBox DataSourceID="GunaBangunanDataSource" TextField="JenisKategori"
                                            ValueField="Koefisien" ValueType="System.String">
                                        </PropertiesComboBox>
                                    </dxwgv:GridViewDataComboBoxColumn>
                                    <dxwgv:GridViewDataComboBoxColumn Caption="Tingkat Bangunan" FieldName="TingkatBangunan"
                                        VisibleIndex="10">
                                        <PropertiesComboBox DataSourceID="TingkatBangunanDataSource" TextField="JenisKategori"
                                            ValueField="Koefisien" ValueType="System.String">
                                        </PropertiesComboBox>
                                    </dxwgv:GridViewDataComboBoxColumn>
                                    <dxwgv:GridViewDataComboBoxColumn Caption="Luas Bangunan" FieldName="LuasBangunan"
                                        VisibleIndex="11">
                                        <PropertiesComboBox DataSourceID="LuasBangunanDataSource" TextField="JenisKategori"
                                            ValueField="Koefisien" ValueType="System.String">
                                        </PropertiesComboBox>
                                    </dxwgv:GridViewDataComboBoxColumn>--%>
                                </Columns>
                                <SettingsBehavior AllowSort="False" AllowFocusedRow="true" />
                            </dxwgv:ASPxGridView>
                        </EditItemTemplate>
                        <ItemStyle CssClass="field" />
                        <HeaderStyle CssClass="headerfield" />
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
        </asp:View>
    </asp:MultiView>
</asp:Content>
