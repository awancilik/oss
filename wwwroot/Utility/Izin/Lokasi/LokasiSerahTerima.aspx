<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="LokasiSerahTerima.aspx.vb" Inherits="Utility_Izin_LokasiSerahTerima" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="permohonanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Permohonan"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID"></asp:SessionParameter>
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="LokasiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Lokasi" Criteria="[LokasiID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="LokasiID" />
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
        <h1>Serah Terima</h1>
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
    <br />
    <dxrp:ASPxRoundPanel ID="LokasiASPxRoundPanel" runat="server" HeaderText="Nomor Izin"
        Width="100%">
        <PanelCollection>
            <dxp:PanelContent runat="server">
                <asp:DetailsView ID="IzinDetailsView" runat="server" DataSourceID="LokasiXpoDataSource"
                    DataKeyNames="LokasiID" AutoGenerateRows="false" CssClass="dataprop" GridLines="None">
                    <Fields>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <dxe:ASPxButton ID="editASPxButton" runat="server" Text="Serah Terima Lokasi" CommandName="Edit">
                                </dxe:ASPxButton>
                            </ItemTemplate>
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
                            <ItemStyle CssClass="field" />
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Tanggal diterbitkan : ">
                            <ItemTemplate>
                                <dxe:ASPxLabel ID="noIzinTanggalASPxLabel" runat="server" Text='<%# Eval("TanggalTerbit","{0:D}") %>'>
                                </dxe:ASPxLabel>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <%--<dxe:ASPxDateEdit ID="noIzinTanggalASPxDateEdit" runat="server" Date='<%# Bind("TanggalTerbit") %>' DisplayFormatString="dd MMMM yyyy">
                                </dxe:ASPxDateEdit>--%>
                            </EditItemTemplate>
                            <ItemStyle CssClass="field" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Penerima : ">
                        <ItemTemplate>
                                <dxe:ASPxLabel ID="penerimaLokasiNamaASPxLabel" runat="server" Text='<%# Eval("PenerimaLokasiNama") %>'>
                                </dxe:ASPxLabel>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <dxe:ASPxTextBox ID="penerimaLokasiNamaASPxTextBox" runat="server" Width="170px" Text='<%# Bind("PenerimaLokasiNama") %>'>
                                </dxe:ASPxTextBox>
                            </EditItemTemplate>
                            <ItemStyle CssClass="field" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Alamat : ">
                        <ItemTemplate>
                                <dxe:ASPxLabel ID="penerimaLokasiAlamatASPxLabel" runat="server" Text='<%# Eval("PenerimaLokasiAlamat") %>'>
                                </dxe:ASPxLabel>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <dxe:ASPxTextBox ID="penerimaLokasiAlamatASPxTextBox" Width="170px" runat="server" Text='<%# Bind("PenerimaLokasiAlamat") %>'>
                                </dxe:ASPxTextBox>
                            </EditItemTemplate>
                            <ItemStyle CssClass="field" />
                        </asp:TemplateField>
                    </Fields>
                    <FieldHeaderStyle CssClass="headerfield" />
                    <RowStyle CssClass="rowfield" />
                </asp:DetailsView>
            </dxp:PanelContent>
        </PanelCollection>
    </dxrp:ASPxRoundPanel>
</asp:Content>

