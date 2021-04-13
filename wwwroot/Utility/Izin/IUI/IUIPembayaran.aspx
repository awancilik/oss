<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="IUIPembayaran.aspx.vb" Inherits="Utility_Izin_IUI_IUIPembayaran" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="iuiXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IUI"
        Criteria="[PermohonanID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="PermohonanID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="rekeningXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Rekening">
    </dx:XpoDataSource>
    <dxpc:ASPxPopupControl ID="notFoundASPxPopupControl" runat="server" ClientInstanceName="notFoundPopup"
        HeaderText="Peringatan" Modal="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
        <ContentCollection>
            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                <center>
                    Data IUI tidak ditemukan
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
        Pembayaran Retribusi IUI</h1>
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
                <dxe:ASPxButton ID="searchASPxButton" runat="server" Text="Tampil">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
    <br />
    <asp:DetailsView ID="iuiPembayaranDetailsView" runat="server" DataSourceID="iuiXpoDataSource"
        DataKeyNames="IUIID" CssClass="dataprop" AutoGenerateRows="false" DefaultMode="Edit">
        <Fields>
            <asp:TemplateField HeaderText="Retribusi : ">
                <EditItemTemplate>
                    <dxe:ASPxLabel ID="retribusiASPxTextBox" runat="server" Text='<%# Eval("Retribusi") %>'>
                    </dxe:ASPxLabel>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tanggal Pembayaran : ">
                <EditItemTemplate>
                    <dxe:ASPxDateEdit ID="tanggalPembayaranASPxDateEdit" runat="server" Date='<%# Bind("TglPembayaran") %>'
                        DisplayFormatString="dd MMMM yyyy">
                    </dxe:ASPxDateEdit>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rekening : ">
                <EditItemTemplate>
                    <asp:HiddenField ID="rekeningHiddenField" runat="server" Value='<%# Bind("rek_id") %>' />
                    <dxe:ASPxComboBox ID="rekeningASPxComboBox" runat="server" DataSourceID="rekeningXpoDataSource"
                        TextField="rekening" ValueField="rek_id" ValueType="System.String">
                    </dxe:ASPxComboBox>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
            <asp:TemplateField>
                <EditItemTemplate>
                    <dxe:ASPxButton ID="updateASPxButton" runat="server" Text="Simpan" CommandName="Update">
                    </dxe:ASPxButton>
                </EditItemTemplate>
                <ItemStyle CssClass="field" />
            </asp:TemplateField>
        </Fields>
        <FieldHeaderStyle CssClass="headerfield" />
        <RowStyle CssClass="rowfield" />
    </asp:DetailsView>
</asp:Content>
