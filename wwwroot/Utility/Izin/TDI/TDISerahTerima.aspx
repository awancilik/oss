<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="TDISerahTerima.aspx.vb" Inherits="Utility_Izin_TDI_TDISerahTerima" title="TDI Serah Terima" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="permohonanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Permohonan"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID"></asp:SessionParameter>
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="tdiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.TDI"
        Criteria="[TDIID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="tdiID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="notFoundASPxPopupControl" runat="server" ClientInstanceName="notFoundPopup"
        HeaderText="Peringatan" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <center>
                    Data tdi tidak ditemukan
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
        Serah Terima TDI</h1>
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
    <br />
    <dxrp:ASPxRoundPanel ID="tdiASPxRoundPanel" runat="server" HeaderText="Nomor Izin"
        Width="100%" Visible="false">
        <PanelCollection>
            <dxp:PanelContent runat="server">
                <asp:DetailsView ID="IzinDetailsView" runat="server" DataSourceID="tdiXpoDataSource"
                    DataKeyNames="TDIID" AutoGenerateRows="false" CssClass="dataprop" GridLines="None">
                    <Fields>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <dxe:ASPxButton ID="editASPxButton" runat="server" Text="Serah Terima TDI" CommandName="Edit">
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
                        <asp:TemplateField HeaderText="Nomor Izin tdi :">
                            <ItemStyle CssClass="field" />
                            <EditItemTemplate>
                                <%--<dxe:ASPxTextBox ID="NoIzintdiASPxTextBox" runat="server" Width="170px" Text='<%#Bind("NoIzin") %>'>
                                </dxe:ASPxTextBox>--%>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <dxe:ASPxLabel ID="NoIzinASPxLabel" runat="server" Text='<%#Bind("NoIzin") %>'>
                                </dxe:ASPxLabel>
                            </ItemTemplate>
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
                                <dxe:ASPxLabel ID="penerimatdiNamaASPxLabel" runat="server" Text='<%# Eval("PenerimaTDINama") %>'>
                                </dxe:ASPxLabel>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <dxe:ASPxTextBox ID="penerimatdiNamaASPxTextBox" runat="server" Width="170px" Text='<%# Bind("PenerimaTDINama") %>'>
                                </dxe:ASPxTextBox>
                            </EditItemTemplate>
                            <ItemStyle CssClass="field" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Alamat : ">
                            <ItemTemplate>
                                <dxe:ASPxLabel ID="penerimatdiAlamatASPxLabel" runat="server" Text='<%# Eval("PenerimaTDIAlamat") %>'>
                                </dxe:ASPxLabel>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <dxe:ASPxTextBox ID="penerimatdiAlamatASPxTextBox" Width="170px" runat="server" Text='<%# Bind("PenerimaTDIAlamat") %>'>
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

