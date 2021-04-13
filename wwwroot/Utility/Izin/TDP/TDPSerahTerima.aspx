<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="TDPSerahTerima.aspx.vb" Inherits="Utility_Izin_TDP_TDPSerahTerima"
    Title="TDP Serah Terima" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="permohonanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Permohonan"
        Criteria="[PermohonanID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID"></asp:SessionParameter>
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="TDPXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.TDP"
        Criteria="[TDPID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="TDPID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="notFoundASPxPopupControl" runat="server" ClientInstanceName="notFoundPopup"
        HeaderText="Peringatan" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <center>
                    Data TDP tidak ditemukan
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
                Serah Terima</h1>
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
    <dxrp:ASPxRoundPanel ID="TDPASPxRoundPanel" runat="server" HeaderText="Nomor Izin"
        Width="100%">
        <PanelCollection>
            <dxp:PanelContent runat="server">
                <asp:DetailsView ID="IzinDetailsView" runat="server" DataSourceID="TDPXpoDataSource"
                    DataKeyNames="TDPID" AutoGenerateRows="false" CssClass="dataprop" GridLines="None">
                    <Fields>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <dxe:ASPxButton ID="editASPxButton" runat="server" Text="Serah Terima TDP" CommandName="Edit">
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
                        <asp:TemplateField HeaderText="Nomor Izin">
                            <ItemTemplate>
                                <dxe:ASPxLabel ID="noIzinASPxLabel" runat="server" Text='<%# Eval("NoIjin","{0:D}") %>'>
                                </dxe:ASPxLabel>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <%--<dxe:ASPxTextBox ID="noIzinASPxTextBox" runat="server" Width="170px" Text='<%# Bind("NoIjin") %>'>
                                </dxe:ASPxTextBox>--%>
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
                                <dxe:ASPxLabel ID="penerimaTDPNamaASPxLabel" runat="server" Text='<%# Eval("PenerimaTDPNama") %>'>
                                </dxe:ASPxLabel>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <dxe:ASPxTextBox ID="penerimaTDPNamaASPxTextBox" runat="server" Width="170px" Text='<%# Bind("PenerimaTDPNama") %>'>
                                </dxe:ASPxTextBox>
                            </EditItemTemplate>
                            <ItemStyle CssClass="field" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Alamat : ">
                            <ItemTemplate>
                                <dxe:ASPxLabel ID="penerimaTDPAlamatASPxLabel" runat="server" Text='<%# Eval("PenerimaTDPAlamat") %>'>
                                </dxe:ASPxLabel>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <dxe:ASPxTextBox ID="penerimaTDPAlamatASPxTextBox" Width="170px" runat="server"
                                    Text='<%# Bind("PenerimaTDPAlamat") %>'>
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
