<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="IUIBAP.aspx.vb" Inherits="Utility_Izin_IUIBAP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<dx:XpoDataSource ID="permohonanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Permohonan"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID"></asp:SessionParameter>
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="iuiPemeriksaanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IUIPemeriksaan"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="iuiPemeriksaanDetailXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IUIPemeriksaanDetail"
        Criteria="[IUIPemeriksaanID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="IUIPemeriksaanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="iuiBAPXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IUIBAP"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="timPemeriksaXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.TimPemeriksa">
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="notFoundASPxPopupControl" runat="server" ClientInstanceName="notFoundPopup"
        HeaderText="Peringatan" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <center>
                    Data IUI tidak ditemukan
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
    <h1>IUI BAP</h1>
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
    <asp:DetailsView ID="imbPemeriksaanDetailsView" runat="server" DataSourceID="iuiPemeriksaanXpoDataSource"
        DataKeyNames="IUIPemeriksaanID" CssClass="dataprop" GridLines="None" AutoGenerateRows="false">
        <Fields>
            <asp:TemplateField HeaderText="Nomor Pemeriksaan : ">
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="nomorPemeriksaanASPxTextBox" runat="server" Text='<%# Bind("IUIPemeriksaanNomor") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="nomorPemeriksaanASPxTextBox" runat="server" Text='<%# Bind("IUIPemeriksaanNomor") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="nomorPemeriksaanASPxLabel" runat="server" Text='<%# Eval("IUIPemeriksaanNomor") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Pemeriksaan : ">
                <InsertItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalPemeriksaanASPxDateEdit" runat="server" Date='<%# Bind("IUIPemeriksaanTanggal") %>' DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalPemeriksaanASPxDateEdit" runat="server" Date='<%# Bind("IUIPemeriksaanTanggal") %>' DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="tanggalPemeriksaanASPxLabel" runat="server" Text='<%# Eval("IUIPemeriksaanTanggal","{0:D}") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tim Pemeriksa">
                <ItemTemplate>
                    <dxwgv:ASPxGridView ID="iuiPemeriksaanDetailASPxGridView" runat="server" ClientInstanceName="detailGridView"
                        DataSourceID="iuiPemeriksaanDetailXpoDataSource" KeyFieldName="IUIPemeriksaanDetailID"
                        AutoGenerateColumns="false" Width="100%">
                        <Columns>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Tim Pemeriksa" FieldName="TimPemeriksaID!Key"
                                VisibleIndex="0">
                                <PropertiesComboBox DataSourceID="timPemeriksaXpoDataSource" TextField="TimPemeriksaNama"
                                    ValueField="TimPemeriksaID" ValueType="System.String">
                                </PropertiesComboBox>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Instansi" FieldName="TimPemeriksaID.TimPemeriksaInstansi">
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
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
        </Fields>
        <RowStyle CssClass="rowfield" />
        <FieldHeaderStyle CssClass="headerfield" />
    </asp:DetailsView>
    <br />
    <dxe:ASPxButton ID="buatBAPASPxButton" runat="server" Text="Buat BAP" Visible="false">
    </dxe:ASPxButton>
    <br />
    <asp:DetailsView ID="imbBAPDetailsView" runat="server" AutoGenerateRows="false" CssClass="dataprop" DataSourceID="iuiBAPXpoDataSource" DataKeyNames="IUIBAPID"
        GridLines="None">
        <Fields>
            <asp:TemplateField HeaderText="Nomer BAP : ">
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="nomerBAPASPxTextBox" runat="server" Width="170px" Text='<%# Bind("IUIBAPNomor") %>'>
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="nomerBAPASPxTextBox" runat="server" Width="170px" Text='<%# Bind("IUIBAPNomor") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="nomerBAPASPxLabel" runat="server" Text='<%# Eval("IUIBAPNomor") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Pemeriksaan : ">
                <InsertItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalBAPASPxDateEdit" runat="server" Date='<%# Bind("IUIBAPTanggal") %>' DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalBAPASPxDateEdit" runat="server" Date='<%# Bind("IUIBAPTanggal") %>' DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="tanggalBAPASPxLabel" runat="server" Text='<%# Eval("IUIBAPTanggal","{0:D}") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Catatan : ">
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="catatanASPxTextBox" runat="server" Text='<%# Bind("IUIBAPCatatan") %>' Width="300px">
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="catatanASPxTextBox" runat="server" Text='<%# Bind("IUIBAPCatatan") %>' Width="300px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="catatanASPxLabel" runat="server" Text='<%# Eval("IUIBAPCatatan") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rekomendasi : ">
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="rekomendasiASPxTextBox" runat="server" Text='<%# Bind("IUIBAPRekomendasi") %>' Width="300px">
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="rekomendasiASPxTextBox" runat="server" Text='<%# Bind("IUIBAPRekomendasi") %>' Width="300px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="rekomendasiASPxTextBox" runat="server" Text='<%# Eval("IUIBAPRekomendasi") %>' Width="300px">
                    </dxe:ASPxLabel>
                </ItemTemplate>
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
        <FieldHeaderStyle CssClass="headerfield" />
        <RowStyle CssClass="rowfield" />
    </asp:DetailsView>
</asp:Content>

