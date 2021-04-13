<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="MasterDataTDPStatusPerusahaan.aspx.vb" Inherits="MasterData_MasterDataTDPStatusPerusahaan"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="StatusPerusahaanXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.TDPStatusPerusahaan">
    </dx:XpoDataSource>
    <dxm:ASPxMenu ID="MenuStat" runat="Server">
        <Items>
            <dxm:MenuItem Text="Buat Baru" Name="New">
            </dxm:MenuItem>
            <dxm:MenuItem Text="Ubah" Name="Edit">
            </dxm:MenuItem>
            <dxm:MenuItem Text="Hapus" Name="Delete">
            </dxm:MenuItem>
        </Items>
        <ClientSideEvents ItemClick="function(s,e){
            if(e.item.name=='New')
                {
                    GridStatusPerusahaan.AddNewRow();
                }
               else
                    {
                      if(e.item.name=='Edit')
                        {
                            GridStatusPerusahaan.StartEditRow(GridStatusPerusahaan.GetFocusedRowIndex());
                        }
                       else
                           {
                            if(e.item.name=='Delete')
                                {
                                    GridStatusPerusahaan.DeleteRow(GridStatusPerusahaan.GetFocusedRowIndex());
                                }
                               }
                             }
                        }" />
    </dxm:ASPxMenu>
    <dxwgv:ASPxGridView ID="ASPxGridViewStatPerusahaan" runat="server" ClientInstanceName="GridStatusPerusahaan"
        DataSourceID="StatusPerusahaanXpoDataSource" KeyFieldName="StatusPerusahaanID" Width="180px">
        <Columns>
            <dxwgv:GridViewDataTextColumn FieldName="StatusPerusahaan" Caption="Status Perusahaan" Width="170px">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="true" />
    </dxwgv:ASPxGridView>
</asp:Content>
