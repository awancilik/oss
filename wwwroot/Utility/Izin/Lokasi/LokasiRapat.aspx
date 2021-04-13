<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="LokasiRapat.aspx.vb" Inherits="Utility_Izin_LokasiRapat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="permohonanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Permohonan"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID"></asp:SessionParameter>
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="LokasiRapatXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.LokasiRapat"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="LokasiRapatDetailXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.LokasiRapatDetail"
        Criteria="[LokasiRapatID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="LokasiRapatID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="XpoDataSource1" runat="server" TypeName="Bisnisobjek.OSS.LokasiRapat"
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
    <h1>
        Lokasi Rapat</h1>
    &nbsp;
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
    <asp:DetailsView ID="LokasiRapatDetailsView" runat="server" DataSourceID="LokasiRapatXpoDataSource"
        DataKeyNames="LokasiRapatID" CssClass="dataprop" GridLines="None" AutoGenerateRows="False">
        <Fields>
            <asp:TemplateField HeaderText="Tanggal Rapat">
                <InsertItemTemplate>
                    <dxcb:ASPxCallback ID="TanggalCallback" runat="server" ClientInstanceName="TanggalCallback"
                        OnCallback="TanggalCallback_Callback">
                    </dxcb:ASPxCallback>
                    <dxe:ASPxDateEdit ID="TanggalDateEdit" runat="server" ClientInstanceName="TanggalDateEdit" DisplayFormatString="dd MMMM yyyy">
                        <ClientSideEvents DateChanged="function(s, e)
                    {
                    TanggalCallback.PerformCallback(TanggalDateEdit.GetText());
                    }" />
                    </dxe:ASPxDateEdit>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxcb:ASPxCallback ID="TanggalCallback" runat="server" ClientInstanceName="TanggalCallback"
                        OnCallback="TanggalCallback_Callback">
                    </dxcb:ASPxCallback>
                    <dxe:ASPxDateEdit ID="TanggalDateEdit" runat="server" ClientInstanceName="TanggalDateEdit" DisplayFormatString="dd MMMM yyyy">
                        <ClientSideEvents DateChanged="function(s, e)
                    {
                    TanggalCallback.PerformCallback(TanggalDateEdit.GetText());
                    }" />
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxe:ASPxLabel ID="TanggalLabel" runat="server" Text='<%#Bind ("LokasiRapatTanggal","{0:D}")%>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tim Rapat">
                <InsertItemTemplate>
                </InsertItemTemplate>
                <EditItemTemplate>
                </EditItemTemplate>
                <ItemTemplate>
                    <dxm:ASPxMenu ID="imbRapatDetailASPxMenu" runat="server">
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
                    <dxwgv:ASPxGridView ID="lokasiRapatDetailASPxGridView" runat="server" ClientInstanceName="detailGridView"
                        DataSourceID="lokasiRapatDetailXpoDataSource" KeyFieldName="LokasiRapatDetailID"
                        AutoGenerateColumns="false" Width="100%" OnRowInserting="lokasiRapatDetailASPxGridView_RowInserting">
                        <Columns>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Tim Rapat" FieldName="TimRapatID!Key"
                                VisibleIndex="0">
                                <PropertiesComboBox DataSourceID="timPemeriksaXpoDataSource" TextField="TimPemeriksaNama"
                                    ValueField="TimPemeriksaID" ValueType="System.String">
                                </PropertiesComboBox>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Instansi" FieldName="TimRapatID!Key">
                                <EditFormSettings Visible="False" />
                                <PropertiesComboBox DataSourceID="timPemeriksaXpoDataSource" TextField="TimPemeriksaInstansi"
                                    ValueField="TimPemeriksaID" ValueType="System.String">
                                </PropertiesComboBox>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="NIP" FieldName="TimRapatID!Key">
                                <EditFormSettings Visible="False" />
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
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <%--<div style="float: left">
                        <dxe:ASPxButton ID="NewButton" Text="New" runat="server" CommandName="New">
                        </dxe:ASPxButton>
                    </div>--%>
                    <div style="float: left">
                        <dxe:ASPxButton ID="EditButton" Text="Edit" runat="server" CommandName="Edit">
                        </dxe:ASPxButton>
                    </div>
                </ItemTemplate>
                <InsertItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="SaveButton" Text="Save" runat="server" CommandName="Insert">
                        </dxe:ASPxButton>
                    </div>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="CancelButton" Text="Cancel" runat="server" CommandName="Cancel">
                        </dxe:ASPxButton>
                    </div>
                </InsertItemTemplate>
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
        <RowStyle CssClass="rowfield" />
        <FieldHeaderStyle CssClass="headerfield" />
    </asp:DetailsView>
    <br />
    <br />
</asp:Content>
