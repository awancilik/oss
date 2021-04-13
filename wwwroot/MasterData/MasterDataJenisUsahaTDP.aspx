<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="MasterDataJenisUsahaTDP.aspx.vb" Inherits="MasterData_MasterDataJenisUsahaTDP"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="XpoDataSourceJenisUsahaTDP" runat="server" TypeName="Bisnisobjek.OSS.TDPKegiatanUsaha">
    </dx:XpoDataSource>
    
    <dxm:ASPxMenu ID="MenuGridJenisKegiatanUsaha" runat="Server">
    </dxm:ASPxMenu>
</asp:Content>
