<%@ Page Language="VB" MasterPageFile="~/MasterPage2.master" AutoEventWireup="false"
    CodeFile="MasterDataIMB.aspx.vb" Inherits="Utility_DataIzin_IMB" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <dx:XpoDataSource ID="IMBXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMB"
        Criteria="[Nama]!=''">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="PermohonanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Permohonan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KecamatanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kecamatan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KelurahanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kelurahan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="KabupatenXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Kabupaten">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="PropinsiXpoDataSource" runat="server" TypeName="BisnisObjek.OSS.Propinsi">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="TujuanXpoDataSource" runat="server" TypeName="BisnisObjek.OSS.IMBTujuan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="PelaksanaXpoDataSource" runat="server" TypeName="BisnisObjek.OSS.IMBpelaksana">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="StatusTanahXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.tanah">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="JenisXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.IMBbangunan">
    </dx:XpoDataSource>
    <dx:XpoDataSource ID="PerusahaanXpoDataSource" runat="server" TypeName="Bisnisobjek.OSS.Perusahaan">
    </dx:XpoDataSource>

    <script language="javascript" type="text/javascript">
function IMB(){
return IMBGridView.GetFocusedRowIndex();}
    </script>

    <b style="font-size: large">Izin Mendirikan Bangunan</b><br />
    <table>
        <tr>
            <td>
                No Permohonan Izin
            </td>
            <td>
                :</td>
            <td>
                <dxe:ASPxTextBox ID="CariTextBox" Width="100px" runat="server">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxButton ID="CariButton" runat="server" Text="Cari">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
    <br />
    <hr />
    <br />
    <dxm:ASPxMenu ID="ASPxMenu1" runat="server">
        <Items>
            <dxm:MenuItem Name="New" Text="New">
            </dxm:MenuItem>
            <dxm:MenuItem Name="Edit" Text="Edit">
            </dxm:MenuItem>
        </Items>
        <ClientSideEvents ItemClick="function(s, e){if (e.item.name=='Edit')
                {
                    IMBGridView.StartEditRow(IMB());
                }
                if (e.item.name='New')
                { IMBGridView.AddNewRow();
                }
}" />
    </dxm:ASPxMenu>
    <br />
    <dxwgv:ASPxGridView ID="IMBGridView" ClientInstanceName="IMBGridView" runat="server"
        DataSourceID="IMBXpoDataSource" KeyFieldName="IMBID" AutoGenerateColumns="False">
        <SettingsBehavior AllowFocusedRow="True" />
        <Columns>
            <dxwgv:GridViewDataTextColumn FieldName="IMBID" ReadOnly="True" VisibleIndex="0"
                Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="NoIjin" VisibleIndex="1" Width="140px">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataDateColumn FieldName="TglDikeluarkan" VisibleIndex="2" Visible="False"
                Width="140px">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataDateColumn>
            <dxwgv:GridViewDataDateColumn FieldName="TglBerakhir" VisibleIndex="3" Visible="False"
                Width="140px">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataDateColumn>
            <dxwgv:GridViewDataTextColumn FieldName="NoLama" VisibleIndex="4" Visible="False"
                Width="140px">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="permohonanID!Key" Caption="Nomor Permohonan"
                VisibleIndex="0" ReadOnly="True">
                <PropertiesComboBox DataSourceID="PermohonanXpoDataSource" ValueField="PermohonanID"
                    TextField="NomorPermohonan" ValueType="System.String">
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataTextColumn FieldName="NoKTP" VisibleIndex="6" Visible="False"
                Width="140px">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Nama" VisibleIndex="2" Width="140px">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Alamat" VisibleIndex="8" Visible="False"
                Width="140px">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="RT" VisibleIndex="9" Visible="False" Width="100px">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="RW" VisibleIndex="10" Visible="False" Width="100px">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="Kelurahan" VisibleIndex="11" Visible="False">
                <PropertiesComboBox DataSourceID="KelurahanXpoDataSource" ValueField="KelurahanID"
                    TextField="KelurahanNama" ValueType="System.String">
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="Kecamatan" VisibleIndex="12" Visible="False">
                <PropertiesComboBox DataSourceID="KecamatanXpoDataSource" ValueField="KecamatanID"
                    TextField="KecamatanNama" ValueType="System.String">
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="KabupatenID" VisibleIndex="13" Visible="False">
                <PropertiesComboBox DataSourceID="KabupatenXpoDataSource" ValueField="KabupatenID"
                    TextField="KabupatenNama" ValueType="System.String">
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataTextColumn FieldName="KodePos" VisibleIndex="14" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Telp" VisibleIndex="15" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Fax" VisibleIndex="16" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="TujuanID" VisibleIndex="17" Visible="False">
                <PropertiesComboBox DataSourceID="TujuanXpoDataSource" ValueField="TujuanID" TextField="TujuanIMB"
                    ValueType="System.String">
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="PelaksanaID" VisibleIndex="18" Visible="False">
                <PropertiesComboBox DataSourceID="PelaksanaXpoDataSource" ValueField="PelaksanaID"
                    TextField="Pelaksana" ValueType="System.String">
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataTextColumn FieldName="lksAlamat" VisibleIndex="3" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="lksRT" VisibleIndex="3" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="lksRW" VisibleIndex="3" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="lksKelurahanID" VisibleIndex="6" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="lksKodePos" VisibleIndex="6" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="NoSertifikat" VisibleIndex="6" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Luas" VisibleIndex="6" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="StatusTanahID" VisibleIndex="26" Visible="False">
                <PropertiesComboBox DataSourceID="StatusTanahXpoDataSource" ValueField="StatusTanahID"
                    TextField="StatusTanah" ValueType="System.String">
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataComboBoxColumn FieldName="JenisBangunanID" VisibleIndex="27" Visible="False">
                <PropertiesComboBox DataSourceID="JenisXpoDataSource" ValueField="JenisBangunanID"
                    TextField="JenisBangunan" ValueType="System.String">
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataComboBoxColumn>
            <dxwgv:GridViewDataTextColumn FieldName="NoPersil" VisibleIndex="6" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="PmlkTanah" VisibleIndex="6" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="PmlkSertifikat" VisibleIndex="6" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Tiang" VisibleIndex="6" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Usuk" VisibleIndex="6" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="RangkaKap" VisibleIndex="6" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Dinding" VisibleIndex="6" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Pondasi" VisibleIndex="6" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Reng" VisibleIndex="6" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Lantai" VisibleIndex="6" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="PenutupKap" VisibleIndex="6" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Jarak" VisibleIndex="6" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="NamaJalan" VisibleIndex="6" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="NomorSK" VisibleIndex="6" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="StartDate" VisibleIndex="3" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="EndDate" VisibleIndex="3" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="LuasBangunan" VisibleIndex="3" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="FungsiBangunan" VisibleIndex="3" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="GSP" VisibleIndex="3" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="GSB" VisibleIndex="3" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="KDB" VisibleIndex="3" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="NilaiBangunan" VisibleIndex="3" Visible="False">
                <EditFormSettings Visible="True" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="PerusahaanNama" VisibleIndex="3" Visible="False">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
    </dxwgv:ASPxGridView>
</asp:Content>
