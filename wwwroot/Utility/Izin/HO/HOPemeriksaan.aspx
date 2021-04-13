<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="HOPemeriksaan.aspx.vb" Inherits="Utility_Izin_HO_HOPemeriksaan" Title="HO Pemeriksaan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="permohonanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Permohonan"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID"></asp:SessionParameter>
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="HOPemeriksaanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.HOPemeriksaan"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="HOPemeriksaanDetailXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.HOPemeriksaanDetail"
        Criteria="[HOPemeriksaanID!Key] = ?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="HOPemeriksaanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="timPemeriksaXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.TimPemeriksa">
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="ASPxPopupControlGridTimPemeriksa" runat="server" Modal="true"
        HeaderText="Konfirmasi" ClientInstanceName="PopupTimPemeriksa" PopupHorizontalAlign="windowCenter"
        PopupVerticalAlign="windowCenter">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <center>
                    Anda Yakin Akan Menghapus Tim Pemeriksa?
                    <br />
                    <dxm:ASPxMenu ID="ASPxMenuTimPemeriksa" runat="Server" HorizontalAlign="center">
                        <Items>
                            <dxm:MenuItem Text="Ya" Name="Ya">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Tidak" Name="Tidak">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s,e){
                        if(e.item.name=='Ya')
                        {
                            detailGridView.DeleteRow(detailGridView.GetFocusedRowIndex());
                            PopupTimPemeriksa.HideWindow();
                        }
                        else
                           {
                            if(e.item.name=='Tidak')
                                {
                                    PopupTimPemeriksa.HideWindow();
                                }
                           }
                        }" />
                    </dxm:ASPxMenu>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
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
                <dxe:ASPxButton ID="searchASPxButton" runat="server" Text="Cari">
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
    <asp:DetailsView ID="HOPemeriksaanDetailsView" runat="server" DataSourceID="HOPemeriksaanXpoDataSource"
        DataKeyNames="HOPemeriksaanID" CssClass="dataprop" GridLines="None" AutoGenerateRows="false">
        <Fields>
            <asp:TemplateField HeaderText="Nomor Pemeriksaan : ">
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="nomorPemeriksaanASPxTextBox" runat="server" Text='<%# Bind("HOPemeriksaanNomor") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="nomorPemeriksaanASPxTextBox" runat="server" Text='<%# Bind("HOPemeriksaanNomor") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="nomorPemeriksaanASPxLabel" runat="server" Text='<%# Eval("HOPemeriksaanNomor") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Pemeriksaan : ">
                <InsertItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalPemeriksaanASPxDateEdit" runat="server" Date='<%# Bind("HOPemeriksaanTanggal") %>'
                        DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalPemeriksaanASPxDateEdit" runat="server" Date='<%# Bind("HOPemeriksaanTanggal") %>'
                        DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="tanggalPemeriksaanASPxLabel" runat="server" Text='<%# Eval("HOPemeriksaanTanggal","{0:D}") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tim Pemeriksa">
                <ItemTemplate>
                    <dxm:ASPxMenu ID="hoPemeriksaanDetailASPxMenu" runat="server">
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
                                        PopupTimPemeriksa.ShowWindow();
                                    }
                                }
                            }
                        }" />
                    </dxm:ASPxMenu>
                    <dxwgv:ASPxGridView ID="HOPemeriksaanDetailASPxGridView" runat="server" ClientInstanceName="detailGridView"
                        DataSourceID="HOPemeriksaanDetailXpoDataSource" KeyFieldName="HOPemeriksaanDetailID"
                        AutoGenerateColumns="false" Width="100%" OnRowInserting="HOPemeriksaanDetailASPxGridView_RowInserting">
                        <Columns>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Tim Pemeriksa" FieldName="TimPemeriksaID!Key"
                                VisibleIndex="0">
                                <PropertiesComboBox DataSourceID="timPemeriksaXpoDataSource" TextField="TimPemeriksaNama"
                                    ValueField="TimPemeriksaID" ValueType="System.String">
                                </PropertiesComboBox>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Instansi" FieldName="TimPemeriksaID!Key">
                                <EditFormSettings Caption="Edit Pemeriksa" Visible="False" />
                                <PropertiesComboBox DataSourceID="timPemeriksaXpoDataSource" TextField="TimPemeriksaInstansi"
                                    ValueField="TimPemeriksaID" ValueType="System.String">
                                </PropertiesComboBox>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <%--<dxwgv:GridViewDataComboBoxColumn Caption="NIP" FieldName="TimPemeriksaID!Key">
                                <EditFormSettings Visible="False" />
                                <PropertiesComboBox DataSourceID="timPemeriksaXpoDataSource" TextField="TimPemeriksaNIP"
                                    ValueField="TimPemeriksaID" ValueType="System.String">
                                </PropertiesComboBox>
                            </dxwgv:GridViewDataComboBoxColumn>--%>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="true" />
                        <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormModal="true"
                            PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter" />
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
                        <dxe:ASPxButton ID="editASPxButton" runat="server" Text="Edit" CommandName="Edit">
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
