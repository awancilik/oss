<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="MasterDataPenandatanganan.aspx.vb" Inherits="MasterData_MasterDataPenandatanganan"
    Title="Penanda Tangan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <script language="javascript" type="text/javascript">
function tanda(){
return PenandatangananGridView.GetFocusedRowIndex();
}
    </script>

    <dxpc:ASPxPopupControl Modal="true" ID="PenandatangananPopupControl" ClientInstanceName="PenandatangananPopupControl"
        runat="server" Width="393px" PopupHorizontalAlign="windowCenter" PopupVerticalAlign="WindowCenter">
        <ContentCollection>
            <dxpc:PopupControlContentControl runat="server">
                <center>
                    Apakah Anda Yakin akan menghapus Data Penandatanganan ini ?<br />
                    <dxm:ASPxMenu ID="Menu" runat="server">
                        <Items>
                            <dxm:MenuItem Name="Ya" Text="Ya">
                            </dxm:MenuItem>
                            <dxm:MenuItem Name="Tidak" Text="Tidak">
                            </dxm:MenuItem>
                        </Items>
                        <ClientSideEvents ItemClick="function(s, e) {
	if (e.item.name=='Ya')
            {
               PenandatangananGridView.DeleteRow(tanda());
				PenandatangananPopupControl.HideWindow();
            }
            else
            {
                if (e.item.name=='Tidak')
                {
                    PenandatangananPopupControl.HideWindow();
                }
               
           }
}" />
                    </dxm:ASPxMenu>
                </center>
            </dxpc:PopupControlContentControl>
        </ContentCollection>
    </dxpc:ASPxPopupControl>
    <dx:XpoDataSource ID="PenandatangananXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Penandatanganan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="JenisIzinXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.JenisIzin">
    </dx:XpoDataSource>
    <%--<table>
        <tr>
            <td>
                Daftar Berdasarkan Tanggal :
            </td>
            <td>
                <dxe:ASPxDateEdit ID="TglAwalDateEdit" runat="server">
                </dxe:ASPxDateEdit>
            </td>
            <td>
                Sampai :
            </td>
            <td>
                <dxe:ASPxDateEdit ID="TglAhkirDateEdit" runat="server">
                </dxe:ASPxDateEdit>
            </td>
            <td>
                <dxe:ASPxButton ID="CariTanggal" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>--%>
    <h1>Penandatangan</h1>
    <dxm:ASPxMenu ID="MenuItem" runat="server">
        <Items>
            <dxm:MenuItem Name="Edit" Text="Ubah">
            </dxm:MenuItem>
        </Items>
        <ClientSideEvents ItemClick="function(s, e) {
	if (e.item.name=='New')
            {
                PenandatangananGridView.AddNewRow();
            }
            else
            {
                if (e.item.name=='Edit')
                {
                    PenandatangananGridView.StartEditRow(tanda());
                }
                else
                {
                   if (e.item.name=='Delete')
                    {
                       PenandatangananPopupControl.ShowWindow();
                    }
                 }
            }
}" />
    </dxm:ASPxMenu>
    <dxwgv:ASPxGridView ID="PenandatangananGridView" Width="100%" runat="server" DataSourceID="PenandatangananXpoDataSource"
        ClientInstanceName="PenandatangananGridView" AutoGenerateColumns="False" KeyFieldName="PenandatangananID">
        <SettingsBehavior AllowFocusedRow="True"/>
        <Columns>
            <dxwgv:GridViewDataTextColumn FieldName="PenandatangananID" ReadOnly="True" Visible="False"
                VisibleIndex="0">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="JenisIzinID" Caption="Jenis Izin" VisibleIndex="0">
                <PropertiesComboBox DataSourceID="JenisIzinXpoDataSource" ValueField="JenisIzinID"
                    TextField="JenisIzinNama" ValueType="System.String">
                </PropertiesComboBox>
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Nama" VisibleIndex="1" Width="170px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Jabatan" VisibleIndex="2" Width="170px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="NIP" VisibleIndex="3" Width="170px">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <SettingsEditing PopupEditFormModal="true" Mode="popupEditForm" PopupEditFormHorizontalAlign="windowCenter"
         PopupEditFormVerticalAlign="windowCenter" PopupEditFormWidth="500px" />
    </dxwgv:ASPxGridView>
</asp:Content>
