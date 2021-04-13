<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="IPTSerahTerima.aspx.vb" Inherits="Utility_Izin_IPT_IPTSerahTerima" title="IPT Serah Terima" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   <dx:XpoDataSource ID="permohonanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Permohonan"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID"></asp:SessionParameter>
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IPTXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IPT"
        Criteria="[IPTID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="IPTID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="ASPxPopupControlnotfound" runat="server" HeaderText="Peringatan" PopupHorizontalAlign="windowCenter" PopupVerticalAlign="windowCenter" Modal="true" ClientInstanceName="PopupNotFound">
    <ContentCollection>
        <dxpc:PopupControlContentControl ID="PopupNotFound" runat="server">
            <center>
                Data IPT Tidak Ditemukan
            <dxe:ASPxButton ID="ButtonKeluar" runat="Server" Text="Tutup">
            <ClientSideEvents Click="function(s,e){
            PopupNotFound.HideWindow();
             }"/>
            </dxe:ASPxButton>
            </center>
          </dxpc:PopupControlContentControl>
    </ContentCollection>
    </dxpc:ASPxPopupControl>
    <h1>
        Serah Terima</h1>
    <table>
        <tr>
            <td>
                Masukkan Nomer Permohonan :
            </td>
            <td>
                <dxe:ASPxTextBox ID="cariNomerPermohonanASPxTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="cariASPxButton" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
    <asp:DetailsView ID="ASPDetailViewSerahTerima" runat="Server" DataSourceID="permohonanXpoDataSource" DataKeyNames="PermohonanID" CssClass="dataprop" GridLines="None" AutoGenerateRows="false">
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
    <dxrp:ASPxRoundPanel ID="IPTASPxRoundPanel" runat="server" HeaderText="Nomor Izin"
        Width="100%">
        <PanelCollection>
            <dxp:PanelContent runat="server">
                <asp:DetailsView ID="IzinDetailsView" runat="server" DataSourceID="IPTXpoDataSource"
                    DataKeyNames="IPTID" AutoGenerateRows="false" CssClass="dataprop" GridLines="None">
                    <Fields>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <dxe:ASPxButton ID="editASPxButton" runat="server" Text="Serah Terima IPT" CommandName="Edit">
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
                        <asp:TemplateField HeaderText="No Izin">
                            <ItemTemplate>
                                <dxe:ASPxLabel ID="NoIzinASPxLabel" runat="Server" Text='<%# Eval("NoIzin") %>'>
                                </dxe:ASPxLabel>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <dxe:ASPxTextBox ID="NoIzinASPxTextBox" runat="server" width="170px" Text='<%#Bind("NoIzin") %>'>
                                </dxe:ASPxTextBox>
                            </EditItemTemplate>
                            <ItemStyle CssClass="field" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tanggal diterbitkan : ">
                            <ItemTemplate>
                                <dxe:ASPxLabel ID="noIzinTanggalASPxLabel" runat="server" Text='<%# Eval("TglDikeluarkan","{0:D}") %>'>
                                </dxe:ASPxLabel>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <dxe:ASPxDateEdit ID="noIzinTanggalASPxDateEdit" runat="server" Date='<%# Bind("TglDikeluarkan") %>'
                                    DisplayFormatString="dd MMMM yyyy">
                                </dxe:ASPxDateEdit>
                            </EditItemTemplate>
                            <ItemStyle CssClass="field" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Penerima : ">
                            <ItemTemplate>
                                <dxe:ASPxLabel ID="penerimaIPTNamaASPxLabel" runat="server" Text='<%# Eval("PenerimaIPTNama") %>'>
                                </dxe:ASPxLabel>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <dxe:ASPxTextBox ID="penerimaIPTNamaASPxTextBox" runat="server" Width="170px" Text='<%# Bind("PenerimaIPTNama") %>'>
                                </dxe:ASPxTextBox>
                            </EditItemTemplate>
                            <ItemStyle CssClass="field" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Alamat : ">
                            <ItemTemplate>
                                <dxe:ASPxLabel ID="penerimaIPTAlamatASPxLabel" runat="server" Text='<%# Eval("PenerimaIPTAlamat") %>'>
                                </dxe:ASPxLabel>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <dxe:ASPxTextBox ID="penerimaIPTAlamatASPxTextBox" Width="170px" runat="server" Text='<%# Bind("PenerimaIPTAlamat") %>'>
                                </dxe:ASPxTextBox>
                            </EditItemTemplate>
                            <ItemStyle CssClass="field" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tanggal Serah Terima">
                            <ItemTemplate>
                                <dxe:ASPxLabel ID="serahTerimaTanggal" runat="server" Text='<%#Bind("TglSerahTerima","{0:D}") %>'>
                                </dxe:ASPxLabel>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <dxe:ASPxDateEdit ID="serahTerimaASPxDateEdit" runat="Server" Width="170px" Date='<%#Bind("TglSerahTerima") %>'
                                    DisplayFormatString="dd MMMM yyyy">
                                </dxe:ASPxDateEdit>
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

