<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="MasterDataTimTeknis.aspx.vb" Inherits="MasterData_MasterDataTimTeknis"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="TimTeknisXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.HOTimTeknis">
    </dx:XpoDataSource>
    <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
        DataSourceID="TimTeknisXpoDataSource" KeyFieldName="HOTimTeknisID" Width="100%">
        <Columns>
            <dxwgv:GridViewCommandColumn VisibleIndex="0">
                <DeleteButton Visible="True">
                </DeleteButton>
                <NewButton Visible="True">
                </NewButton>
                <EditButton Visible="True">
                </EditButton>
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn FieldName="HOTimTeknisID" ReadOnly="True" Visible="False"
                VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="TImTeknis" VisibleIndex="1" Width="250px">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
    </dxwgv:ASPxGridView>
    
</asp:Content>
