<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="TDIPembayaran.aspx.vb" Inherits="Utility_Izin_TDI_TDIPembayaran" Title="TDI Pembayaran" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dxe:ASPxLabel ID="ASPxLabel" runat="server" Text="TDI Pembayaran Retribusi" Font-Size="XX-Large">
    </dxe:ASPxLabel>
    <br />
    <dx:XpoDataSource ID="tdiPembayaranXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.TDI"
        Criteria="[TDIID]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="newparameter" sessionfield="TDIID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="RekeningXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Rekening">
    </dx:XpoDataSource>
    <table>
        <tr>
            <td>
                Masukan Nomor Permohonan :
            </td>
            <td>
                <dxe:ASPxTextBox ID="NoPermohonanASpxTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="CariASPxButton" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
    <dxpc:ASPxPopupControl ID="TidakDitemukanASPxPopupControl" runat="server" ClientInstanceName="TidakDitemukanPopupControl"
        PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter" Modal="true"
        HeaderText="Peringatan!">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <center>
                    Maaf, Nomor permohonan tidak ditemukan !
                    <br />
                    <dxe:ASPxButton ID="OKASPxButton" runat="server" ClientInstanceName="OKButton" Text="OK" AutoPostBack="false">
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
                    <dxe:ASPxButton ID="ASPxButton1" runat="server" ClientInstanceName="OKButton" Text="OK" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e){TersimpanPopupControl.HideWindow();}" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <asp:DetailsView ID="tdiPembayaranDetailsView" AutoGenerateRows="False" runat="server"
        DataSourceID="tdiPembayaranXpoDataSource" CssClass="dataprop" GridLines="None"
        DataKeyNames="tdiID">
        <RowStyle CssClass="rowfield" />
        <FieldHeaderStyle CssClass="headerfield" />
        <Fields>
            <asp:TemplateField HeaderText="Retribusi">
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
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="TglPembayaranASPxDateEdit" runat="server" Date='<%#Bind("TglPembayaran") %>'
                        DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rekening">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
                    <%--<asp:HiddenField ID="rekeningHiddenField" runat="server" Value='<%# Bind("rek_id") %>' />--%>
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
                    <div style="float: left;">
                        <dxe:ASPxButton ID="CancelButton" Text="Cancel" runat="server" CommandName="Cancel">
                        </dxe:ASPxButton>
                    </div>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
</asp:Content>
