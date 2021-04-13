<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="MasterDataTarifHO.aspx.vb" Inherits="MasterData_MasterDataTarifHO"
    Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="XpoDataSourceTarifHO" runat="server" TypeName="Bisnisobjek.OSS.HOTaripLingkungan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="XpoDataSourceJenisLingkunganHO" runat="Server" TypeName="Bisnisobjek.OSS.HOJenisLingkungan"
        Criteria="[HOTaripJenisID!Key]=?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="HOTaripLingkunganID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <%-- 
    <dx:XpoDataSource ID="XpoDataSourceIndeksLokasi" runat="server" TypeName="Bisnisobjek.OSS.MasterDataHOIndeksLokasi">
    </dx:XpoDataSource>--%>
    <dxm:ASPxMenu ID="ASPxMenuTarifHO" runat="Server">
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
                    GridTarif.AddNewRow();
                }
                else
                    {
                      if(e.item.name=='Edit')
                        {
                            GridTarif.StartEditRow(GridTarif.GetFocusedRowIndex());
                        }
                        else
                            {
                             if(e.item.name=='Delete')
                                {
                                    GridTarif.DeleteRow(GridTarif.GetFocusedRowIndex());
                                }
                            }
                    }
        }" />
    </dxm:ASPxMenu>
    <dxwgv:ASPxGridView ID="GridViewTaripLingkunganHO" runat="Server" ClientInstanceName="GridTarif"
        DataSourceID="XpoDataSourceTarifHO" KeyFieldName="HOTaripLingkunganID" AutoGenerateColumns="false"
        OnDetailRowExpandedChanged="GridViewTaripLingkunganHO_DetailRowExpandedChanged">
        <Templates>
            <DetailRow>
                <dxm:ASPxMenu ID="MenuJenisLingkungan" runat="Server">
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
                    GridViewJL.AddNewRow();
                }
                else
                    {
                      if(e.item.name=='Edit')
                        {
                            GridViewJL.StartEditRow(GridViewJL.GetFocusedRowIndex());
                        }
                        else
                            {
                             if(e.item.name=='Delete')
                                {
                                    GridViewJL.DeleteRow(GridViewJL.GetFocusedRowIndex());
                                }
                            }
                    }
        }" />
                </dxm:ASPxMenu>
                <dxwgv:ASPxGridView ID="GridViewJenisLingkungan" runat="Server" ClientInstanceName="GridViewJL"
                    DataSourceID="XpoDataSourceJenisLingkunganHO" KeyFieldName="HOJenisLingkunganID"
                    AutoGenerateColumns="False" OnRowInserting="GridViewJenisLingkungan_RowInserting">
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="HOTaripJenisID!Key" Visible="False" VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Jenis Lingkungan" FieldName="JenisLingkungan"
                            VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Tarif" FieldName="Tarif" VisibleIndex="1">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsEditing Mode="PopupEditForm" PopupEditFormModal="true" PopupEditFormVerticalAlign="windowCenter"
                        PopupEditFormHorizontalAlign="windowCenter" PopupEditFormWidth="400px" />
                    <SettingsBehavior AllowFocusedRow="True" />
                </dxwgv:ASPxGridView>
            </DetailRow>
        </Templates>
        <Columns>
            <dxwgv:GridViewDataTextColumn Caption="HOTaripLingkunganID" Visible="false">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Jenis Tarif Lingkungan" FieldName="JenisTaripLingkungan"
                VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />
    </dxwgv:ASPxGridView>
</asp:Content>
