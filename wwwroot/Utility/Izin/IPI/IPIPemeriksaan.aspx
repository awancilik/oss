<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="IPIPemeriksaan.aspx.vb" Inherits="Utility_Izin_IPI_IPIPemeriksaan"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="permohonanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Permohonan"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID"></asp:SessionParameter>
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IPIPemeriksaanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IPIPemeriksaan"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IPIPemeriksaanDetailXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IPIPemeriksaanDetail"
        Criteria="[IPIPemeriksaanID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="IPIPemeriksaanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="timPemeriksaXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.TimPemeriksa">
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="notFoundASPxPopupControl" runat="server" ClientInstanceName="notFoundPopup"
        HeaderText="Peringatan" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <center>
                    Data IPI tidak ditemukan
                    <dxe:ASPxButton ID="closeASPxButton" runat="server" Text="Tutup">
                        <ClientSideEvents Click="function(s, e)
                    {
                        notFoundPopup.HideWindow();
                    }" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <h1>
        Pemeriksaan Izin Perluasan Industri</h1>
    <table>
        <tr>
            <td>
                Masukkan Nomer Permohonan :
            </td>
            <td>
                <dxe:ASPxTextBox ID="searchNomerPermohonanASPxTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="searchASPxButton" runat="server" Text="Tampil">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
    <br />
    <asp:DetailsView ID="permohonanDetailsView" runat="server" DataSourceID="permohonanXpoDataSource"
        DataKeyNames="PermohonanID" CssClass="dataprop" GridLines="None" AutoGenerateRows="false">
        <Fields>
            <asp:TemplateField HeaderText="Nomor Permohonan">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="nomorPermohonanASPxLabel" runat="server" Text='<%# Eval("NomorPermohonan") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nama Pemohon">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="namaPemohonASPxLabel" runat="server" Text='<%# Eval("PemohonNama") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
        </Fields>
        <FieldHeaderStyle CssClass="headerfield" />
        <RowStyle CssClass="rowfield" />
    </asp:DetailsView>
    <br />
    <dxe:ASPxButton ID="bikinASPxButton" runat="server" Text="Buat Surat Pemeriksaan"
        Visible="false">
    </dxe:ASPxButton>
    <br />
    <asp:DetailsView ID="IPIPemeriksaanDetailsView" runat="server" DataSourceID="IPIPemeriksaanXpoDataSource"
        DataKeyNames="IPIPemeriksaanID" CssClass="dataprop" GridLines="None" AutoGenerateRows="false">
        <Fields>
            <asp:TemplateField HeaderText="Nomor Pemeriksaan : ">
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="nomorPemeriksaanASPxTextBox" runat="server" Text='<%# Bind("IPIPemeriksaanNomor") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="nomorPemeriksaanASPxTextBox" runat="server" Text='<%# Bind("IPIPemeriksaanNomor") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="nomorPemeriksaanASPxLabel" runat="server" Text='<%# Eval("IPIPemeriksaanNomor") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Pemeriksaan : ">
                <InsertItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalPemeriksaanASPxDateEdit" runat="server" Date='<%# Bind("IPIPemeriksaanTanggal") %>'
                        DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalPemeriksaanASPxDateEdit" runat="server" Date='<%# Bind("IPIPemeriksaanTanggal") %>'
                        DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="tanggalPemeriksaanASPxLabel" runat="server" Text='<%# Eval("IPIPemeriksaanTanggal","{0:D}") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tim Pemeriksa">
                <ItemTemplate>
                    <dxm:ASPxMenu ID="IPIPemeriksaanDetailASPxMenu" runat="server">
                        <Items>
                            <dxm:MenuItem Text="Tambah" Name="New">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Ganti" Name="Edit">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Hapus" Name="Delete">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e)
                        {
                            if (e.item.name=='New')
                            {
                            detailGridView.AddNewRow();
                            }
                            else
                            {
                                if (e.item.name=='Edit')
                                {
                                    detailGridView.StartEditRow(detailGridView.GetFocusedRowIndex());
                                }
                                else
                                {
                                    if (e.item.name=='Delete')
                                    {
                                        detailGridView.DeleteRow(detailGridView.GetFocusedRowIndex());
                                    }
                                }
                            }
                        }" />
                    </dxm:ASPxMenu>
                    <dxwgv:ASPxGridView ID="IPIPemeriksaanDetailASPxGridView" runat="server" ClientInstanceName="detailGridView"
                        DataSourceID="IPIPemeriksaanDetailXpoDataSource" KeyFieldName="IPIPemeriksaanDetailID"
                        AutoGenerateColumns="False" Width="100%" OnRowInserting="IPIPemeriksaanDetailASPxGridView_RowInserting">
                        <Columns>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Tim Pemeriksa" FieldName="TimPemeriksaID!Key"
                                VisibleIndex="0">
                                <PropertiesComboBox DataSourceID="timPemeriksaXpoDataSource" TextField="TimPemeriksaNama"
                                    ValueField="TimPemeriksaID" ValueType="System.String">
                                </PropertiesComboBox>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Instansi" FieldName="TimPemeriksaID!Key">
                                <EditFormSettings Visible="False" />
                                <PropertiesComboBox DataSourceID="timPemeriksaXpoDataSource" TextField="TimPemeriksaInstansi"
                                    ValueField="TimPemeriksaID" ValueType="System.String">
                                </PropertiesComboBox>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="NIP" FieldName="TimPemeriksaID!Key">
                                <EditFormSettings Visible="False" />
                                <PropertiesComboBox DataSourceID="timPemeriksaXpoDataSource" TextField="TimPemeriksaNIP"
                                    ValueField="TimPemeriksaID" ValueType="System.String">
                                </PropertiesComboBox>
                            </dxwgv:GridViewDataComboBoxColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormModal="True"
                            PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter" />
                        <SettingsText CommandUpdate="Simpan" CommandCancel="Batal" PopupEditFormCaption="Data Tim Pemeriksa" />
                    </dxwgv:ASPxGridView>
                </ItemTemplate>
                <EditItemTemplate>
                </EditItemTemplate>
                <InsertItemTemplate>
                </InsertItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField>
                <InsertItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="insertASPxButton" runat="server" Text="Simpan" CommandName="Insert">
                        </dxe:ASPxButton>
                    </div>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="cancelASPxButton" runat="server" Text="Batal" CommandName="Cancel">
                        </dxe:ASPxButton>
                    </div>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="updateASPxButton" runat="server" Text="Simpan" CommandName="Update">
                        </dxe:ASPxButton>
                    </div>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="cancelASPxButton" runat="server" Text="Batal" CommandName="Cancel">
                        </dxe:ASPxButton>
                    </div>
                </EditItemTemplate>
                <ItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="editASPxButton" runat="server" Text="Ganti" CommandName="Edit">
                        </dxe:ASPxButton>
                    </div>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
        </Fields>
        <RowStyle CssClass="rowfield" />
        <FieldHeaderStyle CssClass="headerfield" />
    </asp:DetailsView>
</asp:Content>
