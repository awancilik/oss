<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false" CodeFile="LokasiPembayaran.aspx.vb" Inherits="Utility_Izin_LokasiPembayaran" %>
<%@ Reference VirtualPath="~/report/reportPage/Lokasi/SKRDLokasi.aspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <script language="javascript" type="text/javascript">
        function GridViewFocusedRow()
        {
            return RetribusiGridView.GetFocusedRowIndex();
        }
    </script>
    
    <dx:XpoDataSource ID="RekeningDataSource" runat="server" TypeName="Bisnisobjek.OSS.Rekening">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="RetribusiListDataSource" runat="server" TypeName="Bisnisobjek.OSS.LokasiRetribusi" Criteria="[LokasiID] = ?">
        <CriteriaParameters>
            <asp:SessionParameter Name="newparameter" SessionField="Lokasiid.LokasiID" />
        </CriteriaParameters>
    </dx:XpoDataSource>
    
    <table>
        <tr>
        <h1>Lokasi Pembayaran</h1>
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
            <td>
                <dxe:ASPxButton ID="SKRDButton" runat="server" Text="Cetak SKRD">
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

    
    <dxe:ASPxButton ID="BayarButton" runat="server" Text="Bayar" AutoPostBack="false">
    <ClientSideEvents Click="function(s, e){
    RetribusiGridView.StartEditRow(RetribusiGridView.GetFocusedRowIndex());
    }"/>
    </dxe:ASPxButton>                        
    <dxwgv:ASPxGridView ID="RetribusiGridView" runat="server" ClientInstanceName="RetribusiGridView" AutoGenerateColumns="False" 
    DataSourceID="RetribusiListDataSource" KeyFieldName="LokasiRetribusiID" Width="100%">
        <Columns>
            <dxwgv:GridViewDataTextColumn FieldName="LokasiRetribusiID" ReadOnly="True" Visible="False"
                VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="LokasiID!Key" Visible="False" VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Retribusi" VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataDateColumn FieldName="JatuhTempo" Visible="False" VisibleIndex="0">
            </dxwgv:GridViewDataDateColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Denda" VisibleIndex="1" Visible="False">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataDateColumn Caption="Tanggal Pembayaran" FieldName="TglPembayaran"
                Visible="True" VisibleIndex="0">
            </dxwgv:GridViewDataDateColumn>
            <dxwgv:GridViewDataComboBoxColumn Caption="Rekening" FieldName="rek_id" VisibleIndex="1"
                Width="50%" Visible="true">
                <PropertiesComboBox DataSourceID="RekeningDataSource" TextField="rekening" ValueField="rekening"
                    ValueType="System.String">
                </PropertiesComboBox>
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Terbilang" Visible="False" VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="HDPPTPeruntukan" Visible="False" VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="HDPPTJenis" Visible="False" VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="HDPPTHarga" Visible="False" VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="IP!Key" Visible="False" VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="IU!Key" Visible="False" VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Luas" Visible="False" VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" />
    </dxwgv:ASPxGridView>
    
</asp:Content>
