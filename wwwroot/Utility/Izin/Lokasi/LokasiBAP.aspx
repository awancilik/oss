<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="LokasiBAP.aspx.vb" Inherits="Utility_Izin_LokasiBAP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="permohonanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Permohonan"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID"></asp:SessionParameter>
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="LokasiPemeriksaanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.LokasiPemeriksaan"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="LokasiPemeriksaanDetailXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.LokasiPemeriksaanDetail"
        Criteria="[LokasiPemeriksaanID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="LokasiPemeriksaanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="LokasiBAPXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.LokasiBAP"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="timPemeriksaXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.TimPemeriksa">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="LokasiBAPDetailXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.LokasiBAPDetail"
        Criteria="[LokasiBAPID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="LokasiBAPID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="notFoundASPxPopupControl" runat="server" ClientInstanceName="notFoundPopup"
        HeaderText="Peringatan" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <center>
                    Data Lokasi tidak ditemukan
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
    <table>
        <tr>
            <h1>
                Lokasi BAP</h1>
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
    <asp:DetailsView ID="LokasiPemeriksaanDetailsView" runat="server" DataSourceID="LokasiPemeriksaanXpoDataSource"
        DataKeyNames="LokasiPemeriksaanID" CssClass="dataprop" GridLines="None" AutoGenerateRows="false">
        <Fields>
            <asp:TemplateField HeaderText="Nomor Pemeriksaan : ">
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="nomorPemeriksaanASPxTextBox" runat="server" Text='<%# Bind("LokasiPemeriksaanNomor") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="nomorPemeriksaanASPxTextBox" runat="server" Text='<%# Bind("LokasiPemeriksaanNomor") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="nomorPemeriksaanASPxLabel" runat="server" Text='<%# Eval("LokasiPemeriksaanNomor") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Pemeriksaan : ">
                <InsertItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalPemeriksaanASPxDateEdit" runat="server" Date='<%# Bind("LokasiPemeriksaanTanggal") %>'
                        DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalPemeriksaanASPxDateEdit" runat="server" Date='<%# Bind("LokasiPemeriksaanTanggal") %>'
                        DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="tanggalPemeriksaanASPxLabel" runat="server" Text='<%# Eval("LokasiPemeriksaanTanggal","{0:D}") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tim Pemeriksa">
                <ItemTemplate>
                    <dxwgv:ASPxGridView ID="LokasiPemeriksaanDetailASPxGridView" runat="server" ClientInstanceName="detailGridView"
                        DataSourceID="LokasiPemeriksaanDetailXpoDataSource" KeyFieldName="LokasiPemeriksaanDetailID"
                        AutoGenerateColumns="false" Width="100%">
                        <Columns>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Tim Pemeriksa" FieldName="TimPemeriksaID!Key"
                                VisibleIndex="0">
                                <PropertiesComboBox DataSourceID="timPemeriksaXpoDataSource" TextField="TimPemeriksaNama"
                                    ValueField="TimPemeriksaID" ValueType="System.String">
                                </PropertiesComboBox>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Instansi" FieldName="TimPemeriksaID!Key"
                                VisibleIndex="0">
                                <PropertiesComboBox DataSourceID="timPemeriksaXpoDataSource" TextField="TimPemeriksaInstansi"
                                    ValueField="TimPemeriksaID" ValueType="System.String">
                                </PropertiesComboBox>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="NIP" FieldName="TimPemeriksaID!Key" VisibleIndex="0">
                                <PropertiesComboBox DataSourceID="timPemeriksaXpoDataSource" TextField="TimPemeriksaNIP"
                                    ValueField="TimPemeriksaID" ValueType="System.String">
                                </PropertiesComboBox>
                            </dxwgv:GridViewDataComboBoxColumn>
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
    <asp:DetailsView ID="LokasiBAPDetailsView" runat="server" AutoGenerateRows="false"
        CssClass="dataprop" DataSourceID="LokasiBAPXpoDataSource" DataKeyNames="LokasiBAPID"
        GridLines="None">
        <Fields>
            <asp:TemplateField HeaderText="Nomer BAP : ">
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="nomerBAPASPxTextBox" runat="server" Width="170px" Text='<%# Bind("LokasiBAPNomor") %>'>
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="nomerBAPASPxTextBox" runat="server" Width="170px" Text='<%# Bind("LokasiBAPNomor") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="nomerBAPASPxLabel" runat="server" Text='<%# Eval("LokasiBAPNomor") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Pemeriksaan : ">
                <InsertItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalBAPASPxDateEdit" runat="server" Date='<%# Bind("LokasiBAPTanggal") %>'
                        DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalBAPASPxDateEdit" runat="server" Date='<%# Bind("LokasiBAPTanggal") %>'
                        DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="tanggalBAPASPxLabel" runat="server" Text='<%# Eval("LokasiBAPTanggal","{0:D}") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Catatan : ">
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="catatanASPxTextBox" runat="server" Text='<%# Bind("LokasiBAPCatatan") %>'
                        Width="300px">
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="catatanASPxTextBox" runat="server" Text='<%# Bind("LokasiBAPCatatan") %>'
                        Width="300px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="catatanASPxLabel" runat="server" Text='<%# Eval("LokasiBAPCatatan") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rekomendasi : ">
                <InsertItemTemplate>
                    <%--<dxe:ASPxTextBox ID="rekomendasiASPxTextBox" runat="server" Text='<%# Bind("LokasiBAPRekomendasi") %>'
                        Width="300px">
                    </dxe:ASPxTextBox>--%>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <%--<dxe:ASPxTextBox ID="rekomendasiASPxTextBox" runat="server" Text='<%# Bind("LokasiBAPRekomendasi") %>'
                        Width="300px">
                    </dxe:ASPxTextBox>--%>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxm:ASPxMenu ID="LokasiBAPDetailASPxMenu" runat="server">
                        <Items>
                            <dxm:MenuItem Text="New" Name="New">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Edit" Name="Edit">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Delete" Name="Delete">
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
                    <dxwgv:ASPxGridView ID="lokasiBAPDetailASPxGridView" runat="server" ClientInstanceName="detailGridView"
                        DataSourceID="LokasiBAPDetailXpoDataSource" KeyFieldName="LokasiBAPSaranID"
                        AutoGenerateColumns="False" Width="100%" OnRowInserting="lokasiBAPDetailASPxGridView_RowInserting">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="LokasiBAPSaranID" ReadOnly="True" Visible="False"
                                VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="LokasiBAPID!Key" Visible="False" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="TimTeknis" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Saran" VisibleIndex="1">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsEditing EditFormColumnCount="1" Mode="PopupEditForm" PopupEditFormModal="True"
                            PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter" />
                    </dxwgv:ASPxGridView>
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
