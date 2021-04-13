<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="IPBPembayaran.aspx.vb" Inherits="Utility_Izin_IPBPembayaran" Title="IPB Pembayaran" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <script language="javascript" type="text/javascript">
        function GridViewFocusedRow()
        {
            return RetribusiGridView.GetFocusedRowIndex();
        }
    </script>

    <dx:XpoDataSource ID="RekeningDataSource" runat="server" TypeName="Bisnisobjek.OSS.Rekening">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="RetribusiListDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBRetribusi"
        Criteria="[imbid.IMBID] = ?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="imbid.IMBID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    <table>
        <tr>
           <h1>IPB Pembayaran</h1>
            <td>
                <dxe:ASPxLabel ID="ASPxLabel1" runat="server" Text="Masukkan Nomer Permohonan :"
                    Font-Bold="true" Font-Size="Large">
                </dxe:ASPxLabel>
            </td>
            <td>
                <dxe:ASPxTextBox ID="searchNomerPermohonanASPxTextBox" runat="server" Width="250px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="searchASPxButton" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <dxe:ASPxLabel ID="MessageLabel" runat="server" Text="" Font-Bold="True" Font-Size="X-Large">
                </dxe:ASPxLabel>
            </td>
        </tr>
    </table>
    <dxm:ASPxMenu ID="ASPxMenu" runat="server" ClientInstanceName="Menu" Paddings-PaddingTop="5px">
        <ClientSideEvents ItemClick="function(s, e)
        {
            if (e.item.name=='New')
            {
                RetribusiGridView.AddNewRow();
            }
            else
            {
                if (e.item.name=='Edit')
                {
                    RetribusiGridView.StartEditRow(GridViewFocusedRow());
                }
                else
                {
                    if (e.item.name=='Delete')
                    {
                        confirmPopup.ShowWindow();
                    }
                }
            }
        }" />
        <Items>
            <%--<dxm:MenuItem Text="New" Name="New" />--%>
            <dxm:MenuItem Text="Bayar" Name="Edit" />
            <%--<dxm:MenuItem Text="Delete" Name="Delete" />--%>
        </Items>
    </dxm:ASPxMenu>
    
    <dxwgv:ASPxGridView ID="RetribusiGridView" runat="server" ClientInstanceName="RetribusiGridView" AutoGenerateColumns="False" 
    DataSourceID="RetribusiListDataSource" KeyFieldName="Row_id" Width="100%">
        <Columns>
            <dxwgv:GridViewDataTextColumn FieldName="Row_id" ReadOnly="True" Visible="False"
                VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataDateColumn FieldName="TglPembayaran" Visible="False" VisibleIndex="0">
            </dxwgv:GridViewDataDateColumn>
            <dxwgv:GridViewDataDateColumn FieldName="TglPembayaranIPB" VisibleIndex="0">
            </dxwgv:GridViewDataDateColumn>
            <dxwgv:GridViewDataTextColumn FieldName="imbid!Key" Visible="False" VisibleIndex="1">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="rek_id" Visible="False" VisibleIndex="1">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Rekening IPB" FieldName="rek_ipb" VisibleIndex="1">
                <PropertiesComboBox DataSourceID="RekeningDataSource" TextField="rekening" ValueField="rekening"
                    ValueType="System.String">
                </PropertiesComboBox>
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Retribusi" Visible="False" VisibleIndex="2">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="PapanNama" Visible="False" VisibleIndex="3">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Leges" Visible="False" VisibleIndex="3">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataDateColumn FieldName="JatuhTempo" Visible="False" VisibleIndex="3">
            </dxwgv:GridViewDataDateColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Denda" Visible="False" VisibleIndex="3">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Terbilang" Visible="False" VisibleIndex="3">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Keterangan" Visible="False" VisibleIndex="3">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Daerah" Visible="False" VisibleIndex="3">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="KelasJalan" Visible="False" VisibleIndex="3">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="KelasBangunan" Visible="False" VisibleIndex="3">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="StatusBangunan" Visible="False" VisibleIndex="3">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="GunaBangunan" Visible="False" VisibleIndex="3">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="TingkatBangunan" Visible="False" VisibleIndex="3">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="LuasBangunan" Visible="False" VisibleIndex="3">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Retribusi IPB" FieldName="RIPB" UnboundExpression="(Retribusi * 50) / 100"
                UnboundType="Decimal" VisibleIndex="2">
                <EditFormSettings Visible="False" />
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" />
    </dxwgv:ASPxGridView>
</asp:Content>
