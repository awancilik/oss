<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="MasterDataRekomendasiHOBap.aspx.vb" Inherits="MasterData_MasterDataRekomendasiHOBap"
    Title="Master Rekomendasi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="RekomendasiXpoDataSource" runat="Server" TypeName="Bisnisobjek.OSS.HORekomendasi">
    </dx:XpoDataSource>
    <dxm:ASPxMenu ID="MenuRekomendasi" runat="Server">
        <Items>
            <dxm:MenuItem Text="Tambah" Name="New">
            </dxm:MenuItem>
            <dxm:MenuItem Text="Ubah" Name="Edit">
            </dxm:MenuItem>
            <dxm:MenuItem Text="Hapus" Name="Delete">
            </dxm:MenuItem>
        </Items>
        <ClientSideEvents ItemClick="function(s,e){
            if(e.item.name=='New')
                {
                  GridRekom.AddNewRow();
                }
                 else
                    {
                      if(e.item.name=='Edit')
                          {
                            GridRekom.StartEditRow(GridRekom.GetFocusedRowIndex());
                          }
                         else
                            {
                             if(e.item.name=='Delete')
                                {
                                    GridRekom.DeleteRow(GridRekom.GetFocusedRowIndex());
                                }
                              }
                            }
                       }" />
    </dxm:ASPxMenu>
    <dxwgv:ASPxGridView ID="GridRekomendasi" runat="Server" DataSourceID="RekomendasiXpoDataSource"
        AutoGenerateColumns="False" KeyFieldName="HORekomendasiID" ClientInstanceName="GridRekom">
        <Columns>
            <dxwgv:GridViewDataTextColumn FieldName="HORekomendasiID" ReadOnly="True" Visible="False"
                VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Rekomendasi" VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" />
    </dxwgv:ASPxGridView>
</asp:Content>
