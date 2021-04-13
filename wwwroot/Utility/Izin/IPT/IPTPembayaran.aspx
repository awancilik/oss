<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="IPTPembayaran.aspx.vb" Inherits="Utility_Izin_IPT_IPTPembayaran" title="IPT Pembayaran" %>
<%@ Reference VirtualPath="~/report/reportPage/IPT/BuktiPembayaran.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<dx:XpoDataSource ID="IPTPembayaranXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IPT"
        Criteria="[IPTID]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="newparameter" sessionfield="IPTID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="RekeningXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Rekening">
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="TidakDitemukanASPxPopupControl" runat="server" ClientInstanceName="TidakDitemukanPopupControl"
        PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter" Modal="true"
        HeaderText="Peringatan!">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <center>
                    Maaf, Nomor permohonan tidak ditemukan !
                    <br />
                    <dxe:ASPxButton ID="OKASPxButton" runat="server" ClientInstanceName="OKButton" Text="OK">
                        <ClientSideEvents Click="function(s, e){TidakDitemukanPopupControl.HideWindow();}" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="TersimpanASPxPopupControl" runat="server" ClientInstanceName="TersimpanPopupControl"
        PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter" Modal="true"
        HeaderText="Peringatan!">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <center>
                    Data Telah Tersimpan !
                    <br />
                    <dxe:ASPxButton ID="ASPxButton1" runat="server" ClientInstanceName="OKButton" Text="OK">
                        <ClientSideEvents Click="function(s, e){TersimpanPopupControl.HideWindow();}" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <table>
        <tr>
            <td>
                Masukan nomor permohonan
            </td>
            <td>
                :</td>
            <td>
                <dxe:ASPxTextBox ID="noPermohonanASPxTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="CariASPxButton" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
            <td>
                <dxe:ASPxButton ID="CetakBtn" runat="Server" Text="Cetak Bukti Pembayaran" />
            </td>
        </tr>
    </table>
    <asp:DetailsView ID="IPTPembayaranDetailsView" AutoGenerateRows="False" runat="server" DataSourceID="IPTPembayaranXpoDataSource"
        CssClass="dataprop" GridLines="None" DataKeyNames="IPTID">
        <RowStyle CssClass="rowfield" />
        <FieldHeaderStyle CssClass="headerfield" />
        <Fields>
            <asp:TemplateField HeaderText="Retribusi">
                <%--<ItemTemplate>
                    <dxe:ASPxLabel ID="retriASPxLabel" runat="Server" Text='<%#Bind("Retribusi") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>--%>
                <EditItemTemplate>
                    <div style="float: left">
                        Rp.</div>
                    <div style="float: left">
                        <dxe:ASPxLabel ID="RetribusiASPxLabel" runat="server" Text='<%#Bind("Retribusi") %>'>
                        </dxe:ASPxLabel>
                    </div>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Pembayaran">
                <ItemStyle CssClass="field" />
             <%--   <ItemTemplate>
                    <dxe:ASPxLabel ID="tglbayarASPxLabel" runat="Server" Text='<%#Bind("TglPembayaran") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>--%>
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="TglPembayaranASPxDateEdit" runat="server" Date='<%#Bind("TglPembayaran") %>'
                        DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rekening">
                <ItemStyle CssClass="field" />
                <%--<ItemTemplate>
                    <dxe:ASPxLabel ID="rekASPxLabel" runat="Server" Text='<%#Bind("rek_id") %>'>
                    </dxe:ASPxLabel>
                </ItemTemplate>--%>
                <EditItemTemplate>
                    <asp:HiddenField ID="rekeningHiddenField" runat="server" Value='<%# Bind("rek_id") %>' />
                    <dxe:ASPxComboBox ID="RekeningASPxCombobox" runat="server" DataSourceID="RekeningXpoDataSource"
                        TextField="rekening" ValueField="rek_id">
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="updateASPxButton" runat="server" Text="Simpan" CommandName="Update">
                        </dxe:ASPxButton>
                    </div>
                   <%-- <div style="float: left;">
                        <dxe:ASPxButton ID="CancelButton" Text="Batal" runat="server" CommandName="Cancel">
                        </dxe:ASPxButton>
                    </div>--%>
                </EditItemTemplate>
                <%--<ItemTemplate>
                    <div style="float: left;">
                        <dxe:ASPxButton ID="EditButton" Text="Ubah" runat="server" CommandName="Edit">
                        </dxe:ASPxButton>
                    </div>
                </ItemTemplate>--%>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>

</asp:Content>

