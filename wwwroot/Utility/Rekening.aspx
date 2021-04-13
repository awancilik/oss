<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="Rekening.aspx.vb" Inherits="Utility_Rekening" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <dx:XpoDataSource ID="RekeningDataSource" runat="server" TypeName="Bisnisobjek.OSS.Rekening">
    </dx:XpoDataSource>

    <script language="javascript" type="text/javascript">
        function GridViewFocusedRow()
        {
            return RekeningGridView.GetFocusedRowIndex();
        }
    </script>
    
    <dxm:ASPxMenu ID="ASPxMenu" runat="server" ClientInstanceName="Menu">
        <ClientSideEvents ItemClick="function(s, e)
        {
            if (e.item.name=='New')
            {
                RekeningGridView.AddNewRow();
            }
            else
            {
                if (e.item.name=='Edit')
                {
                    RekeningGridView.StartEditRow(GridViewFocusedRow());
                }
                else
                {
                    if (e.item.name=='Delete')
                    {
                        RekeningGridView.DeleteRow(GridViewFocusedRow());
                    }
                }
            }
        }" />
        <Items>
            <dxm:MenuItem Text="Buat Baru" Name="New" />
            <dxm:MenuItem Text="Ubah" Name="Edit" />
            <dxm:MenuItem Text="Hapus" Name="Delete" />
        </Items>
    </dxm:ASPxMenu>
    
    <dxwgv:ASPxGridView ID="RekeningGridView" runat="server" ClientInstanceName="RekeningGridView" AutoGenerateColumns="False" DataSourceID="RekeningDataSource" KeyFieldName="rek_id" Width="75%">
        <Columns>
            <dxwgv:GridViewDataTextColumn FieldName="rek_id" ReadOnly="True" Visible="False"
                VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Nama Rekening" FieldName="rekening" VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="true" />
    </dxwgv:ASPxGridView>
</asp:Content>

