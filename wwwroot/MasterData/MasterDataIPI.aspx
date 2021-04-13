<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="MasterDataIPI.aspx.vb" Inherits="MasterData_MasterDataIPI" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="JenisModalXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IPIJenisModal">
    </dx:XpoDataSource>
    <dxm:ASPxMenu ID="MenuASPxMenu" runat="server">
        <Items>
            <dxm:MenuItem Text="Jenis Modal">
            </dxm:MenuItem>
        </Items>
    </dxm:ASPxMenu>
    <dxp:ASPxPanel ID="JenisModalASPxPanel" runat="server" Visible="false">
        <PanelCollection>
            <dxp:PanelContent runat="server">
                <dxm:ASPxMenu ID="JenisModalASPxMenu" runat="server">
                    <Items>
                        <dxm:MenuItem Text="New" Name="New">
                        </dxm:MenuItem>
                        <dxm:MenuItem Text="Edit" Name="Edit">
                        </dxm:MenuItem>
                        <dxm:MenuItem Text="Delete" Name="Delete">
                        </dxm:MenuItem>
                    </Items>
                    <ClientSideEvents ItemClick="function(s, e){
                        if(e.item.name=='New'){
                                JenisModalGridView.AddNewRow();
                            }
                            else {
                                if(e.item.name=='Edit'){
                                    JenisModalGridView.StartEditRow(JenisModalGridView.GetFocusedRowIndex());
                                }
                                else
                                    {
                                        JenisModalGridView.DeleteRow(JenisModalGridView.GetFocusedRowIndex());
                                    }
                            }
                    }" />
                </dxm:ASPxMenu>
                <dxwgv:ASPxGridView ID="JenisModalASPxGridView" runat="server" DataSourceID="JenisModalXpoDataSource"
                    AutoGenerateColumns="False" ClientInstanceName="JenisModalGridView" KeyFieldName="JenisModalID" Width="300px">
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="JenisModalID" ReadOnly="True" Visible="False"
                            VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="JenisModal" VisibleIndex="0" Width="170px">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="true" />
                </dxwgv:ASPxGridView>
            </dxp:PanelContent>
        </PanelCollection>
    </dxp:ASPxPanel>
</asp:Content>
