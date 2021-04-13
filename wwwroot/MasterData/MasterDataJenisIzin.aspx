<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="MasterDataJenisIzin.aspx.vb" Inherits="MasterData_MasterDataJenisIzin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="jenisIzinXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisIzin">
    </dx:XpoDataSource>
    <dxwgv:ASPxGridView ID="jenisIzinASPxGridView" runat="server" DataSourceID="jenisIzinXpoDataSource"
        KeyFieldName="JenisIzinID" AutoGenerateColumns="False" Width="100%">
        <Columns>
            <dxwgv:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
                <NewButton Visible="True">
                </NewButton>
                <DeleteButton Visible="True">
                </DeleteButton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn Caption="Nama Jenis Izin" FieldName="JenisIzinNama"
                VisibleIndex="1">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Nama Lengkap Jenis Izin" FieldName="JenisIzinNamaLengkap"
                VisibleIndex="2">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
    </dxwgv:ASPxGridView>
</asp:Content>
