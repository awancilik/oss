<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="IPIRetribusi.aspx.vb" Inherits="Utility_Izin_IPI_IPIRetribusi" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="IPIRetribusiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IPI"
        Criteria="[IPIID]=?">
        <CriteriaParameters>
            <asp:SessionParameter name="newparameter" sessionfield="IPIID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="RekeningXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Rekening">
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="TidakDitemukanASPxPopupControl" runat="server" ClientInstanceName="TidakDitemukanPopupControl"
        PopupVerticalAlign="WindowCenter" PopupHorizontalAlign="WindowCenter" Modal="true"
        HeaderText="Peringatan!">
        <ContentCollection>
            <dxpc:PopupControlContentControl runat="server">
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
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <center>
                    Data Telah Disimpan !
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
        </tr>
    </table>
    <asp:DetailsView ID="IPIRetribusiDetailsView" AutoGenerateRows="False" runat="server"
        DataSourceID="IPIRetribusiXpoDataSource" CssClass="dataprop" GridLines="None"
        DataKeyNames="IPIID" Visible="false">
        <RowStyle CssClass="rowfield" />
        <FieldHeaderStyle CssClass="headerfield" />
        <Fields>
            <asp:TemplateField HeaderText="Retribusi">
                <EditItemTemplate>
                    <dxe:ASPxTextBox ID="RetribusiASPxTextBox" runat="server" Width="170" Text='<%#Bind("Retribusi") %>'>
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
