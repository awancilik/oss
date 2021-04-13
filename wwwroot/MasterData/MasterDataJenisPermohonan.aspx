<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="MasterDataJenisPermohonan.aspx.vb" Inherits="MasterData_MasterDataJenisPermohonan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<dx:XpoDataSource ID="masterDataJenisPermohonanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.MasterDataJenisPermohonan">
</dx:XpoDataSource>
<dxwgv:ASPxGridView ID="masterDataJenisPermohonanASPxGridView" runat="server" DataSourceID="masterDataJenisPermohonanXpoDataSource" KeyFieldName="MasterDataJenisPermohonanID" Width="100%" AutoGenerateColumns="False">
    <Columns>
        <dxwgv:GridViewCommandColumn VisibleIndex="0">
            <EditButton Visible="True">
            </EditButton>
            <NewButton Visible="True">
            </NewButton>
            <DeleteButton Visible="True">
            </DeleteButton>
        </dxwgv:GridViewCommandColumn>
        <dxwgv:GridViewDataTextColumn Caption="Jenis Permohonan" FieldName="MasterDataJenisPermohonanNama"
            VisibleIndex="1">
        </dxwgv:GridViewDataTextColumn>
    </Columns>
</dxwgv:ASPxGridView>
</asp:Content>

