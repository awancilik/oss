<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="HOPembayaran.aspx.vb" Inherits="Utility_Izin_HO_HOPembayaran" Title="HO Pembayaran" %>

<%@ Reference VirtualPath="~/report/reportPage/HO/TandaBuktiPembayaran.aspx" %>
<%@ Reference VirtualPath="~/report/reportPage/HO/TandaBuktiBayarUlang.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="rekeningXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Rekening">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="HOUlangDataSource" runat="Server" TypeName="Bisnisobjek.OSS.HO"
        Criteria="[HOID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="HOID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="XpoDataSourceHO" runat="server" TypeName="Bisnisobjek.OSS.HO"
        Criteria="[HOID]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="HOID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <%-- <dx:XpoDataSource ID="TarifLingkunganXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.HOTarifLingkungan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IndeksLingkunganXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.HOIndeksLingkungan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="IndeksGangguanXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.HOIndeksGangguan">
    </dx:XpoDataSource>--%>
    <dxpc:ASPxPopupControl ID="ASPxPopupControlTidak" runat="server" PopupHorizontalAlign="windowCenter"
        PopupVerticalAlign="windowCenter" Modal="true" ClientInstanceName="RekPopup"
        HeaderText="Konfirmasi" Width="180px">
        <ContentCollection>
            <dxpc:PopupControlContentControl runat="Server" ID="ContentControlPopup">
                <center>
                    Maaf Nomor Permohonan Ini Sudah Dibuatkan Pembayaran
                    <dxe:ASPxButton ID="ASPxButton" runat="Server" Text="OK">
                        <ClientSideEvents Click="function(s,e){
                           RekPopup.HideWindow();
                    }" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="ASPxPopupControlSimpan" runat="server" ClientInstanceName="PopupPeringatanSimpan"
        Modal="true" HeaderText="Konfirmasi" PopupHorizontalAlign="windowCenter" PopupVerticalAlign="windowCenter"
        Width="180px">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="Server">
                <center>
                    Data Berhasil Disimpan!<br />
                    <br />
                    <dxe:ASPxButton ID="ASPxButton2" runat="Server" Text="OK" AutoPostBack="false">
                        <ClientSideEvents Click="function(s,e){
                     PopupPeringatanSimpan.HideWindow();
                    }" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="EmptyASPxPopup" runat="Server" ClientInstanceName="KosongPopup"
        Modal="true" HeaderText="Konfirmasi" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        Width="180px">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupKosong" runat="Server">
                <center>
                    <dxe:ASPxButton ID="OKButton" runat="Server" Text="OK">
                        <ClientSideEvents Click="function(s,e){
                            KosongPopup.HideWindow();
                        }" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <table>
        <tr>
            <td>
                Masukkan Nomor Permohonan :
            </td>
            <td>
                <dxe:ASPxTextBox ID="TxtNomorPermohonan" runat="Server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="ButtonNomorPermohonan" runat="Server" Text="Tampil">
                </dxe:ASPxButton>
            </td>
            &nbsp;
            <td>
                <dxe:ASPxButton ID="ButtonCetakTandaBukti" runat="Server" Text="Cetak Tanda Bukti Pembayaran">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
    <asp:DetailsView ID="HOPembayaranDetailsView" runat="server" DataSourceID="XpoDataSourceHO"
        DataKeyNames="HOID" CssClass="dataprop" AutoGenerateRows="false" DefaultMode="Edit">
        <Fields>
            <asp:TemplateField HeaderText="Retribusi : ">
                <InsertItemTemplate>
                    <dxe:ASPxComboBox ID="retASPxComboBox" runat="server" DataSourceID="XpoDataSourceHO"
                        TextField="Retribusi" ValueField="HOID" ValueType="System.String" DisplayFormatString="c2">
                    </dxe:ASPxComboBox>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxLabel ID="RetriLabel" runat="Server" Text='<%#Eval("LuasUsaha") %>'>
                    </dxe:ASPxLabel>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Pembayaran : ">
                <InsertItemTemplate>
                    <dxe:ASPxDateEdit ID="tglBayarASPxDate" runat="server" Date='<%# Bind("TglPembayaran") %>'
                        DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalPembayaranASPxDateEdit" runat="server" Date='<%# Bind("TglPembayaran") %>'
                        DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rekening : ">
                <%--<InsertItemTemplate>
                    <asp:HiddenField ID="rekeningHiddenField" runat="server" Value='<%# Bind("rek_id") %>' />
                    <dxe:ASPxComboBox ID="rekComboASPxComboBox" runat="Server" DataSourceID="rekeningXpoDataSource"
                        TextField="rekening" ValueField="rek_id" ValueType="System.String">
                    </dxe:ASPxComboBox>
                </InsertItemTemplate>--%>
                <EditItemTemplate>
                    <%-- <asp:HiddenField ID="rekeningHiddenField" runat="server" Value='<%# Bind("rek_id") %>' />--%>
                    <dxe:ASPxComboBox ID="rekeningASPxComboBox" runat="server" DataSourceID="rekeningXpoDataSource"
                        TextField="rekening" ValueField="rek_id" ValueType="System.String">
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField>
                <InsertItemTemplate>
                    <dxe:ASPxButton ID="simpanASPxButton" runat="Server" Text="Simpan" CommandName="Insert">
                    </dxe:ASPxButton>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <dxe:ASPxButton ID="updateASPxButton" runat="server" Text="Update" CommandName="Update">
                    </dxe:ASPxButton>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
        </Fields>
        <FieldHeaderStyle CssClass="headerfield" />
        <RowStyle CssClass="rowfield" />
    </asp:DetailsView>
    <asp:DetailsView ID="ReRegisDetailView" runat="Server" DataSourceID="HOUlangDataSource"
        DataKeyNames="HOID" AutoGenerateRows="False" CssClass="dataprop" DefaultMode="edit">
        <FieldHeaderStyle CssClass="headerfield" />
        <RowStyle CssClass="rowfield" />
        <Fields>
            <asp:TemplateField HeaderText="PEMBAYARAN DAFTAR ULANG">
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Retribusi">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="RetriUlangTxtBox" runat="Server" ReadOnly="true" DisplayFormatString="c0">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Pembayarana Daftar Ulang">
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalPembayaranASPxDateEdit" runat="server" Date='<%# Bind("TglBayarUlang") %>'
                        DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rekening : ">
                <EditItemTemplate>
                    <%-- <asp:HiddenField ID="rekeningHiddenField" runat="server" Value='<%# Bind("rek_id") %>' />--%>
                    <dxe:ASPxComboBox ID="rekeningASPxComboBox" runat="server" DataSourceID="rekeningXpoDataSource"
                        TextField="rekening" ValueField="rek_id" ValueType="System.String">
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    <dxe:ASPxButton ID="updateASPxButton" runat="server" Text="Update" CommandName="Update">
                    </dxe:ASPxButton>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <%--<asp:TemplateField>
                <ItemTemplate>
                    <dxe:ASPxButton ID="CetakButtonUlang" runat="Server" Text="Cetak Bukti Pembayaran HO"
                        OnClick="CetakButtonUlang_Click">
                    </dxe:ASPxButton>
                </ItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>--%>
        </Fields>
    </asp:DetailsView>
</asp:Content>
