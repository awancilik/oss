<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="IPTBAP.aspx.vb" Inherits="Utility_Izin_IPTBAP" title="IPT BAP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<dx:XpoDataSource ID="permohonanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Permohonan"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID"></asp:SessionParameter>
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IPTPemeriksaanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IPTPemeriksaan"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IPTPemeriksaanDetailXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IPTPemeriksaanDetail"
        Criteria="[IPTPemeriksaanID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="IPTPemeriksaanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IPTBAPXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IPTBAP"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="timPemeriksaXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.TimPemeriksa">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IPTBAPDetailXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IPTBAPDetail">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="IPTBAPID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="ASPxPopupControlHapus" runat="Server" HeaderText="Peringtan" ClientInstanceName="PopupHapus" PopupHorizontalAlign="windowCenter" PopupVerticalAlign="windowCenter" Modal="true">
        <ContentCollection>
            <dxpc:PopupControlContentControl runat="server">
                <center>
                    Apakah Anda Yakin Menghapus Data Rekomendasi?<br />
                    <dxm:ASPxMenu ID="ASPxMenuConfirm" runat="server">
                        <Items>
                            <dxm:MenuItem Text="Ya" Name="Ya"></dxm:MenuItem>
                            <dxm:MenuItem Text="Tidak" Name="Tidak"></dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s,e){
		if(e.item.name=='Ya')
           {
              detailGridView.DeleteRow(detailGridView.GetFocusedRowIndex());
              PopupHapus.HideWindow();
           }
          else 
              {
                if(e.item.name=='Tidak')
                   {
                     PopupHapus.HideWindow();
                   }
               }
           }" />
                    </dxm:ASPxMenu>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="notFoundASPxPopupControl" runat="server" ClientInstanceName="notFoundPopup"
        HeaderText="Peringatan" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <center>
                    Data IPT tidak ditemukan
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
                IPT BAP</h1>
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
    <asp:DetailsView ID="IPTPemeriksaanDetailsView" runat="server" DataSourceID="IPTPemeriksaanXpoDataSource"
        DataKeyNames="IPTPemeriksaanID" CssClass="dataprop" GridLines="None" AutoGenerateRows="false">
        <Fields>
            <asp:TemplateField HeaderText="Nomor Pemeriksaan : ">
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="nomorPemeriksaanASPxTextBox" runat="server" Text='<%# Bind("IPTPemeriksaanNomor") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="nomorPemeriksaanASPxTextBox" runat="server" Text='<%# Bind("IPTPemeriksaanNomor") %>'
                        Width="170px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="nomorPemeriksaanASPxLabel" runat="server" Text='<%# Eval("IPTPemeriksaanNomor") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Pemeriksaan : ">
                <InsertItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalPemeriksaanASPxDateEdit" runat="server" Date='<%# Bind("IPTPemeriksaanTanggal") %>'
                        DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalPemeriksaanASPxDateEdit" runat="server" Date='<%# Bind("IPTPemeriksaanTanggal") %>'
                        DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="tanggalPemeriksaanASPxLabel" runat="server" Text='<%# Eval("IPTPemeriksaanTanggal","{0:D}") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tim Pemeriksa">
                <ItemTemplate>
                    <dxwgv:ASPxGridView ID="IPTPemeriksaanDetailASPxGridView" runat="server" ClientInstanceName="detailGridView"
                        DataSourceID="IPTPemeriksaanDetailXpoDataSource" KeyFieldName="IPTPemeriksaanDetailID"
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
    <asp:DetailsView ID="IPTBAPDetailsView" runat="server" AutoGenerateRows="false"
        CssClass="dataprop" DataSourceID="IPTBAPXpoDataSource" DataKeyNames="IPTBAPID"
        GridLines="None">
        <Fields>
            <asp:TemplateField HeaderText="Nomer BAP : ">
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="nomerBAPASPxTextBox" runat="server" Width="170px" Text='<%# Bind("IPTBAPNomor") %>'>
                    </dxe:ASPxTextBox>
                    <asp:HiddenField ID="IPTId" runat="Server" Value='<%#Bind ("IPTID") %>' />
                    <asp:HiddenField ID="PemeriksaanId" runat="Server" Value='<%#Bind ("IPTPemeriksaanID") %>' />
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="nomerBAPASPxTextBox" runat="server" Width="170px" Text='<%# Bind("IPTBAPNomor") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="nomerBAPASPxLabel" runat="server" Text='<%# Eval("IPTBAPNomor") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Pemeriksaan : ">
                <InsertItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalBAPASPxDateEdit" runat="server" Date='<%# Bind("IPTBAPTanggal") %>'
                        DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalBAPASPxDateEdit" runat="server" Date='<%# Bind("IPTBAPTanggal") %>'
                        DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="tanggalBAPASPxLabel" runat="server" Text='<%# Eval("IPTBAPTanggal","{0:D}") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rekomendasi : ">
                <ItemStyle CssClass="field" />
                <ItemTemplate>
                    <dxe:ASPxLabel ID="rekomendasiASPxLabel" runat="Server" Text='<%#Bind("IPTBAPRekomendasi") %>'>
                    </dxe:ASPxLabel>
               </ItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="rekomendasiASPxTextBox" runat="Server" Width="170px" Text='<%#Bind("IPTBAPRekomendasi") %>'>
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Catatan : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="catatanASPxLabel" runat="Server" Text='<%#Bind("IPTBAPCatatan") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <InsertItemTemplate>
                    <dxe:ASPxTextBox ID="catatanASPxTextBox" runat="server" Text='<%# Bind("IPTBAPCatatan") %>'
                        Width="300px">
                    </dxe:ASPxTextBox>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="catatanASPxTextBox" runat="server" Text='<%# Bind("IPTBAPCatatan") %>'
                        Width="300px">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
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

