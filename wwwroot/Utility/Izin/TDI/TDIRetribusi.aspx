<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="TDIRetribusi.aspx.vb" Inherits="Utility_Izin_TDI_TDIRetribusi" Title="TDI Retribusi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="RetribusiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.TDI"
        Criteria="[TDIID]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="newparameter" sessionfield="TDIID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <table>
        <tr>
            <td>
                Masukan nomor permohonan :</td>
            <td>
                <dxe:ASPxTextBox ID="NoPermohonanASPxTextBox" runat="server" Width="170px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="CariASPxButton" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
    <dxpc:ASPxPopupControl ID="TersimpanASPxPopupControl" runat="server" ClientInstanceName="TersimpanPopupControl"
        Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        HeaderText="Tersimpan">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <center>
                    Data Telah Tersimpan !
                    <br />
                    <dxe:ASPxButton ID="TersimpanASPxButton" runat="server" Text="OK" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e){TersimpanPopupControl.HideWindow();}" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dxpc:ASPxPopupControl ID="TidakDitemukanASPxPopupControl" runat="server" ClientInstanceName="TidakDitemukanPopupControl"
        Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
        HeaderText="Not Found !">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl2" runat="server">
                <center>
                    Data tidak Ditemukan !
                    <br />
                    <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="OK" AutoPostBack="false">
                        <ClientSideEvents Click="function(s, e){TidakDitemukanPopupControl.HideWindow();}" />
                    </dxe:ASPxButton>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <asp:DetailsView ID="tdiRetribusiDetailsView" AutoGenerateRows="False" runat="server"
        DataSourceID="RetribusiXpoDataSource" CssClass="dataprop" GridLines="None" DataKeyNames="TDIID"
        Visible="false">
        <RowStyle CssClass="rowfield" />
        <FieldHeaderStyle CssClass="headerfield" />
        <Fields>
            <asp:TemplateField HeaderText="Retribusi">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="RetribusiASPxTextBox" runat="server" Width="170" Text='<%#Bind("Retribusi") %>'
                        NullText="Rp">
                    </dxe:ASPxTextBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemStyle CssClass="field" />
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
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
</asp:Content>
