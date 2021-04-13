<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="MasterDataJenisPerusahaan.aspx.vb" Inherits="MasterData_MasterDataJenisPerusahaan"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="PerusahaanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisPerusahaan">
    </dx:XpoDataSource>
    <dxwgv:ASPxGridView ID="PerusahaanASPxGridView" runat="server" DataSourceID="PerusahaanXpoDataSource" AutoGenerateColumns="False" KeyFieldName="JenisPerusahaanID">
        <Columns>
            <dxwgv:GridViewCommandColumn VisibleIndex="0">
                <DeleteButton Visible="True">
                </DeleteButton>
                <NewButton Visible="True">
                </NewButton>
                <EditButton Visible="True">
                </EditButton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn FieldName="JenisPerusahaanID" ReadOnly="True" Visible="False"
                VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Jenis Perusahaan" FieldName="JenisPerusahaan_"
                VisibleIndex="1">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
    </dxwgv:ASPxGridView>
</asp:Content>
