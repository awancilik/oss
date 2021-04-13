<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="TDPPembayaran.aspx.vb" Inherits="Utility_Izin_TDP_TDPPembayaran"
    Title="TDP Pembayaran" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="TDPXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.TDP">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="RekeningXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Rekening">
    </dx:XpoDataSource>
    <div style="float: left">
        Masukan nomor Permohonan :
    </div>
    <div style="float: left">
        <dxe:ASPxTextBox ID="NoPermohonanASPxTextBox" runat="server" Width="170px">
        </dxe:ASPxTextBox>
    </div>
    <div style="float: left">
        <dxe:ASPxButton ID="CarASpxButton" runat="server" Text="Cari">
        </dxe:ASPxButton>
    </div>
    <dxpc:ASPxPopupControl ID="TidakDitemukanASPxPopupControl" runat="server" ClientInstanceName="TidakDitemukanPopupControl"
        PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter" Modal="true"
        HeaderText="Peringatan!">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <center>
                    Maaf, Nomor permohonan tidak ditemukan !
                    <br />
                    <dxe:ASPxButton ID="OKASPxButton" runat="server" ClientInstanceName="OKButton" Text="OK"
                        AutoPostBack="false">
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
                    <dxe:ASPxButton ID="ASPxButton1" runat="server" ClientInstanceName="OKButton" Text="OK"
                        AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e){TersimpanPopupControl.HideWindow();}" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <asp:DetailsView ID="TDPDetailView" runat="server" GridLines="none" CssClass="dataprop"
        AutoGenerateRows="false" Visible="false" DataSourceID="TDPXpoDataSource" DataKeyNames="TDPID">
        <RowStyle CssClass="rowfield" />
        <FieldHeaderStyle CssClass="headerfield" />
        <Fields>
            <asp:TemplateField HeaderText="Retribusi">
                <EditItemTemplate>
                    <dxe:ASPxLabel ID="RetribusiASPxLabel" runat="server" >
                    </dxe:ASPxLabel>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Pembayaran">
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="TglASPxDateEdit" runat="server" Date='<%#Bind("TglPembayaran") %>'
                        DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rekening">
                <ItemStyle CssClass="field" />
                <EditItemTemplate>
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
