<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="MasterDataSyarat.aspx.vb" Inherits="MasterData_MasterDataSyarat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="masterDataSyaratXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.MasterDataSyarat">
    </dx:XpoDataSource>
    <dxwgv:ASPxGridView ID="masterDataSyaratASPxGridView" runat="server" DataSourceID="masterDataSyaratXpoDataSource"
        KeyFieldName="MasterDataSyaratID" AutoGenerateColumns="False" Width="100%">
        <Columns>
            <dxwgv:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
                <NewButton Visible="True">
                </NewButton>
                <DeleteButton Visible="True">
                </DeleteButton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn Caption="Syarat" FieldName="MasterDataSyaratNama" VisibleIndex="1">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="true" />
    </dxwgv:ASPxGridView>
</asp:Content>
