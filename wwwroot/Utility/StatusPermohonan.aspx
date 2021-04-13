<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="StatusPermohonan.aspx.vb" Inherits="Utility_StatusPermohonan" Title="Status Permohonan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="permohonanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Permohonan"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="permohonanDetailXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.PermohonanDetail"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <table>
        <tr>
            <h1>
                Status Permohonan</h1>
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
            <asp:TemplateField HeaderText="No. KTP Pemohon : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="nikPemohonASPxLabel" runat="server" Text='<%# Eval("PemohonNIK") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nama Pemohon : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="namaPemohonASPxLabel" runat="server" Text='<%# Eval("PemohonNama") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Permohonan : ">
                <ItemTemplate>
                    <dxe:ASPxLabel ID="tanggalPermohonanASPxLabel" runat="server" Text='<%# Eval("TanggalPermohonan","{0:D}") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <dxm:ASPxMenu ID="detailASPxMenu" runat="server">
                        <Items>
                            <dxm:MenuItem Text="Edit" Name="Edit">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e)
                {
                    detailGridView.StartEditRow(detailGridView.GetFocusedRowIndex());
                }" />
                    </dxm:ASPxMenu>
                    <dxwgv:ASPxGridView ID="permohonanDetailASPxGridView" runat="server" ClientInstanceName="detailGridView"
                        DataSourceID="permohonanDetailXpoDataSource" KeyFieldName="PermohonanDetailID"
                        OnRowUpdating="updatestatusASPxGridView_RowUpdating" AutoGenerateColumns="False"
                        Width="100%">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Jenis Izin" FieldName="JenisIzinID.JenisIzinNama"
                                ReadOnly="true" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Jenis Permohonan" FieldName="JenisPermohonanIzinID.MasterDataJenisPermohonanID.MasterDataJenisPermohonanNama"
                                ReadOnly="true" VisibleIndex="1">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn Caption="Status Permohonan" FieldName="StatusPermohonan"
                                VisibleIndex="2">
                                <PropertiesComboBox ValueType="System.String">
                                    <Items>
                                        <dxe:ListEditItem Text="DITERIMA" Value="DITERIMA">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Text="TIDAK DITERIMA" Value="TIDAK DITERIMA">
                                        </dxe:ListEditItem>
                                    </Items>
                                </PropertiesComboBox>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataColumn Caption="Nomor Izin" FieldName="NoIzin">
                                <EditItemTemplate>
                                    <dxe:ASPxTextBox ID="noIzin" runat="server" Width="170px" Text='<%#Eval("NoIzin") %>'>
                                    </dxe:ASPxTextBox>
                                </EditItemTemplate>
                            </dxwgv:GridViewDataColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="true" />
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormModal="true" EditFormColumnCount="1"
                            PopupEditFormWidth="300px" PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormVerticalAlign="WindowCenter" />
                    </dxwgv:ASPxGridView>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
        </Fields>
        <FieldHeaderStyle CssClass="headerfield" />
        <RowStyle CssClass="rowfield" />
    </asp:DetailsView>
</asp:Content>
